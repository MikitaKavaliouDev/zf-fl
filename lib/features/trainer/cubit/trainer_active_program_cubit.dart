import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/trainer_clients_api_service.dart';
import 'trainer_active_program_state.dart';

@injectable
class TrainerActiveProgramCubit
    extends Cubit<TrainerActiveProgramState> {
  final TrainerClientsApiService _api;

  TrainerActiveProgramCubit(this._api)
      : super(const TrainerActiveProgramState.initial());

  /// Load the active program for a specific client.
  Future<void> loadProgram(String clientId) async {
    emit(const TrainerActiveProgramState.loading());
    try {
      final program = await _api.getClientActiveProgram(clientId);
      emit(TrainerActiveProgramState.loaded(program));
    } catch (e) {
      developer.log('Failed to load active program: $e', name: 'trainer');
      emit(TrainerActiveProgramState.error(e.toString()));
    }
  }

  /// Cancel the client's active program.
  Future<void> cancelProgram(String clientId, String programId) async {
    emit(const TrainerActiveProgramState.loading());
    try {
      await _api.cancelProgramAssignment(clientId, programId);
      emit(const TrainerActiveProgramState.loaded(null));
    } catch (e) {
      developer.log('Failed to cancel program: $e', name: 'trainer');
      emit(TrainerActiveProgramState.error(e.toString()));
    }
  }
}
