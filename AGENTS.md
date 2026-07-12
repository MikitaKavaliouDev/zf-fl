# ZIRO.FIT — Flutter Client App

## Project

**ZIRO.FIT** client mobile app — Flutter fitness training platform.
Backend is a Next.js REST API at `~/pr/zirofit-next` (separate repo).

## State

**Repo is actively under development.** Code exists across all layers (core, features, tests).
`pubspec.yaml`, `analysis_options.yaml`, `.gitignore` are present.
No CI/CD pipeline is configured (no GitHub Actions, no Docker, no Fastlane).
See the **Current Codebase State** section below for detailed per-feature inventory.

This instruction file (`AGENTS.md`) is auto-loaded via `opencode.json` — agents do **not** need to be told to read it.

## Current Codebase State (2026-07-09)

### Feature Inventory

#### Auth (`lib/features/auth/`) — ✅ Fully Implemented
| Layer | Files |
|---|---|
| Cubit | `AuthCubit` with sealed `AuthState` (initial, loading, authenticated, needsOnboarding, registerSuccess, pendingRole, error) |
| API Service | `AuthApiService` — register, login, refresh, signout, me, sync-user, complete-onboarding, forgot-password, update-password, resend-verification-email |
| Repository | `AuthRepository` — wraps API service, handles token storage |
| Screens | `LoginScreen`, `RegisterScreen`, `EmailVerificationScreen`, `OnboardingScreen` |
| Models | `User`, `AuthResponse`, `RegisterRequest`, `RegisterResponse`, `LoginRequest`, `RefreshResponse` |
| Tests | `auth_cubit_test.dart` |

#### Check-In (`lib/features/check_in/`) — ✅ Fully Implemented
| Layer | Files |
|---|---|
| Cubit | `CheckInCubit` with sealed `CheckInState` — multi-step check-in flow |
| API Service | `CheckInApiService` — GET config, POST submission, GET history, GET detail, POST photo upload |
| Repository | `CheckInRepository` |
| Screens | `CheckInScreen` (multi-step), `CheckInDetailScreen`, `CheckInHistoryScreen`, `CheckInSuccessWidget` |
| Steps (4) | `BodyMetricsStep`, `NotesStep`, `PhotosStep`, `WellnessStep` |
| Models (5) | `CheckInConfigDto`, `CheckInDetailDto`, `CheckInHistoryItemDto`, `CheckInResponseDto`, `CheckInSubmissionDto`, `UploadResponseDto` |

#### Daily Targets (`lib/features/daily_targets/`) — ✅ Fully Implemented
| Layer | Files |
|---|---|
| Cubit | `DailyTargetsCubit` with sealed `DailyTargetsState` |
| API Service | `DailyTargetsApiService` — GET / PUT daily targets |
| Repository | `DailyTargetsRepository` |
| Screen | `DailyTargetsScreen` (goal tracking with progress) |
| Model | `DailyTargetDto` |

#### Fitness Goals (`lib/features/fitness_goals/`) — ✅ Fully Implemented
| Layer | Files |
|---|---|
| Cubit | `FitnessGoalsCubit` with sealed `FitnessGoalsState` |
| API Service | `FitnessGoalsApiService` — CRUD fitness goals |
| Repository | `FitnessGoalsRepository` |
| Screen | `FitnessGoalsScreen` (goal management) |
| Model | `FitnessGoalDto` |

#### Sharing (`lib/features/sharing/`) — ✅ Fully Implemented
| Layer | Files |
|---|---|
| Cubit | `SharingCubit` with sealed `SharingState` |
| API Service | `SharingApiService` — GET / PUT sharing config |
| Repository | `SharingRepository` |
| Screen | `SharingScreen` (privacy toggles, visibility controls) |
| Model | `SharingConfigDto` |

#### Analytics (`lib/features/analytics/`) — ✅ Fully Implemented
| Layer | Files |
|---|---|
| Cubit | `AnalyticsCubit` with sealed `AnalyticsState` — loads progress data, manages dashboard widgets |
| API Service | `AnalyticsApiService` — GET progress data, GET widget config, PUT widget config |
| Repository | `AnalyticsRepository` |
| Screens | `AnalyticsScreen` (widget-based dashboard), `ManageWidgetsSheet` (add/remove/reorder) |
| Widgets (7) | `ConsistencyWidget`, `HeatmapWidget`, `MuscleDonutChartWidget`, `PrsListWidget`, `VolumeChartWidget`, `VolumeLineChartWidget`, `WeightLineChartWidget`, `WidgetContainer` (drag-to-reorder wrapper) |
| Models | `AnalyticsResponseDto`, `ProgressResponseDto`, `WidgetConfigDto` |

#### Explore (`lib/features/explore/`) — ✅ Fully Implemented
| Layer | Files |
|---|---|
| Cubits | `ExploreCubit`, `ExploreMapCubit`, `TrainerDiscoveryCubit`, `EventDetailCubit` |
| API Service | `ExploreApiService` — metadata, featured content, promoted trainers, trainers search, events, event detail |
| Repository | `ExploreRepository` |
| Screens | `ExploreScreen` (main tab), `TrainerDiscoveryScreen`, `TrainerMapScreen`, `EventDetailScreen`, `EventsListViewScreen` |
| Widgets (19) | `ExploreTrainerCard`, `TrainerSpotlightHeroCard`, `ExploreFeatureCarousel`, `ExploreEventCard`, `ExploreEventRow`, `CityPickerSheet`, `ExploreCategoryFilter`, `ExploreCityHeader`, `ExploreSlidingSegment`, `TrendingTagsView`, `MapClusterListView`, `MapTrainerCard`, `MapEventCard`, `MapFilterMenu`, `MapSearchBar`, `MapSingleItemAnnotation`, `MapClusterAnnotation`, `MapSpotlightPreviewCard`, `ExploreEmptyEventsView` |
| Models (8) | `ExploreCity`, `ExploreCategory`, `ExploreMetadata`, `FeaturedContent`, `ExploreEventDto`, `EventDetailDto`, `PaginatedEvents` |

#### Trainers (`lib/features/trainers/`) — ✅ Fully Implemented
| Layer | Files |
|---|---|
| Cubits | `TrainerDetailCubit`, `TrainerListCubit`, `WorkoutSessionCubit`, `WorkoutHistoryCubit`, `BookingCubit` |
| API Services | `TrainerApiService` (detail, packages, testimonials, link/unlink), `WorkoutSessionApiService` (CRUD, exercises, logs, templates), `BookingApiService` (create booking) |
| Repositories | `TrainerRepository`, `WorkoutSessionRepository`, `BookingRepository` |
| Screens | `TrainerDetailScreen` (719 lines — full App Store-style profile), `WorkoutSessionScreen`, `WorkoutHistoryScreen`, `CompletedSessionDetailScreen`, `TrainerMapScreen`, `TrainerListScreen`, `ExerciseDetailScreen` (847 lines — chart, history, progression) |
| Widgets (24) | `ExercisePickerSheet`, `TrainerCard`, `RestTimerSheet`, `PlateCalculator`, `RpePicker`, `WorkoutNumericKeyboard`, `FinishWorkoutDialog`, `CancelWorkoutDialog`, `SaveAsTemplateDialog`, `TemplatePickerDialog`, `SearchBar`, `TrainerProfileBanner`, `ConnectButton`, `TagBadge`, `AboutSection`, `PackageCard`, `PhotosSection`, `ReviewCard`, `ScheduleSection`, `PreviewCarousel`, `CustomProgramRequestSheet`, `CoachNoteCard`, `FocusMetricSelector`, `YouTubePlayerWidget`, `WorkoutMiniPlayer` |
| Models (11) | `TrainerListItemDto`, `TrainerDetailDto`, `TrainerPackageDto`, `TrainerLocation`, `PromotedTrainerDto`, `WorkoutSessionDto`, `WorkoutSessionResponse`, `ExerciseDto`, `ExerciseLogDto`, `TemplateDto`, `TrainerBenefitDto`, `TrainerExternalLinkDto`, `TrainerSocialLinkDto`, `TrainerTestimonialDto`, `TrainerTransformationPhotoDto`, `TrainerScheduleDto`, `TrainerPreviewMediaDto`, `TrainerServiceDto`, `BookingResponseDto` |
| Domain | `WorkoutStreakUtil` — weekly count, current streak, longest streak |
| Tests | `trainer_detail_cubit_test.dart`, `trainer_list_cubit_test.dart` |
| Docs | `docs/trainer-profile-analysis.md` — full iOS `PublicTrainerProfileView` replication reference, backend API contracts (aggregated profile, packages, testimonials, photos, schedule), gap analysis, data model mapping |

