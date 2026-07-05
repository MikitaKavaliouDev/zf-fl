# Plan: Trainer Client Management — Full iOS Feature & Layout Parity

## Overview

Achieve 1:1 feature and layout parity between iOS and Flutter for ALL trainer-facing client management screens. The iOS implementation at `V:\Ziro-Fit` has 13 screens; Flutter currently has ~8 with significant gaps.

**Backend**: `V:\zirofit-next` — all needed endpoints exist under `/api/trainer/clients/` and `/api/clients/`.
**Flutter target**: `lib/features/trainer/` — expand existing feature module.

---

## Architecture Decision Record

### ADR-1: Client Detail Screen — Augment, Don't Refactor
**Decision**: Keep the existing 5-tab `TrainerClientDetailScreen` layout. Add an **Overview section** above the tabs that shows the most actionable iOS-mandated inline cards: active program, packages, start session CTA, management actions, recent activity preview. Tabs become "deep-dive" screens.
**Rationale**: Minimal regression risk. Additive changes only. Tabs still provide value for focused browsing. Can evolve to single-scroll hub later if needed.
**File**: `trainer_client_detail_screen.dart` — will grow from 495 to ~800 lines (matching iOS 786)

### ADR-2: Workout Cache — In-Memory Cubit State
**Decision**: Client workout sessions for the trainer's client detail will be fetched on-demand via `GET /api/clients/{id}/sessions` and cached in cubit state. No Drift persistence for this data.
**Rationale**: The iOS `WorkoutManager.completedSessions` is an in-memory cache filtered by `clientId`. Same pattern in Flutter keeps it simple. Sessions data is already synced via the existing sync architecture — the API fetch is the source of truth.
**File**: New `TrainerClientSessionsCubit`

### ADR-3: Chart Reuse — Extend, Don't Duplicate
**Decision**: The analytics feature (`lib/features/analytics/presentation/widgets/`) already has 7 chart widgets. These will be extended with a `trainerMode` parameter where needed, or their data transformation logic extracted to `lib/core/utils/chart_utils.dart`.
**Rationale**: Zero code duplication. The iOS `TrainerClientAnalyticsView` reuses the same `PersonalAnalyticsViewModel` as the client-side view — same principle.
**Exception**: The volume progression chart for `ClientHistoryView` is a new chart type (line chart with area fill) — should be created in `trainer/presentation/widgets/` since it's trainer-specific.

### ADR-4: Check-in → Proper Cubit Pattern
**Decision**: `TrainerCheckInReviewScreen` will be refactored from raw Dio to a proper cubit (`TrainerCheckInReviewCubit`) with sealed states. The new `TrainerCheckInDetailScreen` will use its own cubit.
**Rationale**: Current raw Dio pattern is an anti-policy violation. Every API-backed screen MUST have a cubit with sealed states.

---

## Phase Breakdown

### Phase 0: Foundation (Backend Contract Verification + DTOs + API Layer)
**Goal**: Verify all backend contracts, create missing DTOs, add API methods, refactor client list endpoint.

#### P0-1: Backend Contract Verification Script
- [ ] Create `scripts/verify-trainer-client-api-contracts.sh`
- [ ] Start backend: `cd V:\zirofit-next && npm run dev`
- [ ] Authenticate as trainer: `POST /api/auth/login` with `ada@ziro.fit` / `password123`
- [ ] Verify every endpoint listed in §10 of analysis doc:
  - `GET /api/trainer/clients` — capture client list shape
  - `GET /api/trainer/clients/{id}` — capture detail shape
  - `GET /api/trainer/clients/{id}/analytics` — capture analytics shape
  - `GET /api/trainer/clients/{id}/habits` — capture habits shape
  - `POST /api/trainer/clients/{id}/habits/{habitId}/log` — verify
  - `GET /api/trainer/clients/{id}/nutrition` — capture nutrition shape
  - `GET /api/trainer/check-ins` — capture check-in list shape
  - `GET /api/trainer/check-ins/{id}` — capture check-in detail shape (especially biofeedback)
  - `GET /api/clients/{id}/sessions` — capture session shape
  - `GET /api/clients/{id}/program/active` — capture active program shape
  - `GET /api/clients/{id}/packages` — capture packages shape
  - `GET /api/trainer/programs` — capture program list shape (for assign program picker)
  - `GET /api/trainer/programs/active` — capture active programs shape
