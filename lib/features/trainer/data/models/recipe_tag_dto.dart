import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_tag_dto.freezed.dart';
part 'recipe_tag_dto.g.dart';

@freezed
abstract class RecipeTagDto with _$RecipeTagDto {
  const factory RecipeTagDto({
    required String id,
    required String recipeId,
    required String name,
  }) = _RecipeTagDto;

  factory RecipeTagDto.fromJson(Map<String, dynamic> json) =>
      _$RecipeTagDtoFromJson(json);
}
