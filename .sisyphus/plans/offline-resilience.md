# Offline Resilience — Implementation Plan

## Overview

Five-phase implementation to make ZIRO.FIT work gracefully without internet connectivity. Currently the app destroys auth tokens on network errors, can't authenticate offline, shows no connectivity feedback, has no data caching, and can't push local changes to the backend.

## Dependency Order

```
Phase 1 (fix auth token destruction)
  └── blocks → Phase 2 (local user cache)
                  ├── enables → Phase 3 (connectivity banner)
                  └── independent of → Phase 4 (stale-while-revalidate)
                                         └── independent of → Phase 5 (push sync)
```

**Execution order**: Phase 1 → Phase 2 → Phase 3 + Phase 4 (parallel) → Phase 5

---

## Phase 1: Fix Auth Token Destruction on Network Errors

**Files**: `lib/core/network/auth_interceptor.dart`, `lib/features/auth/data/auth_repository.dart`

### Problem

Both `AuthInterceptor.onError` (line 73) and `AuthRepository.getCurrentUser()` (line 118) call `clearTokens()` on **any** exception during token refresh, including `DioExceptionType.connectionError`, timeouts, and `SocketException`. This means a transient network glitch permanently logs the user out and destroys their tokens.

### Changes

#### 1a. `auth_interceptor.dart` — Lines 73-76

Replace generic `catch (_)` with error-type discrimination:

```dart
// Before:
} catch (_) {
  await _tokenStorage.clearTokens();
  handler.next(err);
}

// After:
} catch (e) {
  final isAuthRejection = e is DioException &&
      e.type == DioExceptionType.badResponse &&
      e.response?.statusCode == 401;
  
  if (isAuthRejection) {
    // Server explicitly rejected the refresh token — it's invalid
    await _tokenStorage.clearTokens();
  } else {
    // Network error, timeout, server error — keep tokens, they're still valid
    developer.log(
      'AuthInterceptor: refresh failed, preserving tokens (${e is DioException ? e.type : e.runtimeType})',
      name: 'auth',
    );
  }
  handler.next(err);
}
```

#### 1b. `auth_repository.dart` — Lines 112-119

Same pattern in `getCurrentUser()`:

```dart
// Before:
} catch (e) {
  await _tokenStorage.clearTokens();
  return null;
}

// After:
} catch (e) {
  final isAuthRejection = e is DioException &&
      e.type == DioExceptionType.badResponse &&
      e.response?.statusCode == 401;
  
  if (isAuthRejection) {
    // Refresh token was explicitly rejected — invalid session
    developer.log('getCurrentUser: refresh rejected, clearing tokens', name: 'auth');
    await _tokenStorage.clearTokens();
  } else {
    // Network/transient error — tokens are still good
    developer.log(
      'getCurrentUser: refresh failed (${e is DioException ? e.type : e.runtimeType}), preserving tokens',
      name: 'auth',
      error: e,
    );
  }
  return null;
}
```

### Acceptance Criteria

1. **Unit test**: Mock `DioException` with `type: connectionError` on refresh → verify `clearTokens()` is NOT called
2. **Unit test**: Mock `DioException` with `badResponse(statusCode: 401)` on refresh → verify `clearTokens()` IS called
3. **Integration test**: Login → kill backend → restart → `GET /api/auth/me` succeeds with original tokens
4. **Evidence**: `dart analyze` zero errors, `flutter test` passes

---

## Phase 2: Local User Cache

**Files**: `lib/core/security/token_storage.dart`, `lib/features/auth/cubit/auth_cubit.dart`, `lib/features/auth/cubit/auth_state.dart`, `lib/core/router/app_router.dart`

### Problem

On cold start, `AuthCubit.checkAuthStatus()` calls `AuthRepository.getCurrentUser()` which requires network. If network is down, the user gets redirected to `/login` even though they have valid saved tokens. There is no local user object cache.

### Changes

#### 2a. `token_storage.dart` — Add user cache methods

```dart
const _cachedUserKey = 'cached_user';

Future<void> saveUser(User user) async {
  final json = jsonEncode(user.toJson());
  await _storage.write(key: _cachedUserKey, value: json);
}

Future<User?> getCachedUser() async {
  final json = await _storage.read(key: _cachedUserKey);
  if (json == null) return null;
  try {
    return User.fromJson(jsonDecode(json) as Map<String, dynamic>);
  } catch (_) {
    return null;
  }
}

Future<void> clearUser() async {
  await _storage.delete(key: _cachedUserKey);
}
```

