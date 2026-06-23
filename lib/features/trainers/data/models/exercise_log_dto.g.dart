// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_log_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExerciseLogDto _$ExerciseLogDtoFromJson(Map<String, dynamic> json) =>
    _ExerciseLogDto(
      id: json['id'] as String,
      clientId: json['clientId'] as String,
      exerciseId: json['exerciseId'] as String,
      reps: (json['reps'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toDouble(),
      isCompleted: json['isCompleted'] as bool? ?? false,
      order: (json['order'] as num?)?.toInt(),
      tempo: json['tempo'] as String?,
      notes: json['notes'] as String?,
      rpe: (json['rpe'] as num?)?.toInt(),
      side: json['side'] as String? ?? 'BOTH',
      workoutSessionId: json['workoutSessionId'] as String,
      supersetKey: json['supersetKey'] as String?,
      orderInSuperset: (json['orderInSuperset'] as num?)?.toInt(),
      exercise: json['exercise'] == null
          ? null
          : ExerciseDto.fromJson(json['exercise'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExerciseLogDtoToJson(_ExerciseLogDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clientId': instance.clientId,
      'exerciseId': instance.exerciseId,
      'reps': instance.reps,
      'weight': instance.weight,
      'isCompleted': instance.isCompleted,
      'order': instance.order,
      'tempo': instance.tempo,
      'notes': instance.notes,
      'rpe': instance.rpe,
      'side': instance.side,
      'workoutSessionId': instance.workoutSessionId,
      'supersetKey': instance.supersetKey,
      'orderInSuperset': instance.orderInSuperset,
      'exercise': instance.exercise,
    };
