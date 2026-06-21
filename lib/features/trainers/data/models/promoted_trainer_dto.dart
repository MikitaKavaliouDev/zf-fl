import 'package:freezed_annotation/freezed_annotation.dart';

part 'promoted_trainer_dto.freezed.dart';
part 'promoted_trainer_dto.g.dart';

@freezed
abstract class PromotedTrainerDto with _$PromotedTrainerDto {
  const factory PromotedTrainerDto({
    required String id,
    required String name,
    required String username,
    String? avatarUrl,
    double? rating,
    @Default(false) bool isVerified,
    @Default(<String>[]) List<String> specialties,
    String? promotionCategory,
    String? promotedAt,
  }) = _PromotedTrainerDto;

  factory PromotedTrainerDto.fromJson(Map<String, dynamic> json) =>
      _$PromotedTrainerDtoFromJson(json);
}
