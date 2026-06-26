// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_plan_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NutritionPlanDto _$NutritionPlanDtoFromJson(Map<String, dynamic> json) =>
    _NutritionPlanDto(
      id: json['id'] as String,
      trainerId: json['trainerId'] as String,
      clientId: json['clientId'] as String,
      programId: json['programId'] as String?,
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
      isActive: json['isActive'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$NutritionPlanDtoToJson(_NutritionPlanDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'trainerId': instance.trainerId,
      'clientId': instance.clientId,
      'programId': instance.programId,
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
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
