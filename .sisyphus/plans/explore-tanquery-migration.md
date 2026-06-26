# Plan: Swap Explore from Bloc to tanquery_flutter

## Goal

Replace `ExploreCubit` + `TrainerDiscoveryCubit` + `EventDetailCubit` with `tanquery_flutter`'s stale-while-revalidate pattern. Remove ~700 lines of manual state boilerplate, gain automatic caching, background refetch, and request deduplication.

**Keep `ExploreMapCubit`** — its value is clustering + map interaction state, not just API fetching.

## Library Choice: `tanquery_flutter`

- Pure Dart core (`tanquery`) + Flutter widget builders (`tanquery_flutter`)
- No Flutter Hooks dependency (unlike `flutter_query`)
- v1.0.0, published 2026-05-23
- API closest to TanStack Query v5: `QueryBuilder`, `MutationBuilder`, `InfiniteQueryBuilder`
- `stale-while-revalidate` with configurable `staleTime` / `gcTime`
- Works with Dart 3.12.2

## Current Architecture (Before)

```
main.dart (MultiBlocProvider)
  ├── BlocProvider<ExploreCubit>            ← @injectable
  ├── BlocProvider<TrainerDiscoveryCubit>   ← @injectable
  │
  ├── explore_screen.dart
  │     └── BlocBuilder<ExploreCubit> → init → loadContent()
  │           └── 4 parallel API calls → merge → emit loaded
  │
  ├── trainer_discovery_screen.dart
  │     └── BlocBuilder<TrainerDiscoveryCubit> → init → load()
  │           └── search trainers + events → manual pagination
  │
  └── event_detail_screen.dart
        └── BlocBuilder<EventDetailCubit> → load(id)
              └── single API call → manual loading/error

lib/features/explore/
  cubit/
    explore_cubit.dart            [127 lines]
    explore_state.dart            [44 lines] + freezed generated
    trainer_discovery_cubit.dart  [254 lines]
    trainer_discovery_state.dart  [63 lines] + freezed generated
    event_detail_cubit.dart       [44 lines]
    event_detail_state.dart       [~40 lines]
    explore_map_cubit.dart        [365 lines] ← KEEP
    explore_map_state.dart        [...]
  data/
    explore_api_service.dart      [158 lines] ← KEEP (queryFn source)
    explore_repository.dart       [84 lines]  ← REMOVE (no cache needed)
  presentation/
    explore_screen.dart           [433 lines]
    trainer_discovery_screen.dart [916 lines]
    event_detail_screen.dart      [498 lines]
    events_list_screen.dart       [188 lines]
    widgets/ (19 files)
    ...
```

**Total removed:** ~5 cubit + state files (~550 lines), repository (84 lines), freezed boilerplate.

## Target Architecture (After)

```
main.dart
  └── QueryClientProvider          ← NEW: wraps app, owns cache
        └── (no change to existing BlocProvider tree)
              ├── ExploreScreen uses QueryBuilder inline
              ├── TrainerDiscoveryScreen uses QueryBuilder inline
              └── EventDetailScreen uses QueryBuilder inline

lib/features/explore/
  cubit/
    explore_map_cubit.dart         ← KEPT (clustering, zoom, selection)
    explore_map_state.dart         ← KEPT
  data/
    explore_api_service.dart       ← KEPT (converted to return raw maps)
  presentation/
    explore_screen.dart            ← MODIFIED: QueryBuilder replaces BlocBuilder
    trainer_discovery_screen.dart  ← MODIFIED: QueryBuilder replaces BlocBuilder
    event_detail_screen.dart       ← MODIFIED: QueryBuilder replaces BlocBuilder
    events_list_screen.dart        ← MODIFIED: QueryBuilder replaces BlocBuilder
    widgets/ (19 files)            ← UNCHANGED (they take data props, not cubits)
```

## Step-by-Step Implementation

### Step 1: Add dependency

```yaml
# pubspec.yaml
dependencies:
  tanquery_flutter: ^1.0.0
```

Then `flutter pub get`.

### Step 2: Wire QueryClientProvider in main.dart

```dart
// main.dart
import 'package:tanquery_flutter/tanquery_flutter.dart';

// Wrap MaterialApp.router with QueryClientProvider
QueryClientProvider(
  client: QueryClient(
    defaultOptions: const DefaultOptions(
      queries: QueryDefaultOptions(
        staleTime: Duration(minutes: 5),   // Explore data doesn't change fast
        refetchOnMount: true,               // Refresh on screen revisit
        refetchOnReconnect: true,           // Auto-refresh on connectivity restore
      ),
    ),
  ),
  child: MaterialApp.router(...),
)
```

Remove `ExploreCubit` and `TrainerDiscoveryCubit` from `main.dart`'s cubit list and `MultiBlocProvider`.

