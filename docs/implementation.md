To address your questions directly:

1. **Authentication and Session Persistence:** 
   * **Registration (`POST /api/auth/register`):** Collects `name`, `email`, `password`, `role` (for clients, this defaults to `"client"` if an invitation/link is present, otherwise `"pending"`), and optional `trainerId` (for client invitations). The API returns whether email confirmation is required and if a subscription is required.
   * **Login (`POST /api/auth/login`):** Validates email and password, exchanges them with Supabase, creates/verifies the matching relational user profile in PostgreSQL, and returns an `accessToken` (JWT) and a `refreshToken`.
   * **Session Persistence:** Securely stores the `refreshToken` on the mobile device's keychain. On app startup, the token is read to silently authenticate. We use a **Dio Queued Interceptor** to catch expired access tokens, hit `/api/auth/refresh` in the background, update local storage, and retry failed requests seamlessly.

2. **Overall Branding & UI Theme:**
   * **Branding Colors:** The primary brand color is **Apple-style Premium Blue (`#007aff`)**. 
   * **Theme & Styling:** The web app forces a clean **light-mode-only** theme (`ThemeContext.tsx` restricts dark mode; `tailwind.config.ts` uses neutral grays, clean whites, and slate borders). The interface mimics premium native iOS interfaces (clean borders, high-density layouts, subtle typography, and card-based modules with large rounded corners like `rounded-2xl` and `rounded-[24px]`).

Below is the updated, comprehensive step-by-step technical guide incorporating the explicit auth flow, deep-linked mobile callbacks, localized Tax Mailbox sync states, and a visual design specification sheet mapped to **shadcn/ui** primitives.

---

# Technical Specifications & Implementation Blueprint for the ZIRO.FIT Client App

This document serves as the absolute specification and implementation guide for building the **ZIRO.FIT** client-facing mobile application using Flutter. It details the clean architecture, offline-first sync reconciliation, discovery flows, live workout execution, authentication persistence, and visual branding matching the web app's **shadcn/ui Zinc/Neutral** theme.

---

## 1. Architecture & Tech Stack

The application enforces **Clean Architecture** patterns to keep the codebase highly decoupled, testable, and maintainable. 

### 1.1 Tech Stack Components
*   **State Management**: `flutter_bloc` & `bloc` (State machine execution for complex workout state transitions).
*   **Dependency Injection**: `get_it` & `injectable` (Compile-time dependency inversion).
*   **Local Relational DB**: `drift` (SQLite wrapper) chosen over key-value stores to support transactions and schema reconciliation.
*   **HTTP Client**: `dio` (with queued interceptors for background JWT refresh).
*   **Key-Value Storage**: `flutter_secure_storage` (Secure keychain encryption for auth tokens).

### 1.2 Unified Directory Structure
```
lib/
├── core/
│   ├── di/                 # Service locator setup
│   ├── network/            # Dio client, Auth interceptor, API clients
│   ├── database/           # Drift SQLite database & schema definitions
│   ├── security/           # FlutterSecureStorage wrapper
│   └── theme/              # shadcn/ui Zinc theme & colors (forced light mode)
├── features/
│   ├── auth/               # Login, registration, token refresh, onboarding
│   ├── trainers/           # Map/list discovery, profiles, booking, Stripe
│   ├── workout/            # Live logging, Amelia's progression, rest timer
│   └── sync/               # Dirty write queue, LWW reconciliation
```

---

## 2. Visual Design System (shadcn/ui to Flutter Mapping)

The ZIRO.FIT web app utilizes the **shadcn/ui Zinc/Neutral** design system with a **Premium Blue (`#007aff`)** brand accent. The mobile app must render identically in a forced light-mode configuration.

