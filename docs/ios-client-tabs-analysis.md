# iOS App Client Mode — Tab Structure Analysis

> **Source**: `V:\Ziro-Fit\Ziro Fit\` (iOS Swift/SwiftUI reference app)
> **Analyzed**: 2026-06-24
> **Purpose**: Inform Flutter (`V:\zf-fl`) parity implementation

---

## 1. Overview: Dual-Mode Architecture

The iOS app operates in **two modes**, toggled via a custom tab bar slide-up:

| Mode | Enum | Display Name | Tab Layout |
|---|---|---|---|
| Professional | `.trainer` | **Professional** | Calendar · Programs · Home · Clients · More |
| Personal | `.personal` | **Personal** | **Explore · Workouts · Home · Analytics · More** |

Mode switching is persisted via `@AppStorage("lastUsedAppMode")` and defaults to `.trainer`.

**Client mode = `.personal`** — this is what the Flutter app should replicate.

---

## 2. Tab Bar Configuration (Client Mode)

**File**: `V:\Ziro-Fit\Ziro Fit\Views\Common\CustomTabBar.swift`

### 2.1 Tab Definitions

```swift
enum AppTab: String, CaseIterable {
    case programs  = "sparkles"          // → Explore
    case clients   = "clock"             // → Workouts
    case home      = "house.fill"        // → Home (center)
    case analytics = "chart.xyaxis.line" // → Analytics
    case more      = "ellipsis.circle"   // → More/Profile
}
```

### 2.2 Tab Order & Icon Mapping (Personal mode)

| Index | Route Key | SF Symbol | Display Title | iOS View |
|---|---|---|---|---|
| 0 | `.programs` | `sparkles` | **Explore** | `PersonalExploreView` |
| 1 | `.clients` | `clock` | **Workouts** | `WorkoutHistoryView` |
| 2 | `.home` | `house.fill` | **Home** (center) | `PersonalHomeView` |
| 3 | `.analytics` | `chart.xyaxis.line` | **Analytics** | `PersonalAnalyticsView` |
| 4 | `.more` | `ellipsis.circle` | **More** | `MoreView` |

### 2.3 Tab Bar UI

- Custom bottom tab bar (`CustomTabBar`) with `.ultraThinMaterial` background
- Rounded capsule shape (cornerRadius: 40)
- Selected tab has capsule background with `matchedGeometryEffect` spring animation
- Unread notification badge overlays on the **Home** tab icon
- Drag gesture to toggle between Personal/Professional mode
- Tap on handle to expand mode selector (shows both mode options with icons)
- Tab bar hidden during active workout (shows mini-player instead)

---

## 3. Tab 1: Explore (`PersonalExploreView`)

**File**: `V:\Ziro-Fit\Ziro Fit\Views\ZiroMe\PersonalExploreView.swift`
**Flutter counterpart**: `/explore` → `ExploreScreen`

### 3.1 Header / Navigation

- **ExploreCityHeader**: Floating glass header with:
  - City selector (current location or selected city)
  - Search button → opens `TrainerDiscoveryView`
  - Map button → opens `TrainerMapView`

### 3.2 Segmented Control: Trainers | Events

Telegram-style capsule segmented control (`ExploreSlidingSegment`).

### 3.3 Trainers Tab Content

| Section | Component | Description |
|---|---|---|
| Featured Specialist Hero | `TrainerSpotlightHeroCard` | Large hero card of the top featured trainer with gradient background, bio, rating, "View Profile" CTA |
| Browse by Category | `ExploreCategoryFilter` | Horizontal scroll of category pills with icons + colors (e.g., Strength, Yoga, HIIT) |
| Trending Searches | `TrendingTagsView` | "TRENDING SEARCHES" section with hashtag-style chips (#Strength, #Yoga, etc.) |
| Trainers Near You | Horizontal scroll of `ExploreTrainerCard` | Each card: avatar (144x144), rating overlay, name, specialty, location. "See All" opens discovery with location filter |
| Featured Trainers | Horizontal scroll of `ExploreTrainerCard` | Same card style. "FEATURED" or "ZIRO_RECOMMENDED" badge on cards |
| Ziro Recommends | Horizontal scroll of `ExploreTrainerCard` | Same card style with "Ziro Recommends" badge |
| Interactive Match Map | `MapSpotlightPreviewCard` | CTA card showing "X elite coaches online near you" opens `TrainerMapView` |

### 3.4 Events Tab Content

| Section | Component | Description |
|---|---|---|
| Featured Events | `ExploreFeaturedCarousel` | Horizontal carousel of `FeaturedEventCard` with image, gradient overlay, organizer pill, FREE badge, date/time, location, highlights, capacity bar |
| Upcoming Events | `ExploreEventRow` | List grouped by date sections (Today/Tomorrow/Date). Each row: event image or date widget, title, organizer, time, price, location, highlights, "Selling out" badge |

### 3.5 Sheets / Modals

| Trigger | Sheet | Description |
|---|---|---|
| City tap | `CityPickerSheet` | Current location + list of cities with selection |
| Search / See All / Trending tag | `TrainerDiscoveryView` | Full-screen search with segmented Specialists\|Events, search bar, filters (sort, location, specialty, min rating), paginated results |
| Map button | `TrainerMapView` | Map with trainer and event annotations |
| Trainer card tap | `PublicTrainerProfileView` | Trainer detail (About, Packages, Photos, Reviews, Schedule tabs) |
| Event card tap | `EventDetailView` | Event detail with hero image, attendance bar, date/time, location map, description, enroll CTA |

### 3.6 API Data

- Fetched via `ExploreViewModel`:
  - `GET /api/trainers` — paginated trainer search
  - `GET /api/explore/promoted-trainers` — featured/recommended trainers
  - Explore metadata (cities, categories)
  - Events data

---

## 4. Tab 2: Workouts (`WorkoutHistoryView`)

**File**: `V:\Ziro-Fit\Ziro Fit\Views\ZiroMe\WorkoutHistoryView.swift`
**Flutter counterpart**: Currently mapped to `/workout` → `WorkoutSessionScreen` (wrong — should be history)

### 4.1 Header

- **ZiroHeader** with title "Workouts"
- Trailing buttons:
  - Routines icon → `MyRoutinesView` (when `isRoutinesEnabled`)
  - Calendar icon → `WorkoutCalendarSheet` for date filtering
  - Clear button (active when date filter applied)

### 4.2 Content Sections

| Section | Component | Description |
|---|---|---|
| This Week Summary | HStack | Shows weekly workout count with chart icon |
| Search | `.searchable` modifier | Search exercises, notes, session names |
| Filtered History | Grouped `LazyVStack` | Sessions grouped by date (collapsible sections), each session rendered as `RecentWorkoutRow` (date, name, duration, status) — tap opens `CompletedSessionDetailView` |

### 4.3 Empty State

- Large calendar icon with "No workout history found" message
- "This Week" summary still shows even when empty

### 4.4 Context Menu

- Long press session → "Delete Workout" (destructive)

### 4.5 Sheets / Modals

| Trigger | Sheet |
|---|---|
| Calendar icon | `WorkoutCalendarSheet` — date picker |
| Routines icon | `MyRoutinesView` — build/schedule routines |
| Templates icon | `WorkoutTemplatesView` |

### 4.6 API Data

- `workoutManager.fetchPersonalHistory()` — fetches completed sessions
- `workoutManager.completedSessions` — local + remote
- `viewModel.fetchTemplates()`

---

## 5. Tab 3: Home (`PersonalHomeView`) — Center Tab

**File**: `V:\Ziro-Fit\Ziro Fit\Views\ZiroMe\PersonalHomeView.swift`
**Flutter counterpart**: `/` → `HomeScreen`

### 5.1 Header

- **ZiroHeader**: User's name + avatar (tappable → `ProfileSettingsView`)
- Bell icon (tappable → `NotificationsView`) with unread count badge

### 5.2 Content Sections (in order)

| # | Section | Condition | Description |
|---|---|---|---|
| — | Trainer Invitation Hero | Pending link request | Card with Accept & Connect / Decline buttons |
| 0 | Streak Motivation | Streak > 0 | "X Day Streak!" with flame icon + "HOT" badge |
| 1a | Coach Card | Trainer linked | Card showing coach name, "COACH" label, chevron. Context menu: "Disconnect Trainer" |
| 1b | Credit Status | Trainer linked + credits exist | Shows remaining sessions/credits |
| 1c | Need a Coach? | No trainer + banner not dismissed | Gradient banner, opens `TrainerDiscoveryView`. Swipeable to dismiss |
| 2a | Active Routine | Routines enabled + routine active | Shows routine progress, "Start" for next template |
| 2b | Active Program | Active program exists | Shows program progress bar, opens `MyProgramDetailView` |
| 2c | No Routine Placeholder | Trainer linked but no routine | "No Routine Assigned" with Quick Start + Templates buttons |
| 3a | Check-in Complete Banner | Check-in done + not dismissed | Green card "Check-in Complete". Swipeable |
| 3b | Weekly Check-in Banner | Check-in pending + not dismissed | Orange gradient card, opens `CheckInWizardView`. Swipeable |
| 4 | Upcoming Sessions | Sessions exist | Horizontal scroll cards: date, title, duration, coach badge. Tap opens `UpcomingSessionDetailView` |
| 5 | Daily Targets | `isDailyTargetsEnabled` | List of targets with progress. Plus button to add |
| 6 | Quick Actions | Always | Quick Start (empty session) + Templates |
| 7 | Recent History | Always (empty state if none) | Up to 3 recent sessions. Tap opens `CompletedSessionDetailView` |

### 5.3 Sheets / Modals

| Trigger | Sheet |
|---|---|
| Bell icon | `NotificationsView` |
| Coach card / Need a Coach | `PublicTrainerProfileView` / `TrainerDiscoveryView` |
| Templates | `WorkoutTemplatesView` |
| Quick Start | Starts `WorkoutManager` → `WorkoutSessionView` full-screen |
| Check-in banner | `CheckInWizardView` (4-step wizard) |
| Avatar tap | `ProfileSettingsView` |
| Upcoming session tap | `UpcomingSessionDetailView` |
| Active program tap | `MyProgramDetailView` |
| Daily target add | `AddDailyTargetView` |
| Onboarding | `EducationalOnboardingView` → `TrainerFindingOnboardingView` |

### 5.4 Refresh / Polling

- Pull-to-refresh fetches dashboard + notifications + user profile
- 30-second timer for notification refresh while on screen
- Listens to `willEnterForegroundNotification` — refreshes notifications

---

## 6. Tab 4: Analytics (`PersonalAnalyticsView`)

**File**: `V:\Ziro-Fit\Ziro Fit\Views\ZiroMe\PersonalAnalyticsView.swift`
**Flutter counterpart**: **MISSING** — no Analytics tab exists

### 6.1 Header

- **ZiroHeader** with title "Analytics"
- Trailing buttons:
  - Widget grid icon → `ManageWidgetsView` (reorder/enable/disable widgets)
  - Clipboard/pencil icon → `MeasurementsView` (body measurements history)

### 6.2 Content

| Widget Type | Title | Description |
|---|---|---|
| Performance Summary | Summary card | Volume, consistency %, current streak, longest streak, trends |
| Workouts Activity | `InteractiveBarChart` | Workouts per week bar chart |
| Consistency | Progress bar | % consistency last 30 days |
| Volume Progression | `InteractiveLineChart` | Volume over time |
| Muscle Focus | `InteractiveDonutChart` | Muscle group distribution |
| Recent PRs | List | Personal records with exercise name, value, date |
| Activity Heatmap | `HeatMapWidget` | GitHub-style 365-day activity heatmap |
| Fitness Goal | `FitnessGoalPlaceholder` | Set/view fitness goal |
| Personal Insights | Text | AI-generated volume comparison |
| Recovery & Load | Placeholder | Under development |
| Weight History | `InteractiveLineChart` | Body weight from check-ins |

### 6.3 Widget System

- Widgets are **configurable**: users can add/remove/reorder via `ManageWidgetsView`
- Widget visibility persisted via `viewModel.widgets` with `isVisible` and `order` properties
- Tap on widget → `WidgetDetailView` for expanded view

### 6.4 Sheets / Modals

| Trigger | Sheet |
|---|---|
| Widget grid icon | `ManageWidgetsView` |
| Clipboard icon | `MeasurementsView` |
| Widget tap | `WidgetDetailView` |
| PR exercise tap | `MovementDetailView` |

### 6.5 API Data

- Fetched via `PersonalAnalyticsViewModel.loadData(days: 30)`
- Volume data, frequency data, muscle data, PRs, weight data, heatmap dates, consistency score

---

## 7. Tab 5: More (`MoreView`)

**File**: `V:\Ziro-Fit\Ziro Fit\Views\Common\MoreView.swift`
**Flutter counterpart**: `/profile` → `ProfileScreen` (currently minimal scaffold)

### 7.1 Header

- **ZiroHeader** with title "More"

### 7.2 Content Sections

#### Profile Section (top)
- User avatar + name + email
- Account type badge ("PERSONAL" blue / "PRO" orange)
- Chevron → opens `ProfileSettingsView` (clients) or `MarketplaceManagerView` (trainers)
- Pull-to-refresh updates profile data

#### Preferences

| Row | Destination View |
|---|---|
| Appearance | `AppearanceSettingsView` |
| AI Coach Settings | `VoiceSettingsView` |
| Language | `LanguageSettingsView` |
| Notifications | `NotificationSettingsView` |
| Permissions | `PermissionsSettingsView` |
| Data & Privacy | `DataPrivacyView` |
| My Packages | `ClientPackagesView` |
| Purchase History | `TransactionHistoryView` |
| Privacy & Security | `PrivacySecuritySettingsView` |
| Dashboard Prompts | `DashboardPromptsView` |
| Custom App Mode (toggle) | Enables drag/tap mode switching |

#### Experimental Features

| Toggle | Description |
|---|---|
| Daily Exercise Targets | Set and track daily rep goals |
| Voice Feedback (Beta) | Audio confirmation for voice logs |
| Personal Routines | Build and schedule multi-session routines |

#### Resources (client mode)

| Row | Destination |
|---|---|
| Custom Exercises | `CustomExercisesView` |
| Contact Support & Feedback | `ContactFormView` |
| What's New | `WhatsNewView` |
| Getting Started Guide | `EducationalOnboardingView` |

#### Legal

- Terms of Service (`https://ziro.fit/terms`)
- Privacy Policy (`https://ziro.fit/privacy-policy`)

