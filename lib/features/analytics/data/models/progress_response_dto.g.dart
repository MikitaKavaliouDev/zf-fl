// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProgressResponseDto _$ProgressResponseDtoFromJson(Map<String, dynamic> json) =>
    _ProgressResponseDto(
      weight:
          (json['weight'] as List<dynamic>?)
              ?.map((e) => DataPoint.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <DataPoint>[],
      bodyFat:
          (json['bodyFat'] as List<dynamic>?)
              ?.map((e) => DataPoint.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <DataPoint>[],
      volume:
          (json['volume'] as List<dynamic>?)
              ?.map((e) => DataPoint.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <DataPoint>[],
      exercisePerformance:
          (json['exercisePerformance'] as List<dynamic>?)
              ?.map(
                (e) =>
                    ExercisePerformanceDto.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <ExercisePerformanceDto>[],
      favoriteExercises:
          (json['favoriteExercises'] as List<dynamic>?)
              ?.map(
                (e) => FavoriteExerciseDto.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <FavoriteExerciseDto>[],
    );

Map<String, dynamic> _$ProgressResponseDtoToJson(
  _ProgressResponseDto instance,
) => <String, dynamic>{
  'weight': instance.weight,
  'bodyFat': instance.bodyFat,
  'volume': instance.volume,
  'exercisePerformance': instance.exercisePerformance,
  'favoriteExercises': instance.favoriteExercises,
};

_DataPoint _$DataPointFromJson(Map<String, dynamic> json) => _DataPoint(
  date: json['date'] as String,
  value: (json['value'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$DataPointToJson(_DataPoint instance) =>
    <String, dynamic>{'date': instance.date, 'value': instance.value};

_ExercisePerformanceDto _$ExercisePerformanceDtoFromJson(
  Map<String, dynamic> json,
) => _ExercisePerformanceDto(
  exerciseId: json['exerciseId'] as String,
  exerciseName: json['exerciseName'] as String,
  maxWeight: (json['maxWeight'] as num?)?.toDouble(),
  maxReps: (json['maxReps'] as num?)?.toDouble(),
  maxVolume: (json['maxVolume'] as num?)?.toDouble(),
  lastPerformed: json['lastPerformed'] as String?,
);

Map<String, dynamic> _$ExercisePerformanceDtoToJson(
  _ExercisePerformanceDto instance,
) => <String, dynamic>{
  'exerciseId': instance.exerciseId,
  'exerciseName': instance.exerciseName,
  'maxWeight': instance.maxWeight,
  'maxReps': instance.maxReps,
  'maxVolume': instance.maxVolume,
  'lastPerformed': instance.lastPerformed,
};

_FavoriteExerciseDto _$FavoriteExerciseDtoFromJson(Map<String, dynamic> json) =>
    _FavoriteExerciseDto(
      exerciseId: json['exerciseId'] as String,
      exerciseName: json['exerciseName'] as String,
      frequency: (json['frequency'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$FavoriteExerciseDtoToJson(
  _FavoriteExerciseDto instance,
) => <String, dynamic>{
  'exerciseId': instance.exerciseId,
  'exerciseName': instance.exerciseName,
  'frequency': instance.frequency,
};
