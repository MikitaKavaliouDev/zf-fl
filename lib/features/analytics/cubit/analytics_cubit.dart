import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ziro_fit/core/connectivity/connectivity_service.dart';
import 'package:ziro_fit/core/di/injection.dart';
import 'package:ziro_fit/core/events/event_bus.dart';

import '../data/analytics_local_service.dart';
import '../data/analytics_repository.dart';
import '../data/models/analytics_response_dto.dart';
import '../data/models/progress_response_dto.dart';
import '../data/models/widget_config_dto.dart';
import 'analytics_state.dart';

/// Parsed exercise stat data point from the API.
class ExerciseStatPoint {
  final String date;
  final double value;
  const ExerciseStatPoint({required this.date, required this.value});
}

/// Holds the three data payloads fetched/cached together.
class _AnalyticsDataBundle {
  final AnalyticsResponseDto analytics;
  final ProgressResponseDto progress;
  final WidgetConfigDto widgets;

  const _AnalyticsDataBundle({
    required this.analytics,
    required this.progress,
    required this.widgets,
  });
}

@injectable
class AnalyticsCubit extends Cubit<AnalyticsState> {
  final AnalyticsRepository _repository;
  final AnalyticsLocalService _localService;
  final ConnectivityService _connectivity;
  StreamSubscription<AppEvent>? _eventSub;

  AnalyticsCubit(
    this._repository,
    this._localService,
    this._connectivity,
  ) : super(const AnalyticsState.initial()) {
    _eventSub = getIt<EventBus>().on<AppEvent>().listen(_onAppEvent);
  }

  // ──────────────────────────────────────────────────────────────
  // Public API
  // ──────────────────────────────────────────────────────────────

  /// Cache-first load: show cached data instantly, then refresh from API.
  /// On pull-to-refresh this skips the cache and hits the API directly.
  Future<void> loadData({bool forceRefresh = false}) async {
    if (forceRefresh) {
      emit(const AnalyticsState.loading());
      await _refreshFromApi(fallbackToCache: false);
      return;
    }

    // 1. Serve from cache immediately (offline-first)
    final cached = await _loadFromCache();
    if (cached != null) {
      _emitLoaded(cached);
    } else {
      emit(const AnalyticsState.loading());
    }

    // 2. Refresh from API in background
    await _refreshFromApi(fallbackToCache: cached == null);
  }

  /// Reload (alias for pull-to-refresh).
  Future<void> refresh() => loadData(forceRefresh: true);

  /// Toggle a widget's visibility by its [widgetId].
  void toggleWidgetVisibility(String widgetId) {
    final s = state;
    if (s is! AnalyticsLoaded) return;
    final updatedWidgets = s.widgets.widgets.map((w) {
      if (w.id == widgetId) {
        return w.copyWith(isVisible: !w.isVisible);
      }
      return w;
    }).toList();
    emit(s.copyWith(widgets: s.widgets.copyWith(widgets: updatedWidgets)));
  }

  /// Reorder widgets after a drag-and-drop.
  void reorderWidgets(int oldIndex, int newIndex) {
    final s = state;
    if (s is! AnalyticsLoaded) return;
    final list = [...s.widgets.widgets];
    final item = list.removeAt(oldIndex);
    list.insert(newIndex, item);
    final reordered = list.asMap().entries.map((e) {
      return e.value.copyWith(order: e.key);
    }).toList();
    emit(s.copyWith(
      widgets: s.widgets.copyWith(widgets: reordered),
    ));
  }

  /// Persist widget configuration to the backend.
  Future<void> saveWidgetConfig() async {
    final s = state;
    if (s is! AnalyticsLoaded) return;
    try {
      await _repository.updateWidgetConfig(s.widgets);
      // Also cache the updated config locally
      await _localService.cacheWidgetConfig(s.widgets);
      developer.log('Widget config saved successfully', name: 'analytics');
    } catch (e, stack) {
      developer.log(
        'AnalyticsCubit.saveWidgetConfig failed: $e',
        name: 'analytics',
        error: e,
        stackTrace: stack,
      );
      emit(const AnalyticsState.error('Failed to save widget configuration.'));
    }
  }

