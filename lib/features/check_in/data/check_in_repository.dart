import 'package:injectable/injectable.dart';

import 'check_in_api_service.dart';
import 'models/check_in_config_dto.dart';
import 'models/check_in_detail_dto.dart';
import 'models/check_in_history_item_dto.dart';
import 'models/check_in_response_dto.dart';
import 'models/check_in_submission_dto.dart';
import 'models/upload_response_dto.dart';

@singleton
class CheckInRepository {
  final CheckInApiService _api;

  CheckInRepository(this._api);

  Future<CheckInConfigDto> getConfig() => _api.getConfig();

  Future<CheckInResponseDto> submitCheckIn(
    CheckInSubmissionDto submission,
  ) =>
      _api.submitCheckIn(submission);

  Future<List<CheckInHistoryItemDto>> getHistory() => _api.getHistory();

  Future<CheckInDetailDto> getDetail(String id) => _api.getDetail(id);

  Future<UploadResponseDto> uploadPhoto(String filePath) =>
      _api.uploadPhoto(filePath);
}
