import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_text_content_dto.freezed.dart';
part 'profile_text_content_dto.g.dart';

@freezed
abstract class ProfileTextContentDto with _$ProfileTextContentDto {
  const factory ProfileTextContentDto({
    String? aboutMe,
    String? philosophy,
    String? methodology,
    String? branding,
  }) = _ProfileTextContentDto;

  factory ProfileTextContentDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileTextContentDtoFromJson(json);
}
