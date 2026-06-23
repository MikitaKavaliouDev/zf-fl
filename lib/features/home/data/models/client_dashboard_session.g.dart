// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_dashboard_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClientDashboardSession _$ClientDashboardSessionFromJson(
  Map<String, dynamic> json,
) => _ClientDashboardSession(
  id: json['id'] as String,
  title: json['title'] as String,
  date: DateTime.parse(json['date'] as String),
  duration: (json['duration'] as num).toInt(),
  isTrainerAssigned: json['is_trainer_assigned'] as bool?,
);

Map<String, dynamic> _$ClientDashboardSessionToJson(
  _ClientDashboardSession instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'date': instance.date.toIso8601String(),
  'duration': instance.duration,
  'is_trainer_assigned': instance.isTrainerAssigned,
};
