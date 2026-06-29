# Performance Overhaul — ZIRO.FIT Flutter App

## Architecture Decision: Option A — Tanquery SWR

Tanquery is already proven in Explore (7 screens, infinite queries, staleTime, automatic GC). It becomes the standard caching strategy.

---

## Research-Validated Assumptions (pre-implementation verification)

| # | Assumption | Verified? | Detail |
|---|---|---|---|
| 1 | Backend notifications supports pagination | **❌ FALSE** | `GET /api/notifications` hardcodes `take: 50`. No `page`/`pageSize`. Backend change needed for #7. |
| 2 | Drift date columns match wire format | **✅ TRUE** | All date columns are `IntColumn` (`integer()`). Wire delivers Unix ms ints. Direct `DateTime.fromMillisecondsSinceEpoch()`. |
| 3 | Sync wire uses snake_case keys | **✅ TRUE** | Backend `objectKeysToSnake()` converts before sending. Drift uses camelCase. #0 needs snake→camel conversion. |
| 4 | All 17 sync tables have Drift mappings | **✅ TRUE** | Every table listed in `SYNC_TABLES` has a corresponding Drift table with `syncStatus` column. |
| 5 | Retry-safe methods | **✅ DECIDED** | Retry: GET, PUT, DELETE. NEVER retry POST. Sharing = PUT → safe. |

---

## All Features — Caching Strategy Map

| Feature | Current | Phase 1 Strategy | Long-Term |
|---|---|---|---|
| **Explore** | Tanquery ✅ | Already done | — |
| **Home** | Fetch on init | → **Tanquery SWR** | Tanquery |
| **TrainerList** | Fetch on filter | → **Tanquery InfiniteQuery** | Tanquery |
| **TrainerDetail** | Fetch on navigate | → **Tanquery SWR** | Tanquery |
| **WorkoutHistory** | Cursor pagination | → **Tanquery InfiniteQuery** | Tanquery |
| **DailyTargets** | Fetch on navigate | CacheInterceptor (30s TTL) | → Future tanquery |
| **NutritionHabits** | Fetch on navigate | CacheInterceptor (30s TTL) | → Future tanquery |
| **Sharing** | Fetch on navigate | CacheInterceptor (30s TTL) | → Future tanquery |
| **Profile/More** | Fetch on navigate | CacheInterceptor (30s TTL) | → Future tanquery |
| **FitnessGoals** | Singleton skip | CacheInterceptor (30s TTL) | → Future tanquery |
| **CheckIn** | Config fetch once | CacheInterceptor (30s TTL) | → Future tanquery |
| **Analytics** | Drift-cache-first ✅ | Keep as-is | Keep Drift |
| **Notifications** | Realtime + fetch ✅ | Keep as-is | Keep realtime |
| **WorkoutSession** | Optimistic mutations ✅ | Keep as-is | Keep as-is |
| **Auth** | Token-based | CacheInterceptor (30s TTL) | CacheInterceptor |
| **Sync** | Background service | Keep as-is | Keep as-is |
| **Onboarding** | One-time | No caching needed | — |

**CacheInterceptor features**: Get Dio-level dedup + 30s TTL. No screen code changes.

---

## Tanquery Migration Template

### 1. Stateless Cubit
```dart
// BEFORE: Cubit with sealed states, emit(loading/loaded/error)
// AFTER: Thin wrapper returning Future<T> directly
@injectable
class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _repo;
  HomeCubit(this._repo) : super(HomeState._initial);
  Future<ClientDashboardResponse> fetchDashboard() => _repo.getDashboard();
  // Mutations (not cached by tanquery)
  Future<void> refresh() => fetchDashboard();
}
```

### 2. QueryBuilder in Screen
```dart
// BEFORE: BlocBuilder<HomeCubit, HomeState>(builder: ...)
// AFTER:
QueryBuilder<ClientDashboardResponse>(
  queryKey: QueryKey(['home', 'dashboard']),
  queryFn: () => context.read<HomeCubit>().fetchDashboard(),
  staleTime: const Duration(seconds: 30),
  builder: (context, state) {
    if (state.isLoading) return Spinner();
    if (state.data != null) return Dashboard(state.data!);
    if (state.error != null) return ErrorView(state.error.toString());
    return SizedBox();
  },
)
```

### 3. InfiniteQuery for Pagination
```dart
InfiniteQueryBuilder<TrainerListResponse, int>(
  queryKey: QueryKey(['trainers', 'search', query, sortBy]),
  queryFn: (page) => cubit.searchTrainers(page: page, ...),
  initialPage: 1,
  getNextPageKey: (last) => last.hasMore ? last.page + 1 : null,
  builder: (context, state) {
    final all = state.pages.expand((p) => p.trainers).toList();
    return ListView.builder(itemCount: all.length + ...);
  },
)
```

---

## Work Breakdown

