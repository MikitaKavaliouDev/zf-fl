// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_assessment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainerAssessmentDto _$TrainerAssessmentDtoFromJson(
  Map<String, dynamic> json,
) => _TrainerAssessmentDto(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  unit: json['unit'] as String,
  trainerId: json['trainerId'] as String?,
  createdAt: json['createdAt'] as String,
);

Map<String, dynamic> _$TrainerAssessmentDtoToJson(
  _TrainerAssessmentDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'unit': instance.unit,
  'trainerId': instance.trainerId,
  'createdAt': instance.createdAt,
};
