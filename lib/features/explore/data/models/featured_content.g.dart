// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'featured_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FeaturedContent _$FeaturedContentFromJson(Map<String, dynamic> json) =>
    _FeaturedContent(
      featuredTrainers:
          (json['featuredTrainers'] as List<dynamic>?)
              ?.map(
                (e) => FeaturedTrainerDto.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <FeaturedTrainerDto>[],
      featuredEvents:
          (json['featuredEvents'] as List<dynamic>?)
              ?.map((e) => ExploreEventDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ExploreEventDto>[],
    );

Map<String, dynamic> _$FeaturedContentToJson(_FeaturedContent instance) =>
    <String, dynamic>{
      'featuredTrainers': instance.featuredTrainers,
      'featuredEvents': instance.featuredEvents,
    };

_FeaturedTrainerDto _$FeaturedTrainerDtoFromJson(Map<String, dynamic> json) =>
    _FeaturedTrainerDto(
      id: json['id'] as String,
      name: json['name'] as String? ?? 'Trainer',
      username: json['username'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      rating: (json['rating'] as num?)?.toDouble() ?? 5.0,
      isVerified: json['isVerified'] as bool? ?? false,
      specialties:
          (json['specialties'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      tier: json['tier'] as String?,
      source: json['source'] as String? ?? 'algorithm',
    );

Map<String, dynamic> _$FeaturedTrainerDtoToJson(_FeaturedTrainerDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'avatarUrl': instance.avatarUrl,
      'rating': instance.rating,
      'isVerified': instance.isVerified,
      'specialties': instance.specialties,
      'tier': instance.tier,
      'source': instance.source,
    };
