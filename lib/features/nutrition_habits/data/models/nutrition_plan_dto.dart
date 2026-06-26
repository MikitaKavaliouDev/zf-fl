import 'package:freezed_annotation/freezed_annotation.dart';

part 'nutrition_plan_dto.freezed.dart';
part 'nutrition_plan_dto.g.dart';

@freezed
abstract class NutritionPlanDto with _$NutritionPlanDto {
  const factory NutritionPlanDto({
    required String id,
    required String trainerId,
    required String clientId,
    String? programId,
    required String title,
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
    @Default(false) bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _NutritionPlanDto;

  const NutritionPlanDto._();

  factory NutritionPlanDto.fromJson(Map<String, dynamic> json) =>
      _$NutritionPlanDtoFromJson(json);
}
