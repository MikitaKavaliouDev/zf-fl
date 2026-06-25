import 'package:freezed_annotation/freezed_annotation.dart';

import 'trainer_benefit_dto.dart';
import 'trainer_external_link_dto.dart';
import 'trainer_location.dart';
import 'trainer_package_dto.dart';
import 'trainer_service_dto.dart';
import 'trainer_social_link_dto.dart';
import 'trainer_testimonial_dto.dart';
import 'trainer_transformation_photo_dto.dart';

part 'trainer_detail_dto.freezed.dart';
part 'trainer_detail_dto.g.dart';

List<String> _parseStringList(dynamic value) {
  if (value == null) return [];
  if (value is List) return value.cast<String>();
  if (value is String) {
    if (value.isEmpty) return [];
    // Handle PostgreSQL array format: {val1,val2}
    var str = value.trim();
    if (str.startsWith('{') && str.endsWith('}')) {
      str = str.substring(1, str.length - 1);
    }
    return str.split(',').map((s) => s.trim()).where((s) => s.isNotEmpty).toList();
  }
  return [];
}

/// Flattens the nested aggregated profile JSON from GET /api/trainers/[username]
/// into the flat structure expected by TrainerDetailDto.
///
/// Backend shape:
///   { id, name, username, ..., profile:{...}, stats:{...}, packages:[...] }
Map<String, dynamic> _flattenAggregatedProfile(Map<String, dynamic> json) {
  final result = <String, dynamic>{};

  // Copy top-level identity fields
  for (final key in ['id', 'name', 'username', 'email', 'role', 'tier', 'isLinked']) {
    if (json.containsKey(key)) result[key] = json[key];
  }

  // Flatten profile fields
  if (json['profile'] is Map<String, dynamic>) {
    final profile = json['profile'] as Map<String, dynamic>;
    final fieldMapping = <String, String>{
      'profilePhotoPath': 'profilePhotoPath',
      'bannerImagePath': 'bannerImagePath',
      'aboutMe': 'aboutMe',
      'philosophy': 'philosophy',
      'methodology': 'methodology',
      'branding': 'branding',
      'certifications': 'certifications',
      'specialties': 'specialties',
      'trainingTypes': 'trainingTypes',
      'minServicePrice': 'minServicePrice',
      'averageRating': 'averageRating',
      'businessCurrency': 'businessCurrency',
      'locations': 'locations',
      'services': 'services',
      'testimonials': 'testimonials',
      'socialLinks': 'socialLinks',
      'externalLinks': 'externalLinks',
      'benefits': 'benefits',
    };
    for (final entry in fieldMapping.entries) {
      if (profile.containsKey(entry.value)) {
        result[entry.key] = profile[entry.value];
      }
    }
    // Backend raw SQL returns "transformations" key, but we mapped to "transformationPhotos"
    if (profile.containsKey('transformationPhotos')) {
      result['transformationPhotos'] = profile['transformationPhotos'];
    } else if (profile.containsKey('transformations')) {
      result['transformationPhotos'] = profile['transformations'];
    }
  }

  // Flatten stats
  if (json['stats'] is Map<String, dynamic>) {
    final stats = json['stats'] as Map<String, dynamic>;
    if (stats.containsKey('reviewCount')) result['reviewCount'] = stats['reviewCount'];
    if (stats.containsKey('clientsCoached')) result['clientsCoached'] = stats['clientsCoached'];
  }

  // Packages at top level
  if (json['packages'] is List) {
    result['packages'] = json['packages'];
  }

  return result;
}

// ────────────────────────────────────────────
// Aggregated Trainer Profile (from GET /api/trainers/[username])
// Matches getTrainerAggregatedProfile() backend shape exactly.
// ────────────────────────────────────────────

@freezed
abstract class TrainerDetailDto with _$TrainerDetailDto {
  const factory TrainerDetailDto({
    // ── Identity ──
    required String id,
    String? name,
    String? username,
    String? email,
    String? role,
    String? tier,
    @Default(false) bool isLinked,

    // ── Profile Fields ──
    String? profilePhotoPath,
    String? bannerImagePath,
    String? aboutMe,
    String? philosophy,
    String? methodology,
    String? branding,
    String? certifications,
    @JsonKey(fromJson: _parseStringList) @Default(<String>[]) List<String> specialties,
    @JsonKey(fromJson: _parseStringList) @Default(<String>[]) List<String> trainingTypes,
    String? minServicePrice,
    double? averageRating,
    String? businessCurrency,

    // ── Nested Objects ──
    @Default(<TrainerLocation>[]) List<TrainerLocation> locations,
    @Default(<TrainerServiceDto>[]) List<TrainerServiceDto> services,
    @Default(<TrainerTestimonialDto>[]) List<TrainerTestimonialDto> testimonials,
    @Default(<TrainerTransformationPhotoDto>[])
    List<TrainerTransformationPhotoDto> transformationPhotos,
    @Default(<TrainerSocialLinkDto>[]) List<TrainerSocialLinkDto> socialLinks,
    @Default(<TrainerExternalLinkDto>[]) List<TrainerExternalLinkDto> externalLinks,
    @Default(<TrainerBenefitDto>[]) List<TrainerBenefitDto> benefits,

    // ── Stats ──
    @Default(0) int reviewCount,
    @Default(0) int clientsCoached,

    // ── Packages (included in aggregated response) ──
    @Default(<TrainerPackageDto>[]) List<TrainerPackageDto> packages,
  }) = _TrainerDetailDto;

  factory TrainerDetailDto.fromJson(Map<String, dynamic> json) =>
      _$TrainerDetailDtoFromJson(_flattenAggregatedProfile(json));
}
