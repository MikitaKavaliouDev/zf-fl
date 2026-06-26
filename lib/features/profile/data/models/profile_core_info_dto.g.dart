// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_core_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileCoreInfoDto _$ProfileCoreInfoDtoFromJson(Map<String, dynamic> json) =>
    _ProfileCoreInfoDto(
      name: json['name'] as String,
      username: json['username'] as String,
      weightUnit: json['weightUnit'] as String? ?? 'KG',
      phone: json['phone'] as String?,
      certifications: json['certifications'] as String?,
      aboutMe: json['aboutMe'] as String?,
      businessCurrency: json['businessCurrency'] as String? ?? 'PLN',
      specialties:
          (json['specialties'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      trainingTypes:
          (json['trainingTypes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      locations:
          (json['locations'] as List<dynamic>?)
              ?.map(
                (e) => ProfileLocationDto.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <ProfileLocationDto>[],
    );

Map<String, dynamic> _$ProfileCoreInfoDtoToJson(_ProfileCoreInfoDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'weightUnit': instance.weightUnit,
      'phone': instance.phone,
      'certifications': instance.certifications,
      'aboutMe': instance.aboutMe,
      'businessCurrency': instance.businessCurrency,
      'specialties': instance.specialties,
      'trainingTypes': instance.trainingTypes,
      'locations': instance.locations,
    };

_ProfileLocationDto _$ProfileLocationDtoFromJson(Map<String, dynamic> json) =>
    _ProfileLocationDto(
      id: json['id'] as String,
      address: json['address'] as String,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProfileLocationDtoToJson(_ProfileLocationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
