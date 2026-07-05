import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_check_in_dto.freezed.dart';
part 'request_check_in_dto.g.dart';

@freezed
abstract class RequestCheckInDto with _$RequestCheckInDto {
  const factory RequestCheckInDto({
    required String clientId,
    required String checkInType,
    required String dueDate,
    String? message,
  }) = _RequestCheckInDto;

  factory RequestCheckInDto.fromJson(Map<String, dynamic> json) =>
      _$RequestCheckInDtoFromJson(json);
}
