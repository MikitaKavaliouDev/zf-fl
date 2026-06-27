import 'dart:async';
import 'dart:developer' as developer;

import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/network/supabase_config.dart';

// ─────────────────────────────────────────────────────────────────────────────
// AI Workout Events
// ─────────────────────────────────────────────────────────────────────────────

/// Events emitted when the ElevenLabs agent modifies workout data via
/// Server Tools, propagated through Supabase Realtime.
sealed class AIWorkoutEvent {
  const AIWorkoutEvent();
}

class AISessionStarted extends AIWorkoutEvent {
  final String sessionId;
  const AISessionStarted(this.sessionId);
}

class AIExerciseAdded extends AIWorkoutEvent {
  final String sessionId;
  final String exerciseId;
  const AIExerciseAdded({required this.sessionId, required this.exerciseId});
}

class AISetLogged extends AIWorkoutEvent {
  final String workoutSessionId;
  final String exerciseId;
  final int reps;
  final double weight;
  final bool isPR;
  const AISetLogged({
    required this.workoutSessionId,
    required this.exerciseId,
    required this.reps,
    required this.weight,
    this.isPR = false,
  });
}

class AIRestStarted extends AIWorkoutEvent {
  final int durationSeconds;
  const AIRestStarted(this.durationSeconds);
}

// ─────────────────────────────────────────────────────────────────────────────
// Workout Realtime Service
// ─────────────────────────────────────────────────────────────────────────────

/// Listens to Supabase Realtime for database changes made by the
/// ElevenLabs Agent (Server Tools webhook).
///
/// ## Flow
/// 1. ElevenLabs agent calls Server Tool (`POST /api/agent/tools`)
/// 2. Backend writes to PostgreSQL
/// 3. Supabase Realtime (CDC via WAL) broadcasts the change
/// 4. This service receives it and forwards it via a Stream
///
/// Subscription lifecycle:
/// - Subscribe when ElevenLabs conversation connects
/// - Unsubscribe when conversation disconnects
@lazySingleton
class WorkoutRealtimeService {
  final SupabaseClient _supabase;
  RealtimeChannel? _workoutChannel;
  RealtimeChannel? _exerciseLogChannel;
  Timer? _pollingTimer;
  String? _currentClientId;
  bool _subscribed = false;

  final StreamController<AIWorkoutEvent> _eventController =
      StreamController<AIWorkoutEvent>.broadcast();

  /// Stream of AI workout events for the UI to consume.
  Stream<AIWorkoutEvent> get events => _eventController.stream;

  /// Whether a subscription is currently active.
  bool get isSubscribed => _subscribed;

  WorkoutRealtimeService()
      : _supabase = SupabaseClient(
          SupabaseConfig.supabaseUrl,
          SupabaseConfig.supabaseAnonKey,
        );

  // ── Subscription API ──────────────────────────────────────────────

  /// Subscribe to both Supabase Realtime channels for the given client.
  void subscribe(String clientId) {
    if (_subscribed && _currentClientId == clientId) return;

    unsubscribe();

    _currentClientId = clientId;
    _subscribed = true;

    _subscribeWorkoutSession(clientId);
    _subscribeExerciseLog(clientId);

    // Polling fallback: check active session every 3s
    _startPollingFallback(clientId);

    developer.log(
      '[WorkoutRealtime] Subscribed for client=$clientId',
      name: 'workout_realtime',
    );
  }

  /// Unsubscribe from all channels and stop polling.
  void unsubscribe() {
    _subscribed = false;
    _currentClientId = null;

    if (_workoutChannel != null) {
      _supabase.removeChannel(_workoutChannel!);
      _workoutChannel = null;
    }
    if (_exerciseLogChannel != null) {
      _supabase.removeChannel(_exerciseLogChannel!);
      _exerciseLogChannel = null;
    }

    _pollingTimer?.cancel();
    _pollingTimer = null;

    developer.log(
      '[WorkoutRealtime] Unsubscribed',
      name: 'workout_realtime',
    );
  }

