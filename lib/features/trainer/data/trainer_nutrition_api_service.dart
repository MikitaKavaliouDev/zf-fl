import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'models/trainer_nutrition_plan_dto.dart';
import 'models/upsert_nutrition_plan_request_dto.dart';

@injectable
class TrainerNutritionApiService {
  final Dio _dio;

  TrainerNutritionApiService(this._dio);

  /// GET /api/trainer/clients/:id/nutrition — client's nutrition plan.
  Future<TrainerNutritionPlanDto?> getClientNutrition(String clientId) async {
    final response = await _dio.get(
      '/api/trainer/clients/$clientId/nutrition',
    );
    final data = response.data['data'] as Map<String, dynamic>?;
    if (data == null) return null;
    return TrainerNutritionPlanDto.fromJson(data);
  }

  /// PUT /api/trainer/clients/:id/nutrition — upsert nutrition plan.
  Future<TrainerNutritionPlanDto> upsertNutritionPlan(
    String clientId,
    UpsertNutritionPlanRequestDto request,
  ) async {
    final response = await _dio.put(
      '/api/trainer/clients/$clientId/nutrition',
      data: request.toJson(),
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return TrainerNutritionPlanDto.fromJson(data);
  }
}
