import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/client_analytics_dto.dart';

part 'trainer_client_analytics_state.freezed.dart';

@freezed
sealed class TrainerClientAnalyticsState with _$TrainerClientAnalyticsState {
  const factory TrainerClientAnalyticsState.initial() =
      TrainerClientAnalyticsInitial;

  const factory TrainerClientAnalyticsState.loading() =
      TrainerClientAnalyticsLoading;

  const factory TrainerClientAnalyticsState.loaded(
    ClientAnalyticsDto analytics,
  ) = TrainerClientAnalyticsLoaded;

  const factory TrainerClientAnalyticsState.error(String message) =
      TrainerClientAnalyticsError;
}
