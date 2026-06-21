import 'package:flutter/foundation.dart';

class LoggerConfig {
  LoggerConfig._();

  static bool get logApiCalls => !kReleaseMode;
  static bool get logStateChanges => !kReleaseMode;
  static bool get logNavigation => !kReleaseMode;
}
