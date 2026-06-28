// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TemplateDto _$TemplateDtoFromJson(Map<String, dynamic> json) => _TemplateDto(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  exercises:
      (json['exercises'] as List<dynamic>?)
          ?.map((e) => TemplateExerciseDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <TemplateExerciseDto>[],
  exerciseCount: (json['exerciseCount'] as num?)?.toInt() ?? 0,
  programId: json['programId'] as String?,
  order: (json['order'] as num?)?.toInt() ?? 0,
  category: json['category'] as String?,
  source: json['source'] as String?,
  programName: json['programName'] as String?,
);

Map<String, dynamic> _$TemplateDtoToJson(_TemplateDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'exercises': instance.exercises,
      'exerciseCount': instance.exerciseCount,
      'programId': instance.programId,
      'order': instance.order,
      'category': instance.category,
      'source': instance.source,
      'programName': instance.programName,
    };

_TemplateExerciseDto _$TemplateExerciseDtoFromJson(Map<String, dynamic> json) =>
    _TemplateExerciseDto(
      id: json['id'] as String,
      order: (json['order'] as num?)?.toInt() ?? 0,
      exerciseId: json['exerciseId'] as String?,
      type: json['type'] as String?,
      targetReps: json['targetReps'] as String?,
      targetSets: (json['targetSets'] as num?)?.toInt(),
      durationSeconds: (json['durationSeconds'] as num?)?.toInt(),
      notes: json['notes'] as String?,
      exercise: json['exercise'] == null
          ? null
          : ExerciseDto.fromJson(json['exercise'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TemplateExerciseDtoToJson(
  _TemplateExerciseDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'order': instance.order,
  'exerciseId': instance.exerciseId,
  'type': instance.type,
  'targetReps': instance.targetReps,
  'targetSets': instance.targetSets,
  'durationSeconds': instance.durationSeconds,
  'notes': instance.notes,
  'exercise': instance.exercise,
};
