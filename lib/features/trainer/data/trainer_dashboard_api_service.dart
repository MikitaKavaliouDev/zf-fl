import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class TrainerDashboardApiService {
  final Dio _dio;

  TrainerDashboardApiService(this._dio);

  /// GET /api/trainer/session-creation-data — returns { clients: [...], templates: [...] }.
  /// No dedicated dashboard endpoint exists on the backend; this is the closest
  /// proxy for basic stats (client count, template count).
  Future<Map<String, dynamic>> getSessionCreationData() async {
    final response = await _dio.get('/api/trainer/session-creation-data');
    return response.data['data'] as Map<String, dynamic>;
  }
}
