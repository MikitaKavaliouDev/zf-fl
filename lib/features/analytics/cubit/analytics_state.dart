import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/analytics_response_dto.dart';
import '../data/models/progress_response_dto.dart';
import '../data/models/widget_config_dto.dart';

part 'analytics_state.freezed.dart';

@freezed
sealed class AnalyticsState with _$AnalyticsState {
  const factory AnalyticsState.initial() = AnalyticsInitial;

  const factory AnalyticsState.loading() = AnalyticsLoading;

  const factory AnalyticsState.loaded({
    required AnalyticsResponseDto analytics,
    required ProgressResponseDto progress,
    required WidgetConfigDto widgets,
    @Default(0) int currentStreak,
    @Default(0) int longestStreak,
    @Default(0.0) double volumeTrend,
    @Default(0.0) double consistencyTrend,
    @Default(0.0) double frequencyTrend,
    @Default(0.0) double averageVolumeTrend,
  }) = AnalyticsLoaded;

  const factory AnalyticsState.error(String message) = AnalyticsError;
}