### Phase 0 — Foundation (independent, Week 1)

#### #1 — Dio RetryInterceptor (GET + PUT + DELETE)

| | Detail |
|---|---|
| **Files** | Create `lib/core/network/retry_interceptor.dart`, edit `dio_client.dart` |
| **Behavior** | 2 retries, exponential backoff (1s → 2s), on 5xx/timeout/SocketException |
| **Retry methods** | GET, PUT, DELETE — NEVER POST |
| **Skip** | 401 (AuthInterceptor handles it), `Retry-After` header respected |
| **Logging** | `developer.log(name: 'retry')` |
| **Risk** | LOW |
| **Verify** | Kill backend mid-GET → retry fires. POST → no retry. PUT `/api/client/sharing` → retry fires. |

#### #4 — Event-Driven Refresh Throttling

| | Detail |
|---|---|
| **Files** | Add debounce wrapper in `home_cubit.dart` + `analytics_cubit.dart` consumers |
| **Behavior** | `CheckInSubmittedEvent` → debounce 500ms → only last emission fires |
| **Risk** | LOW |
| **Verify** | Fire event twice in 500ms → refresh fires once. |

---

### Phase 0.5 — Shared Infrastructure (Week 1-2)

#### #0 — Per-Table Sync Pull Processing

| | Detail |
|---|---|
| **Files** | Edit `lib/features/sync/data/sync_repository.dart` |
| **Current** | `_storePullResult()` saves ALL changes as single JSON blob → `SyncMetadata(key: 'last_pull_data')` |
| **Fix** | After pull, iterate each table's `{ created, updated, deleted }` chunks and write to Drift tables |
| **Key conversion** | Wire delivers **snake_case** keys (`client_id`, `start_time`). Must convert to **camelCase** (`clientId`, `startTime`) to match Drift column names. |
| **Date handling** | Wire delivers Unix ms integers. Drift columns are `IntColumn`. Write as int, read as `DateTime.fromMillisecondsSinceEpoch(int)`. No type converter needed. |
| **Deleted rows** | Soft-delete via `deletedAt` column — set to current timestamp, don't actually remove rows. |
| **syncStatus** | Set to `'synced'` after successful write. |
| **Scope** | All 17 tables via `SyncTables.all` iterator. |
| **Risk** | HIGH — first writes to Drift tables |
| **Verify** | (1) Run backend `npm run db:seed`, (2) Start Flutter app, (3) Trigger sync, (4) Query Drift tables directly → confirm rows with correct data. |

#### #2+#6 — Combined CacheInterceptor (DEDUP + TTL)

| | Detail |
|---|---|
| **Files** | Create `lib/core/network/cache_interceptor.dart`, edit `dio_client.dart` |
| **Dedup** | Same `METHOD+URL` in-flight within 100ms → share Future |
| **Cache** | Same `METHOD+URL` fetched within 30s → return cached `Response` |
| **Bypass** | POST bypasses both dedup and cache. PUT/DELETE bypass cache but still dedup. |
| **Bust** | On any mutation to `/api/client/*`, clear ALL cached entries under that namespace |
| **Memory** | 100 entries max, LRU eviction |
| **Logging** | `developer.log(name: 'cache')` on hit/miss |
| **Chain order** | `ApiLoggerInterceptor` → `CacheInterceptor` → `AuthInterceptor` → `RetryInterceptor` → Dio |
| **Covers** | DailyTargets, NutritionHabits, Sharing, Profile, FitnessGoals, CheckIn, Auth |
| **Risk** | MEDIUM |
| **Verify** | Same GET in 100ms → 1 network call, 2 responses. Same GET in 30s → 0 calls. POST → bypass. |

---

### Phase 1 — Tanquery Migration (Week 3-4)

#### #10a — Home → Tanquery SWR

| | Detail |
|---|---|
| **Files** | `home_cubit.dart`, `home_screen.dart`, home state file |
| **Cubit** | Remove sealed states. Return `Future<ClientDashboardResponse>` directly. |
| **Screen** | `BlocBuilder<HomeCubit, HomeState>` → `QueryBuilder<ClientDashboardResponse>` |
| **Config** | `staleTime: 30s`, `refetchOnMount: false` |
| **Pull-to-refresh** | Calls `queryClient.refetchQueries(QueryKey(['home']))` |
| **Event wiring** | CheckInSubmittedEvent → `queryClient.invalidateQueries(QueryKey(['home']))` |
| **Risk** | MEDIUM |
| **Verify** | Navigate home → instant from cache. Pull to refresh → refetches. Submit check-in → home updates without full-screen loading. |

#### #10b — TrainerList → Tanquery InfiniteQuery

