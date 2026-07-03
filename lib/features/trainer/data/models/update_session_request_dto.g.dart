// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_session_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateSessionRequestDto _$UpdateSessionRequestDtoFromJson(
  Map<String, dynamic> json,
) => _UpdateSessionRequestDto(
  startTime: json['startTime'] as String,
  endTime: json['endTime'] as String,
  notes: json['notes'] as String?,
  templateId: json['templateId'] as String?,
);

Map<String, dynamic> _$UpdateSessionRequestDtoToJson(
  _UpdateSessionRequestDto instance,
) => <String, dynamic>{
  'startTime': instance.startTime,
  'endTime': instance.endTime,
  'notes': instance.notes,
  'templateId': instance.templateId,
};
