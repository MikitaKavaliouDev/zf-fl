import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/trainer_client_active_program_dto.dart';

part 'trainer_active_program_state.freezed.dart';

@freezed
sealed class TrainerActiveProgramState with _$TrainerActiveProgramState {
  const factory TrainerActiveProgramState.initial() =
      TrainerActiveProgramInitial;

  const factory TrainerActiveProgramState.loading() =
      TrainerActiveProgramLoading;

  const factory TrainerActiveProgramState.loaded(
    TrainerClientActiveProgramDto? program,
  ) = TrainerActiveProgramLoaded;

  const factory TrainerActiveProgramState.error(String message) =
      TrainerActiveProgramError;
}