- [ ] Compare each field against existing Flutter DTOs
- [ ] Document any discrepancies

#### P0-2: Create Missing DTOs
- [ ] `TrainerCheckInDetailDto` — biofeedback fields (weight, waistCm, sleepHours, energyLevel, stressLevel, hungerLevel, digestionLevel, photos as `List<CheckInPhotoDto>`, clientNotes)
- [ ] `CheckInPhotoDto` — id, imageUrl, imagePath, caption, photoDate
- [ ] `TrainerClientSessionDto` — id, startTime, endTime, exercises, volume, totalSets, duration
- [ ] `TrainerClientActiveProgramDto` — program (id, name, description), progress (completedCount, totalCount, progressPercentage), templates
- [ ] `TrainerClientProgramTemplateDto` — id, name, description, order, status, exerciseCount
- [ ] `TrainerClientPackageDto` — id, package (name), sessionsRemaining
- [ ] `TrainerProgramListItemDto` — id, name, description, templates (count)
- [ ] `TrainerActiveProgramListItemDto` — programId, programName, clientId, clientName, clientAvatarUrl, assignedDate, currentWeek, totalWeeks, completionRate
- [ ] `TrainerHabitLogDto` — already exists, verify fields match
- [ ] `AssignProgramResponseDto` — already exists, verify fields match

#### P0-3: Add Missing API Methods to `TrainerClientsApiService`
- [ ] Refactor `getClients()` from `session-creation-data` to `GET /api/trainer/clients`
- [ ] Add `getClientSessions(clientId, {limit, offset})` → `GET /api/clients/{id}/sessions`
- [ ] Add `getClientActiveProgram(clientId)` → `GET /api/clients/{id}/program/active`
- [ ] Add `getClientPackages(clientId)` → `GET /api/clients/{id}/packages`
- [ ] Add `getClientDashboard(clientId)` → `GET /api/clients/{id}/dashboard`
- [ ] Add `updateHabit(clientId, habitId, request)` → `PUT /api/trainer/clients/{id}/habits/{habitId}`
- [ ] Add `logHabit(clientId, habitId, request)` → `POST /api/trainer/clients/{id}/habits/{habitId}/log`
- [ ] Add `cancelProgramAssignment(clientId, programId)` → `POST /api/trainer/clients/{id}/programs/{programId}/cancel`
- [ ] Add `requestCheckIn(clientId, request)` → `POST /api/trainer/check-ins/request`
- [ ] Add `deleteNutritionPlan(planId)` → `DELETE /api/trainer/nutrition/{planId}`
- [ ] Add `getActivePrograms()` → `GET /api/trainer/programs/active`

#### P0-4: Fix Existing API Issues
- [ ] Fix `upsertNutritionPlan()` — change from `PUT` to `POST` (backend expects POST)
- [ ] Fix `reviewCheckIn()` — change from `POST` to `PATCH` (backend uses PATCH)
- [ ] Verify `deleteHabit()` uses correct path

#### P0-5: Create `TrainerCheckInReviewCubit`
- [ ] Create `trainer_check_in_review_cubit.dart` with sealed states (initial, loading, loaded, error)
- [ ] Create `trainer_check_in_review_state.dart` with frozen sealed union
- [ ] Methods: `loadCheckIns({status})`, `refresh()`, `loadDetail(id)`
- [ ] Register in DI via `@injectable`

#### P0-6: Create `TrainerClientSessionsCubit`
- [ ] Create `trainer_client_sessions_cubit.dart`
- [ ] State: sessions list, loading, error
- [ ] Methods: `loadSessions(clientId, {limit})`

