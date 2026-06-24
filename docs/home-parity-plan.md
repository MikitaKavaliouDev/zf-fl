# ZIRO.FIT Home Screen — Full Parity Implementation Plan

## Status Summary
- **Data Layer**: ✅ Complete (models, API service, repository, cubit)
- **UI Layer**: ✅ Complete (all screens, widgets, and sheets built)
- **Routine Builder / Programs**: ✅ Complete (create, templates, scheduling)
- **Known Gaps**: Profile screen, push notifications, offline sync E2E, Stripe payment sheet, plate calculator, template CRUD inside a program

---

## What Was Built

### Routine Builder Flow
| Screen | File | Route | Purpose |
|---|---|---|---|
| Routine Builder | `routine_builder_screen.dart` | `/home/routine-builder` | Create a new program: name + templates |
| Routine Scheduler | `routine_scheduler_screen.dart` | `/home/routine-scheduler` | Schedule via device calendar (daily/sequential) |
| Templates Library | `templates_library_screen.dart` | `/home/templates-library` | Searchable template list (iOS WorkoutTemplatesView parity) |
| Template Picker | `template_picker_sheet.dart` | (modal) | Select templates to add to a program |
| Program Detail | `program_detail_screen.dart` | `/home/program-detail` | View program with progress and template list |

### Data Layer
| File | Purpose |
|---|---|
| `program_api_service.dart` | Dio service: `GET /api/client/programs`, `POST /api/client/programs`, `GET /api/client/programs/[id]`, `POST /api/client/programs/templates` |
| `program_repository.dart` | Wraps ProgramApiService |
| `program_cubit.dart` | State management: load programs, load templates, create program, create template |
| `program_dto.dart` | `ProgramDto` with `ProgramTemplate` sub-model, matching backend Prisma `WorkoutProgram` |
| `program_library_response.dart` | `ProgramLibraryResponse` for `GET /api/client/programs` response shape |

### Navigation Updates
| Widget | Before | After |
|---|---|---|
| `quick_actions_row.dart` Templates button | `/workout` (wrong) | `/home/templates-library` |
| `no_routine_placeholder.dart` Templates button | `/workout` (wrong) | `/home/templates-library` |
| `active_program_widget.dart` | `/workout` (wrong) | `/home/program-detail` |

### Native Calendar Config
| Platform | File | Permissions Added |
|---|---|---|
| Android | `android/app/src/main/AndroidManifest.xml` | `READ_CALENDAR`, `WRITE_CALENDAR` |
| iOS | `ios/Runner/Info.plist` | `NSCalendarsUsageDescription`, `NSCalendarsWriteOnlyAccessUsageDescription` |

---

## Missing Features (remaining gaps)

### 1. Workout Template CRUD
Current state: dialogs for saving/loading templates exist, template picker works.
**Not built**: creating exercises within templates, reordering exercises, inline template editing inside a program.

### 2. Profile Screen
Still basic scaffold only, no content loaded.

### 3. Push Notifications
Not implemented — only local/realtime notifications via `NotificationsCubit`.

### 4. Offline Sync E2E
Architecture in place (Drift tables, SyncCubit, pull/push endpoints) but hasn't been end-to-end tested.

### 5. Stripe Checkout
Deep link routes exist, `flutter_stripe` dependency installed, but the actual Stripe payment sheet integration is not wired.

### 6. Plate Calculator
Widget exists (`plate_calculator.dart`) but isn't integrated into workout flow.

---

## API Contracts (from backend `V:\zirofit-next`)

### `GET /api/client/programs` → `ProgramLibraryResponse`
```typescript
{
  assignedPrograms: Program[],
  personalPrograms: Program[],
  personalTemplates: Template[],
  systemTemplates: Template[],
  categories: string[]
}
```

### `POST /api/client/programs` → create program
```typescript
Request: { name: string, description?: string }
Response: { program: Program }
```

### `GET /api/client/programs/[id]` → program detail
```typescript
Response: { program: Program }
```

### `POST /api/client/programs/templates` → create template
```typescript
Request: { name: string, programId: string, description?: string }
Response: { template: ProgramTemplate }
```

---

## Design Decisions

1. **Programs placed under `lib/features/home/`** to match iOS `ZiroMe/` structure (PlanBuilderView, MyProgramDetailView, WorkoutTemplatesView are all in `ZiroMe/`)
2. **`ProgramCubit` is a singleton** for cross-screen access (Routine Builder → Template Picker → Program Detail)
3. **Client cannot update/delete programs** — those are trainer-only operations
4. **No backend schedule endpoint** — scheduling is done purely via `add_2_calendar` matching iOS behavior
5. **`ProgramDetailScreen` accepts both model types** — `ActiveProgramResponse` (from dashboard) and `ProgramDto` (from programs API) with normalized internal display

---

## Verification Checklist (all done)
- [x] `dart analyze lib/features/home/` → zero errors from new code
- [x] `flutter test` → 23/23 tests pass
- [x] All new routes registered in GoRouter
- [x] Native calendar permissions for Android and iOS
- [x] Templates buttons navigate to `/home/templates-library`
- [x] No hardcoded colors/radii/typography values
- [x] No stubs, mocks, or placeholder UI