  /// Clean up resources. Call when the feature is torn down.
  void dispose() {
    unsubscribe();
    _eventController.close();
  }

  // ── Channel Subscriptions ─────────────────────────────────────────

  void _subscribeWorkoutSession(String clientId) {
    final channelName = 'workout-session:$clientId';
    final channel = _supabase.channel(channelName);

    channel.onPostgresChanges(
      event: PostgresChangeEvent.all,
      schema: 'public',
      table: 'WorkoutSession',
      filter: PostgresChangeFilter(
        type: PostgresChangeFilterType.eq,
        column: 'clientId',
        value: clientId,
      ),
      callback: (payload) {
        _handleWorkoutChange(payload);
      },
    );

    channel.subscribe((status, error) {
      developer.log(
        '[WorkoutRealtime] WorkoutSession channel: $status',
        name: 'workout_realtime',
      );
    });

    _workoutChannel = channel;
  }

  void _subscribeExerciseLog(String clientId) {
    final channelName = 'client-exercise-log:$clientId';
    final channel = _supabase.channel(channelName);

    channel.onPostgresChanges(
      event: PostgresChangeEvent.all,
      schema: 'public',
      table: 'ClientExerciseLog',
      filter: PostgresChangeFilter(
        type: PostgresChangeFilterType.eq,
        column: 'clientId',
        value: clientId,
      ),
      callback: (payload) {
        _handleExerciseLogChange(payload);
      },
    );

    channel.subscribe((status, error) {
      developer.log(
        '[WorkoutRealtime] ClientExerciseLog channel: $status',
        name: 'workout_realtime',
      );
    });

    _exerciseLogChannel = channel;
  }

  // ── Event Handlers ────────────────────────────────────────────────

  void _handleWorkoutChange(PostgresChangePayload payload) {
    final record = payload.newRecord;
    if (record.isEmpty) return;

    final sessionId = record['id'] as String?;
    final status = record['status'] as String?;

    if (sessionId == null) return;

    if (status == 'IN_PROGRESS') {
      _emit(AISessionStarted(sessionId));
    }

    // Check for rest timer update
    final restStartedAt = record['restStartedAt'];
    if (restStartedAt != null && restStartedAt is String && restStartedAt.isNotEmpty) {
      _emit(const AIRestStarted(90));
    }
  }

  void _handleExerciseLogChange(PostgresChangePayload payload) {
    final record = payload.newRecord;
    if (record.isEmpty) return;

    final id = record['id'] as String?;
    final workoutSessionId = record['workoutSessionId'] as String?;
    final exerciseId = record['exerciseId'] as String?;
    if (id == null || workoutSessionId == null || exerciseId == null) return;

    final reps = (record['reps'] as num?)?.toInt() ?? 0;
    final weight = (record['weight'] as num?)?.toDouble() ?? 0.0;

    _emit(AISetLogged(
      workoutSessionId: workoutSessionId,
      exerciseId: exerciseId,
      reps: reps,
      weight: weight,
    ));
  }

  void _emit(AIWorkoutEvent event) {
    if (!_eventController.isClosed) {
      _eventController.add(event);
    }
  }

  // ── Polling Fallback ─────────────────────────────────────────────

  /// Lightweight polling loop as fallback in case Realtime misses events.
  void _startPollingFallback(String clientId) {
    _pollingTimer?.cancel();
    _pollingTimer = Timer.periodic(const Duration(seconds: 3), (_) async {
      if (!_subscribed) return;

      try {
        final data = await _supabase
            .from('WorkoutSession')
            .select()
            .eq('clientId', clientId)
            .eq('status', 'IN_PROGRESS')
            .maybeSingle();

        if (data != null) {
          final sessionId = data['id'] as String?;
          if (sessionId != null) {
            _emit(AISessionStarted(sessionId));
          }
        }
      } catch (_) {
        // Silently fail — Realtime is the primary channel
      }
    });
  }
}
