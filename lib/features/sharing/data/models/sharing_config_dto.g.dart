// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sharing_config_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SharingSettings _$SharingSettingsFromJson(Map<String, dynamic> json) =>
    _SharingSettings(
      workouts: json['workouts'] as bool? ?? true,
      measurements: json['measurements'] as bool? ?? true,
      photos: json['photos'] as bool? ?? true,
      checkins: json['checkins'] as bool? ?? true,
    );

Map<String, dynamic> _$SharingSettingsToJson(_SharingSettings instance) =>
    <String, dynamic>{
      'workouts': instance.workouts,
      'measurements': instance.measurements,
      'photos': instance.photos,
      'checkins': instance.checkins,
    };

_SharingConfigDto _$SharingConfigDtoFromJson(Map<String, dynamic> json) =>
    _SharingConfigDto(
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
      duration: json['duration'] as String? ?? 'forever',
      settings: json['settings'] == null
          ? const SharingSettings()
          : SharingSettings.fromJson(json['settings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SharingConfigDtoToJson(_SharingConfigDto instance) =>
    <String, dynamic>{
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'duration': instance.duration,
      'settings': instance.settings,
    };
