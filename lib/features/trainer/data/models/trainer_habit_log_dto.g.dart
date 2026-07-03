// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_habit_log_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainerHabitLogDto _$TrainerHabitLogDtoFromJson(Map<String, dynamic> json) =>
    _TrainerHabitLogDto(
      id: json['id'] as String,
      habitId: json['habitId'] as String,
      clientId: json['clientId'] as String,
      date: json['date'] as String,
      isCompleted: json['isCompleted'] as bool,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$TrainerHabitLogDtoToJson(_TrainerHabitLogDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'habitId': instance.habitId,
      'clientId': instance.clientId,
      'date': instance.date,
      'isCompleted': instance.isCompleted,
      'note': instance.note,
    };
