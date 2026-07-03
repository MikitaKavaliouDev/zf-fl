import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/trainer_clients_api_service.dart';
import '../data/models/update_client_request_dto.dart';
import 'trainer_client_detail_state.dart';

@injectable
class TrainerClientDetailCubit extends Cubit<TrainerClientDetailState> {
  final TrainerClientsApiService _api;

  TrainerClientDetailCubit(this._api)
      : super(const TrainerClientDetailState.initial());

  Future<void> loadClient(String id) async {
    emit(const TrainerClientDetailState.loading());
    try {
      final client = await _api.getClientDetail(id);
      emit(TrainerClientDetailState.loaded(client: client));
    } catch (e) {
      developer.log('Client detail load failed: $e', name: 'trainer');
      emit(TrainerClientDetailState.error(e.toString()));
    }
  }

  Future<void> updateClient(
      String id, UpdateClientRequestDto request) async {
    try {
      final client = await _api.updateClient(id, request);
      emit(TrainerClientDetailState.loaded(client: client));
    } catch (e) {
      developer.log('Client update failed: $e', name: 'trainer');
    }
  }
}
