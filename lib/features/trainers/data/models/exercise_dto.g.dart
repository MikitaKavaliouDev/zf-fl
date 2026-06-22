// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExerciseDto _$ExerciseDtoFromJson(Map<String, dynamic> json) => _ExerciseDto(
  id: json['id'] as String,
  name: json['name'] as String,
  muscleGroup: json['muscleGroup'] as String?,
  equipment: json['equipment'] as String?,
  category: json['category'] as String?,
  videoUrl: json['videoUrl'] as String?,
  recommendedRestSeconds: (json['recommendedRestSeconds'] as num?)?.toInt(),
  isUnilateral: json['isUnilateral'] as bool? ?? false,
);

Map<String, dynamic> _$ExerciseDtoToJson(_ExerciseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'muscleGroup': instance.muscleGroup,
      'equipment': instance.equipment,
      'category': instance.category,
      'videoUrl': instance.videoUrl,
      'recommendedRestSeconds': instance.recommendedRestSeconds,
      'isUnilateral': instance.isUnilateral,
    };
