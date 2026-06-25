// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_in_config_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CheckInConfigDto _$CheckInConfigDtoFromJson(Map<String, dynamic> json) =>
    _CheckInConfigDto(
      checkInDay: (json['checkInDay'] as num).toInt(),
      checkInHour: (json['checkInHour'] as num).toInt(),
      nextCheckInDueAt: json['nextCheckInDueAt'] as String,
    );

Map<String, dynamic> _$CheckInConfigDtoToJson(_CheckInConfigDto instance) =>
    <String, dynamic>{
      'checkInDay': instance.checkInDay,
      'checkInHour': instance.checkInHour,
      'nextCheckInDueAt': instance.nextCheckInDueAt,
    };
