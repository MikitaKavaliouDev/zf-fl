// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_target_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyTargetDto _$DailyTargetDtoFromJson(Map<String, dynamic> json) =>
    _DailyTargetDto(
      id: json['id'] as String,
      clientId: json['clientId'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      type: json['type'] as String,
      targetValue: (json['targetValue'] as num).toDouble(),
      unit: json['unit'] as String,
      date: DateTime.parse(json['date'] as String),
      currentValue: (json['currentValue'] as num?)?.toDouble(),
      isCompleted: json['isCompleted'] as bool? ?? false,
      order: (json['order'] as num?)?.toInt() ?? 0,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$DailyTargetDtoToJson(_DailyTargetDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clientId': instance.clientId,
      'title': instance.title,
      'description': instance.description,
      'type': instance.type,
      'targetValue': instance.targetValue,
      'unit': instance.unit,
      'date': instance.date.toIso8601String(),
      'currentValue': instance.currentValue,
      'isCompleted': instance.isCompleted,
      'order': instance.order,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
