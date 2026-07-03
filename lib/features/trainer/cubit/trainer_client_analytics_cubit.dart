import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/trainer_clients_api_service.dart';
import 'trainer_client_analytics_state.dart';

@injectable
class TrainerClientAnalyticsCubit extends Cubit<TrainerClientAnalyticsState> {
  final TrainerClientsApiService _api;

  TrainerClientAnalyticsCubit(this._api)
      : super(const TrainerClientAnalyticsState.initial());

  /// Load analytics for a specific client.
  Future<void> loadAnalytics(String clientId) async {
    emit(const TrainerClientAnalyticsState.loading());
    try {
      final analytics = await _api.getClientAnalytics(clientId);
      emit(TrainerClientAnalyticsState.loaded(analytics));
    } catch (e) {
      developer.log('Failed to load client analytics: $e', name: 'trainer');
      emit(TrainerClientAnalyticsState.error(e.toString()));
    }
  }
}
