// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainerDetailDto _$TrainerDetailDtoFromJson(Map<String, dynamic> json) =>
    _TrainerDetailDto(
      id: json['id'] as String,
      name: json['name'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      profilePhotoPath: json['profilePhotoPath'] as String?,
      bio: json['bio'] as String?,
      averageRating: (json['averageRating'] as num?)?.toDouble(),
      specialties:
          (json['specialties'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      certifications:
          (json['certifications'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      isVerified: json['isVerified'] as bool? ?? false,
      isLinked: json['isLinked'] as bool? ?? false,
      businessCurrency: json['businessCurrency'] as String?,
      locations: json['locations'] as List<dynamic>? ?? const <dynamic>[],
      services: json['services'] as List<dynamic>? ?? const <dynamic>[],
      stats: json['stats'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$TrainerDetailDtoToJson(_TrainerDetailDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'profilePhotoPath': instance.profilePhotoPath,
      'bio': instance.bio,
      'averageRating': instance.averageRating,
      'specialties': instance.specialties,
      'certifications': instance.certifications,
      'isVerified': instance.isVerified,
      'isLinked': instance.isLinked,
      'businessCurrency': instance.businessCurrency,
      'locations': instance.locations,
      'services': instance.services,
      'stats': instance.stats,
    };
