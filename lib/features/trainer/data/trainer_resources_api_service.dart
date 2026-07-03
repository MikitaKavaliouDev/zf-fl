import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'models/resource_vault_item_dto.dart';

@injectable
class TrainerResourcesApiService {
  final Dio _dio;

  TrainerResourcesApiService(this._dio);

  /// GET /api/trainer/resource-vault — resource vault items.
  Future<List<ResourceVaultItemDto>> getResources({
    int page = 1,
    int pageSize = 20,
  }) async {
    final response = await _dio.get(
      '/api/trainer/resource-vault',
      queryParameters: {'page': page, 'pageSize': pageSize},
    );
    final data = response.data['data'] as Map<String, dynamic>;
    final items = data['resources'] as List<dynamic>;
    return items
        .map((e) => ResourceVaultItemDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// POST /api/trainer/resource-vault — upload a new resource.
  Future<ResourceVaultItemDto> createResource(
    Map<String, dynamic> request,
  ) async {
    final response = await _dio.post(
      '/api/trainer/resource-vault',
      data: request,
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return ResourceVaultItemDto.fromJson(data);
  }

  /// DELETE /api/trainer/resource-vault/:id
  Future<void> deleteResource(String id) async {
    await _dio.delete('/api/trainer/resource-vault/$id');
  }
}
