// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fitness_goal_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FitnessGoalDto _$FitnessGoalDtoFromJson(Map<String, dynamic> json) =>
    _FitnessGoalDto(
      id: json['id'] as String,
      clientId: json['clientId'] as String,
      type: json['type'] as String,
      targetValue: (json['targetValue'] as num).toDouble(),
      currentValue: (json['currentValue'] as num?)?.toDouble(),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      exerciseName: json['exerciseName'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$FitnessGoalDtoToJson(_FitnessGoalDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clientId': instance.clientId,
      'type': instance.type,
      'targetValue': instance.targetValue,
      'currentValue': instance.currentValue,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'exerciseName': instance.exerciseName,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
