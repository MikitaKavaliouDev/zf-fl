import 'dart:async';
import 'dart:developer' as developer;

import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/network/supabase_config.dart';
import '../models/notification_dto.dart';

/// Events emitted by [NotificationRealtimeService].
sealed class NotificationRealtimeEvent {
  const NotificationRealtimeEvent();
}

/// A new notification was inserted.
class NotificationInserted extends NotificationRealtimeEvent {
  final NotificationDto notification;
  const NotificationInserted(this.notification);
}

/// A notification was updated (e.g., readStatus changed).
class NotificationUpdated extends NotificationRealtimeEvent {
  final NotificationDto notification;
  const NotificationUpdated(this.notification);
}

/// A notification was deleted.
class NotificationDeleted extends NotificationRealtimeEvent {
  final String id;
  const NotificationDeleted(this.id);
}

/// The subscription connection state changed.
class NotificationRealtimeConnectionChanged
    extends NotificationRealtimeEvent {
  final bool isConnected;
  final String? error;
  const NotificationRealtimeConnectionChanged({
    required this.isConnected,
    this.error,
  });
}

/// Real-time notification subscription service with polling fallback.
///
/// Architecture (matching iOS WorkoutRealtimeService pattern):
/// 1. Primary: Supabase Realtime (postgres_changes CDC on `notifications` table)
/// 2. Fallback: Periodic REST polling via [NotificationApiService]
///
/// The service automatically subscribes when [subscribe] is called and
/// emits events through the [events] stream. If the Supabase Realtime
/// connection fails or drops, it falls back to polling at a configurable
/// interval. When Realtime reconnects, polling stops.
@singleton
class NotificationRealtimeService {
  final SupabaseClient _supabase;
  RealtimeChannel? _channel;
  Timer? _pollingTimer;
  StreamController<NotificationRealtimeEvent>? _controller;
  String? _userId;
  bool _subscribed = false;
  bool _usingRealtime = false;

  /// How often to poll (in seconds) when real-time is unavailable.
  static const int _pollIntervalSeconds = 15;

  /// The PostgreSQL table name for notifications.
  /// Must match the actual table name in Supabase (from Prisma schema).
  /// If the table name is wrong, Realtime will fail and polling takes over.
  static const String _tableName = 'notifications';

  NotificationRealtimeService()
      : _supabase = SupabaseClient(
          SupabaseConfig.supabaseUrl,
          SupabaseConfig.supabaseAnonKey,
        );

  /// Stream of real-time notification events.
  Stream<NotificationRealtimeEvent> get events =>
      _controller?.stream ?? const Stream.empty();

  /// Whether the Realtime subscription is currently active.
  bool get isUsingRealtime => _usingRealtime;

  /// Whether any subscription or polling is active.
  bool get isActive => _subscribed;

  /// Subscribe to real-time notifications for [userId].
  ///
  /// Attempts Supabase Realtime first. On failure, falls back to
  /// periodic REST polling.
  void subscribe(String userId) {
    if (_subscribed && _userId == userId) return;
    unsubscribe();

    _userId = userId;
    _subscribed = true;
    _controller = StreamController<NotificationRealtimeEvent>.broadcast();

    _tryRealtimeSubscription(userId);
  }

  /// Unsubscribe and stop all activity.
  void unsubscribe() {
    _subscribed = false;
    _pollingTimer?.cancel();
    _pollingTimer = null;
    _unsubscribeChannel();
    _controller?.close();
    _controller = null;
    _userId = null;
    _usingRealtime = false;
  }

  // ─── Supabase Realtime ──────────────────────────────────────────

  Future<void> _tryRealtimeSubscription(String userId) async {
    try {
      _unsubscribeChannel();

      final channel = _supabase.channel('notifications:$userId');

      // Listen for INSERT events
      channel.onPostgresChanges(
        event: PostgresChangeEvent.insert,
        schema: 'public',
        table: _tableName,
        filter: PostgresChangeFilter(
          type: PostgresChangeFilterType.eq,
          column: 'userId',
          value: userId,
        ),
        callback: (payload) {
          _handleInsert(payload);
        },
      );

      // Listen for UPDATE events
      channel.onPostgresChanges(
        event: PostgresChangeEvent.update,
        schema: 'public',
        table: _tableName,
        filter: PostgresChangeFilter(
          type: PostgresChangeFilterType.eq,
          column: 'userId',
          value: userId,
        ),
        callback: (payload) {
          _handleUpdate(payload);
        },
      );

      // Listen for DELETE events
      channel.onPostgresChanges(
        event: PostgresChangeEvent.delete,
        schema: 'public',
        table: _tableName,
        filter: PostgresChangeFilter(
          type: PostgresChangeFilterType.eq,
          column: 'userId',
          value: userId,
        ),
        callback: (payload) {
          _handleDelete(payload);
        },
      );

      // Subscribe with status callback
      channel.subscribe((status, error) {
        if (!_subscribed) return; // Stale callback after unsubscribe
        if (status == RealtimeSubscribeStatus.subscribed) {
          developer.log(
            '[NotificationRealtime] Subscribed to $userId',
            name: 'notifications',
          );
          _usingRealtime = true;
          _pollingTimer?.cancel();
          _pollingTimer = null;
          _emitConnectionChanged(true);
        } else if (status == RealtimeSubscribeStatus.timedOut ||
            status == RealtimeSubscribeStatus.closed ||
            status == RealtimeSubscribeStatus.channelError) {
          final errorMsg = error?.toString() ?? 'unknown';
          developer.log(
            '[NotificationRealtime] Subscription failed: $status — $errorMsg',
            name: 'notifications',
          );
          _usingRealtime = false;
          _emitConnectionChanged(false, error: errorMsg);
          _startPollingFallback();
        }
      });

      _channel = channel;
    } catch (e) {
      developer.log(
        '[NotificationRealtime] Failed to setup Realtime: $e',
        name: 'notifications',
      );
      _usingRealtime = false;
      _emitConnectionChanged(false, error: e.toString());
      _startPollingFallback();
    }
  }