Modify `clearTokens()` to also call `clearUser()`:

```dart
Future<void> clearTokens() async {
  await Future.wait([
    _storage.delete(key: _accessTokenKey),
    _storage.delete(key: _refreshTokenKey),
    _storage.delete(key: _cachedUserKey),
  ]);
}
```

#### 2b. `auth_repository.dart` — Cache user on successful `getMe()`

In `getCurrentUser()`, after successful `getMe()`:

```dart
try {
  final user = await _api.getMe();
  await _tokenStorage.saveUser(user);  // NEW: cache for offline
  return user;
} on DioException catch (e) {
  // fall through to refresh
}
```

Also cache after successful token refresh (line 111 area):

```dart
final response = await _api.refresh(refreshToken);
await _tokenStorage.saveTokens(...);
await _tokenStorage.saveUser(response.user);  // NEW
return response.user;
```

#### 2c. `auth_cubit.dart` — Add offline fallback in `checkAuthStatus()`

```dart
Future<void> checkAuthStatus() async {
  emit(const AuthState.loading());
  try {
    final user = await _repository.getCurrentUser();
    if (user == null) {
      // Check for cached user before giving up
      final cachedUser = await _repository.getCachedUser();
      if (cachedUser != null) {
        developer.log('checkAuthStatus: using cached user (offline)', name: 'auth');
        emit(AuthState.authenticated(user: cachedUser, isOffline: true));
        return;
      }
      emit(const AuthState.unauthenticated());
      return;
    }
    _routeByUserState(user);
  } catch (e, s) {
    developer.log('checkAuthStatus failed', name: 'auth', error: e, stackTrace: s);
    // Try cached user as last resort
    final cachedUser = await _repository.getCachedUser();
    if (cachedUser != null) {
      emit(AuthState.authenticated(user: cachedUser, isOffline: true));
      return;
    }
    emit(const AuthState.unauthenticated());
  }
}
```

Add to `AuthRepository`:

```dart
Future<User?> getCachedUser() => _tokenStorage.getCachedUser();
```

#### 2d. `auth_state.dart` — Add `isOffline` to `AuthAuthenticated`

```dart
const factory AuthState.authenticated({
  required User user,
  @Default(false) bool isOffline,
}) = AuthAuthenticated;
```

#### 2e. `app_router.dart` — Prevent `/login` flash during auth check

```dart
GoRouter createAppRouter(AuthCubit authCubit) {
  var hasCheckedAuth = false;
  authCubit.stream.listen((state) {
    if (state is! AuthInitial) hasCheckedAuth = true;
  });

  return GoRouter(
    redirect: (context, state) {
      final authState = authCubit.state;
      final location = state.matchedLocation;

      // Don't redirect during initial auth check — prevents login flash
      if (authState is AuthInitial && !hasCheckedAuth) return null;

      final loggedIn =
          authState is AuthAuthenticated ||
          authState is AuthNeedsOnboarding ||
          authState is AuthRegisterSuccess ||
          authState is AuthPendingRole;
      // ... rest unchanged
    },
  );
}
```

### Acceptance Criteria

1. **Unit test**: `AuthCubit.checkAuthStatus()` offline + cached user present → emits `AuthAuthenticated(isOffline: true)`
2. **Unit test**: `AuthCubit.checkAuthStatus()` offline + no cached user → emits `AuthUnauthenticated`
3. **Unit test**: Token `clearTokens()` also clears cached user
4. **Integration test**: Login → save tokens → kill network → cold restart → authenticated state
5. **Integration test**: Login → kill network → cold restart → cached user used (no `/api/auth/me` call)
6. **Evidence**: `dart analyze` zero errors, `flutter test` passes, no `/login` flash on cold start with cached user

---

## Phase 3: Connectivity Banner

**Files**: `lib/main.dart`, `lib/features/sync/cubit/sync_cubit.dart`

### Problem

The app detects connectivity changes via `ConnectivityService` but never shows any UI indicator. Users have no idea they're offline — silent degradation feels broken.

### Changes

#### 3a. `main.dart` — Add SyncCubit to MultiBlocProvider

