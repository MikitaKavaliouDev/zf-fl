// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_recipe_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainerRecipeDto _$TrainerRecipeDtoFromJson(Map<String, dynamic> json) =>
    _TrainerRecipeDto(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      instructions: json['instructions'] as String?,
      proteinG: (json['proteinG'] as num?)?.toDouble(),
      carbsG: (json['carbsG'] as num?)?.toDouble(),
      fatG: (json['fatG'] as num?)?.toDouble(),
      calories: (json['calories'] as num?)?.toInt(),
      difficulty: json['difficulty'] as String?,
      prepTime: (json['prepTime'] as num?)?.toInt(),
      cookTime: (json['cookTime'] as num?)?.toInt(),
      isPublished: json['isPublished'] as bool,
      tags:
          (json['tags'] as List<dynamic>?)
              ?.map((e) => RecipeTagDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      products:
          (json['products'] as List<dynamic>?)
              ?.map((e) => ProductDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$TrainerRecipeDtoToJson(_TrainerRecipeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'instructions': instance.instructions,
      'proteinG': instance.proteinG,
      'carbsG': instance.carbsG,
      'fatG': instance.fatG,
      'calories': instance.calories,
      'difficulty': instance.difficulty,
      'prepTime': instance.prepTime,
      'cookTime': instance.cookTime,
      'isPublished': instance.isPublished,
      'tags': instance.tags,
      'products': instance.products,
      'createdAt': instance.createdAt,
    };
