import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'models/storefront_profile_dto.dart';
import 'models/storefront_requests.dart';
import 'models/stripe_status_dto.dart';

@injectable
class TrainerStorefrontApiService {
  final Dio _dio;

  TrainerStorefrontApiService(this._dio);

  /// GET /api/trainer/profile — fetch the trainer's own full profile.
  ///
  /// Response shape: { data: { profile: { ..., profile: { aboutMe, philosophy,
  /// methodology, specialties, certifications, profilePhotoPath, bannerImagePath,
  /// services, socialLinks, externalLinks, testimonials, transformationPhotos },
  /// packages: [...] } } }
  /// We flatten the nested `profile.profile` sub-object for the DTO.
  Future<StorefrontProfileDto> getProfile() async {
    final response = await _dio.get('/api/trainer/profile');
    final body = response.data['data'] as Map<String, dynamic>;
    final profile = body['profile'] as Map<String, dynamic>;
    final nestedProfile =
        (profile['profile'] as Map<String, dynamic>?) ?? {};

    final flat = Map<String, dynamic>.from(profile);
    flat['bio'] = nestedProfile['aboutMe'];
    flat['philosophy'] = nestedProfile['philosophy'];
    flat['methodology'] = nestedProfile['methodology'];
    final rawSpecialties = nestedProfile['specialties'];
    flat['specialties'] = (rawSpecialties is List)
        ? List<String>.from(rawSpecialties.map((e) => e.toString()))
        : <String>[];
    flat['certifications'] = nestedProfile['certifications'];
    flat['avatarUrl'] = nestedProfile['profilePhotoPath'];
    flat['bannerUrl'] = nestedProfile['bannerImagePath'];
    flat['services'] = nestedProfile['services'] ?? [];
    flat['socialLinks'] = nestedProfile['socialLinks'] ?? [];
    flat['externalLinks'] = nestedProfile['externalLinks'] ?? [];
    flat['testimonials'] = nestedProfile['testimonials'] ?? [];
    flat['transformationPhotos'] = nestedProfile['transformationPhotos'] ?? [];
    flat['averageRating'] = nestedProfile['averageRating'];
    flat['reviewCount'] = nestedProfile['reviewCount'] ?? 0;

    return StorefrontProfileDto.fromJson(flat);
  }

  /// GET /api/profile/me/billing — Stripe Connect status.
  Future<StripeStatusDto> getStripeStatus() async {
    final response = await _dio.get('/api/profile/me/billing');
    final data = response.data['data'] as Map<String, dynamic>;
    return StripeStatusDto.fromJson(data);
  }

  // ---------------------------------------------------------------------------
  // Core Info
  // ---------------------------------------------------------------------------

  /// PUT /api/profile/me/core-info — update core profile info.
  Future<void> updateCoreInfo(UpdateCoreInfoRequest request) async {
    developer.log('Updating core info', name: 'trainer.storefront');
    await _dio.put('/api/profile/me/core-info', data: request.toJson());
  }

  // ---------------------------------------------------------------------------
  // Text Content
  // ---------------------------------------------------------------------------

  /// PUT /api/profile/me/text-content — update a single text field.
  Future<void> updateTextContent(TextContentRequest request) async {
    developer.log('Updating text content: ${request.fieldName}',
        name: 'trainer.storefront');
    await _dio.put('/api/profile/me/text-content', data: request.toJson());
  }

  // ---------------------------------------------------------------------------
  // Packages
  // ---------------------------------------------------------------------------

  /// POST /api/profile/me/packages — create a package.
  Future<void> createPackage(PackageRequest request) async {
    developer.log('Creating package: ${request.name}',
        name: 'trainer.storefront');
    await _dio.post('/api/profile/me/packages', data: request.toJson());
  }

  /// PUT /api/profile/me/packages/$id — update a package.
  Future<void> updatePackage(String id, PackageRequest request) async {
    developer.log('Updating package $id', name: 'trainer.storefront');
    await _dio.put('/api/profile/me/packages/$id', data: request.toJson());
  }

  /// DELETE /api/profile/me/packages/$id — delete (archive) a package.
  Future<void> deletePackage(String id) async {
    developer.log('Deleting package $id', name: 'trainer.storefront');
    await _dio.delete('/api/profile/me/packages/$id');
  }

  // ---------------------------------------------------------------------------
  // Services
  // ---------------------------------------------------------------------------

  /// POST /api/profile/me/services — create a service.
  Future<void> createService(ServiceRequest request) async {
    developer.log('Creating service: ${request.title}',
        name: 'trainer.storefront');
    await _dio.post('/api/profile/me/services', data: request.toJson());
  }

  /// PUT /api/profile/me/services/$id — update a service.
  Future<void> updateService(String id, ServiceRequest request) async {
    developer.log('Updating service $id', name: 'trainer.storefront');
    await _dio.put('/api/profile/me/services/$id', data: request.toJson());
  }

  /// DELETE /api/profile/me/services/$id — delete a service.
  Future<void> deleteService(String id) async {
    developer.log('Deleting service $id', name: 'trainer.storefront');
    await _dio.delete('/api/profile/me/services/$id');
  }

  // ---------------------------------------------------------------------------
  // Social Links
  // ---------------------------------------------------------------------------

  /// POST /api/profile/me/social-links — create a social link.
  Future<void> createSocialLink(SocialLinkRequest request) async {
    developer.log('Creating social link: ${request.platform}',
        name: 'trainer.storefront');
    await _dio.post('/api/profile/me/social-links', data: request.toJson());
  }

  /// DELETE /api/profile/me/social-links/$id — delete a social link.
  Future<void> deleteSocialLink(String id) async {
    developer.log('Deleting social link $id', name: 'trainer.storefront');
    await _dio.delete('/api/profile/me/social-links/$id');
  }

  // ---------------------------------------------------------------------------
  // External Links
  // ---------------------------------------------------------------------------

  /// POST /api/profile/me/external-links — create an external link.
  Future<void> createExternalLink(ExternalLinkRequest request) async {
    developer.log('Creating external link: ${request.label}',
        name: 'trainer.storefront');
    await _dio.post('/api/profile/me/external-links', data: request.toJson());
  }

  /// DELETE /api/profile/me/external-links/$id — delete an external link.
  Future<void> deleteExternalLink(String id) async {
    developer.log('Deleting external link $id', name: 'trainer.storefront');
    await _dio.delete('/api/profile/me/external-links/$id');
  }
}
