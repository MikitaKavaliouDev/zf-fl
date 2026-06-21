import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/connectivity/connectivity_service.dart';
import '../data/sync_repository.dart';
import 'sync_state.dart';

@singleton
class SyncCubit extends Cubit<SyncState> {
  final SyncRepository _repository;
  final ConnectivityService _connectivity;
  StreamSubscription<bool>? _connectivitySub;

  SyncCubit(this._repository, this._connectivity)
      : super(SyncIdle(
          isOnline: _connectivity.isOnline,
        )) {
    _connectivitySub = _connectivity.onConnectivityChanged.listen(_onOnlineChanged);
  }

  void _onOnlineChanged(bool online) {
    final s = state;
    if (s is SyncIdle) {
      emit(s.copyWith(isOnline: online));
    } else if (s is SyncInProgress) {
      emit(s.copyWith(isOnline: online));
    } else if (s is SyncError) {
      emit(s.copyWith(isOnline: online));
    }
    // Auto-sync when coming back online
    if (online && s is SyncIdle) {
      sync();
    }
  }

  Future<void> sync() async {
    final s = state;
    if (s is SyncInProgress) return;

    final isOnline = await _connectivity.checkConnectivity();
    if (!isOnline) {
      emit(SyncError(
        isOnline: false,
        lastSyncAt: _lastSyncTimestamp(s),
        message: 'No internet connection.',
      ));
      return;
    }

    final lastSync = _lastSyncTimestamp(s);
    emit(SyncInProgress(
      isOnline: true,
      lastSyncAt: lastSync,
    ));

    try {
      final timestamp = await _repository.sync(lastSync);
      emit(SyncIdle(
        lastSyncAt: timestamp,
      ));
    } catch (e) {
      emit(SyncError(
        isOnline: true,
        lastSyncAt: _lastSyncTimestamp(state),
        message: e.toString(),
      ));
    }
  }

  int _lastSyncTimestamp(SyncState s) {
    return switch (s) {
      SyncIdle(:final lastSyncAt) => lastSyncAt,
      SyncInProgress(:final lastSyncAt) => lastSyncAt,
      SyncError(:final lastSyncAt) => lastSyncAt,
    };
  }

  @override
  Future<void> close() {
    _connectivitySub?.cancel();
    return super.close();
  }
}
