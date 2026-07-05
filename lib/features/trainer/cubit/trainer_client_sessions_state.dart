import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/trainer_client_session_dto.dart';

part 'trainer_client_sessions_state.freezed.dart';

@freezed
sealed class TrainerClientSessionsState
    with _$TrainerClientSessionsState {
  const factory TrainerClientSessionsState.initial() =
      TrainerClientSessionsInitial;

  const factory TrainerClientSessionsState.loading() =
      TrainerClientSessionsLoading;

  const factory TrainerClientSessionsState.loaded(
    List<TrainerClientSessionDto> sessions,
  ) = TrainerClientSessionsLoaded;

  const factory TrainerClientSessionsState.error(String message) =
      TrainerClientSessionsError;
}
