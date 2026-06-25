// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainerDetailDto _$TrainerDetailDtoFromJson(
  Map<String, dynamic> json,
) => _TrainerDetailDto(
  id: json['id'] as String,
  name: json['name'] as String?,
  username: json['username'] as String?,
  email: json['email'] as String?,
  role: json['role'] as String?,
  tier: json['tier'] as String?,
  isLinked: json['isLinked'] as bool? ?? false,
  profilePhotoPath: json['profilePhotoPath'] as String?,
  bannerImagePath: json['bannerImagePath'] as String?,
  aboutMe: json['aboutMe'] as String?,
  philosophy: json['philosophy'] as String?,
  methodology: json['methodology'] as String?,
  branding: json['branding'] as String?,
  certifications: json['certifications'] as String?,
  specialties: json['specialties'] == null
      ? const <String>[]
      : _parseStringList(json['specialties']),
  trainingTypes: json['trainingTypes'] == null
      ? const <String>[]
      : _parseStringList(json['trainingTypes']),
  minServicePrice: json['minServicePrice'] as String?,
  averageRating: (json['averageRating'] as num?)?.toDouble(),
  businessCurrency: json['businessCurrency'] as String?,
  locations:
      (json['locations'] as List<dynamic>?)
          ?.map((e) => TrainerLocation.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <TrainerLocation>[],
  services:
      (json['services'] as List<dynamic>?)
          ?.map((e) => TrainerServiceDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <TrainerServiceDto>[],
  testimonials:
      (json['testimonials'] as List<dynamic>?)
          ?.map(
            (e) => TrainerTestimonialDto.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <TrainerTestimonialDto>[],
  transformationPhotos:
      (json['transformationPhotos'] as List<dynamic>?)
          ?.map(
            (e) => TrainerTransformationPhotoDto.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const <TrainerTransformationPhotoDto>[],
  socialLinks:
      (json['socialLinks'] as List<dynamic>?)
          ?.map((e) => TrainerSocialLinkDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <TrainerSocialLinkDto>[],
  externalLinks:
      (json['externalLinks'] as List<dynamic>?)
          ?.map(
            (e) => TrainerExternalLinkDto.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <TrainerExternalLinkDto>[],
  benefits:
      (json['benefits'] as List<dynamic>?)
          ?.map((e) => TrainerBenefitDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <TrainerBenefitDto>[],
  reviewCount: (json['reviewCount'] as num?)?.toInt() ?? 0,
  clientsCoached: (json['clientsCoached'] as num?)?.toInt() ?? 0,
  packages:
      (json['packages'] as List<dynamic>?)
          ?.map((e) => TrainerPackageDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <TrainerPackageDto>[],
);

Map<String, dynamic> _$TrainerDetailDtoToJson(_TrainerDetailDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'role': instance.role,
      'tier': instance.tier,
      'isLinked': instance.isLinked,
      'profilePhotoPath': instance.profilePhotoPath,
      'bannerImagePath': instance.bannerImagePath,
      'aboutMe': instance.aboutMe,
      'philosophy': instance.philosophy,
      'methodology': instance.methodology,
      'branding': instance.branding,
      'certifications': instance.certifications,
      'specialties': instance.specialties,
      'trainingTypes': instance.trainingTypes,
      'minServicePrice': instance.minServicePrice,
      'averageRating': instance.averageRating,
      'businessCurrency': instance.businessCurrency,
      'locations': instance.locations,
      'services': instance.services,
      'testimonials': instance.testimonials,
      'transformationPhotos': instance.transformationPhotos,
      'socialLinks': instance.socialLinks,
      'externalLinks': instance.externalLinks,
      'benefits': instance.benefits,
      'reviewCount': instance.reviewCount,
      'clientsCoached': instance.clientsCoached,
      'packages': instance.packages,
    };