#### Sign Out

- Red icon + "Sign Out" button → `viewModel.logout()`

#### Brand Footer

- Ziro logo, version number, acknowledgements, terms/privacy links, copyright

### 7.3 Trainer-only Rows (hidden in client mode)

- Digital Business Card (QR code)
- Storefront Settings
- Subscription & Billing
- Payouts
- Assessments

---

## 8. Cross-Reference: iOS vs Flutter Current State

### 8.1 Tab Comparison

| Position | iOS (Personal) | Flutter (Current) | Status |
|---|---|---|---|
| Tab 1 | **Explore** | **Explore** | ✅ Implemented |
| Tab 2 | **Workouts** (history) | **Workout** (session screen) | ❌ Misaligned |
| Tab 3 | **Home** (center) | **Home** | ⚠️ Partial |
| Tab 4 | **Analytics** | **Missing** | ❌ No tab |
| Tab 5 | **More** | **Profile** (scaffold only) | ❌ Minimal |

### 8.2 ShellRoute in Flutter

```dart
// Current Flutter bottom nav: 4 items
BottomNavigationBarItem(label: 'Home')     -> '/'
BottomNavigationBarItem(label: 'Workout')  -> '/workout'
BottomNavigationBarItem(label: 'Explore')  -> '/explore'
BottomNavigationBarItem(label: 'Profile')  -> '/profile'
```

