import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_in_response_dto.freezed.dart';
part 'check_in_response_dto.g.dart';

@freezed
abstract class CheckInResponseDto with _$CheckInResponseDto {
  const factory CheckInResponseDto({
    required String id,
    required String status,
  }) = _CheckInResponseDto;

  factory CheckInResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CheckInResponseDtoFromJson(json);
}