| | Detail |
|---|---|
| **Files** | `trainer_list_cubit.dart`, `features/trainers/presentation/explore_screen.dart` |
| **Cubit** | Return `Future<TrainerListResponse>`. Keep mutation methods. |
| **Screen** | `InfiniteQueryBuilder` with filter-based query keys. |
| **Config** | `staleTime: 30s`, pagination via `getNextPageKey` |
| **Note** | Two trainer list screens exist — `TrainerListCubit` (trainers feature) is the main target. `TrainerDiscoveryCubit` (explore feature) is already thin. |
| **Risk** | LOW |
| **Verify** | Scroll → pages load seamlessly. Revisit with same filters → instant load. |

#### #10c — TrainerDetail → Tanquery SWR

| | Detail |
|---|---|
| **Files** | `trainer_detail_cubit.dart`, `trainer_detail_screen.dart` |
| **Config** | `staleTime: 120s` (profile data is relatively static) |
| **Risk** | LOW |
| **Verify** | Navigate → back → navigate again → instant from cache. |

#### #10d — WorkoutHistory → Tanquery InfiniteQuery

| | Detail |
|---|---|
| **Files** | `workout_history_cubit.dart`, `workout_history_screen.dart` |
| **Config** | Cursor-based pagination maps to `getNextPageKey` |
| **Risk** | LOW |
| **Verify** | History scrolls seamlessly, cached pages on back-navigate. |

---

### Phase 2 — Optimistic Updates (Week 4-5)

#### #8 — Optimistic Updates (standardize snapshot pattern)

```dart
final snapshot = state;                     // 1. Snapshot
emit(state.copyWith(/* optimistic */));     // 2. UI instantly
try {
  await repository.update(...);             // 3. API
  emit(state.copyWith(/* confirmed */));    // 4. Confirm
} catch (e) {
  emit(snapshot);                           // 5. Rollback
}
```

| Feature | File | Methods |
|---|---|---|
| DailyTargets | `daily_targets_cubit.dart` | `toggleComplete()`, `updateProgress()` |
| NutritionHabits | `nutrition_habits_cubit.dart` | `toggleHabit()` (currently reloads on error → change to snapshot rollback) |
| Sharing | `sharing_cubit.dart` | `toggleSetting()`, `updateDuration()` |

**Verify**: Toggle + kill network → reverts. Toggle + success → stays. Rapid toggling → no corruption.

---

### Phase 3 — Offline + Long-Term (Sprint 3+)

#### #9 — Offline Reads from Sync Tables

| | Detail |
|---|---|
| **Prerequisite** | #0 (per-table pull working, Drift tables populated) |
| **Approach** | Tanquery `queryFn` falls back to Drift when API is unreachable |
| **Pattern** | `try { return await api.fetch(); } catch (e) { if (online) rethrow; return drift.read(); }` |
| **Scope** | Home first, then TrainerDetail, then TrainerList |
| **Risk** | HIGH |
| **Verify** | Go offline → home shows last-synced data + "Offline" banner. Come back online → auto-refreshes. |

#### #7 — Notification Pagination

| | Detail |
|---|---|
| **Backend** | Add optional `page`/`pageSize` params to `GET /api/notifications` route + Zod schema |
| **Backend files** | `V:\zirofit-next\src\app\api\notifications\route.ts`, `route.schema.ts` |
| **Flutter** | Add `page`/`limit` to `NotificationApiService.fetchNotifications()`, update cubit with `hasMore` |
| **Realtime** | New notifications from Supabase insert at top (no pagination conflict with cursor-based pagination) |
| **Risk** | LOW-MED |
| **Verify** | User with 50+ notifs sees 20 at a time, loads more on scroll. |

#### Future: Remaining features → tanquery
DailyTargets, NutritionHabits, Sharing, Profile, FitnessGoals, CheckIn migrate screen-by-screen when touched for other work.

---

## Risk Register

| # | Item | Risk | Mitigation |
|---|---|---|---|
| #1 | Retry | POST retry = duplicate resources | Never retry POST. Retry GET/PUT/DELETE only. Assert in tests. |
| #2+#6 | CacheInterceptor | Stale data | 30s TTL + auto-bust on mutations. Manual bust API for cubits. |
| #0 | Per-table pull | Wrong data in Drift tables | Verify against seed data. Start with 5 core tables. |
| #10a-d | Tanquery migration | Screen loading state breaks | Do one feature at a time. Keep old files in git as rollback. |
| #8 | Optimistic rollback | State corrupt on failure | Snapshot pattern. Test rapid toggling. |
| #9 | Offline reads | Empty Drift tables = blank screen | Graceful empty state + "Connect to internet" prompt. |
| #7 | Notif pagination | Backend scope | Straightforward — add `page`/`pageSize` to route + schema. |

---

## Verification Protocol (every item)

```
□ dart analyze: zero errors on changed files
□ flutter test: all tests pass (existing + new)
□ Manual verify: run on emulator/device, scenario works
□ developer.log() used — no print() statements
□ API contract verified against live backend (client.ada@ziro.fit)
```
