# ZIRO.FIT Client Home Page — Full Analysis & Implementation Plan

## Source: iOS Reference App (`~/pr/Ziro-Fit`)

---

## 1. App Architecture Overview

### Dual-Mode System
The iOS app has two modes controlled by `AppState.currentMode`:
- **`.personal`** — Client/Athlete view (this analysis)
- **`.trainer`** — Professional/Trainer view

### Tab Configuration (Personal mode)

| Tab key | iOS Label | iOS Icon | Flutter Path (current) |
|---|---|---|---|
| `.programs` | Explore | `sparkles` | `/explore` ✅ (ExploreScreen) |
| `.clients` | Workouts | `clock` | `/workout` ✅ (WorkoutSessionScreen) |
| `.home` | Home | `house.fill` | `/` 🟡 (placeholder) |
| `.analytics` | Analytics | `chart.xyaxis.line` | N/A 🔴 (missing) |
| `.more` | More | `ellipsis.circle` | `/profile` 🟡 (placeholder) |

### Navigation Structure (iOS)
```
ContentView
  └── MainTabView (ZStack with pre-loaded views per tab)
        └── PersonalHomeView (tab: .home)
              ├── Sheet: TrainerDiscoveryView
              ├── Sheet: NotificationsView
              ├── Sheet: PublicTrainerProfileView
              ├── Sheet: WorkoutTemplatesView
              ├── Sheet: CheckInWizardView
              ├── Sheet: ProfileSettingsView
              ├── Sheet: AddDailyTargetView
              ├── Sheet: UpcomingSessionDetailView
              ├── Sheet: MyProgramDetailView
              ├── FullScreenCover: EducationalOnboardingView
              ├── FullScreenCover: TrainerFindingOnboardingView
              └── NavigationLink: CompletedSessionDetailView
```

---

## 2. iOS PersonalHomeView — Complete Feature Breakdown

### 2.1 Data Layer

#### ViewModels used:
| ViewModel | Source | Purpose |
|---|---|---|
| `ClientHomeViewModel` | `ViewModels/ClientHomeViewModel.swift` | Main dashboard data |
| `NotificationsViewModel` | `ViewModels/NotificationsViewModel.swift` | Notifications + pending link requests |
| `WorkoutManager` | `Managers/WorkoutManager.swift` | Session management, current streak, active routine |
| `AppState` | `Managers/AppState.swift` | Feature toggles (routines, daily targets), tab state |
| `AuthViewModel` | `ViewModels/AuthViewModel.swift` | User info (name, avatar) |
| `DailyTargetManager` | `Managers/DailyTargetManager.swift` | Daily targets CRUD |
| `LanguageManager` | (Utils) | i18n |

#### API Endpoints:

| Endpoint | Method | iOS Caller | Purpose |
|---|---|---|---|
| `GET /api/client/dashboard` | GET | `ClientHomeViewModel.fetchData()` | Main dashboard payload |
| `GET /api/client/program/active` | GET | `ClientHomeViewModel.fetchData()` | Active program with progress |
| `GET /api/notifications` | GET | `NotificationsViewModel.fetchNotifications()` | Notification list |
| `PUT /api/notifications/:id` | PUT | `NotificationsViewModel.markAsRead()` | Mark notification read |
| Accept link request | POST | `NotificationsViewModel.acceptRequest()` | Accept trainer link |
| Decline link request | POST | `NotificationsViewModel.declineRequest()` | Decline trainer link |
| `POST /api/client/trainer/link` | DELETE | `ClientHomeViewModel.unlinkTrainer()` | Unlink from trainer |
| `GET /api/auth/me` | GET | `PersonalHomeView.onAppear` | Sync profile (avatar, name) |

