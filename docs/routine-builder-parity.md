# Routine Builder — iOS vs Flutter Parity Plan

## Current Bugs

### Bug 1: 500 Error on `POST /api/client/programs/templates/:templateId/exercises`

**Root Cause**: The `addExerciseToTemplate` service (`templateExercises.ts:26-29`) enforces:
```ts
const template = await prisma.workoutTemplate.findFirst({
    where: { id: templateId, program: { trainerId } },
});
```
The route handler passes `prismaUser.id` as `trainerId`. For **client** users creating personal programs, `program.trainerId = clientUserId` (set by `createProgram` at `programs.ts:130`). This **should** work for self-created programs.

However, the `createTemplate` mutation (`mutations.ts:17-18`) has the same check:
```ts
const program = await prisma.workoutProgram.findFirst({
    where: { id: programId, trainerId },
});
if (!program) throw new Error("Program not found or unauthorized.");
```
This throws a plain `Error` (not `ApiError`), causing `handleRouteError` to return status **500** instead of a proper error code. If template creation itself fails with this check, the template never gets created, and subsequent exercise additions use a stale/local template ID.

**Fix** (backend, `templates/mutations.ts:20`):
- Change `throw new Error(...)` to `throw new ApiError(404, "...")` so it returns 404 instead of 500.

**Fix** (backend, `templateExercises.ts:27`):
- For client users, skip the `program.trainerId` ownership check and verify via `ClientProgramAssignment` instead. The simplest fix is to add a separate query path for client-owned vs assigned programs.

### Bug 2: `GoError: There is nothing to pop` in `RoutineBuilderScreen._save()`

**Root Cause**: `routine_builder_screen.dart:489` calls `context.pop()` unconditionally. If the user navigated to the routine builder via `context.go()` (not `context.push()`), there's nothing on the navigation stack to pop.

**Fix** (Flutter, `routine_builder_screen.dart:489`):
- Replace `context.pop()` with a navigation to a known route: `context.go('/home')` or use `Navigator.of(context).maybePop()`.

---

## iOS Flow Reference

### Screen Flow

```
Templates Library (WorkoutTemplatesView)
  ├── Create Template (CreateTemplateView) — standalone modal
  │     ├── Name + Description
  │     ├── Exercise picker (multi-select)
  │     ├── Default: 3 sets × 10 reps per exercise
  │     └── Save → creates LOCAL template (id: local_*)
  │
  ├── Pick Template → RoutineBuilderView (RoutineTemplatePickerView)
  │     └── Adds template to routine slots
  │
  └── Schedule Session (PlanSchedulerView)
        └── Device calendar integration

Routine Builder (RoutineBuilderView)
  ├── Name + Description
  ├── Workout Slots (reorderable)
  │     └── Each slot: template + editable day label
  ├── "Add Workout" → RoutineTemplatePickerView
  └── Save → createProgram + createTemplate per local template
```

### iOS `ProgramsViewModel.createTemplate()` Flow

```swift
if isLocal {
    // Create template in-memory with local_* ID
    // Store in local cache (UserDefaults)
    return true
} else {
    // Call API: createWorkoutTemplate(programId, name, description)
    // Add to local program.templates array
    return true
}
```

### iOS `ProgramsViewModel.saveRoutine()` Flow

```swift
if isLocal {
    // Create WorkoutProgram in-memory
    // Store in local cache
    return existingId
} else {
    // createProgram(name, description) via API
    // For each template: createTemplate(...) via API
    // Fetch programs again
    return newProgram.id
}
```

### Key iOS Details

1. **Standalone template creation**: Templates can be created independently (not just inside a routine). They get `local_*` IDs and are cached locally.
2. **Default exercise params**: `targetReps: "10"` (string), `targetSets: 3` (int).
3. **Local-first**: iOS creates all templates/programs locally first, then optionally syncs to server.
4. **Template exercises inline**: When creating a template via the API, iOS sends `exercises` and `templateExercises` arrays inline with the create request. It does NOT create the template first then add exercises separately.

---

## Flutter Current State

### Screen Flow

```
Routine Builder (RoutineBuilderScreen)
  ├── Name + Description
  ├── Workout Slots (reorderable)
  │     └── Each slot: template + editable day label
  ├── "Add Workout" → Template Picker Sheet
  │     └── Picker has "Create New Template" button → CreateTemplateView
  │           └── Name + Description + Exercise picker (multi-select via ExercisePickerSheet.multiple)
  │           └── Default: 3 sets × 10 reps per exercise
  │           └── Save → pops TemplateDto with local_* ID
  └── Save → createProgram API → for each local_* template: createTemplate API → addExerciseToTemplate API (FAILS)

Templates Library (TemplatesLibraryScreen)
  └── Lists templates from API + local cache
  └── Missing: standalone "Create Template" button (workaround via Routine Builder)

Program Detail (ProgramDetailScreen)
  └── Shows program progress

Routine Scheduler (RoutineSchedulerScreen)
  └── Device calendar integration
```

### Flutter `_save()` Flow

