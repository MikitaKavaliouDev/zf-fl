import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_feedback_response_dto.freezed.dart';
part 'session_feedback_response_dto.g.dart';

@freezed
abstract class SessionFeedbackResponseDto with _$SessionFeedbackResponseDto {
  const factory SessionFeedbackResponseDto({
    required String id,
    String? trainerNotes,
    String? trainerNotesUpdatedAt,
  }) = _SessionFeedbackResponseDto;

  factory SessionFeedbackResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SessionFeedbackResponseDtoFromJson(json);
}
