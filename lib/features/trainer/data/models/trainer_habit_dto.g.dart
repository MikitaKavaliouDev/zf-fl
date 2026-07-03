// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_habit_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainerHabitDto _$TrainerHabitDtoFromJson(Map<String, dynamic> json) =>
    _TrainerHabitDto(
      id: json['id'] as String,
      clientId: json['clientId'] as String,
      trainerId: json['trainerId'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      frequency: json['frequency'] as String,
      isActive: json['isActive'] as bool,
      logs:
          (json['logs'] as List<dynamic>?)
              ?.map(
                (e) => TrainerHabitLogDto.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <TrainerHabitLogDto>[],
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      deletedAt: json['deletedAt'] as String?,
    );

Map<String, dynamic> _$TrainerHabitDtoToJson(_TrainerHabitDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clientId': instance.clientId,
      'trainerId': instance.trainerId,
      'title': instance.title,
      'description': instance.description,
      'frequency': instance.frequency,
      'isActive': instance.isActive,
      'logs': instance.logs,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
    };
