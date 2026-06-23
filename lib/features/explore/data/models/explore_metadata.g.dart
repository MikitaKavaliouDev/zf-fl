// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExploreMetadata _$ExploreMetadataFromJson(Map<String, dynamic> json) =>
    _ExploreMetadata(
      cities:
          (json['cities'] as List<dynamic>?)
              ?.map((e) => ExploreCity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ExploreCity>[],
      categories:
          (json['categories'] as List<dynamic>?)
              ?.map((e) => ExploreCategory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ExploreCategory>[],
    );

Map<String, dynamic> _$ExploreMetadataToJson(_ExploreMetadata instance) =>
    <String, dynamic>{
      'cities': instance.cities,
      'categories': instance.categories,
    };
