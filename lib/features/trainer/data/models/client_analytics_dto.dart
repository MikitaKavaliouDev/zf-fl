import 'package:freezed_annotation/freezed_annotation.dart';

import 'muscle_distribution_item_dto.dart';
import 'recent_pr_item_dto.dart';
import 'volume_history_item_dto.dart';

part 'client_analytics_dto.freezed.dart';
part 'client_analytics_dto.g.dart';

@freezed
abstract class ClientAnalyticsDto with _$ClientAnalyticsDto {
  const factory ClientAnalyticsDto({
    @Default(<String>[]) List<String> heatmapDates,
    @Default(<VolumeHistoryItemDto>[]) List<VolumeHistoryItemDto> volumeHistory,
    @Default(<MuscleDistributionItemDto>[]) List<MuscleDistributionItemDto> muscleDistribution,
    @Default(<RecentPrItemDto>[]) List<RecentPrItemDto> recentPRs,
    @Default(0.0) double consistency,
  }) = _ClientAnalyticsDto;

  factory ClientAnalyticsDto.fromJson(Map<String, dynamic> json) =>
      _$ClientAnalyticsDtoFromJson(json);
}
