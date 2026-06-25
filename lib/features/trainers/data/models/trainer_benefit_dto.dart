import 'package:freezed_annotation/freezed_annotation.dart';

part 'trainer_benefit_dto.freezed.dart';
part 'trainer_benefit_dto.g.dart';

@freezed
abstract class TrainerBenefitDto with _$TrainerBenefitDto {
  const factory TrainerBenefitDto({
    required String id,
    required String title,
    String? description,
    String? iconName,
  }) = _TrainerBenefitDto;

  factory TrainerBenefitDto.fromJson(Map<String, dynamic> json) =>
      _$TrainerBenefitDtoFromJson(json);
}
