import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_check_in_request_dto.freezed.dart';
part 'review_check_in_request_dto.g.dart';

@freezed
abstract class ReviewCheckInRequestDto with _$ReviewCheckInRequestDto {
  const factory ReviewCheckInRequestDto({
    required String trainerResponse,
  }) = _ReviewCheckInRequestDto;

  factory ReviewCheckInRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ReviewCheckInRequestDtoFromJson(json);
}
