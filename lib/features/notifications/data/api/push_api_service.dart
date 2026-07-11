import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// API service for FCM push token registration.
///
/// POST /api/profile/me/push-token — registers or updates this device's
/// FCM token on the backend. The AuthInterceptor on the Dio instance
/// automatically injects the Bearer token.
@injectable
class PushApiService {
  final Dio _dio;

  PushApiService(this._dio);

  /// Registers this device's FCM push token with the backend.
  ///
  /// The endpoint is idempotent: if the token already exists for this user,
  /// it updates OS version / app version. If the token exists for a different
  /// user (device reassigned), it re-assigns to the current user.
  Future<void> registerToken(String token) async {
    await _dio.post(
      '/api/profile/me/push-token',
      data: {
        'token': token,
        'platform': Platform.isAndroid ? 'android' : 'ios',
        'osVersion': Platform.operatingSystemVersion,
        'appVersion': '1.0.0', // hardcoded fallback — no package_info_plus dep
      },
    );
  }
}
