import 'package:injectable/injectable.dart';

import 'analytics_api_service.dart';
import 'exercise_progress_api_service.dart';
import 'models/analytics_response_dto.dart';
import 'models/progress_response_dto.dart';
import 'models/widget_config_dto.dart';

@singleton
class AnalyticsRepository {
  final AnalyticsApiService _api;
  final ExerciseProgressApiService _exerciseStatsApi;

  AnalyticsRepository(this._api, this._exerciseStatsApi);

  Future<AnalyticsResponseDto> getAnalytics() => _api.getAnalytics();

  Future<ProgressResponseDto> getProgress() => _api.getProgress();

  Future<WidgetConfigDto> getWidgetConfig() => _api.getWidgetConfig();

  Future<WidgetConfigDto> updateWidgetConfig(WidgetConfigDto config) =>
      _api.updateWidgetConfig(config);

  /// Fetch per-exercise stats history.
  Future<Map<String, dynamic>> getExerciseStats({
    required String exerciseId,
    String metric = 'e1rm',
  }) =>
      _exerciseStatsApi.getExerciseStats(
        exerciseId: exerciseId,
        metric: metric,
      );
}
