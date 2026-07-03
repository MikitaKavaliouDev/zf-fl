import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'models/create_event_request_dto.dart';
import 'models/trainer_event_dto.dart';

@injectable
class TrainerEventsApiService {
  final Dio _dio;

  TrainerEventsApiService(this._dio);

  /// GET /api/trainer/events — trainer's events.
  Future<List<TrainerEventDto>> getEvents({
    int page = 1,
    int pageSize = 20,
  }) async {
    final response = await _dio.get(
      '/api/trainer/events',
      queryParameters: {'page': page, 'pageSize': pageSize},
    );
    final data = response.data['data'] as Map<String, dynamic>;
    final events = data['events'] as List<dynamic>;
    return events
        .map((e) => TrainerEventDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// POST /api/trainer/events — create a new event.
  Future<TrainerEventDto> createEvent(CreateEventRequestDto request) async {
    final response = await _dio.post(
      '/api/trainer/events',
      data: request.toJson(),
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return TrainerEventDto.fromJson(data);
  }

  /// PUT /api/trainer/events/:id — update an event.
  Future<TrainerEventDto> updateEvent(
    String id,
    Map<String, dynamic> updates,
  ) async {
    final response = await _dio.put(
      '/api/trainer/events/$id',
      data: updates,
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return TrainerEventDto.fromJson(data);
  }

  /// DELETE /api/trainer/events/:id
  Future<void> deleteEvent(String id) async {
    await _dio.delete('/api/trainer/events/$id');
  }
}