**Workout Session — Key Behaviors:**
- **Minimize/Maximize**: Drag down on full-screen session → `minimize()` sets `isMinimized=true` → `_MainShell` stack overlay renders `WorkoutMiniPlayer` 90pt above bottom nav (iOS parity). Tap mini player to maximize back to full screen.
- **Timer sync**: `start()` and `loadCurrent()` use `DateTime.parse(result.session.startTime)` from the API's server timestamp. `_tick()` computes elapsed as `DateTime.now().difference(startTime)` — accurate across restarts, no drift.
- **Cold-start resume**: `_ZiroFitAppState` calls `_workoutSessionCubit.loadCurrent()` on `AuthAuthenticated` (same phase as notifications). If a live session exists, the cubit emits `active(isMinimized: true, startTime: serverStartTime)` — the mini player appears immediately with a synced timer, matching iOS `WorkoutManager.checkForActiveSession()`.
- **Console logging**: 21 `developer.log` calls in the cubit (`name: 'workout'`) covering `logSet` (optimistic + reconciled), `startRest`/`endRest`/`adjustRest`, `addExercises`/`removeExercise`, `cancelSession`, `pause`/`resume`, `minimize`/`maximize`, `loadCurrent`, `rest_finished`, `start`/`finish`. 7 calls in `workout_session_screen.dart` covering keyboard navigation (`nav_focus`, `nav_next`, `nav_dismiss`), set completion, and set addition.

#### Home (`lib/features/home/`) — ✅ Fully Implemented
| Layer | Files |
|---|---|
| Cubits | `HomeCubit` with sealed `HomeState` (initial, loading, loaded, error) — fetches dashboard + active program in parallel; `ProgramCubit` with sealed `ProgramState` — load programs, load templates, create program, create template; `TemplateDetailCubit` — manage template exercises |
| API Services | `HomeApiService` — `GET /api/client/dashboard`, `GET /api/client/program/active`; `ProgramApiService` — `GET /api/client/programs`, `POST /api/client/programs`, `GET /api/client/programs/[id]`, `POST /api/client/programs/templates` |
| Repositories | `HomeRepository`, `ProgramRepository`, `LocalTemplateRepository` (Drift-backed local storage for user-created templates) |
| Screens | `HomeScreen` — main dashboard; `RoutineBuilderScreen` — create program with name + templates; `RoutineSchedulerScreen` — device calendar scheduling (daily/sequential); `TemplatesLibraryScreen` — searchable template library; `ProgramDetailScreen` — dual-model detail view; `TemplateDetailScreen` — view/edit exercises in a template; `CreateTemplateView` — full-screen template creation (441 lines) |
| Widgets (13) | `ZiroHeader`, `CoachCard`, `CreditStatusWidget`, `NeedCoachBanner`, `CheckInBanner`, `NoRoutinePlaceholder`, `ActiveProgramWidget`, `InvitationHeroCard`, `StreakMotivationCard`, `UpcomingSessionsCarousel`, `QuickActionsRow`, `RecentHistorySection`, `DailyTargetsSection` |
| Sheets | `TemplatePickerSheet` — modal for selecting templates to add to a program |
| Models (9) | `ClientDashboardResponse`, `ClientProfileData`, `ClientDashboardTrainer`, `ClientRecentSession`, `ClientDashboardSession`, `ActiveProgramResponse` (+ `ProgramBasicInfo`, `ProgramProgress`, `ProgramTemplateStatus`), `DashboardMeasurement`, `ProgramDto` (+ `ProgramTemplate`), `ProgramLibraryResponse` |
| Tests | `program_cubit_test.dart` (252 lines), `local_template_repository_test.dart` (239 lines) |

#### Notifications (`lib/features/notifications/`) — ✅ Fully Implemented
| Layer | Files |
|---|---|
| Cubit | `NotificationsCubit` with sealed `NotificationsState` (initial, loading, loaded, error) — optimistic mark-as-read with rollback, accept/decline link requests |
| API Service | `NotificationApiService` — `GET /api/notifications`, `PUT /api/notifications/:id`, `PUT /api/notifications/read-all`, `POST /api/notifications/:id/accept`, `POST /api/notifications/:id/decline` |
| Repository | `NotificationRepository` — wraps API service, sorts by date descending |
| Screen | `NotificationsScreen` — full-screen list with ZiroSheetHeader overlay, pull-to-refresh, loading/empty/error states |
| Widgets (3) | `NotificationRow` (40×40 icon circle, 15pt message, 11pt date, unread dot, cross-mode badges, Accept/Decline buttons), `ZiroSheetHeader` (drag handle, centered title, Cancel/Done buttons), `_EmptyState` |
| Models | `NotificationDto` (freezed — `id`, `userId`, `senderId?`, `message`, `type`, `readStatus`, `createdAt`, `targetRole?`, `metadata?`, `syncStatus`) |
| Realtime | `NotificationRealtimeService` — Supabase Realtime subscription with polling fallback; emits `NotificationInserted`, `NotificationUpdated`, `NotificationDeleted`, `NotificationRealtimeConnectionChanged` |
| Integration | `ZiroHeader` bell badge driven by `NotificationsCubit.unreadCount` (dynamic red dot, not static), registered in app-level `MultiBlocProvider`, auto-fetches on startup |
| Docs | `docs/notifications-feature.md` — full iOS replication reference, design tokens, API contracts, spacing specs |

#### Profile (`lib/features/profile/`) — ✅ Fully Implemented
| Layer | Files |
|---|---|
| Cubit | `MoreCubit` with sealed `MoreState` (initial, loading, loaded with user+privacy, error) — loads user data and privacy settings, sign-out |
| API Service | `ProfileApiService` — `GET /api/client/privacy`, `PUT /api/client/privacy` |
| Model | `PrivacySettingsDto` |
| Screen | `ProfileScreen` (867 lines, "More" screen) — full settings menu with 11 sub-screens |
| Settings screens (11) | `LanguageSettingsScreen`, `AICoachSettingsScreen`, `ContactSupportScreen`, `MyPackagesScreen`, `DataPrivacyScreen`, `PurchaseHistoryScreen`, `NotificationSettingsScreen`, `CustomExercisesScreen`, `DashboardPromptsScreen`, `AppearanceSettingsScreen` |
| Integration | Registered in app-level DI via `@injectable`, uses `AuthCubit` for user data |

#### Sync (`lib/features/sync/`) — ✅ Fully Implemented
| Layer | Files |
|---|---|
| Cubit | `SyncCubit` — pull-first then push sync, auto-sync on connectivity restore |
| API Service | `SyncApiService` — `GET /api/sync/pull`, `POST /api/sync/push` |
| Repository | `SyncRepository` — orchestrates pull/push against local Drift DB |
| Tests | `sync_cubit_test.dart` |

#### Nutrition & Habits (`lib/features/nutrition_habits/`) — ✅ Fully Implemented
| Layer | Files |
|---|---|
| Cubit | `NutritionHabitsCubit` with sealed `NutritionHabitsState` (initial, loading, loaded with plan+habits, error) — loads nutrition plan + habits in parallel, optimistic habit toggle with local log merge, pull-to-refresh |
| API Service | `NutritionHabitsApiService` — `GET /api/client/nutrition`, `GET /api/client/habits`, `POST /api/client/habits/{habitId}/log` |
| Repository | `NutritionHabitsRepository` |
| Screen | `NutritionHabitsScreen` — nutrition plan detail with macro progress bars (cal/protein/carbs/fats), section blocks (meal notes, foods to eat/avoid, meal timing, hydration, supplements, habit notes), today's habit checklist with circle checkboxes + frequency badges |
| Models (3) | `NutritionPlanDto` (title, calories, protein, carbs, fats, mealNotes, foodsToEat, foodsToAvoid, mealTiming, hydration, supplements, isActive), `DailyHabitDto` (title, description, frequency DAILY/WEEKLY, logs), `HabitLogDto` (date, isCompleted, note) |
| Integration | Home dashboard `_NutritionHabitsCard` navigates to `/nutrition-habits` (was incorrectly pointing to `/daily-targets`) |

### Onboarding (`lib/features/onboarding/`) — ✅ Fully Implemented
| Layer | Files |
|---|---|
| Screens | `EducationalOnboardingScreen` (383 lines), `OnboardingSlideWidget` — swipeable educational intro slides |

#### Voice Coach (`lib/features/voice_coach/`) — ✅ Fully Implemented
| Layer | Files |
|---|---|
| Cubit | `VoiceCoachCubit` with sealed `VoiceCoachState` (disconnected, connecting, connected with messages/audioLevel/agentState/conversationId, error) — manages ElevenLabs Conversational AI Agent lifecycle, subscribes to `WorkoutRealtimeService` for AI Server Tool updates |
| API Service | `VoiceCoachService` (ElevenLabs agent connection), `VoiceSettingsApiService` — voice settings CRUD |
| Models (2) | `VoiceMessage`, `VoiceSettingsDto` |
| Widgets (2) | `VoiceCoachButton`, `VoiceCoachCompactButton` — floating mic button and compact variant |
| Integration | Configured in `_ZiroFitAppState` via `_voiceCoachCubit.configure(userId: ...)` on `AuthAuthenticated` |
| Realtime | Subscribes to `WorkoutRealtimeService` for AI-driven workout tool updates (Supabase Realtime) |

