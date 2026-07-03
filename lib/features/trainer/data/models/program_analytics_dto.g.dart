// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_analytics_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProgramAnalyticsDto _$ProgramAnalyticsDtoFromJson(Map<String, dynamic> json) =>
    _ProgramAnalyticsDto(
      completionRate: (json['completionRate'] as num).toDouble(),
      totalSessions: (json['totalSessions'] as num).toInt(),
      completedSessions: (json['completedSessions'] as num).toInt(),
      activeClients: (json['activeClients'] as num).toInt(),
      targetFrequency: json['targetFrequency'] as String,
      averageProgress: (json['averageProgress'] as num).toDouble(),
    );

Map<String, dynamic> _$ProgramAnalyticsDtoToJson(
  _ProgramAnalyticsDto instance,
) => <String, dynamic>{
  'completionRate': instance.completionRate,
  'totalSessions': instance.totalSessions,
  'completedSessions': instance.completedSessions,
  'activeClients': instance.activeClients,
  'targetFrequency': instance.targetFrequency,
  'averageProgress': instance.averageProgress,
};
