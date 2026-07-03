// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_vault_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResourceVaultItemDto _$ResourceVaultItemDtoFromJson(
  Map<String, dynamic> json,
) => _ResourceVaultItemDto(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  fileUrl: json['fileUrl'] as String,
  fileType: json['fileType'] as String,
  createdAt: json['createdAt'] as String,
);

Map<String, dynamic> _$ResourceVaultItemDtoToJson(
  _ResourceVaultItemDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'fileUrl': instance.fileUrl,
  'fileType': instance.fileType,
  'createdAt': instance.createdAt,
};