#### P0-7: Create `TrainerActiveProgramCubit`
- [ ] Create `trainer_active_program_cubit.dart`
- [ ] State: program (nullable), loading, error
- [ ] Methods: `loadProgram(clientId)`, `cancelProgram(clientId, programId)`

#### P0-8: Regenerate Code
- [ ] Run `flutter pub run build_runner build --delete-conflicting-outputs`
- [ ] Run `dart analyze` — zero errors
- [ ] Run `flutter test` — all pass

---

### Phase 1: P0 Screens (Check-in Detail, Workout History, Analytics Charts)
**Goal**: Build the 3 major missing screens that give the most visible parity.

#### P1-1: Refactor `TrainerCheckInReviewScreen` to Use Cubit
- [ ] Replace raw `Dio` with `BlocProvider<TrainerCheckInReviewCubit>`
- [ ] Add segmented Picker (SUBMITTED / REVIEWED) — iOS parity
- [ ] Add `CheckInRow` widget with avatar initial circle, client name, date, "Review" badge (blue) or green checkmark
- [ ] Add pull-to-refresh
- [ ] Handle loading/empty/error states
- **Success**: Zero raw Dio usage in check-in screen

#### P1-2: Create `TrainerCheckInDetailScreen` + `TrainerCheckInDetailCubit`
- [ ] New `trainer_check_in_detail_cubit.dart` — loads check-in by ID, manages review submission
- [ ] New `trainer_check_in_detail_state.dart` — frozen sealed union
- [ ] New screen in `trainer/presentation/checkins/trainer_check_in_detail_screen.dart`
- **Layout** (matching iOS `CheckInDetailView`):
  - `StatsGrid` — 3-column: Weight (kg), Waist (cm), Sleep (hrs) — each with SF Symbols-style icon
  - `BiofeedbackSection` — 4 rows: Energy/Stress/Hunger/Digestion with /10 value and color coding (green ≥7, orange 4-6, red <4)
  - `PhotosSection` — horizontal scroll, 120x160 images
  - `ClientNotesSection` — card with client's notes text
  - `TrainerFeedbackSection` — TextEditor + "Submit Review" button (disabled when empty)
  - Read-only mode when status is "REVIEWED" — show "Reviewed on [date]" green label instead
- **States**: Loading, loaded, error, submitting, submitted (pop back)
- **Route**: `/trainer/checkins/:id` — full-screen, no bottom nav

#### P1-3: Create `TrainerClientHistoryScreen` + `TrainerClientHistoryCubit`
- [ ] New `trainer_client_history_cubit.dart` — loads sessions for a client
- [ ] New screen in `trainer/presentation/clients/trainer_client_history_screen.dart`
- **Layout** (matching iOS `ClientHistoryView`):
  - Navigation title: `client.name`
  - `VolumeProgressionChart` — `fl_chart` `LineChart` with gradient area fill below the line
    - X-axis: dates (chronological)
    - Y-axis: volume (kg)
    - Catmull-Rom interpolation — fl_chart's `isCurved: true`
    - Gradient fill: use `FlTitlesData` for axis labels, `LineChartBarData` with `belowBarData`
  - `WorkoutHistoryList` — reverse-chronological session cards
    - Each card: date box (month/day) + stats row (volume/sets/duration) + exercise preview
- **States**: Loading, empty (`EmptyHistoryView` with icon), loaded (chart + list), error
- **Route**: `/trainer/clients/:id/history` — full-screen

#### P1-4: Refactor Analytics Tab with Full Charts
- [ ] Refactor `TrainerClientAnalyticsCubit` — load full analytics data
- **Layout** (matching iOS `TrainerClientAnalyticsView`):
  - Segmented period picker (7/30/90/180/365 days) — iOS uses toolbar segment
  - `VolumeChart` — reuse/extend `VolumeLineChartWidget` from `analytics/presentation/widgets/`
  - `SummaryCards` — Volume (kg + trend arrow + %) and Frequency (/week + trend arrow + %)
  - `MuscleDistribution` — reuse/extend `MuscleDonutChartWidget` or create simple list with colored dots
  - `PRsSection` — trophy icon + exercise name + value + type
  - `ConsistencyHeatmap` — `LazyVGrid` 7-column grid with colored cells (last 28 days)
