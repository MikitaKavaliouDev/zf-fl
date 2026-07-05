import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/trainer_clients_api_service.dart';
import 'trainer_client_packages_state.dart';

@injectable
class TrainerClientPackagesCubit
    extends Cubit<TrainerClientPackagesState> {
  final TrainerClientsApiService _api;

  TrainerClientPackagesCubit(this._api)
      : super(const TrainerClientPackagesState.initial());

  /// Load packages for a specific client.
  Future<void> loadPackages(String clientId) async {
    emit(const TrainerClientPackagesState.loading());
    try {
      final packages = await _api.getClientPackages(clientId);
      emit(TrainerClientPackagesState.loaded(packages));
    } catch (e) {
      developer.log('Failed to load client packages: $e', name: 'trainer');
      emit(TrainerClientPackagesState.error(e.toString()));
    }
  }
}
