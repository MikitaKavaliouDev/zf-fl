# Exercise Picker — Unified Bottom Sheet

## Problem

The app had **two separate** exercise picker implementations with zero code sharing:

| Consumer | Widget Type | Search | Selection | File |
|---|---|---|---|---|
| `CreateTemplateView` | Bottom sheet (`_ExercisePickerSheet`) | Simple substring | Multi-select (checkboxes) | `create_template_screen.dart` (private) |
| `WorkoutSessionScreen` | Alert dialog (`_ExercisePickerDialog`) | Fuzzy/typo-tolerant | Single-select (tap to return) | `workout_session_screen.dart` (private) |

Both loaded exercises from `WorkoutSessionApiService.getExerciseLibrary()` via `/api/exercises/sync`, but neither was reusable. The template creation sheet showed 0 results due to its simple substring search failing on the actual data.

## Solution

Extracted into a single, shared `ExercisePickerSheet` widget at:

```
lib/features/trainers/presentation/widgets/exercise_picker_sheet.dart
```

The widget lives under `trainers/` because it's inherently tied to the `ExerciseDto` model and workout/template flows, both owned by the trainers feature. Cross-feature imports (from `home/` and `trainers/`) are acceptable since both are feature peers under `lib/features/`.

## API

### Named Constructors (Factory)

Two named constructors replace constructor parameter flags — compile-time safety, no invalid combinations:

```dart
// Single-select — tap immediately selects the exercise and closes the sheet.
// Used in: WorkoutSessionScreen "Add Exercise"
factory ExercisePickerSheet.single({
  required List<ExerciseDto> exercises,
  bool isLoading = false,
  required void Function(ExerciseDto exercise) onExerciseSelected,
})

// Multi-select — checkboxes with "Add (N)" confirm button.
// Used in: CreateTemplateView "Add Exercises"
factory ExercisePickerSheet.multiple({
  required List<ExerciseDto> exercises,
  bool isLoading = false,
  required void Function(List<ExerciseDto> exercises) onExercisesSelected,
})
```

### Mode Behavior

| Aspect | `single` | `multiple` |
|---|---|---|
| Tap behaviour | Immediately calls `onExerciseSelected` + pops | Toggles checkbox selection |
| Header | Cancel only | Cancel + "Add" / "Add (N)" |
| Selection indicator | Circle → chevron on tap | Circle → checkmark on tap |
| Return value | Via callback + Navigator.pop | Via callback only (on Done) |

### Parameters

| Parameter | Type | Required | Description |
|---|---|---|---|
| `exercises` | `List<ExerciseDto>` | Yes | Pre-loaded exercise library — caller fetches via `WorkoutSessionRepository.getExerciseLibrary()` |
| `isLoading` | `bool` | No (default `false`) | Shows spinner while exercises load |
| `onExerciseSelected` / `onExercisesSelected` | Callback | Yes | Return value for the consumer |

Exercises are fetched by the **caller**, not the sheet. This keeps the widget stateless/pure — no cubit or repository dependency. Both callers already fetch exercises in their own loaders (`WorkoutSessionCubit.fetchExercises()` and `_loadExercises()` in `CreateTemplateView`).

## Usage

### Single-Select (Workout Session)

```dart
// In WorkoutSessionScreen._showAddExerciseDialog()
await showModalBottomSheet(
  context: context,
  isScrollControlled: true,
  backgroundColor: Colors.transparent,
  builder: (_) => ExercisePickerSheet.single(
    exercises: allExercises,
    onExerciseSelected: (selected) {
      cubit.addExercises([selected.id]);
    },
  ),
);
```

### Multi-Select (Template Creation)

```dart
// In CreateTemplateView._showExercisePicker()
showModalBottomSheet(
  context: context,
  isScrollControlled: true,
  backgroundColor: Colors.transparent,
  builder: (_) => ExercisePickerSheet.multiple(
    exercises: _exerciseLibrary,
    isLoading: _isLoadingExercises,
    onExercisesSelected: (selected) {
      setState(() {
        for (final exercise in selected) {
          _exercises.add(_TemplateExerciseEntry(
            id: 'local_${DateTime.now().millisecondsSinceEpoch}_${exercise.id}',
            exercise: exercise,
            targetReps: '10',
            targetSets: 3,
            order: _exercises.length,
          ));
        }
      });
    },
  ),
);
```

## Fuzzy Search Algorithm

The picker uses **character-order fuzzy matching**, ported from the original `_ExercisePickerDialog`:

```dart
bool _fuzzyMatch(String text, String query) {
  if (query.isEmpty) return true;
  final t = text.toLowerCase();
  final q = query.toLowerCase();
  int ti = 0;
  for (int qi = 0; qi < q.length; qi++) {
    ti = t.indexOf(q[qi], ti);
    if (ti == -1) return false;
    ti++;
  }
  return true;
}
```

Each character in the query must appear **in order** in the target string, but not necessarily consecutively. This makes the search typo-tolerant — e.g. "bcep" matches "Barbell Curl EZ Bar Premium".

The search matches against:
- `ExerciseDto.name`
- `ExerciseDto.muscleGroup`
- `ExerciseDto.category`

## Visual Design

| Element | Token | Value |
|---|---|---|
| Background | `AppColors.background` | `#FFFFFF` |
| Sheet radius | — | `16.0` top corners |
| Rows (unselected) | `AppColors.mutedSurface` | `#F5F5F5` |
| Rows (selected) | `primary` at 10% alpha | `#007aff` × 0.1 |
| Row border (selected) | `primary` at 30% alpha | `#007aff` × 0.3 |
| Selection indicator | circle, `primary` fill + checkmark | `20×20` |
| Search bar | `AppColors.mutedSurface` fill | radius `12.0` |
| Header | `ZiroSheetHeader` | drag handle + title + buttons |
| Typography | 14px body, 12px caption | — |

## Integration Points

### Consumers (callers)

| Screen | File | Constructor | Callback |
|---|---|---|---|
| `WorkoutSessionScreen` | `lib/features/trainers/presentation/workout_session_screen.dart` | `.single()` | → `cubit.addExercises([id])` |
| `CreateTemplateView` | `lib/features/home/presentation/create_template_screen.dart` | `.multiple()` | → local `_exercises` list |

### Data Loading

```
WorkoutSessionApiService.getExerciseLibrary()
  → GET /api/exercises/sync?lastPulledAt=0
  → { data: { changes: Exercise[], timestamp: number } }
```

Both consumers call this independently — the sheet does not own loading state beyond the `isLoading` visual flag.

## What Was Removed

- **`_ExercisePickerSheet`** (private, `create_template_screen.dart`) — 182 lines, bottom sheet with simple substring search, multi-select only
- **`_ExercisePickerDialog`** (private, `workout_session_screen.dart`) — 104 lines, AlertDialog with fuzzy search, single-select only

Both were deleted entirely in favor of the shared widget. This reduced `workout_session_screen.dart` from 1716 to 1441 lines.