- **Key**: Reuse existing analytics widgets with `trainerMode: true` parameter
- **Route**: Still part of client detail tabs (tab index 2)

#### P1-5: Add Router Routes
- [ ] `/trainer/clients/:id/history` → `TrainerClientHistoryScreen`
- [ ] `/trainer/checkins/:id` → `TrainerCheckInDetailScreen`
- [ ] `/trainer/clients/:id/nutrition` → will be used in Phase 2

#### P1-6: Verify & Test
- [ ] `dart analyze` — zero errors
- [ ] `flutter test` — all pass
- [ ] Verify each new screen renders with real API data (not mock data)

---

### Phase 2: P1 Client Detail Augmentation + Nutrition + Habits + Assign Program
**Goal**: Add the Overview section to client detail, fully functional nutrition screen, habits CRUD, proper assign program.

#### P2-1: Add Overview Section to `TrainerClientDetailScreen`
- [ ] Insert scrollable Overview section ABOVE the tab bar
- **Layout** (matching iOS `ClientDetailView` top sections):
  - `ActiveProgramCard` — inline card with program name, progress bar, cancel button
    - Fetch via `TrainerActiveProgramCubit`
    - Show "No active program" empty state
  - `PackageCard` — green card with package name + sessions remaining + "Start Package Session" button
    - Fetch via `TrainerClientPackagesCubit` (new, stores package list)
  - `StartSessionButton` — blue gradient button → triggers `WorkoutSessionCubit.startSession(clientId:)`
  - `ManagementActions` — HStack with "Request Check-in" (orange) and "Assign Program" (blue)
  - `RecentActivity` — last 5 sessions with `ClientSessionRow` + "View Full History" link

#### P2-2: Create `TrainerClientPackagesCubit`
- [ ] New cubit for loading client packages
- [ ] Method: `loadPackages(clientId)` → `GET /api/clients/{id}/packages`

#### P2-3: Create `TrainerNutritionDetailScreen`
- [ ] New screen in `trainer/presentation/nutrition/trainer_nutrition_detail_screen.dart`
- **Layout** (matching iOS `NutritionDetailView`):
  - Title with "Active" badge (green)
  - `MacroProgressBars` — 4 progress bars (calories/protein/carbs/fats) using fl_chart or custom `LinearProgressIndicator`
    - Calorie bar: orange, max 3000
    - Protein bar: blue, max 300g
    - Carbs bar: green, max 400g
    - Fats bar: purple, max 100g
  - Section blocks: Meal Notes, Foods to Eat, Foods to Avoid, Meal Timing, Hydration, Supplements, Habit Notes
  - `HabitsSection` — full habits checklist with:
    - Date picker (to view/log habits on specific dates)
    - Add Habit button → dialog with title + description + frequency (DAILY/WEEKLY)
    - Edit/Delete swipe actions on each habit
    - Checkbox toggle to log habit completion
    - "Back to Today" button when viewing past dates
- **Route**: `/trainer/clients/:id/nutrition` — full-screen
- Also accessible from Nutrition tab's "View Details" action

#### P2-4: Refactor `TrainerAssignProgramSheet`
- [ ] Replace manual program ID text field with:
  - Program picker: fetch programs via `GET /api/trainer/programs`, show list with name + description + session count
  - Select program → show Schedule section
  - Date picker (date of month)
  - Frequency picker (Sequential / Daily / 3x Per Week)
  - "Confirm & Assign" button
- **Layout** (matching iOS `AssignProgramToClientSheet`):
  - Navigation-style: list → select → schedule view
  - "Cancel" and "Next"/"Assign" in toolbar
  - Loading/empty/error states for program list

