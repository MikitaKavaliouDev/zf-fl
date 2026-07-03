// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_event_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateEventRequestDto _$CreateEventRequestDtoFromJson(
  Map<String, dynamic> json,
) => _CreateEventRequestDto(
  title: json['title'] as String,
  startTime: json['startTime'] as String?,
  endTime: json['endTime'] as String?,
  price: (json['price'] as num?)?.toDouble() ?? 0,
  capacity: (json['capacity'] as num?)?.toInt() ?? 1,
  locationName: json['locationName'] as String? ?? '',
  address: json['address'] as String? ?? '',
  city: json['city'] as String?,
  description: json['description'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  imageUrl: json['imageUrl'] as String?,
  category: json['category'] as String?,
);

Map<String, dynamic> _$CreateEventRequestDtoToJson(
  _CreateEventRequestDto instance,
) => <String, dynamic>{
  'title': instance.title,
  'startTime': instance.startTime,
  'endTime': instance.endTime,
  'price': instance.price,
  'capacity': instance.capacity,
  'locationName': instance.locationName,
  'address': instance.address,
  'city': instance.city,
  'description': instance.description,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'imageUrl': instance.imageUrl,
  'category': instance.category,
};