#### Trainer App (`lib/features/trainer/`) — ✅ Fully Implemented (Trainer-side experience)
| Layer | Files |
|---|---|
| Cubits (12) | `TrainerDashboardCubit`, `TrainerCalendarCubit`, `TrainerClientsCubit`, `TrainerClientDetailCubit`, `TrainerClientSessionsCubit`, `TrainerClientAnalyticsCubit`, `TrainerClientPackagesCubit`, `TrainerClientNutritionCubit`, `TrainerClientHabitsCubit`, `TrainerCheckInReviewCubit`, `TrainerCheckInDetailCubit`, `TrainerProgramsCubit`, `TrainerAddClientCubit`, `TrainerActiveProgramCubit` |
| API Services (5) | `TrainerCalendarApiService`, `TrainerResourcesApiService`, `TrainerCheckinApiService`, trainer nutrition/recipes APIs |
| Screens (12+) | `TrainerShell` (5-tab shell: Calendar/Programs/Dashboard/Clients/More), `TrainerDashboardScreen`, `TrainerClientsScreen`, `TrainerClientDetailScreen`, `TrainerClientHistoryScreen`, `TrainerCalendarScreen`, `TrainerCheckInReviewScreen`, `TrainerCheckInDetailScreen`, `TrainerProgramsScreen`, `TrainerProgramDetailScreen`, `TrainerEventsScreen`, `TrainerNutritionDetailScreen`, `TrainerRecipesScreen`, `TrainerResourceVaultScreen`, `TrainerAddClientScreen`, `TrainerMoreScreen` |
| Models (80+) | DTOs for: programs, sessions, exercises, clients, check-ins, nutrition plans, habits, packages, analytics, calendar events, resources, recipes — ~175 model files |
| Access | Uses `TrainerShell` (separate GoRouter `StatefulShellRoute`), `BlocBuilder<WorkoutSessionCubit>` mini-player overlay, same pattern as `_MainShell` |

### Core Infrastructure

| Module | Files | Status |
|---|---|---|
| **Router** | `app_router.dart` — GoRouter v17.3.0 with `ShellRoute` (4 tabs), full-screen sub-routes for detail/discovery/map, auth redirect guard, Stripe deep link handling, analytics/check-in/daily-targets/fitness-goals/sharing routes; `_MainShell` uses `BlocBuilder<WorkoutSessionCubit>` to overlay `WorkoutMiniPlayer` via `Stack` when session is minimized | ✅ |
| **Routing tables** | Auth: `/login`, `/register`, `/verify-email`, `/onboarding` | ✅ |
| | Shell (bottom nav): `/` (Home), `/workout` (Session), `/explore`, `/profile` | ✅ |
| | Full-screen: `/trainer/:username`, `/explore/discovery`, `/explore/map`, `/explore/event/:id`, `/workout/history`, `/workout/history/:id`, `/home/notifications`, `/home/program-detail`, `/home/templates-library`, `/home/routine-builder`, `/home/routine-scheduler`, `/home/create-template`, `/home/template-detail`, `/analytics`, `/check-in`, `/check-in/history`, `/check-in/:id`, `/daily-targets`, `/fitness-goals`, `/sharing`, `/nutrition-habits`, `/onboarding/educational` | ✅ |
| | Deep links: `/stripe-return`, `/packages/:id/success`, `/packages/:id/cancel` | ✅ |
| **DI** | `get_it` + `injectable` — `initDependencies()` in main, auto-generated `injection.config.dart` | ✅ |
| **Networking** | `Dio` with `ApiLoggerInterceptor` (structured logging) + `AuthInterceptor` (JWT auto-refresh on 401) | ✅ |
| | Base URL: `http://10.0.2.2:3321` (Android), `http://localhost:3321` (iOS), override via `API_BASE_URL` env var | ✅ |
| **Supabase** | `SupabaseConfig` — Supabase URL + anon key for realtime subscriptions (notifications) | ✅ |
| **Auth Security** | `flutter_secure_storage` for JWT tokens, `QueuedInterceptor` for silent refresh | ✅ |
| **Local DB** | Drift/SQLite with 17 tables: `SyncMetadata`, `ClientsTable`, `ProfilesTable`, `WorkoutSessionsTable`, `ExercisesTable`, `WorkoutTemplates`, `ClientMeasurements`, `ClientPhotos`, `Notifications`, `BookingTable`, `PackageTable`, `TestimonialTable`, `ClientExerciseLogs`, `Services`, `Programs`, `CalendarEvents`, `ClientAssessments`, `TrainerProfilesTable` | ✅ |
| **Theme** | `AppColors` (8 tokens: primary `#007aff`, background, card, mutedSurface, borderMuted, borderActive, foreground, mutedText), forced light mode only, `shadcn/ui` Zinc/Neutral palette | ✅ |
| **Logging** | `ApiLogger` (Dio interceptor — method, URL, status, timing, masked request/response body), `StateLogger` (BlocObserver — state transitions), `LoggerConfig` (debug-only flags) | ✅ |
| **Connectivity** | `connectivity_plus` wrapper, auto-triggers sync on reconnect | ✅ |
| **Location** | `geolocator` service, used by Explore map screen | ✅ |

### Dependencies (from pubspec.yaml)

| Package | Version | Purpose |
|---|---|---|
| `flutter_bloc` | ^9.1.1 | State management |
| `get_it` + `injectable` | ^9.2.1 / ^3.0.0 | Dependency injection |
| `dio` | ^5.7.0 | HTTP client |
| `drift` + `sqlite3` | ^2.25.0 / ^3.3.3 | Local database |
| `go_router` | ^17.3.0 | Declarative routing |
| `flutter_map` + `latlong2` | ^8.3.0 / ^0.9.0 | OpenStreetMap maps |
| `geolocator` | ^13.0.0 | Device location |
| `flutter_stripe` | ^13.0.0 | Stripe payments |
| `flutter_secure_storage` | ^10.3.1 | JWT token storage |
| `freezed_annotation` + `freezed` | ^3.1.0 / ^3.2.6-dev.1 | Immutable data classes / sealed unions |
| `json_annotation` + `json_serializable` | ^4.12.0 / ^6.8.0 | JSON serialization |
| `bloc_test` + `mocktail` | ^10.0.0 / ^1.0.4 | Cubit testing / mocking |
| `connectivity_plus` | ^7.1.1 | Network status |
| `intl` | ^0.20.2 | Date formatting |
| `uuid` | ^4.5.1 | UUID generation |
| `url_launcher` | ^6.3.1 | URL launching |
| `add_2_calendar` | ^3.0.1 | Device calendar integration for routine scheduling |
| `supabase_flutter` | ^2.0.0 | Supabase Realtime subscriptions (notifications) |
| `fl_chart` | ^1.2.0 | Charts in exercise detail and analytics screens |
| `flutter_local_notifications` | ^18.0.1 | Local push notifications |
| `image_picker` | ^1.1.2 | Photo upload (check-in) |
| `shared_preferences` | ^2.3.4 | Key-value local storage |

### Test Coverage

| Test File | Cases | Type | Coverage |
|---|---|---|---|---|
| `test/sync_converter_test.dart` | 29 | unit | SyncConverter: date ms↔DateTime, snake_case↔camelCase, null handling, sync JSON fidelity |
| `test/sync_repository_test.dart` | 31 | unit | SyncRepository: pull/push round-trip, pending changes, push assembly, error handling, all 17 Drift tables |
| `test/sync_cubit_test.dart` | 12 | unit | SyncCubit: error states, connectivity changes, auto-sync guard, lastSyncAt preservation |
| `test/program_cubit_test.dart` | 4 | unit | Program cubit: load programs, templates, create, error states |
| `test/local_template_repository_test.dart` | 11 | unit | Local template CRUD with Drift in-memory DB |
| `test/auth_cubit_test.dart` | 2 groups | unit | Auth cubit: register, login, token refresh, auto-redirect |
| `test/trainer_list_cubit_test.dart` | 2 groups | unit | Trainer list cubit: load, pagination, error |
| `test/trainer_detail_cubit_test.dart` | 2 groups | unit | Trainer detail cubit: load, link/unlink |
| `test/analytics_cubit_test.dart` | 2 groups | unit | Analytics cubit: load, error |
| `test/widget_test.dart` | 1 group | widget | Smoke test (auth screens render) |
| `test/experimental_features_cubit_test.dart` | 7 | unit | ExperimentalFeaturesCubit: load, 4 toggles, flag isolation |
| `test/experimental_features_service_test.dart` | 7 | unit | ExperimentalFeaturesService: defaults, roundtrip per flag, independence |
| `test/profile_config_cubit_test.dart` | 5 | unit | ProfileConfigCubit: cache-first load, no-cache, error, save updates cache |
| `test/more_cubit_test.dart` | 9 | unit | MoreCubit: cache-first load, force refresh, privacy load/save |
| `test/permissions_settings_screen_test.dart` | 2 | widget | PermissionsSettingsScreen: title, permission rows, footer |
| `test/settings_menu_row_test.dart` | 4 | widget | SettingsMenuRow: title, subtitle, onTap, custom trailing |

**Total**: 126 unit tests passing, 62 e2e tests (skipped in `flutter test`, run via Patrol).
**Pre-existing failures**: `widget_test.dart` (looks for "ZIRO.FIT" text no longer rendered) and `analytics_cubit_test.dart` (mock API returns error) — unrelated to sync changes.

### How to Run Tests