### 8.3 Full-Screen Routes Status

| iOS View | Flutter Route | Status |
|---|---|---|
| `TrainerDiscoveryView` | `/explore/discovery` | ✅ |
| `TrainerMapView` | `/explore/map` | ✅ |
| `EventDetailView` | `/explore/event/:id` | ✅ |
| `PublicTrainerProfileView` | `/trainer/:username` | ✅ |
| `CompletedSessionDetailView` | `/workout/history/:id` | ✅ |
| `WorkoutHistoryView` | `/workout/history` | ✅ |
| `NotificationsView` | `/home/notifications` | ✅ |
| `WorkoutSessionView` | `/workout` | ✅ |
| `UpcomingSessionDetailView` | — | ❌ Missing |
| `MyProgramDetailView` | `/home/program-detail` | ❌ Placeholder |
| `CheckInWizardView` | `/home/check-in` | ❌ Placeholder |
| `ProfileSettingsView` | — | ❌ Missing |
| `WorkoutTemplatesView` | — | ❌ Missing |
| `MyRoutinesView` | — | ❌ Missing |
| `MeasurementsView` | — | ❌ Missing |
| `ManageWidgetsView` | — | ❌ Missing |
| `WidgetDetailView` | — | ❌ Missing |
| `MovementDetailView` | — | ❌ Missing |
| `ClientPackagesView` | — | ❌ Missing |
| `TransactionHistoryView` | — | ❌ Missing |

