import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_response_dto.freezed.dart';
part 'upload_response_dto.g.dart';

@freezed
abstract class UploadResponseDto with _$UploadResponseDto {
  const factory UploadResponseDto({
    required String imagePath,
    required String publicUrl,
  }) = _UploadResponseDto;

  factory UploadResponseDto.fromJson(Map<String, dynamic> json) =>
      _$UploadResponseDtoFromJson(json);
}
