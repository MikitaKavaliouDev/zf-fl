// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_feedback_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionFeedbackResponseDto _$SessionFeedbackResponseDtoFromJson(
  Map<String, dynamic> json,
) => _SessionFeedbackResponseDto(
  id: json['id'] as String,
  trainerNotes: json['trainerNotes'] as String?,
  trainerNotesUpdatedAt: json['trainerNotesUpdatedAt'] as String?,
);

Map<String, dynamic> _$SessionFeedbackResponseDtoToJson(
  _SessionFeedbackResponseDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'trainerNotes': instance.trainerNotes,
  'trainerNotesUpdatedAt': instance.trainerNotesUpdatedAt,
};
