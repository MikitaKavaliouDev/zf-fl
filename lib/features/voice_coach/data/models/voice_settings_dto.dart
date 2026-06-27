import 'package:freezed_annotation/freezed_annotation.dart';

part 'voice_settings_dto.freezed.dart';
part 'voice_settings_dto.g.dart';

/// Voice settings values sent to ElevenLabs TTS.
@freezed
abstract class VoiceSettingsValues with _$VoiceSettingsValues {
  const factory VoiceSettingsValues({
    @Default(0.5) double stability,
    @Default(0.75) double similarityBoost,
    @Default(0.0) double style,
    @Default(true) bool useSpeakerBoost,
    @Default(1.0) double speed,
  }) = _VoiceSettingsValues;

  factory VoiceSettingsValues.fromJson(Map<String, dynamic> json) =>
      _$VoiceSettingsValuesFromJson(json);
}

/// Response from GET /api/user/voice-settings.
@freezed
abstract class VoiceSettingsResponseDto with _$VoiceSettingsResponseDto {
  const factory VoiceSettingsResponseDto({
    required String voiceId,
    VoiceSettingsValues? settings,
  }) = _VoiceSettingsResponseDto;

  factory VoiceSettingsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$VoiceSettingsResponseDtoFromJson(json);
}

/// A single voice from GET /api/ai-trainer/voices.
@freezed
abstract class VoiceDto with _$VoiceDto {
  const factory VoiceDto({
    required String voiceId,
    required String name,
    String? previewUrl,
    Map<String, String>? labels,
    List<String>? verifiedLanguages,
    String? description,
    String? category,
  }) = _VoiceDto;

  factory VoiceDto.fromJson(Map<String, dynamic> json) =>
      _$VoiceDtoFromJson(json);
}

/// Response from GET /api/ai-trainer/voices.
@freezed
abstract class VoicesListResponseDto with _$VoicesListResponseDto {
  const factory VoicesListResponseDto({
    required List<VoiceDto> voices,
  }) = _VoicesListResponseDto;

  factory VoicesListResponseDto.fromJson(Map<String, dynamic> json) =>
      _$VoicesListResponseDtoFromJson(json);
}