```dart
class _ZiroFitAppState extends State<ZiroFitApp> {
  late final SyncCubit _syncCubit;  // NEW

  @override
  void initState() {
    super.initState();
    _syncCubit = di.getIt<SyncCubit>();  // NEW
    // ...
  }

  @override
  void dispose() {
    _syncCubit.close();  // NEW
    // ...
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _authCubit),
        BlocProvider.value(value: _syncCubit),  // NEW
        // ... rest
      ],
      child: DartQueryProvider(
        client: _queryClient,
        child: MaterialApp.router(
          routerConfig: _router,
          builder: (context, child) {  // NEW — overlay banner
            return BlocBuilder<SyncCubit, SyncState>(
              builder: (context, state) {
                return Stack(
                  children: [
                    child!,
                    if (!state.isOnline)
                      const Positioned(
                        top: 0, left: 0, right: 0,
                        child: _ConnectivityBanner(),
                      ),
                  ],
                );
              },
            );
          },
          // ...
        ),
      ),
    );
  }
}
```

#### 3b. `main.dart` — Banner widget (inline or extracted)

```dart
class _ConnectivityBanner extends StatefulWidget {
  const _ConnectivityBanner();

  @override
  State<_ConnectivityBanner> createState() => _ConnectivityBannerState();
}

class _ConnectivityBannerState extends State<_ConnectivityBanner> {
  bool _expanded = false;

  @override
  void initState() {
    super.initState();
    // Auto-expand on first appearance, collapse after 4s
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() => _expanded = true);
      Future.delayed(const Duration(seconds: 4), () {
        if (mounted) setState(() => _expanded = false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _expanded = !_expanded),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: _expanded ? 32 : 3,
        color: Colors.amber.shade700,
        child: _expanded
            ? Row(
                children: [
                  const SizedBox(width: 12),
                  const Icon(Icons.wifi_off_rounded, size: 14, color: Colors.white),
                  const SizedBox(width: 6),
                  const Text(
                    "You're offline",
                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => context.read<SyncCubit>().sync(),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'Retry',
                        style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
```

### Acceptance Criteria

1. **Widget test**: Mock `SyncCubit` with `isOnline: false` → banner widget visible
2. **Widget test**: Mock `SyncCubit` with `isOnline: true` → banner widget absent
3. **Widget test**: Tap "Retry" on banner → `SyncCubit.sync()` called
4. **Integration test**: Kill network → banner appears → restore network → banner disappears
5. **Evidence**: Banner visible on ALL routes (including full-screen routes like workout session, trainer detail)

---

## Phase 4: Stale-While-Revalidate for Reads

**Files**: `lib/core/network/response_cache.dart`, `lib/features/notifications/data/repositories/notification_repository.dart`, `lib/features/nutrition_habits/data/nutrition_habits_repository.dart`, `lib/features/check_in/data/check_in_repository.dart`, `lib/features/daily_targets/data/daily_targets_repository.dart`, `lib/features/fitness_goals/data/fitness_goals_repository.dart`, `lib/features/sharing/data/sharing_repository.dart`, plus explore cubits directly (no repo layer exists there)

### Problem

`ResponseCache` infrastructure exists but only `HomeRepository` and `TrainerRepository` use it. When offline, most features show error screens instead of stale cached data.

### Changes

For each repository, follow the same pattern as `HomeRepository.getDashboard()`:

```dart
Future<ResponseDto> getSomeData() async {
  try {
    final response = await _api.getSomeData();
    unawaited(_cache.set('some:key', response.toJson()));
    return response;
  } catch (e) {
    if (await _connectivity.checkConnectivity()) rethrow;
    final cached = await _cache.get<ResponseDto>(
      'some:key',
      ResponseDto.fromJson,
    );
    if (cached != null) return cached;
    rethrow;
  }
}
```

### Repositories to update

| Repository | Method | Cache Key | DTO |
|---|---|---|---|
| `NotificationRepository` | `getNotifications()` | `notifications:list` | `NotificationDto` (list) |
| `NutritionHabitsRepository` | `getNutritionPlan()` | `nutrition:plan` | `NutritionPlanDto` |
| `NutritionHabitsRepository` | `getHabits()` | `nutrition:habits` | `List<DailyHabitDto>` |
| `CheckInRepository` | `getHistory()` | `checkin:history` | `List<CheckInHistoryItemDto>` |
| `CheckInRepository` | `getDetail(id)` | `checkin:detail:$id` | `CheckInDetailDto` |
| `DailyTargetsRepository` | `getDailyTargets()` | `daily-targets` | `DailyTargetDto` |
| `FitnessGoalsRepository` | `getFitnessGoals()` | `fitness-goals` | `List<FitnessGoalDto>` |
| `SharingRepository` | `getSharingConfig()` | `sharing:config` | `SharingConfigDto` |
| `ExploreCubit` (no repo layer) | `loadData()` | `explore:metadata` | Add caching directly in cubit or create `ExploreRepository` |
| `TrainerDiscoveryCubit` (no repo) | `searchTrainers(...)` | `explore:trainers:$hash` | Uses `ExploreApiService` directly — add cache there or create repo |

