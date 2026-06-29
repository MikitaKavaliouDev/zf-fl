import 'models/active_program_response.dart';
import 'models/client_dashboard_response.dart';

/// Combined result of the Home dashboard fetch (parallel requests).
class HomeData {
  final ClientDashboardResponse dashboard;
  final ActiveProgramResponse? activeProgram;

  const HomeData({
    required this.dashboard,
    this.activeProgram,
  });
}
