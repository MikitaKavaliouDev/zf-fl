// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_transformation_photo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainerTransformationPhotoDto _$TrainerTransformationPhotoDtoFromJson(
  Map<String, dynamic> json,
) => _TrainerTransformationPhotoDto(
  id: json['id'] as String,
  imagePath: json['imagePath'] as String,
  caption: json['caption'] as String?,
  clientName: json['clientName'] as String?,
  publicUrl: json['publicUrl'] as String?,
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$TrainerTransformationPhotoDtoToJson(
  _TrainerTransformationPhotoDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'imagePath': instance.imagePath,
  'caption': instance.caption,
  'clientName': instance.clientName,
  'publicUrl': instance.publicUrl,
  'createdAt': instance.createdAt,
};
