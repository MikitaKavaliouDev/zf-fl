import 'package:freezed_annotation/freezed_annotation.dart';

part 'trainer_transformation_photo_dto.freezed.dart';
part 'trainer_transformation_photo_dto.g.dart';

@freezed
abstract class TrainerTransformationPhotoDto
    with _$TrainerTransformationPhotoDto {
  const factory TrainerTransformationPhotoDto({
    required String id,
    required String imagePath,
    String? caption,
    String? clientName,
    String? publicUrl,
    String? createdAt,
  }) = _TrainerTransformationPhotoDto;

  factory TrainerTransformationPhotoDto.fromJson(Map<String, dynamic> json) =>
      _$TrainerTransformationPhotoDtoFromJson(json);
}
