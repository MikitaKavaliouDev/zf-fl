// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_nutrition_plan_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainerNutritionPlanDto _$TrainerNutritionPlanDtoFromJson(
  Map<String, dynamic> json,
) => _TrainerNutritionPlanDto(
  id: json['id'] as String,
  title: json['title'] as String,
  programId: json['programId'] as String?,
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
  isActive: json['isActive'] as bool,
  createdAt: json['createdAt'] as String,
);

Map<String, dynamic> _$TrainerNutritionPlanDtoToJson(
  _TrainerNutritionPlanDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'programId': instance.programId,
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
  'createdAt': instance.createdAt,
};
