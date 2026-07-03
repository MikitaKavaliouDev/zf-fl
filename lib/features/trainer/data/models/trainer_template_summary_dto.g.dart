// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_template_summary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainerTemplateSummaryDto _$TrainerTemplateSummaryDtoFromJson(
  Map<String, dynamic> json,
) => _TrainerTemplateSummaryDto(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  order: (json['order'] as num).toInt(),
  programId: json['programId'] as String?,
  exerciseCount: json['_count'] == null
      ? 0
      : countToExerciseCount(json['_count'] as Map<String, dynamic>?),
  exercises: json['exercises'] == null
      ? const []
      : exerciseListFromJson(json['exercises'] as List?),
);

Map<String, dynamic> _$TrainerTemplateSummaryDtoToJson(
  _TrainerTemplateSummaryDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'order': instance.order,
  'programId': instance.programId,
  '_count': instance.exerciseCount,
  'exercises': instance.exercises,
};
