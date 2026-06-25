import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/daily_target_dto.dart';

part 'daily_targets_state.freezed.dart';

@freezed
sealed class DailyTargetsState with _$DailyTargetsState {
  const factory DailyTargetsState.initial() = DailyTargetsInitial;

  const factory DailyTargetsState.loading() = DailyTargetsLoading;

  const factory DailyTargetsState.loaded({
    required List<DailyTargetDto> targets,
  }) = DailyTargetsLoaded;

  const factory DailyTargetsState.error(String message) = DailyTargetsError;
}