### Step 3: Convert ExploreApiService to standalone queryFn methods

The API service already works. No changes needed — it's used as the fetch function source.

### Step 4: Rewrite ExploreScreen

**Before:** `BlocBuilder<ExploreCubit, ExploreState>` with `initState → loadContent()` → 4 parallel API calls → manual merge → date grouping.

**After:** 4 separate `QueryBuilder` widgets for independent sections (metadata, featured, promoted, events). Each gets automatic caching + dedup.

```dart
// explore_screen.dart — simplified
class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: RefreshIndicator(
        onRefresh: () => QueryClient.of(context).invalidateQueries(
          queryKey: QueryKey(['explore']),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ExploreCityHeader(),
            ),
            SliverToBoxAdapter(child: ExploreSlidingSegment()),
            // Each section is an independent QueryBuilder
            SliverToBoxAdapter(child: _FeaturedTrainersSection()),
            SliverToBoxAdapter(child: _RecommendedTrainersSection()),
            SliverToBoxAdapter(child: _EventsSection()),
          ],
        ),
      ),
    );
  }
}

// Each section:
class _FeaturedTrainersSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return QueryBuilder<FeaturedContent>(
      queryKey: QueryKey(['explore', 'featured']),
      queryFn: () => getIt<ExploreApiService>().getFeaturedContent(),
      staleTime: const Duration(minutes: 5),
      placeholder: () => SizedBox(height: 220),  // skeleton placeholder
      builder: (context, state) {
        if (state.isLoading) return const TrainerCardSkeleton();
        if (state.isError) return const SizedBox.shrink();  // fail silently
        return _TrainerSection(
          title: 'Featured Trainers',
          trainers: state.data!.featuredTrainers,
        );
      },
    );
  }
}
```

Key decisions:
- **4 separate query keys** (`['explore', 'featured']`, `['explore', 'metadata']`, `['explore', 'promoted']`, `['explore', 'events']`) — each is independently cached and refetched.
- **`staleTime: 5 minutes`** — explore data doesn't change frequently. No unnecessary refetches while user scrolls.
- **Date grouping stays as a pure utility** — extracted to a `DateGroupingUtil` class (or inline getter), no longer part of state management.
- **City/category selection** uses `QueryKey` with params: `QueryKey(['explore', 'featured', cityId])` — changing city automatically creates a new cache entry.

### Step 5: Rewrite TrainerDiscoveryScreen

**Before:** `TrainerDiscoveryCubit` with 254 lines handling: debounced search, pagination (trainers + events), filters, state management.

**After:** 

```dart
// Search box → debounce writes search term to local state
// QueryBuilder reads the search term as part of queryKey

QueryBuilder<TrainerListResponse>(
  queryKey: QueryKey(['trainers', 'search', searchQuery, sortBy, specialty]),
  queryFn: () => api.searchTrainers(query: searchQuery, ...),
  staleTime: const Duration(seconds: 30),
  placeholder: () => ListView(... skeleton),
  builder: (context, state) {
    // state.data!.trainers — always shows cached/previous data while refetching
    // state.isStale — true when background refetch is happening
    // state.isFetching — true when actually loading (no cache)
    return _TrainerList(trainers: state.data!.trainers);
  },
)
```

Key decisions:
- **`staleTime: 30 seconds`** — search results are user-driven, quick expiry is fine.
- **Debounce stays** as a `TextEditingController` timer (pure UI concern).
- **Pagination** → `InfiniteQueryBuilder` from tanquery_flutter:
  ```dart
  InfiniteQueryBuilder<TrainerListResponse>(
    queryKey: QueryKey(['trainers', 'search', query]),
    queryFn: (context, pageParam) => api.searchTrainers(page: pageParam),
    initialPageParam: 1,
    getNextPageParam: (lastPage) => lastPage.hasMore ? lastPage.page + 1 : null,
    builder: (context, state) {
      // state.pages — all loaded pages
      // state.isFetchingNextPage — loading more indicator
      // state.fetchNextPage() — called on scroll end
    },
  )
  ```

### Step 6: Rewrite EventDetailScreen

**Before:** `EventDetailCubit` + `BlocBuilder` → manual loading/error/enrolled states.

**After:** Single QueryBuilder + MutationBuilder.

```dart
// Event detail load
QueryBuilder<EventDetailDto>(
  queryKey: QueryKey(['events', eventId]),
  queryFn: () => api.getEventDetail(eventId),
  staleTime: const Duration(minutes: 10),
  builder: (context, state) {
    return switch (state) {
      QueryLoading() => LoadingIndicator(),
      QueryError(:final error) => ErrorView(message: error),
      QuerySuccess(:final data) => _EventDetailContent(event: data),
    };
  },
)

// Enroll mutation
MutationBuilder<Map<String, dynamic>>(
  mutationFn: () => event.isFree
    ? api.joinFreeEvent(eventId) 
    : api.createCheckoutSession(type: 'EVENT_TICKET', id: eventId),
  onSuccess: (data) {
    // Invalidate event cache
    QueryClient.of(context).invalidateQueries(queryKey: QueryKey(['events', eventId]));
  },
  builder: (context, state) {
    return ElevatedButton(
      onPressed: state.isPending ? null : () => context.mutate(),
      child: state.isPending 
        ? CircularProgressIndicator() 
        : Text(enrolled ? 'Enrolled ✓' : 'Join Event'),
    );
  },
)
```

