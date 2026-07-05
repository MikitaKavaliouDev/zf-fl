import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'models/assign_program_request_dto.dart';
import 'models/assign_program_response_dto.dart';
import 'models/client_analytics_dto.dart';
import 'models/create_habit_request_dto.dart';
import 'models/log_habit_request_dto.dart';
import 'models/request_check_in_dto.dart';
import 'models/trainer_client_active_program_dto.dart';
import 'models/trainer_client_detail_dto.dart';
import 'models/trainer_client_list_item_dto.dart';
import 'models/trainer_client_package_dto.dart';
import 'models/trainer_client_session_dto.dart';
import 'models/trainer_habit_dto.dart';
import 'models/trainer_nutrition_plan_dto.dart';
import 'models/update_client_request_dto.dart';
import 'models/update_habit_request_dto.dart';
import 'models/upsert_nutrition_plan_request_dto.dart';

@injectable
class TrainerClientsApiService {
  final Dio _dio;

  TrainerClientsApiService(this._dio);

  // ── Client List ──

  /// GET /api/clients — list of trainer's clients (no /api/trainer/clients alias).
  /// Supports pagination via [page]/[pageSize], and [query]/[status] filters.
  Future<List<TrainerClientListItemDto>> getClients({
    int page = 1,
    int pageSize = 20,
    String? query,
    String? status,
  }) async {
    final params = <String, dynamic>{
      'limit': pageSize,
    };
    if (query != null && query.isNotEmpty) params['search'] = query;
    if (status != null) params['status'] = status;

    final response = await _dio.get(
      '/api/clients',
      queryParameters: params,
    );
    final data = response.data['data'] as Map<String, dynamic>;
    final clients = data['clients'] as List<dynamic>;
    return clients
        .map((e) => TrainerClientListItemDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  // ── Client Detail ──

  /// GET /api/trainer/clients/:id — full client profile.
  Future<TrainerClientDetailDto> getClientDetail(String id) async {
    final response = await _dio.get('/api/trainer/clients/$id');
    final data = response.data['data'] as Map<String, dynamic>;
    final client = data['client'] as Map<String, dynamic>;
    return TrainerClientDetailDto.fromJson(client);
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
    final client = data['client'] as Map<String, dynamic>;
    return TrainerClientDetailDto.fromJson(client);
  }

  // ── Client Analytics ──

  /// GET /api/trainer/clients/:id/analytics?days=30
  Future<ClientAnalyticsDto> getClientAnalytics(String id, {int days = 30}) async {
    final response = await _dio.get(
      '/api/trainer/clients/$id/analytics',
      queryParameters: {'days': days},
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return ClientAnalyticsDto.fromJson(data);
  }

  // ── Client Sessions ──

  /// GET /api/clients/:id/sessions — client's workout session history.
  Future<List<TrainerClientSessionDto>> getClientSessions(
    String clientId, {
    int limit = 50,
    int offset = 0,
  }) async {
    final response = await _dio.get(
      '/api/clients/$clientId/sessions',
      queryParameters: {'limit': limit, 'offset': offset},
    );
    final data = response.data['data'] as Map<String, dynamic>;
    final sessions = data['sessions'] as List<dynamic>;
    return sessions
        .map((e) =>
            TrainerClientSessionDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  // ── Active Program ──

  /// GET /api/clients/:id/program/active — client's currently assigned program.
  Future<TrainerClientActiveProgramDto?> getClientActiveProgram(
      String clientId) async {
    try {
      final response = await _dio.get(
        '/api/clients/$clientId/program/active',
      );
      final data = response.data['data'] as Map<String, dynamic>;
      return TrainerClientActiveProgramDto.fromJson(data);
    } catch (e) {
      // 404 means no active program — return null
      if (e is DioException && e.response?.statusCode == 404) return null;
      rethrow;
    }
  }

  /// POST /api/trainer/clients/:clientId/programs/:programId/cancel
  Future<void> cancelProgramAssignment(
      String clientId, String programId) async {
    await _dio.post(
      '/api/trainer/clients/$clientId/programs/$programId/cancel',
    );
  }

  // ── Client Packages ──

  /// GET /api/clients/:id/packages — client's purchased packages.
  Future<List<TrainerClientPackageDto>> getClientPackages(
      String clientId) async {
    final response = await _dio.get('/api/clients/$clientId/packages');
    final data = response.data['data'] as Map<String, dynamic>;
    final packages = data['packages'] as List<dynamic>;
    return packages
        .map((e) =>
            TrainerClientPackageDto.fromJson(e as Map<String, dynamic>))
        .toList();
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
    final respData = response.data['data'] as Map<String, dynamic>;
    final habit = respData['habit'] as Map<String, dynamic>?;
    if (habit != null) return TrainerHabitDto.fromJson(habit);
    return TrainerHabitDto.fromJson(respData);
  }

  /// PUT /api/trainer/clients/:clientId/habits/:habitId — update a habit.
  Future<TrainerHabitDto> updateHabit(
    String clientId,
    String habitId,
    UpdateHabitRequestDto request,
  ) async {
    final response = await _dio.put(
      '/api/trainer/clients/$clientId/habits/$habitId',
      data: request.toJson(),
    );
    final respData = response.data['data'] as Map<String, dynamic>;
    final habit = respData['habit'] as Map<String, dynamic>?;
    if (habit != null) return TrainerHabitDto.fromJson(habit);
    return TrainerHabitDto.fromJson(respData);
  }

  /// DELETE /api/trainer/clients/:clientId/habits/:habitId — delete a habit.
  Future<void> deleteHabit(String clientId, String habitId) async {
    await _dio.delete('/api/trainer/clients/$clientId/habits/$habitId');
  }

  /// POST /api/trainer/clients/:clientId/habits/:habitId/log
  Future<void> logHabit(
    String clientId,
    String habitId,
    LogHabitRequestDto request,
  ) async {
    await _dio.post(
      '/api/trainer/clients/$clientId/habits/$habitId/log',
      data: request.toJson(),
    );
  }

  // ── Nutrition ──

  /// GET /api/trainer/clients/:clientId/nutrition
  Future<TrainerNutritionPlanDto?> getClientNutrition(String clientId) async {
    final response = await _dio.get(
      '/api/trainer/clients/$clientId/nutrition',
    );
    final data = response.data['data'] as Map<String, dynamic>?;
    if (data == null) return null;
    final plan = data['plan'] as Map<String, dynamic>?;
    if (plan == null) return null;
    return TrainerNutritionPlanDto.fromJson(plan);
  }

  /// POST /api/trainer/clients/:clientId/nutrition — create or update nutrition plan.
  Future<TrainerNutritionPlanDto> upsertNutritionPlan(
    String clientId,
    UpsertNutritionPlanRequestDto request,
  ) async {
    final response = await _dio.post(
      '/api/trainer/clients/$clientId/nutrition',
      data: request.toJson(),
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return TrainerNutritionPlanDto.fromJson(data);
  }

  /// DELETE /api/trainer/nutrition/:planId
  Future<void> deleteNutritionPlan(String planId) async {
    await _dio.delete('/api/trainer/nutrition/$planId');
  }

  // ── Program Assignment ──

  /// POST /api/trainer/clients/{clientId}/assign-program
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

  // ── Check-In Request ──

  /// POST /api/trainer/check-ins/request
  Future<void> requestCheckIn(RequestCheckInDto request) async {
    await _dio.post(
      '/api/trainer/check-ins/request',
      data: request.toJson(),
    );
  }

  // ── Client Creation & Invitation ──

  /// POST /api/clients — create a new client record.
  Future<Map<String, dynamic>> createClient({
    required String email,
    String? name,
    String? phone,
  }) async {
    final response = await _dio.post(
      '/api/clients',
      data: {
        'email': email,
        'name': name ?? email.split('@')[0],
        if (phone != null) 'phone': phone,
      },
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return data;
  }

  /// POST /api/clients/invite — invite a client by email (sends invitation email).
  Future<Map<String, dynamic>> inviteClient({
    required String email,
    String? name,
    String? phone,
  }) async {
    final response = await _dio.post(
      '/api/clients/invite',
      data: {
        'email': email,
        if (name != null) 'name': name,
        if (phone != null) 'phone': phone,
      },
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return data;
  }

  /// POST /api/clients/request-link — request to link to an existing user.
  Future<Map<String, dynamic>> requestLink(String email) async {
    final response = await _dio.post(
      '/api/clients/request-link',
      data: {'email': email},
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return data;
  }
}
