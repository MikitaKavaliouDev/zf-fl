// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_check_in_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EventCheckInResponseDto _$EventCheckInResponseDtoFromJson(
  Map<String, dynamic> json,
) => _EventCheckInResponseDto(
  booking: json['booking'] as Map<String, dynamic>?,
  event: json['event'] as Map<String, dynamic>?,
  attendee: json['attendee'] as Map<String, dynamic>?,
  checkedInAt: json['checkedInAt'] as String?,
);

Map<String, dynamic> _$EventCheckInResponseDtoToJson(
  _EventCheckInResponseDto instance,
) => <String, dynamic>{
  'booking': instance.booking,
  'event': instance.event,
  'attendee': instance.attendee,
  'checkedInAt': instance.checkedInAt,
};
