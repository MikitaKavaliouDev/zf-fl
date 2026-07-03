// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upsert_nutrition_plan_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpsertNutritionPlanRequestDto _$UpsertNutritionPlanRequestDtoFromJson(
  Map<String, dynamic> json,
) => _UpsertNutritionPlanRequestDto(
  title: json['title'] as String,
  calories: (json['calories'] as num?)?.toInt(),
  protein: (json['protein'] as num?)?.toInt(),
  carbs: (json['carbs'] as num?)?.toInt(),
  fats: (json['fats'] as num?)?.toInt(),
  mealNotes: json['mealNotes'] as String?,
  habitNotes: json['habitNotes'] as String?,
  foodsToEat: json['foodsToEat'] as String?,
  foodsToAvoid: json['foodsToAvoid'] as String?,
  mealTiming: json['mealTiming'] as String?,
  hydration: json['hydration'] as String?,
  supplements: json['supplements'] as String?,
  isActive: json['isActive'] as bool?,
  programId: json['programId'] as String?,
);

Map<String, dynamic> _$UpsertNutritionPlanRequestDtoToJson(
  _UpsertNutritionPlanRequestDto instance,
) => <String, dynamic>{
  'title': instance.title,
  'calories': instance.calories,
  'protein': instance.protein,
  'carbs': instance.carbs,
  'fats': instance.fats,
  'mealNotes': instance.mealNotes,
  'habitNotes': instance.habitNotes,
  'foodsToEat': instance.foodsToEat,
  'foodsToAvoid': instance.foodsToAvoid,
  'mealTiming': instance.mealTiming,
  'hydration': instance.hydration,
  'supplements': instance.supplements,
  'isActive': instance.isActive,
  'programId': instance.programId,
};
