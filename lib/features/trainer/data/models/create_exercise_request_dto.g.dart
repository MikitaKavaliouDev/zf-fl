// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_exercise_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateExerciseRequestDto _$CreateExerciseRequestDtoFromJson(
  Map<String, dynamic> json,
) => _CreateExerciseRequestDto(
  exerciseId: json['exerciseId'] as String,
  targetReps: json['targetReps'] as String?,
  targetSets: (json['targetSets'] as num?)?.toInt(),
  durationSeconds: (json['durationSeconds'] as num?)?.toInt(),
  tempo: json['tempo'] as String?,
  enableRpe: json['enableRpe'] as bool?,
  notes: json['notes'] as String?,
  videoUrl: json['videoUrl'] as String?,
  supersetGroupId: json['supersetGroupId'] as String?,
  supersetOrder: (json['supersetOrder'] as num?)?.toInt(),
  exerciseCategory: json['exerciseCategory'] as String?,
  metricType: json['metricType'] as String?,
  targetDistanceKm: (json['targetDistanceKm'] as num?)?.toDouble(),
  targetLevel: (json['targetLevel'] as num?)?.toDouble(),
);

Map<String, dynamic> _$CreateExerciseRequestDtoToJson(
  _CreateExerciseRequestDto instance,
) => <String, dynamic>{
  'exerciseId': instance.exerciseId,
  'targetReps': instance.targetReps,
  'targetSets': instance.targetSets,
  'durationSeconds': instance.durationSeconds,
  'tempo': instance.tempo,
  'enableRpe': instance.enableRpe,
  'notes': instance.notes,
  'videoUrl': instance.videoUrl,
  'supersetGroupId': instance.supersetGroupId,
  'supersetOrder': instance.supersetOrder,
  'exerciseCategory': instance.exerciseCategory,
  'metricType': instance.metricType,
  'targetDistanceKm': instance.targetDistanceKm,
  'targetLevel': instance.targetLevel,
};
