// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voice_settings_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VoiceSettingsValues _$VoiceSettingsValuesFromJson(Map<String, dynamic> json) =>
    _VoiceSettingsValues(
      stability: (json['stability'] as num?)?.toDouble() ?? 0.5,
      similarityBoost: (json['similarityBoost'] as num?)?.toDouble() ?? 0.75,
      style: (json['style'] as num?)?.toDouble() ?? 0.0,
      useSpeakerBoost: json['useSpeakerBoost'] as bool? ?? true,
      speed: (json['speed'] as num?)?.toDouble() ?? 1.0,
    );

Map<String, dynamic> _$VoiceSettingsValuesToJson(
  _VoiceSettingsValues instance,
) => <String, dynamic>{
  'stability': instance.stability,
  'similarityBoost': instance.similarityBoost,
  'style': instance.style,
  'useSpeakerBoost': instance.useSpeakerBoost,
  'speed': instance.speed,
};

_VoiceSettingsResponseDto _$VoiceSettingsResponseDtoFromJson(
  Map<String, dynamic> json,
) => _VoiceSettingsResponseDto(
  voiceId: json['voiceId'] as String,
  settings: json['settings'] == null
      ? null
      : VoiceSettingsValues.fromJson(json['settings'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VoiceSettingsResponseDtoToJson(
  _VoiceSettingsResponseDto instance,
) => <String, dynamic>{
  'voiceId': instance.voiceId,
  'settings': instance.settings,
};

_VoiceDto _$VoiceDtoFromJson(Map<String, dynamic> json) => _VoiceDto(
  voiceId: json['voiceId'] as String,
  name: json['name'] as String,
  previewUrl: json['previewUrl'] as String?,
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  verifiedLanguages: (json['verifiedLanguages'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  description: json['description'] as String?,
  category: json['category'] as String?,
);

Map<String, dynamic> _$VoiceDtoToJson(_VoiceDto instance) => <String, dynamic>{
  'voiceId': instance.voiceId,
  'name': instance.name,
  'previewUrl': instance.previewUrl,
  'labels': instance.labels,
  'verifiedLanguages': instance.verifiedLanguages,
  'description': instance.description,
  'category': instance.category,
};

_VoicesListResponseDto _$VoicesListResponseDtoFromJson(
  Map<String, dynamic> json,
) => _VoicesListResponseDto(
  voices: (json['voices'] as List<dynamic>)
      .map((e) => VoiceDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$VoicesListResponseDtoToJson(
  _VoicesListResponseDto instance,
) => <String, dynamic>{'voices': instance.voices};
