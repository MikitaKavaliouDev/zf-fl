import 'package:freezed_annotation/freezed_annotation.dart';

part 'progress_response_dto.freezed.dart';
part 'progress_response_dto.g.dart';

@freezed
abstract class ProgressResponseDto with _$ProgressResponseDto {
  const factory ProgressResponseDto({
    @Default(<DataPoint>[]) List<DataPoint> weight,
    @Default(<DataPoint>[]) List<DataPoint> bodyFat,
    @Default(<DataPoint>[]) List<DataPoint> volume,
    @Default(<ExercisePerformanceDto>[])
    List<ExercisePerformanceDto> exercisePerformance,
    @Default(<FavoriteExerciseDto>[]) List<FavoriteExerciseDto> favoriteExercises,
    @Default(<WorstPerformingExerciseDto>[])
    List<WorstPerformingExerciseDto> worstPerformingExercises,
  }) = _ProgressResponseDto;

  factory ProgressResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ProgressResponseDtoFromJson(json);
}

@freezed
abstract class WorstPerformingExerciseDto with _$WorstPerformingExerciseDto {
  const factory WorstPerformingExerciseDto({
    required String exerciseId,
    required String exerciseName,
    @Default('') String issue,
  }) = _WorstPerformingExerciseDto;

  factory WorstPerformingExerciseDto.fromJson(Map<String, dynamic> json) =>
      _$WorstPerformingExerciseDtoFromJson(json);
}

@freezed
abstract class DataPoint with _$DataPoint {
  const factory DataPoint({
    required String date,
    @Default(0.0) double value,
  }) = _DataPoint;

  factory DataPoint.fromJson(Map<String, dynamic> json) =>
      _$DataPointFromJson(json);
}

@freezed
abstract class ExercisePerformanceDto with _$ExercisePerformanceDto {
  const factory ExercisePerformanceDto({
    required String exerciseId,
    required String exerciseName,
    double? maxWeight,
    double? maxReps,
    double? maxVolume,
    String? lastPerformed,
  }) = _ExercisePerformanceDto;

  factory ExercisePerformanceDto.fromJson(Map<String, dynamic> json) =>
      _$ExercisePerformanceDtoFromJson(json);
}

@freezed
abstract class FavoriteExerciseDto with _$FavoriteExerciseDto {
  const factory FavoriteExerciseDto({
    required String exerciseId,
    required String exerciseName,
    @Default(0) int frequency,
  }) = _FavoriteExerciseDto;

  factory FavoriteExerciseDto.fromJson(Map<String, dynamic> json) =>
      _$FavoriteExerciseDtoFromJson(json);
}
