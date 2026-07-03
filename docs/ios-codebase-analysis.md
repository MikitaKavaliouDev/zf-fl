# iOS ZIRO.FIT Codebase Analysis — Full Audit & Flutter Porting Strategy

> **Generated**: 2026-07-01
> **Source**: `V:\Ziro-Fit` (Swift/SwiftUI iOS app)
> **Purpose**: Complete codebase analysis for porting to Flutter (`V:\zf-fl`)

---

## Table of Contents

1. [iOS Codebase Overview](#1-ios-codebase-overview)
2. [App Shell & Navigation Architecture](#2-app-shell--navigation-architecture)
3. [Trainer Auth Flow — Complete State Machine](#3-trainer-auth-flow--complete-state-machine)
4. [Trainer Tab Structure & All Screens](#4-trainer-tab-structure--all-screens)
5. [Shared UI Component Library](#5-shared-ui-component-library)
6. [Design System](#6-design-system)
7. [State Management & Data Flow](#7-state-management--data-flow)
8. [API & Networking Layer](#8-api--networking-layer)
9. [Workout System Deep Dive](#9-workout-system-deep-dive)
10. [Flutter Porting Strategy](#10-flutter-porting-strategy)
11. [Implementation Priority Matrix](#11-implementation-priority-matrix)

---

## 1. iOS Codebase Overview

### 1.1 Project Stats

| Metric | Value |
|---|---|
| Swift source files | ~175 |
| Managers | 15 |
| Models | 25 |
| Service files | 17 (3 base + 14 API extensions) |
| Utility/Helper files | 16 |
| ViewModel files | 27 |
| View files (Common) | 33 |
| View files (Components) | 60 |
| View files (Trainer) | 33 |
| View files (Client/Personal) | 32 |
| Unit tests | 7 test files + 2 mock files |
| UI tests | 3 files |
| Live Activity widget extension | 1 Swift file |
| Documentation (.md) | ~78 files |

### 1.2 Architecture Pattern

**Pattern**: MVVM + Manager singletons + Service-oriented networking

```
View (SwiftUI) ↔ ViewModel (ObservableObject) ↔ Service (APIService extensions) ↔ Backend
                              ↕
                        Manager (singletons)
                              ↕
                         Model (Codable structs)
```

Key difference from Flutter: iOS uses `ObservableObject` with `@Published` properties and `@StateObject`/`@ObservedObject` wrappers. This maps cleanly to Flutter's Cubit/BLoC pattern with `freezed` sealed states.

### 1.3 Key Architectural Decisions

| Decision | iOS Implementation | Flutter Equivalent |
|---|---|---|
| State management per screen | `@StateObject var viewModel: SomeViewModel` | `BlocProvider<SomeCubit>` + `context.read()` |
| Shared global state | `@StateObject` on ContentView + `.environmentObject()` | `RepositoryProvider` or `MultiBlocProvider` |
| Dependency injection | Manual init via `@StateObject` | `get_it` + `@injectable` |
| Networking | `APIService.shared` singleton + `URLSession` | `Dio` with interceptors |
| Caching | `CacheManager` (disk-based) | Drift local DB + in-memory cache |
| Design system | `Color.theme.*` static properties | `AppColors` enum tokens |
| Navigation | `NavigationView` + programmatic tab switching | `GoRouter` with `ShellRoute` |
| Auth tokens | `KeychainHelper` (Keychain Services) | `flutter_secure_storage` |
| Localization | `LanguageManager` + `Localizable.xcstrings` | Flutter i18n / `slang` or `intl` |

---

## 2. App Shell & Navigation Architecture

### 2.1 App Entry Point (`Ziro_FitApp.swift`)

```swift
@main
struct Ziro_FitApp: App {
    // Initializes: ThemeManager, LanguageManager, SyncManager
    // Deep link handling:
    //   - Google OAuth callback
    //   - Stripe return (zirofitapp://stripe-return)
    //   - Event booking (zirofitapp://events)
    //   - Auth callbacks (zirofitapp://auth-callback, zirofitapp://login)
}
```

### 2.2 Root View (`ContentView.swift`)

The view hierarchy is **conditionally rendered** based on auth state:

```
ContentView
├── SNAPSHOT_MODE (mock data for UI testing)
├── isRestoringSession == true → SPLASH SCREEN (Ziro logo)
├── isAuthenticated == true
│   ├── role == "pending" || role == "authenticated" → OnboardingView
│   └── else → ZStack {
│       ├── MainTabView + environmentObject(workoutManager)
│       ├── WorkoutMiniPlayer (overlay, 90pt above bottom, zIndex:5)
│       │   └── condition: isSessionActive && isMinimized && !modeSelectorExpanded && !keyboardVisible
│       ├── WorkoutSessionView (full screen, zIndex:10)
│       │   └── condition: isSessionActive && !isMinimized
│       └── "Syncing workout..." indicator
│   }
└── else → LoginView
```

**Flutter porting note**: This maps directly to GoRouter redirect guards + `_MainShell` ZStack overlay pattern already implemented in the Flutter app.

### 2.3 Tab System (`MainTabView.swift`)

Uses a **zero-opacity pre-loading** pattern — all tabs are rendered simultaneously, only the selected tab is `allowsHitTesting`. Mode switching is instant.

**Tab layouts by mode:**

| Position | Trainer Mode | Personal Mode |
|---|---|---|
| Tab 1 | `CalendarView` (calendar) | `PersonalHomeView` (sparkles) |
| Tab 2 | `TrainerProgramsView` (programs/doc.text) | `PersonalExploreView` (programs → explore) |
| Tab 3 | `DashboardView` (home/house) | `PersonalAnalyticsView` (analytics) |
| Tab 4 | `ClientsView` (clients/people) | `WorkoutHistoryView` (clients → workouts/clock) |
| Tab 5 | `MoreView` (more/ellipsis) | — |
| Tab 5 (personal) | — | `MoreView` (more/ellipsis) |

**Cross-mode sheet**: `MainTabView` presents a `LoginView` sheet when the user tries to switch to a mode they're not authenticated in.

### 2.4 CustomTabBar (`CustomTabBar.swift`)

Features:
- **Drag gesture** on tab bar to switch modes (40% screen width threshold)
- **Mode selector** expandable via tap or upward drag (shows Professional ↔ Personal toggle)
- **Unread notification badge** on Home tab
- **Matched geometry effect** on selected tab background
- **Scale animation** (1.2x) on selected tab icon
- **Animated gradient border** on mode switch (0.8s fade-out)
- Tab bar is hidden when workout session is fullscreen (`!isMinimized`)

### 2.5 AppState (`AppState.swift`)

```swift
class AppState: ObservableObject {
    @AppStorage("lastUsedAppMode") var currentMode: AppMode = .trainer
    @Published var isModeSelectorExpanded = false
    @Published var selectedTab: AppTab = .home
    @AppStorage("hasSeenEducationalOnboarding") var hasSeenEducationalOnboarding: Bool
    @AppStorage("hasSeenTrainerFinding") var hasSeenTrainerFinding: Bool
    @AppStorage("isCustomModeEnabled") var isCustomModeEnabled: Bool  // default true for trainers
    // Deep link navigation support
    @Published var calendarDeepLinkDate: Date?
    @Published var calendarDeepLinkEventId: String?
}
```

---

## 3. Trainer Auth Flow — Complete State Machine

### 3.1 Auth ViewModel (`AuthViewModel.swift` — 1118 lines)

Central auth orchestrator. Key state:

```swift
@Published var isAuthenticated = false      // Active mode auth
@Published var isLoading = false
@Published var isRestoringSession = true    // Splash screen trigger
@Published var errorMessage: String?
@Published var currentUser: User?
@Published var showEmailConfirmation = false
@Published var showUpdatePasswordSheet = false

// Multi-account support (dual login)
private var trainerUser: User?
private var clientUser: User?
@Published var isTrainerAuthenticated = false
@Published var isClientAuthenticated = false
```

### 3.2 Complete State Machine

```
APP LAUNCH
  │
  ▼
SPLASH (isRestoringSession = true)
  │
  ├── checkAuthStatus()
  │   ├── Token expired? → refreshSession() → POST /api/auth/refresh
  │   ├── fetchUser() → GET /api/auth/me
  │   │   ├── Success → updateCurrentAuthState() → role detection
  │   │   └── Failure → isRestoringSession = false → LoginView
  │   └── isRestoringSession = false
  │
  ▼ (role evaluation)
  │
  ├── role == nil/"pending"/"authenticated"
  │   └── ONBOARDING
  │       ├── Step 0: Language Selection
  │       ├── Step 1: ROLE SELECTION ← TRAINER PICKS "Professional"
  │       │   ├── "Personal" → client path (steps 3,5,6 different)
  │       │   └── "Professional" → trainer path
  │       ├── Step 2: Details (name, surname, location, bio)
  │       ├── Step 3: Service Radius (km, map visualization)
  │       ├── Step 4: Avatar (optional)
  │       └── completeOnboarding() → POST complete-onboarding
  │           └── fetchUser() → updateCurrentAuthState()
  │               └── showCelebration → EducationalOnboardingView
  │
  └── role == "trainer"
      └── EducationalOnboardingView (5 slides, if !hasSeen)
          └── MainTabView (TRAINER MODE)

LOGIN FLOW (separate entry point)
  │
  ├── Email/Password
  │   ├── POST /api/auth/login → { data: { user, accessToken, refreshToken } }
  │   ├── Store tokens in Keychain (mode-specific slot)
  │   └── updateCurrentAuthState()
  │
  ├── Apple Sign In
  │   ├── Native ASAuthorizationController + SHA256 nonce
  │   ├── POST Supabase /auth/v1/token?grant_type=id_token
  │   ├── POST /api/auth/sync-user
  │   ├── GET /api/auth/me
  │   └── updateCurrentAuthState()
  │
  ├── Google Sign In
  │   ├── ASWebAuthenticationSession → /api/auth/mobile-signin?provider=google
  │   ├── Backend redirects to Supabase OAuth
  │   ├── Deep link callback: zirofitapp://auth-callback?access_token=...&refresh_token=...
  │   ├── POST /api/auth/sync-user
  │   ├── GET /api/auth/me
  │   └── updateCurrentAuthState()
  │
  └── Sign Up
      ├── POST /api/auth/register (role defaults to "pending")
      ├── Response requires confirmation → showEmailConfirmation = true
      ├── Auto-polling every 5s: login(email, password)
      │   ├── Success (verified!) → updateCurrentAuthState → dismiss
      │   └── Failure ("Email not confirmed") → keep polling
      └── Alternative: deep link zirofitapp://auth-callback → login with tokens
```

### 3.3 Role Detection Logic

```swift
let roleString = user.role?.lowercased() ?? ""
let isTrainerRole = roleString.contains("trainer") || roleString.contains("coach")
    || roleString.contains("instructor") || roleString.contains("admin")
    || roleString.contains("staff") || roleString.contains("owner")
let detectedMode: AppMode = isTrainerRole ? .trainer : .personal
```

**Mode enforcement**: If detected mode ≠ stored mode, tokens are moved to the correct slot, `.appModeShouldChange` notification is posted, and `updateCurrentAuthState()` recurses into the correct mode.

### 3.4 Multi-Account Architecture

- Two separate `URLSession` instances: `trainerSession` / `clientSession`
- Two Keychain token slots per user: `trainer_authToken` + `trainer_refreshToken` and `ziroMe_authToken` + `ziroMe_refreshToken`
- `activeMode` determines which session/tokens are used
- `AuthViewModel.setMode()` switches context between the two cached users
- Unauthorized errors fire `didEncounterUnauthorizedError` notification with the failing mode

### 3.5 Prefetch on Auth

After successful auth, `prefetchData(for:)` runs in background (500ms delay):
- **Trainer mode**: Dashboard, Clients, Programs, Templates, Calendar (3-month range)
- **Personal mode**: Dashboard, Active Program, Analytics, History, Exercises
- All cached via `CacheManager` for instant UI on first load

---

## 4. Trainer Tab Structure & All Screens

### 4.1 Tab 1: Calendar (`CalendarView.swift` — 780 lines)

| Aspect | Details |
|---|---|
| View Modes | Agenda (default), Day (swipeable TabView), Month (grid) |
| Data | `CalendarViewModel` → `.events`, `.filteredEvents`, `.allClients` |
| Header | Month/year picker, filter button, view mode menu, booking button |
| Date Strip | Horizontal scrollable date indicators (agenda/day modes) |
| Sessions | `SessionCard` with: Start Workout / Ongoing / Completed / Cancel actions |
| FAB | "+" button for QuickAddSessionView |
| Today button | Floating button when viewing non-today dates |
| Actions | Edit, Reschedule, Cancel (confirmation dialog), Message client (SMS) |
| Deep links | `calendarDeepLinkDate`, `calendarDeepLinkEventId` from AppState |
| Refresh | Pull-to-refresh, `didFinishSession` notification listener |

**Sub-components**: `DateHeader`, `MonthCalendarGrid`, `SessionCard`, `CalendarDateStrip`, `CalendarFiltersView`, `CalendarSkeleton`, `QuickAddSessionView`

### 4.2 Tab 2: Programs & Templates (`TrainerProgramsView.swift` — 630 lines)

| Aspect | Details |
|---|---|
| Sections | Active Programs (horizontal scroll), My Programs, Browse Library |
| Templates | Workout templates list (local + system), template detail navigation |
| Search | HUD search bar filtering programs and templates |
| Actions | Create Program (sheet), Create Template (sheet), swipe-to-delete |
| Data | `ProgramsViewModel` → `.programs`, `.templates`, `.localTemplates` |
| Cache | Disk cache via `CacheManager` with merge of local + server data |
| Empty state | "No programs yet" with CTA to create |
| Menu | Confirmation dialog: "New Program" vs "New Template" |

**Sub-components**: `ActiveProgramCard`, `ProgramCard`, `TemplateRow`, `SearchResultRow`, `StatusBadge`

### 4.3 Tab 3: Dashboard (`DashboardView.swift` — 433 lines)

| Aspect | Details |
|---|---|
| Header | `ZiroHeader` with avatar + name, notification bell with badge |
| Stats Row | Horizontal scroll: Revenue (→RevenueView), Clients (→Clients tab), Check-ins (→CheckInsView), Bookings (→BookingManagementView) |
| Quick Actions | Add Client (→AddClientView), New Program (→ProgramBuilderChoiceView), Storefront (→StorefrontSettingsView), Bookings (→BookingManagementView) |
| What's Next | Upcoming sessions list → tap navigates to Calendar |
| Data | `DashboardViewModel` → `.revenue`, `.activeClientsCount`, `.pendingCheckIns`, `.pendingBookings`, `.upcomingSessions` |
| Refresh | Pull-to-refresh, `onChange(of: currentMode)` |
| Empty | `DashboardSkeleton` (loading) |

**Sub-components**: `StatsCard`, `ActionRow`, `QuickActionCard`, `DashboardSkeleton`, `ZiroHeader`

### 4.4 Tab 4: Clients (`ClientsView.swift` — 260 lines)

| Aspect | Details |
|---|---|
| List | Two sections: **Pending Invitations** (orange badge) and **Active Clients** |
| Search | Animated search bar toggle |
| Row | `ClientRow`: avatar, name, email, `StatusBadge` (Active/Inactive/Pending) |
| Navigation | Tap → `ClientDetailView` |
| Data | `ClientsViewModel` → `.clients` (filtered by search) |
| Loading | `ListSkeleton` |
| Empty | "No clients yet" / "No clients found" |

**ClientDetailView** (501 lines):
- **Header**: Avatar, name, email, status badge
- **Active Program**: `ActiveProgramWidget` with template session start
- **Nutrition & Habits**: Navigation link to `NutritionDetailView`
- **Active Package**: Show package with remaining sessions
- **Start Session**: Primary CTA → `workoutManager.startSession(for: client)`
- **Management**: Request Check-in, Assign Program
- **Recent Activity**: Up to 5 sessions with ClientSessionRow
- **Actions**: Cancel program (confirmation), view full history

**Sub-components (ClientDetailView)**: `StatCard`, `ClientSessionRow`, `ActiveProgramWidget`, `StatusBadge`

### 4.5 Tab 5: More (`MoreView.swift` — 838 lines)

| Aspect | Details |
|---|---|
| Profile | Avatar + name + email + mode badge (PRO/PERSONAL) + QR code (trainer) |
| Settings sections | Full settings menu with 11+ sub-screens |
| Trainer-specific | Marketplace Manager, QR Code, Payouts, Subscription, Revenue |
| Shared | Notifications, Data Privacy, Language, Appearance, Contact, What's New |
| Account actions | Sign Out, Delete Account |

**Trainer-specific settings screens** (full list):
| Screen | File | Purpose |
|---|---|---|
| Marketplace Manager | `MarketplaceManagerView.swift` | Public profile, packages, preview media |
| Profile Settings | `ProfileSettingsView.swift` (370 lines) | Name, email, phone, bio, philosophy, methodology, certifications, qualifications, locations, avatar |
| Storefront Settings | `StorefrontSettingsView.swift` | Pricing, packages, classes/events |
| Package Management | `PackageManagementView.swift` | CRUD session packages |
| Payouts | `PayoutsView.swift` | Earnings, Stripe Connect |
| Revenue | `RevenueView.swift` | Revenue analytics |
| Classes & Events | `ClassesEventsView.swift` | Recurring classes, one-time events |
| Booking Management | `BookingManagementView.swift` | Booking requests overview |
| Check-ins | `CheckInsView.swift` | Client check-in review |
| Custom Exercises | `CustomExercisesView.swift` | Custom exercise library |
| Trainer Subscription | `TrainerSubscriptionView.swift` | Subscription plan |
| Working Hours | `WorkingHoursView.swift` | Availability settings |
| Preview Media Upload | `PreviewMediaUploadView.swift` | Video/photo carousel for profile |
| Nutrition Detail (Trainer) | `NutritionDetailView.swift` | View client nutrition plan |
| Nutrition Form | `NutritionFormView.swift` | Edit client nutrition plan |

### 4.6 Additional Trainer Screens

| Screen | File | Purpose |
|---|---|---|
| Client History | `ClientHistoryView.swift` | Full workout history for a client |
| Assessments | `AssessmentsView.swift` | Client assessments & check-in review |
| Check-in Detail | `CheckInDetailView.swift` | Single check-in detail |
| Create Program | `CreateProgramView.swift` | Multi-step program builder |
| Program Detail | `ProgramDetailView.swift` | Program detail with sessions |
| Program Builder Choice | `ProgramBuilderChoiceView.swift` | New Program vs New Template |
| Exercise Editor Card | `ExerciseEditorCardView.swift` | Exercise editor for templates |
| Visual Timeline Board | `VisualTimelineBoardView.swift` | Kanban/sequence board for programs |
| Visual Timeline Builder | `VisualTimelineBuilderView.swift` | Timeline builder |
| Invite Client | `InviteClientView.swift` | Client invitation |
| Add Client | `AddClientView.swift` | Add client form |
| Trainer Client Analytics | `TrainerClientAnalyticsView.swift` | Client progress analytics |
| Booking Window | `BookingWindowView.swift` | Booking window settings |

---

## 5. Shared UI Component Library

### 5.1 Navigation & Layout Components (14 files)

| Component | File | Usage Count | Description |
|---|---|---|---|
| `ZiroHeader` | `ZiroHeader.swift` | 10+ screens | Floating header: title + optional avatar + leading/trailing slots |
| `ZiroSheetHeader` | `ZiroSheetHeader.swift` | Many sheets | Drag handle + centered title + Cancel/Done buttons |
| `ZiroDismissButton` | `ZiroDismissButton.swift` | Many sheets | Standard close button |
| `CustomTabBar` | `CustomTabBar.swift` | 1 (root) | Full custom tab bar with mode selector |
| `WorkoutMiniPlayer` | `WorkoutMiniPlayer.swift` | 1 (overlay) | Minimized session player with timer, pause, expand |
| `SheetBackgroundModifier` | `SheetBackgroundModifier.swift` | Reusable | .ultraThinMaterial background modifier |
| `ErrorState` | `ErrorState.swift` | Many screens | Loading error + retry button |
| `ListSkeleton` | `ListSkeleton.swift` | Clients, Calendar | Shimmer loading placeholder |
| `CalendarSkeleton` | `CalendarSkeleton.swift` | Calendar | Calendar-specific skeleton |
| `DashboardSkeleton` | `DashboardSkeleton.swift` | Dashboard | Dashboard skeleton |
| `SwipeView` | `SwipeView.swift` | Global search | Swipe-to-dismiss wrapper |
| `FlowLayout` | `FlowLayout.swift` | Tags | Wrapping flow layout |
| `BlurView` | `BlurView.swift` | Various | UIViewRepresentable blur |
| `RoundedCorner` | `RoundedCorner.swift` | Utility | Shape for specific corner radius |

### 5.2 Workout Components (10 files)

| Component | File | Description |
|---|---|---|
| `RestTimerSheet` | `RestTimerSheet.swift` | Modal rest timer with progress ring |
| `RestTimerProgressBar` | `RestTimerProgressBar.swift` | Inline rest timer progress |
| `WorkoutNumericKeyboard` | `WorkoutNumericKeyboard.swift` | Custom numeric keypad for set logging |
| `RPEPickerOverlay` | `RPEPickerOverlay.swift` | RPE (Rate of Perceived Exertion) picker |
| `PlateCalculatorOverlay` | `PlateCalculatorOverlay.swift` | Plate calculator for weight |
| `FinishWorkoutAlert` | `FinishWorkoutAlert.swift` | End session confirmation alert |
| `ExerciseSelectionView` | `ExerciseSelectionView.swift` | Exercise picker bottom sheet |
| `ExerciseRow` | `ExerciseRow.swift` | Exercise list row |
| `SafeEmptySessionView` | `SafeEmptySessionView.swift` | Empty session placeholder |
| `QuickAddSessionView` | `QuickAddSessionView.swift` | Quick session creation |

### 5.3 Home/Dashboard Widgets (15 files)

| Component | File | Purpose |
|---|---|---|
| `ActiveProgramWidget` | `ActiveProgramWidget.swift` | Active program card with progress |
| `ActiveRoutineWidget` | `ActiveRoutineWidget.swift` | Active routine card |
| `CreditStatusWidget` | `CreditStatusWidget.swift` | Session credits display |
| `MembershipCardView` | `MembershipCardView.swift` | Membership status card |
| `GoalWidget` | `GoalWidget.swift` | Fitness goal widget |
| `DailyTargetCard` | `DailyTargetCard.swift` | Daily target card |
| `ExerciseProgressWidget` | `ExerciseProgressWidget.swift` | Exercise progress chart |
| `PerformanceSummaryWidget` | `PerformanceSummaryWidget.swift` | Performance summary |
| `RecoveryWidget` | `RecoveryWidget.swift` | Recovery status widget |
| `LinkedTrainerCard` | `LinkedTrainerCard.swift` | Linked trainer info card |
| `RecentWorkoutRow` | `RecentWorkoutRow.swift` | Recent workout row |
| `SessionCard` | `SessionCard.swift` | Calendar session card |
| `ProgramComponents` | `ProgramComponents.swift` | Shared program UI components |
| `PreviewCarousel` | `PreviewCarousel.swift` | Photo/video carousel |

### 5.4 Chart & Analytics Widgets (5 files)

| Component | File | Purpose |
|---|---|---|
| `InteractiveBarChart` | `InteractiveBarChart.swift` | Volume bar chart |
| `InteractiveLineChart` | `InteractiveLineChart.swift` | Weight/trend line chart |
| `InteractiveDonutChart` | `InteractiveDonutChart.swift` | Muscle group donut |
| `HeatMapWidget` | `HeatMapWidget.swift` | Activity calendar heatmap |
| `AnalyticsWidgetContainer` | `AnalyticsWidgetContainer.swift` | Widget wrapper with drag-to-reorder |

### 5.5 Calendar Components (5 files)

| Component | File | Purpose |
|---|---|---|
| `CalendarDateStrip` | `CalendarDateStrip.swift` | Horizontal date selector |
| `CustomCalendarPicker` | `CustomCalendarPicker.swift` | Full month calendar picker |
| `CalendarFiltersView` | `CalendarFiltersView.swift` | Session type filters |
| `CalendarSkeleton` | `CalendarSkeleton.swift` | Loading placeholder |

### 5.6 Media & Input Components (7 files)

| Component | File | Purpose |
|---|---|---|
| `ImagePicker` | `ImagePicker.swift` | UIImagePickerController wrapper |
| `CachedAsyncImage` | `CachedAsyncImage.swift` | Image with disk cache |
| `YouTubePlayerView` | `YouTubePlayerView.swift` | WKWebView YouTube embed |
| `GIFImage` | `GIFImage.swift` | Animated GIF support |
| `VoiceCoachButton` | `VoiceCoachButton.swift` | AI voice coach button |
| `VoiceCoachOverlay` | `VoiceCoachOverlay.swift` | Voice coach modal overlay |
| `GlobalSearchView` | `GlobalSearchView.swift` | Full-text search |

### 5.7 Notification Components (3 files)

| Component | File | Purpose |
|---|---|---|
| `NotificationsView` | `NotificationsView.swift` | Full notification list (Common) |
| `ZiroHeader` badges | `ZiroHeader.swift` | Bell icon + unread badge |
| `CustomTabBar` badges | `CustomTabBar.swift` | Tab bar unread badge |

---

## 6. Design System

### 6.1 Color System (`Color+Extensions.swift`)

iOS uses `Color.theme.*` with **dynamic light/dark mode** support:

| Token | Light | Dark | Flutter Equivalent |
|---|---|---|---|
| `backgroundPrimary` | #F2F2F2 (0.95 white) | #1C1C1E | `AppColors.background` (forced light) |
| `backgroundSecondary` | #FFFFFF | #2C2C2E | `AppColors.card` |
| `backgroundTertiary` | #E6E6E6 (0.9 white) | #3A3A3C | `AppColors.mutedSurface` |
| `textPrimary` | Black | White | `AppColors.foreground` |
| `textSecondary` | Gray (system) | Gray | `AppColors.mutedText` |
| `accent` | #0083FF | #0083FF | `AppColors.primary` (#007aff) |
| `cardBackground` | White | secondarySystemGroupedBackground | `AppColors.card` |
| `borderColor` | Gray 0.2 opacity | Gray 0.3 opacity | `AppColors.borderMuted`/`borderActive` |

### 6.2 Typography Patterns

| Usage | Size | Weight | Tracking |
|---|---|---|---|
| Screen title (ZiroHeader) | 22pt | Bold | -0.5 |
| Body | 14-17pt | Regular/Semibold | — |
| Caption | 10-12pt | Regular/Bold | — |
| Large stats | 24pt | Bold (rounded) | — |
| Timer | 14pt | Medium (monospaced) | — |
| Sheet title | 17pt | Semibold | — |

### 6.3 Corner Radii

| Token | iOS Value | Flutter Equivalent |
|---|---|---|
| Standard card | 16pt → `cornerRadius(16)` | `BorderRadius.circular(16)` |
| Button/input | 12-14pt | `BorderRadius.circular(12)` |
| Rounded button | 30pt | ClipRRect + radius 30 |
| Tab bar | 40pt | Custom shape |
| Mini player | 24pt | `BorderRadius.circular(24)` |
| Small badge | 4-6pt | `BorderRadius.circular(4)` |

### 6.4 Shadow System

| Level | iOS | Flutter Equivalent |
|---|---|---|
| Card subtle | `shadow(color: .black.opacity(0.05), radius: 5, y: 2)` | `BoxShadow(blurRadius: 5, offset: Offset(0,2), color: black.withOpacity(0.05))` |
| Mini player | `shadow(color: .black.opacity(0.15), radius: 20, y: 10)` | `BoxShadow(blurRadius: 20, offset: Offset(0,10), color: black.withOpacity(0.15))` |
| Button | `shadow(color: .blue.opacity(0.4), radius: 10, y: 5)` | `BoxShadow(blurRadius: 10, offset: Offset(0,5), color: blue.withOpacity(0.4))` |

### 6.5 Background Materials

iOS uses `.ultraThinMaterial` extensively for floating headers and sheets. Flutter equivalent is a frosted glass effect or semi-transparent backgrounds with blur.

---

## 7. State Management & Data Flow

### 7.1 iOS Patterns vs Flutter Equivalents

| iOS Pattern | Implementation | Flutter Equivalent |
|---|---|---|
| **Screen ViewModel** | `@StateObject var vm = SomeViewModel()` | `BlocProvider<SomeCubit>(create: ...)` |
| **Shared ViewModel** | `.environmentObject(authViewModel)` | `RepositoryProvider.value(value: authCubit)` |
| **Published state** | `@Published var items: [T] = []` | `emit(state.copyWith(items: ...))` |
| **Computed properties** | `var filtered: [T] { items.filter { ... } }` | `state.computedProperty` in build |
| **Async init** | `.task { await vm.load() }` | `await cubit.load()` in `onReady` |
| **Pull to refresh** | `.refreshable { vm.refresh() }` | `RefreshIndicator` + `context.read()` |
| **Optimistic updates** | Local + server with rollback on error | Same pattern in Cubit |
| **Notification cross-talk** | `NotificationCenter.default.post(name:)` | BlocListener / stream subscriptions |

### 7.2 Manager Singletons (Global State)

| Manager | Responsibility | Flutter Equivalent |
|---|---|---|
| `WorkoutManager` | Active session, timer, exercises, rest timer | `WorkoutSessionCubit` (already ported) |
| `AppState` | Mode, selected tab, onboarding flags | `AppState` / individual `@AppStorage` |
| `NotificationManager` | Push/local notifications | `NotificationCubit` + local notifications plugin |
| `LocationManager` | Geolocation service | `geolocator` service wrapper |
| `SyncManager` | Offline sync orchestration | `SyncCubit` (already ported) |
| `CacheManager` | Disk-based JSON caching | Drift tables + in-memory cache |
| `HapticManager` | Haptic feedback | HapticFeedback plugin |
| `AnalyticsManager` | PostHog analytics | posthog_flutter plugin |
| `SubscriptionManager` | Pro subscription status | Cubit with API service |

### 7.3 ViewModel Patterns (27 files)

iOS ViewModels follow a consistent pattern:

```swift
@MainActor
class SomeViewModel: ObservableObject {
    @Published var items: [Item] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    static let cacheKey = "some_cache_key"
    
    init() { loadCache() }
    
    func fetch() async {
        isLoading = items.isEmpty
        errorMessage = nil
        do {
            items = try await APIService.shared.fetchItems()
            CacheManager.shared.save(items, key: Self.cacheKey)
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
```

**Flutter mapping**: Each ViewModel becomes a Cubit with sealed state:
```dart
@freezed
class SomeState with _$SomeState {
  const factory SomeState.initial() = _Initial;
  const factory SomeState.loading() = _Loading;
  const factory SomeState.loaded({required List<Item> items}) = _Loaded;
  const factory SomeState.error(String message) = _Error;
}
```

---

## 8. API & Networking Layer

### 8.1 APIService Architecture

```
APIService.swift (base class — 892 lines)
├── baseURL → "https://ziro.fit/api"
├── supabaseURL + supabaseAnonKey
├── activeMode: AppMode (switches between two URLSession instances)
├── Token/keychain management (per-mode slots)
├── auto-refresh on 401
├── performRequest<T>(request, decodingType, mode) → T
├── refreshSession() → POST /api/auth/refresh
├── completeURL(for:) → resolves relative image URLs
└── extractTokenFromCookies(url:) → String?
```

**Extension files (14 domain-specific files)**:

| Extension | Methods | File |
|---|---|---|
| `+Auth` | login, register, fetchUser, signOut, syncUser, completeOnboarding, forgotPassword, updatePassword, resendVerification, signInWithIdToken, performServerLogout | 637 lines |
| `+Dashboard` | fetchMobileHome, fetchProfileTextContent, updateCoreInfo, updateProfileText, updateTrainerProfile | ~200 lines |
| `+Clients` | fetchClients, fetchClientPackages, fetchClientActiveProgram, cancelProgramAssignment, searchClients | ~200 lines |
| `+Calendar` | fetchCalendar, createCalendarEvent, updateCalendarEvent, deleteCalendarEvent, calendarFilters | ~200 lines |
| `+Workouts` | startWorkout, finishWorkout, logSet, getWorkoutHistory, getSessionDetail, activeSession, exercises sync | ~200 lines |
| `+Bookings` | fetchBookings, approveBooking, declineBooking | ~100 lines |
| `+CheckIns` | fetchCheckIns, submitCheckIn, checkIn config, photo upload | ~100 lines |
| `+Trainer` | getTrainerPublicProfile, searchTrainers, fetchTrainerPackages, fetchTrainerTestimonials, fetchActivePrograms (trainer) | 1285 lines |
| `+Explore` | explore metadata, featured content, promoted trainers | ~100 lines |
| `+ClientDashboard` | client dashboard, active program, progress, analytics | ~100 lines |
| `+Nutrition` | fetchNutritionPlan, fetchHabits, logHabit | ~100 lines |
| `+Library` | fetchPrograms, fetchWorkoutTemplates, createProgram, createTemplate, deleteTemplate | ~200 lines |
| `+PreviewMedia` | uploadPreviewMedia, fetchPreviewMedia | ~100 lines |
| `+Voice` | voice coach session, voice log | ~100 lines |

### 8.2 Response Envelope

```swift
struct APIResponse<T: Decodable>: Decodable {
    let data: T
}
// Used as: let result = try await performRequest(..., decodingType: APIResponse<SomeModel>.self)
```

**Error format** (parsed in API extensions):
```json
{ "error": { "message": "...", "code": "...", "details": ... } }
```

### 8.3 Token Management Flow

```
Login success
  → Extract accessToken + refreshToken from response body
  → For trainer mode: ALSO try extractTokenFromCookies()
  → Store in Keychain (mode-specific keys)
  
Every request
  → addAuthorizationHeader() → "Bearer \(token)"
  → If 401:
      1. Post didEncounterUnauthorizedError notification
      2. Call refreshSession() → POST /api/auth/refresh
      3. On success: retry original request
      4. On failure: handleGlobalUnauthorized() → logout
```

---

## 9. Workout System Deep Dive

### 9.1 WorkoutManager (`WorkoutManager.swift` — 2,524 lines)

The most complex component in the iOS app. Singleton managing:

```swift
@MainActor class WorkoutManager: ObservableObject {
    @Published var session: WorkoutSession?
    @Published var isSessionActive = false
    @Published var isMinimized = false
    @Published var currentClient: Client?
    @Published var isSyncingWorkout = false
    
    // Sub-managers
    let timer = WorkoutTimer()
    let restManager = RestTimerManager()
    
    // Exercise management
    @Published var currentExercises: [WorkoutExercise] = []
    @Published var activeExerciseIndex = 0
    
    // Session controls
    func startSession(for client: Client?, templateId: String?, ...)
    func endSession()
    func minimize()      // → isMinimized = true
    func maximize()      // → isMinimized = false
    func togglePause()
    func logSet(exerciseId:, setNumber:, weight:, reps:, rpe:)
    func addExercises(_ exercises: [Exercise])
    func removeExercise(_ exercise: WorkoutExercise)
    func fetchHistory(for client: Client)
    
    // Conflict resolution
    @Published var showActiveSessionConflictAlert = false
    func resolveConflict(startNew: Bool)
    
    // Timer sync
    func startTimer(startTime: Date)
    func stopTimer()
}
```

### 9.2 WorkoutTimer

```swift
class WorkoutTimer: ObservableObject {
    @Published var elapsedTime: TimeInterval = 0
    @Published var isTimerRunning = false
    
    func start(startTime: Date)  // Uses Combine Timer.publish(every: 1)
    func stop()
    func reset()
    
    static let MAX_WORKOUT_DURATION = 4 * 3600  // 4 hours
    static let WARNING_DURATION = 2 * 3600       // 2 hours
}
```

### 9.3 Mini Player Workflow

```
User starts workout → WorkoutSessionView (full screen)
  ↓ Drag down gesture
minimize() → isMinimized = true
  ↓ ContentView detects isSessionActive && isMinimized
WorkoutMiniPlayer overlay (zIndex: 5, 90pt above bottom)
  ↓ Tap / Swipe up
maximize() → isMinimized = false
  ↓ ContentView detects isSessionActive && !isMinimized
WorkoutSessionView (zIndex: 10, full screen)
```

### 9.4 Cold Start Session Resume

```
App launch → AuthViewModel.checkAuthStatus()
  → On AuthAuthenticated:
    → WorkoutSessionCubit.loadCurrent()
    → GET /api/sessions/active
    → If active session exists:
      → emit active(isMinimized: true, startTime: serverTime)
      → Mini player appears immediately
```

### 9.5 Rest Timer

```swift
class RestTimerManager: ObservableObject {
    @Published var isRunning = false
    @Published var remainingTime: TimeInterval = 0
    @Published var totalTime: TimeInterval = 90  // default
    
    func startRest(duration: TimeInterval)
    func endRest()
    func adjustRestTime(_ adjustment: TimeInterval)
    func skipRest()
}
```

---

## 10. Flutter Porting Strategy

### 10.1 Architecture Mapping

```
iOS Layer                  → Flutter Layer
──────────────────────────────────────────────────
SwiftUI View              → Flutter Widget (StatelessWidget/StatefulWidget)
ObservableObject ViewModel → Cubit + freezed sealed states
@Published property        → Cubit state field
@State/@StateObject        → BlocProvider + context.watch/read
.environmentObject         → MultiBlocProvider / RepositoryProvider
Manager singleton          → Injectable singleton Cubit/Service
APIService extensions      → Dio service classes (feature-specific)
CacheManager               → Drift local DB + CacheManager
Keychain                   → flutter_secure_storage
NavigationView + TabView   → GoRouter + ShellRoute + BottomNavigationBar
NotificationCenter         → BlocListener / stream subscriptions
async/await Task           → Future/Emit in cubit methods
Codable structs            → JSON Serializable / freezed models
@AppStorage                → SharedPreferences / Drift preferences
```

### 10.2 Directory Structure Strategy

```
lib/
├── core/
│   ├── di/           ← injectable config (+Auth, +Dashboard, etc.)
│   ├── network/      ← Dio client, interceptors (already done)
│   ├── database/     ← Drift tables (already done)
│   ├── theme/        ← AppColors (already done), typography
│   ├── router/       ← GoRouter (already done)
│   └── logging/      ← Logger config (already done)
├── features/
│   ├── auth/
│   │   └── ...       ← Already implemented
│   ├── trainers/     ← NEW: Trainer tab screens
│   │   ├── cubit/    ← TrainerDashboardCubit, etc.
│   │   ├── data/     ← TrainerApiService, TrainerRepository
│   │   ├── domain/   ← Trainer models
│   │   └── presentation/
│   │       ├── dashboard/
│   │       ├── clients/
│   │       ├── calendar/
│   │       ├── programs/
│   │       ├── more/
│   │       └── widgets/   ← Shared trainer widgets
│   ├── workout/      ← Already implemented (but expand)
│   └── ...existing features...
└── shared/
    ├── widgets/      ← Reusable UI components
    │   ├── ziro_header.dart
    │   ├── ziro_sheet_header.dart
    │   ├── workout_mini_player.dart
    │   ├── stats_card.dart
    │   ├── action_row.dart
    │   ├── quick_action_card.dart
    │   ├── error_state.dart
    │   ├── loading_skeleton.dart
    │   ├── session_card.dart
    │   ├── status_badge.dart
    │   ├── avatar_widget.dart
    │   └── ... (shared components from iOS)
    └── helpers/       ← Extensions, formatters
```

### 10.3 Screen Mapping — Trainer Tab 1: Dashboard

| iOS | Flutter Status | Notes |
|---|---|---|
| `DashboardView` | 🆕 NEW | Need `TrainerDashboardCubit` + `DashboardViewModel` equivalent |
| `ZiroHeader` | 🆕 NEW | Generic floating header with avatar + trailing actions |
| `StatsCard` | 🆕 NEW | Reusable stat card with icon, value, trend |
| `QuickActionCard` | 🆕 NEW | Grid action card with gradient icon |
| `ActionRow` | 🆕 NEW | List row with icon, title, subtitle, chevron |
| `DashboardSkeleton` | 🆕 NEW | Shimmer loading state |
| `MarketplaceManagerView` | 🆕 NEW | Full trainer marketplace/marketplace manager |

### 10.4 Screen Mapping — Trainer Tab 2: Programs

| iOS | Flutter Status | Notes |
|---|---|---|
| `TrainerProgramsView` | 🆕 NEW | Programs + templates library (trainer view) |
| `ProgramCard` | 🆕 NEW | Horizontal scroll card |
| `ProgramDetailView` | 🆕 NEW | Program detail with session list |
| `CreateProgramView` | 🆕 NEW | Multi-step program builder |
| `ProgramBuilderChoiceView` | 🆕 NEW | New Program vs New Template choice |
| `TemplateDetailView` | Already exists | In Common (share with client) |
| `CreateTemplateView` | Already exists | In Common (share with client) |

### 10.5 Screen Mapping — Trainer Tab 3: Calendar

| iOS | Flutter Status | Notes |
|---|---|---|
| `CalendarView` | 🆕 NEW | Full calendar with Agenda/Day/Month modes |
| `CalendarViewModel` | 🆕 NEW | Calendar events, filtering, date management |
| `CalendarDateStrip` | 🆕 NEW | Horizontal date strip |
| `CustomCalendarPicker` | 🆕 NEW | Month picker modal |
| `CalendarFiltersView` | 🆕 NEW | Filter by session type |
| `QuickAddSessionView` | 🆕 NEW | Quick session creation sheet |
| `SessionCard` | 🆕 NEW | Calendar session card |
| `BookingManagementView` | 🆕 NEW | Booking requests |
| `MonthCalendarGrid` | 🆕 NEW | Month view grid |

### 10.6 Screen Mapping — Trainer Tab 4: Clients

| iOS | Flutter Status | Notes |
|---|---|---|
| `ClientsView` | 🆕 NEW | Client list with search + pending section |
| `ClientRow` | 🆕 NEW | Client list row with avatar |
| `StatusBadge` | 🆕 NEW | Green/orange/gray status |
| `ClientDetailView` | 🆕 NEW | Full client detail with active program, sessions, actions |
| `ClientSessionRow` | 🆕 NEW | Session history row |
| `ClientHistoryView` | 🆕 NEW | Full workout history |
| `NutritionDetailView` (trainer) | 🆕 NEW | View client nutrition plan |
| `CheckInsView` | 🆕 NEW | Client check-in review |

### 10.7 Screen Mapping — Trainer Tab 5: More

| iOS | Flutter Status | Notes |
|---|---|---|
| `MoreView` | 🆕 NEW | Full settings menu — 838 lines, largest iOS view |
| `ProfileSettingsView` | 🆕 NEW | Profile editor with all trainer fields |
| `StorefrontSettingsView` | 🆕 NEW | Pricing, packages, classes |
| `PackageManagementView` | 🆕 NEW | Session package CRUD |
| `PayoutsView` | 🆕 NEW | Stripe Connect payouts |
| `RevenueView` | 🆕 NEW | Revenue analytics |
| `PreviewMediaUploadView` | 🆕 NEW | Photo/video carousel |
| `WorkingHoursView` | 🆕 NEW | Availability settings |
| `BookingWindowView` | 🆕 NEW | Booking window config |
| `CustomExercisesView` | 🆕 NEW | Custom exercise library |
| `TrainerSubscriptionView` | 🆕 NEW | Plan management |

### 10.8 Shared Components to Extract (from `Views/Components/`)

These should be built once and shared across client + trainer features:

| Priority | Component | iOS File | Flutter Implementation Strategy |
|---|---|---|---|
| 🔴 P0 | `ZiroHeader` | `ZiroHeader.swift` | Generic widget with leading, title, trailing slots |
| 🔴 P0 | `ZiroSheetHeader` | `ZiroSheetHeader.swift` | Sheet drag handle + title + cancel/done |
| 🔴 P0 | `WorkoutMiniPlayer` | `WorkoutMiniPlayer.swift` | Already exists in Flutter, verify parity |
| 🔴 P0 | `ErrorState` | `ErrorState.swift` | Reusable error + retry widget |
| 🔴 P0 | `RestTimerSheet` | `RestTimerSheet.swift` | Already have API endpoints, needs UI integration |
| 🟡 P1 | `StatsCard` | Dashboard.swift | Stat card with icon, value, trend |
| 🟡 P1 | `ActionRow` | Dashboard.swift | List row with chevron |
| 🟡 P1 | `QuickActionCard` | Dashboard.swift | Grid action card |
| 🟡 P1 | `SessionCard` | CalendarView.swift | Calendar event card with actions |
| 🟡 P1 | `ClientRow` | ClientsView.swift | Client list row |
| 🟡 P1 | `StatusBadge` | ClientsView.swift | Colored status badge |
| 🟡 P1 | `ListSkeleton` | `ListSkeleton.swift` | Shimmer loading |
| 🟡 P1 | `LinkedTrainerCard` | `LinkedTrainerCard.swift` | Linked trainer display |
| 🟢 P2 | `WorkoutNumericKeyboard` | `WorkoutNumericKeyboard.swift` | Custom keypad for logging |
| 🟢 P2 | `RPEPickerOverlay` | `RPEPickerOverlay.swift` | RPE selector |
| 🟢 P2 | `PlateCalculatorOverlay` | `PlateCalculatorOverlay.swift` | Plate calculator |
| 🟢 P2 | `InteractiveBarChart` | `InteractiveBarChart.swift` | fl_chart wrapper |
| 🟢 P2 | `InteractiveLineChart` | `InteractiveLineChart.swift` | fl_chart wrapper |
| 🟢 P2 | `InteractiveDonutChart` | `InteractiveDonutChart.swift` | fl_chart wrapper |

### 10.9 API Service Mapping

Every APIService extension needs a corresponding Flutter Dio service:

| iOS API Extension | Flutter Service | Status |
|---|---|---|
| `APIService+Auth` | `AuthApiService` | ✅ Done |
| `APIService+Trainer` | `TrainerApiService` + `BookingApiService` | ✅ Done (partial) |
| `APIService+Dashboard` | 🆕 NEW: `TrainerDashboardApiService` | 🔴 NEEDED |
| `APIService+Clients` | 🆕 NEW: `ClientsApiService` | 🔴 NEEDED |
| `APIService+Calendar` | 🆕 NEW: `CalendarApiService` | 🔴 NEEDED |
| `APIService+Workouts` | `WorkoutSessionApiService` | ✅ Done |
| `APIService+Bookings` | `BookingApiService` | ✅ Done |
| `APIService+CheckIns` | `CheckInApiService` | ✅ Done (client only) |
| `APIService+Library` | `ProgramApiService` | ✅ Done (client only) |
| `APIService+Nutrition` | `NutritionHabitsApiService` | ✅ Done |
| `APIService+Explore` | `ExploreApiService` | ✅ Done (client only) |
| `APIService+ClientDashboard` | `HomeApiService` | ✅ Done |
| `APIService+Voice` | 🆕 NEW | ❌ Not started |
| `APIService+PreviewMedia` | 🆕 NEW | ❌ Not started |

### 10.10 Model Mapping

| iOS Model | Flutter DTO | Status |
|---|---|---|
| `User` | `User` | ✅ Done |
| `Client` | 🆕 NEW | 🔴 NEEDED |
| `CalendarEvent` | 🆕 NEW | 🔴 NEEDED |
| `WorkoutProgram` | `ProgramDto` | ✅ Done (partial) |
| `WorkoutTemplate` | `ProgramTemplate` | ✅ Done (partial) |
| `WorkoutSession` | `WorkoutSessionDto` | ✅ Done (partial) |
| `Exercise` | `ExerciseDto` | ✅ Done |
| `DashboardData` | 🆕 NEW | 🔴 NEEDED |
| `ActiveProgramItem` | 🆕 NEW | 🔴 NEEDED |
| `TrainerPublicProfile` | `TrainerDetailDto` | ✅ Done (partial) |
| `Package` | `TrainerPackageDto` | ✅ Done |
| `NotificationModel` | `NotificationDto` | ✅ Done |
| `CheckInModels` | `CheckInDto` | ✅ Done |
| `NutritionModels` | `NutritionPlanDto` | ✅ Done |
| `BookingModels` | `BookingResponseDto` | ✅ Done |
| `AppMode` | `AppMode` | 🆕 Conceptual, mapped via role |
| `RevenueData` | 🆕 NEW | ❌ Not started |
| `PayoutData` | 🆕 NEW | ❌ Not started |
| `TrainerPreviewMedia` | 🆕 NEW | ❌ Not started |

---

## 11. Implementation Priority Matrix

### Phase 1 — Foundation (Trainer Shell + Auth)
| Priority | Task | iOS Files to Reference | Effort |
|---|---|---|---|
| 🔴 P0 | Dual-mode tab switching (trainer ↔ personal) | `AppState.swift`, `MainTabView.swift`, `CustomTabBar.swift` | 2 days |
| 🔴 P0 | Trainer authentication | `AuthViewModel.swift`, `APIService+Auth.swift` | ✅ Done |
| 🔴 P0 | Trainer onboarding (role selection, details, radius) | `OnboardingView.swift` (steps 1-4) | 2 days |

### Phase 2 — Trainer Dashboard
| Priority | Task | iOS Files to Reference | Effort |
|---|---|---|---|
| 🔴 P0 | Trainer Dashboard screen | `DashboardView.swift`, `DashboardViewModel.swift` | 2 days |
| 🔴 P0 | Stat cards + quick actions + upcoming sessions | Embedded in `DashboardView.swift` | 1 day |
| 🔴 P0 | Support `ZiroHeader` widget | `ZiroHeader.swift` | 0.5 day |
| 🔴 P0 | Notification bell + badge | `ZiroHeader.swift` | 0.5 day |
| 🟡 P1 | Revenue screen | `RevenueView.swift` | 1 day |
| 🟡 P1 | Booking Management | `BookingManagementView.swift` | 1.5 days |

### Phase 3 — Calendar
| Priority | Task | iOS Files to Reference | Effort |
|---|---|---|---|
| 🔴 P0 | Calendar (Agenda + Day + Month views) | `CalendarView.swift`, `CalendarViewModel.swift` | 4 days |
| 🔴 P0 | Date strip + month grid | Embedded in `CalendarView.swift` | 1 day |
| 🔴 P0 | Session CRUD (QuickAdd, Edit, Cancel, Reschedule) | `QuickAddSessionView.swift` | 2 days |
| 🟡 P1 | Calendar filters | `CalendarFiltersView.swift` | 0.5 day |

### Phase 4 — Clients
| Priority | Task | iOS Files to Reference | Effort |
|---|---|---|---|
| 🔴 P0 | Clients list with search | `ClientsView.swift`, `ClientsViewModel.swift` | 1.5 days |
| 🔴 P0 | Client Detail | `ClientDetailView.swift` | 2 days |
| 🔴 P0 | Start workout from client | `ClientDetailView.swift` (Start Session) | 1 day |
| 🟡 P1 | Client History | `ClientHistoryView.swift` | 1 day |
| 🟡 P1 | Add Client + Invite Client | `AddClientView.swift`, `InviteClientView.swift` | 1 day |
| 🟡 P1 | Check-in review | `CheckInsView.swift`, `CheckInDetailView.swift` | 1.5 days |
| 🟡 P1 | Nutrition view (trainer) | `NutritionDetailView.swift` | 1 day |

### Phase 5 — Programs & Templates
| Priority | Task | iOS Files to Reference | Effort |
|---|---|---|---|
| 🔴 P0 | Programs library (trainer view) | `TrainerProgramsView.swift` | 2 days |
| 🟡 P1 | Create Program | `CreateProgramView.swift` | 2 days |
| 🟡 P1 | Program Detail | `ProgramDetailView.swift` | 1 day |
| 🟢 P2 | Visual Timeline Board | `VisualTimelineBoardView.swift` | 3 days |
| 🟢 P2 | Visual Timeline Builder | `VisualTimelineBuilderView.swift` | 3 days |
| 🟢 P2 | Exercise Editor Card | `ExerciseEditorCardView.swift` | 1 day |

### Phase 6 — More/Settings
| Priority | Task | iOS Files to Reference | Effort |
|---|---|---|---|
| 🟡 P1 | More screen (settings menu) | `MoreView.swift` (838 lines) | 3 days |
| 🟡 P1 | Profile Settings | `ProfileSettingsView.swift` | 2 days |
| 🟡 P1 | Storefront Settings | `StorefrontSettingsView.swift` | 1 day |
| 🟡 P1 | Package Management | `PackageManagementView.swift` | 1.5 days |
| 🟢 P2 | Payouts | `PayoutsView.swift` | 1 day |
| 🟢 P2 | Working Hours | `WorkingHoursView.swift` | 1 day |
| 🟢 P2 | Preview Media Upload | `PreviewMediaUploadView.swift` | 1 day |
| 🟢 P2 | Custom Exercises | `CustomExercisesView.swift` | 1.5 days |

### Phase 7 — Workout System Enhancements
| Priority | Task | iOS Files to Reference | Effort |
|---|---|---|---|
| 🟡 P1 | Rest timer UI + API integration | `RestTimerSheet.swift`, `RestTimerProgressBar.swift` | 1.5 days |
| 🟡 P1 | RPE Picker | `RPEPickerOverlay.swift` | 0.5 day |
| 🟡 P1 | Workout Numeric Keyboard | `WorkoutNumericKeyboard.swift` | 1 day |
| 🟢 P2 | Plate Calculator | `PlateCalculatorOverlay.swift` | 1 day |
| 🟢 P2 | Cold-start session resume (full flow) | `WorkoutManager.swift` (checkForActiveSession) | 1 day |

---

## Appendix: Key iOS Files Reference Table

| File | Lines | Purpose | Porting Priority |
|---|---|---|---|
| `ContentView.swift` | 196 | Root view: auth gate + workout overlays | 🔴 Reference (architecture) |
| `MainTabView.swift` | 109 | Dual-mode tab container | 🔴 Reference |
| `CustomTabBar.swift` | 315 | Full-featured custom tab bar | 🔴 Reference |
| `AuthViewModel.swift` | 1118 | Central auth state machine | 🔴 Reference |
| `APIService+Auth.swift` | 637 | Auth API calls | ✅ Already ported |
| `OnboardingView.swift` | 1153 | Multi-step onboarding wizard | 🔴 Reference |
| `AppState.swift` | 80 | Global app state | 🔴 Reference |
| `User.swift` | 239 | User model with multi-source decoding | ✅ Already ported |
| `AppMode.swift` | 15 | Trainer vs Personal enum | 🔴 Reference |
| `DashboardView.swift` | 433 | Trainer home dashboard | 🔴 Primary target |
| `DashboardViewModel.swift` | ~200 | Dashboard data loading | 🔴 Primary target |
| `ClientsView.swift` | 260 | Client list with search | 🔴 Primary target |
| `ClientDetailView.swift` | 501 | Full client detail | 🔴 Primary target |
| `ClientsViewModel.swift` | ~150 | Client data + search | 🔴 Primary target |
| `CalendarView.swift` | 780 | Multi-mode calendar | 🔴 Primary target |
| `CalendarViewModel.swift` | ~400 | Calendar data + filtering | 🔴 Primary target |
| `TrainerProgramsView.swift` | 630 | Programs & templates library | 🔴 Primary target |
| `ProgramsViewModel.swift` | 332 | Programs data + cache | 🔴 Primary target |
| `MoreView.swift` | 838 | Full settings menu | 🟡 Reference |
| `ProfileSettingsView.swift` | 370 | Profile editor | 🟡 Primary target |
| `WorkoutManager.swift` | 2524 | Session state machine | ✅ Already ported (Cubit) |
| `APIService+Trainer.swift` | 1285 | Trainer + marketplace API | 🟡 Reference |
| `Color+Extensions.swift` | 111 | Design system colors | ✅ Already ported |
| `ZiroHeader.swift` | 127 | Reusable floating header | 🔴 Primary target |
| `ZiroSheetHeader.swift` | 63 | Sheet header component | 🔴 Primary target |
| `WorkoutMiniPlayer.swift` | 177 | Floating mini player | ✅ Already ported |
| `APIService+Workouts.swift` | ~400 | Workout API calls | ✅ Already ported |
| `APIService+Dashboard.swift` | ~200 | Trainer dashboard API | 🔴 Primary target |
| `APIService+Clients.swift` | ~200 | Client management API | 🔴 Primary target |
| `APIService+Calendar.swift` | ~200 | Calendar/event API | 🔴 Primary target |
| `APIService+Library.swift` | ~200 | Programs/templates API | ✅ Already ported (partial) |

---

**End of analysis document.**
