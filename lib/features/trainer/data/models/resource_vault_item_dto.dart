import 'package:freezed_annotation/freezed_annotation.dart';

part 'resource_vault_item_dto.freezed.dart';
part 'resource_vault_item_dto.g.dart';

@freezed
abstract class ResourceVaultItemDto with _$ResourceVaultItemDto {
  const factory ResourceVaultItemDto({
    required String id,
    required String title,
    String? description,
    required String fileUrl,
    required String fileType,
    required String createdAt,
  }) = _ResourceVaultItemDto;

  factory ResourceVaultItemDto.fromJson(Map<String, dynamic> json) =>
      _$ResourceVaultItemDtoFromJson(json);
}
