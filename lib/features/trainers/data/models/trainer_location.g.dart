// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainerLocation _$TrainerLocationFromJson(Map<String, dynamic> json) =>
    _TrainerLocation(
      id: json['id'] as String,
      address: json['address'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TrainerLocationToJson(_TrainerLocation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
