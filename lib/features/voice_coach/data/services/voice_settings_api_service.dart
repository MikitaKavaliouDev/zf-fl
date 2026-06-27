import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../models/voice_settings_dto.dart';

/// API service for voice settings (AI coach voice selection).
@injectable
class VoiceSettingsApiService {
  final Dio _dio;

  VoiceSettingsApiService(this._dio);

  static const _defaultVoiceId = 'JBFqnCBsd9RMbkH7EtoT';

  /// GET /api/user/voice-settings
  Future<VoiceSettingsResponseDto> getVoiceSettings() async {
    final response = await _dio.get('/api/user/voice-settings');
    final data = response.data['data'] as Map<String, dynamic>;
    return VoiceSettingsResponseDto.fromJson(data);
  }

  /// PUT /api/user/voice-settings
  Future<VoiceSettingsResponseDto> updateVoiceSettings({
    required String voiceId,
    VoiceSettingsValues? settings,
  }) async {
    final response = await _dio.put(
      '/api/user/voice-settings',
      data: {
        'voiceId': voiceId,
        if (settings != null) 'settings': settings.toJson(),
      },
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return VoiceSettingsResponseDto.fromJson(data);
  }

  /// GET /api/ai-trainer/voices — list available ElevenLabs voices.
  Future<List<VoiceDto>> getAvailableVoices() async {
    final response = await _dio.get('/api/ai-trainer/voices');
    final data = response.data['data'] as Map<String, dynamic>;
    final voicesList = data['voices'] as List<dynamic>;
    return voicesList
        .map((e) => VoiceDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// The default voice ID used as fallback.
  static String get defaultVoiceId => _defaultVoiceId;
}
