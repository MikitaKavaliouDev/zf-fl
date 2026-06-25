import 'package:freezed_annotation/freezed_annotation.dart';

part 'trainer_preview_media_dto.freezed.dart';
part 'trainer_preview_media_dto.g.dart';

/// Preview media (images / videos) for the trainer profile carousel.
/// Mirrors the Prisma model `TrainerPreviewMedia` and the iOS `TrainerPreviewMedia`.
@freezed
abstract class TrainerPreviewMediaDto with _$TrainerPreviewMediaDto {
  const factory TrainerPreviewMediaDto({
    required String id,
    String? trainerId,
    required int order,
    required String type,
    required String url,
    String? thumbnailUrl,
    String? caption,
  }) = _TrainerPreviewMediaDto;

  factory TrainerPreviewMediaDto.fromJson(Map<String, dynamic> json) =>
      _$TrainerPreviewMediaDtoFromJson(json);
}