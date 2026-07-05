// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_client_session_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainerClientSessionDto _$TrainerClientSessionDtoFromJson(
  Map<String, dynamic> json,
) => _TrainerClientSessionDto(
  id: json['id'] as String,
  clientId: json['clientId'] as String,
  name: json['name'] as String? ?? '',
  startTime: json['startTime'] as String,
  endTime: json['endTime'] as String?,
  status: json['status'] as String,
  notes: json['notes'] as String?,
  isTrainerLed: json['isTrainerLed'] as bool?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  exerciseLogs: json['exerciseLogs'] == null
      ? []
      : _exerciseLogsFromJson(json['exerciseLogs'] as List?),
);

Map<String, dynamic> _$TrainerClientSessionDtoToJson(
  _TrainerClientSessionDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'clientId': instance.clientId,
  'name': instance.name,
  'startTime': instance.startTime,
  'endTime': instance.endTime,
  'status': instance.status,
  'notes': instance.notes,
  'isTrainerLed': instance.isTrainerLed,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};
