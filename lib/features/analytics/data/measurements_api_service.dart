import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'models/measurement_dto.dart';

@injectable
class MeasurementsApiService {
  final Dio _dio;

  MeasurementsApiService(this._dio);

  /// POST /api/client/measurements — create a new measurement record.
  Future<MeasurementDto> createMeasurement(
    CreateMeasurementRequest request,
  ) async {
    developer.log(
      'Creating measurement: weightKg=${request.weightKg}, '
      'bodyFatPercentage=${request.bodyFatPercentage}',
      name: 'measurements_api',
    );
    final response = await _dio.post(
      '/api/client/measurements',
      data: request.toJson(),
    );
    final data = response.data['data'] as Map<String, dynamic>;
    final measurement = data['measurement'] as Map<String, dynamic>;
    return MeasurementDto.fromJson(measurement);
  }
}
