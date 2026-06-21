import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

/// Monitors network connectivity and exposes a stream of online/offline state.
@singleton
class ConnectivityService {
  final Connectivity _connectivity;
  final StreamController<bool> _controller;

  ConnectivityService({
    Connectivity? connectivity,
  })  : _connectivity = connectivity ?? Connectivity(),
        _controller = StreamController<bool>.broadcast() {
    _connectivity.onConnectivityChanged.listen(_onConnectivityChanged);
  }

  bool _isOnline = true;
  bool get isOnline => _isOnline;

  Stream<bool> get onConnectivityChanged => _controller.stream;

  void _onConnectivityChanged(List<ConnectivityResult> results) {
    final online = !results.contains(ConnectivityResult.none);
    if (online != _isOnline) {
      _isOnline = online;
      _controller.add(online);
    }
  }

  Future<bool> checkConnectivity() async {
    final results = await _connectivity.checkConnectivity();
    _isOnline = !results.contains(ConnectivityResult.none);
    return _isOnline;
  }

  @disposeMethod
  Future<void> dispose() async {
    await _controller.close();
  }
}
