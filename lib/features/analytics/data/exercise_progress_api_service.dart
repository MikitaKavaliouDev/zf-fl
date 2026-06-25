import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class ExerciseProgressApiService {
  final Dio _dio;

  ExerciseProgressApiService(this._dio);

  /// GET /api/client/stats/exercise?exerciseId=X&metric=e1rm
  /// Returns per-exercise performance history (e1RM, volume, or best set volume).
  Future<Map<String, dynamic>> getExerciseStats({
    required String exerciseId,
    String metric = 'e1rm',
  }) async {
    final response = await _dio.get(
      '/api/client/stats/exercise',
      queryParameters: {
        'exerciseId': exerciseId,
        'metric': metric,
      },
    );
    return response.data['data'] as Map<String, dynamic>;
  }
}
