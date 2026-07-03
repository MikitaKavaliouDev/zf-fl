import 'package:injectable/injectable.dart';

import '../models/app_mode.dart';

/// Holds the currently active [AppMode] so that [AuthInterceptor] and
/// [TokenStorage] can read/write the correct per-mode token.
///
/// Updated whenever the user switches modes or completes a login.
@singleton
class ActiveModeHolder {
  AppMode currentMode = AppMode.client;
}
