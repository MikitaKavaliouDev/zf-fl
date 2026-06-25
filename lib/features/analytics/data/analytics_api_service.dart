import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'models/analytics_response_dto.dart';
import 'models/progress_response_dto.dart';
import 'models/widget_config_dto.dart';

@injectable
class AnalyticsApiService {
  final Dio _dio;

  AnalyticsApiService(this._dio);

  /// GET /api/client/analytics — analytics dashboard data.
  Future<AnalyticsResponseDto> getAnalytics() async {
    final response = await _dio.get('/api/client/analytics');
    final data = response.data['data'] as Map<String, dynamic>;
    return AnalyticsResponseDto.fromJson(data);
  }

  /// GET /api/client/progress — client progress history.
  Future<ProgressResponseDto> getProgress() async {
    final response = await _dio.get('/api/client/progress');
    final data = response.data['data'] as Map<String, dynamic>;
    return ProgressResponseDto.fromJson(data);
  }

  /// GET /api/client/widget-config — visible widget configuration.
  Future<WidgetConfigDto> getWidgetConfig() async {
    final response = await _dio.get('/api/client/widget-config');
    final data = response.data['data'] as Map<String, dynamic>;
    return WidgetConfigDto.fromJson(data);
  }

  /// PUT /api/client/widget-config — update widget configuration.
  Future<WidgetConfigDto> updateWidgetConfig(WidgetConfigDto config) async {
    final response = await _dio.put(
      '/api/client/widget-config',
      data: config.toJson(),
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return WidgetConfigDto.fromJson(data);
  }
}
