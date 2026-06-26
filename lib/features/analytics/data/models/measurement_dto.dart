import 'package:freezed_annotation/freezed_annotation.dart';

part 'measurement_dto.freezed.dart';
part 'measurement_dto.g.dart';

/// Request body for creating a measurement.
@freezed
abstract class CreateMeasurementRequest with _$CreateMeasurementRequest {
  const factory CreateMeasurementRequest({
    double? weightKg,
    double? bodyFatPercentage,
    String? measurementDate,
    String? notes,
  }) = _CreateMeasurementRequest;

  factory CreateMeasurementRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateMeasurementRequestFromJson(json);
}

/// Measurement record returned from the API.
@freezed
abstract class MeasurementDto with _$MeasurementDto {
  const factory MeasurementDto({
    required String id,
    required String clientId,
    required String measurementDate,
    double? weightKg,
    double? bodyFatPercentage,
    String? notes,
    String? createdAt,
    String? updatedAt,
  }) = _MeasurementDto;

  factory MeasurementDto.fromJson(Map<String, dynamic> json) =>
      _$MeasurementDtoFromJson(json);
}
