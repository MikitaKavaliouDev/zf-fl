import 'package:freezed_annotation/freezed_annotation.dart';

part 'muscle_distribution_item_dto.freezed.dart';
part 'muscle_distribution_item_dto.g.dart';

@freezed
abstract class MuscleDistributionItemDto with _$MuscleDistributionItemDto {
  const factory MuscleDistributionItemDto({
    required String muscle,
    required int count,
  }) = _MuscleDistributionItemDto;

  factory MuscleDistributionItemDto.fromJson(Map<String, dynamic> json) =>
      _$MuscleDistributionItemDtoFromJson(json);
}