### 2.1 Design Tokens & Colors
| Token | Web CSS Variable | Hex Color Value | Flutter Color Definition |
| :--- | :--- | :--- | :--- |
| **Primary Accent** | `--primary-blue` | `#007aff` | `Color(0xFF007AFF)` |
| **Background** | `--background` | `#ffffff` | `Color(0xFFFFFFFF)` |
| **Card / Surface**| `--card` | `#ffffff` | `Color(0xFFFFFFFF)` |
| **Muted Surface** | `--neutral-50` | `#fafafa` | `Color(0xFFFAFAFA)` |
| **Border Muted** | `--neutral-100` | `#f4f4f5` | `Color(0xFFF4F4F5)` |
| **Border Active** | `--border` | `#e5e7eb` | `Color(0xFFE5E7EB)` |
| **Foreground Text**| `--foreground` | `#18181b` | `Color(0xFF18181B)` |
| **Muted Text** | `--muted-foreground` | `#71717a` | `Color(0xFF71717A)` |

### 2.2 Global Flutter Theme Configuration (`ThemeData`)
To replicate the clean, flat surfaces and sharp borders of **shadcn/ui**:
```dart
final shadcnLightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xFFFAFAFA), // Muted Background
  primaryColor: const Color(0xFF007AFF),            // Premium Blue Accent
  cardTheme: const CardTheme(
    color: Color(0xFFFFFFFF),
    elevation: 0,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      side: BorderSide(color: Color(0xFFE5E7EB), width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(24.0)), // iOS rounded corners
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: Color(0xFFFFFFFF),
    contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFE5E7EB), width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(99.0)), // Fully rounded inputs
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF007AFF), width: 1.5),
      borderRadius: BorderRadius.all(Radius.circular(99.0)),
    ),
    labelStyle: TextStyle(color: Color(0xFF71717A), fontSize: 14.0),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF007AFF),
      foregroundColor: const Color(0xFFFFFFFF),
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(99.0)), // Pill buttons
      ),
      textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
    ),
  ),
);
```

---

## 3. Authentication, Registration, & Session Persistence

The mobile authentication pipeline must seamlessly integrate with the existing Next.js / Supabase backend architecture.

```
       [Registration Flow]                          [Login Flow]
 ┌──────────────────────────────┐            ┌──────────────────────────────┐
 │ POST /api/auth/register      │            │ POST /api/auth/login         │
 └──────────────┬───────────────┘            └──────────────┬───────────────┘
                │                                           │
                ▼                                           ▼
 ┌──────────────────────────────┐            ┌──────────────────────────────┐
 │ Parse: confirmationRequired  │            │ Returns:                     │
 │ & requiresSubscription       │            │ - accessToken (JWT)          │
 └──────────────┬───────────────┘            │ - refreshToken               │
                │                                           │
                ▼                                           ▼
 ┌──────────────────────────────┐            ┌──────────────────────────────┐
 │ If confirmationRequired:     │            │ Write tokens to Secure       │
 │ Show verification screen     │            │ Storage. Initialize Session  │
 └──────────────────────────────┘            └──────────────────────────────┘
```

### 3.1 Sign-Up Pipeline (`POST /api/auth/register`)
*   **Payload**: `{ "name": "Sarah", "email": "client@example.com", "password": "...", "trainerId": "optional-trainer-uuid", "redirect": "zirofitapp://auth-callback" }`
*   **Logic**:
    1. If `trainerId` is supplied, the backend forces the user's role to `"client"` and automatically links them to the trainer on successful validation.
    2. The API handles email confirmation and returns `confirmationRequired: true`.
    3. The app presents an "Email Verification Pending" screen and instructs the user to tap the confirmation link in their email inbox.

### 3.2 Login & Persistence Pipeline (`POST /api/auth/login`)
*   **Payload**: `{ "email": "client@example.com", "password": "..." }`
*   **Response**:
    ```json
    {
      "success": true,
      "data": {
        "accessToken": "ey...",
        "refreshToken": "ref...",
        "role": "client",
        "user": { "id": "uuid", "email": "..." }
      }
    }
    ```
