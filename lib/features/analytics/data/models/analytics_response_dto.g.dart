// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnalyticsResponseDto _$AnalyticsResponseDtoFromJson(
  Map<String, dynamic> json,
) => _AnalyticsResponseDto(
  heatmapDates:
      (json['heatmapDates'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  volumeHistory:
      (json['volumeHistory'] as List<dynamic>?)
          ?.map((e) => VolumeDataPoint.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <VolumeDataPoint>[],
  muscleDistribution:
      (json['muscleDistribution'] as List<dynamic>?)
          ?.map((e) => MuscleDataPoint.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <MuscleDataPoint>[],
  recentPRs:
      (json['recentPRs'] as List<dynamic>?)
          ?.map((e) => PRDataPoint.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <PRDataPoint>[],
  consistency: (json['consistency'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$AnalyticsResponseDtoToJson(
  _AnalyticsResponseDto instance,
) => <String, dynamic>{
  'heatmapDates': instance.heatmapDates,
  'volumeHistory': instance.volumeHistory,
  'muscleDistribution': instance.muscleDistribution,
  'recentPRs': instance.recentPRs,
  'consistency': instance.consistency,
};

_VolumeDataPoint _$VolumeDataPointFromJson(Map<String, dynamic> json) =>
    _VolumeDataPoint(
      date: json['date'] as String,
      volume: (json['volume'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$VolumeDataPointToJson(_VolumeDataPoint instance) =>
    <String, dynamic>{'date': instance.date, 'volume': instance.volume};

_MuscleDataPoint _$MuscleDataPointFromJson(Map<String, dynamic> json) =>
    _MuscleDataPoint(
      muscle: json['muscle'] as String,
      count: (json['count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$MuscleDataPointToJson(_MuscleDataPoint instance) =>
    <String, dynamic>{'muscle': instance.muscle, 'count': instance.count};

_PRDataPoint _$PRDataPointFromJson(Map<String, dynamic> json) => _PRDataPoint(
  exercise: json['exercise'] as String,
  value: (json['value'] as num?)?.toDouble() ?? 0.0,
  type: json['type'] as String,
  date: json['date'] as String,
);

Map<String, dynamic> _$PRDataPointToJson(_PRDataPoint instance) =>
    <String, dynamic>{
      'exercise': instance.exercise,
      'value': instance.value,
      'type': instance.type,
      'date': instance.date,
    };
