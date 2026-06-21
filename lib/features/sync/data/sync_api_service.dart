import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class SyncApiService {
  final Dio _dio;

  SyncApiService(this._dio);

  /// Pulls changes since [lastPulledAt] (Unix ms).
  /// Returns `{ changes: { tableName: { created: [], updated: [], deleted: [] } }, timestamp: number }`.
  Future<Map<String, dynamic>> pull(int lastPulledAt) async {
    final response = await _dio.get(
      '/api/sync/pull',
      queryParameters: {'last_pulled_at': lastPulledAt},
    );
    // Backend wraps in { data: ... }
    return response.data['data'] as Map<String, dynamic>;
  }

  /// Pushes local changes to the backend.
  /// [changes] maps table names to `{ created: [], updated: [], deleted: string[] }`.
  /// Returns `{ timestamp: number }`.
  Future<Map<String, dynamic>> push(
    Map<String, dynamic> changes,
  ) async {
    final response = await _dio.post(
      '/api/sync/push',
      data: {'changes': changes},
    );
    return response.data['data'] as Map<String, dynamic>;
  }
}
