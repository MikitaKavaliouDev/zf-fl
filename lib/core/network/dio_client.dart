import 'dart:io' show Platform;

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'api_logger_interceptor.dart';
import 'auth_interceptor.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio provideDio(
    ApiLoggerInterceptor apiLogger,
    AuthInterceptor authInterceptor,
  ) {
    final dio = Dio(
      BaseOptions(
        // Android emulator uses 10.0.2.2 to reach host localhost;
        // iOS simulator can use localhost directly.
        // Override via API_BASE_URL env var for physical devices.
        baseUrl: _baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Order matters: logger outermost (last added, first to see requests),
    // auth interceptor innermost.
    dio.interceptors.addAll([apiLogger, authInterceptor]);

    return dio;
  }

  /// Resolves the correct backend URL based on platform and environment.
  static String get _baseUrl {
    const envUrl = String.fromEnvironment('API_BASE_URL');
    if (envUrl.isNotEmpty) return envUrl;
    if (Platform.isAndroid) return 'http://10.0.2.2:3321';
    return 'http://localhost:3321';
  }
}
