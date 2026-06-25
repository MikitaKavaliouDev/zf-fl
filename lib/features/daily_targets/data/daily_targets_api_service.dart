import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'models/daily_target_dto.dart';

@injectable
class DailyTargetsApiService {
  final Dio _dio;

  DailyTargetsApiService(this._dio);

  /// GET /api/client/daily-targets?date= — fetch daily targets for a date.
  Future<List<DailyTargetDto>> getTargets({String? date}) async {
    final queryParams = <String, dynamic>{};
    if (date != null) queryParams['date'] = date;
    final response = await _dio.get(
      '/api/client/daily-targets',
      queryParameters: queryParams.isNotEmpty ? queryParams : null,
    );
    final rawList = response.data['data']['targets'] as List<dynamic>;
    return rawList
        .map((e) => DailyTargetDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// POST /api/client/daily-targets — create a new daily target.
  Future<DailyTargetDto> createTarget(Map<String, dynamic> body) async {
    final response = await _dio.post('/api/client/daily-targets', data: body);
    final data = response.data['data']['target'] as Map<String, dynamic>;
    return DailyTargetDto.fromJson(data);
  }

  /// PUT /api/client/daily-targets/{id} — update a daily target.
  Future<DailyTargetDto> updateTarget(
    String id, {
    double? currentValue,
    bool? isCompleted,
  }) async {
    final body = <String, dynamic>{};
    if (currentValue != null) body['currentValue'] = currentValue;
    if (isCompleted != null) body['isCompleted'] = isCompleted;
    final response = await _dio.put(
      '/api/client/daily-targets/$id',
      data: body,
    );
    final data = response.data['data']['target'] as Map<String, dynamic>;
    return DailyTargetDto.fromJson(data);
  }

  /// DELETE /api/client/daily-targets/{id} — delete a target.
  Future<void> deleteTarget(String id) async {
    await _dio.delete('/api/client/daily-targets/$id');
  }
}