#### Dashboard Response Shape (from backend `route.schema.ts` + iOS model):
```typescript
{
  data: {
    clientData: {
      id: string,
      userId: string,
      name: string,
      email: string,
      trainer: { id: string, name: string, username: string, email: string } | null,
      workoutSessions: [{
        id: string,
        startTime: string (ISO date),
        endTime: string | null,
        status: string,
        name: string | null,
        exerciseLogs: any[]
      }],
      measurements: [{
        id: string,
        measurementDate: string,
        weightKg: number | null,
        bodyFatPercentage: number | null
      }],
      remainingCredits?: number  // iOS adds this
    },
    privacySettings: {
      shareWorkoutHistory: boolean,
      shareBodyMeasurements: boolean,
      shareCheckinNotes: boolean,
      shareLocation: boolean,
      allowTrainerExport: boolean,
      dataRetentionDays: number | null
    },
    weightUnit: string,
    upcomingClientSessions: [{
      id: string,
      title: string,
      date: string,
      duration: number,
      is_trainer_assigned?: boolean  // iOS adds this
    }],
    lastCheckIn: string (ISO date) | null  // From backend route.ts
  }
}
```

#### Active Program Response Shape:
```typescript
{
  data: {
    program: { id: string, name: string, description: string | null },
    progress: {
      completedCount: number,
      totalCount: number,
      progressPercentage: number,
      nextTemplateId: string | null
    },
    templates: [{
      id: string,
      name: string,
      description: string | null,
      order: number,
      status: "COMPLETED" | "NEXT" | "PENDING",
      exerciseCount: number
    }]
  } | null
}
```

---

### 2.2 Screen Layout (Top-to-Bottom)

#### **Floating Header** (`ZiroHeader`) — Always visible
```
┌──────────────────────────────────────┐
│ [Avatar] User Name         [🔔]      │
└──────────────────────────────────────┘
```
- **User avatar**: tappable → `ProfileSettingsView` (sheet)
- **Title**: User's name from `authViewModel.currentUser.name`
- **Notification bell**: Shows red dot badge if `unreadCount > 0`. Tap → `NotificationsView` (sheet)
- Background: `.ultraThinMaterial` blur
- Notifications refresh every 30s via timer

#### **Pull-to-Refresh** — ScrollView.refreshable
- Refreshes dashboard data, notifications, and syncs user profile

#### **Section 0: Trainer Invitation Hero** — Conditional
- **When**: `notificationsVM.pendingLinkRequest != nil`
- Shows blue-bordered card with:
  - Person badge plus icon
  - "COACH INVITATION" label
  - "New Request Received" title
  - Notification message text
  - **Accept & Connect** button (blue, full-width)
  - **Decline** button (red, 100pt wide)
- Animated entry/exit

#### **Section 1: Streak Motivation Hook** — Conditional
- **When**: `workoutManager.currentStreak > 0`
- Shows horizontal card with:
  - Flame icon in orange-red gradient circle
  - "X Day Streak!" headline
  - "You're on fire! Keep it up." caption
  - "HOT" badge (orange capsule)
- Background: secondary surface, corner radius 20

#### **Section 2a: Coach Card** — If trainer linked
- **When**: `viewModel.trainer != nil`
- Shows tappable card:
  - Person badge shield checkmark icon (blue circle)
  - "COACH" label (gray, caption)
  - Trainer name (headline)
  - Chevron right icon
  - Long-press context menu: "Disconnect Trainer" → confirmation alert
- Tap → `PublicTrainerProfileView` (sheet)

#### **Section 2b: Credit Status Widget** — If trainer + remainingCredits
- **When**: `trainer != nil && remainingCredits != nil`
- Shows purple ticket icon + "Session Credits" + "X Remaining"
- Purple icon in circle, background secondary, corner radius 16

#### **Section 2c: "Need a Coach?" Banner** — If no trainer
- **When**: `trainer == nil && !coachBannerDismissed`
- Blue-purple gradient banner:
  - "Need a Coach?" headline (white)
  - "Browse pro trainers or try our AI." caption
  - Arrow right icon
- Tap → `TrainerDiscoveryView` (sheet)
- **Swipe-left-to-dismiss** with drag gesture (persisted via `@AppStorage`)
- Animation: drag offset + opacity fade

#### **Section 3a: Active Routine Widget** — If routine active
- **When**: `appState.isRoutinesEnabled && workoutManager.activeRoutine != nil`
- Shows:
  - "Active Routine" label (blue, caption bold)
  - Routine name (headline)
  - "X/Y Sessions" counter
  - Progress bar (blue capsule)
  - Next template with play icon + name + exercise count
  - "START" button (blue capsule)

