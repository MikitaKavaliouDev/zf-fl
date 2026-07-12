// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storefront_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateCoreInfoRequest _$UpdateCoreInfoRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateCoreInfoRequest(
  name: json['name'] as String,
  username: json['username'] as String,
  certifications: json['certifications'] as String?,
  phone: json['phone'] as String?,
  specialties:
      (json['specialties'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$UpdateCoreInfoRequestToJson(
  _UpdateCoreInfoRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'username': instance.username,
  'certifications': instance.certifications,
  'phone': instance.phone,
  'specialties': instance.specialties,
};

_TextContentRequest _$TextContentRequestFromJson(Map<String, dynamic> json) =>
    _TextContentRequest(
      fieldName: json['fieldName'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$TextContentRequestToJson(_TextContentRequest instance) =>
    <String, dynamic>{
      'fieldName': instance.fieldName,
      'content': instance.content,
    };

_PackageRequest _$PackageRequestFromJson(Map<String, dynamic> json) =>
    _PackageRequest(
      name: json['name'] as String,
      description: json['description'] as String?,
      price: (json['price'] as num).toDouble(),
      numberOfSessions: (json['numberOfSessions'] as num).toInt(),
    );

Map<String, dynamic> _$PackageRequestToJson(_PackageRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'numberOfSessions': instance.numberOfSessions,
    };

_ServiceRequest _$ServiceRequestFromJson(Map<String, dynamic> json) =>
    _ServiceRequest(
      title: json['title'] as String,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ServiceRequestToJson(_ServiceRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'currency': instance.currency,
      'duration': instance.duration,
    };

_SocialLinkRequest _$SocialLinkRequestFromJson(Map<String, dynamic> json) =>
    _SocialLinkRequest(
      platform: json['platform'] as String,
      username: json['username'] as String,
      profileUrl: json['profileUrl'] as String,
    );

Map<String, dynamic> _$SocialLinkRequestToJson(_SocialLinkRequest instance) =>
    <String, dynamic>{
      'platform': instance.platform,
      'username': instance.username,
      'profileUrl': instance.profileUrl,
    };

_ExternalLinkRequest _$ExternalLinkRequestFromJson(Map<String, dynamic> json) =>
    _ExternalLinkRequest(
      label: json['label'] as String,
      linkUrl: json['linkUrl'] as String,
    );

Map<String, dynamic> _$ExternalLinkRequestToJson(
  _ExternalLinkRequest instance,
) => <String, dynamic>{'label': instance.label, 'linkUrl': instance.linkUrl};
