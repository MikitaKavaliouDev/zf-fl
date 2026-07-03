// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_analytics_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClientAnalyticsDto _$ClientAnalyticsDtoFromJson(
  Map<String, dynamic> json,
) => _ClientAnalyticsDto(
  heatmapDates:
      (json['heatmapDates'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  volumeHistory:
      (json['volumeHistory'] as List<dynamic>?)
          ?.map((e) => VolumeHistoryItemDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <VolumeHistoryItemDto>[],
  muscleDistribution:
      (json['muscleDistribution'] as List<dynamic>?)
          ?.map(
            (e) =>
                MuscleDistributionItemDto.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <MuscleDistributionItemDto>[],
  recentPRs:
      (json['recentPRs'] as List<dynamic>?)
          ?.map((e) => RecentPrItemDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <RecentPrItemDto>[],
  consistency: (json['consistency'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$ClientAnalyticsDtoToJson(_ClientAnalyticsDto instance) =>
    <String, dynamic>{
      'heatmapDates': instance.heatmapDates,
      'volumeHistory': instance.volumeHistory,
      'muscleDistribution': instance.muscleDistribution,
      'recentPRs': instance.recentPRs,
      'consistency': instance.consistency,
    };
