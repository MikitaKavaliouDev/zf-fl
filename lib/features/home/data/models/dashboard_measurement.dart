import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_measurement.freezed.dart';
part 'dashboard_measurement.g.dart';

@freezed
abstract class DashboardMeasurement with _$DashboardMeasurement {
  const factory DashboardMeasurement({
    required String id,
    required DateTime measurementDate,
    double? weightKg,
    double? bodyFatPercentage,
  }) = _DashboardMeasurement;

  factory DashboardMeasurement.fromJson(Map<String, dynamic> json) =>
      _$DashboardMeasurementFromJson(json);
}
