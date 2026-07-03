import 'package:freezed_annotation/freezed_annotation.dart';

part 'trainer_nutrition_plan_dto.freezed.dart';
part 'trainer_nutrition_plan_dto.g.dart';

@freezed
abstract class TrainerNutritionPlanDto with _$TrainerNutritionPlanDto {
  const factory TrainerNutritionPlanDto({
    required String id,
    required String title,
    String? programId,
    int? calories,
    int? protein,
    int? carbs,
    int? fats,
    String? mealNotes,
    String? habitNotes,
    String? foodsToEat,
    String? foodsToAvoid,
    String? mealTiming,
    String? hydration,
    String? supplements,
    required bool isActive,
    required String createdAt,
  }) = _TrainerNutritionPlanDto;

  factory TrainerNutritionPlanDto.fromJson(Map<String, dynamic> json) =>
      _$TrainerNutritionPlanDtoFromJson(json);
}
