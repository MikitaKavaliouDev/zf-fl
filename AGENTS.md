# ZIRO.FIT — Flutter Client App

## Project

**ZIRO.FIT** client mobile app — Flutter fitness training platform.
Backend is a Next.js REST API at `~/pr/zirofit-next` (separate repo).

## State

**Repo is actively under development.** Code exists across all layers (core, features, tests).
`pubspec.yaml`, `analysis_options.yaml`, `.gitignore`, CI config are all present.

This instruction file (`AGENTS.md`) is auto-loaded via `opencode.json` — agents do **not** need to be told to read it.

## iOS Reference App

The iOS version of ZIRO.FIT is at **`~/pr/Ziro-Fit`** (Swift/SwiftUI).
Before building any UI feature, check the iOS implementation first for layout patterns, component hierarchy, spacing, typography, and color usage.
Key reference files:
- Explore tab (trainer cards): `Ziro Fit/Views/ZiroMe/TrainerDiscoveryView.swift` — `TrainerDiscoveryCard`, `ExploreTrainerCard`
- Workout session: `Ziro Fit/Views/Common/WorkoutSessionView.swift` — timer, exercise list, set logging, rest timer, controls
- Home tab: `Ziro Fit/Views/ZiroMe/PersonalHomeView.swift`

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

- **Directory layout**: `lib/core/{di,network,database,security,theme}/` + `lib/features/{auth,trainers,workout,sync}/`
- **Offline-first**: writes go to local SQLite immediately; `sync_status` column tracks pending changes; LWW reconciliation on reconnection
- **Auth**: JWT tokens stored in `flutter_secure_storage`; Dio `QueuedInterceptor` handles silent refresh on 401 via `POST /api/auth/refresh`
- **Workout state**: `WorkoutCubit` with sealed `WorkoutState` hierarchy — use **freezed** for data classes and sealed unions (already implied by backend `Prisma` enum patterns)
- **Progression engine**: pure domain service (`AutoProgressionEngine.evaluate()` / `calculateNextWeight()`) — testable, no side effects. Backend type in `src/lib/types/progression.ts`
- **Sync**: pull-first (`GET /api/sync/pull?last_pulled_at=`) then push (`POST /api/sync/push`); `connectivity_plus` triggers on reconnection
- **All API responses** are wrapped in `{ data: ... }` on success, `{ error: { message, code?, details? } }` on failure

## Development Workflow

- No build/run commands defined yet (no `pubspec.yaml`). Will use standard Flutter:
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

## Testing Conventions (pending — to be defined when tests are written)

- Place unit tests next to source files as `*.test.dart` (mirroring `src/lib/services/*.test.ts` in backend)
- Integration tests in `tests/` at project root
- No snapshot testing conventions yet
- Backend integration tests require local `npm run dev` running (port 3321)

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

- **No `.gitignore` exists yet** — add one immediately when creating project files.
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
