import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'models/exercise_dto.dart';
import 'models/exercise_log_dto.dart';
import 'models/template_dto.dart';
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
    // Strip null values so Zod's .optional() accepts the payload
    final body = <String, dynamic>{
      if (clientId != null) 'clientId': clientId,
      if (plannedSessionId != null) 'plannedSessionId': plannedSessionId,
      if (templateId != null) 'templateId': templateId,
      if (clientPackageId != null) 'clientPackageId': clientPackageId,
    };
    final response = await _dio.post(
      '/api/workout-sessions/start',
      data: body,
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

    // Extract exerciseLogs, inject missing clientId/workoutSessionId/exerciseId
    final rawLogs = session.remove('exerciseLogs') as List<dynamic>?;
    if (rawLogs != null && rawLogs.isNotEmpty && clientId != null) {
      final sessionId = session['id'] as String?;
      data['exerciseLogs'] = rawLogs.map((e) {
        final log = Map<String, dynamic>.from(e as Map<String, dynamic>);
        log['clientId'] = log['clientId'] ?? clientId;
        log['workoutSessionId'] = log['workoutSessionId'] ?? sessionId;
        log['exerciseId'] = log['exerciseId'] ??
            (log['exercise'] as Map<String, dynamic>?)?['id'];
        if (log['completed'] != null) {
          log['isCompleted'] = log['completed'];
        }
        return log;
      }).toList();
    }

    data['session'] = session;

    // Normalize nested exercise objects: inject id from exerciseId
    // when the backend returns a partial exercise without id.
    if (rawLogs != null) {
      for (final l in rawLogs) {
        final log = l as Map<String, dynamic>;
        if (log['completed'] != null) {
          log['isCompleted'] = log['completed'];
        }
        if (log['exercise'] is Map<String, dynamic>) {
          final exercise = log['exercise'] as Map<String, dynamic>;
          if (exercise['id'] == null && log['exerciseId'] != null) {
            exercise['id'] = log['exerciseId'];
          }
        }
      }
    }

    return data;
  }

  /// Log an exercise set for a live session (create or update).
  Future<LogExerciseResponse> logExercise({
    String? logId,
    required String workoutSessionId,
    required String exerciseId,
    required int reps,
    double? weight,
    int? rpe,
    String? tempo,
    int? order,
    String? supersetKey,
    int? orderInSuperset,
    bool? isCompleted,
  }) async {
    final response = await _dio.post(
      '/api/workout-sessions/live',
      data: {
        'logId': logId,
        'workoutSessionId': workoutSessionId,
        'exerciseId': exerciseId,
        'reps': reps,
        'weight': weight,
        'rpe': rpe,
        'tempo': tempo,
        'order': order,
        'supersetKey': supersetKey,
        'orderInSuperset': orderInSuperset,
        'isCompleted': isCompleted,
      },
    );
    final data = response.data['data'] as Map<String, dynamic>;
    if (data['log'] != null) {
      final logMap = Map<String, dynamic>.from(data['log'] as Map<String, dynamic>);
      if (logMap['completed'] != null) {
        logMap['isCompleted'] = logMap['completed'];
      }
      data['log'] = logMap;
    }
    return LogExerciseResponse.fromJson(data);
  }

  /// Finish a workout session. Returns the updated session and its logs.
  Future<LiveSessionResponse> finishSession({
    required String workoutSessionId,
    String? notes,
    bool? completeUnfinished,
  }) async {
    final response = await _dio.post(
      '/api/workout-sessions/finish',
      data: {
        'workoutSessionId': workoutSessionId,
        'notes': notes,
        'completeUnfinished': completeUnfinished,
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
        'clientId': clientId,
        'limit': limit,
        'cursor': cursor,
      },
    );
    final data = response.data['data'] as Map<String, dynamic>;

    // Normalize: the backend sometimes returns partial exercise objects
    // (e.g. `{ "name": "..." }` without `id`). Inject `id` from the
    // parent log's `exerciseId` so ExerciseDto.fromJson doesn't crash.
    final sessions = data['sessions'] as List<dynamic>?;
    if (sessions != null) {
      for (final s in sessions) {
        final session = s as Map<String, dynamic>;
        final logs = session['exerciseLogs'] as List<dynamic>?;
        if (logs != null) {
          for (final l in logs) {
            final log = l as Map<String, dynamic>;
            if (log['completed'] != null) {
              log['isCompleted'] = log['completed'];
            }
            if (log['exercise'] is Map<String, dynamic>) {
              final exercise = log['exercise'] as Map<String, dynamic>;
              if (exercise['id'] == null && log['exerciseId'] != null) {
                exercise['id'] = log['exerciseId'];
              }
            }
          }
        }
      }
    }

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

  /// Cancel a workout session.
  Future<void> cancelSession({required String workoutSessionId}) async {
    await _dio.post('/api/workout-sessions/$workoutSessionId/cancel');
  }

  /// Remove an exercise from the active session.
  Future<void> removeExercise({
    required String sessionId,
    required String exerciseId,
  }) async {
    await _dio.delete('/api/workout-sessions/$sessionId/exercises/$exerciseId');
  }

  /// Get full details for a specific session (including exercise logs).
  Future<LiveSessionResponse> getSessionDetails(String sessionId) async {
    final response = await _dio.get('/api/workout-sessions/$sessionId');
    final data = _normalizeSessionData(
      response.data['data'] as Map<String, dynamic>,
    );
    return LiveSessionResponse.fromJson(data);
  }

  /// Get all templates for the current user's active program.
  Future<List<TemplateDto>> getTemplates() async {
    final response = await _dio.get('/api/client/program/active');
    final data = response.data['data'];
    if (data == null) return [];
    final templates = data['templates'] as List<dynamic>;
    return templates
        .map((e) => TemplateDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// Get a specific template with exercises.
  Future<TemplateDto> getTemplate(String templateId) async {
    final response = await _dio.get('/api/workout-templates/$templateId');
    final data = response.data['data'] as Map<String, dynamic>;
    return TemplateDto.fromJson(data);
  }

  /// Save a completed session as a new template.
  Future<void> saveSessionAsTemplate({
    required String sessionId,
    required String templateName,
  }) async {
    await _dio.post(
      '/api/workout-sessions/$sessionId/save-as-template',
      data: {'templateName': templateName},
    );
  }
}
      