*   **Storage Mechanics**:
    Upon successful login, write the tokens to `FlutterSecureStorage`:
    ```dart
    await secureStorage.write(key: 'access_token', value: response.accessToken);
    await secureStorage.write(key: 'refresh_token', value: response.refreshToken);
    ```

### 3.3 Background Token Refreshing (Dio Queued Interceptor)
To prevent network request failures during expired JWT intervals:
```dart
class AuthQueuedInterceptor extends QueuedInterceptor {
  final Dio _dio;
  final FlutterSecureStorage _storage;

  AuthQueuedInterceptor(this._dio, this._storage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _storage.read(key: 'access_token');
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final refreshToken = await _storage.read(key: 'refresh_token');
      if (refreshToken != null) {
        try {
          // Attempt to refresh the session
          final refreshResponse = await _dio.post(
            '/api/auth/refresh',
            data: {'refreshToken': refreshToken},
          );
          
          final newAccessToken = refreshResponse.data['data']['accessToken'];
          final newRefreshToken = refreshResponse.data['data']['refreshToken'];

          // Save new tokens
          await _storage.write(key: 'access_token', value: newAccessToken);
          await _storage.write(key: 'refresh_token', value: newRefreshToken);

          // Retry the original request
          err.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
          final response = await _dio.request(
            err.requestOptions.path,
            options: Options(
              method: err.requestOptions.method,
              headers: err.requestOptions.headers,
            ),
            data: err.requestOptions.data,
            queryParameters: err.requestOptions.queryParameters,
          );
          return handler.resolve(response);
        } catch (refreshError) {
          // Refresh failed, clear session and force login
          await _storage.delete(key: 'access_token');
          await _storage.delete(key: 'refresh_token');
          // Navigate back to Login view
        }
      }
    }
    handler.next(err);
  }
}
```

---

## 4. Offline-First Synchronization Strategy

The mobile app implements a fully relational local cache using **Drift**. Any write operations during an active session are written locally first, ensuring uninterrupted workout tracking even with no internet connection.

### 4.1 Local Relational DB Tables (Drift DSL)
```dart
@DataClassName('LocalWorkoutSession')
class LocalWorkoutSessions extends Table {
  TextColumn get id => text()();
  TextColumn get clientId => text()();
  TextColumn get workoutTemplateId => text().nullable()();
  TextColumn get name => text().nullable()();
  TextColumn get status => text()(); // IN_PROGRESS, COMPLETED, PLANNED
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime().nullable()();
  TextColumn get notes => text().nullable()();
  BoolColumn get isTrainerLed => boolean().withDefault(const Constant(false))();
  
  // Sync metadata
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  TextColumn get syncStatus => text().withDefault(const Constant('synced'))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('LocalExerciseLog')
class LocalExerciseLogs extends Table {
  TextColumn get id => text()();
  TextColumn get workoutSessionId => text().references(LocalWorkoutSessions, #id, onDelete: KeyAction.cascade)();
  TextColumn get exerciseId => text()();
  IntColumn get reps => integer()();
  RealColumn get weight => real().nullable()();
  IntColumn get order => integer()();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  TextColumn get side => text().withDefault(const Constant('BOTH'))(); // LEFT, RIGHT, BOTH
  TextColumn get tempo => text().nullable()();
  
  // Sync metadata
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  TextColumn get syncStatus => text().withDefault(const Constant('synced'))();

  @override
  Set<Column> get primaryKey => {id};
}
```

### 4.2 Local Write Reconciliation (LWW)
All client-side mutations update local records immediately and set `sync_status` to `'pending_update'`. On background synchronization or reconnection:

1. **Pull Phase (`GET /api/sync/pull?last_pulled_at=timestamp`):**
   * The server returns all changes.
   * If a conflict exists (local record modified while offline and remote record also updated):
     * If `remote.updated_at > local.updated_at`, write remote data to the local DB.
     * Else, preserve the local data and schedule it to be pushed.