```dart
1. createProgram(name, description) → API → returns ProgramDto
2. For each slot where template.id.startsWith('local_'):
   a. createTemplate(programId, name, description) → API → returns TemplateDto
   b. For each exercise in template:
      addExerciseToTemplate(templateId, exerciseId, targetReps, targetSets, order) → API → FAILS
3. context.pop() → CRASHES
```

---

## Parity Gap Analysis

| # | Feature | iOS | Flutter | Gap |
|---|---------|-----|---------|-----|
| 1 | **Standalone template creation** | ✅ `CreateTemplateView` is accessible from Templates Library | ⚠️ `CreateTemplateView` exists but only accessible from Template Picker Sheet inside Routine Builder | Flutter missing entry point from Templates Library |
| 2 | **Template creation saves exercises inline** | ✅ Creates template + exercises in one API call | ❌ Creates template first, then adds exercises one-by-one via separate API calls | N+1 API calls vs 1; Backend endpoint for adding exercises is broken for clients |
| 3 | **Default exercise params** | ✅ 3 sets × 10 reps | ✅ 3 sets × 10 reps | ✅ Parity |
| 4 | **Local template caching** | ✅ `UserDefaults` cache, survives app restart | ❌ No local persistence | Templates with `local_*` IDs lost on restart |
| 5 | **Template library "Create" button** | ✅ Header has `+` icon → `CreateTemplateView` | ❌ No "Create" button in Templates Library | Users can't create templates standalone |
| 6 | **Save navigation** | ✅ `dismiss()` (iOS sheet dismiss) | ❌ `context.pop()` crashes when navigated via `go()` | Use `context.maybePop()` or navigate to root |
| 7 | **Program with pre-existing templates** | ✅ Picks existing template → `saveRoutine` creates program + copies template | ❌ Picks existing template → but only `createProgram` called; template copy not implemented | Missing `copySystemTemplate`/template duplication |
| 8 | **Schedule flows** | ✅ `PlanSchedulerView` per-template | ⚠️ `RoutineSchedulerScreen` per-program | Different granularity, but acceptable |
| 9 | **Reorderable slots** | ✅ `ForEach($selectedTemplates)` + `onMove` | ✅ `ReorderableListView.builder` + `onReorderItem` | ✅ Parity |
| 10 | **Template detail view** | ✅ Tap template → `TemplateDetailView` | ❌ No template detail view | Missing feature |
| 11 | **Program detail (progress)** | ✅ `MyProgramDetailView` with week columns, progress, calendar | ⚠️ `ProgramDetailScreen` exists | Need to verify parity |

---

## Recommended Fix Order

### Phase 1 — Fix Broken Flow (Critical)

1. **Backend: Fix `addExerciseToTemplate` for clients** (`templateExercises.ts:26-29`)
   - Change ownership check to allow client access for their own programs
   - For client-created programs: `program: { trainerId: userId }` works (same user)
   - For assigned programs: look up via `ClientProgramAssignment` or remove the strict ownership check

2. **Backend: Fix `createTemplate` error type** (`templates/mutations.ts:20`)
   - Change `throw new Error(...)` to `throw new ApiError(404, "...")` to return 404 instead of 500

3. **Flutter: Fix navigation crash** (`routine_builder_screen.dart:489`)
   - Replace `context.pop()` with `context.maybePop()` or `context.go('/home')`

### Phase 2 — Feature Parity

4. **Flutter: Add "Create Template" button to Templates Library**
   - Add `+` button to `ZiroSheetHeader` in `TemplatesLibraryScreen` (like iOS `trailingIcon: "plus.circle.fill"`)
   - Opens `CreateTemplateView` as a full-screen dialog
   - On save, add the local template to the list

5. **Flutter: Persist local templates**
   - Save templates with `local_*` IDs to local storage (SharedPreferences or Drift)
   - Load on app startup, merge into template list

6. **Backend: Support bulk exercise addition or allow inline exercises on template creation**
   - Option A: Modify `createTemplate` to accept `exercises` array inline (like iOS `createTemplate()` sends `templateExercises`)
   - Option B: Fix the per-exercise endpoint (already needed for Phase 1)

7. **Flutter: Handle pre-existing template copy**
   - When adding a pre-existing template to a new program, call `copySystemTemplate` or create a copy on the backend

### Phase 3 — Enhancement

8. **Flutter: Template detail view**
   - Add `TemplateDetailScreen` accessible from Templates Library and Program Detail
   - Shows exercise list with sets/reps/rest

9. **Flutter: ProgramDetailScreen parity**
   - Verify week columns, progress bar, "Add All to Calendar" matches iOS `MyProgramDetailView`

---

## Flow Diagram (Target State)

```
Templates Library
  ├── [+] Create Template → CreateTemplateView
  │     └── saves as local template (persisted)
  ├── Tap template → TemplateDetailView
  ├── Play → start session
  └── Select → RoutineBuilderView

Routine Builder
  ├── Name + Description
  ├── Pick templates from library → RoutineTemplatePickerView
  ├── "Add Workout" button (when slots exist)
  └── Save → API: createProgram
         └── for each local_* template:
               API: createTemplate(name, description, exercises[]) — one call
         └── for each existing template:
               API: copyTemplate (or link)
         └── navigate to Home / Program Detail
```
