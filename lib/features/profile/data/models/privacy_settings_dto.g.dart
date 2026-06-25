// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy_settings_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PrivacySettingsDto _$PrivacySettingsDtoFromJson(Map<String, dynamic> json) =>
    _PrivacySettingsDto(
      shareWorkoutHistory: json['shareWorkoutHistory'] as bool? ?? false,
      shareBodyMeasurements: json['shareBodyMeasurements'] as bool? ?? false,
      shareCheckinNotes: json['shareCheckinNotes'] as bool? ?? false,
      shareLocation: json['shareLocation'] as bool? ?? false,
      allowTrainerExport: json['allowTrainerExport'] as bool? ?? false,
      dataRetentionDays: (json['dataRetentionDays'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PrivacySettingsDtoToJson(_PrivacySettingsDto instance) =>
    <String, dynamic>{
      'shareWorkoutHistory': instance.shareWorkoutHistory,
      'shareBodyMeasurements': instance.shareBodyMeasurements,
      'shareCheckinNotes': instance.shareCheckinNotes,
      'shareLocation': instance.shareLocation,
      'allowTrainerExport': instance.allowTrainerExport,
      'dataRetentionDays': instance.dataRetentionDays,
    };
