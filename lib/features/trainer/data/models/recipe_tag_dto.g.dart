// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_tag_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecipeTagDto _$RecipeTagDtoFromJson(Map<String, dynamic> json) =>
    _RecipeTagDto(
      id: json['id'] as String,
      recipeId: json['recipeId'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$RecipeTagDtoToJson(_RecipeTagDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recipeId': instance.recipeId,
      'name': instance.name,
    };
