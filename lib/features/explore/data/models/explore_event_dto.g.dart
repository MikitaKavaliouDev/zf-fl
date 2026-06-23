// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_event_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExploreEventDto _$ExploreEventDtoFromJson(Map<String, dynamic> json) =>
    _ExploreEventDto(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
      locationName: json['locationName'] as String,
      address: json['address'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0,
      imageUrl: json['imageUrl'] as String?,
      categoryId: json['category'] as String?,
      cityId: json['city'] as String?,
      price: (json['price'] as num?)?.toDouble() ?? 0,
      currency: json['currency'] as String? ?? 'PLN',
      capacity: (json['capacity'] as num?)?.toInt() ?? 0,
      enrolledCount: (json['enrolledCount'] as num?)?.toInt() ?? 0,
      isNearCapacity: json['isNearCapacity'] as bool? ?? false,
      isBooked: json['isBooked'] as bool? ?? false,
      hostName: json['trainerName'] as String?,
      hostId: json['trainerId'] as String?,
      distance: (json['distance'] as num?)?.toDouble(),
      organizerType: json['organizerType'] as String?,
      highlights:
          (json['highlights'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      trainer: json['trainer'] == null
          ? null
          : TrainerInfo.fromJson(json['trainer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExploreEventDtoToJson(_ExploreEventDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'locationName': instance.locationName,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'imageUrl': instance.imageUrl,
      'category': instance.categoryId,
      'city': instance.cityId,
      'price': instance.price,
      'currency': instance.currency,
      'capacity': instance.capacity,
      'enrolledCount': instance.enrolledCount,
      'isNearCapacity': instance.isNearCapacity,
      'isBooked': instance.isBooked,
      'trainerName': instance.hostName,
      'trainerId': instance.hostId,
      'distance': instance.distance,
      'organizerType': instance.organizerType,
      'highlights': instance.highlights,
      'trainer': instance.trainer,
    };

_TrainerInfo _$TrainerInfoFromJson(Map<String, dynamic> json) => _TrainerInfo(
  name: json['name'] as String,
  username: json['username'] as String?,
  profilePhotoPath: json['profilePhotoPath'] as String?,
  aboutMe: json['aboutMe'] as String?,
);

Map<String, dynamic> _$TrainerInfoToJson(_TrainerInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'profilePhotoPath': instance.profilePhotoPath,
      'aboutMe': instance.aboutMe,
    };
