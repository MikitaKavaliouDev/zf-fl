import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_session_request_dto.freezed.dart';
part 'update_session_request_dto.g.dart';

@freezed
abstract class UpdateSessionRequestDto with _$UpdateSessionRequestDto {
  const factory UpdateSessionRequestDto({
    required String startTime,
    required String endTime,
    String? notes,
    String? templateId,
  }) = _UpdateSessionRequestDto;

  factory UpdateSessionRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateSessionRequestDtoFromJson(json);
}
