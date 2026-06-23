import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'models/exercise_dto.dart';
import 'models/exercise_log_dto.dart';
import 'models/workout_session_response.dart';

@injectable
class WorkoutSessionApiService {
  final Dio _dio;

  WorkoutSessionApiService(this._dio);

  /// Fetch the exercise library (system + custom).
  Future<List<ExerciseDto>> getExerciseLibrary() async {
    final response = await _dio.get(
      '/api/exercises/sync',
      queryParameters: {'lastPulledAt': 0},
    );
    final data = response.data['data'] as Map<String, dynamic>;
    final changes = data['changes'] as List<dynamic>;
    return changes
        .map((e) => ExerciseDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// Start a new workout session.
  Future<StartSessionResponse> startSession({
    String? clientId,
    String? plannedSessionId,
    String? templateId,
    String? clientPackageId,
  }) async {
    final response = await _dio.post(
      '/api/workout-sessions/start',
      data: {
        'clientId': ?clientId,
        'plannedSessionId': ?plannedSessionId,
        'templateId': ?templateId,
        'clientPackageId': ?clientPackageId,
      },
    );
    final data = _normalizeSessionData(
      response.data['data'] as Map<String, dynamic>,
    );
    return StartSessionResponse.fromJson(data);
  }

  /// Get the currently active workout session.
  Future<LiveSessionResponse> getLiveSession() async {
    final response = await _dio.get('/api/workout-sessions/live');
    final data = _normalizeSessionData(
      response.data['data'] as Map<String, dynamic>,
    );
    return LiveSessionResponse.fromJson(data);
  }

  /// Backend returns `client` as nested `{id, name, ...}` but the DTO
  /// expects a flat `clientId`. Also, `exerciseLogs` entries lack
  /// `clientId`/`workoutSessionId` at the individual log level.
  /// This normalizer injects those fields before parsing.
  Map<String, dynamic> _normalizeSessionData(Map<String, dynamic> data) {
    if (data['session'] == null) return data;

    final session = Map<String, dynamic>.from(
      data['session'] as Map<String, dynamic>,
    );

    // Inject flat clientId from nested client object
    final clientId =
        (session['client'] as Map<String, dynamic>?)?['id'] as String?;
    if (clientId != null) {
      session['clientId'] = clientId;
    }

    // Extract exerciseLogs, inject missing clientId/workoutSessionId
    final rawLogs = session.remove('exerciseLogs') as List<dynamic>?;
    if (rawLogs != null && rawLogs.isNotEmpty && clientId != null) {
      final sessionId = session['id'] as String?;
      data['exerciseLogs'] = rawLogs.map((e) {
        final log = Map<String, dynamic>.from(e as Map<String, dynamic>);
        log['clientId'] = log['clientId'] ?? clientId;
        log['workoutSessionId'] = log['workoutSessionId'] ?? sessionId;
        return log;
      }).toList();
    }

    data['session'] = session;
    return data;
  }

  /// Log an exercise set for a live session (create or update).
  Future<LogExerciseResponse> logExercise({
    String? logId,
    required String workoutSessionId,
    required String exerciseId,
    required int reps,
    double? weight,
    int? order,
    String? supersetKey,
    int? orderInSuperset,
    bool? isCompleted,
  }) async {
    final response = await _dio.post(
      '/api/workout-sessions/live',
      data: {
        'logId': ?logId,
        'workoutSessionId': workoutSessionId,
        'exerciseId': exerciseId,
        'reps': reps,
        'weight': ?weight,
        'order': ?order,
        'supersetKey': ?supersetKey,
        'orderInSuperset': ?orderInSuperset,
        'isCompleted': ?isCompleted,
      },
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return LogExerciseResponse.fromJson(data);
  }

  /// Finish a workout session. Returns the updated session data.
  Future<LiveSessionResponse> finishSession({
    required String workoutSessionId,
    String? notes,
  }) async {
    final response = await _dio.post(
      '/api/workout-sessions/finish',
      data: {
        'workoutSessionId': workoutSessionId,
        'notes': ?notes,
      },
    );
    final data = _normalizeSessionData(
      response.data['data'] as Map<String, dynamic>,
    );
    return LiveSessionResponse.fromJson(data);
  }

  /// Get workout session history.
  Future<SessionHistoryResponse> getHistory({
    String? clientId,
    int limit = 20,
    String? cursor,
  }) async {
    final response = await _dio.get(
      '/api/workout-sessions/history',
      queryParameters: {
        'clientId': ?clientId,
        'limit': limit,
        'cursor': ?cursor,
      },
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return SessionHistoryResponse.fromJson(data);
  }

  /// Add exercises to an in-progress session. Returns the created log entries.
  Future<List<ExerciseLogDto>> addExercises({
    required String sessionId,
    required List<String> exerciseIds,
  }) async {
    final response = await _dio.post(
      '/api/workout-sessions/$sessionId/exercises',
      data: {'exerciseIds': exerciseIds},
    );
    final data = response.data['data'] as Map<String, dynamic>;
    final logs = (data['logs'] as List<dynamic>)
        .map((e) => ExerciseLogDto.fromJson(e as Map<String, dynamic>))
        .toList();
    return logs;
  }

  /// Start rest timer on backend.
  Future<void> startRest(String sessionId) async {
    await _dio.post('/api/workout-sessions/$sessionId/rest/start');
  }

  /// End rest timer on backend.
  Future<void> endRest(String sessionId) async {
    await _dio.post('/api/workout-sessions/$sessionId/rest/end');
  }
}