  /// Fetch per-exercise stats from the API and parse into [DataPoint] list.
  Future<List<DataPoint>> fetchExerciseStats(String exerciseId) async {
    try {
      final raw = await _repository.getExerciseStats(exerciseId: exerciseId);
      final List<dynamic>? points = (raw['points'] ??
              raw['dataPoints'] ??
              raw['data']) as List<dynamic>?;
      if (points == null) return [];
      return points.map((p) {
        if (p is Map<String, dynamic>) {
          return DataPoint.fromJson(p);
        }
        return DataPoint(
          date: (p['date'] ?? '').toString(),
          value: (p['value'] ?? 0.0).toDouble(),
        );
      }).toList();
    } catch (e) {
      developer.log('AnalyticsCubit.fetchExerciseStats failed: $e',
          name: 'analytics');
      return [];
    }
  }

  // ──────────────────────────────────────────────────────────────
  // Event handler — workout / check-in completed
  // ──────────────────────────────────────────────────────────────

  void _onAppEvent(AppEvent event) {
    if (event is WorkoutCompletedEvent || event is CheckInSubmittedEvent) {
      // Don't show loading — silently refresh so existing data stays visible
      unawaited(_handleDataMutation());
    }
  }

  /// Called when data may have changed (workout/check-in completed).
  /// Tries API first, falls back to local computation when offline.
  Future<void> _handleDataMutation() async {
    final online = await _connectivity.checkConnectivity();
    if (online) {
      await _refreshFromApi();
    } else {
      await _computeAndCacheLocally();
    }
  }

  // ──────────────────────────────────────────────────────────────
  // API fetch + cache
  // ──────────────────────────────────────────────────────────────

  /// Fetch analytics, progress, and widget config from API in parallel.
  /// On success: updates all three caches and emits loaded state.
  /// On failure: if [fallbackToCache] is false and no loaded state exists,
  /// emits an error. Otherwise keeps the current loaded state.
  Future<void> _refreshFromApi({bool fallbackToCache = false}) async {
    try {
      final results = await Future.wait([
        _repository.getAnalytics(),
        _repository.getProgress(),
        _repository.getWidgetConfig(),
      ]);
      var analytics = results[0] as AnalyticsResponseDto;
      final progress = results[1] as ProgressResponseDto;
      var widgets = results[2] as WidgetConfigDto;

      // Default widget config when API returns empty
      if (widgets.widgets.isEmpty) {
        widgets = WidgetConfigDto(widgets: _defaultWidgets());
      }

      // Write to cache (fire-and-forget)
      unawaited(Future.wait([
        _localService.cacheAnalytics(analytics),
        _localService.cacheProgress(progress),
        _localService.cacheWidgetConfig(widgets),
      ]));

      _emitLoaded(_AnalyticsDataBundle(
        analytics: analytics,
        progress: progress,
        widgets: widgets,
      ));
    } catch (e, stack) {
      developer.log(
        'AnalyticsCubit._refreshFromApi failed: $e',
        name: 'analytics',
        error: e,
        stackTrace: stack,
      );
      if (fallbackToCache && state is! AnalyticsLoaded) {
        emit(const AnalyticsState.error('Failed to load analytics data.'));
      }
      // If we already have a loaded state (from cache or prior API call),
      // stay there — better to show possibly-stale data than an error.
    }
  }

  // ──────────────────────────────────────────────────────────────
  // Offline local computation
  // ──────────────────────────────────────────────────────────────

