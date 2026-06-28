import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/fitness_goals_repository.dart';
import 'fitness_goals_state.dart';

@singleton
class FitnessGoalsCubit extends Cubit<FitnessGoalsState> {
  final FitnessGoalsRepository _repository;

  FitnessGoalsCubit(this._repository) : super(const FitnessGoalsState.initial());

  /// Load all fitness goals from the API.
  ///
  /// Skips the network call if state is already [FitnessGoalsLoaded] and
  /// [forceRefresh] is false. Since this cubit is a singleton shared across
  /// screens (analytics + fitness-goals), this eliminates cross-screen
  /// redundant fetches (Fix B).
  Future<void> loadGoals({bool forceRefresh = false}) async {
    if (!forceRefresh && state is FitnessGoalsLoaded) return;
    emit(const FitnessGoalsState.loading());
    try {
      final goals = await _repository.getGoals();
      emit(FitnessGoalsState.loaded(goals: goals));
    } catch (e) {
      developer.log('FitnessGoalsCubit.loadGoals failed: $e',
          name: 'fitness_goals');
      emit(const FitnessGoalsState.error('Failed to load fitness goals.'));
    }
  }

  /// Create a new fitness goal.
  Future<bool> createGoal(Map<String, dynamic> body) async {
    try {
      await _repository.createGoal(body);
      await loadGoals(forceRefresh: true);
      return true;
    } catch (e) {
      developer.log('FitnessGoalsCubit.createGoal failed: $e',
          name: 'fitness_goals');
      emit(const FitnessGoalsState.error('Failed to create goal.'));
      return false;
    }
  }

  /// Update an existing goal's current value or target value.
  Future<bool> updateGoal(
    String id, {
    double? targetValue,
    double? currentValue,
  }) async {
    try {
      await _repository.updateGoal(id,
          targetValue: targetValue, currentValue: currentValue);
      await loadGoals(forceRefresh: true);
      return true;
    } catch (e) {
      developer.log('FitnessGoalsCubit.updateGoal failed: $e',
          name: 'fitness_goals');
      emit(const FitnessGoalsState.error('Failed to update goal.'));
      return false;
    }
  }

  /// Delete a fitness goal by ID.
  Future<bool> deleteGoal(String id) async {
    try {
      await _repository.deleteGoal(id);
      await loadGoals(forceRefresh: true);
      return true;
    } catch (e) {
      developer.log('FitnessGoalsCubit.deleteGoal failed: $e',
          name: 'fitness_goals');
      emit(const FitnessGoalsState.error('Failed to delete goal.'));
      return false;
    }
  }

  /// Pull-to-refresh.
  Future<void> refresh() => loadGoals();
}
