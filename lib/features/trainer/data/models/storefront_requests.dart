import 'package:freezed_annotation/freezed_annotation.dart';

part 'storefront_requests.freezed.dart';
part 'storefront_requests.g.dart';

/// PUT /api/profile/me/core-info — update core profile name/username/specialties.
@freezed
abstract class UpdateCoreInfoRequest with _$UpdateCoreInfoRequest {
  const factory UpdateCoreInfoRequest({
    required String name,
    required String username,
    String? certifications,
    String? phone,
    @Default([]) List<String> specialties,
  }) = _UpdateCoreInfoRequest;

  factory UpdateCoreInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateCoreInfoRequestFromJson(json);
}

/// PUT /api/profile/me/text-content — update a single text field (aboutMe,
/// philosophy, methodology, or branding).
@freezed
abstract class TextContentRequest with _$TextContentRequest {
  const factory TextContentRequest({
    required String fieldName,
    required String content,
  }) = _TextContentRequest;

  factory TextContentRequest.fromJson(Map<String, dynamic> json) =>
      _$TextContentRequestFromJson(json);
}

/// POST /api/profile/me/packages / PUT /api/profile/me/packages/[id]
@freezed
abstract class PackageRequest with _$PackageRequest {
  const factory PackageRequest({
    required String name,
    String? description,
    required double price,
    required int numberOfSessions,
  }) = _PackageRequest;

  factory PackageRequest.fromJson(Map<String, dynamic> json) =>
      _$PackageRequestFromJson(json);
}

/// POST /api/profile/me/services / PUT /api/profile/me/services/[id]
@freezed
abstract class ServiceRequest with _$ServiceRequest {
  const factory ServiceRequest({
    required String title,
    String? description,
    double? price,
    String? currency,
    int? duration,
  }) = _ServiceRequest;

  factory ServiceRequest.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestFromJson(json);
}

/// POST /api/profile/me/social-links
@freezed
abstract class SocialLinkRequest with _$SocialLinkRequest {
  const factory SocialLinkRequest({
    required String platform,
    required String username,
    @JsonKey(name: 'profileUrl') required String profileUrl,
  }) = _SocialLinkRequest;

  factory SocialLinkRequest.fromJson(Map<String, dynamic> json) =>
      _$SocialLinkRequestFromJson(json);
}

/// POST /api/profile/me/external-links
@freezed
abstract class ExternalLinkRequest with _$ExternalLinkRequest {
  const factory ExternalLinkRequest({
    required String label,
    @JsonKey(name: 'linkUrl') required String linkUrl,
  }) = _ExternalLinkRequest;

  factory ExternalLinkRequest.fromJson(Map<String, dynamic> json) =>
      _$ExternalLinkRequestFromJson(json);
}
