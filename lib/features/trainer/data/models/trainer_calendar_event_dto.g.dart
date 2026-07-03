// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_calendar_event_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainerCalendarEventDto _$TrainerCalendarEventDtoFromJson(
  Map<String, dynamic> json,
) => _TrainerCalendarEventDto(
  id: json['id'] as String,
  title: json['title'] as String,
  start: json['start'] as String,
  end: json['end'] as String,
  type: json['type'] as String,
  clientId: json['clientId'] as String?,
  clientName: json['clientName'] as String,
  clientAvatarUrl: json['clientAvatarUrl'] as String?,
  notes: json['notes'] as String?,
  templateId: json['templateId'] as String?,
  templateName: json['templateName'] as String?,
);

Map<String, dynamic> _$TrainerCalendarEventDtoToJson(
  _TrainerCalendarEventDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'start': instance.start,
  'end': instance.end,
  'type': instance.type,
  'clientId': instance.clientId,
  'clientName': instance.clientName,
  'clientAvatarUrl': instance.clientAvatarUrl,
  'notes': instance.notes,
  'templateId': instance.templateId,
  'templateName': instance.templateName,
};
