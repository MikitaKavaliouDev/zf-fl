// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_check_in_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RequestCheckInDto _$RequestCheckInDtoFromJson(Map<String, dynamic> json) =>
    _RequestCheckInDto(
      clientId: json['clientId'] as String,
      checkInType: json['checkInType'] as String,
      dueDate: json['dueDate'] as String,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$RequestCheckInDtoToJson(_RequestCheckInDto instance) =>
    <String, dynamic>{
      'clientId': instance.clientId,
      'checkInType': instance.checkInType,
      'dueDate': instance.dueDate,
      'message': instance.message,
    };
