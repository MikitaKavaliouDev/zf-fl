import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics_response_dto.freezed.dart';
part 'analytics_response_dto.g.dart';

@freezed
abstract class AnalyticsResponseDto with _$AnalyticsResponseDto {
  const factory AnalyticsResponseDto({
    @Default(<String>[]) List<String> heatmapDates,
    @Default(<VolumeDataPoint>[]) List<VolumeDataPoint> volumeHistory,
    @Default(<MuscleDataPoint>[]) List<MuscleDataPoint> muscleDistribution,
    @Default(<PRDataPoint>[]) List<PRDataPoint> recentPRs,
    @Default(0.0) double consistency,
  }) = _AnalyticsResponseDto;

  factory AnalyticsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsResponseDtoFromJson(json);
}

@freezed
abstract class VolumeDataPoint with _$VolumeDataPoint {
  const factory VolumeDataPoint({
    required String date,
    @Default(0.0) double volume,
  }) = _VolumeDataPoint;

  factory VolumeDataPoint.fromJson(Map<String, dynamic> json) =>
      _$VolumeDataPointFromJson(json);
}

@freezed
abstract class MuscleDataPoint with _$MuscleDataPoint {
  const factory MuscleDataPoint({
    required String muscle,
    @Default(0) int count,
  }) = _MuscleDataPoint;

  factory MuscleDataPoint.fromJson(Map<String, dynamic> json) =>
      _$MuscleDataPointFromJson(json);
}

@freezed
abstract class PRDataPoint with _$PRDataPoint {
  const factory PRDataPoint({
    required String exercise,
    @Default(0.0) double value,
    required String type,
    required String date,
  }) = _PRDataPoint;

  factory PRDataPoint.fromJson(Map<String, dynamic> json) =>
      _$PRDataPointFromJson(json);
}