2. **Push Phase (`POST /api/sync/push`):**
   * Gather all records matching `sync_status != 'synced'`.
   * Push them in a single batch transaction payload. Upon receipt of a `200 OK` response, mark all local states as `'synced'`.

---

## 5. Feature Spec 1 - Public Discoverability & Search

Clients can browse trainer directories, locate gyms on an OpenStreetMap interface, and book sessions or purchase training credit packages.

### 5.1 Map-Based Trainer Discovery (Online Only)
*   **Endpoint**: `GET /api/trainers?page=1&pageSize=15&q={searchQuery}&location={location}&lat={lat}&lng={lng}&sortBy=distance`
*   **Flutter Implementation**:
    *   Initialize `flutter_map` using OpenStreetMap tiles:
        ```dart
        FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(userLat, userLng),
            initialZoom: 12.0,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'fit.ziro.app',
            ),
            MarkerLayer(markers: [/* Price tag marker overlays */]),
          ],
        )
        ```
    *   **Price Tag Markers**: Map pins are styled as elevated price capsules (e.g., `150 zł`) matching the selected currency's symbol using standard utilities. Tapping a pin reveals a bottom-sheet preview card of the trainer's rating, name, and top specialties.

### 5.2 Trainer Profile and Checkout
*   **Booking Grid**: Renders an interactive booking layout by pulling data from `GET /api/trainers/{username}/schedule`. Valid time slots are generated by checking weekly availability while subtracting confirmed time blocks in real-time.
*   **Stripe SDK Integration**: Clicking a purchase button calls `/api/checkout/session` to generate a secure checkout link and ephemeral keys, launching the native Stripe Payment Sheet interface seamlessly.

---

## 6. Feature Spec 2 - Live Workout Execution

The heart of the application. Designed to let clients perform and log active sessions completely offline, prompting appropriate progression adjustments as they train.

### 6.1 State Machine (`WorkoutState`)
A single `WorkoutCubit` manages the active training states:

```dart
abstract class WorkoutState {}

class WorkoutIdle extends WorkoutState {}

class WorkoutInProgress extends WorkoutState {
  final LocalWorkoutSession session;
  final List<LocalExerciseLog> currentLogs;
  final int activeExerciseIndex;
  final bool isResting;
  final int? restTimeRemaining;

  WorkoutInProgress({
    required this.session,
    required this.currentLogs,
    this.activeExerciseIndex = 0,
    this.isResting = false,
    this.restTimeRemaining,
  });
}
```

### 6.2 Amelia's Auto-Progression Engine (SOLID Implementation)
Amelia's progression rule states: **"If a client performs 2 or more reps above their target maximum, suggest increasing the weight by 5% on the next set."**

This is built as a pure, testable domain service to ensure separation of concerns:

```dart
class ProgressionConfig {
  final int extraRepThreshold;
  final double weightMultiplier;

  const ProgressionConfig({
    this.extraRepThreshold = 2,
    this.weightMultiplier = 0.05,
  });
}

class ProgressionResult {
  final bool shouldProgress;
  final double suggestedWeight;
  final String recommendationMessage;

  ProgressionResult({
    required this.shouldProgress,
    required this.suggestedWeight,
    required this.recommendationMessage,
  });
}

class AutoProgressionEngine {
  static ProgressionResult evaluate({
    required String targetRepsRange, // e.g. "8-12" or "10"
    required int actualReps,
    required double currentWeight,
    ProgressionConfig config = const ProgressionConfig(),
  }) {
    final maxReps = _parseMaxReps(targetRepsRange);
    if (maxReps == null || actualReps <= 0 || currentWeight <= 0) {
      return ProgressionResult(
        shouldProgress: false,
        suggestedWeight: currentWeight,
        recommendationMessage: '',
      );
    }

    final triggerThreshold = maxReps + config.extraRepThreshold;

    if (actualReps >= triggerThreshold) {
      // Calculate and round weight to nearest 0.5kg
      final rawNextWeight = currentWeight * (1.0 + config.weightMultiplier);
      final suggestedWeight = (rawNextWeight * 2).round() / 2.0;

      return ProgressionResult(
        shouldProgress: true,
        suggestedWeight: suggestedWeight,
        recommendationMessage: 
            "🔥 Great set! You completed $actualReps reps (Target max: $maxReps). "
            "Amelia suggests increasing the weight to ${suggestedWeight}kg (+${(config.weightMultiplier * 100).toInt()}%) for your next set.",
      );
    }

    return ProgressionResult(
      shouldProgress: false,
      suggestedWeight: currentWeight,
      recommendationMessage: '',
    );
  }

  static int? _parseMaxReps(String range) {
    try {
      final parts = range.split('-');
      if (parts.length == 1) {
        return int.tryParse(parts[0].trim());
      } else if (parts.length == 2) {
        return int.tryParse(parts[1].trim());
      }
    } catch (_) {
      return null;
    }
    return null;
  }
}
```

