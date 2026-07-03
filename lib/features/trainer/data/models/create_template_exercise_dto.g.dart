// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_template_exercise_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateTemplateExerciseDto _$CreateTemplateExerciseDtoFromJson(
  Map<String, dynamic> json,
) => _CreateTemplateExerciseDto(
  exerciseId: json['exerciseId'] as String,
  targetReps: json['targetReps'] as String?,
  targetSets: (json['targetSets'] as num?)?.toInt(),
  durationSeconds: (json['durationSeconds'] as num?)?.toInt(),
  notes: json['notes'] as String?,
  order: (json['order'] as num?)?.toInt(),
);

Map<String, dynamic> _$CreateTemplateExerciseDtoToJson(
  _CreateTemplateExerciseDto instance,
) => <String, dynamic>{
  'exerciseId': instance.exerciseId,
  'targetReps': instance.targetReps,
  'targetSets': instance.targetSets,
  'durationSeconds': instance.durationSeconds,
  'notes': instance.notes,
  'order': instance.order,
};
