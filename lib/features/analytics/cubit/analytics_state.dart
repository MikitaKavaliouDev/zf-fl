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
  }) = AnalyticsLoaded;

  const factory AnalyticsState.error(String message) = AnalyticsError;
}