  void _unsubscribeChannel() {
    if (_channel != null) {
      _supabase.removeChannel(_channel!);
      _channel = null;
    }
  }

  // ─── Event Handlers ────────────────────────────────────────────

  void _handleInsert(PostgresChangePayload payload) {
    if (_controller == null || _controller!.isClosed) return;
    try {
      final dto = _recordToDto(payload.newRecord);
      if (dto != null) {
        _controller!.add(NotificationInserted(dto));
      }
    } catch (e) {
      developer.log(
        '[NotificationRealtime] Failed to parse INSERT: $e',
        name: 'notifications',
      );
    }
  }

  void _handleUpdate(PostgresChangePayload payload) {
    if (_controller == null || _controller!.isClosed) return;
    try {
      final dto = _recordToDto(payload.newRecord);
      if (dto != null) {
        _controller!.add(NotificationUpdated(dto));
      }
    } catch (e) {
      developer.log(
        '[NotificationRealtime] Failed to parse UPDATE: $e',
        name: 'notifications',
      );
    }
  }

  void _handleDelete(PostgresChangePayload payload) {
    if (_controller == null || _controller!.isClosed) return;
    try {
      final id = payload.oldRecord['id'] as String?;
      if (id != null) {
        _controller!.add(NotificationDeleted(id));
      }
    } catch (e) {
      developer.log(
        '[NotificationRealtime] Failed to parse DELETE: $e',
        name: 'notifications',
      );
    }
  }

  /// Convert a raw Supabase record to [NotificationDto].
  ///
  /// Handles both snake_case (DB wire format) and camelCase keys.
  NotificationDto? _recordToDto(Map<String, dynamic> record) {
    if (record['id'] == null) return null;

    // Normalize keys: try camelCase first, fall back to snake_case
    Map<String, dynamic> normalized(Map<String, dynamic> src) {
      final result = <String, dynamic>{};
      for (final entry in src.entries) {
        // Convert snake_case to camelCase
        final key = entry.key.contains('_')
            ? entry.key.replaceAllMapped(
                RegExp(r'_([a-z])'),
                (m) => m.group(1)!.toUpperCase(),
              )
            : entry.key;
        result[key] = entry.value;
      }
      return result;
    }

    try {
      return NotificationDto.fromJson(normalized(record));
    } catch (e) {
      developer.log(
        '[NotificationRealtime] Failed to convert record: $e — $record',
        name: 'notifications',
      );
      return null;
    }
  }

  // ─── Polling Fallback ──────────────────────────────────────────

  void _startPollingFallback() {
    if (!_subscribed) return;

    _pollingTimer?.cancel();
    developer.log(
      '[NotificationRealtime] Starting polling fallback (every ${_pollIntervalSeconds}s)',
      name: 'notifications',
    );

    _pollingTimer = Timer.periodic(
      const Duration(seconds: _pollIntervalSeconds),
      (_) => _poll(),
    );
  }

  Future<void> _poll() async {
    if (!_subscribed) return;

    // Emit a connection-changed event to signal the cubit to do a full
    // re-fetch via the REST API. This avoids double-fetching.
    _emitConnectionChanged(false);
  }

  // ─── Helpers ───────────────────────────────────────────────────

  void _emitConnectionChanged(bool connected, {String? error}) {
    if (_controller == null || _controller!.isClosed) return;
    _controller!.add(NotificationRealtimeConnectionChanged(
      isConnected: connected,
      error: error,
    ));
  }

  /// Attempt to reconnect the Realtime subscription.
  Future<void> reconnect() async {
    final userId = _userId;
    if (userId == null || !_subscribed) return;
    await _tryRealtimeSubscription(userId);
  }
}
