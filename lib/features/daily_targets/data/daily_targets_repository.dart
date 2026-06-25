import 'package:injectable/injectable.dart';

import 'daily_targets_api_service.dart';
import 'models/daily_target_dto.dart';

@singleton
class DailyTargetsRepository {
  final DailyTargetsApiService _api;

  DailyTargetsRepository(this._api);

  Future<List<DailyTargetDto>> getTargets({String? date}) =>
      _api.getTargets(date: date);

  Future<DailyTargetDto> createTarget(Map<String, dynamic> body) =>
      _api.createTarget(body);

  Future<DailyTargetDto> updateTarget(
    String id, {
    double? currentValue,
    bool? isCompleted,
  }) =>
      _api.updateTarget(id, currentValue: currentValue, isCompleted: isCompleted);

  Future<void> deleteTarget(String id) => _api.deleteTarget(id);
}
