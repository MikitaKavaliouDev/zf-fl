import 'package:injectable/injectable.dart';

import 'home_api_service.dart';
import 'models/active_program_response.dart';
import 'models/client_dashboard_response.dart';

@singleton
class HomeRepository {
  final HomeApiService _api;

  HomeRepository(this._api);

  Future<ClientDashboardResponse> getDashboard() => _api.getDashboard();

  Future<ActiveProgramResponse?> getActiveProgram() =>
      _api.getActiveProgram();
}