### Pattern for list DTOs

For list responses (notifications, habits, fitness goals), wrap in a container class or serialize as JSON array:

```dart
// Cache key stores JSON array directly as string
// ResponseCache has `set(key, value)` — store as a simple wrapper map
final jsonList = response.map((e) => e.toJson()).toList();
await _cache.set('notifications:list', {'items': jsonList});
```

Or create a thin wrapper DTO. Simpler approach: `ResponseCache` stores raw JSON strings, so just store the list as a JSON array string.

### Acceptance Criteria

1. **Unit test per repo**: API fails + offline → returns cached response
2. **Unit test per repo**: API succeeds → caches response
3. **Unit test per repo**: API fails + online → rethrows (no cache fallback)
4. **Integration test**: Load dashboard → go offline → reload → see cached content (not error)
5. **Evidence**: All error screens replaced by stale cached data when offline

---

## Phase 5: Implement Push Sync

**Files**: `lib/features/sync/data/sync_repository.dart`, `lib/core/database/sync_tables_registry.dart`, `lib/core/database/sync_converter.dart`, plus all mutation sites across features

### Problem

`_collectPendingChanges()` returns `{}` — locally created/updated/deleted rows (with `sync_status = 'pending'`) are never pushed to the backend. The architecture is in place but the collection logic is a stub.

### Prerequisites

Before `_collectPendingChanges()` can collect anything, every site that performs local mutations must set `sync_status = 'pending'`. Currently, only the sync pull sets `sync_status` (to `'synced'`).

**Mutation sites that need tracking:**

| Feature | Local Mutation | Current Status |
|---|---|---|
| Workout session (start) | INSERT workout_sessions | Default `'pending'` ✅ |
| Workout session (log set) | INSERT client_exercise_logs | Default `'pending'` ✅ |
| Workout session (finish) | UPDATE workout_sessions SET status | MUST set `sync_status = 'pending'` |
| Check-in (submit) | INSERT client_measurements/photos | Default `'pending'` ✅ |
| Daily targets (toggle) | UPDATE daily_targets (local only?) | Must verify |
| Habit (toggle) | POST to API directly — no local write | N/A |
| Notification (mark read) | UPDATE notifications | MUST set `sync_status = 'pending'` |
| Fitness goals (CRUD) | POST/PUT/DELETE via API — must sync | Must verify |

**Key rule**: After any successful direct API mutation that also writes to a local sync table, set `sync_status = 'synced'` to prevent duplicate pushes:

```dart
await _api.finishSession(sessionId);
await _db.customUpdate(
  'UPDATE workout_sessions SET sync_status = \'synced\' WHERE id = ?',
  [sessionId],
);
```

### 5a. Implement `_collectPendingChanges()`

Replace the stub in `sync_repository.dart`:

```dart
Future<Map<String, dynamic>> _collectPendingChanges() async {
  final result = <String, dynamic>{};

  for (final wireName in SyncTables.all) {
    final driftName = _wireToDriftTableName(wireName) ?? wireName;

    // Pending rows (created or updated locally)
    final pendingRows = await _db.customSelect(
      'SELECT * FROM $driftName WHERE sync_status = \'pending\' AND deleted_at IS NULL',
    ).get();

    // Soft-deleted rows
    final deletedIds = await _db.customSelect(
      'SELECT id FROM $driftName WHERE sync_status = \'pending\' AND deleted_at IS NOT NULL',
    ).get();

    if (pendingRows.isEmpty && deletedIds.isEmpty) continue;

    // Distinguish created vs updated using timestamp heuristic
    final created = <Map<String, dynamic>>[];
    final updated = <Map<String, dynamic>>[];

    for (final row in pendingRows) {
      final map = Map<String, dynamic>.from(row.data);
      final createdAt = map['created_at'] as int? ?? 0;
      final updatedAt = map['updated_at'] as int? ?? 0;

      // Exclude internal columns from the payload
      map.remove('sync_status');
      map.remove('sync_action');  // if added later

      if (createdAt == updatedAt) {
        created.add(SyncConverter.localToWire(map));
      } else {
        updated.add(SyncConverter.localToWire(map));
      }
    }

    result[wireName] = {
      'created': created,
      'updated': updated,
      'deleted': deletedIds.map((r) => r.data['id'] as String).toList(),
    };
  }

  return result;
}
```