#### Unit Tests (fast, no device required)
```sh
# Run all unit tests (skips e2e tests tagged @Tags(['e2e']))
flutter test --exclude-tags e2e

# Run specific test files
flutter test test/sync_cubit_test.dart
flutter test test/sync_repository_test.dart

# Run all sync tests at once
flutter test test/sync_cubit_test.dart test/sync_repository_test.dart test/sync_converter_test.dart

# Run tests with a specific name pattern
flutter test --name "auto-sync"
```

#### E2E Tests (require backend + device/emulator)
```sh
# Start backend first
cd ~/pr/zirofit-next && pnpm run dev

# Run a single e2e flow with Patrol
patrol test --target test/e2e/flows/offline_sync_e2e_test.dart

# Run all e2e flows
patrol test --target test/e2e/flows/

# Run specific e2e tests by tag/name
patrol test --target test/e2e/flows/ -- --name "Sync"
```

**Backend must be running** on port 3321. Use test credentials from `test/e2e/helpers/test_credentials.dart`:
- `client.ada@ziro.fit` / `password123` (linked client)
- `client.unlinked@ziro.fit` / `password123` (unlinked client)
- `ada@ziro.fit` / `password123` (trainer)

#### Code Generation
```sh
flutter pub run build_runner build --delete-conflicting-outputs
```
Required after modifying `@injectable`, `@freezed`, or Drift table annotations.

#### Lint / Analyze
```sh
dart analyze lib/
```

### Known Gaps / TODO
- **Push notifications** — local notification support added (`flutter_local_notifications`), but remote push (FCM/APNs) not wired
- **Stripe checkout** — deep link routes exist, the actual Stripe payment sheet integration in Flutter is not wired
- **Plate calculator** — widget exists (`plate_calculator.dart`) but isn't integrated into workout flow
- **Animation/test coverage for more features** — most features (trainers, explore, home, check-in, nutrition, notifications, workout) lack unit tests for their cubits
- **CI/CD pipeline** — no GitHub Actions, Fastlane, or Docker setup

### Recently Resolved

- **Offline sync — comprehensive unit & e2e test coverage** — The sync layer (SyncCubit, SyncRepository, SyncConverter) now has 72 unit tests (29 SyncConverter + 31 SyncRepository + 12 SyncCubit) covering: date conversion, snake_case↔camelCase mapping, pull/push round-trips with all 17 Drift tables, error handling, connectivity change auto-sync, auto-sync from SyncError state on restore, and lastSyncAt preservation across errors. 7 table name mismatches in SyncRepository were fixed (wire snake_case keys vs Drift PascalCase table names). The e2e test suite in `test/e2e/flows/offline_sync_e2e_test.dart` was expanded with 5 scenarios (tab switch after sync, pull-to-refresh, daily targets load, analytics survival, notification badge update). See `docs/e2e-testing.md` for Patrol architecture.

- **Exercise picker — unified bottom sheet** — The template creation `CreateTemplateView` and the live workout `WorkoutSessionScreen` previously had separate, non-shared exercise picker implementations (dialog vs bottom sheet). Both now use the shared `ExercisePickerSheet` widget, a reusable bottom sheet with fuzzy search, supporting both single-select (workout) and multi-select (template creation) via named constructors. See `docs/exercise-picker.md`.

- **Trainer profile — comprehensive detail view** — The trainer detail screen was expanded from a basic profile to a full App Store-style layout matching iOS `PublicTrainerProfileView` (banner, avatar, identity row, tag badges, About section, Packages carousel, Photos carousel, Reviews carousel, Schedule section, Connect button, Custom Program Request sheet). 19 new model DTOs, 14 new widgets, and a `BookingCubit` + `BookingApiService` were added.

- **Profile — More screen expansion** — Profile went from a basic scaffold to a full settings menu (867 lines) with 11 sub-screens (language, AI coach, contact support, packages, privacy, purchase history, notifications, custom exercises, dashboard prompts, appearance), backed by `MoreCubit` + `ProfileApiService`.

- **Home — program management & templates** — Implemented full program lifecycle: `ProgramCubit`, `ProgramApiService`, `ProgramRepository`, `RoutineBuilderScreen`, `RoutineSchedulerScreen`, `TemplatesLibraryScreen`, `ProgramDetailScreen`, `TemplateDetailScreen`, `CreateTemplateView`, and `LocalTemplateRepository` (Drift-backed local storage for user-created templates).

- **Analytics dashboard** — New analytics feature with 7 widget types (consistency, heatmap, muscle donut, PRs, volume bars, volume line, weight line) in a drag-to-reorder grid layout. Backed by `AnalyticsCubit`, `AnalyticsApiService`, `AnalyticsRepository`.

- **Check-in flow** — Multi-step check-in (body metrics → wellness → notes → photos) with history, detail view, and photo upload. Backed by `CheckInCubit`, `CheckInApiService`, `CheckInRepository`.

- **Daily Targets & Fitness Goals** — Goal tracking screens backed by dedicated cubits, API services, and repositories.

- **Notification realtime service** — Supabase Realtime subscription for live notification updates with automatic polling fallback. Handles insert/update/delete events and connection state changes.

- **Workout session — minimize/maximize overlay** — Ported iOS `WorkoutMiniPlayer` to Flutter: drag-down gesture on full-screen session triggers `minimize()` which sets `isMinimized=true`; `_MainShell` stack overlay renders `WorkoutMiniPlayer` 90pt above bottom nav. Tap to maximize. Full UI parity with iOS `ContentView` ZStack pattern.

- **Workout timer — backend `startTime` sync** — Removed `DateTime.now()` from `start()` and `loadCurrent()`; now parses server's `DateTime.parse(result.session.startTime)` as authoritative reference. `_tick()` computes elapsed as `DateTime.now().difference(serverStartTime)` — timer stays accurate across restarts and cold starts.

- **Workout session — full console logging** — 21 `developer.log` calls (`name: 'workout'`) across all cubit state transitions (`logSet` optimistic + reconciled, rest timer, add/remove exercise, pause/resume, minimize/maximize, cancel, start/finish). 7 screen-level logs for keyboard navigation (`nav_focus`, `nav_next`, `nav_dismiss`, `_completeSet`, `_addSet`).

- **Workout session — cold-start active session check** — `main.dart` `_authSubscription` now calls `_workoutSessionCubit.loadCurrent()` on `AuthAuthenticated` (same phase as notifications). If a live session exists server-side, the mini player appears immediately with synced timer, matching iOS `WorkoutManager.checkForActiveSession()`. No more stale timers or manual navigation needed.

- **Nutrition & Habits — dedicated screen** — The `_NutritionHabitsCard` on the home dashboard was incorrectly pointing to `/daily-targets`. Implemented a full `NutritionHabitsScreen` matching the iOS spec from `ios-nutrition-habits-handoff.md`: nutrition plan detail with macro progress bars (calories/protein/carbs/fats), section blocks for meal notes/foods to eat/foods to avoid/meal timing/hydration/supplements/habit notes, and today's habit checklist with circle checkboxes and frequency badges. Backed by `NutritionHabitsCubit` which loads plan + habits in parallel and supports optimistic habit toggle via `POST /api/client/habits/{habitId}/log`. See `docs/ios-nutrition-habits-handoff.md` for the iOS reference spec.

- **Nutrition & Habits** (`../Ziro-Fit/ios-nutrition-habits-handoff.md`) — iOS spec for nutrition plan detail view (macro bars, meal notes, foods, hydration, supplements) and habit checklist with toggle. Flutter implementation matches the spec exactly. See `docs/ios-nutrition-habits-handoff.md`.

## iOS Reference App

The iOS version of ZIRO.FIT is at **`../Ziro-Fit`** (Swift/SwiftUI).
Before building any UI feature, check the iOS implementation first for layout patterns, component hierarchy, spacing, typography, and color usage.
Key reference files:
- Explore tab (trainer cards): `Ziro Fit/Views/ZiroMe/TrainerDiscoveryView.swift` — `TrainerDiscoveryCard`, `ExploreTrainerCard`
- Workout session: `Ziro Fit/Views/Common/WorkoutSessionView.swift` — timer, exercise list, set logging, rest timer, controls
- Home tab: `Ziro Fit/Views/ZiroMe/PersonalHomeView.swift`
- Notifications: `Ziro Fit/Views/Common/NotificationsView.swift` — `NotificationRow`, `NotificationsViewModel`, `NotificationModel`
- Sheet header: `Ziro Fit/Views/Components/ZiroSheetHeader.swift` — reusable modal header
- Routine Builder: `Ziro Fit/Views/ZiroMe/PlanBuilderView.swift` — program creation with template selection flow
- Program detail: `Ziro Fit/Views/ZiroMe/MyProgramDetailView.swift` — active program with progress and template list
- Workout templates: `Ziro Fit/Views/ZiroMe/WorkoutTemplatesView.swift` — template library with search
- Trainer profile (public): `Ziro Fit/Views/ZiroMe/PublicTrainerProfileView.swift` — App Store-style profile with banner, tabs (About/Packages/Photos/Reviews/Schedule), connect states, custom program request. See `docs/trainer-profile-analysis.md`.
- **WorkoutManager** (`Ziro Fit/Managers/WorkoutManager.swift`) — Singleton manager: `init()` runs parallel `checkForActiveSession()` + `syncLibrary()`; `resumeSession()` sets `isMinimized=true` and starts timer synced to server `startTime`; two-phase recovery (primary: active session endpoint, fallback: calendar events). Timer uses `WorkoutTimer` object with `startTime: Date` computing `Date().timeIntervalSince(startTime)` every tick.
- **ContentView** (`Ziro Fit/ContentView.swift`) — Root view: creates `@StateObject workoutManager`, overlays `WorkoutMiniPlayer` when `isSessionActive && isMinimized`, hosts conflict alert.
- **WorkoutMiniPlayer** (`Ziro Fit/Views/Components/WorkoutMiniPlayer.swift`) — Minimized overlay: displays `timer.formattedTime`, pause/play toggle, maximize button, swipe-up-to-maximize gesture, positioned 90pt above tab bar.
- **Ziro_FitApp** (`Ziro Fit/Ziro_FitApp.swift`) — App entry point: passes `workoutManager` as `.environmentObject` to `MainTabView` via `ContentView`.

