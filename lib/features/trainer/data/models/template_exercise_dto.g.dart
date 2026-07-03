// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_exercise_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TemplateExerciseDto _$TemplateExerciseDtoFromJson(Map<String, dynamic> json) =>
    _TemplateExerciseDto(
      id: json['id'] as String,
      type: json['type'] as String? ?? 'EXERCISE',
      exerciseId: json['exerciseId'] as String?,
      targetReps: json['targetReps'] as String?,
      targetSets: (json['targetSets'] as num?)?.toInt(),
      durationSeconds: (json['durationSeconds'] as num?)?.toInt(),
      tempo: json['tempo'] as String?,
      enableRpe: json['enableRpe'] as bool?,
      notes: json['notes'] as String?,
      videoUrl: json['videoUrl'] as String?,
      supersetGroupId: json['supersetGroupId'] as String?,
      supersetOrder: (json['supersetOrder'] as num?)?.toInt(),
      exerciseCategory: json['exerciseCategory'] as String?,
      exercise: json['exercise'] == null
          ? null
          : TemplateExerciseRefDto.fromJson(
              json['exercise'] as Map<String, dynamic>,
            ),
      order: (json['order'] as num?)?.toInt(),
      templateId: json['templateId'] as String?,
    );

Map<String, dynamic> _$TemplateExerciseDtoToJson(
  _TemplateExerciseDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'exerciseId': instance.exerciseId,
  'targetReps': instance.targetReps,
  'targetSets': instance.targetSets,
  'durationSeconds': instance.durationSeconds,
  'tempo': instance.tempo,
  'enableRpe': instance.enableRpe,
  'notes': instance.notes,
  'videoUrl': instance.videoUrl,
  'supersetGroupId': instance.supersetGroupId,
  'supersetOrder': instance.supersetOrder,
  'exerciseCategory': instance.exerciseCategory,
  'exercise': instance.exercise,
  'order': instance.order,
  'templateId': instance.templateId,
};
