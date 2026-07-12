// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_exercise_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomExerciseDto _$CustomExerciseDtoFromJson(Map<String, dynamic> json) =>
    _CustomExerciseDto(
      id: json['id'] as String,
      name: json['name'] as String,
      metricType: json['metricType'] as String,
      muscleGroup: json['muscleGroup'] as String?,
      equipment: json['equipment'] as String?,
      description: json['description'] as String?,
      videoUrl: json['videoUrl'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$CustomExerciseDtoToJson(_CustomExerciseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'metricType': instance.metricType,
      'muscleGroup': instance.muscleGroup,
      'equipment': instance.equipment,
      'description': instance.description,
      'videoUrl': instance.videoUrl,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