## NO PLACEHOLDERS — Full API Integration (STRICT RULE)

**Every screen, widget, and feature MUST be fully connected to the backend API. Placeholder UIs, mock data, hardcoded IDs, "coming soon" stubs, and no-op handlers are strictly forbidden.**

Rules:
1. **Every API endpoint called from a cubit MUST have a real Dio request** in the corresponding `ApiService` class — no stubs, no `// TODO`, no empty method bodies.
2. **Every UI action** (add exercise, finish session, log set, etc.) **MUST call a real API endpoint** — no local-only mutations that skip the backend.
3. **Every model field** must match the backend Zod schema exactly (nullable vs required). If the backend returns `string | null`, the Flutter field must be `String?`, never `String`.
4. **Exercise IDs and all resource IDs** must be valid UUIDs from the backend — never use user-typed text as an ID.
5. **Switching environments**: The backend URL is configured in `lib/core/network/dio_client.dart` via the `API_BASE_URL` env var, with per-platform defaults (`http://10.0.2.2:3321` for Android emulator, `http://localhost:3321` for iOS simulator/desktop). Set `API_BASE_URL` to a production URL for release builds. No hardcoded environment toggles.
6. **Rest timer** is a required feature of the workout session — the iOS app has `RestTimerManager` + `RestTimerSheet` + `RestTimerProgressBar`. The Flutter API service has `startRest`/`endRest` endpoints already. The cubit and UI MUST wire these up properly, not leave them as dead code.
7. **Hardcoded IDs/text as IDs** is forbidden. Any exerciseId, sessionId, or similar resource identifier MUST come from the backend API response, never from user text input.

## How to Verify Backend Contracts

**Do not trust `docs/implementation.md` blindly.** The backend repo at `~/pr/zirofit-next` is the source of truth for API shapes. Before creating any Flutter model or service:

1. Read the Zod schema file alongside each backend route: `src/app/api/<path>/route.schema.ts` — this defines the exact request/response contract.
2. Read the route handler `route.ts` to confirm the runtime response shape.
3. Read `prisma/schema.prisma` for database model fields that map to API response shapes.
4. For sync tables, read `src/lib/sync/utils.ts` for the exact `SYNC_TABLES` list and `TABLE_MODEL_MAP`.
5. Read `src/lib/api/response.ts` to understand the `{ data }` / `{ error }` wrapper envelope.

**Full client API reference**: `docs/api/client-routes.md` — complete request/response shapes with value types for all 48 endpoints across 21 client API modules (dashboard, programs, templates, check-ins, daily targets, fitness goals, habits, events, trainer link, privacy, sharing, progress, analytics, AI, upload, etc.).

**Backend commands:**
```sh
cd ~/pr/zirofit-next
npm run dev          # starts on port 3321
npm run test         # Jest unit tests
npm run lint         # ESLint
npm run ts-check     # TypeScript check (non-strict)
npm run db:seed      # Reset DB, migrate, seed
```

Backend has **no CI/CD pipeline** and `.env` is committed to git (not gitignored).

## Tech Stack (from spec, verified against backend)

| Concern | Choice | Backend Confirmation |
|---|---|---|
| State management | `flutter_bloc` | N/A |
| DI | `get_it` + `injectable` | N/A |
| Local DB | `drift` (SQLite) | N/A |
| HTTP | `dio` + `flutter_secure_storage` | Backend uses Supabase JWT |
| Maps | `flutter_map` (OpenStreetMap) | Backend uses react-leaflet v5 |
| Payments | `flutter_stripe` | Backend uses Stripe SDK v22 |
| Architecture | Clean Architecture, feature-first | Backend uses service layer pattern |
| Theme | shadcn/ui Zinc/Neutral, forced light mode, Apple-style `#007aff` blue accent | N/A |

## Complete API Contract Table (verified from backend source)

### Auth Endpoints

| Method | Path | Request Body / Query | Response (`{ data: ... }`) |
|---|---|---|---|
| `POST` | `/api/auth/register` | `{ name?: string, email: string, password: string (min 8), role?: string, redirect?: string (url), trainerId?: string }` | `{ userId: string, message: string, requiresSubscription: bool, confirmationRequired: true }` |
| `POST` | `/api/auth/login` | `{ email: string, password: string }` | `{ message: string, role: string, user: object, accessToken: string, refreshToken: string }` |
| `POST` | `/api/auth/refresh` | `{ refreshToken: string }` | `{ accessToken: string, refreshToken: string, expiresAt: number (unix), user: object }` |
| `POST` | `/api/auth/signout` | (empty) | `{ message: "Logout successful." }` |
| `GET` | `/api/auth/me` | (auth header) | `{ id, email, name, role, username, tier, hasCompletedOnboarding, clientId, subscriptionStatus?, profilePhotoPath?, isFreeAccessModeEnabled?, metadata: {} }` |
| `POST` | `/api/auth/sync-user` | (auth header) | `{ message: string, userId: string }` |
| `POST` | `/api/auth/complete-onboarding` | (auth header) | `{ success: true }` |
| `POST` | `/api/auth/forgot-password` | `{ email: string, redirectTo?: string }` | `200` |
| `POST` | `/api/auth/update-password` | `{ password: string (min 6) }` | `200` |
| `POST` | `/api/auth/resend-verification-email` | `{ email: string, redirect?: string (url) }` | `200` |
| `GET` | `/api/auth/mobile-signin?provider=google\|apple` | query: `provider` | redirect to OAuth provider |

**Response envelope**: All successful responses wrap in `{ data: <shape> }`. Errors wrap in `{ error: { message: string, code?: string, details?: any } }`.

**Note**: The register `route.schema.ts` declares `role: z.enum(["client", "trainer"])`, but the route handler at runtime accepts `role: z.string().optional()` and **defaults to `"pending"`** (or `"client"` if `trainerId` is provided). Always trust the handler behavior over the schema declaration for optional fields.

### Client-Trainer Link Endpoints (Auth required)

| Method | Path | Request Body | Response |
|---|---|---|---|
| `POST` | `/api/client/trainer/link` | `{ trainerUsername: string }` | `{ message: string }` |
| `GET` | `/api/client/trainer/link` | `?trainerId=` or `?trainerUsername=` | `{ isLinked: bool }` |
| `DELETE` | `/api/client/trainer/link` | — | `{ message: string }` |
| `POST` | `/api/clients/request-link` | `{ email: string }` | `{ message: string }` (trainer invites client) |

### Client Dashboard Endpoints (Auth required)

| Method | Path | Request / Query | Response (`{ data: ... }`) |
|---|---|---|---|
| `GET` | `/api/client/dashboard` | — | `{ clientData: { id, userId, name, email, trainer: { id, name, username, email } \| null, workoutSessions: [...], measurements: [...] }, weightUnit: "KG", upcomingClientSessions: [...], lastCheckIn: string (ISO) \| null }` |
| `GET` | `/api/client/program/active` | — | `{ program: { id, name, description? }, progress: { completedCount, totalCount, progressPercentage, nextTemplateId? }, templates: [{ id, name, description?, order, status: "COMPLETED"|"NEXT"|"PENDING", exerciseCount }] }` \| **null (404)** |

### Programs & Routine Builder (Auth required)

| Method | Path | Request / Query | Response (`{ data: ... }`) |
|---|---|---|---|
| `GET` | `/api/client/programs` | `?type=template&source=system\|personal\|all` | `{ assignedPrograms: Program[], personalPrograms: Program[], personalTemplates: Template[], systemTemplates: Template[], categories: string[] }` |
| `POST` | `/api/client/programs` | `{ name: string, description?: string }` | `{ program: Program }` |
| `GET` | `/api/client/programs/[id]` | — | `{ program: Program }` |
| `POST` | `/api/client/programs/templates` | `{ name: string, programId: string, description?: string }` | `{ template: ProgramTemplate }` |

**Program model (`ProgramDto`)**: `{ id, name, description?, trainerId?, category?, templates: ProgramTemplate[], isScheduled, scheduledStartDate?, scheduleFrequency?, activeTemplateIndex?, trainerName?, trainerAvatarUrl?, source?, assignmentId?, startDate?, isActive }`  
**ProgramTemplate model**: `{ id, name, description?, order, exerciseCount, status?, templateType?, ... }`

