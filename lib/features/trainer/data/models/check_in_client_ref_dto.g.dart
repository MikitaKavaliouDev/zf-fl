// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_in_client_ref_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CheckInClientRefDto _$CheckInClientRefDtoFromJson(Map<String, dynamic> json) =>
    _CheckInClientRefDto(
      id: json['id'] as String,
      name: json['name'] as String,
      avatarPath: json['avatarPath'] as String?,
    );

Map<String, dynamic> _$CheckInClientRefDtoToJson(
  _CheckInClientRefDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'avatarPath': instance.avatarPath,
};
