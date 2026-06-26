// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_log_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HabitLogDto _$HabitLogDtoFromJson(Map<String, dynamic> json) => _HabitLogDto(
  id: json['id'] as String,
  habitId: json['habitId'] as String,
  clientId: json['clientId'] as String,
  date: DateTime.parse(json['date'] as String),
  isCompleted: json['isCompleted'] as bool,
  note: json['note'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$HabitLogDtoToJson(_HabitLogDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'habitId': instance.habitId,
      'clientId': instance.clientId,
      'date': instance.date.toIso8601String(),
      'isCompleted': instance.isCompleted,
      'note': instance.note,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
