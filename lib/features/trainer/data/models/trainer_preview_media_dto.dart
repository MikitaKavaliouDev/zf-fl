import 'package:freezed_annotation/freezed_annotation.dart';

part 'trainer_preview_media_dto.freezed.dart';
part 'trainer_preview_media_dto.g.dart';

@freezed
abstract class TrainerPreviewMediaDto with _$TrainerPreviewMediaDto {
  const factory TrainerPreviewMediaDto({
    required String id,
    required int order,
    required String type,
    required String url,
    String? thumbnailUrl,
    String? caption,
    required String createdAt,
  }) = _TrainerPreviewMediaDto;

  factory TrainerPreviewMediaDto.fromJson(Map<String, dynamic> json) =>
      _$TrainerPreviewMediaDtoFromJson(json);
}
