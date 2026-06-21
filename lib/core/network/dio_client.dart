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
        baseUrl: 'http://localhost:3321',
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
}