---

## 9. Key Architectural Patterns

### 9.1 ViewModel to Cubit Mapping

| iOS ViewModel | Flutter Cubit | Purpose |
|---|---|---|
| `ClientHomeViewModel` | `HomeCubit` | Dashboard data, active program, trainer info |
| `ExploreViewModel` | `ExploreCubit` | Trainer/event discovery, categories, cities |
| `PersonalAnalyticsViewModel` | — | Analytics data, widgets configuration |
| `TrainerDiscoveryViewModel` | — | Trainer search, filtering, pagination |
| `WorkoutManager` | `WorkoutSessionCubit` | Session state, exercises, sets, rest timer |
| `NotificationsViewModel` | `NotificationsCubit` | Notifications list, accept/decline |
| `CheckInViewModel` | — | Check-in wizard state |
| `ProgramsViewModel` | — | Templates, programs |

### 9.2 Navigation Patterns

- iOS: **Sheets** for sub-screens with custom `ZiroSheetHeader`
- Flutter: **Full-screen routes** with slide-up transitions (`CustomTransitionPage`)
- iOS: Tab selection + all views stacked in ZStack with opacity switching (pre-loaded)
- Flutter: `ShellRoute` with `BottomNavigationBar`

### 9.3 Experimental Feature Flags (iOS AppState)

