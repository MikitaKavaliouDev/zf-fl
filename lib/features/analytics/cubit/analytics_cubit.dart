import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ziro_fit/core/di/injection.dart';
import 'package:ziro_fit/core/events/event_bus.dart';

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

@injectable
class AnalyticsCubit extends Cubit<AnalyticsState> {
  final AnalyticsRepository _repository;
  StreamSubscription<AppEvent>? _eventSub;

  AnalyticsCubit(this._repository) : super(const AnalyticsState.initial()) {
    _eventSub = getIt<EventBus>().on<AppEvent>().listen((event) {
      if (event is WorkoutCompletedEvent || event is CheckInSubmittedEvent) {
        loadData();
      }
    });
  }

  // ── Streak Calculations ──

  /// Count consecutive workout days going backwards from [fromDate].
  int _calculateCurrentStreak(Set<String> dateSet, DateTime fromDate) {
    int streak = 0;
    var date = fromDate;
    while (true) {
      final key = _dateKey(date);
      if (dateSet.contains(key)) {
        streak++;
        date = date.subtract(const Duration(days: 1));
      } else {
        // If today is not a workout day, check if yesterday had one.
        if (streak == 0) {
          date = date.subtract(const Duration(days: 1));
          continue;
        }
        break;
      }
    }
    return streak;
  }

  /// Find the longest consecutive streak in [dateSet].
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

  // ── Trend Calculations ──

  /// Compute trend as the percent change of the [recent] half vs the [previous]
  /// half of [data]. Returns 0 if previous is empty or zero.
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

  /// Fetch analytics, progress, and widget config in parallel.
  Future<void> loadData() async {
    emit(const AnalyticsState.loading());
    try {
      final results = await Future.wait([
        _repository.getAnalytics(),
        _repository.getProgress(),
        _repository.getWidgetConfig(),
      ]);
      final analytics = results[0] as AnalyticsResponseDto;
      final progress = results[1] as ProgressResponseDto;
      var widgets = results[2] as WidgetConfigDto;

      // If the API returned an empty widget config (no seed data),
      // use sensible defaults so the dashboard isn't blank.
      if (widgets.widgets.isEmpty) {
        widgets = WidgetConfigDto(widgets: _defaultWidgets());
      }

      // Streak calculations
      final dateSet = analytics.heatmapDates.toSet();
      final now = DateTime.now();
      final currentStreak = _calculateCurrentStreak(dateSet, now);
      final longestStreak = _calculateLongestStreak(dateSet);

      // Trend calculations
      final volumeHistory = analytics.volumeHistory;
      final volumeTrend = _calculateTrend(volumeHistory);

      // Frequency trend: workouts per week
      final mid = (volumeHistory.length / 2).ceil();
      final recentHalf =
          volumeHistory.length >= 2 ? volumeHistory.sublist(mid) : <VolumeDataPoint>[];
      final previousHalf =
          volumeHistory.length >= 2
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

      // Average volume per session trend
      final recentAvgVol = recentHalf.isNotEmpty
          ? recentHalf.fold<double>(0, (s, d) => s + d.volume) / recentHalf.length
          : 0.0;
      final previousAvgVol = previousHalf.isNotEmpty
          ? previousHalf.fold<double>(0, (s, d) => s + d.volume) / previousHalf.length
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
        // consistencyTrend uses default 0.0 — between-API diff not available yet
        frequencyTrend: frequencyTrend,
        averageVolumeTrend: averageVolumeTrend,
      ));
    } catch (e, stack) {
      developer.log(
        'AnalyticsCubit.loadData failed: $e',
        name: 'analytics',
        error: e,
        stackTrace: stack,
      );
      emit(const AnalyticsState.error('Failed to load analytics data.'));
    }
  }

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
    final widgets = [...s.widgets.widgets];
    final item = widgets.removeAt(oldIndex);
    widgets.insert(newIndex, item);
    final reordered = widgets.asMap().entries.map((e) {
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
      // The API returns { points: [{ date, value }] } or similar list key
      final List<dynamic>? points = (raw['points'] ?? raw['dataPoints'] ?? raw['data']) as List<dynamic>?;
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

  /// Reload all data.
  Future<void> refresh() => loadData();

  /// Returns a sensible default widget set when the API has no config.
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

  @override
  Future<void> close() async {
    await _eventSub?.cancel();
    await super.close();
  }
}
