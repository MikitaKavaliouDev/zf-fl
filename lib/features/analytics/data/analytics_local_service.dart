import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:ziro_fit/core/database/app_database.dart';

import 'models/analytics_response_dto.dart';
import 'models/progress_response_dto.dart';
import 'models/widget_config_dto.dart';

/// Local cache and offline computation for analytics data.
///
/// Caches API responses as JSON in Drift's `AnalyticsCache` table so the
/// dashboard renders instantly on subsequent loads and works offline.
///
/// When the device is offline after a workout, [computeAnalyticsLocally]
/// re-derives analytics from locally synced workout data using the same
/// logic as the backend `/api/client/analytics` endpoint.
@singleton
class AnalyticsLocalService {
  final AppDatabase _db;

  AnalyticsLocalService(this._db);

  // ──────────────────────────────────────────────────────────────
  // Cache read/write
  // ──────────────────────────────────────────────────────────────

  static const _keyAnalytics = 'analytics';
  static const _keyProgress = 'progress';
  static const _keyWidgets = 'widgetConfig';

  Future<void> cacheAnalytics(AnalyticsResponseDto data) =>
      _put(_keyAnalytics, data.toJson());

  Future<AnalyticsResponseDto?> cachedAnalytics() async {
    final json = await _get(_keyAnalytics);
    if (json == null) return null;
    try {
      return AnalyticsResponseDto.fromJson(json);
    } catch (e) {
      debugPrint('AnalyticsLocalService: failed to parse cached analytics: $e');
      return null;
    }
  }

  Future<void> cacheProgress(ProgressResponseDto data) =>
      _put(_keyProgress, data.toJson());

  Future<ProgressResponseDto?> cachedProgress() async {
    final json = await _get(_keyProgress);
    if (json == null) return null;
    try {
      return ProgressResponseDto.fromJson(json);
    } catch (e) {
      debugPrint('AnalyticsLocalService: failed to parse cached progress: $e');
      return null;
    }
  }

  Future<void> cacheWidgetConfig(WidgetConfigDto data) =>
      _put(_keyWidgets, data.toJson());

  Future<WidgetConfigDto?> cachedWidgetConfig() async {
    final json = await _get(_keyWidgets);
    if (json == null) return null;
    try {
      return WidgetConfigDto.fromJson(json);
    } catch (e) {
      debugPrint('AnalyticsLocalService: failed to parse cached widgets: $e');
      return null;
    }
  }

  /// Remove all analytics cache entries (force fresh fetch next time).
  Future<void> invalidateAll() async {
    await (_db.delete(_db.analyticsCache)).go();
  }

  // ──────────────────────────────────────────────────────────────
  // Offline local computation (mirrors backend /api/client/analytics)
  // ──────────────────────────────────────────────────────────────

  /// Compute analytics entirely from local Drift data.
  /// Used when the device is offline and a workout was just completed.
  Future<AnalyticsResponseDto> computeAnalyticsLocally() async {
    final now = DateTime.now();
    final sixMonthsAgo = now.subtract(const Duration(days: 180));
    final sixMonthsAgoMs = sixMonthsAgo.millisecondsSinceEpoch;
    final thirtyDaysAgoMs = now
        .subtract(const Duration(days: 30))
        .millisecondsSinceEpoch;

    // 1. Fetch completed sessions from last 6 months
    final sessions = await (_db.select(_db.workoutSessionsTable)
          ..where((t) =>
              t.status.equals('COMPLETED') &
              t.startTime.isBiggerThan(Constant(sixMonthsAgoMs)))
          ..orderBy([(t) => OrderingTerm(expression: t.startTime)]))
        .get();

    final sessionIds = sessions.map((s) => s.id).toList();

    // 2. Fetch exercise logs for these sessions
    final logs = sessionIds.isNotEmpty
        ? await (_db.select(_db.clientExerciseLogs)
              ..where((t) => t.workoutSessionId.isIn(sessionIds)))
            .get()
        : <ClientExerciseLogEntity>[];

    // Group logs by session
    final logMap = <String, List<ClientExerciseLogEntity>>{};
    for (final log in logs) {
      logMap.putIfAbsent(log.workoutSessionId, () => []).add(log);
    }

    // 3. Compute heatmap dates
    final heatmapDates = sessions
        .map((s) =>
            DateTime.fromMillisecondsSinceEpoch(s.startTime)
                .toIso8601String()
                .split('T')[0])
        .toList();

    // 4. Compute volume history & muscle distribution
    final volumeHistory = <VolumeDataPoint>[];

    for (final session in sessions) {
      final sessionLogs = logMap[session.id] ?? [];
      double sessionVolume = 0;

      for (final log in sessionLogs) {
        final vol = (log.weight ?? 0).toDouble() * (log.reps ?? 0).toDouble();
        sessionVolume += vol;
        // Note: muscle group is not stored in local exercise_logs table;
        // we skip muscle distribution in offline computation.
      }

      volumeHistory.add(VolumeDataPoint(
        date: DateTime.fromMillisecondsSinceEpoch(session.startTime)
            .toIso8601String()
            .split('T')[0],
        volume: sessionVolume,
      ));
    }

    // 5. Consistency (unique workout days in last 30 days)
    final last30SessionDates = sessions
        .where((s) => s.startTime >= thirtyDaysAgoMs)
        .map((s) => DateTime.fromMillisecondsSinceEpoch(s.startTime)
            .toIso8601String()
            .split('T')[0])
        .toSet();
    final consistency =
        ((last30SessionDates.length / 30) * 100).clamp(0, 100).roundToDouble();

    // 6. Muscle distribution — requires exercise data which may or may not
    //    be synced locally. We return what we can compute.
    final muscleDistribution = <MuscleDataPoint>[];

    return AnalyticsResponseDto(
      heatmapDates: heatmapDates,
      volumeHistory: volumeHistory,
      muscleDistribution: muscleDistribution,
      recentPRs: <PRDataPoint>[], // PRs not in sync tables yet
      consistency: consistency,
    );
  }

