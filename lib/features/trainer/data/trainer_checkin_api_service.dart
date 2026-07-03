import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'models/review_check_in_request_dto.dart';
import 'models/trainer_check_in_list_item_dto.dart';

@injectable
class TrainerCheckInApiService {
  final Dio _dio;

  TrainerCheckInApiService(this._dio);

  /// GET /api/trainer/check-ins — pending and reviewed check-ins.
  Future<List<TrainerCheckInListItemDto>> getCheckIns({
    int page = 1,
    int pageSize = 20,
    String? status,
  }) async {
    final queryParams = <String, dynamic>{
      'page': page,
      'pageSize': pageSize,
    };
    if (status != null) queryParams['status'] = status;

    final response = await _dio.get(
      '/api/trainer/check-ins',
      queryParameters: queryParams,
    );
    // Response is { data: [...] } — direct JSON array
    final items = response.data['data'] as List<dynamic>;
    return items
        .map((e) =>
            TrainerCheckInListItemDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// GET /api/trainer/check-ins/:id — check-in detail.
  Future<Map<String, dynamic>> getCheckInDetail(String id) async {
    final response = await _dio.get('/api/trainer/check-ins/$id');
    final data = response.data['data'] as Map<String, dynamic>;
    return data;
  }

  /// POST /api/trainer/check-ins/:id/review — respond to a check-in.
  Future<void> reviewCheckIn(
    String id,
    ReviewCheckInRequestDto request,
  ) async {
    await _dio.post(
      '/api/trainer/check-ins/$id/review',
      data: request.toJson(),
    );
  }
}
