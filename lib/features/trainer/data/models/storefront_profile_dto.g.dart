// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storefront_profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StorefrontProfileDto _$StorefrontProfileDtoFromJson(
  Map<String, dynamic> json,
) => _StorefrontProfileDto(
  name: json['name'] as String,
  username: json['username'] as String?,
  bio: json['bio'] as String?,
  philosophy: json['philosophy'] as String?,
  methodology: json['methodology'] as String?,
  specialties: json['specialties'] as String?,
  certifications: json['certifications'] as String?,
  qualifications: json['qualifications'] as String?,
  avatarUrl: json['avatarUrl'] as String?,
  bannerUrl: json['bannerUrl'] as String?,
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  packages:
      (json['packages'] as List<dynamic>?)
          ?.map((e) => StorefrontPackageDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  services:
      (json['services'] as List<dynamic>?)
          ?.map((e) => StorefrontServiceDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  socialLinks:
      (json['socialLinks'] as List<dynamic>?)
          ?.map(
            (e) => StorefrontSocialLinkDto.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  externalLinks:
      (json['externalLinks'] as List<dynamic>?)
          ?.map(
            (e) =>
                StorefrontExternalLinkDto.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  testimonials:
      (json['testimonials'] as List<dynamic>?)
          ?.map(
            (e) => StorefrontTestimonialDto.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  transformationPhotos:
      (json['transformationPhotos'] as List<dynamic>?)
          ?.map((e) => StorefrontPhotoDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$StorefrontProfileDtoToJson(
  _StorefrontProfileDto instance,
) => <String, dynamic>{
  'name': instance.name,
  'username': instance.username,
  'bio': instance.bio,
  'philosophy': instance.philosophy,
  'methodology': instance.methodology,
  'specialties': instance.specialties,
  'certifications': instance.certifications,
  'qualifications': instance.qualifications,
  'avatarUrl': instance.avatarUrl,
  'bannerUrl': instance.bannerUrl,
  'tags': instance.tags,
  'packages': instance.packages,
  'services': instance.services,
  'socialLinks': instance.socialLinks,
  'externalLinks': instance.externalLinks,
  'testimonials': instance.testimonials,
  'transformationPhotos': instance.transformationPhotos,
};

_StorefrontPackageDto _$StorefrontPackageDtoFromJson(
  Map<String, dynamic> json,
) => _StorefrontPackageDto(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  price: json['price'] as String,
  duration: json['duration'] as String?,
  features:
      (json['features'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$StorefrontPackageDtoToJson(
  _StorefrontPackageDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'price': instance.price,
  'duration': instance.duration,
  'features': instance.features,
};

_StorefrontServiceDto _$StorefrontServiceDtoFromJson(
  Map<String, dynamic> json,
) => _StorefrontServiceDto(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  price: json['price'] as String?,
);

Map<String, dynamic> _$StorefrontServiceDtoToJson(
  _StorefrontServiceDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'price': instance.price,
};

_StorefrontSocialLinkDto _$StorefrontSocialLinkDtoFromJson(
  Map<String, dynamic> json,
) => _StorefrontSocialLinkDto(
  platform: json['platform'] as String,
  url: json['url'] as String,
);

Map<String, dynamic> _$StorefrontSocialLinkDtoToJson(
  _StorefrontSocialLinkDto instance,
) => <String, dynamic>{'platform': instance.platform, 'url': instance.url};

_StorefrontExternalLinkDto _$StorefrontExternalLinkDtoFromJson(
  Map<String, dynamic> json,
) => _StorefrontExternalLinkDto(
  label: json['label'] as String,
  url: json['url'] as String,
);

Map<String, dynamic> _$StorefrontExternalLinkDtoToJson(
  _StorefrontExternalLinkDto instance,
) => <String, dynamic>{'label': instance.label, 'url': instance.url};

_StorefrontTestimonialDto _$StorefrontTestimonialDtoFromJson(
  Map<String, dynamic> json,
) => _StorefrontTestimonialDto(
  id: json['id'] as String,
  clientName: json['clientName'] as String,
  clientAvatarUrl: json['clientAvatarUrl'] as String?,
  text: json['text'] as String,
  rating: (json['rating'] as num?)?.toDouble(),
  date: json['date'] as String?,
);

Map<String, dynamic> _$StorefrontTestimonialDtoToJson(
  _StorefrontTestimonialDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'clientName': instance.clientName,
  'clientAvatarUrl': instance.clientAvatarUrl,
  'text': instance.text,
  'rating': instance.rating,
  'date': instance.date,
};

_StorefrontPhotoDto _$StorefrontPhotoDtoFromJson(Map<String, dynamic> json) =>
    _StorefrontPhotoDto(
      id: json['id'] as String,
      url: json['url'] as String,
      caption: json['caption'] as String?,
    );

Map<String, dynamic> _$StorefrontPhotoDtoToJson(_StorefrontPhotoDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'caption': instance.caption,
    };