### 6.3 Live Workout UI & Rest Timer Flow
*   **Unilateral Exercise Logging**: Exercises tagged as `isUnilateral: true` (e.g., Single-Leg Dumbbell RDLs) automatically render separate, explicit **L** (Left) and **R** (Right) input fields to prevent data confusion.
*   **Automatic Rest Timer**: 
    1. Tapping a set's completion checkbox commits the logs locally and updates the database sync state.
    2. If a rest duration is specified in the template, a circular countdown timer overlay slides up from the bottom of the screen.
    3. The timer decrements in the background. If another set is checked or the user taps "Skip", the timer closes.
    4. Upon reaching zero, the app triggers a dual-pulse haptic vibration motor sequence on the phone and plays a subtle sound chime.

---

## 7. Step-by-Step Implementation Guide

To ensure high-quality software development, this section breaks down the implementation into five logical, testable milestones. Each milestone must pass its validation checks before moving to the next.

```
   ┌────────────────────────────────────────────────────────┐
   │                       MILESTONE 1                      │
   │   Drift Local DB Setup, Auth Clients, and Base Theme   │
   └───────────────────────────┬────────────────────────────┘
                               │
                               ▼
   ┌────────────────────────────────────────────────────────┐
   │                       MILESTONE 2                      │
   │   Bi-Directional LWW Sync & Write Queue Reconciliation  │
   └───────────────────────────┬────────────────────────────┘
                               │
                               ▼
   ┌────────────────────────────────────────────────────────┐
   │                       MILESTONE 3                      │
   │   Trainer Discovery Engine (Location Search & Maps)    │
   └───────────────────────────┬────────────────────────────┘
                               │
                               ▼
   ┌────────────────────────────────────────────────────────┐
   │                       MILESTONE 4                      │
   │   Active Workout Logger, Timer, & Progression Engine   │
   └───────────────────────────┬────────────────────────────┘
                               │
                               ▼
   ┌────────────────────────────────────────────────────────┐
   │                       MILESTONE 5                      │
   │   End-to-End Edge Cases, Error Boundaries, & PWA       │
   └────────────────────────────────────────────────────────┘
```

---

### Milestone 1: Drift DB, Auth, and Base Theme

#### Objective
Establish the project foundations, including the Dependency Injection container, HTTP client interceptors, global design themes, and local Drift database schemas.

#### Step-by-Step Instructions
1.  **Configure Core Theme**: Create the light theme configuration inside `core/theme/`. Apply the core color variables (Primary: `#007aff`, Secondary/Card: White, Surface Accent: Light Grey `#f4f4f5`). Disable dark mode completely by forcing the theme configuration to ignore system brightness settings.
2.  **Initialize DI Setup**: Add dependencies (`get_it`, `injectable`) in `pubspec.yaml`. Create `core/di/injection.dart` with `@injectableInit` to automatically scan and register future services.
3.  **Implement Auth Client & Interceptor**: Create the authentication token store (`AuthTokenStore`) using secure local storage (`flutter_secure_storage`). Define a Dio Interceptor (`AuthInterceptor`) that:
    *   Appends `Authorization: Bearer <accessToken>` to outgoing requests.
    *   Interceptes `401 Unauthorized` responses, calls the token refresh endpoint (`POST /api/auth/refresh`), updates local storage, and retries the original request.
