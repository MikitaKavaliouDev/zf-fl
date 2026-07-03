import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'models/trainer_settings_dto.dart';

@injectable
class TrainerSettingsApiService {
  final Dio _dio;

  TrainerSettingsApiService(this._dio);

  /// GET /api/trainer/settings — trainer preferences.
  Future<TrainerSettingsDto> getSettings() async {
    final response = await _dio.get('/api/trainer/settings');
    final data = response.data['data'] as Map<String, dynamic>;
    return TrainerSettingsDto.fromJson(data);
  }

  /// PUT /api/trainer/settings — update preferences.
  Future<TrainerSettingsDto> updateSettings(
    TrainerSettingsDto settings,
  ) async {
    final response = await _dio.put(
      '/api/trainer/settings',
      data: settings.toJson(),
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return TrainerSettingsDto.fromJson(data);
  }
}
