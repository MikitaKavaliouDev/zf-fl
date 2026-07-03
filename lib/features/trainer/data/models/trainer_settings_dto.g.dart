// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_settings_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainerSettingsDto _$TrainerSettingsDtoFromJson(Map<String, dynamic> json) =>
    _TrainerSettingsDto(
      defaultCheckInDay: (json['defaultCheckInDay'] as num).toInt(),
      defaultCheckInHour: (json['defaultCheckInHour'] as num).toInt(),
    );

Map<String, dynamic> _$TrainerSettingsDtoToJson(_TrainerSettingsDto instance) =>
    <String, dynamic>{
      'defaultCheckInDay': instance.defaultCheckInDay,
      'defaultCheckInHour': instance.defaultCheckInHour,
    };
