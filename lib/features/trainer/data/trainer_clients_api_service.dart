import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'models/assign_program_request_dto.dart';
import 'models/assign_program_response_dto.dart';
import 'models/client_analytics_dto.dart';
import 'models/create_habit_request_dto.dart';
import 'models/trainer_client_detail_dto.dart';
import 'models/trainer_client_list_item_dto.dart';
import 'models/trainer_habit_dto.dart';
import 'models/trainer_nutrition_plan_dto.dart';
import 'models/update_client_request_dto.dart';
import 'models/upsert_nutrition_plan_request_dto.dart';

@injectable
class TrainerClientsApiService {
  final Dio _dio;

  TrainerClientsApiService(this._dio);

  // ── Client List ──

  /// GET /api/trainer/session-creation-data — returns basic client list.
  /// No dedicated GET /api/trainer/clients endpoint exists on the backend.
  Future<List<TrainerClientListItemDto>> getClients({
    int page = 1,
    int pageSize = 20,
    String? query,
    String? status,
  }) async {
    final response = await _dio.get('/api/trainer/session-creation-data');
    final data = response.data['data'] as Map<String, dynamic>;
    final clients = data['clients'] as List<dynamic>;
    return clients
        .map((e) => _mapToClientListItem(e as Map<String, dynamic>))
        .toList();
  }

  /// Map the {id, name, availableCredits} shape from session-creation-data
  /// to the full TrainerClientListItemDto, defaulting missing fields.
  TrainerClientListItemDto _mapToClientListItem(Map<String, dynamic> json) {
    return TrainerClientListItemDto(
      id: json['id'] as String,
      name: json['name'] as String,
      email: null,
      phone: null,
      status: 'active',
      userId: null,
      avatarUrl: null,
      lastWorkoutDate: null,
      engagementScore: 'medium',
      activeProgramName: null,
    );
  }

  // ── Client Detail ──

  /// GET /api/trainer/clients/:id — full client profile.
  Future<TrainerClientDetailDto> getClientDetail(String id) async {
    final response = await _dio.get('/api/trainer/clients/$id');
    final data = response.data['data'] as Map<String, dynamic>;
    return TrainerClientDetailDto.fromJson(data);
  }

  /// PUT /api/trainer/clients/:id — update client profile.
  Future<TrainerClientDetailDto> updateClient(
    String id,
    UpdateClientRequestDto request,
  ) async {
    final response = await _dio.put(
      '/api/trainer/clients/$id',
      data: request.toJson(),
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return TrainerClientDetailDto.fromJson(data);
  }

  // ── Client Analytics ──

  /// GET /api/trainer/clients/:id/analytics
  Future<ClientAnalyticsDto> getClientAnalytics(String id) async {
    final response = await _dio.get('/api/trainer/clients/$id/analytics');
    final data = response.data['data'] as Map<String, dynamic>;
    return ClientAnalyticsDto.fromJson(data);
  }

  // ── Habits ──

  /// GET /api/trainer/clients/:id/habits
  Future<List<TrainerHabitDto>> getClientHabits(String clientId) async {
    final response = await _dio.get('/api/trainer/clients/$clientId/habits');
    final data = response.data['data'] as Map<String, dynamic>;
    final habits = data['habits'] as List<dynamic>;
    return habits
        .map((e) => TrainerHabitDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// POST /api/trainer/clients/:id/habits — create a new habit for client.
  Future<TrainerHabitDto> createHabit(
    String clientId,
    CreateHabitRequestDto request,
  ) async {
    final response = await _dio.post(
      '/api/trainer/clients/$clientId/habits',
      data: request.toJson(),
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return TrainerHabitDto.fromJson(data);
  }

  // ── Program Assignment ──

  /// DELETE /api/trainer/clients/:clientId/habits/:habitId — delete a habit.
  Future<void> deleteHabit(String clientId, String habitId) async {
    await _dio.delete('/api/trainer/clients/$clientId/habits/$habitId');
  }

  // ── Nutrition ──

  /// GET /api/trainer/clients/:clientId/nutrition
  Future<TrainerNutritionPlanDto?> getClientNutrition(String clientId) async {
    final response = await _dio.get(
      '/api/trainer/clients/$clientId/nutrition',
    );
    final data = response.data['data'] as Map<String, dynamic>?;
    if (data == null) return null;
    return TrainerNutritionPlanDto.fromJson(data);
  }

  /// PUT /api/trainer/clients/:clientId/nutrition — create or update nutrition plan.
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

  // ── Program Assignment ──

  /// POST /api/trainer/clients/{clientId}/assign-program — assign a program to a client.
  Future<AssignProgramResponseDto> assignProgram(
    String clientId,
    AssignProgramRequestDto request,
  ) async {
    final response = await _dio.post(
      '/api/trainer/clients/$clientId/assign-program',
      data: request.toJson(),
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return AssignProgramResponseDto.fromJson(data);
  }
}
