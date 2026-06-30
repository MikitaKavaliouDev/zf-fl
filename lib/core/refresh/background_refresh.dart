import 'refresh_tracker.dart';

/// Execute a background refresh with [RefreshTracker] tracking and
/// automatic one-shot retry.
///
/// 1. Calls [RefreshTracker.start] with [key].
/// 2. Calls [refresh]; if it throws, the retry is recorded.
/// 3. After [retryDelay], calls [refresh] one more time.
/// 4. On success → [RefreshTracker.end]; on failure → [RefreshTracker.fail].
Future<void> backgroundRefresh(
  String key,
  Future<dynamic> Function() refresh, {
  Duration retryDelay = const Duration(seconds: 5),
}) async {
  RefreshTracker.instance.start(key);
  try {
    await refresh();
    RefreshTracker.instance.end(key);
    return;
  } catch (_) {
    RefreshTracker.instance.fail(key);
    RefreshTracker.instance.scheduleRetry(key, delay: retryDelay);
  }

  // ── Retry once ──
  await Future.delayed(retryDelay);
  RefreshTracker.instance.start(key);
  try {
    await refresh();
    RefreshTracker.instance.end(key);
  } catch (_) {
    RefreshTracker.instance.fail(key);
  }
}