```swift
isDailyTargetsEnabled   // Daily exercise targets
isVoiceLogEnabled       // Voice log input
isVoiceFeedbackEnabled  // Audio confirmation
isRoutinesEnabled       // Personal routines builder
```

---

## 10. Sub-Screen Details

### 10.1 TrainerDiscoveryView

- **Segmented**: Specialists | Events
- **Header**: Title "Discover specialists and events", search bar, filter button
- **Filters**: Sort By, Location, Specialty pills, Min Rating slider
- **Results**: Infinite scroll with `loadMore()`
- **Cards**: Avatar (80x80), name, specialties, location, rating, review count

### 10.2 PublicTrainerProfileView

- Banner + avatar overlay (96x96)
- Stats row: Reviews, Programs, Rating
- Actions: "Custom Program" + "Connect" / "Connected" / "Pending Approval"
- Tabs: About | Packages | Photos | Reviews | Schedule
  - **About**: Bio, Philosophy, Methodology, Specialties chips, Services, Links
  - **Packages**: Membership cards with session count, price, purchase CTA
  - **Photos**: Transformation photos grid
  - **Reviews**: Testimonials with star ratings
  - **Schedule**: Weekly availability grid with day selector

### 10.3 EventDetailView

- Hero image (250px), title, host name
- Attendance bar (enrolled/spots left)
- Date/time + location with map
- "About" description
- Bottom enrollment CTA with price

### 10.4 CheckInWizardView (4-Step)

| Step | Content |
|---|---|
| 0 (Quantitative) | Weight (kg), Waist (cm), Avg Sleep (hrs) |
| 1 (Qualitative) | Energy, Stress, Hunger, Digestion (1-10), Nutrition Compliance |
| 2 (Photos) | Progress photos (front, side, back) |
| 3 (Notes) | Weekly notes for trainer |
| Success | Green checkmark, "Check-in Submitted!" |

### 10.5 WorkoutSessionView

- Drag-to-dismiss header with rest timer, template save
- Exercise list with sets (weight/reps/RPE/tempo)
- Controls: Add set, complete exercise, finish, cancel
- Input overlays: NumericKeyboard, PlateCalculator, RPE Picker
- Voice coach: Dictation mode + AI Coach mode
- Rest timer: Sheet with countdown

### 10.6 MyProgramDetailView

- Program name + progress (completed/total + %)
- Progress bar
- Horizontal week-by-week timeline with session cards
- Status per template: COMPLETED, NEXT (startable), PENDING (locked)
- "Add All to Calendar" button

### 10.7 UpcomingSessionDetailView

- Session name, date/time, trainer name, duration
- Exercise list with reps, weight, tempo, notes, video links
- "Add to My Calendar" button

---

