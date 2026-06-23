# iOS vs Flutter — Live Workout Implementation Comparison

> **Generated**: 2026-06-23  
> **iOS App**: `~/pr/Ziro-Fit` (Swift/SwiftUI)  
> **Flutter App**: `~/pr/zf-fl` (Dart/Flutter)  
> **Scope**: Full feature comparison + implementation plan

---

## Table of Contents

1. [Architecture Comparison](#1-architecture-comparison)
2. [Models / Data Layer](#2-models--data-layer)
3. [State Management](#3-state-management)
4. [Views / UI Layer](#4-views--ui-layer)
5. [Session Timer](#5-session-timer)
6. [Rest Timer](#6-rest-timer)
7. [Input System](#7-input-system)
8. [Exercise Management](#8-exercise-management)
9. [Finish / Cancel Flows](#9-finish--cancel-flows)
10. [Voice Features](#10-voice-features)
11. [Session History](#11-session-history)
12. [Exercise Library Sync](#12-exercise-library-sync)
13. [Templates & Programs](#13-templates--programs)
14. [Live Activities & Minimized Mode](#14-live-activities--minimized-mode)
15. [Personal Records (PRs)](#15-personal-records-prs)
16. [Offline / Sync Resilience](#16-offline--sync-resilience)
17. [Session Recovery](#17-session-recovery)
18. [Feature Gap Summary](#18-feature-gap-summary)
19. [Implementation Roadmap](#19-implementation-roadmap)

---

## 1. Architecture Comparison

### iOS Architecture

| Layer | Pattern | Details |
|---|---|---|
| State | `ObservableObject` Singleton | `WorkoutManager.shared` — single source of truth |
| Timer | ObservableObject sub-module | `WorkoutTimer` + `RestTimerManager` injected via weak refs |
| UI | SwiftUI `@ObservedObject` | Views observe `WorkoutManager` directly |
| API | `APIService` extensions | `APIService+Workouts.swift` — async/await |
| Persistence | `CacheManager` + `UserDefaults` | JSON cache for history, exercises, routines |
| Sync | `SyncManager` queue | Offline queue for failed mutations |
| Navigation | `@EnvironmentObject` appState | Tab-based navigation, sheet presentation |
| File structure | Monolithic | ~2.5k lines `WorkoutManager`, ~1k lines `WorkoutSessionView` |

### Flutter Architecture

| Layer | Pattern | Details |
|---|---|---|
| State | `Cubit` (BLoC) | `WorkoutSessionCubit` — injectable, scoped |
| Timer | `Timer.periodic` inside Cubit | 1-second tick in `_tick()` method |
| UI | `BlocConsumer`/`BlocBuilder` | Reactive state → widget mapping |
| API | `Dio` service class | `WorkoutSessionApiService` — injectable |
| Persistence | `drift` (SQLite) for local DB | `WorkoutSessionsTable` with sync support |
| Sync | Separate `SyncCubit` + `SyncRepository` | Full pull/push sync engine |
| Navigation | GoRouter (custom router) | Named routes |
| File structure | Feature-first | Clean separation: `cubit/`, `data/`, `presentation/` |

### Key Architectural Differences

| Aspect | iOS | Flutter | Assessment |
|---|---|---|---|
| State management | Singleton ObservableObject (tight coupling) | Cubit (scoped, testable, DI-friendly) | ✅ Flutter better |
| Timer logic | Sub-module with weak ref (complex) | Inline in cubit with `Timer.periodic` | ⚠️ iOS has cleaner separation |
| Data persistence | JSON file cache + UserDefaults | SQLite (Drift) with structured sync | ✅ Flutter better (proper DB) |
| Code organization | Monolithic manager (~2500 lines) | Feature-first (max ~250 lines/file) | ✅ Flutter better |
| Reactive updates | `@Published` + `objectWillChange` | `emit()` + sealed union states | ✅ Flutter better (type-safe) |

---

## 2. Models / Data Layer

### Models Comparison

| Model | iOS | Flutter |
|---|---|---|
| **WorkoutSession** | `WorkoutSession` (struct, Codable, nested) | `WorkoutSessionDto` (freezed, flat) |
| **Exercise** | `WorkoutExercise` (nested sets array) | `ExerciseDto` (standalone catalog entry) |
| **Set/Log** | `WorkoutSet` (separate model) | `ExerciseLogDto` (flat log entry) |
| **Template** | `WorkoutTemplate` + `TemplateExercise` | Not yet implemented |
| **Program** | `WorkoutProgram` (scheduled templates) | Not yet implemented |
| **Status** | `WorkoutSessionStatus` enum | `String?` in DTO |
| **Set status** | `SetStatus` enum (normal/warmUp/dropSet/failure) | Not implemented |
| **Focus metric** | `FocusMetric` enum (none/volume/maxWeight/maxReps) | Not implemented |
| **Records** | `NewRecord` struct | Not implemented |
| **API Session** | `ApiWorkoutSession` (complex decoder) | `WorkoutSessionDto` (simple fromJson) |

### Key Model Differences

| Feature | iOS | Flutter |
|---|---|---|
| **Nested exercises vs flat logs** | `WorkoutSession.exercises: [WorkoutExercise]` each with `sets: [WorkoutSet]` | Flat `List<ExerciseLogDto>` grouped by `exerciseId` in UI |
| **Exercise details on log** | `SessionExerciseDetail` on each log | `ExerciseDto?` on each log |
| **RPE on sets** | `Double?` on `WorkoutSet` | Not on `ExerciseLogDto` |
| **Tempo on sets** | `String?` on `WorkoutSet` | `String?` on `ExerciseLogDto` (exists) |
| **Side (unilateral)** | Not explicit | `String side @Default('BOTH')` — Flutter has this! |
| **Superset support** | `superSetId` on `WorkoutExercise` + `WorkoutSet` | `supersetKey` + `orderInSuperset` on `ExerciseLogDto` |
| **Set status indicators** | W (warmup), D (dropset), F (failure) | Not implemented |
| **Rest duration per set** | `restDuration: Int?` on `WorkoutSet` | Not on `ExerciseLogDto` |
| **Log ID tracking** | `logId` on `WorkoutSet` for API sync | `id` IS the log ID on `ExerciseLogDto` |
| **Session name** | `name: String?` (Package Session naming) | `name: String?` on DTO (exists) |
| **Summary fallback** | `summaryVolume`, `summaryDuration` for list views | No summary — full fetch required |
| **Trainer info** | `trainerName`, `trainerAvatarUrl` on session | Not on `WorkoutSessionDto` |
| **Planned session link** | `plannedSessionId: String?` on session | `workoutTemplateId` on DTO (different purpose) |

### ⚠️ Gaps in Flutter Models

1. **No `SetStatus`** — can't mark warm-up, drop sets, or failure sets
2. **No `FocusMetric`** — per-exercise metric tracking
3. **No `NewRecord` model** — PR detection/handling absent
4. **No `restDuration` on log** — can't track per-set rest time
5. **No `trainerName`/`trainerAvatarUrl`** on session DTO
6. **No `summaryVolume`/`summaryDuration`** — list views need full fetch
7. **No template / program models** in Flutter at all

---

## 3. State Management

### iOS State Machine (`WorkoutManager`)

```
INITIAL → startSession() → ACTIVE (isSessionActive=true)
ACTIVE → endSession() → COMPLETED (isSessionActive=false, added to history)
ACTIVE → cancelSession() → CANCELLED (session=nil, isSessionActive=false)
ACTIVE → minimize() → MINIMIZED (isMinimized=true, overlay view visible)
MINIMIZED → maximize() → ACTIVE
```

Published properties driving UI:
- `session: WorkoutSession?`
- `isSessionActive: Bool`
- `isMinimized: Bool`
- `timer.elapsedTime`, `timer.isTimerRunning`
- `restManager.remainingTime`, `restManager.isRunning`
- `showRestTimerFinishedToast: Bool`
- `showLongSessionWarning: Bool`
- `showNewRecordsToast: Bool`, `newRecords: [NewRecord]`
- Various loading/pagination flags

### Flutter State Machine (`WorkoutSessionCubit`)

```
initial → loadCurrent()/start() → loading → active
initial → start() → loading → active
active → finish() → loading → completed
active → pause() → active(isPaused=true)
paused → resume() → active(isPaused=false)
active → startRest() → active(restStartedAt=now)
resting → endRest() → active(restStartedAt=null)
any → error (on API failure)
```

State class properties:
```dart
@freezed
sealed class WorkoutSessionState {
  initial()
  loading()
  active(session, logs, elapsed, isPaused, restStartedAt, restElapsed)
  completed(session, totalDuration, logs)
  error(message)
}
```

### State Management Gaps (Flutter)

| Feature | iOS | Flutter |
|---|---|---|
| Minimized mode | `isMinimized` + overlay view | Not implemented |
| Long session warning | 2h warning, 4h auto-end | Not implemented |
| New records toast | `showNewRecordsToast` + list | Not implemented |
| Session conflict handling | Alert dialog for overlapping sessions | Not implemented |
| Active routine tracking | `activeRoutine` + `nextTemplateIndex` | Not implemented |
| Exercise stats cache | `exerciseStats` dictionary (computed from history) | Not implemented |

---

## 4. Views / UI Layer

### View Hierarchy Comparison

```
iOS WorkoutSessionView                    Flutter WorkoutSessionScreen
├── backgroundView                        ├── Scaffold
├── VStack                                │   ├── AppBar (title, history btn)
│   ├── WorkoutSessionHeader              │   └── BlocConsumer body
│   │   ├── Timer display                 │       ├── _buildIdle (idle state)
│   │   ├── Exercise count                │       └── _buildActive
│   │   ├── Rest timer bar                │           ├── Timer Bar (Container)
│   │   └── Save template btn             │           │   ├── Elapsed time row
│   └── WorkoutSessionContent             │           │   ├── Pause/Rest badge
│       ├── Exercise list (ScrollView)    │           │   └── Rest timer progress
│       └── WorkoutExerciseCard           │           ├── Exercise list (ListView)
│           ├── Header (name, mg)         │           │   └── _ExerciseCard
│           ├── Set rows                  │           │       ├── Header (name, mg)
│           └── Add set button            │           │       ├── Table header (SET/WEIGHT/REPS)
├── WorkoutSessionControls                │           │       ├── _SetRow rows
│   ├── Pause/Resume button               │           │       └── Add set button
│   ├── Finish button                     │           └── Bottom controls (AnimatedOpacity)
│   ├── Add Exercise button               │               ├── Pause/Resume button
│   ├── Templates button                  │               └── Finish button
│   └── Voice button                      │
├── Input overlay                         ├── Keyboard overlay (Positioned)
│   ├── Numeric keyboard                  │   └── WorkoutNumericKeyboard
│   ├── Plate calculator                  │
│   └── RPE picker                        │
├── Finish alert                          ├── Finish dialog (AlertDialog)
├── Cancel alert                          │
├── Exercise picker (sheet)               ├── Exercise picker dialog
├── Rest timer sheet (sheet)              │
├── Template picker (sheet)               │
├── Voice overlay (sheet)                 │
├── Long session warning alert            │
└── Save template alert                   │
```

### UI Gaps in Flutter

| UI Component | iOS | Flutter | Priority |
|---|---|---|---|
| **Exercise count in header** | Shows "Exercise X of Y" | Missing | Medium |
| **Rest timer sheet** | Full sheet with presets + custom + progress | Only linear progress bar in timer bar | **HIGH** |
| **Template picker** | Full sheet to select/load templates | Missing entirely | **HIGH** |
| **Save as template** | Alert dialog + API flow | Missing | Medium |
| **Cancel workout flow** | Confirmation alert + destructive action | Missing (only finish) | Medium |
| **Plate calculator overlay** | Full plate loading calculator | Not implemented | Low |
| **RPE picker overlay** | 1-10 RPE scale picker | Not implemented | Medium |
| **Set status indicator** | W/D/F badges on set number | Only completion checkmark | Low |
| **Previous sets column** | Shows historical sets for comparison | Not implemented | Medium |
| **Warm-up / drop-set / failure** | `SetStatus` with visual indicators | Not implemented | Low |
| **Long session warning** | 2-hour + 4-hour safety alerts | Not implemented | Medium |
| **Drag to dismiss** | Swipe down gesture → minimize | Not implemented | Low |
| **History button** | Button in AppBar | "Coming soon" snackbar | Medium |
| **Session conflict alert** | Dialog when starting with active session | Not implemented | Medium |
| **New records toast** | Celebration toast with records | Not implemented | Low |
| **Rest timer finish toast** | In-app + notification + sound + haptic | No notification/sound | Low |
| **Voice coach overlay** | Full AI coach conversation UI | Not implemented | Low |
| **Voice dictation** | Speech-to-text for set logging | Not implemented | Low |
| **Rest timer progress bar** | Visual at top of content area | Basic LinearProgressIndicator | Medium |
| **Minimize mode** | Floating mini player when dismissed | Not implemented | Low |
| **YouTube video player** | Sheet to watch exercise demo video | Not implemented | Low |

---

## 5. Session Timer

### iOS Implementation

```swift
class WorkoutTimer: ObservableObject {
    @Published var elapsedTime: TimeInterval = 0
    @Published var isTimerRunning = false
    private var timer: AnyCancellable?
    
    func start(startTime: Date)  // Timer.publish(every: 1, on: .main)
    func stop()
    func reset()
    
    // Safety: MAX_WORKOUT_DURATION = 4h, WARNING_DURATION = 2h
    // Auto-ends session at 4 hours
    // Shows warning at 2 hours
    
    var formattedTime: String  // "MM:SS" or "H:MM:SS"
}
```

### Flutter Implementation

```dart
// In WorkoutSessionCubit
Timer? _timer;

void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) => _tick());
}

void _tick() {
    // Only ticks if state is Active && !isPaused
    emit(current.copyWith(elapsed: current.elapsed + Duration(seconds: 1)));
}
```

### Timer Gaps (Flutter)

| Feature | iOS | Flutter |
|---|---|---|
| Start time tracking | Uses `Date` for accurate elapsed calc | Uses `Duration` counter (drifts) |
| Pause preserves time | Timer stops, resume recalculates from start | `isPaused` flag stops ticks |
| Max duration safety | 4-hour auto-end with warning chain | Not implemented |
| Long session warning | 2-hour alert: "Still active?" | Not implemented |
| Formatted display | `H:MM:SS` or `MM:SS` in header | `H:MM:SS` or `MM:SS` in timer bar |

> **⚠️ Critical**: iOS uses `Date().timeIntervalSince(startTime)` for accuracy. Flutter uses accumulated `Duration` which can drift. Should track `startTime: DateTime` and calculate elapsed from that.

---

## 6. Rest Timer

### iOS Implementation

`RestTimerManager` (ObservableObject):
```swift
@Published var remainingTime: TimeInterval
@Published var totalTime: TimeInterval
@Published var isRunning = false
@Published var activeSetId: String?

func start(duration: TimeInterval, setId: String?)
func stop()
func adjust(by seconds: TimeInterval)  // Add/subtract time

// Notification: UNTimeIntervalNotificationTrigger
// Sound: AudioServicesPlaySystemSound(1022)
// Haptic: UINotificationFeedbackGenerator.success
// Toast: showRestTimerFinishedToast (3s auto-hide)
```

**Rest Timer Sheet** (`RestTimerSheet`, `.presentationDetents([.fraction(0.82)])`):
- Circular progress ring
- Time display (MM:SS)
- Quick presets: 30s, 60s, 90s, 120s, custom
- +30s / -30s adjustment buttons
- Skip button
- `RestTimerProgressBar` in the header area (linear)

**Auto-start logic**: When a set is completed (`isCompleted = true`), rest timer starts automatically with the set's `restDuration` (default 120s).

### Flutter Implementation

```dart
// In WorkoutSessionCubit (no separate RestTimerManager)
emit(current.copyWith(
    restStartedAt: DateTime.now(),
    restElapsed: Duration.zero,
));

// Rest timer tick happens in the main _tick():
if (current.restStartedAt != null) {
    newRestElapsed = DateTime.now().difference(current.restStartedAt!);
}
```

**Rest UI**: Only linear progress bar in the timer bar area:
```dart
LinearProgressIndicator(
    value: (restElapsed.inSeconds % 120) / 120.0,  // Fixed 120s, not dynamic
)
Skip button: cubit.endRest()
```

### Rest Timer Gaps (Flutter)

| Feature | iOS | Flutter |
|---|---|---|
| **Separate manager class** | `RestTimerManager` with timer, notification, sound | Inline in cubit | Low |
| **Full rest sheet** | Modal with progress ring, presets, controls | Not implemented | **HIGH** |
| **Duration presets** | 30s, 60s, 90s, 120s, custom (saved) | Not implemented | **HIGH** |
| **Adjustment (+/-)** | ±30 seconds | Not implemented | Medium |
| **Dynamic duration** | Per-set `restDuration` from template | Fixed 120s constant | **HIGH** |
| **Notification on finish** | Local notification + system sound | Not implemented | Medium |
| **Haptic feedback** | Notification feedback on finish | Not implemented | Low |
| **Finish toast** | In-app "Rest finished" toast | Not implemented | Low |
| **Circular progress** | Progress ring in sheet | Linear only | Medium |
| **Custom timers saved** | UserDefaults persistence | Not implemented | Low |
| **Auto-start on set complete** | ✅ Yes | ✅ Yes (in `_completeSet`) | ✅ Done |
| **Skip rest** | ✅ Yes | ✅ Yes (`endRest()`) | ✅ Done |
| **Rest timer in API** | ✅ Not synced to API | ✅ Has endpoints (`startRest`/`endRest`) | ✅ Done |

---

## 7. Input System

### iOS Input System

Comprehensive system with overlay-based input:

**Focus management**:
```swift
enum SessionFocusField: Hashable {
    case weight(setId: String)
    case reps(setId: String)
    case rpe(setId: String)
    case tempo(setId: String)
}

enum WorkoutInputOverlay {
    case keyboard
    case plateCalculator
    case rpePicker
    case none
}
```

**Three overlays** (animated bottom sheet within ZStack):

1. **Numeric Keyboard** (`WorkoutNumericKeyboard`):
   - 0-9 grid, comma, backspace
   - Action column: dismiss, contextual action (⚡ plate calc / RPE), +/-, Next
   - Weight increments: 1.25kg (plate math)
   - Reps increments: 1

2. **Plate Calculator** (`PlateCalculatorOverlay`):
   - Calculates plate loading based on bar weight
   - Keyboard toggle button in corner

3. **RPE Picker** (`RPEPickerOverlay`):
   - 1-10 scale with descriptions
   - Auto-opens when tapping RPE field

**Navigation flow**: weight → reps → next set's weight → dismiss (or RPE/tempo if present)

### Flutter Input System

```dart
enum _FieldType { weight, reps }

class _FocusTarget {
    final String exerciseId;
    final int setIndex;
    final _FieldType fieldType;
}
```

**Single overlay**: `WorkoutNumericKeyboard` (Positioned at bottom):
- 0-9 grid, comma, backspace
- Action column: dismiss, +/-, Next/Done
- Weight increments: 1.25kg
- Reps increments: 1

### Input System Gaps (Flutter)

| Feature | iOS | Flutter |
|---|---|---|
| **RPE field/editor** | Full RPE picker overlay with scale 1-10 | Not implemented | Medium |
| **Tempo field** | `tempo` field on sets with keyboard input | In model but not in UI | Low |
| **Plate calculator** | Visual plate loading calculator | Not implemented | Low |
| **Set status selector** | Warm-up/Drop/Failure badge selector | Not implemented | Low |
| **Previous sets reference** | "Previous" column showing last workout data | Not implemented | Medium |
| **Field type enum** | 4 types (weight, reps, rpe, tempo) | 2 types (weight, reps) | Medium |

---

## 8. Exercise Management

### iOS

- **Add from library**: Sheet with `ExerciseSelectionView` (searchable, categorized)
- **Add custom exercise**: Text name → temp ID → API create → ID swap
- **Remove exercise**: Swipe or button → confirm → API delete logs → local remove
- **Change exercise**: Swap exercise while keeping sets
- **Reorder exercises**: Not found in base code (may be in content view)
- **Superset grouping**: Toggle superset → link exercises with shared `superSetId`
- **Pre-populate from template**: `prepareExercises(from:)` with rest absorption
- **Historical data on exercise**: `previousSets: [WorkoutSet]?` for comparison

### Flutter

- **Add from library**: `_ExercisePickerDialog` (searchable dialog, not a sheet)
- **Add custom exercise**: Not implemented
- **Remove exercise**: Stub method (`removeExercise`) with TODO comment
- **Change exercise**: Not implemented
- **Reorder exercises**: Not implemented
- **Superset grouping**: `supersetKey`/`orderInSuperset` in model but not in UI
- **Pre-populate from template**: Not implemented
- **Historical data**: Not implemented

### Exercise Management Gaps (Flutter)

| Feature | iOS | Flutter | Priority |
|---|---|---|---|
| Search exercise library | ✅ Yes | ✅ Yes (basic contains) | ✅ Done |
| Filter by muscle/equipment | ✅ Yes | ✅ Yes (muscleGroup + category) | ✅ Done |
| Add custom exercise | ✅ Server create + ID swap | ❌ Not implemented | Medium |
| Remove exercise | ✅ Local + API | ❌ Stub only | **HIGH** |
| Change exercise (swap) | ✅ Keep sets, swap ID | ❌ Not implemented | Low |
| Superset UI | ✅ Toggle button + visual group | ❌ Model exists, no UI | Low |
| Template pre-population | ✅ With rest absorption | ❌ Not implemented | **HIGH** |
| Historical data column | ✅ Previous sets shown | ❌ Not implemented | Medium |
| Exercise reorder | ✅ Drag handle (likely) | ❌ Not implemented | Medium |

---

## 9. Finish / Cancel Flows

### iOS

**Finish** (`FinishWorkoutAlert`):
- Two options presented in custom overlay:
  1. "Complete unfinished sets" — auto-completes sets with data
  2. "Discard unfinished sets" — removes incomplete sets
  3. Cancel
- Validates: empty session check (no completed sets → "Please complete at least one set")
- End of session:
  - Clean up empty sets
  - Cap duration at 4h
  - `endTime = Date()`
  - Insert into `completedSessions` (immediate UI)
  - Calculate exercise stats
  - Track analytics
  - Show new records toast
  - Background: sync all sets in bulk → POST finish → update calendar event
  - Offline: `SyncManager.enqueue` if API fails

**Cancel** (`showCancelAlert`):
- Confirmation: "Back" / "End Workout" (destructive)
- `cancelSession()`: stop timer, clear session, POST cancel API
- No history entry

### Flutter

**Finish** (`_confirmFinish`):
- Simple `AlertDialog` with "Cancel" / "Finish"
- No completion option selection
- Calls `cubit.finish()` → API call
- Validates nothing
- On success: emits `WorkoutSessionCompleted` + snackbar

**Cancel**: Not implemented as separate flow

### Finish/Cancel Gaps (Flutter)

| Feature | iOS | Flutter | Priority |
|---|---|---|---|
| Completion options | Complete unfinished / Discard unfinished / Cancel | Single "Finish" button | **HIGH** |
| Empty session validation | Checks for completed sets, shows alert | No validation | Medium |
| Auto-complete sets with data | Sets isCompleted = true for partial sets | Not implemented | Medium |
| Discard incomplete sets | Removes unfilled sets | Not implemented | Medium |
| Cancel workout flow | Confirmation → destructive action | Not implemented | **HIGH** |
| Cancel API call | POST to cancel on server | Not implemented | **HIGH** |
| Bulk sync on finish | Uploads all unsynced sets | Single finish API call | Medium |
| Calendar event update | Updates planned session to completed | Not implemented | Low |
| Analytics tracking | Workout completed events | Not implemented | Low |

---

## 10. Voice Features

### iOS Voice Dictation

Full voice integration:
- `VoiceLogManager.shared` — speech-to-text
- Parse commands: "bench press 50 kg 5 reps"
- `ParsedWorkoutCommand` with type: addSet, finishSession, deleteLastSet, repeatLastSet, adjustLastSet, correctLastSet, startRest, stopRest, adjustRest
- Exercise name resolution: 6-tier matching (exact → substring → library → popular defaults → keyword)
- Confirmation card: shows detected command with Change button
- Auto-confirm after recording ends
- Audio-reactive mic animation
- `VoiceFeedbackManager` speaks confirmation

### iOS AI Coach

- `VoiceCoachManager.shared` — conversational AI coach
- Full overlay with conversation bubbles
- Listen → process → speak response flow
- Waveform animation with audio levels
- Supabase Realtime integration for AI responses

### Flutter Voice Features

**Not implemented at all.**

---

## 11. Session History

### iOS

- `completedSessions: [WorkoutSession]` on WorkoutManager
- `CacheManager` JSON persistence (UserDefaults fallback)
- `fetchPersonalHistory()` — cursor-based pagination from API
- `fetchHistory(for client:)` — trainer viewing client history
- `deleteSession()` — optimistic removal + API call + rollback on failure
- Weekly workout count, current streak, longest streak computed properties
- History views: `WorkoutHistoryView`, `RecentWorkoutRow`, `CompletedSessionDetailView`
- Summary: volume, duration, total sets, exercise details

### Flutter

- `SessionHistoryResponse` model exists
- `getHistory()` API endpoint exists
- No UI for history (stub: "coming soon")
- No local caching/syncing of history
- No streak/analytics computation

---

## 12. Exercise Library Sync

### iOS

- `fullLibrary: [Exercise]` — complete in-memory cache
- Initial load: paginated fetch (100 per page, up to 50 pages = 5000 cap)
- Delta sync: `GET /api/exercises/sync?lastPulledAt=timestamp`
- Recovery: if < 100 items with timestamp, force full re-sync
- Periodic disk checkpoint saves
- Fuzzy search: 7-tier scoring (exact → starts with → word boundary → substring → token match → fuzzy → metadata)
- Cache: `CacheManager` + UserDefaults timestamp
- Pagination state for legacy compatibility

### Flutter

- `GET /api/exercises/sync?lastPulledAt=0` (always full sync)
- No delta sync tracking
- No local cache
- Basic search: simple `contains()` on name/muscleGroup/category
- No fuzzy/typo-tolerant search

---

## 13. Templates & Programs

### iOS

- `WorkoutTemplate` with `TemplateExercise` array (supports REST steps, supersets, labels)
- `WorkoutProgram` — scheduled collection of templates
- `activeRoutine` tracking with `nextTemplateIndex`
- Template picker: `TemplatePickerView` — browse and select
- Save session as template: alert → name → API create → populate exercises
- Template detail: `TemplateDetailView`
- Program start: `startRoutine()` → save to UserDefaults
- Scheduled programs: sequential/daily/weekly frequency

### Flutter

**Not implemented at all.** No template models, no program models, no template-related views.

---

## 14. Live Activities & Minimized Mode

### iOS

- `WorkoutMiniPlayer`: overlay when minimized (drag down gesture)
- `LiveActivityManager`: iOS Lock Screen / Dynamic Island integration
- `WorkoutLiveActivityWidget`: widget with elapsed time, exercise name, sets
- `SharedWorkoutAttributes`: ActivityKit attributes for Live Activities
- Minimize gesture: drag down > 120pt → minimize with animation

### Flutter

**Not implemented.** No minimized mode, no lock screen widget integration.

---

## 15. Personal Records (PRs)

### iOS

- `NewRecord` model: recordType, exerciseId, oldRecord, newRecord
- Detection in `saveSet()`: compares against history
- First-time PR bonus (first time doing an exercise)
- Accumulated during session → displayed as toast at end
- Server returns `newRecords` from logSet API
- Haptic + visual celebration

### Flutter

- `LogExerciseResponse` has `newRecords` field ✅
- But `NewRecord` model not implemented
- No PR detection or display

---

## 16. Offline / Sync Resilience

### iOS

- `SyncManager.shared.enqueue(type:payload:)` for failed mutations
- Payloads: `LogSetPayload`, `FinishWorkoutPayload`
- `savePendingSession()` for crash recovery
- `checkForActiveSession()` on app start
- Optimistic UI with API reconciliation

### Flutter

- Full sync engine exists (`SyncCubit` + `SyncRepository`)
- Drift-based offline storage
- Pull/push sync mechanism
- **BUT**: workout session cubit does NOT use the sync engine
- No offline queue for workout operations

---

## 17. Session Recovery

### iOS

1. Check `GET /api/workout-sessions/live` for active session
2. Fallback: scan calendar events for `session_in_progress` type
3. Auto-finalize sessions older than 4 hours
4. Resumes with correct timer, client info, template
5. Notification observers for external session changes (AI coach)

### Flutter

- `loadCurrent()` calls `GET /api/workout-sessions/live`
- No calendar fallback
- No stale auto-finalization
- No external session change observers

---

## 18. Feature Gap Summary

### Critical Gaps (Must Have for Parity)

| # | Feature | iOS LOC | Flutter Status | Effort |
|---|---|---|---|---|
| 1 | **Rest timer sheet** (presets, progress ring, +/-, custom) | `RestTimerSheet.swift` + `RestTimerProgressBar.swift` | Basic linear bar only | 3-4 days |
| 2 | **Templates system** (models, picker, save, load, pre-populate) | 5+ files, ~800 lines | Not implemented | 5-7 days |
| 3 | **Exercise management** (add/remove/reorder/swap in session) | `WorkoutManager` methods | Remove = stub, swap = missing, reorder = missing | 2 days |
| 4 | **Cancel workout** flow (confirmation, API call, cleanup) | Alert + `cancelSession()` | Not implemented | 1 day |
| 5 | **Finish options** (complete/discard unfinished sets) | `FinishWorkoutAlert` + `finishWithOption()` | Single "Finish" button | 1 day |
| 6 | **Session history UI** (list, detail, delete) | `WorkoutHistoryView`, `CompletedSessionDetailView` | "Coming soon" | 3-4 days |

### Medium Gaps

| # | Feature | Priority | Effort |
|---|---|---|---|
| 7 | RPE field + picker | Medium | 1-2 days |
| 8 | Set status indicators (warmup/dropset/failure) | Medium | 1 day |
| 9 | Previous sets comparison column | Medium | 1 day |
| 10 | Session timer based on `startTime: DateTime` (accuracy) | Medium | 0.5 day |
| 11 | Long session safety warning | Medium | 0.5 day |
| 12 | Session conflict detection | Medium | 0.5 day |
| 13 | Persistent history caching | Medium | 1 day |
| 14 | Template save from session | Medium | 1 day |
| 15 | Exercise library delta sync + local cache | Medium | 1-2 days |
| 16 | Fuzzy search for exercises | Medium | 0.5 day |

### Low Gaps

| # | Feature | Effort |
|---|---|---|
| 17 | PR detection + toast | 1 day |
| 18 | Plate calculator | 0.5 day |
| 19 | Voice dictation | 5+ days (complex) |
| 20 | AI Coach | 5+ days (complex) |
| 21 | YouTube video player | 0.5 day |
| 22 | Minimized mode | 1 day |
| 23 | Drag to dismiss | 0.5 day |
| 24 | Haptic feedback | 0.5 day |

---

## 19. Implementation Roadmap

### Phase 1 — Core Workout UX (Weeks 1-2)

```
Priority: HIGH (items 1-6 from critical gaps)
```

1. **Rest timer sheet** — full modal with presets (30/60/90/120), custom input, progress ring, skip/adjust controls
2. **Cancel workout** — confirmation dialog, API call, state cleanup
3. **Finish options** — complete unfinished / discard unfinished selection in finish dialog
4. **Exercise management** — implement remove exercise (local + API), add reorder support
5. **Session history UI** — list view with cursor pagination, detail view with exercise summary
6. **Persistent history caching** — save completed sessions to local drift DB

### Phase 2 — Templates & Programs (Weeks 3-4)

```
Priority: HIGH (items 3, 14 from gaps)
```

1. **Template models** — `WorkoutTemplateDto`, `TemplateExerciseDto` with freezed
2. **Template API service** — CRUD endpoints for templates
3. **Template picker UI** — searchable grid/list of templates
4. **Template pre-population** — prepare exercises from template with rest absorption
5. **Save session as template** — alert → name → API create
6. **Program models** — `WorkoutProgram` with scheduling

### Phase 3 — Polish & Analytics (Weeks 5-6)

```
Priority: MEDIUM (items 7-16 from gaps)
```

1. **RPE picker** — 1-10 scale overlay
2. **Set status indicators** — warmup/dropset/failure toggle per set
3. **Previous sets column** — show last workout data for comparison
4. **Timer accuracy** — track `startTime: DateTime`, compute elapsed from that
5. **Long session warning** — 2h + 4h safety with auto-end
6. **Session conflict** — detect active session before starting new one
7. **Exercise library sync** — delta sync with `lastPulledAt`, local cache
8. **Fuzzy search** — implement scoring-based search (token match, fuzzy, metadata)

### Phase 4 — Advanced Features (Weeks 7+)

```
Priority: LOW (items 17-24 from gaps)
```

1. **PR detection** — parse `newRecords` from API, display celebration
2. **Minimized mode** — floating mini player overlay
3. **Voice dictation** — speech-to-text for hands-free logging
4. **AI Coach** — conversational AI coaching during workout
5. **YouTube exercise videos** — video playback sheet
6. **Plate calculator** — visual loading calculator
7. **Haptic feedback** — on set complete, rest finish, PR detection

---

## Appendix A: File Reference

### iOS Key Files

| File | Lines | Purpose |
|---|---|---|
| `Managers/WorkoutManager.swift` | 2524 | Central state, all session logic, library sync, history |
| `Views/Common/WorkoutSessionView.swift` | 997 | Main workout screen (all overlays, voice, input system) |
| `Views/Common/WorkoutSessionContent.swift` | — | Scrollable exercise list |
| `Views/Common/WorkoutSessionControls.swift` | — | Bottom action bar |
| `Views/Common/WorkoutSessionHeader.swift` | — | Timer, rest, template button |
| `Views/Common/WorkoutExerciseCard.swift` | — | Exercise card in list |
| `Views/Common/WorkoutSetRow.swift` | — | Individual set row |
| `Views/Components/RestTimerSheet.swift` | — | Modal rest timer |
| `Views/Components/RestTimerProgressBar.swift` | — | Progress ring/bar |
| `Views/Components/WorkoutNumericKeyboard.swift` | — | Custom input keyboard |
| `Views/Components/PlateCalculatorOverlay.swift` | — | Plate loading calculator |
| `Views/Components/RPEPickerOverlay.swift` | — | RPE picker |
| `Views/Components/FinishWorkoutAlert.swift` | — | Finish options modal |
| `Views/Components/ExerciseSelectionView.swift` | — | Exercise library picker |
| `Views/Components/WorkoutMiniPlayer.swift` | — | Minimized session overlay |
| `Services/API/APIService+Workouts.swift` | — | All workout API endpoints |
| `Services/WorkoutRealtimeService.swift` | — | WebSocket/realtime updates |
| `Models/WorkoutModels.swift` | 1300+ | All workout/trainer models |

### Flutter Key Files

| File | Lines | Purpose |
|---|---|---|
| `features/trainers/cubit/workout_session_cubit.dart` | 252 | Central state machine |
| `features/trainers/cubit/workout_session_state.dart` | 36 | Sealed state union |
| `features/trainers/presentation/workout_session_screen.dart` | 1334 | Main workout screen |
| `features/trainers/data/workout_session_api_service.dart` | 183 | Dio API calls |
| `features/trainers/data/workout_session_repository.dart` | 108 | Repository layer |
| `features/trainers/data/models/workout_session_dto.dart` | 24 | Session DTO |
| `features/trainers/data/models/workout_session_response.dart` | 52 | Response models |
| `features/trainers/data/models/exercise_log_dto.dart` | 29 | Exercise log DTO |
| `features/trainers/data/models/exercise_dto.dart` | 21 | Exercise catalog DTO |
| `features/trainers/presentation/widgets/workout_numeric_keyboard.dart` | 343 | Custom number keyboard |
| `core/database/tables/workout_sessions_table.dart` | 35 | Drift table definition |

---

## Appendix B: Backend API Contract Verification

All API endpoints from `AGENTS.md` verified against the Flutter implementation:

| Endpoint | iOS Calls | Flutter Calls | Status |
|---|---|---|---|
| `POST /api/workout-sessions/start` | ✅ `startWorkout()` | ✅ `startSession()` | ✅ |
| `GET /api/workout-sessions/live` | ✅ `getActiveWorkoutSession()` | ✅ `getLiveSession()` | ✅ |
| `POST /api/workout-sessions/live` | ✅ `logSet()` | ✅ `logExercise()` | ✅ |
| `POST /api/workout-sessions/finish` | ✅ `finishWorkout()` | ✅ `finishSession()` | ✅ |
| `GET /api/workout-sessions/history` | ✅ `fetchMyWorkouts()` | ✅ `getHistory()` | ✅ |
| `POST /api/sessions/{id}/exercises` | ✅ `addExerciseToSession()` | ✅ `addExercises()` | ✅ |
| `DELETE /api/sessions/{id}/exercises/{logId}` | ✅ `deleteSessionExerciseLog()` | ❌ Not implemented | ❌ |
| `POST /api/exercises/sync` | ✅ `syncExercises()` | ✅ `getExerciseLibrary()` | ✅ |
| `POST /api/workout-sessions/{id}/rest/start` | ✅ Use endpoint? | ✅ `startRest()` | ✅ |
| `POST /api/workout-sessions/{id}/rest/end` | ✅ Use endpoint? | ✅ `endRest()` | ✅ |

---

> **Note**: This document was generated from a comprehensive audit of both the iOS SwiftUI app (`~/pr/Ziro-Fit`) and the Flutter app (`~/pr/zf-fl`). Workout-related files from both codebases were read in full for the comparison.
