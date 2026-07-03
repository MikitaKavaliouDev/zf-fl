import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/models/upsert_nutrition_plan_request_dto.dart';
import '../data/trainer_clients_api_service.dart';
import 'trainer_client_nutrition_state.dart';

@injectable
class TrainerClientNutritionCubit extends Cubit<TrainerClientNutritionState> {
  final TrainerClientsApiService _api;

  TrainerClientNutritionCubit(this._api)
      : super(const TrainerClientNutritionState.initial());

  /// Load the nutrition plan for a specific client.
  Future<void> loadPlan(String clientId) async {
    emit(const TrainerClientNutritionState.loading());
    try {
      final plan = await _api.getClientNutrition(clientId);
      emit(TrainerClientNutritionState.loaded(plan));
    } catch (e) {
      developer.log('Failed to load nutrition plan: $e', name: 'trainer');
      emit(TrainerClientNutritionState.error(e.toString()));
    }
  }

  /// Create or update a nutrition plan for a client, then reload.
  Future<void> upsertPlan(
    String clientId,
    UpsertNutritionPlanRequestDto request,
  ) async {
    emit(const TrainerClientNutritionState.loading());
    try {
      await _api.upsertNutritionPlan(clientId, request);
      final plan = await _api.getClientNutrition(clientId);
      emit(TrainerClientNutritionState.loaded(plan));
    } catch (e) {
      developer.log('Failed to upsert nutrition plan: $e', name: 'trainer');
      emit(TrainerClientNutritionState.error(e.toString()));
    }
  }
}
