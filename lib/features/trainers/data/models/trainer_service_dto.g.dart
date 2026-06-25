// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_service_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainerServiceDto _$TrainerServiceDtoFromJson(Map<String, dynamic> json) =>
    _TrainerServiceDto(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      price: json['price'] as String?,
      currency: json['currency'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TrainerServiceDtoToJson(_TrainerServiceDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'currency': instance.currency,
      'duration': instance.duration,
    };