  /// Compute analytics from local Drift data, cache the results, and emit.
  Future<void> _computeAndCacheLocally() async {
    try {
      final analytics = await _localService.computeAnalyticsLocally();
      final progress = await _localService.computeProgressLocally();

      // Use cached widget config or defaults
      var widgets = await _localService.cachedWidgetConfig();
      if (widgets == null || widgets.widgets.isEmpty) {
        widgets = WidgetConfigDto(widgets: _defaultWidgets());
      }

      // Cache the locally computed results
      unawaited(Future.wait([
        _localService.cacheAnalytics(analytics),
        _localService.cacheProgress(progress),
      ]));

      _emitLoaded(_AnalyticsDataBundle(
        analytics: analytics,
        progress: progress,
        widgets: widgets,
      ));
    } catch (e, stack) {
      developer.log(
        'AnalyticsCubit._computeAndCacheLocally failed: $e',
        name: 'analytics',
        error: e,
        stackTrace: stack,
      );
      // Don't overwrite existing loaded state with an error
      if (state is! AnalyticsLoaded) {
        emit(const AnalyticsState.error('Failed to compute analytics.'));
      }
    }
  }

  // ──────────────────────────────────────────────────────────────
  // Cache read + state emission
  // ──────────────────────────────────────────────────────────────

  /// Try to load all three data sources from the local cache.
  /// Returns null if any one is missing.
  Future<_AnalyticsDataBundle?> _loadFromCache() async {
    try {
      final results = await Future.wait([
        _localService.cachedAnalytics(),
        _localService.cachedProgress(),
        _localService.cachedWidgetConfig(),
      ]);
      final analytics = results[0] as AnalyticsResponseDto?;
      final progress = results[1] as ProgressResponseDto?;
      var widgets = results[2] as WidgetConfigDto?;

      if (analytics == null || progress == null) return null;

      if (widgets == null || widgets.widgets.isEmpty) {
        widgets = WidgetConfigDto(widgets: _defaultWidgets());
      }

      return _AnalyticsDataBundle(
        analytics: analytics,
        progress: progress,
        widgets: widgets,
      );
    } catch (e) {
      developer.log('AnalyticsCubit._loadFromCache failed: $e',
          name: 'analytics');
      return null;
    }
  }

  /// Build and emit [AnalyticsLoaded] from raw data, computing streaks/trends.
  void _emitLoaded(_AnalyticsDataBundle bundle) {
    final analytics = bundle.analytics;
    final progress = bundle.progress;
    final widgets = bundle.widgets;

    // Streak calculations
    final dateSet = analytics.heatmapDates.toSet();
    final now = DateTime.now();
    final currentStreak = _calculateCurrentStreak(dateSet, now);
    final longestStreak = _calculateLongestStreak(dateSet);

    // Trend calculations
    final volumeHistory = analytics.volumeHistory;
    final volumeTrend = _calculateTrend(volumeHistory);

    // Consistency Trend (comparing last 15 days of workout days vs. previous 15 days)
    final thirtyDaysAgo = now.subtract(const Duration(days: 30));
    final fifteenDaysAgo = now.subtract(const Duration(days: 15));

    final last15DaysCount = dateSet.where((d) {
      final parsed = DateTime.tryParse(d);
      if (parsed == null) return false;
      return parsed.isAfter(fifteenDaysAgo);
    }).length;

    final prev15DaysCount = dateSet.where((d) {
      final parsed = DateTime.tryParse(d);
      if (parsed == null) return false;
      return parsed.isAfter(thirtyDaysAgo) && parsed.isBefore(fifteenDaysAgo);
    }).length;

    final consistencyTrend = prev15DaysCount > 0
        ? ((last15DaysCount - prev15DaysCount) / prev15DaysCount) * 100
        : 0.0;

    // Frequency & average volume trends
    final mid = (volumeHistory.length / 2).ceil();
    final recentHalf = volumeHistory.length >= 2
        ? volumeHistory.sublist(mid)
        : <VolumeDataPoint>[];
    final previousHalf = volumeHistory.length >= 2
        ? volumeHistory.sublist(0, mid)
        : <VolumeDataPoint>[];

    final recentWeeks = recentHalf.length >= 2
        ? (DateTime.parse(recentHalf.last.date)
                    .difference(DateTime.parse(recentHalf.first.date))
                    .inDays /
                7.0)
            .abs()
            .clamp(0.5, double.infinity)
        : 1.0;
    final previousWeeks = previousHalf.length >= 2
        ? (DateTime.parse(previousHalf.last.date)
                    .difference(DateTime.parse(previousHalf.first.date))
                    .inDays /
                7.0)
            .abs()
            .clamp(0.5, double.infinity)
        : 1.0;

    final recentFrequency = recentHalf.length / recentWeeks;
    final previousFrequency = previousHalf.length / previousWeeks;
    final frequencyTrend = previousFrequency > 0
        ? ((recentFrequency - previousFrequency) / previousFrequency) * 100
        : 0.0;

    final recentAvgVol = recentHalf.isNotEmpty
        ? recentHalf.fold<double>(0, (s, d) => s + d.volume) /
            recentHalf.length
        : 0.0;
    final previousAvgVol = previousHalf.isNotEmpty
        ? previousHalf.fold<double>(0, (s, d) => s + d.volume) /
            previousHalf.length
        : 0.0;
    final averageVolumeTrend = previousAvgVol > 0
        ? ((recentAvgVol - previousAvgVol) / previousAvgVol) * 100
        : 0.0;

    emit(AnalyticsState.loaded(
      analytics: analytics,
      progress: progress,
      widgets: widgets,
      currentStreak: currentStreak,
      longestStreak: longestStreak,
      volumeTrend: volumeTrend,
      consistencyTrend: consistencyTrend,
      frequencyTrend: frequencyTrend,
      averageVolumeTrend: averageVolumeTrend,
    ));
  }

