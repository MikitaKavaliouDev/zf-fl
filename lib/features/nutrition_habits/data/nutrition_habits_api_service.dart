import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'models/daily_habit_dto.dart';
import 'models/habit_log_dto.dart';
import 'models/nutrition_plan_dto.dart';

@injectable
class NutritionHabitsApiService {
  final Dio _dio;

  NutritionHabitsApiService(this._dio);

  /// GET /api/client/nutrition — fetch the client's nutrition plan (may be null).
  Future<NutritionPlanDto?> getNutritionPlan() async {
    final response = await _dio.get('/api/client/nutrition');
    final planRaw = response.data['data']['plan'];
    if (planRaw == null) return null;
    return NutritionPlanDto.fromJson(planRaw as Map<String, dynamic>);
  }

  /// GET /api/client/habits — fetch active habits for the client.
  Future<List<DailyHabitDto>> getHabits() async {
    final response = await _dio.get('/api/client/habits');
    final rawList = response.data['data']['habits'] as List<dynamic>;
    return rawList
        .map((e) => DailyHabitDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// POST /api/client/habits/{habitId}/log — toggle habit completion.
  Future<HabitLogDto> logHabit(
    String habitId, {
    required String date,
    required bool isCompleted,
    String? note,
  }) async {
    final response = await _dio.post(
      '/api/client/habits/$habitId/log',
      data: {
        'date': date,
        'isCompleted': isCompleted,
        ?'note': note,
      },
    );
    final data = response.data['data']['log'] as Map<String, dynamic>;
    return HabitLogDto.fromJson(data);
  }
}
