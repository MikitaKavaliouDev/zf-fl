import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'models/active_program_response.dart';
import 'models/client_dashboard_response.dart';

@injectable
class HomeApiService {
  final Dio _dio;

  HomeApiService(this._dio);

  /// GET /api/client/dashboard — client home dashboard data.
  Future<ClientDashboardResponse> getDashboard() async {
    final response = await _dio.get('/api/client/dashboard');
    final data = response.data['data'] as Map<String, dynamic>;
    return ClientDashboardResponse.fromJson(data);
  }

  /// GET /api/client/program/active — active program details.
  /// Returns null if the client has no active program.
  Future<ActiveProgramResponse?> getActiveProgram() async {
    try {
      final response = await _dio.get('/api/client/program/active');
      final rawData = response.data['data'];
      if (rawData == null) return null;
      final data = rawData as Map<String, dynamic>;
      return ActiveProgramResponse.fromJson(data);
    } on DioException catch (e) {
      // 404 means no active program — that's a valid null response.
      if (e.response?.statusCode == 404) {
        developer.log(
          'No active program found (404)',
          name: 'home_api',
        );
        return null;
      }
      rethrow;
    }
  }
}
