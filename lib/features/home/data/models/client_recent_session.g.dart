// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_recent_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClientRecentSession _$ClientRecentSessionFromJson(Map<String, dynamic> json) =>
    _ClientRecentSession(
      id: json['id'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
      status: json['status'] as String,
      name: json['name'] as String,
      volume: (json['volume'] as num?)?.toDouble(),
      totalVolume: (json['totalVolume'] as num?)?.toDouble(),
      durationSeconds: (json['durationSeconds'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ClientRecentSessionToJson(
  _ClientRecentSession instance,
) => <String, dynamic>{
  'id': instance.id,
  'startTime': instance.startTime.toIso8601String(),
  'endTime': instance.endTime?.toIso8601String(),
  'status': instance.status,
  'name': instance.name,
  'volume': instance.volume,
  'totalVolume': instance.totalVolume,
  'durationSeconds': instance.durationSeconds,
};
