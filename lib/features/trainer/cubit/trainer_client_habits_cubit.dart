import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/models/create_habit_request_dto.dart';
import '../data/trainer_clients_api_service.dart';
import 'trainer_client_habits_state.dart';

@injectable
class TrainerClientHabitsCubit extends Cubit<TrainerClientHabitsState> {
  final TrainerClientsApiService _api;

  TrainerClientHabitsCubit(this._api)
      : super(const TrainerClientHabitsState.initial());

  /// Load all habits for a specific client.
  Future<void> loadHabits(String clientId) async {
    emit(const TrainerClientHabitsState.loading());
    try {
      final habits = await _api.getClientHabits(clientId);
      emit(TrainerClientHabitsState.loaded(habits));
    } catch (e) {
      developer.log('Failed to load client habits: $e', name: 'trainer');
      emit(TrainerClientHabitsState.error(e.toString()));
    }
  }

  /// Create a new habit for a client, then reload the list.
  Future<void> createHabit(
    String clientId,
    CreateHabitRequestDto request,
  ) async {
    emit(const TrainerClientHabitsState.loading());
    try {
      await _api.createHabit(clientId, request);
      final habits = await _api.getClientHabits(clientId);
      emit(TrainerClientHabitsState.loaded(habits));
    } catch (e) {
      developer.log('Failed to create habit: $e', name: 'trainer');
      emit(TrainerClientHabitsState.error(e.toString()));
    }
  }

  /// Delete a habit for a client, then reload the list.
  Future<void> deleteHabit(String clientId, String habitId) async {
    emit(const TrainerClientHabitsState.loading());
    try {
      await _api.deleteHabit(clientId, habitId);
      final habits = await _api.getClientHabits(clientId);
      emit(TrainerClientHabitsState.loaded(habits));
    } catch (e) {
      developer.log('Failed to delete habit: $e', name: 'trainer');
      emit(TrainerClientHabitsState.error(e.toString()));
    }
  }
}
