// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_session_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateSessionRequestDto _$CreateSessionRequestDtoFromJson(
  Map<String, dynamic> json,
) => _CreateSessionRequestDto(
  clientId: json['clientId'] as String,
  startTime: json['startTime'] as String,
  endTime: json['endTime'] as String,
  notes: json['notes'] as String?,
  templateId: json['templateId'] as String?,
  repeats: json['repeats'] as bool? ?? false,
  repeatWeeks: (json['repeatWeeks'] as num?)?.toInt(),
  repeatDays: (json['repeatDays'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  clientStartDay: (json['clientStartDay'] as num?)?.toInt(),
);

Map<String, dynamic> _$CreateSessionRequestDtoToJson(
  _CreateSessionRequestDto instance,
) => <String, dynamic>{
  'clientId': instance.clientId,
  'startTime': instance.startTime,
  'endTime': instance.endTime,
  'notes': instance.notes,
  'templateId': instance.templateId,
  'repeats': instance.repeats,
  'repeatWeeks': instance.repeatWeeks,
  'repeatDays': instance.repeatDays,
  'clientStartDay': instance.clientStartDay,
};
