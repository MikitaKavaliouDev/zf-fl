// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measurement_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateMeasurementRequest _$CreateMeasurementRequestFromJson(
  Map<String, dynamic> json,
) => _CreateMeasurementRequest(
  weightKg: (json['weightKg'] as num?)?.toDouble(),
  bodyFatPercentage: (json['bodyFatPercentage'] as num?)?.toDouble(),
  measurementDate: json['measurementDate'] as String?,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$CreateMeasurementRequestToJson(
  _CreateMeasurementRequest instance,
) => <String, dynamic>{
  'weightKg': instance.weightKg,
  'bodyFatPercentage': instance.bodyFatPercentage,
  'measurementDate': instance.measurementDate,
  'notes': instance.notes,
};

_MeasurementDto _$MeasurementDtoFromJson(Map<String, dynamic> json) =>
    _MeasurementDto(
      id: json['id'] as String,
      clientId: json['clientId'] as String,
      measurementDate: json['measurementDate'] as String,
      weightKg: (json['weightKg'] as num?)?.toDouble(),
      bodyFatPercentage: (json['bodyFatPercentage'] as num?)?.toDouble(),
      notes: json['notes'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$MeasurementDtoToJson(_MeasurementDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clientId': instance.clientId,
      'measurementDate': instance.measurementDate,
      'weightKg': instance.weightKg,
      'bodyFatPercentage': instance.bodyFatPercentage,
      'notes': instance.notes,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
