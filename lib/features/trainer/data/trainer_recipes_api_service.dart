import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'models/trainer_recipe_dto.dart';

@injectable
class TrainerRecipesApiService {
  final Dio _dio;

  TrainerRecipesApiService(this._dio);

  /// GET /api/trainer/recipes — list recipes.
  Future<List<TrainerRecipeDto>> getRecipes({
    int page = 1,
    int pageSize = 20,
  }) async {
    final response = await _dio.get(
      '/api/trainer/recipes',
      queryParameters: {'page': page, 'pageSize': pageSize},
    );
    final data = response.data['data'] as Map<String, dynamic>;
    final recipes = data['recipes'] as List<dynamic>;
    return recipes
        .map((e) => TrainerRecipeDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// POST /api/trainer/recipes — create a recipe.
  Future<TrainerRecipeDto> createRecipe(Map<String, dynamic> request) async {
    final response = await _dio.post(
      '/api/trainer/recipes',
      data: request,
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return TrainerRecipeDto.fromJson(data);
  }

  /// PUT /api/trainer/recipes/:id — update a recipe.
  Future<TrainerRecipeDto> updateRecipe(
    String id,
    Map<String, dynamic> updates,
  ) async {
    final response = await _dio.put(
      '/api/trainer/recipes/$id',
      data: updates,
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return TrainerRecipeDto.fromJson(data);
  }

  /// DELETE /api/trainer/recipes/:id
  Future<void> deleteRecipe(String id) async {
    await _dio.delete('/api/trainer/recipes/$id');
  }
}