## 11. Recommendations for Flutter Parity

### 11.1 High Priority

1. **Add Analytics tab** to bottom nav (5 tabs, matching iOS)
2. **Rework Workout tab** to show workout history (not the session screen)
3. **Rework Profile tab** into full "More" screen with all settings sections
4. **Replace placeholder routes** (`/home/check-in`, `/home/program-detail`)

### 11.2 Medium Priority

5. Add missing sub-screens: ProfileSettings, UpcomingSessionDetail, WorkoutTemplates, CheckInWizard, ClientPackages
6. Add analytics widgets system: configurable, reorderable widgets
7. Add check-in wizard as full-screen sub-route from Home

### 11.3 Lower Priority

8. EducationalOnboarding and TrainerFindingOnboarding flows
9. MyRoutinesView (personal routine builder)
10. Measurement tracking (MeasurementsView, MeasurementHistoryView)
11. MovementDetailView (per-exercise analytics)

---

## 12. Swift File Index (Client Mode)

| Category | Files |
|---|---|
| **Main Tab Views** | `MainTabView.swift`, `CustomTabBar.swift` |
| **Home Tab** | `PersonalHomeView.swift` |
| **Explore Tab** | `PersonalExploreView.swift`, `ExploreComponents.swift`, `TrainerDiscoveryView.swift`, `TrainerMapView.swift` |
| **Workouts Tab** | `WorkoutHistoryView.swift` |
| **Analytics Tab** | `PersonalAnalyticsView.swift` |
| **More Tab** | `MoreView.swift` |
| **Auth** | `LoginView.swift`, `SignupView.swift`, `ForgotPasswordView.swift`, `UpdatePasswordView.swift` |
| **Workout Session** | `WorkoutSessionView.swift`, `WorkoutSessionContent.swift`, `WorkoutSessionHeader.swift`, `WorkoutSessionControls.swift`, `WorkoutSetRow.swift`, `WorkoutExerciseCard.swift` |
| **Client Specific** | `ClientPackagesView.swift`, `MyProgramDetailView.swift`, `UpcomingSessionDetailView.swift` |
| **Sheets/Modals** | `NotificationsView.swift`, `EventDetailView.swift`, `PublicTrainerProfileView.swift`, `CheckInWizardView.swift`, `WorkoutTemplatesView.swift`, `MyRoutinesView.swift`, `RoutineBuilderView.swift`, `RoutineSchedulerView.swift` |
| **Analytics Comp.** | `ManageWidgetsView.swift`, `MeasurementsView.swift`, `MeasurementHistoryView.swift`, `MovementDetailView.swift`, `WidgetDetailView.swift`, `GoalSettingView.swift` |
| **Settings** | `ProfileSettingsView.swift`, `AppearanceSettingsView`, `VoiceSettingsView.swift`, `DataPrivacyView.swift`, `TransactionHistoryView.swift`, `DashboardPromptsView.swift` |
| **Components** | `ZiroHeader.swift`, `ZiroSheetHeader.swift`, `CreditStatusWidget.swift`, `ActiveProgramWidget.swift`, `ActiveRoutineWidget.swift`, `RestTimerSheet.swift`, `RestTimerProgressBar.swift`, `PlateCalculatorOverlay.swift`, `RPEPickerOverlay.swift`, `WorkoutNumericKeyboard.swift`, `RecentWorkoutRow.swift`, `DailyTargetCard.swift`, `SessionCard.swift`, `ErrorState.swift`, `ListSkeleton.swift` |
| **Models** | `AppMode.swift`, `User.swift`, `DashboardModels.swift`, `ClientDashboardModels.swift`, `ExploreModels.swift`, `ActiveProgramItem.swift`, `NotificationModel.swift`, `WorkoutModels.swift`, `DailyTarget.swift`, `CheckInModels.swift`, `BookingModels.swift`, `AnalyticsWidget.swift`, `AnalyticsModels.swift`, `FitnessGoal.swift`, `Exercise.swift` |
| **Managers** | `AppState.swift`, `WorkoutManager.swift`, `NotificationManager.swift`, `SyncManager.swift`, `LocationManager.swift`, `SubscriptionManager.swift`, `DailyTargetManager.swift`, `AnalyticsManager.swift` |

---

> **Note**: All references to iOS files are relative to `V:\Ziro-Fit\Ziro Fit\`.