### Promoted Trainers (Public)

| Method | Path | Query Params | Response |
|---|---|---|---|
| `GET` | `/api/explore/promoted-trainers` | `category: FEATURED\|ZIRO_RECOMMENDED` | `{ trainers: [{ id, name, username, avatarUrl, rating, isVerified, specialties, promotionCategory, promotedAt }] }` |

### Trainer Discovery (Public)

| Method | Path | Query Params | Response (`{ data: ... }`) |
|---|---|---|---|
| `GET` | `/api/trainers` | `page`, `pageSize` (max 50, default 15), `q`, `location`, `lat`/`lng` (or `latitude`/`longitude`), `sortBy` (name_asc\|name_desc\|newest\|price_asc\|price_desc\|distance), `specialties`, `minRating`, `trainingTypes` | `{ trainers: Trainer[], total: number, page: number, pageSize: number, totalPages: number }` with `isLinked: bool` per trainer |
| `GET` | `/api/trainers/[username]` | — | Trainer full profile |
| `GET` | `/api/trainers/[username]/public` | — | `TrainerPublicDetails` with `profile.isLinked: bool` |
| `GET` | `/api/trainers/[username]/schedule` | — | Trainer availability schedule |
| `GET` | `/api/trainers/[username]/packages` | — | `{ packages: Package[] }` (active packages, price as string) |
| `GET` | `/api/trainers/[username]/testimonials` | — | Testimonials |
| `GET` | `/api/trainers/[username]/transformation-photos` | — | Transformation photos |

### Client Check-in / Daily Targets / Fitness Goals (Auth required)

| Method | Path | Request / Query | Response (`{ data: ... }`) |
|---|---|---|---|
| `GET` | `/api/client/check-in/config` | — | Check-in configuration (body metrics, wellness, photos, notes) |
| `POST` | `/api/client/check-in` | Check-in submission body | Check-in response |
| `GET` | `/api/client/check-in/history` | — | List of past check-ins |
| `GET` | `/api/client/check-in/:id` | — | Single check-in detail |
| `POST` | `/api/client/check-in/upload` | multipart photo | Upload response |
| `GET` | `/api/client/daily-targets` | — | Daily targets config |
| `PUT` | `/api/client/daily-targets` | Updated targets | Updated targets |
| `GET` | `/api/client/fitness-goals` | — | Fitness goals list |
| `POST` | `/api/client/fitness-goals` | New goal | Created goal |
| `PUT` | `/api/client/fitness-goals/:id` | Updated goal | Updated goal |
| `DELETE` | `/api/client/fitness-goals/:id` | — | Deletion confirmation |
| `GET` | `/api/client/sharing` | — | Sharing config |
| `PUT` | `/api/client/sharing` | Updated config | Updated config |
| `GET` | `/api/client/privacy` | — | Privacy settings |
| `PUT` | `/api/client/privacy` | Partial updates | Updated privacy settings |

### Analytics & Progress (Auth required)

| Method | Path | Request / Query | Response (`{ data: ... }`) |
|---|---|---|---|
| `GET` | `/api/client/progress` | — | Progress data (volume, weight, consistency, heatmap, PRs) |
| `GET` | `/api/client/analytics/widgets` | — | Widget layout config |
| `PUT` | `/api/client/analytics/widgets` | Updated widget layout | Updated layout |

### Workout Sessions (Auth required)

| Method | Path | Request / Query | Response |
|---|---|---|---|
| `GET` | `/api/trainer/sessions/[sessionId]/feedback` | — | Session feedback |
| `GET` | `/api/exercises/sync` | `lastPulledAt` (unix ms) | `{ changes: Exercise[], timestamp: number }` |

### Checkout

| Method | Path | Request Body | Response |
|---|---|---|---|
| `POST` | `/api/checkout/session` | `{ type: "PACKAGE_SALE"\|"EVENT_TICKET", packageId?/eventId?/id?: string, isMobile?: bool }` | `{ url: string }` (Stripe checkout URL) |

### Sync Engine (Auth required)

| Method | Path | Request / Query | Response |
|---|---|---|---|
| `GET` | `/api/sync/pull` | `last_pulled_at` (unix ms) | `{ changes: Record<SyncTableName, { created: [], updated: [], deleted: string[] }>, timestamp: number }` |
| `POST` | `/api/sync/push` | `{ changes: Record<SyncTableName, { created: [], updated: [], deleted: string[] }> }` | `{ timestamp: number }` |

**Sync table names** (snake_case keys used over the wire):
```
clients, profiles, workout_sessions, exercises, workout_templates,
client_assessments, client_measurements, client_photos, client_exercise_logs,
trainer_services, trainer_packages, trainer_testimonials, trainer_programs,
notifications, bookings, trainer_profiles, calendar_events
```

**Sync data format**: All date fields (`createdAt`, `updatedAt`, `deletedAt`) are transmitted as **Unix timestamps in milliseconds**. The sync uses **snake_case** keys on the wire — client must convert to camelCase internally. Backend uses LWW (last-write-wins) reconciliation.

## Conventions (from spec + backend verification)

- **Directory layout**: `lib/core/{di,network,database,security,theme}/` + `lib/features/{auth,trainers,trainer,workout,sync,home,explore,notifications,profile,analytics,check_in,daily_targets,fitness_goals,sharing,onboarding,nutrition_habits,voice_coach}/`
  - `trainers/` = client-facing trainer discovery/profiles/workout
  - `trainer/` = trainer-side app (dashboard, clients, programs, check-ins)
- **Offline-first**: writes go to local SQLite immediately; `sync_status` column tracks pending changes; LWW reconciliation on reconnection
- **Auth**: JWT tokens stored in `flutter_secure_storage`; Dio `QueuedInterceptor` handles silent refresh on 401 via `POST /api/auth/refresh`
- **Workout state**: `WorkoutCubit` with sealed `WorkoutState` hierarchy — use **freezed** for data classes and sealed unions (already implied by backend `Prisma` enum patterns)
- **Progression engine**: pure domain service (`AutoProgressionEngine.evaluate()` / `calculateNextWeight()`) — testable, no side effects. Backend type in `src/lib/types/progression.ts`
- **Sync**: pull-first (`GET /api/sync/pull?last_pulled_at=`) then push (`POST /api/sync/push`); `connectivity_plus` triggers on reconnection
- **All API responses** are wrapped in `{ data: ... }` on success, `{ error: { message, code?, details? } }` on failure

## Development Workflow

```sh
flutter run
flutter test
flutter pub run build_runner build --delete-conflicting-outputs
```
- Code generation: `injectable` + `drift` require `build_runner` after adding/changing annotations or table definitions.
- Freezed codegen: `flutter pub run build_runner build` also generates `*.freezed.dart`.

## Toolchain & Config Conventions

- **`analysis_options.yaml`** — create with `flutter_lints` or `very_good_analysis` as the base. Use `package:lints/recommended.yaml` as minimum. No strict mode conventions established yet.
- **`.gitignore`** — must exclude `.dart_tool/`, `build/`, `*.g.dart`, `*.freezed.dart`, `.pub-cache/`.
- **`flutter_map`** (OSM) — the tile URL template must include `userAgentPackageName: 'fit.ziro.app'` to comply with OSM tile usage policy.

## Testing Conventions

### Unit Tests (Mandatory Per Feature)

Every feature MUST have unit test coverage for its cubit and critical business logic:

- **Cubit tests** with `bloc_test`: cover initial state, each event handler, loading/error/success transitions — same pattern as `test/sync_cubit_test.dart`.
- **Service tests**: Any service that persists data (SharedPrefs, Drift, secure storage) must test roundtrip: set → verify → reload → verify.
- **Widget smoke tests**: Non-trivial widgets (settings rows, permission screens, dialogs) must render without crash under `tester.pumpWidget()`.
- **File location**: Place next to source under `test/` mirroring the source tree, with `_test.dart` suffix.
- **Naming**: `test/<feature>_*_test.dart` — group by feature, use descriptive names.

### E2E Tests (Mandatory Per Feature)

Every feature MUST have at least one end-to-end test that covers its critical user flow(s). The e2e test must verify the complete flow from a real user's perspective — not a technical unit-test perspective.

**Requirements:**
1. **Every feature** (auth, check-in, daily targets, fitness goals, sharing, analytics, explore, trainers, home, notifications, profile, sync, nutrition, voice coach, workout) MUST have at least one e2e test file in `test/e2e/flows/`.
2. **File naming**: `test/e2e/flows/<feature>_e2e_test.dart` (e.g., `offline_sync_e2e_test.dart`, `check_in_submission_e2e_test.dart`).
3. **Coverage threshold**: Every API route consumed by the feature must be exercised by at least one e2e scenario.
4. **Navigation realism**: Tests must simulate real user navigation (tab taps, bottom nav, push/pop) — not direct route pushes.
5. **State validation**: After each action, assert something visible on screen (text, widget key, absence of error indicators).
6. **Restore clean state**: If the test creates side effects (toggles, submissions), reverse them at the end.

