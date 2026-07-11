# Nutrition & Habits — Full Cross-Layer Analysis

> **Date**: 2026-07-10
> **Scope**: Backend (zirofit-next), Flutter Client (zf-fl), iOS Reference (Ziro-Fit)
> **Goal**: Complete inventory, API contract verification, component hierarchy mapping, gap analysis

---

## Table of Contents

1. [Backend API Contracts](#1-backend-api-contracts)
2. [Prisma Data Models](#2-prisma-data-models)
3. [Shared Types (TypeScript)](#3-shared-types-typescript)
4. [Service Layer](#4-service-layer)
5. [Sync Coverage](#5-sync-coverage)
6. [Flutter Implementation (Client)](#6-flutter-implementation-client)
7. [Flutter Implementation (Trainer)](#7-flutter-implementation-trainer)
8. [iOS Implementation](#8-ios-implementation)
9. [Cross-Layer Model Comparison](#9-cross-layer-model-comparison)
10. [API Contract Mapping](#10-api-contract-mapping)
11. [UI Component Hierarchy](#11-ui-component-hierarchy)
12. [Gap Analysis](#12-gap-analysis)
13. [Type Mismatch Risks](#13-type-mismatch-risks)
14. [Appendix: File Inventory](#14-appendix-file-inventory)

---

## 1. Backend API Contracts

### 1.1 Nutrition Plan Endpoints

| Method | Path | Auth | Request | Response Envelope | Created |
|--------|------|------|---------|-------------------|---------|
| `GET` | `/api/client/nutrition` | client | — | `{ data: { plan: TrainerNutritionPlan \| null } }` | ✅ |
| `GET` | `/api/trainer/clients/{clientId}/nutrition` | trainer, client | — | `{ data: { plan: TrainerNutritionPlan \| null } }` | ✅ |
| `POST` | `/api/trainer/clients/{clientId}/nutrition` | trainer | `CreateNutritionPlanInput` (see below) | `{ data: { plan: TrainerNutritionPlan } }` (201) | ✅ |
| `DELETE` | `/api/trainer/nutrition/{planId}` | trainer | — | `{ data: { message: string } }` | ✅ |

**`POST` request body** (Zod schema from `route.schema.ts` — no route.schema.ts exists for nutrition, this is extracted from the handler+type):
```typescript
{
  title: string,                    // required, min 1
  calories?: number | null,         // z.coerce.number().int()
  protein?: number | null,
  carbs?: number | null,
  fats?: number | null,
  mealNotes?: string | null,
  habitNotes?: string | null,
  foodsToEat?: string | null,
  foodsToAvoid?: string | null,
  mealTiming?: string | null,
  hydration?: string | null,
  supplements?: string | null,
  isActive?: boolean,               // z.coerce.boolean()
  programId?: string | null,
}
```

**Behavior**: Single-plan enforcement via `upsertNutritionPlan()`. Finds existing `TrainerNutritionPlan` for `(trainerId, clientId)` with `deletedAt: null` and UPDATEs it, or CREATEs a new one.

### 1.2 Client-Facing Habit Endpoints

| Method | Path | Auth | Request | Response Envelope |
|--------|------|------|---------|-------------------|
| `GET` | `/api/client/habits` | client | — | `{ data: { habits: DailyHabit[] } }` |
| `POST` | `/api/client/habits` | client | `{ title: string, description?: string \| null, frequency?: "DAILY" \| "WEEKLY" }` | `{ data: { habit: DailyHabit } }` |
| `POST` | `/api/client/habits/{habitId}/log` | client | `{ date: string, isCompleted: boolean, note?: string \| null }` | `{ data: { log: HabitLog } }` (201) |

**`GET /api/client/habits` response schema** (from `route.schema.ts`):
```typescript
const HabitsResponseSchema = z.object({
  data: z.object({
    habits: z.array(z.object({
      id: z.string(),
      clientId: z.string(),
      trainerId: z.string(),
      title: z.string(),
      description: z.string().nullable(),
      frequency: z.enum(["DAILY", "WEEKLY"]),
      isActive: z.boolean(),
      logs: z.array(z.object({
        id: z.string(),
        habitId: z.string(),
        clientId: z.string(),
        date: z.string(),          // YYYY-MM-DD string
        isCompleted: z.boolean(),
        note: z.string().nullable(),
        createdAt: z.string(),
        updatedAt: z.string(),
      })),
      createdAt: z.string(),
      updatedAt: z.string(),
      deletedAt: z.string().nullable(),
    })),
  }),
});
```

**`POST /api/client/habits/{habitId}/log` schema** (from `route.schema.ts`):
```typescript
const logSchema = z.object({
  date: z.string(),                 // "2026-06-19" format
  isCompleted: z.boolean(),
  note: z.string().nullable().optional(),
});

const LogResponseSchema = z.object({
  data: z.object({
    log: z.object({
      id: z.string(),
      habitId: z.string(),
      clientId: z.string(),
      date: z.string(),             // YYYY-MM-DD string
      isCompleted: z.boolean(),
      note: z.string().nullable(),
      createdAt: z.string(),
      updatedAt: z.string(),
    }),
  }),
});
```

### 1.3 Trainer-Facing Habit Endpoints

| Method | Path | Auth | Request | Response |
|--------|------|------|---------|----------|
| `GET` | `/api/trainer/clients/{clientId}/habits` | trainer, client | — | `{ data: { habits: DailyHabit[] } }` |
| `POST` | `/api/trainer/clients/{clientId}/habits` | trainer | `{ title: string, description?: string \| null, frequency?: "DAILY" \| "WEEKLY" }` | `{ data: { habit: DailyHabit } }` (201) |
| `PUT` | `/api/trainer/clients/{clientId}/habits/{habitId}` | trainer | `{ title?: string, description?: string \| null, frequency?: "DAILY" \| "WEEKLY", isActive?: boolean }` | `{ data: { habit: DailyHabit } }` |
| `DELETE` | `/api/trainer/clients/{clientId}/habits/{habitId}` | trainer | — | `{ data: { message: string } }` |
| `POST` | `/api/trainer/clients/{clientId}/habits/{habitId}/log` | trainer, client | `{ date: string, isCompleted: boolean, note?: string \| null }` | `{ data: { log: HabitLog } }` |

### 1.4 Recipe Endpoints (Trainer-only — No Client Access)

| Method | Path | Auth | Request | Response |
|--------|------|------|---------|----------|
| `GET` | `/api/trainer/recipes` | trainer | — | `{ data: { recipes: Recipe[] } }` |
| `POST` | `/api/trainer/recipes` | trainer | `CreateRecipeInput` (name, description?, instructions?, macros, difficulty?, times, isPublished?, tags[], products[]) | `{ data: { recipe: Recipe } }` (201) |
| `GET` | `/api/trainer/recipes/{id}` | trainer | — | `{ data: { recipe: Recipe } }` |
| `PUT` | `/api/trainer/recipes/{id}` | trainer | Partial `UpdateRecipeInput` | `{ data: { recipe: Recipe } }` |
| `DELETE` | `/api/trainer/recipes/{id}` | trainer | — | `{ data: { message: string } }` |

**Note**: Recipes have NO client-facing endpoints. There are no Flutter or iOS client-facing recipe screens. Recipes are exclusively trainer-side management.

---

## 2. Prisma Data Models

### `TrainerNutritionPlan` (lines 1211–1244)

```
model TrainerNutritionPlan {
  id          String          @id @default(cuid())
  trainerId   String          @db.Uuid
  trainer     User            @relation(fields: [trainerId], references: [id], onDelete: Cascade)
  clientId    String
  client      Client          @relation(fields: [clientId], references: [id], onDelete: Cascade)
  programId   String?
  program     WorkoutProgram? @relation(fields: [programId], references: [id], onDelete: SetNull)

  title        String
  calories     Int?
  protein      Int?
  carbs        Int?
  fats         Int?
  mealNotes    String?   @db.Text
  habitNotes   String?   @db.Text
  foodsToEat   String?   @db.Text
  foodsToAvoid String?   @db.Text
  mealTiming   String?
  hydration    String?
  supplements  String?   @db.Text
  isActive     Boolean   @default(false)

  createdAt DateTime  @default(now())
  updatedAt DateTime  @updatedAt
  deletedAt DateTime?

  @@index([clientId])
  @@index([trainerId])
  @@index([programId])
  @@index([isActive])
  @@index([createdAt])
  @@index([updatedAt])
}
```

### `DailyHabit` (lines 1253–1273)

```
enum HabitFrequency {
  DAILY
  WEEKLY
}

model DailyHabit {
  id          String         @id @default(cuid())
  clientId    String
  client      Client         @relation(fields: [clientId], references: [id], onDelete: Cascade)
  trainerId   String         @db.Uuid
  trainer     User           @relation(fields: [trainerId], references: [id], onDelete: Cascade)
  title       String
  description String?        @db.Text
  frequency   HabitFrequency @default(DAILY)
  isActive    Boolean        @default(true)

  logs HabitLog[]

  createdAt DateTime  @default(now())
  updatedAt DateTime  @updatedAt
  deletedAt DateTime?

  @@index([clientId])
  @@index([trainerId])
  @@index([isActive])
}
```

### `HabitLog` (lines 1275–1291)

```
model HabitLog {
  id          String     @id @default(cuid())
  habitId     String
  habit       DailyHabit @relation(fields: [habitId], references: [id], onDelete: Cascade)
  clientId    String
  client      Client     @relation(fields: [clientId], references: [id], onDelete: Cascade)
  date        DateTime   @db.Date
  isCompleted Boolean    @default(false)
  note        String?    @db.Text

  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt

  @@unique([habitId, clientId, date])
  @@index([clientId])
  @@index([date])
}
```

### `Recipe` (lines 1160–1185)

```
model Recipe {
  id           String    @id @default(cuid())
  trainerId    String    @db.Uuid
  trainer      User      @relation(fields: [trainerId], references: [id], onDelete: Cascade)
  name         String
  description  String?   @db.Text
  instructions String?   @db.Text
  proteinG     Float?
  carbsG       Float?
  fatG         Float?
  calories     Int?
  difficulty   String?   // easy, medium, hard
  prepTime     Int?      // minutes
  cookTime     Int?      // minutes
  isPublished  Boolean   @default(false)

  tags     RecipeTag[]
  products Product[]

  createdAt DateTime  @default(now())
  updatedAt DateTime  @updatedAt
  deletedAt DateTime?

  @@index([trainerId])
  @@index([createdAt])
}
```

### `RecipeTag` (lines 1187–1195)

```
model RecipeTag {
  id       String @id @default(cuid())
  recipeId String
  recipe   Recipe @relation(fields: [recipeId], references: [id], onDelete: Cascade)
  name     String

  @@index([recipeId])
  @@index([name])
}
```

### `Product` (lines 1197–1207)

```
model Product {
  id            String  @id @default(cuid())
  recipeId      String
  recipe        Recipe  @relation(fields: [recipeId], references: [id], onDelete: Cascade)
  name          String
  brand         String?
  amount        String?
  isRecommended Boolean @default(false)

  @@index([recipeId])
}
```

---

## 3. Shared Types (TypeScript)

### `src/lib/types/nutrition.ts` (42 lines)

```typescript
export interface TrainerNutritionPlan {
  id: string;
  trainerId: string;
  clientId: string;
  programId?: string | null;
  title: string;
  calories?: number | null;
  protein?: number | null;
  carbs?: number | null;
  fats?: number | null;
  mealNotes?: string | null;
  habitNotes?: string | null;
  foodsToEat?: string | null;
  foodsToAvoid?: string | null;
  mealTiming?: string | null;
  hydration?: string | null;
  supplements?: string | null;
  isActive: boolean;
  createdAt: Date;
  updatedAt: Date;
  deletedAt?: Date | null;
}

export interface CreateNutritionPlanInput {
  title: string;
  calories?: number | null;
  protein?: number | null;
  carbs?: number | null;
  fats?: number | null;
  mealNotes?: string | null;
  habitNotes?: string | null;
  foodsToEat?: string | null;
  foodsToAvoid?: string | null;
  mealTiming?: string | null;
  hydration?: string | null;
  supplements?: string | null;
  isActive?: boolean;
  programId?: string | null;
}

export interface UpdateNutritionPlanInput extends Partial<CreateNutritionPlanInput> {}
```

### `src/lib/types/habits.ts` (37 lines)

```typescript
export interface DailyHabit {
  id: string;
  clientId: string;
  trainerId: string;
  title: string;
  description?: string | null;
  frequency: HabitFrequency;    // "DAILY" | "WEEKLY"
  isActive: boolean;
  logs: HabitLog[];
  createdAt: Date;
  updatedAt: Date;
  deletedAt?: Date | null;
}

export interface HabitLog {
  id: string;
  habitId: string;
  clientId: string;
  date: string;                 // YYYY-MM-DD string (NOT a Date object)
  isCompleted: boolean;
  note?: string | null;
  createdAt: Date;
  updatedAt: Date;
}

export interface CreateDailyHabitInput {
  title: string;
  description?: string | null;
  frequency?: HabitFrequency;
}

export interface UpdateDailyHabitInput {
  title?: string;
  description?: string | null;
  frequency?: HabitFrequency;
  isActive?: boolean;
}
```

### `src/lib/types/recipe.ts` (53 lines)

```typescript
export interface Recipe {
  id: string;
  trainerId: string;
  name: string;
  description?: string | null;
  instructions?: string | null;
  proteinG?: number | null;     // Float
  carbsG?: number | null;       // Float
  fatG?: number | null;         // Float
  calories?: number | null;     // Int
  difficulty?: string | null;
  prepTime?: number | null;
  cookTime?: number | null;
  isPublished: boolean;
  tags: RecipeTag[];
  products: Product[];
  createdAt: Date;
  updatedAt: Date;
  deletedAt?: Date | null;
}

export interface RecipeTag {
  id: string;
  name: string;
}

export interface Product {
  id: string;
  name: string;
  brand?: string | null;
  amount?: string | null;
  isRecommended: boolean;
}
```

---

## 4. Service Layer

### `nutritionService.ts` (111 lines)

| Function | Description |
|----------|-------------|
| `getClientNutritionPlanByUserId(userId)` | Finds client by userId, returns latest plan via `findFirst` ordered by `createdAt: "desc"` |
| `getClientNutritionPlan(trainerId, clientId)` | Verifies trainer owns client, returns latest plan |
| `upsertNutritionPlan(trainerId, clientId, data)` | Finds existing plan for `(trainerId, clientId, deletedAt: null)`. If found: UPDATE. If not: CREATE. Sets `trainerId` and `trainer` relation. |
| `deleteNutritionPlan(planId, trainerId)` | Soft-delete by setting `deletedAt: new Date()`, verifies ownership |

### `habitService.ts` (165 lines)

| Function | Description |
|----------|-------------|
| `getClientHabits(trainerId, clientId)` | Trainer view: all habits (active + inactive), includes logs |
| `getClientActiveHabitsByUserId(userId)` | Client view: active only (`isActive: true`, `deletedAt: null`), includes logs |
| `getClientActiveHabits(clientId)` | Raw query: active + non-deleted habits |
| `createHabit(trainerId, data)` | Creates with `trainerId`, `clientId`. Default frequency "DAILY" |
| `updateHabit(habitId, trainerId, data)` | Partial update with ownership check |
| `deleteHabit(habitId, trainerId)` | Soft delete |
| `logHabitCompletion(habitId, clientId, date, isCompleted, note?)` | **Upsert** via `prisma.habitLog.upsert` on `@@unique([habitId, clientId, date])` |
| `getHabitLogs(habitId, clientId, fromDate, toDate)` | Date-range log query |

### `recipeService.ts` (79 lines)

| Function | Description |
|----------|-------------|
| `getRecipes(trainerId)` | All non-deleted recipes with `include: { tags: true, products: true }` |
| `getRecipeById(id, trainerId)` | Single recipe with ownership check |
| `createRecipe(trainerId, data)` | Nested create with tags and products |
| `updateRecipe(id, trainerId, data)` | Transactional: `deleteMany` all tags+products, then recreate |
| `deleteRecipe(id, trainerId)` | Soft delete |

**Test coverage**: nutritionService 355 lines, habitService 475 lines, recipeService 312 lines.

---

## 5. Sync Coverage

**Nutrition/habit/recipe features have NO sync table entries.** The 17 sync tables are:

```
clients, profiles, workout_sessions, exercises, workout_templates,
client_assessments, client_measurements, client_photos, client_exercise_logs,
trainer_services, trainer_packages, trainer_testimonials, trainer_programs,
notifications, bookings, trainer_profiles, calendar_events
```

**Impact**: Nutrition plans, daily habits, habit logs, recipes, products, and recipe tags are **network-only**. There is no offline queue or local-first sync for these entities. The Flutter `NutritionHabitsRepository` uses `ResponseCache` (SharedPreferences) for basic offline reading, but there's no write-back queue.

---

## 6. Flutter Implementation (Client)

### 6.1 Architecture Diagram

```
┌─────────────────────────────────────────────────────────────────────┐
│  HOME DASHBOARD                                                     │
│  ┌──────────────────────────────────────────────────────────────┐   │
│  │ _NutritionHabitsCard                                         │   │
│  │ (green circle, "NUTRITION & HABITS", "View Nutrition Plan   │   │
│  │  & Habits", chevron → push /nutrition-habits)                │   │
│  └──────────────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────────────┘
                              │ push
                              ▼
┌─────────────────────────────────────────────────────────────────────┐
│  ROUTER: /nutrition-habits                                          │
│  SlideTransition (Offset(0,1) → Offset.zero, easeOutCubic)         │
│  BlocProvider(create: getIt<NutritionHabitsCubit>)                  │
└─────────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────────┐
│  NutritionHabitsScreen (626 lines)                                  │
│  ┌──────────────────────────────────────────────────────────────┐   │
│  │ AppBar: "Nutrition & Habits", arrow_back                     │   │
│  ├──────────────────────────────────────────────────────────────┤   │
│  │ BlocBuilder<NutritionHabitsCubit, NutritionHabitsState>      │   │
│  │                                                              │   │
│  │ ┌────────────────────────────────────────────────────────┐   │   │
│  │ │ NutritionHabitsInitial / NutritionHabitsLoading        │   │   │
│  │ │ → Center(CircularProgressIndicator)                     │   │   │
│  │ ├────────────────────────────────────────────────────────┤   │   │
│  │ │ NutritionHabitsLoaded(plan?, habits)                   │   │   │
│  │ │ → RefreshIndicator                                     │   │   │
│  │ │   └─ ListView                                          │   │   │
│  │ │      ├─ _NutritionPlanCard (if plan != null)           │   │   │
│  │ │      │   ├─ Title + "Active" badge                     │   │   │
│  │ │      │   ├─ "Daily Targets" header                     │   │   │
│  │ │      │   ├─ _MacroBar × 4 (Cal #007aff, Pro #22C55E,  │   │   │
│  │ │      │   │             Carbs #F59E0B, Fats #EF4444)   │   │   │
│  │ │      │   ├─ _SectionBlock × 7 (optional):             │   │   │
│  │ │      │   │   Meal Notes, Foods to Eat, Foods to Avoid,│   │   │
│  │ │      │   │   Meal Timing, Hydration, Supplements,     │   │   │
│  │ │      │   │   Habit Notes                              │   │   │
│  │ │      │   └─ (end)                                     │   │   │
│  │ │      ├─ _NoPlanCard (if plan == null)                 │   │   │
│  │ │      └─ _HabitsSection                                │   │   │
│  │ │          ├─ "Today's Habits" + count badge            │   │   │
│  │ │          ├─ _HabitRow × N                             │   │   │
│  │ │          │   ├─ Circle checkbox (green/dim)          │   │   │
│  │ │          │   ├─ Title (strikethrough if done)         │   │   │
│  │ │          │   ├─ Description (optional)                │   │   │
│  │ │          │   └─ Frequency badge (pill)                │   │   │
│  │ │          └─ Empty state: "No habits assigned yet."   │   │   │
│  │ ├────────────────────────────────────────────────────────┤   │   │
│  │ │ NutritionHabitsError(message)                          │   │   │
│  │ │ → _ErrorView(icon, message, Retry button)              │   │   │
│  │ └────────────────────────────────────────────────────────┘   │   │
│  └──────────────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────────────┘
```

### 6.2 Cubit — `NutritionHabitsCubit` (99 lines)

```dart
@injectable
class NutritionHabitsCubit extends Cubit<NutritionHabitsState> {
  final NutritionHabitsRepository _repository;

  // Loads plan + habits in parallel
  Future<void> loadData() async {
    emit(const NutritionHabitsState.loading());
    try {
      final results = await Future.wait([
        _repository.getNutritionPlan(),
        _repository.getHabits(),
      ]);
      emit(NutritionHabitsState.loaded(plan: results[0], habits: results[1]));
    } catch (e) {
      emit(const NutritionHabitsState.error('Failed to load data.'));
    }
  }

  // Optimistic toggle with rollback
  Future<void> toggleHabit(String habitId, bool isCompleted) async {
    // 1. Snapshot current state
    // 2. Optimistically update local habits list
    // 3. Emit optimistic state
    // 4. Call API
    // 5. On success: update with server response + invalidate cache
    // 6. On failure: rollback to snapshot
  }

  Future<void> refresh() => loadData();
}
```

### 6.3 State — `NutritionHabitsState` (21 lines)

```dart
@freezed
sealed class NutritionHabitsState with _$NutritionHabitsState {
  const factory NutritionHabitsState.initial() = NutritionHabitsInitial;
  const factory NutritionHabitsState.loading() = NutritionHabitsLoading;
  const factory NutritionHabitsState.loaded({
    NutritionPlanDto? plan,
    required List<DailyHabitDto> habits,
  }) = NutritionHabitsLoaded;
  const factory NutritionHabitsState.error(String message) = NutritionHabitsError;
}
```

### 6.4 API Service — `NutritionHabitsApiService` (49 lines)

| Method | Endpoint | Response |
|--------|----------|----------|
| `getNutritionPlan()` | `GET /api/client/nutrition` | `NutritionPlanDto?` |
| `getHabits()` | `GET /api/client/habits` | `List<DailyHabitDto>` |
| `logHabit(habitId, date, isCompleted, note?)` | `POST /api/client/habits/{habitId}/log` | `HabitLogDto` |

### 6.5 Repository — `NutritionHabitsRepository` (93 lines)

Uses `ResponseCache` (SharedPreferences-backed) for cache-first pattern:
- `getNutritionPlan(forceRefresh: false)` — cached or network
- `getHabits(forceRefresh: false)` — cached or network
- `logHabit()` — delegates to API
- `invalidateCache()` — clears both cache keys

### 6.6 DTO Models

#### `NutritionPlanDto` (35 lines)
```dart
@freezed
abstract class NutritionPlanDto with _$NutritionPlanDto {
  const factory NutritionPlanDto({
    required String id,
    required String trainerId,
    required String clientId,
    String? programId,
    required String title,
    int? calories, int? protein, int? carbs, int? fats,
    String? mealNotes, String? habitNotes,
    String? foodsToEat, String? foodsToAvoid,
    String? mealTiming, String? hydration, String? supplements,
    @Default(false) bool isActive,
    required DateTime createdAt, required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _NutritionPlanDto;
  factory NutritionPlanDto.fromJson(Map<String, dynamic> json) => ...
}
```

#### `DailyHabitDto` (28 lines)
```dart
@freezed
abstract class DailyHabitDto with _$DailyHabitDto {
  const factory DailyHabitDto({
    required String id,
    required String clientId,
    required String trainerId,
    required String title,
    String? description,
    required String frequency,         // "DAILY" | "WEEKLY"
    @Default(true) bool isActive,
    @Default(<HabitLogDto>[]) List<HabitLogDto> logs,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _DailyHabitDto;
  factory DailyHabitDto.fromJson(Map<String, dynamic> json) => ...
}
```

#### `HabitLogDto` (23 lines)
```dart
@freezed
abstract class HabitLogDto with _$HabitLogDto {
  const factory HabitLogDto({
    required String id,
    required String habitId,
    required String clientId,
    required DateTime date,         // ⚠️ See type mismatch risk below
    required bool isCompleted,
    String? note,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _HabitLogDto;
  factory HabitLogDto.fromJson(Map<String, dynamic> json) => ...
}
```

### 6.7 DI Registration

```dart
// Injection order:
gh.factory<NutritionHabitsApiService>(
  () => NutritionHabitsApiService(gh<Dio>()),
);
gh.singleton<NutritionHabitsRepository>(
  () => NutritionHabitsRepository(
    gh<NutritionHabitsApiService>(),
    gh<ResponseCache>(),
  ),
);
gh.factory<NutritionHabitsCubit>(
  () => NutritionHabitsCubit(gh<NutritionHabitsRepository>()),
);
```

---

## 7. Flutter Implementation (Trainer)

### 7.1 Trainer Nutrition Detail Screen (1091 lines)

Full-screen view equivalent to iOS `NutritionDetailView`:

| Section | Widget | Lines |
|---------|--------|-------|
| Data loading | Parallel plan + habits fetch | ~50 |
| Plan header | Title + Active badge + trainer name | ~60 |
| Macro bars | 2-column grid (Cal/Pro row, Carbs/Fats row) | ~100 |
| Section blocks | Meal Notes, Foods, Timing, Hydration, Supps | ~150 |
| Habits header | "Add" button + date picker | ~80 |
| Habit list | Per-date toggle, swipe-to-edit/delete | ~200 |
| Habit form sheet | Title, description, frequency, Save/Cancel | ~80 |
| Empty state | "No Nutrition Plan" + Create CTA | ~60 |
| Delete plan | Confirmation dialog | ~40 |
| Error/loading | Shared error/loading states | ~40 |

### 7.2 Trainer Nutrition Plan Editor Sheet (220 lines)

Bottom sheet with all plan fields matching iOS `NutritionFormView`:
- Title (required), macros (4), section blocks (7), Active toggle, Delete

### 7.3 Trainer Cubits

| Cubit | Methods | Lines |
|-------|---------|-------|
| `TrainerClientNutritionCubit` | `loadPlan()`, `upsertPlan()` | 44 |
| `TrainerClientHabitsCubit` | `loadHabits()`, `createHabit()`, `updateHabit()`, `deleteHabit()` | 75 |

### 7.4 Trainer API Service

From `TrainerClientsApiService` (nutrition/habits section):

| Method | Endpoint | Auth |
|--------|----------|------|
| `getClientNutrition(clientId)` | `GET /api/trainer/clients/{id}/nutrition` | trainer/client |
| `upsertNutritionPlan(clientId, request)` | `POST /api/trainer/clients/{id}/nutrition` | trainer |
| `deleteNutritionPlan(planId)` | `DELETE /api/trainer/nutrition/{planId}` | trainer |
| `getClientHabits(clientId)` | `GET /api/trainer/clients/{id}/habits` | trainer/client |
| `createHabit(clientId, request)` | `POST /api/trainer/clients/{id}/habits` | trainer |
| `updateHabit(clientId, habitId, request)` | `PUT /api/trainer/clients/{id}/habits/{habitId}` | trainer |
| `deleteHabit(clientId, habitId)` | `DELETE /api/trainer/clients/{id}/habits/{habitId}` | trainer |
| `logHabit(clientId, habitId, request)` | `POST /api/trainer/clients/{id}/habits/{habitId}/log` | trainer/client |

### 7.5 Trainer DTO Models

| Model | Fields | Lines |
|-------|--------|-------|
| `TrainerNutritionPlanDto` | id, title, programId?, macros?, 7 section fields?, isActive, createdAt | 29 |
| `TrainerHabitDto` | id, clientId, trainerId, title, description?, frequency, isActive, logs, timestamps | 26 |
| `TrainerHabitLogDto` | id, habitId, clientId, date (String), isCompleted, note? | 19 |
| `UpsertNutritionPlanRequestDto` | title, macros?, 7 sections?, isActive?, programId? | 28 |
| `CreateHabitRequestDto` | title, description?, frequency (default 'DAILY') | 16 |
| `UpdateHabitRequestDto` | title?, description?, frequency?, isActive? | 17 |
| `LogHabitRequestDto` | date, isCompleted, note? | 16 |

---

## 8. iOS Implementation

### 8.1 File Inventory

| File | Lines | Purpose |
|------|-------|---------|
| `Models/NutritionModels.swift` | 106 | All data structs (plan, habit, log, request/response wrappers) |
| `Services/API/APIService+Nutrition.swift` | 114 | 8 API methods for nutrition + habits |
| `Services/APIService.swift` | 922 | Base API infrastructure (singleton, auth, refresh) |
| `ViewModels/Trainer/ClientDetailViewModel.swift` | 271 | Trainer-side VM: LoadingState nutrition+habits |
| `Views/Trainer/NutritionDetailView.swift` | 322 | Full nutrition plan + habits view |
| `Views/Trainer/NutritionFormView.swift` | 183 | Create/edit nutrition plan form |
| `Views/Trainer/ClientDetailView.swift` | 413 | 5-tab client detail (Overview/Program/Nutrition/Habits/Log) |
| `Views/Trainer/ClientDetailNutritionTab.swift` | 159 | Nutrition tab for trainer client detail |
| `Views/Trainer/ClientDetailHabitsTab.swift` | 123 | Habits tab for trainer client detail |
| `Views/Trainer/ClientDetailTabContent.swift` | 270 | Tab content router (has duplicate NutritionContent+HabitsContent) |
| `Views/Trainer/HabitFormSheet.swift` | 49 | Shared habit add/edit sheet |
| `Views/Components/TodayHabitsCard.swift` | 165 | Client home habits card |
| `Views/Components/HabitCheckRow.swift` | 69 | Reusable habit row with optimistic toggle |
| `Views/Components/HabitCompliancePill.swift` | 50 | 7-day bar chart component |
| `Views/Components/CoachDashboardWidget.swift` | 251 | Tri-tab home widget (Plan/Nutrition/Check-in) |
| `Views/Components/SectionCard.swift` | 32 | Reusable section container |
| `Views/Components/ErrorRetryView.swift` | 38 | Standard error state |
| `Views/ZiroMe/PersonalHomeView.swift` | 889 | Client home: integrates all widgets |
| `Utilities/LoadingState.swift` | 42 | Generic LoadingState<T> enum |

### 8.2 iOS UI Component Hierarchy (Client)

```
PersonalHomeView
├── CoachDashboardWidget(plan:)
│   ├── Tab 0: Plan (active program)
│   ├── Tab 1: Nutrition (plan title + macro badges + "View Nutrition")
│   └── Tab 2: Check-in
├── TodayHabitsCard(clientId:, refreshID:)
│   ├── Date picker (today togglable, past read-only)
│   ├── HabitCheckRow × N
│   │   ├── Circle checkbox (optimistic toggle)
│   │   ├── Title + strikethrough + description
│   │   └── Frequency badge
│   └── Empty state: "No active habits"
└── Sheet → NutritionDetailView(isTrainer: false)
    ├── Title + Active badge (green pill)
    ├── Daily Targets (4 GeometryReader macro bars)
    │   ├── Calories (orange, max 3000)
    │   ├── Protein (blue, max 300g)
    │   ├── Carbs (green, max 400g)
    │   └── Fats (purple, max 100g)
    ├── SectionCard × 7 (conditional):
    │   Meal Notes, Foods to Eat, Foods to Avoid,
    │   Meal Timing, Hydration, Supplements, Habit Notes
    └── Habits section
        ├── Date picker
        ├── HabitCheckRow × N (client can toggle today only)
        └── "Back to Today" button
```

### 8.3 iOS UI Component Hierarchy (Trainer)

```
ClientDetailView
├── Tab 0: Overview (management buttons)
├── Tab 1: Program (active program)
├── Tab 2: Nutrition (NutritionContent)
│   ├── Empty: "No Nutrition Plan" + "Create Nutrition Plan" CTA
│   └── Loaded: macro bars + section cards
│       └── NavBar "Edit" → NutritionFormView
├── Tab 3: Habits (HabitsContent)
│   ├── "Habits" header + "Add" button
│   ├── Habit list
│   │   ├── Frequency icon
│   │   ├── Title + description
│   │   ├── HabitCompliancePill (7-day bar)
│   │   ├── Frequency badge
│   │   └── Swipe left=edit, swipe right=delete
│   └── Sheet → HabitFormSheet (add/edit)
└── Tab 4: Log
```

### 8.4 Key iOS Behaviors

1. **Optimistic toggle**: `HabitCheckRow` immediately flips checkbox, calls API, reverts on failure
2. **Past-date read-only**: If viewing date != today, checkboxes are disabled
3. **Date-keyed upsert**: `POST .../log` with habitId+clientId+date; backend upserts
4. **Compliance pill**: Computed from `habit.logs` array — no extra API call
5. **Client has NO dedicated VM**: Nutrition = `@State` in PersonalHomeView, habits = `@State` in TodayHabitsCard
6. **Trainer uses ClientDetailViewModel**: `@Observable` with `LoadingState<T>` pattern, parallel `async let` loading
7. **Per-date habit logging**: Trainer can view any date, log habits for past dates

### 8.5 iOS Color Scheme for Macro Bars

| Macro | iOS Color | Flutter Color |
|-------|-----------|---------------|
| Calories | Orange (`#FF9500`) | Primary (`#007aff`) |
| Protein | Blue (`#007AFF`) | Green (`#22C55E`) |
| Carbs | Green (`#34C759`) | Amber (`#F59E0B`) |
| Fats | Purple (`#AF52DE`) | Red (`#EF4444`) |

**Flutter color mismatch**: iOS uses Apple's semantic system colors. Flutter uses a completely different palette (primary blue for calories, green for protein, amber for carbs, red for fats).

---

## 9. Cross-Layer Model Comparison

### 9.1 NutritionPlan

| Field | Backend Prisma | Backend TS Type | iOS Struct | Flutter Client DTO | Flutter Trainer DTO | Match |
|-------|---------------|-----------------|------------|-------------------|--------------------|-------|
| id | `String` | `string` | `String` | `String` | `String` | ✅ |
| trainerId | `String` | `string` | `String?` | `String` | — | ⚠️ iOS optional vs Flutter required |
| clientId | `String` | `string` | `String?` | `String` | — | ⚠️ iOS optional vs Flutter required |
| programId | `String?` | `string \| null` | `String?` | `String?` | `String?` | ✅ |
| title | `String` | `string` | `String` | `String` | `String` | ✅ |
| calories | `Int?` | `number \| null` | `Int?` | `int?` | `int?` | ✅ |
| protein | `Int?` | `number \| null` | `Int?` | `int?` | `int?` | ✅ |
| carbs | `Int?` | `number \| null` | `Int?` | `int?` | `int?` | ✅ |
| fats | `Int?` | `number \| null` | `Int?` | `int?` | `int?` | ✅ |
| mealNotes | `String? (Text)` | `string \| null` | `String?` | `String?` | `String?` | ✅ |
| habitNotes | `String? (Text)` | `string \| null` | `String?` | `String?` | `String?` | ✅ |
| foodsToEat | `String? (Text)` | `string \| null` | `String?` | `String?` | `String?` | ✅ |
| foodsToAvoid | `String? (Text)` | `string \| null` | `String?` | `String?` | `String?` | ✅ |
| mealTiming | `String?` | `string \| null` | `String?` | `String?` | `String?` | ✅ |
| hydration | `String?` | `string \| null` | `String?` | `String?` | `String?` | ✅ |
| supplements | `String? (Text)` | `string \| null` | `String?` | `String?` | `String?` | ✅ |
| isActive | `Boolean @default(false)` | `boolean` | `Bool` | `bool` (default false) | `bool` | ✅ |
| createdAt | `DateTime` | `Date` | `Date?` | `DateTime` | `String (ISO)` | ⚠️ |
| updatedAt | `DateTime` | `Date` | `Date?` | `DateTime` | — | ⚠️ |
| deletedAt | `DateTime?` | `Date \| null` | — | `DateTime?` | — | ⚠️ |

### 9.2 DailyHabit

| Field | Backend Prisma | Backend TS Type | iOS Struct | Flutter Client DTO | Flutter Trainer DTO | Match |
|-------|---------------|-----------------|------------|-------------------|--------------------|-------|
| id | `String` | `string` | `String` | `String` | `String` | ✅ |
| clientId | `String` | `string` | `String?` | `String` | `String` | ⚠️ iOS optional |
| trainerId | `String` | `string` | `String?` | `String` | `String` | ⚠️ iOS optional |
| title | `String` | `string` | `String` | `String` | `String` | ✅ |
| description | `String? (Text)` | `string \| null` | `String?` | `String?` | `String?` | ✅ |
| frequency | `HabitFrequency enum` | `"DAILY" \| "WEEKLY"` | `String` | `String` | `String` | ✅ |
| isActive | `Boolean @default(true)` | `boolean` | `Bool` | `bool` (default true) | `bool` | ✅ |
| logs | `HabitLog[]` | `HabitLog[]` | `[HabitLogEntry]?` | `List<HabitLogDto>` (default []) | `List<TrainerHabitLogDto>` | ✅ |
| createdAt | `DateTime` | `Date` | `Date?` | `DateTime` | `DateTime` | ✅ |
| updatedAt | `DateTime` | `Date` | `Date?` | `DateTime` | `DateTime` | ✅ |
| deletedAt | `DateTime?` | `Date \| null` | — | `DateTime?` | `DateTime?` | ✅ |

### 9.3 HabitLog

| Field | Backend Prisma | Backend TS Type | iOS Struct | Flutter Client DTO | Flutter Trainer DTO | Match |
|-------|---------------|-----------------|------------|-------------------|--------------------|-------|
| id | `String` | `string` | `String` | `String` | `String` | ✅ |
| habitId | `String` | `string` | `String?` | `String` | `String` | ⚠️ iOS optional |
| clientId | `String` | `string` | `String?` | `String` | `String` | ⚠️ iOS optional |
| date | `DateTime @db.Date` | `string` (YYYY-MM-DD) | `String` (YYYY-MM-DD) | `DateTime` ⚠️ | `String` (trainer) | ❌ **Client DTO type mismatch** |
| isCompleted | `Boolean @default(false)` | `boolean` | `Bool` | `bool` | `bool` | ✅ |
| note | `String? (Text)` | `string \| null` | `String?` | `String?` | `String?` | ✅ |
| createdAt | `DateTime` | `Date` | `Date?` | `DateTime` | — | ✅ (client) |
| updatedAt | `DateTime` | `Date` | `Date?` | `DateTime` | — | ✅ (client) |

---

## 10. API Contract Mapping

### 10.1 Client API: Flutter `NutritionHabitsApiService` vs Backend

| Flutter Method | Backend Endpoint | Response Wrapper | Status |
|---------------|------------------|-----------------|--------|
| `getNutritionPlan()` | `GET /api/client/nutrition` | `response.data['data']['plan']` | ✅ |
| `getHabits()` | `GET /api/client/habits` | `response.data['data']['habits']` | ✅ |
| `logHabit(habitId, date, isCompleted, note?)` | `POST /api/client/habits/{habitId}/log` | `response.data['data']['log']` | ✅ |

**All client endpoints properly wired.** Response envelope unwrapping is correct.

### 10.2 Trainer API: Flutter `TrainerClientsApiService` vs Backend

| Flutter Method | Backend Endpoint | Status |
|---------------|------------------|--------|
| `getClientNutrition(clientId)` | `GET /api/trainer/clients/{id}/nutrition` | ✅ |
| `upsertNutritionPlan(clientId, request)` | `POST /api/trainer/clients/{id}/nutrition` | ✅ (was erroneously PUT, fixed to POST) |
| `deleteNutritionPlan(planId)` | `DELETE /api/trainer/nutrition/{planId}` | ✅ (was missing, now implemented) |
| `getClientHabits(clientId)` | `GET /api/trainer/clients/{id}/habits` | ✅ |
| `createHabit(clientId, request)` | `POST /api/trainer/clients/{id}/habits` | ✅ |
| `updateHabit(clientId, habitId, request)` | `PUT /api/trainer/clients/{id}/habits/{habitId}` | ✅ (was missing, now implemented) |
| `deleteHabit(clientId, habitId)` | `DELETE /api/trainer/clients/{id}/habits/{habitId}` | ✅ (was missing, now implemented) |
| `logHabit(clientId, habitId, request)` | `POST /api/trainer/clients/{id}/habits/{habitId}/log` | ✅ (was missing, now implemented) |

### 10.3 iOS API: `APIService+Nutrition.swift` vs Backend

| iOS Method | Backend Endpoint | Status |
|-----------|------------------|--------|
| `fetchNutritionPlan(clientId:)` | `GET /api/trainer/clients/{id}/nutrition` | ✅ |
| `saveNutritionPlan(clientId:plan:)` | `POST /api/trainer/clients/{id}/nutrition` | ✅ |
| `deleteNutritionPlan(planId:)` | `DELETE /api/trainer/nutrition/{planId}` | ✅ |
| `fetchHabits(clientId:)` | `GET /api/trainer/clients/{id}/habits` | ✅ |
| `createHabit(clientId:habit:)` | `POST /api/trainer/clients/{id}/habits` | ✅ |
| `updateHabit(clientId:habitId:habit:)` | `PUT /api/trainer/clients/{id}/habits/{habitId}` | ✅ |
| `deleteHabit(clientId:habitId:)` | `DELETE /api/trainer/clients/{id}/habits/{habitId}` | ✅ |
| `toggleHabit(clientId:habitId:date:isCompleted:note:)` | `POST /api/trainer/clients/{id}/habits/{habitId}/log` | ✅ |

---

## 11. UI Component Hierarchy Comparison

### iOS `NutritionDetailView` (322 lines) vs Flutter `NutritionHabitsScreen` (626 lines) vs Flutter `TrainerNutritionDetailScreen` (1091 lines)

| Component | iOS Detail | Flutter Client (habits) | Flutter Trainer (trainer) |
|-----------|-----------|------------------------|--------------------------|
| Title row | ✅ | ✅ | ✅ |
| Active badge | ✅ green pill | ✅ green pill | ✅ green pill |
| "Daily Targets" header | ✅ | ✅ | ✅ |
| Calories bar | ✅ GeometryReader, orange, max 3000 | ✅ LinearProgressIndicator, blue (#007aff), max 3000 | ✅ 2-col grid |
| Protein bar | ✅ GeometryReader, blue, max 300g | ✅ LinearProgressIndicator, green (#22C55E), max 300 | ✅ 2-col grid |
| Carbs bar | ✅ GeometryReader, green, max 400g | ✅ LinearProgressIndicator, amber (#F59E0B), max 400 | ✅ 2-col grid |
| Fats bar | ✅ GeometryReader, purple, max 100g | ✅ LinearProgressIndicator, red (#EF4444), max 100 | ✅ 2-col grid |
| Meal Notes | ✅ SectionCard | ✅ _SectionBlock | ✅ |
| Foods to Eat | ✅ SectionCard | ✅ _SectionBlock | ✅ |
| Foods to Avoid | ✅ SectionCard | ✅ _SectionBlock | ✅ |
| Meal Timing | ✅ | ✅ _SectionBlock | ✅ |
| Hydration | ✅ | ✅ _SectionBlock | ✅ |
| Supplements | ✅ | ✅ _SectionBlock | ✅ |
| Habit Notes | ✅ | ✅ _SectionBlock | ✅ |
| Habits section header | ✅ "Today's Habits" | ✅ "Today's Habits" + count badge | ✅ Date picker + "Add" |
| Habit row checkbox | ✅ Circle, green when done | ✅ Circle, green (#22C55E) when done | ✅ Circle |
| Strikethrough on done | ✅ | ✅ | ✅ |
| Frequency badge | ✅ | ✅ | ✅ |
| Habit description | ✅ | ✅ | ✅ |
| Per-date habit viewing | ✅ Date picker | ❌ **Not implemented** | ✅ Date picker |
| Past-date read-only | ✅ | ❌ **Not implemented** | ✅ |
| Swipe-to-edit habit | ✅ (left swipe) | ❌ **Not implemented** (client) | ✅ Dismissible |
| Swipe-to-delete habit | ✅ (right swipe) | ❌ **Not implemented** (client) | ✅ Dismissible |
| Add habit button | ✅ | ❌ **Not implemented** (client) | ✅ Bottom sheet |
| Edit habit sheet | ✅ HabitFormSheet | ❌ **Not implemented** (client) | ✅ Bottom sheet |
| Delete alert | ✅ Confirmation | ❌ **Not implemented** (client) | ✅ Confirmation |
| Empty habits state | ✅ "No habits assigned" | ✅ "No habits assigned yet." | ✅ |
| No plan state | ✅ Fork/knife + message | ✅ Restaurant icon + message | ✅ "Create Nutrition Plan" CTA |
| Edit plan button | ✅ NavBar "Edit" | ❌ **Not applicable** (client) | ✅ Editor sheet |
| Delete plan | ✅ Confirmation alert | ❌ **Not applicable** (client) | ✅ Confirmation |
| Error state | ✅ ErrorRetryView | ✅ _ErrorView with retry | ✅ |
| Loading state | ✅ ProgressView | ✅ CircularProgressIndicator | ✅ |

### Key Differences

| Item | iOS | Flutter Client | Flutter Trainer |
|------|-----|----------------|-----------------|
| Macro bar animation | `GeometryReader` + `RoundedRectangle` | `LinearProgressIndicator` | `LinearProgressIndicator` |
| Macro bar colors | System semantic (orange/blue/green/purple) | Custom (blue/green/amber/red) | Custom |
| Macro bar layout | 4 stacked rows | 4 stacked rows | 2×2 grid |
| Habits per-date selector | ✅ DatePicker | ❌ Missing | ✅ DatePicker |
| Past date read-only | ✅ | ❌ Missing | ✅ |
| Habit CRUD for client | ✅ (NutritionDetailView) | ❌ Missing | ✅ (TrainerNutritionDetailScreen) |
| Compliance chart | ✅ HabitCompliancePill | ❌ **Not implemented anywhere** | ❌ **Not implemented anywhere** |
| Home dashboard card | ✅ CoachDashboardWidget tri-tab | ✅ _NutritionHabitsCard | N/A |
| Section block style | `SectionCard` (rounded rect) | `_SectionBlock` (rounded rect) | Same as client |

---

## 12. Gap Analysis

### 12.1 Critical Gaps

| # | Gap | Location | Impact | Priority |
|---|-----|----------|--------|----------|
| 1 | **`HabitLogDto.date` typed as `DateTime` but backend returns date string** | `lib/.../habit_log_dto.dart:12` | May crash on deserialization when backend returns `"2026-06-19"` (no time component) | **HIGH** |
| 2 | **No per-date habit viewing on client** | `nutrition_habits_screen.dart` | Client cannot view past habit logs, only today's status | **MEDIUM** |
| 3 | **No habit compliance pill** (7-day bar chart) | Both Flutter versions | Missing visual indicator of habit adherence trend | **LOW** |
| 4 | **No client-side habit CRUD** | Client nutrition_habits | Client cannot add/edit/delete habits from the app (client can via `POST /api/client/habits`) | **LOW** |
| 5 | **Macro bar colors differ from iOS** | `nutrition_habits_screen.dart` | Visual inconsistency: iOS uses system semantic colors, Flutter uses custom palette | **LOW** |

### 12.2 Minor Gaps

| # | Gap | Location |
|---|-----|----------|
| 6 | No `Back to Today` button when viewing past habit dates | Both Flutter versions |
| 7 | No habit swipe actions on client side | `nutrition_habits_screen.dart` |
| 8 | `CoachDashboardWidget` tri-tab not ported to Flutter home | `home_screen.dart` uses simple card instead |
| 9 | `Note` field in `logHabit` not exposed in client UI | `toggleHabit()` doesn't accept note input |
| 10 | iOS `NutritionDetailView` uses `GeometryReader` for animated bars; Flutter uses static `LinearProgressIndicator` | Animation fidelity |
| 11 | iOS uses `SectionCard` (32 lines, reusable); Flutter uses inline `_SectionBlock` | Code reuse |
| 12 | `clientId`, `trainerId` are `String?` in iOS but `String` in Flutter | Nullability difference (both map correctly from backend) |
| 13 | `nutritionCompliance` field in check-in not wired | Check-in schema has it, Flutter doesn't use it |

---

## 13. Type Mismatch Risks

### 13.1 CRITICAL: `HabitLogDto.date` — Client DTO type mismatch

```dart
// Flutter client DTO (habit_log_dto.dart):
required DateTime date,

// Backend Zod schema (route.schema.ts):
date: z.string(),   // "2026-06-19" format

// Backend TypeScript type (habits.ts):
date: string;       // YYYY-MM-DD string

// Backend Prisma:
date DateTime @db.Date   // Date only, no time component

// iOS struct:
let date: String         // YYYY-MM-DD string
```

**Problem**: The backend `HabitLog.date` is stored as `@db.Date` (date-only) in PostgreSQL. It is transmitted over the wire as a string `"2026-06-19"` (not ISO 8601 datetime). The Flutter client DTO declares it as `DateTime`, which expects ISO 8601 strings like `"2026-06-19T00:00:00.000"`. A bare date string will likely fail `DateTime.parse()`.

**Flutter trainer DTO** handles this correctly:
```dart
// Trainer habit_log_dto uses String for date:
required String date,
```

**Fix**: Change `HabitLogDto.date` from `DateTime` to `String` and add a convenience getter:
```dart
@freezed
abstract class HabitLogDto with _$HabitLogDto {
  const factory HabitLogDto({
    ...
    required String date,  // YYYY-MM-DD
    ...
  }) = _HabitLogDto;

  DateTime get dateTime => DateTime.parse(date);
}
```

### 13.2 MEDIUM: `NutritionPlanDto` field nullability for `trainerId` and `clientId`

The iOS struct marks `trainerId` and `clientId` as `String?` (optional). The backend always returns them as non-null strings (they're `@db.Uuid` and `String` in Prisma). Flutter marks them as `required String` which is correct — no mismatch risk, but the iOS optionality is overly conservative.

### 13.3 LOW: `createdAt`/`updatedAt` format

- iOS: `Date?` (optional — parsed from ISO string)
- Flutter client: `DateTime` (parsed from ISO string)
- Flutter trainer (NutritionPlan): `String (ISO)` — inconsistent with client
- Backend: `DateTime` (serialized as ISO 8601 string)

Trainer DTO uses `String` for `createdAt` instead of `DateTime`. This is inconsistent with the client DTO. Should be `DateTime`.

### 13.4 LOW: Trainer `HabitLogDto` missing `createdAt`/`updatedAt`

Backend always returns timestamps for habit logs. Trainer DTO doesn't have these fields. Not currently used in UI, but could matter for sync/ordering.

---

## 14. Appendix: File Inventory

### Backend (zirofit-next) — 33 files

| Path | Lines | Description |
|------|-------|-------------|
| `src/app/api/client/nutrition/route.ts` | 22 | GET client nutrition plan |
| `src/app/api/client/habits/route.ts` | 59 | GET/POST client habits |
| `src/app/api/client/habits/route.schema.ts` | 31 | Habits Zod schemas |
| `src/app/api/client/habits/route.test.ts` | 73 | Tests |
| `src/app/api/client/habits/[habitId]/log/route.ts` | 55 | POST habit log |
| `src/app/api/client/habits/[habitId]/log/route.schema.ts` | 38 | Log Zod schema |
| `src/app/api/trainer/nutrition/[planId]/route.ts` | 25 | DELETE nutrition plan |
| `src/app/api/trainer/clients/[id]/nutrition/route.ts` | 74 | GET/POST trainer nutrition |
| `src/app/api/trainer/clients/[id]/nutrition/route.test.ts` | 150 | Tests |
| `src/app/api/trainer/clients/[id]/habits/route.ts` | 63 | GET/POST trainer habits |
| `src/app/api/trainer/clients/[id]/habits/route.schema.ts` | 56 | Habits Zod schemas |
| `src/app/api/trainer/clients/[id]/habits/route.test.ts` | 154 | Tests |
| `src/app/api/trainer/clients/[id]/habits/[habitId]/route.ts` | 58 | PUT/DELETE single habit |
| `src/app/api/trainer/clients/[id]/habits/[habitId]/route.schema.ts` | 56 | Single habit Zod schemas |
| `src/app/api/trainer/clients/[id]/habits/[habitId]/log/route.ts` | 42 | POST trainer habit log |
| `src/app/api/trainer/recipes/route.ts` | 52 | GET/POST recipes |
| `src/app/api/trainer/recipes/route.schema.ts` | 89 | Recipe Zod schemas |
| `src/app/api/trainer/recipes/[id]/route.ts` | 105 | GET/PUT/DELETE single recipe |
| `src/app/api/trainer/recipes/[id]/route.schema.ts` | 104 | Single recipe Zod schemas |
| `prisma/schema.prisma` | 1447 | All Prisma models (nutrition: lines 1160–1291) |
| `src/lib/types/nutrition.ts` | 42 | Nutrition plan TS interfaces |
| `src/lib/types/habits.ts` | 37 | Habit TS interfaces |
| `src/lib/types/recipe.ts` | 53 | Recipe TS interfaces |
| `src/lib/types/index.ts` | — | Type re-exports |
| `src/lib/services/nutritionService.ts` | 111 | Nutrition plan service |
| `src/lib/services/nutritionService.test.ts` | 355 | Tests |
| `src/lib/services/habitService.ts` | 165 | Habit service (CRUD + log) |
| `src/lib/services/habitService.test.ts` | 475 | Tests |
| `src/lib/services/recipeService.ts` | 79 | Recipe service |
| `src/lib/services/recipeService.test.ts` | 312 | Tests |
| `src/lib/sync/utils.ts` | 126 | No nutrition in sync |
| `docs/ios-nutrition-habits-handoff.md` | 699 | iOS reference spec |

### Flutter Client (zf-fl) — 22 files

| Path | Lines | Description |
|------|-------|-------------|
| `lib/features/nutrition_habits/cubit/nutrition_habits_cubit.dart` | 99 | Cubit: parallel load, optimistic toggle |
| `lib/features/nutrition_habits/cubit/nutrition_habits_state.dart` | 21 | Sealed state (initial/loading/loaded/error) |
| `lib/features/nutrition_habits/cubit/nutrition_habits_state.freezed.dart` | 402 | Auto-generated |
| `lib/features/nutrition_habits/data/nutrition_habits_api_service.dart` | 49 | 3 API methods |
| `lib/features/nutrition_habits/data/nutrition_habits_repository.dart` | 93 | Cache-first repository |
| `lib/features/nutrition_habits/data/models/nutrition_plan_dto.dart` | 35 | NutritionPlan DTO |
| `lib/features/nutrition_habits/data/models/daily_habit_dto.dart` | 28 | DailyHabit DTO |
| `lib/features/nutrition_habits/data/models/habit_log_dto.dart` | 23 | HabitLog DTO |
| `lib/features/nutrition_habits/data/models/*.freezed.dart` | ~300 ea | Auto-generated |
| `lib/features/nutrition_habits/data/models/*.g.dart` | ~50 ea | Auto-generated |
| `lib/features/nutrition_habits/presentation/nutrition_habits_screen.dart` | 626 | Full screen: macros + sections + habits |
| `lib/features/home/presentation/home_screen.dart` | 481 | _NutritionHabitsCard (lines 340–408) |
| `lib/core/router/app_router.dart` | 1086 | Route /nutrition-habits (lines 885–907) |
| `lib/core/di/injection.config.dart` | — | DI: ApiService→Repository→Cubit |
| `lib/features/trainer/presentation/nutrition/trainer_nutrition_detail_screen.dart` | 1091 | Trainer full detail screen |
| `lib/features/trainer/presentation/clients/trainer_nutrition_plan_editor_sheet.dart` | 220 | Trainer plan editor |
| `lib/features/trainer/cubit/trainer_client_nutrition_cubit.dart` | 44 | Trainer nutrition cubit |
| `lib/features/trainer/cubit/trainer_client_habits_cubit.dart` | 75 | Trainer habits cubit |
| `lib/features/trainer/data/trainer_clients_api_service.dart` | ~240 | Trainer API (nutrition + habits methods) |
| `lib/features/trainer/data/models/trainer_nutrition_plan_dto.dart` | 29 | Trainer NutritionPlan DTO |
| `lib/features/trainer/data/models/trainer_habit_dto.dart` | 26 | Trainer Habit DTO |
| `lib/features/trainer/data/models/trainer_habit_log_dto.dart` | 19 | Trainer HabitLog DTO (uses `String` for date ✅) |
| `lib/features/trainer/data/models/create_habit_request_dto.dart` | 16 | Create request |
| `lib/features/trainer/data/models/update_habit_request_dto.dart` | 17 | Update request |
| `lib/features/trainer/data/models/log_habit_request_dto.dart` | 16 | Log request |
| `lib/features/trainer/data/models/upsert_nutrition_plan_request_dto.dart` | 28 | Upsert request |

### iOS (Ziro-Fit) — 18 Swift files + 4 markdown

| Path | Lines | Description |
|------|-------|-------------|
| `Models/NutritionModels.swift` | 106 | All structs (plan, habit, log, wrappers) |
| `Services/API/APIService+Nutrition.swift` | 114 | 8 API methods |
| `Services/APIService.swift` | 922 | Base API infrastructure |
| `ViewModels/Trainer/ClientDetailViewModel.swift` | 271 | Trainer VM: LoadingState pattern |
| `Views/Trainer/NutritionDetailView.swift` | 322 | Full nutrition + habits view |
| `Views/Trainer/NutritionFormView.swift` | 183 | Plan editor form |
| `Views/Trainer/ClientDetailView.swift` | 413 | 5-tab client detail |
| `Views/Trainer/ClientDetailNutritionTab.swift` | 159 | Nutrition tab |
| `Views/Trainer/ClientDetailHabitsTab.swift` | 123 | Habits tab |
| `Views/Trainer/ClientDetailTabContent.swift` | 270 | Tab router (duplicate content) |
| `Views/Trainer/HabitFormSheet.swift` | 49 | Shared habit form |
| `Views/Components/TodayHabitsCard.swift` | 165 | Client home habits |
| `Views/Components/HabitCheckRow.swift` | 69 | Reusable habit row |
| `Views/Components/HabitCompliancePill.swift` | 50 | 7-day compliance chart |
| `Views/Components/CoachDashboardWidget.swift` | 251 | Tri-tab home widget |
| `Views/Components/SectionCard.swift` | 32 | Reusable section |
| `Views/Components/ErrorRetryView.swift` | 38 | Error state |
| `Views/ZiroMe/PersonalHomeView.swift` | 889 | Client home screen |
| `Utilities/LoadingState.swift` | 42 | Generic loading enum |
| `ios-nutrition-habits-handoff.md` | 699 | iOS reference spec |
| `trainer-nutrition-habits-spec.md` | 187 | Original dev spec |
| `nutrition-habits-backend-checklist.md` | 102 | Backend checklist |
| `docs/user-guides/habit-system.md` | 311 | Internal habit docs |
