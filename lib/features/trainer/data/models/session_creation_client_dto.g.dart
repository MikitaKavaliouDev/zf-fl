// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_creation_client_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionCreationClientDto _$SessionCreationClientDtoFromJson(
  Map<String, dynamic> json,
) => _SessionCreationClientDto(
  id: json['id'] as String,
  name: json['name'] as String,
  availableCredits: (json['availableCredits'] as num).toInt(),
);

Map<String, dynamic> _$SessionCreationClientDtoToJson(
  _SessionCreationClientDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'availableCredits': instance.availableCredits,
};
