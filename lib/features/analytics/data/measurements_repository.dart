import 'package:injectable/injectable.dart';

import 'measurements_api_service.dart';
import 'models/measurement_dto.dart';

@singleton
class MeasurementsRepository {
  final MeasurementsApiService _api;

  MeasurementsRepository(this._api);

  Future<MeasurementDto> createMeasurement(
    CreateMeasurementRequest request,
  ) =>
      _api.createMeasurement(request);
}
