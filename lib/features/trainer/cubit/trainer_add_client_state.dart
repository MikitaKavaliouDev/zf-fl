import 'package:freezed_annotation/freezed_annotation.dart';

part 'trainer_add_client_state.freezed.dart';

@freezed
sealed class TrainerAddClientState with _$TrainerAddClientState {
  const factory TrainerAddClientState.initial() = TrainerAddClientInitial;

  const factory TrainerAddClientState.loading() = TrainerAddClientLoading;

  const factory TrainerAddClientState.loaded({
    String? successMessage,
  }) = TrainerAddClientLoaded;

  /// A user with this email already exists on Ziro Fit.
  /// The UI should show a "Request Connection" option.
  const factory TrainerAddClientState.emailAlreadyExists() =
      TrainerAddClientEmailAlreadyExists;

  /// This client is already linked to the trainer.
  const factory TrainerAddClientState.linkAlreadyPending() =
      TrainerAddClientLinkAlreadyPending;

  /// Client limit reached for the trainer's current plan.
  const factory TrainerAddClientState.limitReached() =
      TrainerAddClientLimitReached;

  const factory TrainerAddClientState.error(String message) =
      TrainerAddClientError;
}
