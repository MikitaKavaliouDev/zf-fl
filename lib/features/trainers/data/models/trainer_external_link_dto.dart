import 'package:freezed_annotation/freezed_annotation.dart';

part 'trainer_external_link_dto.freezed.dart';
part 'trainer_external_link_dto.g.dart';

@freezed
abstract class TrainerExternalLinkDto with _$TrainerExternalLinkDto {
  const factory TrainerExternalLinkDto({
    required String id,
    required String label,
    required String linkUrl,
  }) = _TrainerExternalLinkDto;

  factory TrainerExternalLinkDto.fromJson(Map<String, dynamic> json) =>
      _$TrainerExternalLinkDtoFromJson(json);
}
