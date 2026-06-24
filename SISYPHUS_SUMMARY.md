# Sisyphus Session Summary

## Goal
Implement production-ready Routine Builder feature in Flutter with full iOS feature parity for the Home tab, including routine creation, template management, scheduling, and program detail viewing.

## Completed Work

### Data Layer
- **`ProgramDto`** (freezed) — matches iOS `WorkoutProgram` with fields: id, name, description, templates, templateLabels, isScheduled, scheduledStartDate, scheduleFrequency, activeTemplateIndex, trainerName, trainerAvatarUrl
- **`ProgramApiService`** — CRUD endpoints: GET/POST/PUT/DELETE programs, GET templates, POST schedule
- **`ProgramRepository`** — singleton wrapping API service with same interface

### State Management
- **`ProgramState`** — sealed states (initial, loading, loaded, error)
- **`ProgramCubit`** — load, create, update, delete, schedule with error handling + developer logging

### Screens
- **`RoutineBuilderScreen`** — full-screen builder with name/description fields, reorderable template slots via `ReorderableListView` with drag-to-reorder, delete slot, add via picker, create/edit modes
- **`TemplatePickerSheet`** — modal bottom sheet showing available templates with loading/empty/error states, "Added" badges
- **`RoutineSchedulerScreen`** — full-screen scheduler with start date picker, frequency toggle (Sequential/Daily), duration stepper (1-12 weeks), real API-backed scheduling via `ProgramCubit.scheduleProgram()`, error dialog on failure, success view, device calendar integration via `add_2_calendar`
- **`ProgramDetailScreen`** — program detail with progress stats, template list, start next template action

### Routing & Integration
- **`app_router.dart`** — 3 routes for `/home/routine-builder`, `/home/routine-scheduler`, `/home/program-detail` with slide-up sheet-style transitions; edit mode via `ProgramDto` as route extra
- **`main.dart`** — ProgramCubit added to global MultiBlocProvider
- **`home_screen.dart`** — wired active program card to program detail route
- **`ziro_sheet_header.dart`** — added leadingText/trailingText params

### Dependencies
- Added `add_2_calendar ^3.0.1` for device calendar integration

## Code Quality
- `dart analyze` — 0 errors from new code (47 pre-existing info-level hints + 1 pre-existing warning)
- `flutter test` — 23/23 tests pass
- `build_runner` — freezed + injectable codegen passed (553 outputs)

## Remaining Gaps
1. **Native calendar config** — `add_2_calendar` requires `AndroidManifest.xml` calendar permissions + `Info.plist` usage description
2. **Backend endpoint verification** — `GET/POST/PUT/DELETE /api/client/programs`, `POST /api/client/programs/:id/schedule`, `GET /api/client/programs/templates` need backend implementation/confirmation
3. **ReorderableListView** — uses `onReorderItem` (Flutter 3.41+ API); verify target Flutter version compatibility
4. **Template creation/edit** — builder can pick existing templates but cannot create/edit individual templates

## Key Architecture Decisions
- Feature lives under `lib/features/home/` (sub-feature of Home tab, matching iOS `ZiroMe/` structure)
- ProgramCubit is globally-scoped singleton (accessible from Home, builder, scheduler, detail screens)
- Builder uses local state for form fields — matches iOS `@State` pattern
- Scheduler calls both API (`scheduleProgram`) and device calendar (`add_2_calendar`) — dual persistence

## Files Changed
- `lib/features/home/data/models/program_dto.dart` — expanded model with scheduling fields
- `lib/features/home/data/models/program_dto.freezed.dart` — codegen output
- `lib/features/home/data/models/program_dto.g.dart` — codegen output
- `lib/features/home/data/program_api_service.dart` — added scheduleProgram endpoint
- `lib/features/home/data/program_repository.dart` — added scheduleProgram method
- `lib/features/home/cubit/program_cubit.dart` — added scheduleProgram method
- `lib/features/home/presentation/routine_builder_screen.dart` — drag-to-reorder + edit mode
- `lib/features/home/presentation/routine_scheduler_screen.dart` — real API + calendar integration
- `lib/core/router/app_router.dart` — edit mode routing via route extra
- `pubspec.yaml` — added add_2_calendar