### 5b. Write-through mechanism

For each mutation site, add a helper in `SyncRepository`:

```dart
/// Mark a local row as pending sync after mutation.
Future<void> markPending(String tableName, String id) async {
  final driftName = _wireToDriftTableName(tableName) ?? tableName;
  await _db.customUpdate(
    'UPDATE $driftName SET sync_status = \'pending\', '
    'updated_at = ? WHERE id = ?',
    [DateTime.now().millisecondsSinceEpoch, id],
  );
}

/// Mark a local row as synced after successful direct API mutation.
Future<void> markSynced(String tableName, String id) async {
  final driftName = _wireToDriftTableName(tableName) ?? tableName;
  await _db.customUpdate(
    'UPDATE $driftName SET sync_status = \'synced\', '
    'updated_at = ? WHERE id = ?',
    [DateTime.now().millisecondsSinceEpoch, id],
  );
}
```

### 5c. Post-sync row cleanup

After push succeeds, set pushed rows to `sync_status = 'synced'`:

```dart
// In sync(), after push succeeds:
await _db.transaction(() async {
  for (final wireName in pushChanges.keys) {
    final driftName = _wireToDriftTableName(wireName) ?? wireName;
    await _db.customUpdate(
      'UPDATE $driftName SET sync_status = \'synced\' WHERE sync_status = \'pending\'',
    );
  }
});
```

### Acceptance Criteria

1. **Unit test**: 3 pending rows across 2 tables → `_collectPendingChanges()` returns correct wire format with `created`, `updated`, `deleted` arrays
2. **Unit test**: No pending rows → returns `{}`
3. **Unit test**: After push succeeds → rows marked as `'synced'`
4. **Integration test**: Create local workout log → trigger sync → verify backend received it via `GET /api/trainer/sessions`
5. **Performance test**: `_collectPendingChanges()` completes within 500ms on 17 tables with 1000 rows each
6. **Evidence**: No duplicate records on backend after push

---

## Testing Strategy Summary

| Phase | Test Type | Tool | Key Scenario |
|---|---|---|---|
| 1 | Unit | mocktail | `connectionError` → tokens preserved; `401` → tokens cleared |
| 1 | Integration | curl/backend | Login → kill backend → restart → tokens intact |
| 2 | Unit | bloc_test | Offline + cached user → `AuthAuthenticated(isOffline: true)` |
| 2 | Integration | flutter_test | Cold restart offline → no `/login` redirect |
| 3 | Widget | flutter_test | Offline → banner visible; Online → banner hidden |
| 3 | Widget | flutter_test | Banner visible on full-screen routes |
| 4 | Unit | mocktail | Per-repo: offline → cached response; online → rethrow |
| 4 | Integration | flutter_test | Load → go offline → see cached content |
| 5 | Unit | mocktail | `_collectPendingChanges()` correct wire format |
| 5 | Integration | backend | Push → verify backend received data, no duplicates |

## Key Decisions

| Decision | Choice | Rationale |
|---|---|---|
| User cache storage | `flutter_secure_storage` (not Drift) | Shares lifecycle with tokens; already used for sensitive data |
| Connectivity banner placement | `MaterialApp.builder` overlay | Covers ALL routes including full-screen, not just shell |
| Cache strategy | On-error fallback (not cache-first) | Minimal change per repository; matches existing `HomeRepository` pattern |
| Push created vs updated | Timestamp heuristic (`createdAt == updatedAt`) | Avoids schema migration; can add `sync_action` column later if unreliable |
| Sync lock mechanism | `SyncCubit` tracks `isSyncing`; cubits check before mutation | Simplest approach without adding a mutex package |

## Files Modified Summary

| Phase | Files Changed | Lines Added |
|---|---|---|
| 1 | `auth_interceptor.dart`, `auth_repository.dart` | ~20 |
| 2 | `token_storage.dart`, `auth_cubit.dart`, `auth_state.dart`, `app_router.dart`, `auth_repository.dart` | ~60 |
| 3 | `main.dart` | ~80 |
| 4 | 10 repositories (5-10 lines each) | ~70 |
| 5 | `sync_repository.dart` + mutation sites | ~100 |
| **Total** | ~18 files | ~330 |

## Rollback Plan

Each phase is independently revertible via git. If Phase 5 causes issues:
1. `git revert <push-sync-commit>` — restores `_collectPendingChanges()` to `return {}`
2. Local mutations continue writing to Drift with `sync_status = 'pending'` — no data loss
3. Phases 1-4 remain functional independently