#### P2-5: Habits CRUD Integration
- [ ] Implement "Add Habit" dialog in the habits tab (currently `// TODO`)
- [ ] Implement edit habit (tap existing habit → edit dialog)
- [ ] Implement swipe-to-delete with confirmation
- [ ] Implement habit log toggle (checkbox calls `POST /api/trainer/clients/{id}/habits/{habitId}/log`)
- [ ] Wire date picker to habits tab for viewing/logging on past dates

#### P2-6: Wire "Request Check-in" Button
- [ ] Button calls `POST /api/trainer/check-ins/request` with `{ clientId, checkInType: "WEEKLY", dueDate }`
- [ ] Show confirmation alert on success (matching iOS)

#### P2-7: Verify & Test
- [ ] `dart analyze` — zero errors
- [ ] `flutter test` — all pass
- [ ] Verify Overview section renders with real data
- [ ] Verify assign program flow end-to-end

---

### Phase 3: P2 Polish (Cancel Program, Streak Calc, Delete Nutrition, Skeleton Loading)
**Goal**: Polish features, edge cases, loading states.

#### P3-1: Cancel Program UI
- [ ] Confirmation alert with "Cancel Program" (destructive) + "Keep Program" (cancel)
- [ ] On confirm: calls `POST /api/trainer/clients/{id}/programs/{programId}/cancel`
- [ ] Reload active program on success

#### P3-2: Streak Calculation Utility
- [ ] Create pure domain function in `lib/core/utils/workout_streak_util.dart` (extend existing `WorkoutStreakUtil`)
- [ ] Logic: Check consecutive days backwards from today/yesterday — match iOS `activeStreak` computed property
- [ ] Display on client detail header or Overview section

#### P3-3: Delete Nutrition Plan
- [ ] Wire API call in nutrition detail screen
- [ ] Confirmation dialog before delete
- [ ] Reload on delete success

#### P3-4: Dashboard Skeleton Loading
- [ ] Add shimmer/skeleton loading state to `TrainerDashboardScreen` (matching iOS `DashboardSkeleton()`)
- [ ] Show placeholder cards while data loads

#### P3-5: Verify & Test
- [ ] `dart analyze` — zero errors
- [ ] `flutter test` — all pass
- [ ] End-to-end walkthrough of all trainer client flows

---

### Phase 4: P3 Nice-to-Have (Add Client, Caching)
**Goal**: Complete parity for remaining features.

#### P4-1: Create Add Client Screen
- [ ] New screen with segmented control: QR Code Scan / Email Invitation
- [ ] QR code card (premium style with avatar in center, gradient background)
- [ ] Email invitation form with validation
- [ ] Success view with green checkmark animation
- [ ] Error handling: USER_EXISTS, ALREADY_LINKED, LIMIT_REACHED, 404

#### P4-2: Client List Caching
- [ ] Add `CacheManager`-style caching for client list using `shared_preferences`
- [ ] Show cached data immediately, refresh in background

#### P4-3: Verify & Test
- [ ] `dart analyze` — zero errors
- [ ] `flutter test` — all pass

---

## File Creation/Modification Summary

