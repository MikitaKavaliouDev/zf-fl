// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_habit_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateHabitRequestDto _$UpdateHabitRequestDtoFromJson(
  Map<String, dynamic> json,
) => _UpdateHabitRequestDto(
  title: json['title'] as String?,
  description: json['description'] as String?,
  frequency: json['frequency'] as String?,
  isActive: json['isActive'] as bool?,
);

Map<String, dynamic> _$UpdateHabitRequestDtoToJson(
  _UpdateHabitRequestDto instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'frequency': instance.frequency,
  'isActive': instance.isActive,
};
