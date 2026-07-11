import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../data/models/daily_habit_dto.dart';
import '../data/models/habit_log_dto.dart';
import '../data/models/nutrition_plan_dto.dart';
import '../data/nutrition_habits_repository.dart';
import 'nutrition_habits_state.dart';

@injectable
class NutritionHabitsCubit extends Cubit<NutritionHabitsState> {
  final NutritionHabitsRepository _repository;

  NutritionHabitsCubit(this._repository)
      : super(const NutritionHabitsState.initial());

  /// Load nutrition plan + habits in parallel.
  Future<void> loadData() async {
    emit(const NutritionHabitsState.loading());
    try {
      final results = await Future.wait([
        _repository.getNutritionPlan(),
        _repository.getHabits(),
      ]);
      final plan = results[0] as NutritionPlanDto?;
      final habits = results[1] as List<DailyHabitDto>;
      emit(NutritionHabitsState.loaded(
        plan: plan,
        habits: habits,
        selectedDate: DateTime.now(),
      ));
    } catch (e) {
      developer.log('NutritionHabitsCubit.loadData failed: $e',
          name: 'nutrition_habits');
      emit(const NutritionHabitsState.error('Failed to load data.'));
    }
  }

  /// Select a date to view habits for.
  void selectDate(DateTime date) {
    final s = state;
    if (s is NutritionHabitsLoaded) {
      emit(s.copyWith(selectedDate: date));
    }
  }

  /// Go back to today (reset selectedDate).
  void backToToday() {
    selectDate(DateTime.now());
  }

  /// Toggle a habit's completion for [selectedDate] with optimistic UI + rollback.
  Future<void> toggleHabit(String habitId, bool isCompleted) async {
    final s = state;
    if (s is! NutritionHabitsLoaded) return;
    final snapshot = s;

    final dateStr = DateFormat('yyyy-MM-dd').format(s.selectedDate);

    // Optimistic local update
    final updatedHabits = s.habits.map((habit) {
      if (habit.id != habitId) return habit;
      final existingLogs = habit.logs.toList();
      final idx = existingLogs.indexWhere((l) => l.date == dateStr);
      if (idx >= 0) {
        existingLogs[idx] = existingLogs[idx].copyWith(
          isCompleted: isCompleted,
        );
      } else {
        existingLogs.add(HabitLogDto(
          id: '',
          habitId: habitId,
          clientId: '',
          date: dateStr,
          isCompleted: isCompleted,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ));
      }
      return habit.copyWith(logs: existingLogs);
    }).toList();
    emit(NutritionHabitsState.loaded(
      plan: s.plan,
      habits: updatedHabits,
      selectedDate: s.selectedDate,
    ));

    try {
      final log = await _repository.logHabit(
        habitId,
        date: dateStr,
        isCompleted: isCompleted,
      );
      _repository.invalidateCache();
      // Confirmed — update with server response
      final confirmed = updatedHabits.map((habit) {
        if (habit.id != habitId) return habit;
        final existingLogs = habit.logs.toList();
        final idx = existingLogs.indexWhere((l) => l.date == log.date);
        if (idx >= 0) {
          existingLogs[idx] = log;
        } else {
          existingLogs.add(log);
        }
        return habit.copyWith(logs: existingLogs);
      }).toList();
      emit(NutritionHabitsState.loaded(
        plan: s.plan,
        habits: confirmed,
        selectedDate: s.selectedDate,
      ));
    } catch (e) {
      developer.log('NutritionHabitsCubit.toggleHabit failed: $e',
          name: 'nutrition_habits');
      emit(snapshot); // rollback to pre-mutation state
    }
  }

  /// Pull-to-refresh.
  Future<void> refresh() => loadData();
}
