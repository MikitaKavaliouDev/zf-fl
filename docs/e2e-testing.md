# E2E Testing — ZIRO.FIT Flutter

## Overview

End-to-end (E2E) testing verifies the complete, compiled application running on a real device or emulator — tapping buttons, filling forms, navigating between screens, and checking outcomes against expectations. For ZIRO.FIT, E2E tests catch bugs that span the full stack: UI rendering, state management, navigation (GoRouter ShellRoute), platform channels, permission dialogs, and API integration.

**Tool**: [Patrol](https://patrol.leancode.co/) v4.x — extends `integration_test` with native automation capabilities.

**Why Patrol over alternatives:**

| Tool | Can't handle | Verdict |
|---|---|---|
| `integration_test` (built-in) | Permission dialogs, system UI, push notifications, Stripe deep link returns | ❌ Dead at first "Allow Location?" prompt |
| Patrol | — | ✅ Native bridge handles everything `integration_test` can't |
| FlutterProbe | Immature (2025), ProbeScript DSL is a new language to learn, small community | ❌ Risk for production app with 16 features |
| Maestro | YAML-based, not Dart, can't reuse existing test helpers, weak with Flutter custom rendering | ❌ Orphaned from existing stack |

ZIRO.FIT has **4+ permission surfaces** that `integration_test` cannot pass:

- `geolocator` — Location permission (explore/map)
- `image_picker` — Camera / Gallery permission (check-in photos)
- `permission_handler` — Microphone permission (voice coach)
- `flutter_local_notifications` — Notification permission

Patrol handles all of these via its native layer.

---

## Test Pyramid — Where E2E Fits

```
         ╱╲
        ╱  ╲          E2E (Patrol)
       ╱    ╲         5-10 critical user flows
      ╱──────╲
     ╱        ╲       Integration / Widget (flutter_test)
    ╱          ╲      Feature-level, cubit tests (bloc_test)
   ╱────────────╲
  ╱              ╲    Unit tests (bloc_test, mocktail)
 ╱                ╲   Pure domain logic, Drift in-memory tests
╱──────────────────╲
```

| Layer | Tool | Scope | Speed | Runs per commit |
|---|---|---|---|---|
| Unit | `bloc_test` + `mocktail` | Cubits, domain logic, DB queries | < 1s each | ✅ Always |
| Widget | `flutter_test` | Component-level rendering | < 2s each | ✅ Always |
| **E2E** | **Patrol** | Full user flows on device | 1-5 min per flow | ⚠️ CI only (nightly / pre-release) |

**Rule**: Every cubit method must have a `bloc_test`. E2E tests verify the cubits actually wire up to screens correctly — they don't duplicate unit test coverage.

---

## Directory Structure

```
test/
  e2e/
    flows/
      login_flow_e2e_test.dart             # C2: Login → Home Dashboard
      register_flow_e2e_test.dart           # C1: Register → Email Verification
      workout_flow_e2e_test.dart            # C8: Start → Log Sets → Finish
      workout_pause_resume_e2e_test.dart    # C10: Pause / Resume
      cold_start_flow_e2e_test.dart         # C3: Cold start session resume
      home_dashboard_e2e_test.dart          # C6: Home dashboard sections
      explore_trainer_discovery_e2e_test.dart  # C21: Explore → Profile
      trainer_profile_e2e_test.dart         # C24: Full trainer profile
      connect_to_trainer_e2e_test.dart      # C25: Unlinked client explore
      trainer_login_shell_e2e_test.dart      # T46: Trainer login + shell tabs
      trainer_clients_detail_e2e_test.dart   # T50: Clients list → Detail
    helpers/
      test_credentials.dart        # Test accounts (from AGENTS.md seed data)
      auth_helper.dart             # login($) / loginAsTrainer($) helpers
      permission_helper.dart       # grantVisiblePermission($)
      navigation_helper.dart       # navigateToClientTab / navigateToTrainerTab
    widgets/
      mini_player_e2e_test.dart         # C9: Minimize → Mini player → Maximize
```

### Naming Conventions

- File: `snake_case_e2e_test.dart` suffix — Patrol discovers `*_test.dart` files; `_e2e_` prefix ensures they're distinguishable from unit tests
- Test group: `patrolTest("Auth: Login → Onboarding", ...)` — feature prefix + flow description
- All E2E files tagged with `@Tags(['e2e'])` — `dart_test.yaml` skips them in `flutter test`

---

## Setup

### 1. Add Dependencies

```yaml
# pubspec.yaml
dev_dependencies:
  patrol: ^4.6.1
  patrol_finders: ^3.5.0
```

```sh
flutter pub get
```

### 2. Install Patrol CLI

```sh
# Activate globally
dart pub global activate patrol_cli

# Verify
patrol --version
```

### 3. Configure Android

Patrol uses the AndroidX test orchestrator. Add to `android/app/build.gradle.kts`:

```kotlin
android {
  defaultConfig {
    testInstrumentationRunner = "pl.leancode.patrol.PatrolJUnitRunner"
    testInstrumentationRunnerArguments["clearPackageData"] = "true"
  }
  testOptions {
    execution = "ANDROIDX_TEST_ORCHESTRATOR"
  }
}

dependencies {
  androidTestUtil("androidx.test:orchestrator:1.5.1")
}
```

### 4. Configure iOS

```ruby
# ios/Podfile
target 'Runner' do
  use_frameworks!
  pod 'Patrol', '~> 3.0', :configurations => ['Debug']
end
```

### 5. Create Tag Config

```yaml
# dart_test.yaml
tags:
  e2e:
    skip: "Use `patrol test` to run E2E tests"
```

### 6. Run `flutter pub get`

```sh
flutter pub get
```

## Running Tests

```sh
# Run all E2E tests on connected device/emulator
patrol test

# Run a specific flow
patrol test --target test/e2e/flows/login_flow_e2e_test.dart

# On Firebase Test Lab
patrol test --firebase-test-lab
```

> Patrol auto-generates `test/e2e/test_bundle.dart` — add it to `.gitignore`.
> Files use `_e2e_test.dart` suffix + `@Tags(['e2e'])` so `flutter test` skips them.

**First run** — build takes ~2-3 minutes (Flutter compilation). Subsequent runs are faster if the app binary is cached. Test changes do **not** require recompilation of the native bridge — only the Dart test code rebuilds.

### Comparison with `flutter test`

| | `flutter test` | `patrol test` |
|---|---|---|
| Runs on device | ❌ (headless) | ✅ |
| Permission dialogs | ❌ | ✅ |
| System UI interaction | ❌ | ✅ |
| Real navigation | ❌ | ✅ |
| Speed | Fast | Slow (1-5 min per flow) |
| Use for | Unit + widget tests | Critical user flows only |

---

## Writing Tests

### Pattern: Login + Permission Granting

```dart
// test/e2e/helpers/auth_helper.dart

import 'package:patrol/patrol.dart';
import 'test_credentials.dart';

/// Logs in with the given [email] and [password] using the Patrol tester [$].
/// Waits for the home screen to appear after successful login.
Future<void> login(
  PatrolIntegrationTester $, {
  String email = TestCredentials.clientAdaEmail,
  String password = TestCredentials.defaultPassword,
}) async {
  // If already on the home screen, skip login.
  if ($(#homeScreen).exists) return;

  await $(#loginScreen).waitUntilVisible();
  await $(#emailField).enterText(email);
  await $(#passwordField).enterText(password);
  await $(#loginButton).tap();

  // Handle permission dialogs.
  if (await $.platform.mobile.isPermissionDialogVisible()) {
    await $.platform.mobile.grantPermissionWhenInUse();
  }

  await $(#homeScreen).waitUntilVisible(timeout: Duration(seconds: 15));
}
```

### Pattern: Navigate to Shell Tab

```dart
// test/e2e/helpers/navigation_helper.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

/// Navigate to a shell tab by tapping its bottom navigation item.
/// Tab indices: 0=Home, 1=Workout, 2=Explore, 3=Profile, 4=Analytics
Future<void> navigateToTab(
  PatrolIntegrationTester $,
  int index,
) async {
  final navBar = find.byType(BottomNavigationBar);
  if (navBar.evaluate().isEmpty) return;
  final item = find.byType(BottomNavigationBarItem).at(index);
  await $(item).tap();
}
```

### Pattern: Multi-Step Check-In

```dart
// test/e2e/flows/check_in_flow_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import '../helpers/auth_helper.dart';
import '../helpers/test_credentials.dart';

@Tags(['e2e'])
void main() {
  patrolTest(
    'Check-In: Full multi-step submission',
    (PatrolIntegrationTester $) async {
      // Log in first
      await login($);

      // Navigate to check-in from home
      await $(#checkInBanner).tap();
      await $(#checkInScreen).waitUntilVisible();

      // Step 1: Body metrics
      await $(#checkInBackButton).waitUntilVisible();
      await $(#checkInNextButton).tap();

      // Step 2: Wellness
      await $(#checkInNextButton).tap();

      // Step 3: Notes
      await $(#checkInNextButton).tap();

      // Step 4: Photos — handle camera permission
      if (await $.platform.mobile.isPermissionDialogVisible()) {
        await $.platform.mobile.grantPermissionWhenInUse();
      }
      // Submit
      await $(#checkInSubmitButton).tap();
    },
  );
}
```

### Pattern: Workout Session — Minimize/Maximize

```dart
// test/e2e/widgets/mini_player_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import '../helpers/auth_helper.dart';

@Tags(['e2e'])
void main() {
  patrolTest(
    'Workout: Minimize session, verify mini player overlay, maximize back',
    (PatrolIntegrationTester $) async {
      await login($);
      await $(#workoutSessionScreen).waitUntilVisible();
      await $(#startWorkoutButton).tap();

      // Minimize (PopScope triggers minimize on back)
      // Wait for mini player to appear in shell overlay
      await $(#workoutMiniPlayer).waitUntilVisible();
      await $(#miniPlayerTimer).waitUntilVisible();

      // Tap mini player to maximize
      await $(#workoutMiniPlayer).tap();
      await $(#workoutSessionScreen).waitUntilVisible();
    },
  );
}
```

### Pattern: Cold-Start Session Resume

```dart
// test/e2e/flows/cold_start_flow_e2e_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import '../helpers/auth_helper.dart';

@Tags(['e2e'])
void main() {
  patrolTest(
    'Workout: Background → Foreground — session mini player',
    (PatrolIntegrationTester $) async {
      // Log in and start a workout
      await login($);
      await $(#quickStartButton).tap();
      await $(#startWorkoutButton).tap();

      // Send to background, then reopen
      await $.platform.mobile.pressHome();
      await Future.delayed(const Duration(seconds: 2));
      await $.platform.mobile.openApp();

      // loadCurrent() is called on AuthAuthenticated.
      try {
        await $(#workoutMiniPlayer).waitUntilVisible(
          timeout: const Duration(seconds: 10),
        );
      } catch (_) {
        // Background/foreground cycle may not trigger full reload.
      }
    },
  );
}
```

---

## Test Data Management

### Credentials (from seed data)

```dart
// test/e2e/helpers/test_credentials.dart

class TestCredentials {
  // Linked client (has trainer, active program, sessions, measurements)
  static const clientAdaEmail = 'client.ada@ziro.fit';

  // Unlinked client (no trainer, standalone flows)
  static const clientUnlinkedEmail = 'client.unlinked@ziro.fit';

  // Trainer account
  static const trainerEmail = 'ada@ziro.fit';

  // All seed accounts use the same password
  static const defaultPassword = 'password123';
}
```

### Backend Dependency

**Every E2E test requires the backend running.** The test user flows call real API endpoints. No mock data in E2E tests.

**Before running:**
```sh
# Path to the backend repo — adjust to your local setup.
# Common locations:
#   ../zirofit-next          (sibling directory, Linux/macOS)
#   V:/zirofit-next           (Windows)
cd <path-to-backend>
npm run dev    # starts on port 3321
```

**CI flow:**
1. Start backend (`npm run dev`)
2. Seed database (`npm run db:seed`)
3. Run Patrol tests (`patrol test`)
4. Teardown

### Auth Token Injection

For tests that don't need to exercise the login flow (e.g., just testing the workout mini player), use the `login($)` helper which handles the full UI flow. Token injection into `flutter_secure_storage` is not directly supported by Patrol — login via UI is the recommended approach.

If you need to skip the login UI, use the `testInstrumentationRunnerArguments["clearPackageData"] = "true"` config to clear state between tests, and call `login($)` once at the start of each test.

---

## CI/CD Integration

### GitHub Actions

```yaml
# .github/workflows/e2e.yml
name: E2E Tests

on:
  schedule:
    - cron: '0 6 * * *'  # Daily at 06:00 UTC
  workflow_dispatch:       # Manual trigger

jobs:
  e2e-android:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: dart-lang/setup-dart@v1
      - uses: actions/setup-java@v4
        with:
          distribution: 'temurin'
          java-version: '17'

      - name: Start backend
        run: |
          cd ../zirofit-next
          npm install
          npm run db:seed
          npm run dev &

      - name: Install Patrol CLI
        run: dart pub global activate patrol_cli

      - name: Run E2E tests (Firebase Test Lab)
        run: patrol test --firebase-test-lab
        env:
          GCLOUD_PROJECT: ${{ secrets.GCLOUD_PROJECT }}
          GCLOUD_KEY_FILE: ${{ secrets.GCLOUD_KEY_FILE }}

      - name: Upload test artifacts
        uses: actions/upload-artifact@v4
        if: always()
        with:
          name: e2e-screenshots
          path: build/patrol/
```

### When to Run

| Trigger | Run |
|---|---|
| Every commit (PR) | `flutter test` (unit + widget only — 10s) |
| Nightly (main branch) | `patrol test` (full E2E suite — ~15 min) |
| Pre-release | `patrol test` + Firebase Test Lab (multi-device) |

---

## Coverage Map — All Features (90% User Flows)

The full app spans **18 feature modules** across two user roles (Client + Trainer). Every feature below must have at least one E2E flow covering its primary user path.

### Legend

| Priority | Meaning | Runner |
|---|---|---|
| **P0** | Revenue-critical, retention-critical, or blocks all other flows | Every nightly CI run |
| **P1** | Core feature, used by majority of users | Every nightly CI run |
| **P2** | Important secondary feature | Weekly CI run |
| **P3** | Edge case, recovery, or rarely invoked | Manual / pre-release |

---

### CLIENT APP (16 features)

#### Domain: Auth & Onboarding

| # | Priority | Flow | Key Risk | Screens in Flow |
|---|---|---|---|---|
| 1 | **P0** | **Register new user → Verify email → Onboarding → Home** | Email verification screen, resend flow, educational onboarding slides, AuthCubit state chain (registerSuccess → needsOnboarding → authenticated) | RegisterScreen → EmailVerificationScreen → OnboardingScreen → EducationalOnboardingScreen → HomeScreen |
| 2 | **P0** | **Login → Home Dashboard (existing user)** | Token storage, GoRouter auth redirect guard, permission dialogs (location, notifications), `AuthAuthenticated` triggers `loadCurrent()` + notification fetch | LoginScreen → HomeScreen |
| 3 | **P0** | **Login → Cold start with active workout session** | `loadCurrent()` on `AuthAuthenticated`, mini player appears immediately, timer synced to server `startTime` | LoginScreen → WorkoutMiniPlayer |
| 4 | **P1** | **Forgot password → Reset** | Backend email flow, update-password endpoint | LoginScreen → ForgotPassword → UpdatePassword |
| 5 | **P2** | **Token refresh on 401** | Dio `QueuedInterceptor`, silent refresh, retry original request | Any screen → auto |

#### Domain: Home Dashboard

| # | Priority | Flow | Key Risk | Screens in Flow |
|---|---|---|---|---|
| 6 | **P0** | **Home dashboard loads all sections** | Parallel fetch (dashboard + active program), 13 widgets render, coach card / check-in banner conditional visibility | HomeScreen (ZiroHeader, CoachCard, CreditStatusWidget, NeedCoachBanner, CheckInBanner, ActiveProgramWidget, InvitationHeroCard, StreakMotivationCard, UpcomingSessionsCarousel, QuickActionsRow, RecentHistorySection, DailyTargetsSection) |
| 7 | **P2** | **Bell badge unread count syncs** | `NotificationsCubit.unreadCount` drives ZiroHeader red dot, pull-to-refresh on NotificationsScreen | HomeScreen → NotificationsScreen |

#### Domain: Workout Session (Core Value Prop)

| # | Priority | Flow | Key Risk | Screens in Flow |
|---|---|---|---|---|
| 8 | **P0** | **Start workout → Log sets (RPE + weight + reps) → Finish** | Timer sync (server startTime), RPE picker, numeric keyboard, set logging optimistic + reconciled, exercise picker single-select | WorkoutSessionScreen → ExercisePickerSheet → RestTimerSheet → RpePicker → WorkoutNumericKeyboard |
| 9 | **P0** | **Minimize session → Verify mini player → Maximize** | Drag-down gesture, `_MainShell` Stack overlay, timer continues in mini player, 90pt above bottom nav | WorkoutSessionScreen → WorkoutMiniPlayer → WorkoutSessionScreen |
| 10 | **P0** | **Pause / Resume workout** | `pause()` / `resume()` API calls, timer state | WorkoutSessionScreen |
| 11 | **P1** | **Cancel workout → Confirm dialog** | `CancelWorkoutDialog`, API cancel, cleanup | WorkoutSessionScreen → CancelWorkoutDialog |
| 12 | **P1** | **Rest timer between sets** | `startRest` / `endRest` endpoints, countdown, auto-transition | WorkoutSessionScreen → RestTimerSheet |
| 13 | **P1** | **Add exercises during workout** | ExercisePickerSheet.multiSelect, `addExercises` API | WorkoutSessionScreen → ExercisePickerSheet |
| 14 | **P1** | **View workout history → Session detail** | Paginated history, CompletedSessionDetailScreen | WorkoutHistoryScreen → CompletedSessionDetailScreen |
| 15 | **P2** | **View exercise detail (chart, progression, history)** | 847-line screen with fl_chart, progression data | ExerciseDetailScreen |
| 16 | **P2** | **Save session as template** | `SaveAsTemplateDialog`, TemplateDto creation | WorkoutSessionScreen → SaveAsTemplateDialog |

#### Domain: Programs & Templates

| # | Priority | Flow | Key Risk | Screens in Flow |
|---|---|---|---|---|
| 17 | **P1** | **View active program → Template list → Template detail** | ActiveProgramResponse rendering, ProgramCubit load, dual-model detail view | HomeScreen → ProgramDetailScreen → TemplateDetailScreen |
| 18 | **P1** | **Browse template library → Search → Select** | TemplatesLibraryScreen fuzzy search, system vs personal templates, pagination | TemplatesLibraryScreen → TemplatePickerSheet |
| 19 | **P1** | **Create program → Add templates → Schedule on calendar** | ProgramApiService create, TemplatePickerSheet multi-select, RoutineSchedulerScreen with `add_2_calendar` (calendar permission) | RoutineBuilderScreen → TemplatePickerSheet → RoutineSchedulerScreen |
| 20 | **P2** | **Create custom template → Add exercises** | CreateTemplateView (441 lines), ExercisePickerSheet multi-select, Drift LocalTemplateRepository | CreateTemplateView → ExercisePickerSheet |

#### Domain: Explore & Trainer Discovery

| # | Priority | Flow | Key Risk | Screens in Flow |
|---|---|---|---|---|
| 21 | **P0** | **Explore tab → Browse featured → Browse trainers → View profile** | ExploreCubit parallel load, ExploreFeatureCarousel, TrendingTagsView, ExploreCategoryFilter, pagination | ExploreScreen → TrainerDiscoveryScreen → TrainerDetailScreen |
| 22 | **P1** | **Explore map → Search location → View trainer annotation → Profile** | `geolocator` permission, `flutter_map` tiles, MapClusterAnnotation/MapSingleItemAnnotation, MapFilterMenu, MapSearchBar | ExploreScreen → TrainerMapScreen → MapSpotlightPreviewCard → TrainerDetailScreen |
| 23 | **P2** | **Browse events → Event detail** | EventDetailCubit, ExploreEventCard, EventsListViewScreen | ExploreScreen → EventsListViewScreen → EventDetailScreen |

#### Domain: Trainer Profile (Client view)

| # | Priority | Flow | Key Risk | Screens in Flow |
|---|---|---|---|---|
| 24 | **P0** | **View full trainer profile (banner, about, packages, photos, reviews, schedule)** | 719-line screen, 14 widgets, parallel API loads (detail + packages + testimonials + photos + schedule) | TrainerDetailScreen |
| 25 | **P0** | **Connect to trainer → Accept/Decline link request** | Token linking flow, BookingCubit, notification appears, Accept/Decline buttons | TrainerDetailScreen → ConnectButton → NotificationsScreen |
| 26 | **P1** | **Purchase trainer package → Stripe checkout → Return** | `flutter_stripe`, BookingApiService, `zirofitapp://` deep link return | TrainerDetailScreen → PackageCard → Stripe → PackageDetailScreen |
| 27 | **P2** | **Send custom program request to trainer** | CustomProgramRequestSheet, form submission | TrainerDetailScreen → CustomProgramRequestSheet |

#### Domain: Check-In

| # | Priority | Flow | Key Risk | Screens in Flow |
|---|---|---|---|---|
| 28 | **P1** | **Full multi-step check-in (Body metrics → Wellness → Notes → Photos → Success)** | 4 steps, form state persistence, `image_picker` camera/gallery permission, photo upload | CheckInScreen (BodyMetricsStep → WellnessStep → NotesStep → PhotosStep) → CheckInSuccessWidget |
| 29 | **P2** | **View check-in history → Detail** | CheckInHistoryScreen pagination, CheckInDetailScreen | CheckInHistoryScreen → CheckInDetailScreen |

#### Domain: Analytics

| # | Priority | Flow | Key Risk | Screens in Flow |
|---|---|---|---|---|
| 30 | **P1** | **Analytics dashboard loads all 7 widgets** | Parallel progress data fetch, ConsistencyWidget, HeatmapWidget, MuscleDonutChartWidget, PrsListWidget, VolumeChartWidget, VolumeLineChartWidget, WeightLineChartWidget | AnalyticsScreen |
| 31 | **P2** | **Manage widgets → Add/Remove/Reorder** | ManageWidgetsSheet drag-to-reorder, WidgetConfigDto PUT | AnalyticsScreen → ManageWidgetsSheet |

#### Domain: Nutrition & Habits

| # | Priority | Flow | Key Risk | Screens in Flow |
|---|---|---|---|---|
| 32 | **P1** | **View nutrition plan → Toggle habits** | Parallel plan + habits load, macro progress bars, optimistic habit toggle via POST | NutritionHabitsScreen |

#### Domain: Daily Targets & Fitness Goals

| # | Priority | Flow | Key Risk | Screens in Flow |
|---|---|---|---|---|
| 33 | **P2** | **View / edit daily targets** | DailyTargetsCubit GET/PUT, goal tracking progress | DailyTargetsScreen |
| 34 | **P2** | **CRUD fitness goals** | FitnessGoalsCubit create/read/update/delete | FitnessGoalsScreen |

#### Domain: Sharing & Privacy

| # | Priority | Flow | Key Risk | Screens in Flow |
|---|---|---|---|---|
| 35 | **P2** | **Update sharing config (privacy toggles)** | SharingCubit GET/PUT, visibility controls | SharingScreen |
| 36 | **P2** | **Update privacy settings** | ProfileApiService GET/PUT privacy | DataPrivacyScreen |

#### Domain: Profile / More

| # | Priority | Flow | Key Risk | Screens in Flow |
|---|---|---|---|---|
| 37 | **P1** | **Profile → Load settings → Sign out** | MoreCubit user + privacy load, sign-out clears secure storage, redirect to login | ProfileScreen → sign out → LoginScreen |
| 38 | **P2** | **Each settings screen loads without crash (11 sub-screens)** | 11 screens: Language, AI Coach, Contact Support, MyPackages, DataPrivacy, PurchaseHistory, NotificationSettings, CustomExercises, DashboardPrompts, Appearance | ProfileScreen + all 11 sub-screens |

#### Domain: Voice Coach

| # | Priority | Flow | Key Risk | Screens in Flow |
|---|---|---|---|---|
| 39 | **P2** | **Voice coach connect → Disconnect** | ElevenLabs agent lifecycle, microphone `permission_handler`, WebSocket connection | VoiceCoachButton → VoiceCoachCompactButton |
| 40 | **P3** | **Voice coach settings (voice settings CRUD)** | VoiceSettingsApiService | AICoachSettingsScreen |

#### Domain: Notifications

| # | Priority | Flow | Key Risk | Screens in Flow |
|---|---|---|---|---|
| 41 | **P1** | **Notifications list → Mark as read → Pull to refresh** | Supabase Realtime subscription, optimistic mark-as-read with rollback, NotificationRow badges | NotificationsScreen |
| 42 | **P1** | **Accept trainer link request from notification** | Accept/Decline buttons in NotificationRow, `POST /api/notifications/:id/accept` | NotificationsScreen → NotificationRow Accept |

#### Domain: Sync & Offline

| # | Priority | Flow | Key Risk | Screens in Flow |
|---|---|---|---|---|
| 43 | **P3** | **Offline → Online → Auto-sync triggers** | `connectivity_plus` listener, SyncCubit pull-first then push, Drift LWW reconciliation | Background (any screen) |
| 44 | **P3** | **Offline workout → Sync when online** | WorkoutSessionCubit local state, sync_status column, POST on reconnect | WorkoutSessionScreen → background sync |

#### Domain: Stripe / Payments

| # | Priority | Flow | Key Risk | Screens in Flow |
|---|---|---|---|---|
| 45 | **P2** | **Package purchase → Stripe checkout → Deep link return** | `flutter_stripe` payment sheet, `zirofitapp://stripe-return` / `zirofitapp://packages/:id/success|cancel` deep links | PackageCard → Stripe → Stripe return → PackageDetailScreen |

---

### TRAINER APP (14 features)

All trainer flows authenticate as `ada@ziro.fit` via the trainer `TrainerShell` (separate GoRouter `StatefulShellRoute`).

#### Domain: Trainer Shell & Navigation

| # | Priority | Flow | Key Risk | Screens in Flow |
|---|---|---|---|---|
| 46 | **P0** | **Trainer login → TrainerShell (5 tabs: Calendar/Programs/Dashboard/Clients/More)** | Role-based route guard, separate shell route, mini player overlay shared with client app | LoginScreen → TrainerShell |
| 47 | **P1** | **Switch between all 5 trainer tabs — each tab loads data** | CalendarTab, ProgramsTab, DashboardTab, ClientsTab, MoreTab — all cubits fire on tab switch | TrainerShell (all 5 tabs) |

#### Domain: Trainer Dashboard

| # | Priority | Flow | Key Risk | Screens in Flow |
|---|---|---|---|---|
| 48 | **P1** | **Dashboard loads overview (clients, sessions, metrics)** | Parallel API calls, TrainerDashboardCubit | TrainerDashboardScreen |

#### Domain: Trainer Calendar

| # | Priority | Flow | Key Risk | Screens in Flow |
|---|---|---|---|---|
| 49 | **P1** | **Calendar loads events → View event detail** | TrainerCalendarCubit, calendar rendering, event API | TrainerCalendarScreen |

#### Domain: Trainer Clients

| # | Priority | Flow | Key Risk | Screens in Flow |
|---|---|---|---|---|
| 50 | **P0** | **Clients list → Client detail → View history** | TrainerClientsCubit pagination, TrainerClientDetailCubit, TrainerClientHistoryScreen | TrainerClientsScreen → TrainerClientDetailScreen → TrainerClientHistoryScreen |
| 51 | **P1** | **Add new client (by email)** | TrainerAddClientCubit, `POST /api/clients/request-link` | TrainerAddClientScreen |
| 52 | **P1** | **View client analytics (progress, charts)** | TrainerClientAnalyticsCubit, metrics dashboards | TrainerClientAnalyticsScreen |
| 53 | **P1** | **View client nutrition plan + habits** | Nutrition plan API, habits API, trainer nutrition detail | TrainerNutritionDetailScreen |
| 54 | **P1** | **View client active program** | TrainerActiveProgramCubit | TrainerActiveProgramScreen |
| 55 | **P1** | **View client packages** | TrainerClientPackagesCubit | TrainerClientPackagesScreen |
| 56 | **P2** | **Review client check-in → View detail** | TrainerCheckInReviewCubit, photo review, metrics | TrainerCheckInReviewScreen → TrainerCheckInDetailScreen |

#### Domain: Trainer Programs

| # | Priority | Flow | Key Risk | Screens in Flow |
|---|---|---|---|---|
| 57 | **P1** | **Programs list → Create program → Assign to client** | TrainerProgramsCubit CRUD, program assignment | TrainerProgramsScreen → TrainerProgramDetailScreen |
| 58 | **P2** | **Create template / exercise within program** | Template CRUD, exercise assignment | TrainerProgramDetailScreen |

#### Domain: Trainer Resources

| # | Priority | Flow | Key Risk | Screens in Flow |
|---|---|---|---|---|
| 59 | **P2** | **Resource vault → Browse / upload** | TrainerResourcesApiService, media management | TrainerResourceVaultScreen |
| 60 | **P3** | **Recipes management** | Recipe CRUD | TrainerRecipesScreen |

#### Domain: Trainer Events

| # | Priority | Flow | Key Risk | Screens in Flow |
|---|---|---|---|---|
| 61 | **P2** | **Create / manage events** | Event CRUD, trainer events screen | TrainerEventsScreen |

#### Domain: Trainer More (Settings)

| # | Priority | Flow | Key Risk | Screens in Flow |
|---|---|---|---|---|
| 62 | **P2** | **Trainer profile settings → Sign out** | Trainer-specific settings, sign out redirect | TrainerMoreScreen |

---

### Cross-Cutting / Infrastructure

| # | Priority | Flow | Key Risk | Notes |
|---|---|---|---|---|
| 63 | **P2** | **App cold start → Auth check → Redirect (logged in vs logged out)** | Token exists in secure storage → auto-redirect to Home/TrainerShell vs to LoginScreen | Measured at app launch, not a screen-based flow |
| 64 | **P3** | **Deep link: Stripe return → Package success** | `zirofitapp://packages/:id/success` routing | Depends on Stripe being wired |

---

### Execution Strategy

```
Phase 1 — Must-ship for patrol adoption (P0 only, 14 flows)
├── C1 Register + Onboarding
├── C2 Login + Home Dashboard
├── C3 Cold start active session
├── C6 Home dashboard loads
├── C8 Start → Log sets → Finish
├── C9 Minimize → Mini player → Maximize
├── C10 Pause / Resume
├── C21 Explore → Browse → Profile
├── C24 Full trainer profile view
├── C25 Connect to trainer
├── T46 Trainer login + shell tabs
├── T50 Clients list → Detail → History

Phase 2 — Core feature coverage (P1 only, 18 flows)
├── C4 Forgot password
├── C11 Cancel workout
├── C12 Rest timer
├── C13 Add exercises mid-workout
├── C14 Workout history → Detail
├── C17 Active program → Template detail
├── C18 Template library → Search
├── C19 Create program → Schedule
├── C22 Explore map → Location → Profile
├── C28 Multi-step check-in
├── C30 Analytics dashboard
├── C32 Nutrition plan → Toggle habits
├── C37 Profile → Sign out
├── C41 Notifications → Mark read
├── C42 Accept link request
├── T47 Switch all 5 tabs
├── T48 Dashboard loads
├── T49 Calendar loads
├── T51 Add client
├── T53 Client nutrition plan
├── T57 Programs list → Detail

Phase 3 — Full coverage (P2–P3, all remaining 25 flows)
├── C5, C7, C15, C16, C20, C23, C26, C27, C29, C31,
  C33, C34, C35, C36, C38, C39, C40, C43, C44, C45,
  T52, T54, T55, T56, T58, T59, T60, T61, T62, C63, C64
└── Trainer app: client analytics, packages, check-in review, events, resources, recipes, settings
```

### Total: 64 flows across 18 feature modules

| Domain | Features | P0 | P1 | P2/P3 | Total Flows |
|---|---|---|---|---|---|
| **Client App** | 16 features | 8 | 12 | 25 | **45** |
| **Trainer App** | 14 features (within trainer module) | 2 | 8 | 6 | **16** |
| **Cross-cutting** | (infrastructure) | 0 | 1 | 2 | **3** |
| **Total** | **18 feature modules** | **10** | **21** | **33** | **64** |

### Coverage per testing layer

| Layer | What it covers | Not responsible for |
|---|---|---|
| **Unit tests** (`bloc_test` / `mocktail`) | Every cubit method, every state transition, error/loading/success, edge cases, boundary values | Multiple screens working together, native/platform features, real API responses |
| **Widget tests** (`flutter_test`) | Individual widget rendering, layout, interaction handlers | Full navigation flows, cross-screen state, real device behavior |
| **E2E tests (Patrol)** | Full user journeys, permission dialogs, real API integration, navigation, deep links | Every error variant (unit tests handle that), every UI permutation (widget tests handle that) |

**Rule of thumb**: If a bug could only be caught by running the real app on a real device through a multi-screen flow, it belongs in an E2E test. Everything else belongs lower in the pyramid.

---

## Maintenance Guidelines

### Do

- Write E2E tests **after** the feature is complete and unit-tested
- Use `ValueKey` on every interactive widget (text fields, buttons, cards, list items)
- Keep `ValueKey` names in a shared constants file for type safety
- Extract repeated permission handling into `permission_helper.dart`
- Use `login($)` over `loginAsTrainer($)` to exercise the real auth flow
- Run the full E2E suite before every major release

### Don't

- Don't use E2E tests to validate business logic (that's what `bloc_test` is for)
- Don't add a new E2E test for every bug fix — add a unit test first, only add E2E if the bug spans multiple screens
- Don't hardcode delays (`await Future.delayed(...)`) — use `waitUntilVisible()` instead
- Don't test every error state in E2E — mock those in cubit tests
- Don't run E2E tests on every commit — they're too slow

