// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_list_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainerProfileSummary _$TrainerProfileSummaryFromJson(
  Map<String, dynamic> json,
) => _TrainerProfileSummary(
  profilePhotoPath: json['profilePhotoPath'] as String?,
  certifications:
      (json['certifications'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  locations: json['locations'] as List<dynamic>? ?? const <dynamic>[],
  services: json['services'] as List<dynamic>? ?? const <dynamic>[],
  averageRating: (json['averageRating'] as num?)?.toDouble(),
  businessCurrency: json['businessCurrency'] as String?,
  name: json['name'] as String?,
  bio: json['bio'] as String?,
);

Map<String, dynamic> _$TrainerProfileSummaryToJson(
  _TrainerProfileSummary instance,
) => <String, dynamic>{
  'profilePhotoPath': instance.profilePhotoPath,
  'certifications': instance.certifications,
  'locations': instance.locations,
  'services': instance.services,
  'averageRating': instance.averageRating,
  'businessCurrency': instance.businessCurrency,
  'name': instance.name,
  'bio': instance.bio,
};

_TrainerStats _$TrainerStatsFromJson(Map<String, dynamic> json) =>
    _TrainerStats(
      reviewCount: (json['reviewCount'] as num?)?.toInt() ?? 0,
      clientsCoached: (json['clientsCoached'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$TrainerStatsToJson(_TrainerStats instance) =>
    <String, dynamic>{
      'reviewCount': instance.reviewCount,
      'clientsCoached': instance.clientsCoached,
    };

_TrainerListItemDto _$TrainerListItemDtoFromJson(Map<String, dynamic> json) =>
    _TrainerListItemDto(
      id: json['id'] as String,
      username: json['username'] as String,
      profile: json['profile'] == null
          ? null
          : TrainerProfileSummary.fromJson(
              json['profile'] as Map<String, dynamic>,
            ),
      stats: json['stats'] == null
          ? null
          : TrainerStats.fromJson(json['stats'] as Map<String, dynamic>),
      distance: (json['distance'] as num?)?.toDouble(),
      isLinked: json['isLinked'] as bool? ?? false,
    );

Map<String, dynamic> _$TrainerListItemDtoToJson(_TrainerListItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'profile': instance.profile,
      'stats': instance.stats,
      'distance': instance.distance,
      'isLinked': instance.isLinked,
    };

_TrainerListResponse _$TrainerListResponseFromJson(Map<String, dynamic> json) =>
    _TrainerListResponse(
      trainers:
          (json['trainers'] as List<dynamic>?)
              ?.map(
                (e) => TrainerListItemDto.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <TrainerListItemDto>[],
      totalTrainers: (json['totalTrainers'] as num?)?.toInt() ?? 0,
      currentPage: (json['currentPage'] as num?)?.toInt() ?? 1,
      totalPages: (json['totalPages'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$TrainerListResponseToJson(
  _TrainerListResponse instance,
) => <String, dynamic>{
  'trainers': instance.trainers,
  'totalTrainers': instance.totalTrainers,
  'currentPage': instance.currentPage,
  'totalPages': instance.totalPages,
};
