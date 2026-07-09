# Trainer-Side App (`lib/features/trainer/`)

## Overview

Full tabbed mobile experience for fitness trainers. Separate GoRouter `StatefulShellRoute` with 5 tabs, mini-player overlay, and 119 non-generated Dart files (~175 including generated). **NOT** the client-facing trainer discovery feature (that's `lib/features/trainers/`).

## Structure

```
cubit/                     — 14 cubits + sealed state files
data/
  trainer_*_api_service.dart — 10 API services (calendar, checkin, clients, dashboard, events, nutrition, programs, recipes, resources, settings)
  models/                    — ~86 DTOs (request/response)
presentation/
  calendar/     — TrainerCalendarScreen, DayView, MonthView, AgendaView, CreateSessionSheet
  checkins/     — TrainerCheckInReviewScreen, TrainerCheckInDetailScreen
  clients/      — TrainerClientsScreen, TrainerClientDetailScreen, TrainerClientHistoryScreen, TrainerAddClientScreen, AssignProgramSheet, NutritionPlanEditorSheet
  dashboard/    — TrainerDashboardScreen
  events/       — TrainerEventsScreen
  nutrition/    — TrainerNutritionDetailScreen
  programs/     — TrainerProgramsScreen, TrainerProgramDetailScreen
  recipes/      — TrainerRecipesScreen
  resources/    — TrainerResourceVaultScreen
  settings/     — TrainerMoreScreen
  trainer_shell.dart — shell route with 5-tab BottomNavigationBar
```

## Key Cubits

| Cubit | Purpose |
|---|---|
| `TrainerDashboardCubit` | Load trainer dashboard (metrics, recent activity) |
| `TrainerCalendarCubit` | Calendar events CRUD, day/month/agenda views |
| `TrainerClientsCubit` | Client list, search, pagination |
| `TrainerClientDetailCubit` | Single client profile, stats, active program |
| `TrainerClientSessionsCubit` | Session history for one client |
| `TrainerClientAnalyticsCubit` | Progress charts, volume/muscle/PR data |
| `TrainerClientPackagesCubit` | Package assignments for a client |
| `TrainerClientNutritionCubit` | Client nutrition plan CRUD |
| `TrainerClientHabitsCubit` | Client habit tracking |
| `TrainerCheckInReviewCubit` | Check-in queue (pending/reviewed) |
| `TrainerCheckInDetailCubit` | Single check-in review + feedback |
| `TrainerProgramsCubit` | Program library (own + system templates) |
| `TrainerAddClientCubit` | Add client flow (search by email) |
| `TrainerActiveProgramCubit` | Active program detail + template progress |

## Key Differences from Client Features

- **Separate shell**: `TrainerShell` in `app_router.dart` as a `StatefulShellRoute` — 5 tabs (Calendar, Programs, Dashboard, Clients, More) vs client's 4 tabs (Home, Workout, Explore, Profile).
- **Mini-player overlay**: Same `WorkoutSessionCubit` + `WorkoutMiniPlayer` pattern as `_MainShell`. Shared from `lib/features/trainers/`.
- **API endpoints**: All `/api/trainer/*` — endpoints for managing clients, programs, check-ins, calendars, events. Not the `/api/client/*` endpoints the client app uses.
- **Models**: Trainer-specific DTOs with `trainer_` prefix (`TrainerClientDetailDto`, `TrainerCheckInDetailDto`, etc.). Many are aggregate views the client never sees.
- **No Drift local storage**: Trainer app is online-first, no offline sync layer. Compare to client app which has 17-table Drift DB.

## Where to Look for Common Tasks

- **Add a screen**: Create dir under `presentation/<name>/`, add screen file, register route in `app_router.dart` under the `trainerShell` StatefulShellRoute branch.
- **Add a model**: Create file in `data/models/`, use `@freezed` + `@JsonSerializable`. Run `build_runner` after.
- **Add an API call**: Add method to the relevant `trainer_*_api_service.dart`. New endpoint module = new service file. Wire through existing cubit or create new cubit in `cubit/`.
- **Add a cubit**: Create cubit + state file in `cubit/`, register in DI (`@injectable`). Wire UI via `BlocProvider` + `BlocBuilder`.
- **Modify the nav shell**: Edit `presentation/trainer_shell.dart` (5-tab `BottomNavigationBar` + mini-player overlay).