  /// Compute progress metrics from local Drift data.
  Future<ProgressResponseDto> computeProgressLocally() async {
    // Weight & body fat from ClientMeasurements
    final measurements = await (_db.select(_db.clientMeasurements)
          ..orderBy(
              [(t) => OrderingTerm(expression: t.measurementDate)]))
        .get();

    final weight = measurements
        .where((m) => m.weightKg != null)
        .map((m) => DataPoint(
              date: DateTime.fromMillisecondsSinceEpoch(m.measurementDate)
                  .toIso8601String(),
              value: m.weightKg!,
            ))
        .toList();

    final bodyFat = measurements
        .where((m) => m.bodyFatPercentage != null)
        .map((m) => DataPoint(
              date: DateTime.fromMillisecondsSinceEpoch(m.measurementDate)
                  .toIso8601String(),
              value: m.bodyFatPercentage!,
            ))
        .toList();

    // Volume — recompute from local sessions
    final sixMonthsAgoMs = DateTime.now()
        .subtract(const Duration(days: 180))
        .millisecondsSinceEpoch;
    final sessions = await (_db.select(_db.workoutSessionsTable)
          ..where((t) =>
              t.status.equals('COMPLETED') &
              t.startTime.isBiggerThan(Constant(sixMonthsAgoMs))))
        .get();
    final sessionIds = sessions.map((s) => s.id).toList();
    final logs = sessionIds.isNotEmpty
        ? await (_db.select(_db.clientExerciseLogs)
              ..where((t) => t.workoutSessionId.isIn(sessionIds)))
            .get()
        : <ClientExerciseLogEntity>[];

    final logMap = <String, List<ClientExerciseLogEntity>>{};
    for (final log in logs) {
      logMap.putIfAbsent(log.workoutSessionId, () => []).add(log);
    }

    final volume = sessions.map((s) {
      final sessionLogs = logMap[s.id] ?? [];
      final vol = sessionLogs.fold<double>(
          0, (sum, l) => sum + (l.weight ?? 0) * (l.reps ?? 0));
      return DataPoint(
        date: DateTime.fromMillisecondsSinceEpoch(s.startTime)
            .toIso8601String(),
        value: vol,
      );
    }).toList();

    // Exercise performance — compute from logs grouped by exerciseId
    final exerciseGroups = <String, List<ClientExerciseLogEntity>>{};
    for (final log in logs) {
      exerciseGroups.putIfAbsent(log.exerciseId, () => []).add(log);
    }

    final exercisePerformance = exerciseGroups.entries.map((e) {
      final logs = e.value;
      final dates = logs
          .map((l) => DateTime.fromMillisecondsSinceEpoch(l.createdAt))
          .toList();
      dates.sort();
      return ExercisePerformanceDto(
        exerciseId: e.key,
        exerciseName: e.key, // name not available from local table
        maxWeight: logs
            .where((l) => l.weight != null)
            .fold<double>(0, (max, l) => l.weight! > max ? l.weight! : max),
        maxReps: logs
            .where((l) => l.reps != null)
            .fold<double>(0.0, (max, l) => (l.reps!).toDouble() > max ? (l.reps!).toDouble() : max),
        maxVolume: logs.fold<double>(
            0,
            (max, l) =>
                ((l.weight ?? 0) * (l.reps ?? 0)) > max
                    ? (l.weight ?? 0) * (l.reps ?? 0)
                    : max),
        lastPerformed: dates.isNotEmpty
            ? dates.last.toIso8601String()
            : null,
      );
    }).toList();

    // Favorite exercises — by frequency
    final freqMap = <String, int>{};
    for (final log in logs) {
      freqMap[log.exerciseId] = (freqMap[log.exerciseId] ?? 0) + 1;
    }
    final sorted = freqMap.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    final favoriteExercises = sorted.take(5).map((e) => FavoriteExerciseDto(
          exerciseId: e.key,
          exerciseName: e.key,
          frequency: e.value,
        )).toList();

    return ProgressResponseDto(
      weight: weight,
      bodyFat: bodyFat,
      volume: volume,
      exercisePerformance: exercisePerformance,
      favoriteExercises: favoriteExercises,
      worstPerformingExercises: <WorstPerformingExerciseDto>[],
    );
  }

  // ──────────────────────────────────────────────────────────────
  // Internals
  // ──────────────────────────────────────────────────────────────

  Future<void> _put(String key, Map<String, dynamic> json) async {
    await (_db.into(_db.analyticsCache).insertOnConflictUpdate(
          AnalyticsCacheCompanion(
            key: Value(key),
            value: Value(jsonEncode(json)),
            updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
          ),
        ));
  }

  Future<Map<String, dynamic>?> _get(String key) async {
    final row = await (_db.select(_db.analyticsCache)
          ..where((t) => t.key.equals(key)))
        .getSingleOrNull();
    if (row == null) return null;
    try {
      return jsonDecode(row.value) as Map<String, dynamic>;
    } catch (_) {
      return null;
    }
  }
}