4.  **Create Drift Local Database**: Write the schemas for `LocalWorkoutSessions` and `LocalExerciseLogs` (defined in Section 2.2) inside `core/database/local_database.dart`. Add schemas for static support tables: `LocalExercises` and `LocalWorkoutTemplates` to enable offline lookups.
5.  **Generate Database Code**: Run `flutter pub run build_runner build --delete-conflicting-outputs` to generate the matching SQLite bindings.

#### Verification Criteria
*   Verify that the app launches with forced light-mode color values.
*   Unit test the `AuthInterceptor` using a mock HTTP adapter, confirming that a `401` response triggers the refresh flow.
*   Assert that the SQLite database file is successfully created on device startup, and queries to empty tables return without throwing exceptions.

---

### Milestone 2: Sync Engine and Write Queue Reconciliation

#### Objective
Implement the background synchronization scheduler and data reconciliation repository to handle bi-directional updates.

#### Step-by-Step Instructions
1.  **Define Sync Repository Interface**: Create `features/sync/domain/repositories/sync_repository.dart` specifying contracts for pulling remote changes and flushing the local write queue.
2.  **Implement Pull Logic**: In `features/sync/data/repositories/sync_repository_impl.dart`, query the server via `GET /api/sync/pull?last_pulled_at=timestamp`.
    *   Compare the `updated_at` timestamps of incoming entities against local records.
    *   Apply the LWW reconciliation logic: only overwrite the local DB if `remote.updated_at > local.updated_at`.
3.  **Implement Push Queue**: Build a scanner in the local database class that finds any row in `LocalWorkoutSessions` or `LocalExerciseLogs` with a `sync_status != 'synced'`.
    *   Package these rows into a structured JSON change payload.
    *   Send the payload to `POST /api/sync/push`. On success, update those local records to `synced`.
4.  **Sync Coordinator**: Write a high-level orchestration class (`SyncCoordinator`) that combines the Pull and Push steps inside a single transactional block on network status changes:
    ```dart
    Future<void> coordinate() async {
      await pull();
      await push();
    }
    ```
5.  **Integrate Connectivity Listener**: Use the `connectivity_plus` package to listen for network status changes. Trigger a `SyncCoordinator.coordinate()` run whenever the device regains connection.

#### Verification Criteria
*   Write integration tests that seed the database with a pending record, simulate a sync call, and assert that the record's state changes to `synced`.
*   Mock a conflicting update (where `remote.updated_at` is older than `local.updated_at`) and verify that the local change is preserved.

---

### Milestone 3: Trainer Discovery & Booking

#### Objective
Build the client-facing discoverability screen, including location-based list filtering, interactive map search, and Stripe-enabled package purchasing.

#### Step-by-Step Instructions
1.  **Discoverability UI Layout**: Create `features/trainers/presentation/pages/trainer_discovery_page.dart`. Implement the top search bar (allowing text query input and a dropdown select for training type).
2.  **Integrate Map**: Install `flutter_map` and `latlong2`. Create a togglable view to display trainers as pins on the map:
    *   Use the OpenStreetMap tile server.
    *   Create custom pins that render the price of the trainer directly on the map.
    *   Highlight the selected trainer’s pin when hovered or tapped.
3.  **Trainer Profile Page**: Create `features/trainers/presentation/pages/trainer_profile_page.dart`. Include sections for About Me, Specialties, Client Reviews, and Transformation Photos.
4.  **Implement Booking Calendar**: In the profile sidebar/booking area, render a monthly calendar grid. Disable past dates. Fetch available slots from `GET /api/trainers/{username}/schedule`.
5.  **Connect Stripe Payment Sheet**: Implement the checkout flow using `flutter_stripe`:
    *   When the user selects a package and taps **Buy**, call `POST /api/checkout/session`.
    *   Receive the payment credentials, initialize the Stripe payment sheet, and present it to the user.
    *   On a successful payment response, show a clean confirmation screen and trigger a local revalidation of the client's available credits.

