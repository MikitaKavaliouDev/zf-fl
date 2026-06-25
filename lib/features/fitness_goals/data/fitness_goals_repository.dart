import 'package:injectable/injectable.dart';

import 'fitness_goals_api_service.dart';
import 'models/fitness_goal_dto.dart';

@singleton
class FitnessGoalsRepository {
  final FitnessGoalsApiService _api;

  FitnessGoalsRepository(this._api);

  Future<List<FitnessGoalDto>> getGoals() => _api.getGoals();

  Future<FitnessGoalDto> createGoal(Map<String, dynamic> body) =>
      _api.createGoal(body);

  Future<FitnessGoalDto> updateGoal(
    String id, {
    double? targetValue,
    double? currentValue,
  }) =>
      _api.updateGoal(id, targetValue: targetValue, currentValue: currentValue);

  Future<void> deleteGoal(String id) => _api.deleteGoal(id);
}
