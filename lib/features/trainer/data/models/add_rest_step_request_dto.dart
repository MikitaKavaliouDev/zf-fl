import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_rest_step_request_dto.freezed.dart';
part 'add_rest_step_request_dto.g.dart';

@freezed
abstract class AddRestStepRequestDto with _$AddRestStepRequestDto {
  const factory AddRestStepRequestDto({
    required int durationSeconds,
  }) = _AddRestStepRequestDto;

  factory AddRestStepRequestDto.fromJson(Map<String, dynamic> json) =>
      _$AddRestStepRequestDtoFromJson(json);
}