### New Files
```
lib/features/trainer/
├── cubit/
│   ├── trainer_check_in_review_cubit.dart              ← P0-5
│   ├── trainer_check_in_review_state.dart              ← P0-5
│   ├── trainer_client_sessions_cubit.dart              ← P0-6
│   ├── trainer_client_sessions_state.dart              ← P0-6
│   ├── trainer_active_program_cubit.dart               ← P0-7
│   ├── trainer_active_program_state.dart               ← P0-7
│   ├── trainer_check_in_detail_cubit.dart              ← P1-2
│   ├── trainer_check_in_detail_state.dart              ← P1-2
│   ├── trainer_client_history_cubit.dart               ← P1-3
│   ├── trainer_client_history_state.dart               ← P1-3
│   ├── trainer_client_packages_cubit.dart              ← P2-2
│   ├── trainer_client_packages_state.dart              ← P2-2
├── data/models/
│   ├── trainer_check_in_detail_dto.dart                ← P0-2
│   ├── check_in_photo_dto.dart                         ← P0-2
│   ├── trainer_client_session_dto.dart                 ← P0-2
│   ├── trainer_client_active_program_dto.dart          ← P0-2
│   ├── trainer_client_program_template_dto.dart        ← P0-2
│   ├── trainer_client_package_dto.dart                 ← P0-2
│   ├── trainer_program_list_item_dto.dart              ← P0-2 (if needed separate from ProgramDto)
│   ├── trainer_active_program_list_item_dto.dart       ← P0-2
│   ├── update_habit_request_dto.dart                   ← P0-2 (if different from CreateHabitRequestDto)
│   ├── log_habit_request_dto.dart                      ← P0-2
│   ├── request_check_in_dto.dart                       ← P0-2
├── presentation/
│   ├── checkins/
│   │   ├── trainer_check_in_detail_screen.dart         ← P1-2
│   ├── clients/
│   │   ├── trainer_client_history_screen.dart          ← P1-3
│   ├── nutrition/
│   │   └── trainer_nutrition_detail_screen.dart        ← P2-3
│   ├── widgets/
│   │   ├── client_session_row.dart                     ← P2-1
│   │   ├── active_program_card.dart                    ← P2-1
│   │   ├── package_card.dart                           ← P2-1
│   │   ├── overview_section.dart                       ← P2-1
│   │   ├── macro_progress_bars.dart                    ← P2-3
│   │   ├── volume_progression_chart.dart               ← P1-3
│   │   ├── stats_grid.dart                             ← P1-2
│   │   ├── biofeedback_section.dart                    ← P1-2
│   │   ├── photos_section.dart                         ← P1-2

scripts/
└── verify-trainer-client-api-contracts.sh              ← P0-1
```

### Existing Files to Modify
```
lib/features/trainer/
├── cubit/
│   ├── trainer_clients_cubit.dart                      ← P0-3 (refactor getClients)
│   ├── trainer_client_analytics_cubit.dart             ← P1-4 (expand chart data)
│   ├── trainer_client_analytics_state.dart             ← P1-4 (add chart fields)
│   ├── trainer_client_habits_cubit.dart                ← P2-5 (add CRUD methods)
│   ├── trainer_client_nutrition_cubit.dart             ← P0-4 (fix PUT→POST)
├── data/
│   ├── trainer_clients_api_service.dart                ← P0-3 (add all missing methods)
│   ├── trainer_checkin_api_service.dart                ← P0-4 (fix POST→PATCH)
├── data/models/
│   ├── trainer_client_list_item_dto.dart               ← P0-3 (align with real endpoint)
│   ├── trainer_nutrition_plan_dto.dart                 ← verify fields
├── presentation/
│   ├── clients/
│   │   ├── trainer_clients_screen.dart                 ← minor (if endpoint shape changes)
│   │   ├── trainer_client_detail_screen.dart           ← P2-1 (add Overview section)
│   │   ├── trainer_assign_program_sheet.dart           ← P2-4 (full refactor)
│   ├── checkins/
│   │   ├── trainer_checkin_review_screen.dart          ← P1-1 (refactor to cubit)
│   │   ├── trainer_checkin_review_screen.dart          ← P2-5 (add date picker + CRUD)
│   ├── settings/
│   │   └── ... (no changes expected)
├── cubit/
│   ├── trainer_clients_state.dart                      ← minor (if state shape changes)

lib/core/router/app_router.dart                         ← P1-5 (add new routes)

lib/features/trainers/domain/workout_streak_util.dart    ← P3-2 (extend existing function)

lib/features/analytics/presentation/widgets/
├── volume_line_chart_widget.dart                       ← P1-4 (add trainerMode)
├── muscle_donut_chart_widget.dart                      ← P1-4 (add trainerMode)
├── consistency_widget.dart                             ← P1-4 (add trainerMode)
```

---