#### **Section 3b: Active Program Widget** — If no routine, but program active
- **When**: `viewModel.activeProgram != nil`
- Shows:
  - "Current Routine" label (blue)
  - Program name
  - "XX% Complete" with progress bar
  - Template list with status icons:
    - COMPLETED: green checkmark in circle
    - NEXT: blue dot in circle + "Start" button
    - PENDING: gray number + lock icon
  - Tap card → `MyProgramDetailView` (sheet)

#### **Section 3c: No Routine Placeholder** — If trainer but no program
- **When**: `trainer != nil && no activeProgram && no activeRoutine`
- Shows:
  - ECG document icon (orange)
  - "No Routine Assigned" text
  - "Awaiting your coach..." caption
  - **Quick Start** (blue, bolt icon) → empty workout session
  - **Templates** (purple, grid icon) → `WorkoutTemplatesView` (sheet)

#### **Section 4: Check-In Banner** — Always unless dismissed
- **If completed** (`isCheckInComplete && !dismissed`):
  - Green banner: "Check-in Complete" + "Your trainer will review it shortly."
  - Checkmark seal icon
  - Swipe-to-dismiss

- **If pending** (`!isCheckInComplete && !dismissed`):
  - Orange-pink gradient banner with shadow: "Weekly Check-in"
  - Subtitle depends on trainer status
  - Tap → `CheckInWizardView` (sheet)
  - Swipe-to-dismiss

- Check-in completion logic: last check-in date < 6 days ago

#### **Section 5: Upcoming Sessions** — Horizontal carousel
- **When**: `upcomingSessions` not empty
- "Upcoming" header (title3, bold)
- Horizontal `ScrollView` with session cards (160×140pt):
  - Date badge (day + month)
  - Calendar icon (or star if trainer-assigned)
  - "Coach Assigned" badge if trainer-assigned
  - Session title (headline, 2 lines max)
  - Duration "XX min"
  - Color: purple if trainer-assigned, blue otherwise
- Tap card → `UpcomingSessionDetailView` (sheet)

#### **Section 6: Daily Targets** — Feature-flagged
- **When**: `appState.isDailyTargetsEnabled`
- "Daily Targets" header + plus button (→ `AddDailyTargetView`)
- **Empty state**: "No daily targets set" + "Set a Daily Target" link
- **With targets**: List of `DailyTargetCard` widgets:
  - Exercise name + streak flame badge
  - "Day X of Y" for challenges
  - "A / B reps today" progress
  - Circular progress ring (blue gradient)
  - Quick-add buttons: +5, +10, +20, +1 (with haptic feedback)
  - Long-press to delete
- Targets persisted via `DailyTargetManager` (local storage)

#### **Section 7: Quick Actions** — Always visible
- "Actions" header (headline, gray)
- Two-button row:
  - **Quick Start**: bolt icon, blue → empty workout session
  - **Templates**: grid icon, purple → `WorkoutTemplatesView` (sheet)
- Both buttons: 90pt height, background secondary, corner radius 16

#### **Section 8: Recent History** — Always visible
- "Recent History" header (title3, bold)
- **Empty state**: dumbbell icon + "No workouts logged yet."
- **With data**: up to 3 `ClientHistoryRow` items:
  - Date column: month + day (red month, black day)
  - Session name + status ("Finished" / status)
  - Duration "XX min"
  - Chevron right icon
  - Background secondary, corner radius 16
- Tap → `CompletedSessionDetailView` (NavigationLink)

---

### 2.3 State Management

#### ClientHomeViewModel lifecycle:
1. **init**: Load cached dashboard data from `CacheManager`
2. **onAppear**: `fetchData()` → parallel fetch dashboard + active program
3. **Notification observers**:
   - `didSubmitCheckIn` → optimistic `lastCheckInDate = Date()` + refresh
   - `didFinishSession` → optimistic insert into recent history + refresh
   - `RefreshAthleteDashboard` → refresh