#### Verification Criteria
*   Verify that search parameters (e.g. `location`, `q`, `trainingTypes`) are correctly appended to the API query.
*   Confirm that trainers without coordinates are filtered out of the map view but remain visible in the list view.
*   Assert that mock Stripe payments complete successfully and trigger a local credit reload.

---

### Milestone 4: Active Workout & Live Logging

#### Objective
Build the live workout logging screen. This includes managing active set states, implementing the auto-progression rules, running the rest timer, and tracking PRs.

#### Step-by-Step Instructions
1.  **Create WorkoutCubit**: Implement the Cubit defined in Section 4.1. Write a `startWorkout` event handler that either resumes an existing `IN_PROGRESS` session from the database or creates a new one.
2.  **Build Live Workout Screen**: Design the workout logging interface:
    *   Render a list of exercise blocks, each containing a set table (Reps, Weight, Checkbox).
    *   For unilateral exercises, render separate side-by-side rows for Left and Right sides.
3.  **Implement Amelia's Progression Rule**: Add a listener to set completion events.
    *   When a set checkbox is checked, run the `AutoProgressionEngine.evaluate` function.
    *   If `shouldProgress` is true, show a non-obstructive visual banner suggesting the next set's weight (+5% rounded to the nearest 0.5kg).
4.  **Auto-Rest Timer**: Integrate the rest timer logic:
    *   When a set is checked, if a rest duration is configured, trigger the countdown timer.
    *   Render a circular progress overlay at the bottom of the screen.
    *   When the timer hits zero, trigger a short haptic vibration pattern and play a subtle chime.
5.  **Session Finish Logic**: When the **Finish** button is tapped:
    *   Set the local session status to `COMPLETED`.
    *   Compare the completed sets against previous entries in the local DB to check for new Personal Records (PRs).
    *   Save any new PRs to the local database, mark them as pending sync, and show a summary screen detailing the total volume lifted and PRs broken.

#### Verification Criteria
*   Write unit tests for `AutoProgressionEngine.evaluate` covering multiple inputs (e.g. 10 reps on a 8-12 target range, 14 reps on a 8-12 target range).
*   Verify that completing a set automatically launches the rest timer with the correct duration.
*   Confirm that terminating a workout updates the session status to `COMPLETED` and saves all logged data locally with the sync status set to `pending_update`.

---

### Milestone 5: Edge Cases, Error Boundaries, and Polish

#### Objective
Enhance application resilience by adding error boundaries, handling edge cases, and verifying complete end-to-end operation.

#### Step-by-Step Instructions
1.  **Add Global Error Boundaries**: Wrap the root widget structure in a custom `ErrorWidget.builder` and add a BLoC Observer that logs uncaught exceptions to the local database.
2.  **Conflict Resolution Banner**: If a sync operation fails due to server-side conflicts (e.g. a session was modified on another device), display a modal asking the user to choose between the local or remote version of the data.
3.  **Verify Offline Performance**: Run the application in airplane mode:
    *   Confirm that you can navigate through cached trainers and templates.
    *   Start and log a complete live workout session.
    *   Assert that all actions are saved to the local database.
    *   Disable airplane mode and verify that the sync engine automatically pushes the queued changes to the server without losing any data.
4.  **Performance Profiling**: Run the Flutter devtools performance profiler while rendering the trainer map and scrolling through a logged workout with many sets. Optimize any slow-rendering widgets by using `const` constructors where possible.

#### Verification Criteria
*   Confirm that the app handles lost connections gracefully, displaying a status bar banner indicating the offline state without interrupting active workouts.
*   Assert that the sync engine successfully reconciles and pushes offline workouts to the server once connection is restored.