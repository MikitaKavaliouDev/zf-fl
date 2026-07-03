# Plan: Upcoming Session Detail Screen (iOS Parity)

## Problem

Tapping an upcoming session card on the home screen currently does `context.go('/workout')`, which switches to the Workout tab showing `WorkoutHistoryScreen` — the session data is discarded.

## iOS Reference

In `PersonalHomeView.swift` (line 614-618):
```swift
.onTapGesture {
    selectedSessionId = session.id
    showSessionDetail = true
}
```

This presents `UpcomingSessionDetailView` as a **`.sheet`** modal. The detail view (`Views/Client/UpcomingSessionDetailView.swift`):
1. Fetches session by ID via `APIService.shared.fetchSession(byId: sessionId)`
2. Shows header card: session name, formatted date/time, dumbbell icon, trainer name, duration
3. Shows exercises section: grouped exercise cards with name, reps badge, weight, tempo, notes, "Watch Coaching Video" link
4. Shows "Add to Calendar" button (device calendar via `EKEventStore`)

## Existing Flutter Assets

| Asset | Location | Status |
|---|---|---|
| `ClientDashboardSession` | `lib/features/home/data/models/` | Has `id`, `title`, `date`, `duration`, `isTrainerAssigned` |
| `WorkoutSessionCubit.fetchSessionDetails()` | `lib/features/trainers/cubit/` | Calls `GET /api/workout-sessions/{id}` → `LiveSessionResponse` |
| `WorkoutSessionApiService.getSessionDetails()` | `lib/features/trainers/data/` | Same endpoint |
| `LiveSessionResponse` | `lib/features/trainers/data/models/` | Contains `WorkoutSessionDto? session` + `List<ExerciseLogDto> exerciseLogs` |
| `WorkoutSessionDto` | `lib/features/trainers/data/models/` | `id`, `clientId`, `startTime`, `endTime`, `status`, `name`, `notes`, etc. |
| `ExerciseLogDto` | `lib/features/trainers/data/models/` | `id`, `exerciseId`, `reps`, `weight`, `tempo`, `notes`, `rpe`, `isCompleted`, `exercise` (ExerciseDto) |
| `ExerciseDto` | `lib/features/trainers/data/models/` | `id`, `name`, `equipment`, `category`, `muscleGroup`, `videoUrl`, etc. |
| `ZiroSheetHeader` | `lib/features/notifications/presentation/widgets/` | Drag handle + centered title — reusable modal header |
| `add_2_calendar` | `pubspec.yaml` | Already a dependency (used in `RoutineSchedulerScreen`) |
| `CompletedSessionDetailScreen` | `lib/features/trainers/presentation/` | Exists but designed for past/completed sessions (stats-focused, check icon, no Calendar button) |

## Backend Contract

`GET /api/workout-sessions/{id}` returns `{ data: { session: { ... } } }` where session includes:
- `client`: `{ id, name, trainerId, userId }`
- `exerciseLogs`: array with `exercise` nested (id, name, equipment, category, muscleGroup, videoUrl, metricType), ordered by `order` asc then `createdAt` asc
- `comments`: ordered by `createdAt` asc with user info
- `workoutTemplate`: nested with template exercises

Response is mapped through `_normalizeSessionData()` in the Flutter API service before deserialization.

## Implementation Steps

### Step 1: Create `UpcomingSessionDetailScreen`

**Location**: `lib/features/home/presentation/screens/upcoming_session_detail_screen.dart`

**Approach**: New screen widget, presented as a **modal bottom sheet** (iOS `.sheet` parity).

**Structure**:
```
UpcomingSessionDetailScreen
├── init: calls WorkoutSessionCubit.fetchSessionDetails(sessionId)
├── Loading state → Centered CircularProgressIndicator
├── Error state → ZiroErrorWidget with retry
├── Session loaded state → SingleChildScrollView
│   ├── ZiroSheetHeader (drag handle + "Session Details" title)
│   ├── Header Card
│   │   ├── Session name (title2 bold)
│   │   ├── Date/time line (subheadline, gray)
│   │   ├── Trainer name (if available, from session.client)
│   │   └── Duration (minutes from startTime→endTime)
│   ├── Exercises Section
│   │   └── For each exercise (grouped by exerciseId):
│   │       ├── Exercise name (subheadline bold)
│   │       ├── Per-set rows: weight, reps, tempo (if present), notes
│   │       └── "Watch Coaching Video" link (if exercise.videoUrl)
│   └── Add to Calendar button
│       ├── Uses add_2_calendar package
│       └── Shows "Added to Calendar" after success
```

**UI Spec (iOS parity)**:
- Background: `AppColors.background`
- Card background: `AppColors.card` with 16px radius, gray border
- Typography: 14px body, 16px headings, 12px captions
- Primary button: `AppColors.primary` (#007aff) for Calendar button
- No completed stats row (that's for past sessions) — this is for **upcoming** sessions

### Step 2: Wire Navigation in Home Screen

In `home_screen.dart` line 302:
```dart
// Before:
onSessionTap: (_) => context.go('/workout'),

// After:
onSessionTap: (session) => _showUpcomingSessionDetail(context, session.id),
```

Where `_showUpcomingSessionDetail` presents the detail screen as a modal bottom sheet:
```dart
void _showUpcomingSessionDetail(BuildContext context, String sessionId) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.background,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) => UpcomingSessionDetailScreen(sessionId: sessionId),
  );
}
```

### Step 3: Run build_runner (if freezed models need regeneration)

```
flutter pub run build_runner build --delete-conflicting-outputs
```

### Step 4: Verify

- [ ] `dart analyze` — zero errors
- [ ] Modal bottom sheet opens when tapping any upcoming session card
- [ ] Session loads from API (loading → loaded transition)
- [ ] Header shows session name, date/time, trainer, duration
- [ ] Exercises section renders grouped by exercise, with set details
- [ ] "Add to Calendar" button works
- [ ] Error state shows with retry
- [ ] Drag handle / swipe-down dismisses the sheet

## Files to Create

| File | Purpose |
|---|---|
| `lib/features/home/presentation/screens/upcoming_session_detail_screen.dart` | New detail screen (modal bottom sheet) |

## Files to Modify

| File | Change |
|---|---|
| `lib/features/home/presentation/home_screen.dart` | Replace `context.go('/workout')` with modal bottom sheet call |

## What NOT to Do

- Do NOT modify `CompletedSessionDetailScreen` — it's for past sessions and has different UI (stats, check icon)
- Do NOT create a new cubit — `WorkoutSessionCubit.fetchSessionDetails()` already exists and is sufficient
- Do NOT add a new route to `app_router.dart` — presentation via `showModalBottomSheet` avoids routing complexity for a sheet
- Do NOT modify any backend code — the contract is correct
