// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_in_photo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CheckInPhotoDto _$CheckInPhotoDtoFromJson(Map<String, dynamic> json) =>
    _CheckInPhotoDto(
      id: json['id'] as String,
      imageUrl: json['imageUrl'] as String?,
      imagePath: json['imagePath'] as String?,
      caption: json['caption'] as String?,
      photoDate: json['photoDate'] as String?,
    );

Map<String, dynamic> _$CheckInPhotoDtoToJson(_CheckInPhotoDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'imagePath': instance.imagePath,
      'caption': instance.caption,
      'photoDate': instance.photoDate,
    };
