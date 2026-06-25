import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'models/privacy_settings_dto.dart';

@injectable
class ProfileApiService {
  final Dio _dio;

  ProfileApiService(this._dio);

  /// GET /api/client/privacy — client privacy settings.
  Future<PrivacySettingsDto> getPrivacySettings() async {
    final response = await _dio.get('/api/client/privacy');
    final data = response.data['data'] as Map<String, dynamic>;
    return PrivacySettingsDto.fromJson(data);
  }

  /// PUT /api/client/privacy — partial update of privacy settings.
  Future<PrivacySettingsDto> updatePrivacySettings(
    Map<String, dynamic> updates,
  ) async {
    final response = await _dio.put('/api/client/privacy', data: updates);
    final data = response.data['data'] as Map<String, dynamic>;
    return PrivacySettingsDto.fromJson(data);
  }
}
