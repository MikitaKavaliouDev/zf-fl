// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_habit_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LogHabitRequestDto _$LogHabitRequestDtoFromJson(Map<String, dynamic> json) =>
    _LogHabitRequestDto(
      date: json['date'] as String,
      isCompleted: json['isCompleted'] as bool,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$LogHabitRequestDtoToJson(_LogHabitRequestDto instance) =>
    <String, dynamic>{
      'date': instance.date,
      'isCompleted': instance.isCompleted,
      'note': instance.note,
    };
