// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_preview_media_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainerPreviewMediaDto _$TrainerPreviewMediaDtoFromJson(
  Map<String, dynamic> json,
) => _TrainerPreviewMediaDto(
  id: json['id'] as String,
  order: (json['order'] as num).toInt(),
  type: json['type'] as String,
  url: json['url'] as String,
  thumbnailUrl: json['thumbnailUrl'] as String?,
  caption: json['caption'] as String?,
  createdAt: json['createdAt'] as String,
);

Map<String, dynamic> _$TrainerPreviewMediaDtoToJson(
  _TrainerPreviewMediaDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'order': instance.order,
  'type': instance.type,
  'url': instance.url,
  'thumbnailUrl': instance.thumbnailUrl,
  'caption': instance.caption,
  'createdAt': instance.createdAt,
};
