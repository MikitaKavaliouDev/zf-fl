import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_session_request_dto.freezed.dart';
part 'create_session_request_dto.g.dart';

@freezed
abstract class CreateSessionRequestDto with _$CreateSessionRequestDto {
  const factory CreateSessionRequestDto({
    required String clientId,
    required String startTime,
    required String endTime,
    String? notes,
    String? templateId,
    @Default(false) bool repeats,
    int? repeatWeeks,
    List<int>? repeatDays,
    int? clientStartDay,
  }) = _CreateSessionRequestDto;

  factory CreateSessionRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CreateSessionRequestDtoFromJson(json);
}
