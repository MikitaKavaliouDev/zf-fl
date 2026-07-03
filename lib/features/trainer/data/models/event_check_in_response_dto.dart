import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_check_in_response_dto.freezed.dart';
part 'event_check_in_response_dto.g.dart';

@freezed
abstract class EventCheckInResponseDto with _$EventCheckInResponseDto {
  const factory EventCheckInResponseDto({
    Map<String, dynamic>? booking,
    Map<String, dynamic>? event,
    Map<String, dynamic>? attendee,
    String? checkedInAt,
  }) = _EventCheckInResponseDto;

  factory EventCheckInResponseDto.fromJson(Map<String, dynamic> json) =>
      _$EventCheckInResponseDtoFromJson(json);
}
