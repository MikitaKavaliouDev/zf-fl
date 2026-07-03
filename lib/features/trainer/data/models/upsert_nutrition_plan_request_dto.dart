import 'package:freezed_annotation/freezed_annotation.dart';

part 'upsert_nutrition_plan_request_dto.freezed.dart';
part 'upsert_nutrition_plan_request_dto.g.dart';

@freezed
abstract class UpsertNutritionPlanRequestDto
    with _$UpsertNutritionPlanRequestDto {
  const factory UpsertNutritionPlanRequestDto({
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
    bool? isActive,
    String? programId,
  }) = _UpsertNutritionPlanRequestDto;

  factory UpsertNutritionPlanRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UpsertNutritionPlanRequestDtoFromJson(json);
}
