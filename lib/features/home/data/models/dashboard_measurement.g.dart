// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_measurement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardMeasurement _$DashboardMeasurementFromJson(
  Map<String, dynamic> json,
) => _DashboardMeasurement(
  id: json['id'] as String,
  measurementDate: DateTime.parse(json['measurementDate'] as String),
  weightKg: (json['weightKg'] as num?)?.toDouble(),
  bodyFatPercentage: (json['bodyFatPercentage'] as num?)?.toDouble(),
);

Map<String, dynamic> _$DashboardMeasurementToJson(
  _DashboardMeasurement instance,
) => <String, dynamic>{
  'id': instance.id,
  'measurementDate': instance.measurementDate.toIso8601String(),
  'weightKg': instance.weightKg,
  'bodyFatPercentage': instance.bodyFatPercentage,
};
