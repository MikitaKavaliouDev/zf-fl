import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/assign_program_request_dto.dart';
import '../data/models/trainer_client_list_item_dto.dart';
import '../data/trainer_clients_api_service.dart';
import 'trainer_clients_state.dart';

@injectable
class TrainerClientsCubit extends Cubit<TrainerClientsState> {
  final TrainerClientsApiService _api;

  TrainerClientsCubit(this._api) : super(const TrainerClientsState.initial());

  static const _cacheKey = 'trainer_clients_cache';

  /// Load all clients with optional status filter.
  ///
  /// Shows cached data immediately (first load only), then refreshes from API
  /// in the background. Matches iOS ClientsViewModel's CacheManager pattern.
  Future<void> loadClients({String? status}) async {
    // Phase 1: load from cache for instant display (first load only)
    List<TrainerClientListItemDto>? cached;
    if (state is TrainerClientsInitial) {
      try {
        final prefs = await SharedPreferences.getInstance();
        final cachedJson = prefs.getString(_cacheKey);
        if (cachedJson != null && cachedJson.isNotEmpty) {
          final decoded = (json.decode(cachedJson) as List)
              .map((e) => TrainerClientListItemDto.fromJson(
                  e as Map<String, dynamic>))
              .toList();
          cached = decoded;
          emit(TrainerClientsState.loaded(clients: decoded, isSearching: true));
          developer.log(
            'Loaded ${decoded.length} clients from cache',
            name: 'trainer',
          );
        }
      } catch (e) {
        developer.log('Failed to read client cache: $e', name: 'trainer');
      }
    }

    // Phase 2: fetch from API (always happens — overwrites cache)
    if (cached == null) {
      emit(const TrainerClientsState.loading());
    }
    try {
      final clients = await _api.getClients(status: status);
      // Save to cache
      try {
        final prefs = await SharedPreferences.getInstance();
        final jsonStr = json.encode(clients.map((c) => c.toJson()).toList());
        await prefs.setString(_cacheKey, jsonStr);
      } catch (e) {
        developer.log('Failed to cache clients: $e', name: 'trainer');
      }
      emit(TrainerClientsState.loaded(clients: clients));
    } catch (e) {
      developer.log('Failed to load clients from API: $e', name: 'trainer');
      // Only emit error if we have no cached data to show
      if (cached == null) {
        emit(TrainerClientsState.error(e.toString()));
      }
      // If cached data is already shown, stay on that state silently
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
