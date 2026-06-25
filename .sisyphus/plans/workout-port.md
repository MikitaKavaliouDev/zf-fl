# Workout Session — iOS Feature Port Plan

**Status**: Planning  
**Target**: Flutter `WorkoutSessionScreen` full feature parity with iOS `WorkoutSessionView`  
**Current parity**: 57% (44/77 features)  
**Target parity**: 95%+ (voice coach + Live Activity excluded as iOS-native)  

---

## Dependency Graph

```
Phase 1 (Foundation)
├── 1.1 Rest timer inline progress bar          → 1.2 (toast depends on timer completion)
├── 1.2 Rest finished toast + notification      → 1.3
├── 1.3 Custom timer persistence                → (standalone)
├── 1.4 Keyboard integration (plate calc + RPE)  → (standalone)
├── 1.5 Tempo column + input                     → (standalone)
└── 1.6 Haptic feedback                          → applies to all phases

Phase 2 (UI Grouping)
├── 2.1 Superset UI grouping                    → (standalone, model exists)
└── 2.2 Session conflict resolution dialog      → (standalone, cubit has error state)

Phase 3 (Detail & Enrichment)
├── 3.1 Coach Notes popover                     → (standalone)
└── 3.2 Exercise Detail screen (About/History/Charts/Records)

Phase 4 (Gamification)
├── 4.1 PR accumulation at session end           → 4.2
├── 4.2 PR summary toast                         → (standalone)
└── 4.3 Streak / weekly stats                    → (standalone, uses completedSessions)

Phase 5 (Polish)
├── 5.1 Focus Metrics                           → (standalone)
├── 5.2 Drag-to-dismiss + minimize               → (standalone)
├── 5.3 YouTube video playback                    → (standalone)
└── 5.4 Analytics tracking                        → (standalone)
```

---

## Phase 1 — Foundation (Estimated: 2-3 days)

### 1.1 Inline Rest Timer Progress Bar

**File**: `lib/features/trainers/presentation/workout_session_screen.dart`  
**iOS ref**: `RestTimerProgressBar` in `WorkoutSessionHeader.swift`

**Changes**:
- In the timer bar section (around line 300), replace the text-based rest countdown with a capsule-shaped progress bar
- Draw a `CustomPainter` or use a clipped `Container` that fills proportionally to `restRemaining / restDuration`
- Color: orange, matching iOS style
- Keep the "OPEN" tap target to open `RestTimerSheet`

**Success criteria**: When rest timer is active, the header shows an animated orange progress bar with countdown text, matching iOS behavior.

---

### 1.2 Rest Finished Toast + Local Notification

**Files**: 
- `lib/features/trainers/presentation/workout_session_screen.dart` (toast)
- `lib/features/trainers/cubit/workout_session_cubit.dart` (notification trigger)
- `lib/core/network/` or new utility for local notifications

**iOS ref**: `WorkoutSessionControls.swift` `restFinishedToast` + `UNUserNotificationCenter` in `WorkoutManager.notifyRestTimerFinished()`

**Changes**:
1. Add a `showRestFinishedToast` field to `WorkoutSessionActive` state
2. In cubit's `_tick()`, when `restRemaining` transitions from `>0` to `<=0`:
   - Set `showRestFinishedToast = true`
   - Auto-reset after 3 seconds
   - Show haptic + trigger local notification
3. In the screen, render a floating "Rest Finished!" toast above the bottom bar when `showRestFinishedToast` is true
   - Black pill shape with checkmark icon
   - Slide-in animation, 3s auto-dismiss
4. Add local notification via `flutter_local_notifications` package:
   - Register in `main.dart`
   - Fire notification when rest completes in background

**Success criteria**: When rest timer finishes, user sees an animated toast + gets a local notification if app is backgrounded.

**Package**: `flutter_local_notifications` (check if already in pubspec)

---

### 1.3 Custom Timer Persistence

**File**: `lib/features/trainers/presentation/widgets/rest_timer_sheet.dart`  
**iOS ref**: `WorkoutManager.saveCustomTimer()`, `getCustomTimers()`, `getLatestCustomTimer()`

**Changes**:
1. Add a `List<String>` field to `RestTimerSheet` state for saved custom timers
2. On "Start Timer" with custom duration, save to `SharedPreferences`
3. Show saved timers as additional preset buttons at the bottom of the quick select section
4. Max 10 items, LRU eviction

**Success criteria**: Custom rest timer durations persist between app launches and show as quick-selectable presets.

---

### 1.4 Keyboard Integration — Plate Calculator + RPE

**Files**:
- `lib/features/trainers/presentation/workout_session_screen.dart` (lines 486-504, the keyboard overlay section)
- `lib/features/trainers/presentation/widgets/workout_numeric_keyboard.dart` (already has `onAction` callback)