### Step 7: Remove deleted cubits from DI

- Remove `ExploreCubit` and `TrainerDiscoveryCubit` from `main.dart` constructor + `MultiBlocProvider`
- Remove `ExploreRepository` from DI (or keep as thin pass-through if screens want it)
- Remove explore_state.dart + trainer_discovery_state.dart + event_detail_state.dart + event_detail_cubit.dart files
- Run `build_runner` to regenerate injection config

### Step 8: Cleanup freezed files

```sh
flutter pub run build_runner build --delete-conflicting-outputs
```

Remove these generated files:
- `explore_state.freezed.dart`
- `trainer_discovery_state.freezed.dart`
- `event_detail_state.freezed.dart`

### Step 9: Test

- `dart analyze lib/features/explore/` — zero errors
- `flutter test` — all 39 existing tests still pass
- Manual: open explore tab, verify data loads, pull to refresh, switch cities, open event detail, navigate back

## What We Gain

| Metric | Before | After |
|---|---|---|
| State files | 5 (~550 lines) | 0 |
| Cubit files | 4 (~790 lines) | 1 (map cubit, 365 lines) |
| Repository | 1 (84 lines) | 0 |
| Cache | Manual cubit state | Automatic, keyed, configurable TTL |
| Stale-while-revalidate | Manual (analytics pattern) | Built-in (QueryBuilder handles status + fetchStatus) |
| Request dedup | 0 (multiple widgets = multiple calls) | Automatic (same key = one call) |
| Retry | Manual try/catch | Built-in exponential backoff |
| Background refetch | None | On mount, reconnect, interval |

## What We Lose

- **Freezed sealed states** → QueryBuilder uses its own status enum (`QueryLoading`, `QuerySuccess`, `QueryError`). Fine for API reads. For mutations (enroll), `MutationBuilder` covers it.
- **ExploreCubit.selectCity/selectCategory** → handled by changing queryKey params. The ExploreScreen just passes the selected city/category down as props.
- **ExploreCubit.refresh** → `QueryClient.of(context).invalidateQueries(queryKey: QueryKey(['explore']))` — invalidates all explore cache entries, triggers background refetch.

## Files Modified (no new files)

1. `pubspec.yaml` — add `tanquery_flutter: ^1.0.0`
2. `lib/main.dart` — add `QueryClientProvider`, remove ExploreCubit + TrainerDiscoveryCubit
3. `lib/features/explore/presentation/explore_screen.dart` — rewrite to QueryBuilder
4. `lib/features/explore/presentation/trainer_discovery_screen.dart` — rewrite to QueryBuilder + InfiniteQueryBuilder
5. `lib/features/explore/presentation/event_detail_screen.dart` — rewrite to QueryBuilder + MutationBuilder
6. `lib/features/explore/presentation/events_list_screen.dart` — rewrite to QueryBuilder
7. Delete: `explore_cubit.dart`, `explore_state.dart`, `trainer_discovery_cubit.dart`, `trainer_discovery_state.dart`, `event_detail_cubit.dart`, `event_detail_state.dart`, `explore_repository.dart`

## Risk Assessment

| Risk | Mitigation |
|---|---|
| `tanquery_flutter` v1.0.0 — new package, limited community | Core is pure Dart, loosely coupled. If it has issues, revert to flutter_query (same API). |
| QueryBuilder replaces BlocBuilder — different lifecycle | QueryBuilder is simpler (no events, just data). Migration is mechanical. |
| City/category filter state no longer in cubit | Local state (`useState` or `StatefulWidget` field) — trivial. |
| Infinite scrolling with InfiniteQueryBuilder | Matches TanStack Query's `getNextPageParam` exactly. Well-documented pattern. |
| Error handling changes | QueryBuilder's `QueryError` state includes error + automatic retry. Retry button calls `state.refetch()`. |

## Total Effort: ~4-6 hours

- Step 1-2 (setup): 15 min
- Step 3 (API service): 0 min (unchanged)
- Step 4 (ExploreScreen): 1.5 hours
- Step 5 (TrainerDiscoveryScreen): 2 hours
- Step 6 (EventDetailScreen): 1 hour
- Step 7-9 (cleanup + test): 30 min

---

**This is the plan. Review and I'll implement it.**
