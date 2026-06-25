import 'package:freezed_annotation/freezed_annotation.dart';

part 'sharing_config_dto.freezed.dart';
part 'sharing_config_dto.g.dart';

@freezed
abstract class SharingSettings with _$SharingSettings {
  const factory SharingSettings({
    @Default(true) bool workouts,
    @Default(true) bool measurements,
    @Default(true) bool photos,
    @Default(true) bool checkins,
  }) = _SharingSettings;

  factory SharingSettings.fromJson(Map<String, dynamic> json) =>
      _$SharingSettingsFromJson(json);
}

@freezed
abstract class SharingConfigDto with _$SharingConfigDto {
  const factory SharingConfigDto({
    DateTime? expiresAt,
    @Default('forever') String duration,
    @Default(SharingSettings()) SharingSettings settings,
  }) = _SharingConfigDto;

  const SharingConfigDto._();

  factory SharingConfigDto.fromJson(Map<String, dynamic> json) =>
      _$SharingConfigDtoFromJson(json);
}