**How to write an e2e test:**
```dart
@Tags(['e2e'])
library;

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import '../helpers/auth_helper.dart';

void main() {
  patrolTest(
    'CX: Clear description of what the test verifies',
    (PatrolIntegrationTester $) async {
      await login($);                          // authenticate once per test
      // ... real user flow: tap tab → tap row → verify screen → interct → verify result
    },
  );
}
```

**Fixture credentials**: defined in `test/e2e/helpers/test_credentials.dart`:
- `client.ada@ziro.fit` / `password123` (linked client — has trainer, active program, sessions)
- `client.unlinked@ziro.fit` / `password123` (unlinked client — no trainer, for standalone flows)
- `ada@ziro.fit` / `password123` (trainer — for trainer-side flows)

**Runner** (backend must be running on port 3321):
```sh
patrol test --target test/e2e/flows/<file>.dart     # single file
patrol test --target test/e2e/flows/                 # all e2e tests
patrol test --target test/e2e/flows/ -- --name "Sync"  # filter by name
```

### Full Test Coverage Gate

A feature is considered **done** only when:
1. All cubit methods and state transitions are covered by unit tests (≥80% coverage of state transitions).
2. Every API endpoint consumed by the feature is exercised by at least one e2e scenario.
3. `flutter test --exclude-tags e2e` passes including the new tests.
4. `dart analyze lib/` passes with zero errors on changed files.
5. E2E test file exists at `test/e2e/flows/<feature>_e2e_test.dart` and has been verified to pass against the running backend.

## Delivery Standards — E2E Production Readiness

### Principle: Ship Finished Features, Not Skeleton Code

Every feature delivered to this codebase must be **end-to-end production-ready**. The bar is not "it compiles" — it's "a real user can complete the full flow without hitting a stub, a crash, or an inconsistency."

### Rules

#### Rule 1: No Mock Data in Production Code
- **Zero mock data** in any widget, cubit, repository, or service that ships to production.
- Mock data belongs ONLY in test files (`*.test.dart`, `test/` directory) or dedicated mock classes.
- A feature is not "done" until it fetches real data from a real endpoint. Mock-driven development is for exploration only — never commit mock data paths.
- Exception: Only if the backend endpoint does not exist yet AND the feature is behind a feature flag.

#### Rule 2: No Inconsistencies
- Every new feature must be consistent with the existing codebase:
  - **Pattern consistency**: Use the same state management pattern (Cubit + freezed sealed states), same DI pattern (`@injectable` / `@singleton`), same networking pattern (Dio service + repository).
  - **Naming consistency**: Match existing file naming (`snake_case`), model naming (`XxxDto` for API DTOs), directory structure (`cubit/`, `data/`, `presentation/`).
  - **Visual consistency**: Use only the 8 design tokens. No custom colors, radii, or typography values.
  - **Error handling consistency**: Every API call must emit an error state. Every BlocConsumer must handle the error state.
- Before writing any new code, read 2-3 existing files in the same layer to establish the pattern.

#### Rule 3: Deep Analysis Before Feature Delivery
Before implementing any feature:
1. **Read the existing implementation** — check if similar functionality exists elsewhere in the codebase that can be reused or extended.
2. **Read the iOS reference** (if applicable) — the iOS app at `../Ziro-Fit` is the design specification. Understand the full layout, component hierarchy, spacing, and interaction model before writing a single line of Flutter code.
3. **Verify backend contracts** — read the Zod schema (`route.schema.ts`), route handler (`route.ts`), and Prisma schema (`schema.prisma`) for every endpoint the feature touches.
4. **Identify reuse opportunities** — does this feature share models, widgets, or cubits with existing features? Extract shared code rather than duplicating.
5. **Document analysis** — if the feature is complex, write an analysis doc in `docs/` (see `docs/trainer-profile-analysis.md`, `docs/home-page-analysis.md` for examples).

#### Rule 4: No Dead Code Pathways
- Every API method in a service must be called from a cubit. Every cubit method must be called from UI. Every UI action must trigger a real API call.
- No `// TODO` comments that mark unfinished work. Either implement it fully or don't commit it.
- No commented-out code. Delete it.
- Every navigation route must lead to a real screen with real content. No "coming soon" screens.

#### Rule 5: No Code Duplication
- Same logic written twice = extract it. Same pattern across two files = shared widget/mixin/helper.
- If two API responses share fields, create a shared base model. Never define the same field in two separate model files.
- If two screens share a UI component, extract it into a shared widget file. Never copy-paste widget code.
- See Anti-Slop Rule #3 below for detailed DRY enforcement.

#### Rule 6: Full-Context Validation
Before marking any feature complete, verify:
- [ ] All widgets render with real data (not mock/placeholder)
- [ ] All API endpoints called from the feature exist and return correct shapes
- [ ] **Programmatic API verification completed** — see Rule 7
- [ ] All error states are handled (loading, error, empty, success)
- [ ] All navigation flows work end-to-end
- [ ] `dart analyze` passes with zero errors
- [ ] `flutter test` passes (all tests, not just your new ones)
- [ ] **E2E test exists** at `test/e2e/flows/<feature>_e2e_test.dart` covering all critical user flows
- [ ] No dead code, no `print()` statements, no commented-out code

#### Rule 7: Programmatic API Contract Verification (MANDATORY)
**Verbal claims are not sufficient.** An LLM agent that says "the feature is implemented" or "the bug is fixed" MUST prove it by querying the live backend and comparing actual responses against Flutter DTOs.

**When verification is required:**
- Every feature delivery that involves API integration (before marking "complete")
- Every bug fix that involves API response parsing (before marking "fixed")
- Every model/endpoint contract change (before claiming "migrated")

**Verification protocol:**
```
Step 1: Ensure backend is running
  → cd ~/pr/zirofit-next && npm run dev
  → Confirm port 3321 is listening

Step 2: Authenticate
  → POST /api/auth/login { email, password }
  → Extract accessToken from response

Step 3: Query every endpoint the feature touches
  → For each endpoint (GET/POST/PUT/DELETE):
    → Call it with the auth token
    → Capture the raw JSON response
    → Compare every field against the Flutter DTO:
      - Does the field exist in both? (no extra, no missing)
      - Does the nullability match? (required vs optional)
      - Does the type match? (String, int, double, List, nested object)
      - Does the response envelope match? ({ data: ... } wrapper)

Step 4: Report discrepancies
  → Log every mismatch: field name, expected type, actual type/value
  → If mismatches found: FIX THE FLUTTER DTO, do not modify backend
  → Re-verify after fixing
```

**Credentials for verification (from `prisma/seed.ts`):**
- **Primary test client** (linked to trainer Ada, has active program, sessions, measurements):
  ```
  Email:    client.ada@ziro.fit
  Password: password123
  ```
- **Unlinked test client** (no trainer, for standalone flows):
  ```
  Email:    client.unlinked@ziro.fit
  Password: password123
  ```
- **Trainer account** (for trainer-facing endpoints):
  ```
  Email:    ada@ziro.fit
  Password: password123
  ```
All accounts use the same password `password123` (set by `ensureAuthUser()` in seed.ts).
Verify credentials are still valid by calling `/api/auth/me` after login.

**Tooling:**
- Use `curl` via bash for quick endpoint verification
- Use a Dart integration test (`test/api_contract_test.dart`) for repeatable verification
- Store the verification script in `scripts/verify-api-contracts.sh`

**Pass Criteria:**
All fields present and matching in type/nullability. Zero discrepancies between live backend response and Flutter model. If the backend returns a field the Flutter model doesn't have → add it. If the model has a field the backend doesn't return → verify it's optional with a default.

---

## Development Standards (Anti-Slop Rules)

### 1. Code Quality Gates (MANDATORY before any `completed`)
Before marking any task done, verify ALL:
- `dart analyze` produces zero errors on changed files
- `flutter test` passes (all tests, not just your new ones)
- No `as dynamic`, `as Object`, or runtime type checks to bypass the type system
- No commented-out code, debug print statements, or `print()` calls (use `import 'dart:developer'` and `log()` for intentional debug output)
- No `// ignore:` comments without a documented reason

### 2. UI Consistency — Design Token Lockdown
**Never hardcode visual values.** The design system is the single source of truth:
- Colors: use ONLY the 8 tokens defined in `docs/implementation.md` (Primary `#007aff`, Background, Card/Surface, Muted Surface, Border Muted, Border Active, Foreground, MutedText). Zero exceptions.
- Radius: `rounded-2xl` = `16.0`, fully rounded inputs/buttons = `99.0`, card border = `24.0`. No custom radius values.
- Typography: `labelStyle: TextStyle(fontSize: 14.0)`. Keep to 14px body, 16px headings, 12px captions.
- Dark mode: **forbidden**. `ThemeData(brightness: Brightness.light)` only. No dark mode support in any widget.
- If the design spec doesn't define a value for something, raise it — don't invent it.

