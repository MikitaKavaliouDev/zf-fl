import 'package:freezed_annotation/freezed_annotation.dart';

part 'trainer_settings_dto.freezed.dart';
part 'trainer_settings_dto.g.dart';

@freezed
abstract class TrainerSettingsDto with _$TrainerSettingsDto {
  const factory TrainerSettingsDto({
    required int defaultCheckInDay,
    required int defaultCheckInHour,
  }) = _TrainerSettingsDto;

  factory TrainerSettingsDto.fromJson(Map<String, dynamic> json) =>
      _$TrainerSettingsDtoFromJson(json);
}
