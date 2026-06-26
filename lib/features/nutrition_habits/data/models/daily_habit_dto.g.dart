// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_habit_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyHabitDto _$DailyHabitDtoFromJson(Map<String, dynamic> json) =>
    _DailyHabitDto(
      id: json['id'] as String,
      clientId: json['clientId'] as String,
      trainerId: json['trainerId'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      frequency: json['frequency'] as String,
      isActive: json['isActive'] as bool? ?? true,
      logs:
          (json['logs'] as List<dynamic>?)
              ?.map((e) => HabitLogDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <HabitLogDto>[],
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$DailyHabitDtoToJson(_DailyHabitDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clientId': instance.clientId,
      'trainerId': instance.trainerId,
      'title': instance.title,
      'description': instance.description,
      'frequency': instance.frequency,
      'isActive': instance.isActive,
      'logs': instance.logs,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
