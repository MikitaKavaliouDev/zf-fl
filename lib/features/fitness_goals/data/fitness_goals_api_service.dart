import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'models/fitness_goal_dto.dart';

@injectable
class FitnessGoalsApiService {
  final Dio _dio;

  FitnessGoalsApiService(this._dio);

  /// GET /api/client/fitness-goals — fetch all fitness goals.
  Future<List<FitnessGoalDto>> getGoals() async {
    final response = await _dio.get('/api/client/fitness-goals');
    final rawList = response.data['data']['goals'] as List<dynamic>;
    return rawList
        .map((e) => FitnessGoalDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// POST /api/client/fitness-goals — create a new fitness goal.
  Future<FitnessGoalDto> createGoal(Map<String, dynamic> body) async {
    final response = await _dio.post('/api/client/fitness-goals', data: body);
    final data = response.data['data']['goal'] as Map<String, dynamic>;
    return FitnessGoalDto.fromJson(data);
  }

  /// PUT /api/client/fitness-goals/{id} — update an existing goal.
  Future<FitnessGoalDto> updateGoal(
    String id, {
    double? targetValue,
    double? currentValue,
  }) async {
    final body = <String, dynamic>{};
    if (targetValue != null) body['targetValue'] = targetValue;
    if (currentValue != null) body['currentValue'] = currentValue;
    final response = await _dio.put('/api/client/fitness-goals/$id', data: body);
    final data = response.data['data']['goal'] as Map<String, dynamic>;
    return FitnessGoalDto.fromJson(data);
  }

  /// DELETE /api/client/fitness-goals/{id} — delete a goal.
  Future<void> deleteGoal(String id) async {
    await _dio.delete('/api/client/fitness-goals/$id');
  }
}
