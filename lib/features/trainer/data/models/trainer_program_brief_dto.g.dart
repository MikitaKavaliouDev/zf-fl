// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_program_brief_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainerProgramBriefDto _$TrainerProgramBriefDtoFromJson(
  Map<String, dynamic> json,
) => _TrainerProgramBriefDto(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  trainerId: json['trainerId'] as String?,
  category: json['category'] as String?,
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String?,
  templates:
      (json['templates'] as List<dynamic>?)
          ?.map(
            (e) =>
                TrainerTemplateSummaryDto.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$TrainerProgramBriefDtoToJson(
  _TrainerProgramBriefDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'trainerId': instance.trainerId,
  'category': instance.category,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'templates': instance.templates,
};