  // ─── Streak Calculations ──────────────────────────────────────────────

  int _calculateCurrentStreak(Set<String> dateSet, DateTime fromDate) {
    int streak = 0;
    var date = fromDate;
    while (true) {
      final key = _dateKey(date);
      if (dateSet.contains(key)) {
        streak++;
        date = date.subtract(const Duration(days: 1));
      } else {
        if (streak == 0) {
          date = date.subtract(const Duration(days: 1));
          continue;
        }
        break;
      }
    }
    return streak;
  }

  int _calculateLongestStreak(Set<String> dateSet) {
    if (dateSet.isEmpty) return 0;
    final sorted = dateSet.toList()..sort();
    int longest = 0;
    int current = 1;
    for (int i = 1; i < sorted.length; i++) {
      final prev = DateTime.parse(sorted[i - 1]);
      final curr = DateTime.parse(sorted[i]);
      if (curr.difference(prev).inDays == 1) {
        current++;
      } else {
        if (current > longest) longest = current;
        current = 1;
      }
    }
    if (current > longest) longest = current;
    return longest;
  }

  String _dateKey(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  // ─── Trend Calculations ──────────────────────────────────────────────

  double _calculateTrend(List<VolumeDataPoint> data) {
    if (data.length < 2) return 0.0;
    final mid = (data.length / 2).ceil();
    final recent = data.sublist(mid);
    final previous = data.sublist(0, mid);
    final recentTotal = recent.fold<double>(0, (s, d) => s + d.volume);
    final previousTotal = previous.fold<double>(0, (s, d) => s + d.volume);
    if (previousTotal == 0) return 0.0;
    return ((recentTotal - previousTotal) / previousTotal) * 100;
  }

  // ─── Default widgets ──────────────────────────────────────────────

  List<WidgetConfigItem> _defaultWidgets() {
    const defaultTypes = [
      'workoutsPerWeek',
      'consistency',
      'volumeProgression',
      'muscleFocus',
      'prs',
      'heatMap',
      'weightHistory',
    ];
    const availableTypes = [
      'goal',
      'insights',
      'exerciseProgress',
      'recovery',
    ];

    return [
      for (int i = 0; i < defaultTypes.length; i++)
        WidgetConfigItem(
          id: 'default_${defaultTypes[i]}',
          type: defaultTypes[i],
          isVisible: true,
          order: i,
        ),
      for (int i = 0; i < availableTypes.length; i++)
        WidgetConfigItem(
          id: 'default_${availableTypes[i]}',
          type: availableTypes[i],
          isVisible: false,
          order: defaultTypes.length + i,
        ),
    ];
  }

  // ─── Lifecycle ──────────────────────────────────────────────

  @override
  Future<void> close() async {
    await _eventSub?.cancel();
    await super.close();
  }
}
      