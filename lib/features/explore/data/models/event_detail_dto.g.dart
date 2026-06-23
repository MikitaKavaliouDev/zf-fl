// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EventDetailDto _$EventDetailDtoFromJson(Map<String, dynamic> json) =>
    _EventDetailDto(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      date: DateTime.parse(json['startTime'] as String),
      location: json['locationName'] as String?,
      category: json['category'] as String?,
      price: (json['price'] as num?)?.toDouble() ?? 0,
      lat: (json['latitude'] as num?)?.toDouble(),
      lon: (json['longitude'] as num?)?.toDouble(),
      createdBy: json['trainer'] == null
          ? null
          : CreatedBy.fromJson(json['trainer'] as Map<String, dynamic>),
      bookingCount: (json['enrolledCount'] as num?)?.toInt() ?? 0,
      maxAttendees: (json['capacity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EventDetailDtoToJson(_EventDetailDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'startTime': instance.date.toIso8601String(),
      'locationName': instance.location,
      'category': instance.category,
      'price': instance.price,
      'latitude': instance.lat,
      'longitude': instance.lon,
      'trainer': instance.createdBy,
      'enrolledCount': instance.bookingCount,
      'capacity': instance.maxAttendees,
    };

_CreatedBy _$CreatedByFromJson(Map<String, dynamic> json) => _CreatedBy(
  id: json['id'] as String? ?? '',
  name: json['name'] as String?,
  username: json['username'] as String?,
  profilePhotoPath: json['profilePhotoPath'] as String?,
  aboutMe: json['aboutMe'] as String?,
);

Map<String, dynamic> _$CreatedByToJson(_CreatedBy instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'profilePhotoPath': instance.profilePhotoPath,
      'aboutMe': instance.aboutMe,
    };