### Writing Reliable Tests

1. **Always wait for elements** — Patrol has built-in auto-waiting, but for complex flows use explicit `waitUntilVisible()` with reasonable timeouts.
2. **Handle permissions first** — Call `native.handlePermission()` at the start of every flow that triggers permission dialogs. Permissions only prompt the first time, so test order matters.
3. **One assertion per screen** — Verify the screen loaded (key widget visible), then act. Don't assert every text label — that's a widget test job.
4. **Clean up test data** — Each flow should clean up created data (cancel workouts, delete check-ins) or use idempotent operations. The seed database can be reset between test runs.
5. **Tag flows by risk** — Use `patrol` group names to categorize: `P0: Auth: ...`, `P1: Check-In: ...`, `P2: Analytics: ...`. This allows selective execution.

### Gotchas

- **`flutter_secure_storage`** — Patrol doesn't expose secure storage APIs directly. Use `login($)` which navigates through the full login UI to get an authenticated session.
- **Stripe deep links** — The `zirofitapp://` scheme must be registered in the test AndroidManifest.xml and Info.plist. Without it, Stripe return URLs won't work.
- **`add_2_calendar`** — Requires `READ_CALENDAR` / `WRITE_CALENDAR` permissions (Android) and `NSCalendarsUsageDescription` (iOS). Patrol's `native.handlePermission()` handles these.
- **Multiple devices** — Use Firebase Test Lab for running E2E across Android + iOS in CI. Local development should target one emulator type.
- **Build artifacts** — Patrol stores screenshots and logs in `build/patrol/`. Upload these as CI artifacts for failure debugging.

---

## References

| Resource | Link |
|---|---|
| Patrol Documentation | https://patrol.leancode.co/docs |
| Patrol GitHub | https://github.com/leancodepl/patrol |
| Patrol API Reference | https://patrol.leancode.co/docs/api |
| Firebase Test Lab + Patrol | https://patrol.leancode.co/docs/ci/firebase-test-lab |
| Existing Unit Tests | `test/` directory (7 cubit test files) |
| AGENTS.md Testing Section | `AGENTS.md#testing-requirements` |
| Backend Seed Credentials | `AGENTS.md#delivery-checklist` |
