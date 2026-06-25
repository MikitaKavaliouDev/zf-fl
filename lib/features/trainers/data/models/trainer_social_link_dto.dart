import 'package:freezed_annotation/freezed_annotation.dart';

part 'trainer_social_link_dto.freezed.dart';
part 'trainer_social_link_dto.g.dart';

@freezed
abstract class TrainerSocialLinkDto with _$TrainerSocialLinkDto {
  const factory TrainerSocialLinkDto({
    required String id,
    required String platform,
    required String username,
    required String profileUrl,
  }) = _TrainerSocialLinkDto;

  factory TrainerSocialLinkDto.fromJson(Map<String, dynamic> json) =>
      _$TrainerSocialLinkDtoFromJson(json);
}
