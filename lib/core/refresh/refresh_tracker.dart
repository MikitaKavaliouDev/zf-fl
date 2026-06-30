import 'package:flutter/foundation.dart';

/// Tracks in-progress background refresh tasks across all repositories.
///
/// Provides a single source of truth for the UI to show a subtle syncing
/// indicator. Each cache-first repository calls [start]/[end]/[fail] around
/// its background refresh cycle.
class RefreshTracker extends ChangeNotifier {
  RefreshTracker._();

  static final RefreshTracker _instance = RefreshTracker._();

  /// Global singleton — wired into the app shell.
  static RefreshTracker get instance => _instance;

  final Map<String, bool> _inProgress = {};
  final Map<String, DateTime> _nextRetryAt = {};

  // ── Public queries ──

  /// Whether any repository is currently performing a background refresh.
  bool get isRefreshing => _inProgress.values.any((v) => v);

  /// Whether a specific key is currently refreshing.
  bool isKeyRefreshing(String key) => _inProgress[key] ?? false;

  /// The set of keys that are refreshing right now.
  Set<String> get refreshingKeys => _inProgress.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toSet();

  // ── Lifecycle ──

  /// Mark a refresh as started for [key].
  void start(String key) {
    _inProgress[key] = true;
    _nextRetryAt.remove(key);
    notifyListeners();
  }

  /// Mark a refresh for [key] as completed successfully.
  void end(String key) {
    _inProgress.remove(key);
    _nextRetryAt.remove(key);
    notifyListeners();
  }

  /// Mark a refresh for [key] as failed.
  ///
  /// Removes from in-progress and registers a retry slot via [scheduleRetry].
  void fail(String key) {
    _inProgress.remove(key);
    notifyListeners();
  }

  /// Schedule a one-shot retry for [key] after [delay].
  void scheduleRetry(String key, {Duration delay = const Duration(seconds: 5)}) {
    _nextRetryAt[key] = DateTime.now().add(delay);
    notifyListeners();
  }

  /// Whether a retry is currently scheduled for [key].
  bool hasScheduledRetry(String key) {
    final scheduled = _nextRetryAt[key];
    if (scheduled == null) return false;
    if (DateTime.now().isAfter(scheduled)) {
      _nextRetryAt.remove(key);
      return false;
    }
    return true;
  }

  /// Cancel any pending retry for [key].
  void cancelRetry(String key) {
    _nextRetryAt.remove(key);
    notifyListeners();
  }
}
