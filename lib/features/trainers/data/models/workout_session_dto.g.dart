// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_session_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkoutSessionDto _$WorkoutSessionDtoFromJson(Map<String, dynamic> json) =>
    _WorkoutSessionDto(
      id: json['id'] as String,
      clientId: json['clientId'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String?,
      status: json['status'] as String?,
      name: json['name'] as String?,
      notes: json['notes'] as String?,
      restStartedAt: json['restStartedAt'] as String?,
      workoutTemplateId: json['workoutTemplateId'] as String?,
      clientPackageId: json['clientPackageId'] as String?,
      isTrainerLed: json['isTrainerLed'] as bool? ?? false,
      exerciseLogs: (json['exerciseLogs'] as List<dynamic>?)
          ?.map((e) => ExerciseLogDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WorkoutSessionDtoToJson(_WorkoutSessionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clientId': instance.clientId,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'status': instance.status,
      'name': instance.name,
      'notes': instance.notes,
      'restStartedAt': instance.restStartedAt,
      'workoutTemplateId': instance.workoutTemplateId,
      'clientPackageId': instance.clientPackageId,
      'isTrainerLed': instance.isTrainerLed,
      'exerciseLogs': instance.exerciseLogs,
    };
