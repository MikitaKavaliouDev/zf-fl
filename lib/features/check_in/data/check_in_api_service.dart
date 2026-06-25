import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'models/check_in_config_dto.dart';
import 'models/check_in_detail_dto.dart';
import 'models/check_in_history_item_dto.dart';
import 'models/check_in_response_dto.dart';
import 'models/check_in_submission_dto.dart';
import 'models/upload_response_dto.dart';

@injectable
class CheckInApiService {
  final Dio _dio;

  CheckInApiService(this._dio);

  /// GET /api/client/check-in/config — check-in schedule configuration.
  Future<CheckInConfigDto> getConfig() async {
    final response = await _dio.get('/api/client/check-in/config');
    final data = response.data['data'] as Map<String, dynamic>;
    return CheckInConfigDto.fromJson(data);
  }

  /// POST /api/client/check-in — submit a weekly check-in.
  Future<CheckInResponseDto> submitCheckIn(
    CheckInSubmissionDto submission,
  ) async {
    developer.log(
      'Submitting check-in',
      name: 'check_in_api',
    );
    final response = await _dio.post(
      '/api/client/check-in',
      data: submission.toJson(),
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return CheckInResponseDto.fromJson(data);
  }

  /// GET /api/client/check-ins — list of past check-ins.
  Future<List<CheckInHistoryItemDto>> getHistory() async {
    final response = await _dio.get('/api/client/check-ins');
    final data = response.data['data'] as List<dynamic>;
    return data
        .map((e) =>
            CheckInHistoryItemDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// GET /api/client/check-ins/{id} — full check-in detail.
  Future<CheckInDetailDto> getDetail(String id) async {
    final response = await _dio.get('/api/client/check-ins/$id');
    final data = response.data['data'] as Map<String, dynamic>;
    return CheckInDetailDto.fromJson(data);
  }

  /// POST /api/client/upload — upload a check-in photo.
  Future<UploadResponseDto> uploadPhoto(String filePath) async {
    developer.log(
      'Uploading photo: $filePath',
      name: 'check_in_api',
    );
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(filePath),
    });
    final response = await _dio.post(
      '/api/client/upload',
      data: formData,
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return UploadResponseDto.fromJson(data);
  }
}
