// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_habit_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateHabitRequestDto _$CreateHabitRequestDtoFromJson(
  Map<String, dynamic> json,
) => _CreateHabitRequestDto(
  title: json['title'] as String,
  description: json['description'] as String?,
  frequency: json['frequency'] as String? ?? 'DAILY',
);

Map<String, dynamic> _$CreateHabitRequestDtoToJson(
  _CreateHabitRequestDto instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'frequency': instance.frequency,
};