4. **Cache**: Save dashboard response to cache after successful fetch
5. **403 suppression**: Skip forbidden errors during background/ghost fetches

#### Optimistic update patterns:
- **Unlink trainer**: Remove trainer locally from dashboard data, then refresh from server
- **Finish workout**: Prepend new `ClientRecentSession` to history, then refresh
- **Submit check-in**: Set `lastCheckInDate` to now locally, then refresh

---

## 3. Flutter App — Current State

### What exists now:

```
lib/features/home/presentation/home_screen.dart (68 lines)
```
- AppBar with "ZIRO.FIT" title + logout button
- Center with icon + welcome text + "Start Workout" + "Explore Trainers" buttons
- NO data fetching, NO cubit, NO API integration
- **It's a placeholder**

### What the Flutter app already has that's reusable:

| Category | Asset | Status |
|---|---|---|
| **Networking** | Dio client + AuthInterceptor + ApiLoggerInterceptor | ✅ |
| **Auth** | AuthCubit (sealed states), AuthApiService, AuthRepository | ✅ |
| **DI** | get_it + injectable, injection.config.dart | ✅ |
| **Theme** | AppColors (8 tokens), AppTheme (Material3 light) | ✅ |
| **Explore** | ExploreCubit, ExploreApiService, ExploreScreen + widgets | ✅ |
| **Trainers** | TrainerApiService, TrainerDetailCubit, WorkoutSessionCubit | ✅ |
| **Router** | GoRouter with ShellRoute (bottom nav) + sub-routes | ✅ |
| **Sync** | SyncCubit with pull/push, Drift DB | ✅ |
| **Workout** | WorkoutSessionCubit, WorkoutSessionScreen (1716 lines) | ✅ |
| **Workout History** | WorkoutHistoryCubit, WorkoutHistoryScreen, CompletedSessionDetailScreen | ✅ |

### What needs to be built for home:

| Layer | Component | Notes |
|---|---|---|
| **Models** | `ClientDashboardResponse` (freezed) | Root DTO |
| | `ClientProfileData` (freezed) | Client data subset |
| | `ClientDashboardTrainer` (freezed) | Trainer info |
| | `ClientRecentSession` (freezed) | Session history item |
| | `ClientDashboardSession` (freezed) | Upcoming session |
| | `ActiveProgramResponse` (freezed) | Active program with templates |
| | `ProgramBasicInfo`, `ProgramProgress`, `ProgramTemplateStatus` (freezed) | Sub-models |
| | `DashboardMeasurement` (freezed) | Measurement data |
| **API** | `HomeApiService` (`@injectable`) | `fetchDashboard()`, `fetchActiveProgram()` |
| **Repository** | `HomeRepository` (`@singleton`) | Wrap API + optional caching |
| **Cubit** | `HomeCubit` with sealed `HomeState` | load, refresh, error handling |
| | `HomeState` (freezed) | initial, loading, loaded(data), error(msg) |
| **Screen** | `HomeScreen` (full rewrite) | Layout, floating header, scrollable content |
| **Widgets** | Multiple widget files | See section 4 below |

---

## 4. Flutter Implementation Specification

### 4.1 Directory Structure

```
lib/features/home/
├── cubit/
│   ├── home_cubit.dart           # HomeCubit
│   ├── home_state.dart           # HomeState (freezed sealed)
│   ├── home_state.freezed.dart   # Generated
├── data/
│   ├── home_api_service.dart     # HomeApiService (@injectable)
│   ├── home_repository.dart      # HomeRepository (@singleton)
│   ├── models/
│   │   ├── client_dashboard_response.dart    # + .freezed.dart + .g.dart
│   │   ├── client_profile_data.dart
│   │   ├── client_dashboard_trainer.dart
│   │   ├── client_recent_session.dart
│   │   ├── client_dashboard_session.dart
│   │   ├── active_program_response.dart
│   │   └── dashboard_measurement.dart
├── presentation/
│   ├── home_screen.dart          # Main screen
│   ├── widgets/
│   │   ├── ziro_header.dart             # Floating header
│   │   ├── invitation_hero_card.dart    # Trainer invitation
│   │   ├── streak_motivation_card.dart  # Streak display
│   │   ├── coach_card.dart              # Linked trainer card
│   │   ├── credit_status_widget.dart    # Credits remaining
│   │   ├── need_coach_banner.dart       # No trainer banner
│   │   ├── active_routine_widget.dart   # Routine display
│   │   ├── active_program_widget.dart   # Program with progress
│   │   ├── no_routine_placeholder.dart  # Empty routine state
│   │   ├── check_in_banner.dart         # Weekly check-in
│   │   ├── upcoming_sessions_carousel.dart  # Horizontal scroll
│   │   ├── daily_targets_section.dart   # Targets + cards
│   │   ├── quick_actions_row.dart       # Action buttons
│   │   └── recent_history_section.dart  # History list
```

