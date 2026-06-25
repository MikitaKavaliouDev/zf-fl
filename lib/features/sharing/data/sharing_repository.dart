import 'package:injectable/injectable.dart';

import 'models/sharing_config_dto.dart';
import 'sharing_api_service.dart';

@singleton
class SharingRepository {
  final SharingApiService _api;

  SharingRepository(this._api);

  Future<SharingConfigDto> getConfig() => _api.getConfig();

  Future<void> updateConfig(Map<String, dynamic> body) =>
      _api.updateConfig(body);
}
