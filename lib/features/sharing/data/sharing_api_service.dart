import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'models/sharing_config_dto.dart';

@injectable
class SharingApiService {
  final Dio _dio;

  SharingApiService(this._dio);

  /// GET /api/client/sharing — fetch current sharing config.
  Future<SharingConfigDto> getConfig() async {
    final response = await _dio.get('/api/client/sharing');
    final data = response.data['data'] as Map<String, dynamic>;
    return SharingConfigDto.fromJson(data);
  }

  /// PUT /api/client/sharing — update sharing config.
  Future<void> updateConfig(Map<String, dynamic> body) async {
    await _dio.put('/api/client/sharing', data: body);
  }
}
