// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UploadResponseDto _$UploadResponseDtoFromJson(Map<String, dynamic> json) =>
    _UploadResponseDto(
      imagePath: json['imagePath'] as String,
      publicUrl: json['publicUrl'] as String,
    );

Map<String, dynamic> _$UploadResponseDtoToJson(_UploadResponseDto instance) =>
    <String, dynamic>{
      'imagePath': instance.imagePath,
      'publicUrl': instance.publicUrl,
    };
