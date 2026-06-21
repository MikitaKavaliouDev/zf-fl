import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logger_config.dart';

/// Custom [BlocObserver] that logs every state transition.
///
/// Outputs structured logs like:
///   [CUBIT] AuthCubit › LoginSubmitted
///   [CUBIT] AuthCubit   AuthState.loading → AuthState.authenticated(…)
class StateLogger extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (!LoggerConfig.logStateChanges) return;
    debugPrint('[CUBIT] ${bloc.runtimeType} › $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (!LoggerConfig.logStateChanges) return;
    final current = _summarize(change.currentState);
    final next = _summarize(change.nextState);
    debugPrint('[CUBIT] ${bloc.runtimeType}   $current → $next');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    if (!LoggerConfig.logStateChanges) return;
    debugPrint('[CUBIT] ${bloc.runtimeType}   ERROR: $error');
  }

  /// Short summary string from a state object (uses freezed toString by default).
  String _summarize(Object? state) {
    if (state == null) return 'null';
    final s = state.toString();
    // Most freezed states are multi-line; take only the first line.
    final firstLine = s.split('\n').first;
    if (firstLine.length > 120) return '${firstLine.substring(0, 120)}…';
    return firstLine;
  }
}