## Acceptance Criteria

### Per-Phase Verification

| Phase | Verification Command | Pass Criteria |
|---|---|---|
| **P0** | `dart analyze` | Zero errors |
| **P0** | `flutter test` | All pass (note pre-existing failures) |
| **P0** | `curl` each new endpoint | Response shapes match Flutter DTOs |
| **P1** | `dart analyze` | Zero errors |
| **P1** | `flutter test` | All pass |
| **P1** | Navigate to each new screen | Real data renders |
| **P2** | `dart analyze` | Zero errors |
| **P2** | `flutter test` | All pass |
| **P2** | Assign program flow | End-to-end: pick program → schedule → assign |
| **P3** | `dart analyze` | Zero errors |
| **P3** | `flutter test` | All pass |
| **P4** | `dart analyze` | Zero errors |
| **P4** | `flutter test` | All pass |

### Global Quality Gates
- [ ] All API-backed screens use cubits with sealed states (zero raw Dio)
- [ ] All chart widgets reuse existing analytics infrastructure
- [ ] All design tokens match `AppColors` — no custom colors
- [ ] No `print()`, no `// TODO`, no commented-out code
- [ ] Router enforces trainer-only access for `/trainer/` routes

---

## Dependencies & Risks

| Risk | Impact | Mitigation |
|---|---|---|
| Backend response shapes differ from code reading | Rework on DTOs + screens | **Phase 0 verification is mandatory** — verify before building |
| Client detail screen becomes too large (~800+ lines) | Maintenance burden | Extract sections into separate widget files in `trainer/presentation/widgets/` |
| Habits CRUD backend contract differs from expected | Rework on habit forms | Verify `POST /api/trainer/clients/{id}/habits/{habitId}/log` shape before building UI |
| Start session flow conflicts with existing WorkoutSessionCubit | Architecture refactor | Investigate `WorkoutSessionCubit` surface area before Phase 2 — may need separate `TrainerSessionCubit` |
| fl_chart version compatibility | Chart rendering issues | Check pubspec.lock for current fl_chart version — the charts in analytics already work |

---

## Recommended Execution Order (Parallelism)

### Session 1: Phase 0 (Foundation)
```
Parallel:
  ├── P0-1: Backend contract verification (bash + curl)
  └── P0-2: Create all new DTOs (write 10+ files)
Then:
  ├── P0-3: Add API methods + refactor getClients()
  ├── P0-4: Fix existing API issues (PUT→POST, POST→PATCH)
  ├── P0-5: Create TrainerCheckInReviewCubit
  ├── P0-6: Create TrainerClientSessionsCubit
  └── P0-7: Create TrainerActiveProgramCubit
Then:
  ├── build_runner + analyze + test
```

### Session 2: Phase 1 (P0 Screens)
```
Parallel:
  ├── P1-1: Refactor check-in review screen to use cubit
  ├── P1-2: Create check-in detail screen + cubit
  ├── P1-3: Create workout history screen + cubit + volume chart
  └── P1-4: Refactor analytics tab with charts
Then:
  ├── P1-5: Add router routes
  └── P1-6: verify + test
```

### Session 3: Phase 2 (P1 Augmentation)
```
Sequential (due to single screen dependency):
  ├── P2-2: Create packages cubit (can parallel with P2-3)
  ├── P2-3: Create nutrition detail screen
  ├── P2-4: Refactor assign program sheet
  ├── P2-5: Habits CRUD integration
  ├── P2-6: Wire request check-in
  └── P2-1: Add Overview section (depends on P2-2 through P2-6 being done)
Then:
  └── P2-7: verify + test
```

### Session 4: Phases 3+4 (Polish)
```
Parallel:
  ├── P3-1: Cancel program UI
  ├── P3-2: Streak calculation utility
  ├── P3-3: Delete nutrition plan
  ├── P3-4: Dashboard skeleton loading
  ├── P4-1: Add client screen
  └── P4-2: Client list caching
Then:
  └── Verify + test + final analyze
```
