# Analytics Offline-First Caching

## Overview

The Analytics feature uses a **cache-first** loading strategy:
1. On load, emit cached data from local Drift immediately (instant render).
2. Silently refresh from the backend in the background (no loading spinner on refresh).
3. When offline, fall back to cache. After a workout completion, compute analytics locally from Drift tables.

This matches iOS behavior where `ProgressDashboardViewModel` loads from `UserDefaults` cache, then refreshes from the API.

## Architecture

```
                   ┌─────────────────────┐
                   │   AnalyticsScreen    │
                   │  (BlocConsumer)      │
                   └────────┬────────────┘
                            │ load()
                   ┌────────▼────────────┐
                   │   AnalyticsCubit    │
                   │                    │
                   │  cache-first load   │
                   │  background refresh │
                   │  offline fallback   │
                   │  event-driven recalc│
                   └────┬──────┬─────────┘
                        │      │
              ┌─────────▼┐   ┌▼────────────┐
              │Analytics │   │Analytics    │
              │ApiService│   │LocalService│
              │ (Dio)    │   │ (Drift)     │
              └──────────┘   └┬────────────┘
                              │
                     ┌────────▼────────┐
                     │   AppDatabase   │
                     │  (Drift/SQLite) │
                     │                 │
                     │ AnalyticsCache  │◄── key-value JSON cache
                     │   (table)       │    keys: 'analytics', 'progress', 'widgetConfig'
                     │                 │
                     │ workout_sessions│◄── read for local computation
                     │ client_exercise_│
                     │   _logs         │
                     │ client_measure- │
                     │   ments         │
                     └─────────────────┘
```

## Key Components

### 1. `AnalyticsCache` Drift Table

**File:** `lib/core/database/tables/analytics_cache_table.dart`

Simple key-value table:

| Column | Type | Purpose |
|---|---|---|
| `key` | `Text` (PK) | Cache key: `'analytics'`, `'progress'`, `'widgetConfig'` |
| `value` | `Text` | JSON-serialised response DTO |
| `updatedAt` | `Int` | Unix ms timestamp |

Registered in `AppDatabase` schema v3 with `createTable` migration. Uses plain `Table` (not DataClass with freezed) since it's internal-only.

### 2. `AnalyticsLocalService` (@singleton)

**File:** `lib/features/analytics/data/analytics_local_service.dart`

Two responsibilities:

**Cache layer** (key-value read/write):
- `cacheAnalytics(data)` / `cachedAnalytics()` — read/write `AnalyticsResponseDto` as JSON
- `cacheProgress(data)` / `cachedProgress()` — read/write `ProgressResponseDto` as JSON
- `cacheWidgetConfig(data)` / `cachedWidgetConfig()` — read/write `WidgetConfigDto` as JSON
- `invalidateAll()` — delete all cache entries

Backed by `insertOnConflictUpdate` for upsert and `getSingleOrNull` for read.

**Offline local computation** (mirrors backend `/api/client/analytics`):
- `computeAnalyticsLocally()` — queries completed workout_sessions (last 6 months) + client_exercise_logs → derives heatmap dates, volume history, consistency percentage (unique workout days / 30)
- `computeProgressLocally()` — queries client_measurements → weight/body fat series; workout_sessions + logs → volume series + exercise performance + favorites

**Known limitations**:
- Muscle distribution not computed locally (exercise → muscle_group mapping requires exercises table join which isn't fully synced yet)
- PRs not computed locally (no PR tracking in local schema)
- Exercise names fall back to exerciseId in exercise performance (exercises table not populated by sync)

### 3. `AnalyticsCubit` — Cache-First Load

**File:** `lib/features/analytics/cubit/analytics_cubit.dart`

Load sequence:
```
loadWidgets()
  ├── Emit loading state
  ├── Try cached data (instant)
  │     └── If found → emit loaded with cached data
  ├── Check connectivity
  │     ├── Online → call API → cache result → emit loaded with fresh data
  │     └── Offline → keep cached data (no error if cache exists)
  └── Error fallback → if cache exists, keep showing it; otherwise emit error
```

**Event-driven refresh:**
```dart
// In constructor:
_eventSub = getIt<EventBus>().on<AppEvent>().listen(_onAppEvent);

void _onAppEvent(AppEvent event) {
  if (event is WorkoutCompletedEvent || event is CheckInSubmittedEvent) {
    checkConnectivityAndRefresh();
  }
}
```

`checkConnectivityAndRefresh()`:
- Online → call API, update cache, emit fresh data (no loading state)
- Offline → call `computeAnalyticsLocally()`, cache result, emit locally-computed data

**Force refresh** (from UI retry button):
```dart
forceRefresh()  // always loads fresh
  ├── Clear cache
  ├── Emit loading
  ├── Call API → cache → emit loaded
  └── Error → emit error
```

## Data Flow Diagram

```
App Startup / Screen Open
         │
         ▼
   Cubit.loadWidgets()
         │
         ├──── cache hit? ────► emit loaded (cached) ──► render instantly
         │                            │
         │                    ┌───────┘
         │                    ▼
         │              online? ──Yes──► API call ──► cache result ──► emit loaded (fresh)
         │                    │                                      (no loading spinner)
         │                    No
         │                    │
         │              keep cached data (no error)
         │
         └──── cache miss? ──► online? ──Yes──► API call ──► cache result ──► emit loaded
                                       │
                                       No
                                       │
                                  emit error

Workout Completed / Check-In Submitted
         │
         ▼
   EventBus.emit(WorkoutCompletedEvent / CheckInSubmittedEvent)
         │
         ▼
   Cubit._onAppEvent()
         │
         ▼
   online? ──Yes──► API call ──► cache result ──► emit fresh data (no loading state)
         │
         No
         │
         ▼
   computeAnalyticsLocally() ──► cache result ──► emit locally-computed data
```

## Widget Config vs Backend

- Backend endpoint `GET /api/client/analytics/widgets` returns `client.widgetConfig` (JSON field on the client record) or `[]` if never set
- Cubit falls back to `_defaultWidgets()` when API returns empty
- `WidgetConfigDto` with 11 widget types (7 active + 4 available) — ported from iOS
- User adds/removes widgets via `ManageWidgetsSheet`, then calls PUT endpoint to save
- Cache stores the last-saved config

## Files

| File | Purpose |
|---|---|
| `lib/core/database/tables/analytics_cache_table.dart` | Drift table for key-value cache |
| `lib/core/database/app_database.dart` | Schema v3 registration + migration |
| `lib/features/analytics/data/analytics_local_service.dart` | Cache read/write + offline computation |
| `lib/features/analytics/cubit/analytics_cubit.dart` | Cache-first load, event-driven refresh, force refresh |
| `lib/features/analytics/presentation/analytics_screen.dart` | Uses `forceRefresh` on retry |
| `lib/core/events/event_bus.dart` | AppEvent/WorkoutCompletedEvent/CheckInSubmittedEvent |
