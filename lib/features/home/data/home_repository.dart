import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../core/network/response_cache.dart';
import 'home_api_service.dart';
import 'models/active_program_response.dart';
import 'models/client_dashboard_response.dart';

@singleton
class HomeRepository {
  final HomeApiService _api;
  final ResponseCache _cache;

  HomeRepository(this._api, this._cache);

  static const _dashboardCacheKey = 'home:dashboard';
  static const _activeProgramCacheKey = 'home:active-program';

  /// Fetch the client dashboard — cache-first.
  ///
  /// Returns cached data immediately (if available). When [forceRefresh]
  /// is true, bypasses the cache and awaits the network call directly.
  Future<ClientDashboardResponse> getDashboard({bool forceRefresh = false}) async {
    if (!forceRefresh) {
      final cached = await _cache.get<ClientDashboardResponse>(
        _dashboardCacheKey,
        ClientDashboardResponse.fromJson,
      );
      if (cached != null) return cached;
    }
    return _refreshDashboard();
  }

  /// Internal: fetch dashboard from API and persist to cache.
  Future<ClientDashboardResponse> _refreshDashboard() async {
    final response = await _api.getDashboard();
    await _cache.set(_dashboardCacheKey, response.toJson());
    return response;
  }

  /// Invalidate cached dashboard — call after mutations.
  Future<void> invalidateCache() async {
    await _cache.remove(_dashboardCacheKey);
  }

  /// Fetch the active program — cache-first.
  ///
  /// Returns cached data immediately (if available). When [forceRefresh]
  /// is true, bypasses the cache and calls the API directly.
  Future<ActiveProgramResponse?> getActiveProgram({bool forceRefresh = false}) async {
    if (!forceRefresh) {
      final cached = await _cache.get<ActiveProgramResponse>(
        _activeProgramCacheKey,
        ActiveProgramResponse.fromJson,
      );
      if (cached != null) return cached;
    }
    return _refreshActiveProgram();
  }

  Future<ActiveProgramResponse?> _refreshActiveProgram() async {
    final response = await _api.getActiveProgram();
    if (response != null) {
      await _cache.set(_activeProgramCacheKey, response.toJson());
    }
    return response;
  }
}
