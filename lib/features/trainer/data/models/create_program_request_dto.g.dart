// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_program_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateProgramRequestDto _$CreateProgramRequestDtoFromJson(
  Map<String, dynamic> json,
) => _CreateProgramRequestDto(
  name: json['name'] as String,
  description: json['description'] as String?,
);

Map<String, dynamic> _$CreateProgramRequestDtoToJson(
  _CreateProgramRequestDto instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
};
