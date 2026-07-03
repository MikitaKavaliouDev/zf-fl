// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_event_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainerEventDto _$TrainerEventDtoFromJson(Map<String, dynamic> json) =>
    _TrainerEventDto(
      id: json['id'] as String,
      title: json['title'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      price: stringFromNum(json['price']),
      capacity: (json['capacity'] as num).toInt(),
      locationName: json['locationName'] as String,
      address: json['address'] as String,
      city: json['city'] as String?,
      description: json['description'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      imageUrl: json['imageUrl'] as String?,
      category: json['category'] as String?,
      currency: json['currency'] as String?,
      enrolledCount: (json['enrolledCount'] as num?)?.toInt() ?? 0,
      status: json['status'] as String?,
      isPromoted: json['isPromoted'] as bool? ?? false,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$TrainerEventDtoToJson(_TrainerEventDto instance) =>
    <String, dynamic>{
      'id': instance.id,
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
      'currency': instance.currency,
      'enrolledCount': instance.enrolledCount,
      'status': instance.status,
      'isPromoted': instance.isPromoted,
      'createdAt': instance.createdAt,
    };
