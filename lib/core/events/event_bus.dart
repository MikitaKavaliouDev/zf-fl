import 'dart:async';

/// Base class for all app-wide events.
///
/// Replaces iOS `NotificationCenter.default.publisher(for:)` pattern.
sealed class AppEvent {
  const AppEvent();
}

/// Fired when a workout session is completed.
class WorkoutCompletedEvent extends AppEvent {
  final String? sessionId;
  final Duration duration;

  const WorkoutCompletedEvent({this.sessionId, required this.duration});
}

/// Fired when a check-in is successfully submitted.
class CheckInSubmittedEvent extends AppEvent {
  final String? checkInId;

  const CheckInSubmittedEvent({this.checkInId});
}

/// Lightweight event bus for cross-feature communication.
///
/// Features subscribe to events they care about instead of being coupled
/// directly to other features. This decouples producers (screens/cubits
/// that emit events) from consumers (cubits that need to react).
///
/// Usage:
/// ```dart
/// // Subscribe in a cubit's constructor:
/// final _sub = getIt<EventBus>().on<WorkoutCompletedEvent>().listen((e) {
///   refresh();
/// });
/// ```
class EventBus {
  final StreamController<AppEvent> _controller;

  EventBus()
      : _controller = StreamController<AppEvent>.broadcast();

  /// Fire an event to all subscribers.
  void emit(AppEvent event) {
    _controller.add(event);
  }

  /// Listen for events of type [T].
  Stream<T> on<T extends AppEvent>() {
    return _controller.stream.where((event) => event is T).cast<T>();
  }

  /// Dispose the stream controller.
  void dispose() {
    _controller.close();
  }
}
