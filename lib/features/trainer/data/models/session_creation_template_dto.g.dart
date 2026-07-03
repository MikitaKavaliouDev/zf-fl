// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_creation_template_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionCreationTemplateDto _$SessionCreationTemplateDtoFromJson(
  Map<String, dynamic> json,
) => _SessionCreationTemplateDto(
  id: json['id'] as String,
  name: json['name'] as String,
  program: SessionCreationProgramRefDto.fromJson(
    json['program'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$SessionCreationTemplateDtoToJson(
  _SessionCreationTemplateDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'program': instance.program,
};
