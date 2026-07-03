import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'models/create_session_request_dto.dart';
import 'models/session_creation_data_dto.dart';
import 'models/trainer_calendar_event_dto.dart';
import 'models/update_session_request_dto.dart';

@injectable
class TrainerCalendarApiService {
  final Dio _dio;

  TrainerCalendarApiService(this._dio);

  /// GET /api/trainer/calendar — events for a date range.
  Future<List<TrainerCalendarEventDto>> getCalendarEvents({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final response = await _dio.get(
      '/api/trainer/calendar',
      queryParameters: {
        'startDate': startDate.toIso8601String(),
        'endDate': endDate.toIso8601String(),
      },
    );
    final data = response.data['data'] as Map<String, dynamic>;
    final events = data['events'] as List<dynamic>;
    return events
        .map((e) =>
            TrainerCalendarEventDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// GET /api/trainer/session-creation-data — creation metadata (clients + templates).
  Future<SessionCreationDataDto> getSessionCreationData() async {
    final response = await _dio.get('/api/trainer/session-creation-data');
    final data = response.data['data'] as Map<String, dynamic>;
    return SessionCreationDataDto.fromJson(data);
  }

  /// POST /api/trainer/calendar/sessions — create a new session.
  Future<TrainerCalendarEventDto> createSession(
    CreateSessionRequestDto request,
  ) async {
    final response = await _dio.post(
      '/api/trainer/calendar/sessions',
      data: request.toJson(),
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return TrainerCalendarEventDto.fromJson(data);
  }

  /// PUT /api/trainer/calendar/sessions/:id — update a session.
  Future<TrainerCalendarEventDto> updateSession(
    String id,
    UpdateSessionRequestDto request,
  ) async {
    final response = await _dio.put(
      '/api/trainer/calendar/sessions/$id',
      data: request.toJson(),
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return TrainerCalendarEventDto.fromJson(data);
  }

  /// DELETE /api/trainer/calendar/sessions/:id
  Future<void> deleteSession(String id) async {
    await _dio.delete('/api/trainer/calendar/sessions/$id');
  }
}