### 4.2 HomeCubit State Design

```dart
@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState.initial() = HomeInitial;
  const factory HomeState.loading() = HomeLoading;
  const factory HomeState.loaded({
    required ClientDashboardResponse dashboard,
    required ActiveProgramResponse? activeProgram,
  }) = HomeLoaded;
  const factory HomeState.error(String message) = HomeError;
}
```

### 4.3 HomeCubit Behavior

```dart
@injectable
class HomeCubit extends Cubit<HomeState> {
  // Dependencies: HomeRepository, AuthCubit (for user info)

  void fetchDashboard() async {
    emit(HomeLoading());
    try {
      final dashboard = await _repository.fetchDashboard();
      final program = await _repository.fetchActiveProgram();
      emit(HomeLoaded(dashboard: dashboard, activeProgram: program));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  void refresh() async { /* similar but pull-to-refresh */ }
  void unlinkTrainer() async { /* optimistic + refresh */ }
}
```

### 4.4 Screen Layout Specification

#### Floating Header
```
┌──────────────────────────────────────┐
│ [Avatar] User Name         [🔔]      │
└──────────────────────────────────────┘
```
- Positioned: top of screen, above scrollable content
- Material: semi-transparent blur effect
- Avatar: 32×32 circle, tap → navigate to profile settings
- Bell: shows red dot if there are unread notifications (initially 0)
- Title: `authCubit.state.user.name` (fallback: "Home")

#### Scrollable Content Stack
All sections stacked vertically with 24pt spacing:

```
┌─ Content ───────────────────────────┐
│                                     │
│  ██ Invitation Hero Card ██         │  condition: pending link request
│                                     │
│  ██ Streak Motivation ██            │  condition: streak > 0
│                                     │
│  ██ Coach Card / Need Coach ██     │  condition: trainer != nil / nil
│  ██ Credit Status ██               │  condition: trainer + credits
│                                     │
│  ██ Active Program / Routine ██    │  condition: program exists
│  ██ No Routine Placeholder ██      │  condition: trainer but no program
│                                     │
│  ██ Check-In Banner ██             │  condition: !dismissed
│                                     │
│  ██ Upcoming Sessions ██           │  condition: sessions not empty
│  ┌────┐ ┌────┐ ┌────┐              │  horizontal scroll cards
│  └────┘ └────┘ └────┘              │
│                                     │
│  ██ Daily Targets ██               │  condition: feature flag enabled
│                                     │
│  ██ Quick Actions ██               │  always visible
│  [Quick Start] [Templates]          │
│                                     │
│  ██ Recent History ██              │  always visible (empty state)
│  ┌────────────────────┐             │
│  └────────────────────┘             │
│                                     │
└─────────────────────────────────────┘
```

### 4.5 Navigation / Route Integration

| Widget | Target | Flutter Route |
|---|---|---|
| Avatar tap | Profile/Settings | `/profile` (existing) |
| Bell tap | Notifications | New route: `/home/notifications` |
| Coach card tap | Trainer profile | `/trainer/:username` (existing) |
| Need coach tap | Trainer discovery | `/explore/discovery` (existing) |
| Templates tap | Workout templates | New route or existing `/workout/templates` |
| Check-in tap | Check-in wizard | New route: `/home/check-in` |
| Upcoming session tap | Session detail | `/workout/history/:id` (existing) |
| Active program tap | Program detail | New route: `/home/program` |
| Recent history tap | Completed session | `/workout/history/:id` (existing) |
| Quick start | Workout session | `/workout` (existing) |
| Daily target + | Add daily target | New sheet/route |

