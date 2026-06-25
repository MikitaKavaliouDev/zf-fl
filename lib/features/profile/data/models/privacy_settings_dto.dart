import 'package:freezed_annotation/freezed_annotation.dart';

part 'privacy_settings_dto.freezed.dart';
part 'privacy_settings_dto.g.dart';

@freezed
abstract class PrivacySettingsDto with _$PrivacySettingsDto {
  const factory PrivacySettingsDto({
    @Default(false) bool shareWorkoutHistory,
    @Default(false) bool shareBodyMeasurements,
    @Default(false) bool shareCheckinNotes,
    @Default(false) bool shareLocation,
    @Default(false) bool allowTrainerExport,
    int? dataRetentionDays,
  }) = _PrivacySettingsDto;

  factory PrivacySettingsDto.fromJson(Map<String, dynamic> json) =>
      _$PrivacySettingsDtoFromJson(json);
}
