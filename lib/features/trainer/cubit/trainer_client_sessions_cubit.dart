import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/trainer_clients_api_service.dart';
import 'trainer_client_sessions_state.dart';

@injectable
class TrainerClientSessionsCubit
    extends Cubit<TrainerClientSessionsState> {
  final TrainerClientsApiService _api;

  TrainerClientSessionsCubit(this._api)
      : super(const TrainerClientSessionsState.initial());

  /// Load sessions for a specific client.
  Future<void> loadSessions(String clientId, {int limit = 50}) async {
    emit(const TrainerClientSessionsState.loading());
    try {
      final sessions =
          await _api.getClientSessions(clientId, limit: limit);
      emit(TrainerClientSessionsState.loaded(sessions));
    } catch (e) {
      developer.log('Failed to load client sessions: $e', name: 'trainer');
      emit(TrainerClientSessionsState.error(e.toString()));
    }
  }
}
