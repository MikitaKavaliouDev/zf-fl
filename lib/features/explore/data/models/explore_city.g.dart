// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExploreCity _$ExploreCityFromJson(Map<String, dynamic> json) => _ExploreCity(
  id: json['id'] as String,
  name: json['name'] as String,
  imageUrl: json['imageUrl'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  isCurrentLocation: json['isCurrentLocation'] as bool? ?? false,
);

Map<String, dynamic> _$ExploreCityToJson(_ExploreCity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'isCurrentLocation': instance.isCurrentLocation,
    };
