import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/models/assign_program_request_dto.dart';
import '../data/trainer_clients_api_service.dart';
import 'trainer_clients_state.dart';

@injectable
class TrainerClientsCubit extends Cubit<TrainerClientsState> {
  final TrainerClientsApiService _api;

  TrainerClientsCubit(this._api) : super(const TrainerClientsState.initial());

  /// Load all clients with optional status filter.
  Future<void> loadClients({String? status}) async {
    emit(const TrainerClientsState.loading());
    try {
      final clients = await _api.getClients(status: status);
      emit(TrainerClientsState.loaded(clients: clients));
    } catch (e) {
      developer.log('Failed to load clients: $e', name: 'trainer');
      emit(TrainerClientsState.error(e.toString()));
    }
  }

  /// Search clients by name, email, or phone.
  Future<void> searchClients(String query) async {
    emit(const TrainerClientsState.loading());
    try {
      final clients = await _api.getClients(query: query);
      emit(TrainerClientsState.loaded(
        clients: clients,
        isSearching: true,
      ));
    } catch (e) {
      developer.log('Failed to search clients: $e', name: 'trainer');
      emit(TrainerClientsState.error(e.toString()));
    }
  }

  /// Pull-to-refresh: reload clients without a query.
  Future<void> refresh() async {
    await loadClients();
  }

  /// Assign a program to a client. Pops the sheet on success.
  Future<void> assignProgram(
      String clientId, AssignProgramRequestDto request) async {
    try {
      await _api.assignProgram(clientId, request);
      await loadClients();
    } catch (e) {
      developer.log('Failed to assign program: $e', name: 'trainer');
      rethrow;
    }
  }
}
