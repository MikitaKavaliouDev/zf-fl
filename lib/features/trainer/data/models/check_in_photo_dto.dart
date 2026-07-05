import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_in_photo_dto.freezed.dart';
part 'check_in_photo_dto.g.dart';

@freezed
abstract class CheckInPhotoDto with _$CheckInPhotoDto {
  const factory CheckInPhotoDto({
    required String id,
    String? imageUrl,
    String? imagePath,
    String? caption,
    String? photoDate,
  }) = _CheckInPhotoDto;

  factory CheckInPhotoDto.fromJson(Map<String, dynamic> json) =>
      _$CheckInPhotoDtoFromJson(json);
}
