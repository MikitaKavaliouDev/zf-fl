import 'package:freezed_annotation/freezed_annotation.dart';

part 'storefront_profile_dto.freezed.dart';
part 'storefront_profile_dto.g.dart';

@freezed
abstract class StorefrontProfileDto with _$StorefrontProfileDto {
  const factory StorefrontProfileDto({
    required String name,
    String? username,
    String? bio,
    String? philosophy,
    String? methodology,
    String? specialties,
    String? certifications,
    String? qualifications,
    String? avatarUrl,
    String? bannerUrl,
    @Default([]) List<String> tags,
    @Default([]) List<StorefrontPackageDto> packages,
    @Default([]) List<StorefrontServiceDto> services,
    @Default([]) List<StorefrontSocialLinkDto> socialLinks,
    @Default([]) List<StorefrontExternalLinkDto> externalLinks,
    @Default([]) List<StorefrontTestimonialDto> testimonials,
    @Default([]) List<StorefrontPhotoDto> transformationPhotos,
  }) = _StorefrontProfileDto;

  factory StorefrontProfileDto.fromJson(Map<String, dynamic> json) =>
      _$StorefrontProfileDtoFromJson(json);
}

@freezed
abstract class StorefrontPackageDto with _$StorefrontPackageDto {
  const factory StorefrontPackageDto({
    required String id,
    required String name,
    String? description,
    required String price,
    String? duration,
    @Default([]) List<String> features,
  }) = _StorefrontPackageDto;

  factory StorefrontPackageDto.fromJson(Map<String, dynamic> json) =>
      _$StorefrontPackageDtoFromJson(json);
}

@freezed
abstract class StorefrontServiceDto with _$StorefrontServiceDto {
  const factory StorefrontServiceDto({
    required String id,
    required String name,
    String? description,
    String? price,
  }) = _StorefrontServiceDto;

  factory StorefrontServiceDto.fromJson(Map<String, dynamic> json) =>
      _$StorefrontServiceDtoFromJson(json);
}

@freezed
abstract class StorefrontSocialLinkDto with _$StorefrontSocialLinkDto {
  const factory StorefrontSocialLinkDto({
    required String platform,
    required String url,
  }) = _StorefrontSocialLinkDto;

  factory StorefrontSocialLinkDto.fromJson(Map<String, dynamic> json) =>
      _$StorefrontSocialLinkDtoFromJson(json);
}

@freezed
abstract class StorefrontExternalLinkDto with _$StorefrontExternalLinkDto {
  const factory StorefrontExternalLinkDto({
    required String label,
    required String url,
  }) = _StorefrontExternalLinkDto;

  factory StorefrontExternalLinkDto.fromJson(Map<String, dynamic> json) =>
      _$StorefrontExternalLinkDtoFromJson(json);
}

@freezed
abstract class StorefrontTestimonialDto with _$StorefrontTestimonialDto {
  const factory StorefrontTestimonialDto({
    required String id,
    required String clientName,
    String? clientAvatarUrl,
    required String text,
    double? rating,
    String? date,
  }) = _StorefrontTestimonialDto;

  factory StorefrontTestimonialDto.fromJson(Map<String, dynamic> json) =>
      _$StorefrontTestimonialDtoFromJson(json);
}

@freezed
abstract class StorefrontPhotoDto with _$StorefrontPhotoDto {
  const factory StorefrontPhotoDto({
    required String id,
    required String url,
    String? caption,
  }) = _StorefrontPhotoDto;

  factory StorefrontPhotoDto.fromJson(Map<String, dynamic> json) =>
      _$StorefrontPhotoDtoFromJson(json);
}
