// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_social_link_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainerSocialLinkDto _$TrainerSocialLinkDtoFromJson(
  Map<String, dynamic> json,
) => _TrainerSocialLinkDto(
  id: json['id'] as String,
  platform: json['platform'] as String,
  username: json['username'] as String,
  profileUrl: json['profileUrl'] as String,
);

Map<String, dynamic> _$TrainerSocialLinkDtoToJson(
  _TrainerSocialLinkDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'platform': instance.platform,
  'username': instance.username,
  'profileUrl': instance.profileUrl,
};
