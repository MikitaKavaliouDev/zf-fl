import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../core/connectivity/connectivity_service.dart';
import '../../../core/network/response_cache.dart';
import 'home_api_service.dart';
import 'models/active_program_response.dart';
import 'models/client_dashboard_response.dart';

@singleton
class HomeRepository {
  final HomeApiService _api;
  final ConnectivityService _connectivity;
  final ResponseCache _cache;

  HomeRepository(this._api, this._connectivity, this._cache);

  static const _dashboardCacheKey = 'home:dashboard';

  /// Fetch the client dashboard with offline fallback.
  ///
  /// On success, the response is persisted to [ResponseCache]. On failure,
  /// if the device is offline, the last cached response is returned instead.
  Future<ClientDashboardResponse> getDashboard() async {
    try {
      final response = await _api.getDashboard();
      // Fire-and-forget: persist for offline fallback
      unawaited(_cache.set(_dashboardCacheKey, response.toJson()));
      return response;
    } catch (e) {
      if (await _connectivity.checkConnectivity()) rethrow;
      // Offline — return cached dashboard if available
      final cached = await _cache.get<ClientDashboardResponse>(
        _dashboardCacheKey,
        ClientDashboardResponse.fromJson,
      );
      if (cached != null) return cached;
      rethrow;
    }
  }

  Future<ActiveProgramResponse?> getActiveProgram() =>
      _api.getActiveProgram();
}
