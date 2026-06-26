import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'models/avatar_response_dto.dart';
import 'models/privacy_settings_dto.dart';
import 'models/profile_core_info_dto.dart';
import 'models/profile_text_content_dto.dart';

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

  /// GET /api/profile/me/core-info — fetch core profile info.
  Future<ProfileCoreInfoDto> getCoreInfo() async {
    final response = await _dio.get('/api/profile/me/core-info');
    final body = response.data as Map<String, dynamic>;
    final coreInfo = (body['data'] as Map<String, dynamic>)['coreInfo']
        as Map<String, dynamic>;
    return ProfileCoreInfoDto.fromJson(coreInfo);
  }

  /// PUT /api/profile/me/core-info — update core profile info.
  Future<ProfileCoreInfoDto> updateCoreInfo(
    Map<String, dynamic> updates,
  ) async {
    final response = await _dio.put('/api/profile/me/core-info', data: updates);
    final body = response.data as Map<String, dynamic>;
    final coreInfo = (body['data'] as Map<String, dynamic>)['coreInfo']
        as Map<String, dynamic>;
    return ProfileCoreInfoDto.fromJson(coreInfo);
  }

  /// GET /api/profile/me/text-content — fetch text content (aboutMe etc).
  Future<ProfileTextContentDto> getTextContent() async {
    final response = await _dio.get('/api/profile/me/text-content');
    final body = response.data as Map<String, dynamic>;
    final textContents =
        (body['data'] as Map<String, dynamic>)['textContents']
            as Map<String, dynamic>;
    return ProfileTextContentDto.fromJson(textContents);
  }

  /// PUT /api/profile/me/text-content — update a specific text field.
  Future<void> updateTextContent(String fieldName, String content) async {
    await _dio.put(
      '/api/profile/me/text-content',
      data: {'fieldName': fieldName, 'content': content},
    );
  }

  /// POST /api/profile/me/avatar — upload profile photo.
  Future<AvatarResponseDto> uploadAvatar(String filePath) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(filePath),
    });
    final response = await _dio.post(
      '/api/profile/me/avatar',
      data: formData,
    );
    developer.log('Avatar upload response: $response', name: 'profile_api');
    return AvatarResponseDto.fromJson(
      response.data['data'] as Map<String, dynamic>,
    );
  }
}
