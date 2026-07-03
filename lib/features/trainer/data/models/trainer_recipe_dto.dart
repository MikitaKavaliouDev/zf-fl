import 'package:freezed_annotation/freezed_annotation.dart';

import 'product_dto.dart';
import 'recipe_tag_dto.dart';

part 'trainer_recipe_dto.freezed.dart';
part 'trainer_recipe_dto.g.dart';

@freezed
abstract class TrainerRecipeDto with _$TrainerRecipeDto {
  const factory TrainerRecipeDto({
    required String id,
    required String name,
    String? description,
    String? instructions,
    double? proteinG,
    double? carbsG,
    double? fatG,
    int? calories,
    String? difficulty,
    int? prepTime,
    int? cookTime,
    required bool isPublished,
    @Default([]) List<RecipeTagDto> tags,
    @Default([]) List<ProductDto> products,
    required String createdAt,
  }) = _TrainerRecipeDto;

  factory TrainerRecipeDto.fromJson(Map<String, dynamic> json) =>
      _$TrainerRecipeDtoFromJson(json);
}