---

## 5. Implementation Order

### Phase 1: Data Layer (parallel)
1. Create all model files with freezed
2. Create `HomeApiService` with `fetchDashboard()` and `fetchActiveProgram()`
3. Create `HomeRepository`

### Phase 2: State Layer
4. Create `HomeCubit` with sealed `HomeState`
5. Register in DI (`injectable`)

### Phase 3: UI Layer (parallel)
6. Build `ZiroHeader`
7. Build `HomeScreen` shell (floating header + scrollable)
8. Build content sections (each section as separate widget):
   - Widgets 3a-3i: All the conditional cards and sections
9. Wire navigation + interactions

### Phase 4: QA
10. Run `dart analyze` — zero errors
11. Run `flutter test` — all pass
12. Verify against AGENTS.md quality gates

---

## 6. Key Differences iOS → Flutter

| Aspect | iOS | Flutter Plan |
|---|---|---|
| State management | Combine (ObservableObject) | flutter_bloc (Cubit) |
| DI | Manual environmentObject injection | get_it + injectable |
| Models | Codable structs | freezed data classes |
| Navigation | Sheets + NavigationLinks | GoRouter routes + sheets |
| Caching | CacheManager (custom) | Drift DB or simple in-memory |
| Notifications | NotificationsViewModel | Separate NotificationsCubit (new) |
| Daily targets | DailyTargetManager (local) | Local state or Cubit |
| Streak | WorkoutManager | WorkoutSessionCubit or HomeCubit |
| Optimistic updates | Property mutation + refresh | Emit updated state + refresh |
| Pull-to-refresh | .refreshable | RefreshIndicator |
| Swipe-to-dismiss | DragGesture + @AppStorage | Dismissible + SharedPreferences |

---

## 7. Backend Contract Verification

All Flutter models must match these backend Zod schemas:

### `GET /api/client/dashboard` → `ClientDashboardResponse`
- `clientData.id`: string (required)
- `clientData.name`: string (required)
- `clientData.email`: string (required)
- `clientData.trainer`: nullable object with `{ name(string|null), username(string), email(string) }`
- `clientData.workoutSessions`: array of session objects
- `clientData.measurements`: array of measurement objects
- `upcomingClientSessions`: array of `{ id, title, date, duration }`
- `lastCheckIn`: ISO date string or null
- `weightUnit`: string

**Note from backend `route.ts`**: The backend adds `isTrainerLed` to upcoming sessions and `isTrainerLed` to recent sessions. The `trainer` inside `clientData` also includes `id`. iOS adds `remainingCredits` (clientData) and `is_trainer_assigned` (upcoming sessions) — these are iOS extensions. Only use what the backend returns.

### `GET /api/client/program/active` → nullable `ActiveProgramResponse`
- `program.id`, `program.name`, `program.description` (nullable)
- `progress.completedCount`, `progress.totalCount`, `progress.progressPercentage`, `progress.nextTemplateId` (nullable)
- `templates[]` with `id, name, description(nullable), order, status("COMPLETED"|"NEXT"|"PENDING"), exerciseCount`
- Returns `null` (HTTP 200 with `{ data: null }`) if no active program

---

## 8. Feature Flag Mapping

These iOS feature flags exist in `AppState`. In Flutter, decide storage:

| iOS @AppStorage key | Type | Default | Flutter equivalent |
|---|---|---|---|
| `hasSeenEducationalOnboarding` | Bool | false | SharedPreferences |
| `hasSeenTrainerFinding` | Bool | false | SharedPreferences |
| `isDailyTargetsEnabled` | Bool | false | SharedPreferences |
| `isRoutinesEnabled` | Bool | false | SharedPreferences |
| `coachBannerDismissed` | Bool | false | SharedPreferences |
| `checkInBannerDismissed` | Bool | false | SharedPreferences |
