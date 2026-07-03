// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_exercise_ref_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TemplateExerciseRefDto _$TemplateExerciseRefDtoFromJson(
  Map<String, dynamic> json,
) => _TemplateExerciseRefDto(
  id: json['id'] as String,
  name: json['name'] as String,
  muscleGroup: json['muscleGroup'] as String?,
  equipment: json['equipment'] as String?,
  description: json['description'] as String?,
  videoUrl: json['videoUrl'] as String?,
);

Map<String, dynamic> _$TemplateExerciseRefDtoToJson(
  _TemplateExerciseRefDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'muscleGroup': instance.muscleGroup,
  'equipment': instance.equipment,
  'description': instance.description,
  'videoUrl': instance.videoUrl,
};
