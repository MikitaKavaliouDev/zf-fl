import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_in_config_dto.freezed.dart';
part 'check_in_config_dto.g.dart';

@freezed
abstract class CheckInConfigDto with _$CheckInConfigDto {
  const factory CheckInConfigDto({
    required int checkInDay,
    required int checkInHour,
    required String nextCheckInDueAt,
  }) = _CheckInConfigDto;

  factory CheckInConfigDto.fromJson(Map<String, dynamic> json) =>
      _$CheckInConfigDtoFromJson(json);
}
