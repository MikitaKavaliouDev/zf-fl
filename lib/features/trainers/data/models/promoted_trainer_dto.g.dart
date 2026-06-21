// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promoted_trainer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PromotedTrainerDto _$PromotedTrainerDtoFromJson(Map<String, dynamic> json) =>
    _PromotedTrainerDto(
      id: json['id'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
      avatarUrl: json['avatarUrl'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      isVerified: json['isVerified'] as bool? ?? false,
      specialties:
          (json['specialties'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      promotionCategory: json['promotionCategory'] as String?,
      promotedAt: json['promotedAt'] as String?,
    );

Map<String, dynamic> _$PromotedTrainerDtoToJson(_PromotedTrainerDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'avatarUrl': instance.avatarUrl,
      'rating': instance.rating,
      'isVerified': instance.isVerified,
      'specialties': instance.specialties,
      'promotionCategory': instance.promotionCategory,
      'promotedAt': instance.promotedAt,
    };
