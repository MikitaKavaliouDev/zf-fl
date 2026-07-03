// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_client_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateClientRequestDto _$UpdateClientRequestDtoFromJson(
  Map<String, dynamic> json,
) => _UpdateClientRequestDto(
  name: json['name'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  status: json['status'] as String?,
  checkInDay: (json['checkInDay'] as num?)?.toInt(),
  checkInHour: (json['checkInHour'] as num?)?.toInt(),
);

Map<String, dynamic> _$UpdateClientRequestDtoToJson(
  _UpdateClientRequestDto instance,
) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'status': instance.status,
  'checkInDay': instance.checkInDay,
  'checkInHour': instance.checkInHour,
};
