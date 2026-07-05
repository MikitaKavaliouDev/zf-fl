// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_client_program_template_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainerClientProgramTemplateDto _$TrainerClientProgramTemplateDtoFromJson(
  Map<String, dynamic> json,
) => _TrainerClientProgramTemplateDto(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  order: (json['order'] as num?)?.toInt() ?? 0,
  status: json['status'] as String? ?? 'PENDING',
  exerciseCount: (json['exerciseCount'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$TrainerClientProgramTemplateDtoToJson(
  _TrainerClientProgramTemplateDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'order': instance.order,
  'status': instance.status,
  'exerciseCount': instance.exerciseCount,
};