**iOS ref**: `WorkoutSessionView.inputSystemView` — keyboard overlay that switches between `.keyboard`, `.plateCalculator`, `.rpePicker`

**Changes**:
1. In `_WorkoutSessionScreenState`, add an overlay mode enum (mirroring iOS `WorkoutInputOverlay`):
   ```dart
   enum _InputOverlay { keyboard, plateCalculator, rpePicker, none }
   ```
2. When keyboard is active and user taps the contextual action button:
   - If in weight mode → switch to `plateCalculator` overlay
   - If in reps mode → show `RpePicker` as overlay (currently dialog)
3. Pass `onAction` callback to `WorkoutNumericKeyboard` (it's `null` on line 501)
4. The plate calculator overlay should show inline (not as dialog), positioned above the keyboard area
5. The RPE picker overlay should show inline when action button is tapped in reps mode
6. Add a keyboard-toggle button in the top-right of each overlay to switch back

**Success criteria**: 
- Tapping ⚡ button while in weight input mode shows plate calculator inline
- Tapping RPE button while in reps input mode shows RPE picker inline
- Both overlays have a button to switch back to keyboard

---

### 1.5 Tempo Column + Input

**Files**:
- `lib/features/trainers/presentation/workout_session_screen.dart`
- `lib/features/trainers/data/models/exercise_log_dto.dart` (already has `tempo?` field)

**iOS ref**: `WorkoutExerciseCard.cardSetsList` — conditional TEMPO column + `WorkoutSetRow.tempoInput`

**Changes**:
1. Add a tempo column to the set table header (`_buildTableHeader()`) — shown only when any set has tempo data
2. Add tempo field to `_SetRow` — orange text, tappable to edit
3. Handle tempo input via the numeric keyboard (add a `_FieldType.tempo` case)
4. Store tempo via `cubit.logSet(tempo: string)`
5. Backend already supports `tempo` field in `POST /api/workout/log`

**Success criteria**: Users can set and view exercise tempo per set. Tempo column appears when any set has tempo data.

---

### 1.6 Haptic Feedback

**File**: `lib/features/trainers/presentation/workout_session_screen.dart`

**iOS ref**: `HapticManager.shared.impact(.medium)` on set completion, `UINotificationFeedbackGenerator()` on rest finish, finish action

**Changes**:
- Add `HapticFeedback.mediumImpact()` on:
  - Set completion checkbox tap
  - Finish button tap
  - Cancel confirm
  - Rest timer start
  - Rest timer end
  
**Package**: Already available via `flutter/services.dart` (`HapticFeedback`)

---

## Phase 2 — UI Grouping (Estimated: 1-2 days)

### 2.1 Superset UI Rendering

**Files**:
- `lib/features/trainers/presentation/workout_session_screen.dart` — exercise list area (lines 383-434)

**iOS ref**: `WorkoutSessionContent.groupExercises()` + `ExerciseGroup` enum + superset card rendering

**Changes**:
1. Add grouping logic (mirror iOS `groupExercises()`):
   ```dart
   List<ExerciseGroup> _groupExercises(List<ExerciseLogDto> logs) {
     // Group consecutive logs with same supersetKey
   }
   ```
2. Render superset groups as a single card with:
   - Blue "SUPERSET" badge header with link icon
   - Blue-tinted border (vs gray for standalone)
   - Individual exercise cards separated by a divider
3. Add "Create Superset" / "Remove from Superset" options in the exercise 3-dot menu

**Success criteria**: Exercises with matching `supersetKey` render grouped with visual superset indicators.

---

### 2.2 Session Conflict Resolution

**File**: `lib/features/trainers/cubit/workout_session_cubit.dart` (line 78)  
**iOS ref**: `WorkoutManager.startSession()` → `showActiveSessionConflictAlert` → `resolveConflict(startNew:)`

**Changes**:
1. Replace the error state on conflict with a dedicated `WorkoutSessionState.conflict` state
2. Show a dialog in the screen when `state is WorkoutSessionConflict`:
   - Title: "Workout Already in Progress"
   - Option 1: "End Current & Start New" → `cubit.resolveConflict(startNew: true)`
   - Option 2: "Continue Current" → `cubit.resolveConflict(startNew: false)`
3. Add `resolveConflict()` method to cubit that either cancels existing + starts fresh, or loads the existing session

**Success criteria**: Starting a new session while one is active shows a proper conflict resolution dialog instead of an error message.

---

## Phase 3 — Detail & Enrichment (Estimated: 3-4 days)

### 3.1 Coach Notes Popover

**File**: `lib/features/trainers/presentation/workout_session_screen.dart`  
**iOS ref**: `CoachNoteCard` popover with trainer notes + YouTube thumbnail

**Changes**:
1. Add a coach notes indicator (blue bubble icon) next to the exercise name when `exercise.notes` or `exercise.videoUrl` exists
2. On tap, show a bottom sheet with:
   - Trainer name header
   - Notes text
   - YouTube video thumbnail (if videoUrl exists) with play button overlay
3. The play button triggers YouTube video playback (see Phase 5.3)

**Success criteria**: Trainer sessions show a notes indicator that opens a rich popover with notes and video thumbnail.

---

### 3.2 Exercise Detail Screen

**Files**:
- New: `lib/features/trainers/presentation/exercise_detail_screen.dart`
- Update: `lib/features/trainers/presentation/workout_session_screen.dart` (add menu option)
- Update: `lib/core/router/app_router.dart` (add route)

**iOS ref**: `ExerciseDetailView` in `WorkoutExerciseCard.swift` — 4 tabs: About, History, Charts, Records

**Components**:

#### 3.2.1 About Tab
- Show exercise name, muscle group, equipment (from `ExerciseDto`)
- Show video/GIF from `videoUrl`:
  - YouTube: show thumbnail + play button that opens YouTube
  - GIF: animate via cached network image
- Show `description` as instructions text

#### 3.2.2 History Tab
- Filter `WorkoutSessionCubit` history for sessions containing this exercise
- Show date + set details per session
- Empty state: "No history found"

#### 3.2.3 Charts Tab
- Volume progression chart over time
- Use `fl_chart` package (or custom painter)
- Simple line chart with volume (kg) on Y-axis, date on X-axis
- Require ≥2 sessions minimum

#### 3.2.4 Records Tab
- Estimated 1RM (Brzycki formula): `Weight / (1.0278 - 0.0278 * Reps)`
- Max weight
- Max session volume
- Total sessions count
- Display as card grid

**Data source**: The backend `/api/exercises/sync` provides `muscleGroup`, `equipment`, `videoUrl`, `description`. History data comes from `WorkoutSessionRepository.getHistory()`.

**Success criteria**: Users can tap an exercise → 4-tab detail screen with full exercise information, history, charts, and records.

---

## Phase 4 — Gamification (Estimated: 2 days)

### 4.1 PR Accumulation at Session End

**File**: `lib/features/trainers/cubit/workout_session_cubit.dart`

**iOS ref**: `WorkoutManager.saveSet()` accumulates `sessionNewRecords` → shown at `endSession()`

**Changes**:
1. Add `sessionNewRecords: List<NewRecord>` to `WorkoutSessionActive` state
2. In `logSet()`, when `response.newRecords` is non-null, append to accumulated list
3. Pass accumulated records to `WorkoutSessionCompleted` state

**Duck type** (no freezed model needed initially):
```dart
class _NewRecord {
  final String recordType;
  final String exerciseId;
  final double newRecord;
}
```

---

### 4.2 PR Summary Toast at Session End

**File**: `lib/features/trainers/presentation/workout_session_screen.dart`

**iOS ref**: `WorkoutSessionControls.recordToast` — gradient toast with trophy icon + record list

**Changes**:
1. In `_buildCompleted()`, add a "New Records!" section when accumulated records exist
2. Show an animated card with:
   - Trophy icon + "New Records!" header
   - Per-exercise record details (type + value)
   - Linear gradient background (orange→red)

---

### 4.3 Streak / Weekly Stats

**File**: New computed section in cubit or a dedicated helper  
**iOS ref**: `WorkoutManager.weeklyWorkoutsCount`, `currentStreak`, `longestStreak`

**Changes**:
1. Add computed streak/stats to cubit or as a pure utility function
2. Display in the completed screen or idle state

---

## Phase 5 — Polish (Estimated: 2-3 days)

### 5.1 Focus Metrics

**Files**:
- `lib/features/trainers/presentation/workout_session_screen.dart`
- New widget: `focus_metric_selector.dart`

**iOS ref**: `WorkoutExerciseCard.focusMetricSelector` — Menu with FocusMetric options + calculated display

**Changes**:
1. Add a focus metric selector dropdown in the exercise card header
2. Options: None, Volume, Max Weight, Max Reps
3. Show calculated value next to selector
4. Add `FocusMetricInfoSheet` — educational bottom sheet explaining focus metrics

**Note**: This is local-only (no API), computed from completed sets in the current session.

---

### 5.2 Drag-to-Dismiss + Minimize

**File**: `lib/features/trainers/presentation/workout_session_screen.dart`

**iOS ref**: `WorkoutSessionView.dragGesture` + `manager.minimize()`/`maximize()`

**Changes**:
1. Add `GestureDetector` with `onVerticalDragUpdate` on the header area
2. When dragged down past 120px threshold, call dismiss with animation
3. Add minimize/maximize state management (local state, not cubit)
4. On minimize: animate view sliding down, collapse to a mini-player widget at the bottom

---

### 5.3 YouTube Video Playback

**File**: New widget or integration  
**iOS ref**: `YouTubeSheetView` + `manager.activeVideoUrl`

**Changes**:
1. Add a `youtube_player_flutter` or `webview_flutter` package
2. When user taps a video URL (from coach note or exercise detail), open a bottom sheet with YouTube player
3. Hook into `ExerciseDto.videoUrl` field

---

### 5.4 Analytics Tracking

**File**: New utility or integration with existing analytics  
**iOS ref**: `AnalyticsManager.trackWorkoutStarted/Completed/First`

**Changes**:
1. Add analytics calls in cubit `start()` and `finish()` methods
2. Track: workout started (exercise count), workout completed (exercises, duration)
3. Track first workout completion

---

## Summary

| Phase | Features | Est. Effort | Dependencies |
|---|---|---|---|
| **1 — Foundation** | Rest timer toast/notification, keyboard integration, tempo, haptics, custom timers | 2-3 days | None |
| **2 — UI Grouping** | Superset UI, conflict resolution | 1-2 days | None |
| **3 — Detail & Enrichment** | Coach notes, exercise detail screen | 3-4 days | Phase 1 haptics, Phase 5 YouTube |
| **4 — Gamification** | PR accumulation, PR toast, streaks | 2 days | Phase 1 (haptics for PR celebration) |
| **5 — Polish** | Focus metrics, drag-to-dismiss, YouTube, analytics | 2-3 days | None |
| **Total** | **19 features** | **10-14 days** | |

## Backend Validation

All required backend endpoints exist and are verified:
- `tempo` field supported in `POST /api/workout/log`
- `newRecords` returned from `upsertExerciseLog()`
- `GET /api/workout-sessions/{id}/summary` returns `newRecordsCount`, `bestSet`
- Exercise library (`GET /api/exercises/sync`) returns `muscleGroup`, `equipment`, `videoUrl`, `description`
- History (`GET /api/workout-sessions/history`) returns paginated sessions with client data
- Rest endpoints exist: `POST /api/workout-sessions/{id}/rest/start|end`
- Template endpoints exist: `GET /api/client/program/active`, `GET /api/workout-templates/{id}`

## Excluded (iOS-native, not portable)

| Feature | Reason |
|---|---|
| Voice dictation / VoiceLogManager | Uses `SFSpeechRecognizer` (Apple Speech) |
| ElevenLabs AI Coach / WorkoutRealtimeService | Supabase Realtime + ElevenLabs SDK (iOS native) |
| Live Activity / Dynamic Island | iOS-only lock screen widget |
| App Intents for widget controls | Siri/Shortcuts integration |

## File Change Summary

| File | Phase | Change Type |
|---|---|---|
| `lib/features/trainers/presentation/workout_session_screen.dart` | 1, 2, 3, 4, 5 | Major edits (~600 new lines) |
| `lib/features/trainers/cubit/workout_session_cubit.dart` | 1, 2, 4 | Moderate edits (~100 new lines) |
| `lib/features/trainers/cubit/workout_session_state.dart` | 1, 2, 4 | Add fields to `WorkoutSessionActive` |
| `lib/features/trainers/presentation/widgets/rest_timer_sheet.dart` | 1.3 | Moderate edits (~80 new lines) |
| `lib/features/trainers/presentation/widgets/workout_numeric_keyboard.dart` | 1.4 | Minor edits (wire onAction) |
| `lib/features/trainers/presentation/widgets/rpe_picker.dart` | 1.4 | Add inline mode alongside dialog |
| `lib/features/trainers/presentation/widgets/plate_calculator.dart` | 1.4 | Add inline mode alongside dialog |
| `lib/features/trainers/presentation/exercise_detail_screen.dart` | 3.2 | New file (~600 lines) |
| `lib/features/trainers/presentation/widgets/coach_note_card.dart` | 3.1 | New file (~150 lines) |
| `lib/features/trainers/presentation/widgets/focus_metric_selector.dart` | 5.1 | New file (~200 lines) |
| `lib/core/router/app_router.dart` | 3.2 | Add detail route |
| `lib/core/theme/app_theme.dart` | 1.6 | (no changes needed) |
| `pubspec.yaml` | 1.2, 5.3 | Add `flutter_local_notifications`, `youtube_player_flutter` or `webview_flutter` |
