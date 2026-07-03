// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_creation_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionCreationDataDto _$SessionCreationDataDtoFromJson(
  Map<String, dynamic> json,
) => _SessionCreationDataDto(
  clients: (json['clients'] as List<dynamic>)
      .map((e) => SessionCreationClientDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  templates: (json['templates'] as List<dynamic>)
      .map(
        (e) => SessionCreationTemplateDto.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$SessionCreationDataDtoToJson(
  _SessionCreationDataDto instance,
) => <String, dynamic>{
  'clients': instance.clients,
  'templates': instance.templates,
};