### 3. DRY / No Duplication
- **If you write the same logic twice, extract it.** Three lines duplicated = shared helper. A pattern repeated across two files = shared widget or mixin.
- **Repository interfaces**: Only create them if there are ≥2 implementations (e.g., `SyncRepository` with `SyncRepositoryImpl` + `MockSyncRepository`). For single-implementation data sources, use the concrete class directly.
- **Widget decomposition**: Any widget exceeding 80 lines must be split. Extract repeated widget patterns into `buildX()` methods or separate widget files.
- **No copy-paste models**: If two API responses share fields, create a shared base model. Never define the same field in two separate model files.

### 4. State Management Discipline
- **`flutter_bloc` / `Cubit` for all shared state.** `setState()` is allowed ONLY for purely local UI animations (e.g., a text field focus state, a dropdown open/close). Any state that affects more than one widget must be in a Bloc/Cubit.
- **One Cubit per feature page**, not one per widget. Group related state.
- **Business logic outside widgets.** Blocs go in `lib/features/<name>/cubit/`. Widgets in `lib/features/<name>/presentation/` call cubit methods, never contain business logic.
- **Sealed state classes** with `freezed` — every Cubit must emit a sealed union (e.g., `AuthState.initial`, `AuthState.loading`, `AuthState.authenticated(user)`, `AuthState.error(message)`).

### 5. Error Handling — No Silent Failures
- **Every API call** in a Cubit must emit an error state on failure. No empty `catch(e) {}` blocks.
- **Every BlocConsumer/BlocBuilder** must handle `error` state — at minimum show a `SnackBar` or an error widget. Unhandled error states are bugs.
- **Network errors** should map to user-facing messages, not raw exception text.
- **Try/catch** only around operations that throw. Don't wrap entire function bodies in try/catch.
- Use `Result<T>` pattern or sealed states for operations that can fail — never use `null` to signal failure.

### 6. Testing Requirements
- **Pure domain logic MUST be unit-tested.** `AutoProgressionEngine.evaluate()` needs tests for every branch (below threshold, at threshold, above threshold, invalid input).
- **Cubits must be unit-tested** with `bloc_test`: test initial state, each event handler, loading/error/success transitions.
- **No widget tests for trivial widgets** (simple text/layout). Do widget test for interactive widgets (forms, lists with tap handlers).
- **Drift database queries** — test with an in-memory `NativeDatabase.memory()`.
- **E2E tests** use **Patrol** (not `integration_test`) — handles native permission dialogs, system UI, and deep link return flows. See `docs/e2e-testing.md` for full architecture, setup, and flow catalog.

### 7. Code Organization Rules
- **Feature-first**: `lib/features/<name>/` contains `cubit/`, `data/`, `domain/`, `presentation/`. Never put feature code in `lib/core/`.
- **`lib/core/`** is for truly shared infrastructure only: DI setup, network client, database instance, security wrapper, theme.
- **Model naming**: API response DTOs → `XxxResponse` or `XxxDto`. Domain models → plain name. Database entities → `LocalXxx`.
- **File naming**: snake_case. One class per file (except tiny private classes). Match file name to class name.

### 8. Code Generation Discipline
- After adding/modifying any `@injectable`, `@freezed`, or Drift table annotation, **immediately run**:
  ```sh
  flutter pub run build_runner build --delete-conflicting-outputs
  ```
- Generated files (`*.g.dart`, `*.freezed.dart`) are committed to git. Do not add them to `.gitignore`.
- Never manually edit generated files.

### 9. Debug Logging — Track Everything
Build a **structured logging system** so the full app behavior is traceable from logs without a debugger. Must be **debug-only** (zero overhead in release builds).

**Logging infrastructure** (`lib/core/logging/`):
- **ApiLogger** — Dio interceptor that logs every HTTP call:
  ```
  [API] POST /api/auth/login → 200 (342ms)
  [API]   Request: {"email":"...", "password":"***"}
  [API]   Response: {"data":{"accessToken":"eyJ...", "role":"client", ...}}
  ```
  - Log method, URL, status code, timing (ms)
  - Log full request body (mask `password`, `refreshToken`, `accessToken` fields)
  - Log full response body (truncate at ~2000 chars to avoid log spam)
  - Tag with unique request ID per call for correlating request↔response

- **StateLogger** — Custom `BlocObserver` that logs every state transition:
  ```
  [CUBIT] AuthCubit → LoginSubmitted
  [CUBIT] AuthCubit   AuthState.loading → AuthState.authenticated(user.id=abc)
  ```
  - Log event name + new state (short summary, not the full object)
  - Log full state only when `state.toString()` changes (use `freezed`'s built-in toString)

- **LoggerConfig** — switch to enable/disable:
  ```dart
  class LoggerConfig {
    static bool get logApiCalls => !kReleaseMode;
    static bool get logStateChanges => !kReleaseMode;
    static bool get logNavigation => !kReleaseMode;
  }
  ```

- **No `print()`** — use `dart:developer`'s `log()` for escaping tree-shaking:
  ```dart
  import 'dart:developer' as developer;
  developer.log('message', name: 'api');
  ```
  This produces structured output visible in `flutter logs` and DevTools.

**Usage rules:**
- `ApiLogger` must be the outermost Dio interceptor (last added, first to see requests)
- `BlocObserver` must be set in `main()` before any Bloc is created
- Do NOT log binary data (images, file uploads) — log only URLs/metadata
- In `kReleaseMode`, all logging must compile to zero runtime overhead (Dart tree-shakes `if (kReleaseMode)` branches)

## Gotchas

- **`.gitignore`** — excludes `.dart_tool/`, `build/`, `.pub-cache/`, `*.g.dart` and `*.freezed.dart` are tracked in git.
- **Spec docs live in `docs/`** — `implementation.md` is the high-level blueprint, but **backend Zod schemas are the source of truth** for API contracts.
- Backend `src/app/api/*/route.schema.ts` files define exact request/response shapes. Always consult them before writing Flutter models.
- Backend has **TypeScript non-strict mode** (`strict: false` in tsconfig) — some fields may be nullable that the types say are required.
- Backend sync uses **snake_case over the wire and camelCase internally** — your Flutter JSON serialization must handle this conversion.
- Backend uses **PNPM** not npm — always use `pnpm install` in the backend repo.
- Session cookies on the backend are set **only for web** (`user_role` cookie). Mobile uses `accessToken`/`refreshToken` from the JSON response body.
- **`docs/architechture.md` is empty** (0 bytes) — it's a placeholder that needs content when architecture diagrams are created.
- **Package prices from `/api/trainers/[username]/packages` are returned as strings** — the handler calls `pkg.price.toString()`. Your Flutter model must parse this from `String`, not `double`.
- **Mobile Stripe deep link scheme**: When `isMobile: true` is sent to `/api/checkout/session`, the return URL uses the custom `zirofitapp://` scheme. Your Flutter app must register and handle `zirofitapp://stripe-return` and `zirofitapp://packages/{id}/success|cancel` deep links.
- **Backend has no CI/CD pipeline** (no GitHub Actions, no Dockerfile). The `.env` file IS committed to git.
- **`add_2_calendar` native permissions**: Android requires `READ_CALENDAR` and `WRITE_CALENDAR` in `AndroidManifest.xml`. iOS requires `NSCalendarsUsageDescription` and `NSCalendarsWriteOnlyAccessUsageDescription` in `Info.plist`. Run `flutter pub get` after adding the dependency.
- **Client cannot update or delete programs** — those are trainer-only operations at `/api/trainer/programs/[programId]`. The client API only supports create and read.
- **No backend schedule endpoint** — `POST /api/client/programs/:id/schedule` does not exist. Routine scheduling is done purely via device calendar (`add_2_calendar`), matching iOS behavior.

## Delivery Checklist — Backend-Connected Features (MANDATORY)

After completing ANY feature that calls a backend API, run these three verification steps in order before marking the feature done:

### Step 1: Verify Backend Contracts
Reference the **Programmatic API Contract Verification** section above (Rule 7 under Delivery Standards). For every endpoint the feature touches:
1. Start the backend: `cd ~/pr/zirofit-next && npm run dev`
2. Authenticate with test credentials (`client.ada@ziro.fit` / `password123`)
3. Query each endpoint with `curl` or a Dart integration test
4. Compare every JSON field against Flutter DTOs — check field names, types, nullability
5. Fix any mismatches in Flutter models (never modify backend)

### Step 2: Run LSP Diagnostics
```sh
flutter pub run build_runner build --delete-conflicting-outputs
# Then check diagnostics on every changed file:
```
- `lsp_diagnostics` on each modified file — zero errors required
- No `as dynamic`, `@ts-ignore`, `@ts-expect-error`, `// ignore:` without documented reason
- No commented-out code, `print()`, or debug statements

### Step 3: Run Unit Tests
```sh
flutter test --exclude-tags e2e
```
- All tests must pass (not just new ones)
- If pre-existing failures exist, note them explicitly: "Done. Pre-existing test failures: [list]"
- Do not delete or modify tests to make them pass

### Step 4: Verify E2E Tests Exist
- Confirm `test/e2e/flows/<feature>_e2e_test.dart` exists with coverage of every critical user flow
- If the backend is running, run the e2e test to confirm it passes:
  ```sh
  patrol test --target test/e2e/flows/<feature>_e2e_test.dart
  ```
- E2E tests that cannot be run (back-end unavailable, no device) must at minimum compile without syntax errors
