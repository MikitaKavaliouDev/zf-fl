import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/check_in_config_dto.dart';
import '../data/models/check_in_response_dto.dart';
import '../data/models/check_in_submission_dto.dart';

part 'check_in_state.freezed.dart';

@freezed
sealed class CheckInState with _$CheckInState {
  const factory CheckInState.initial() = CheckInInitial;

  /// User is filling out the wizard at a given [step] (0–3).
  /// [submission] accumulates data as the user progresses.
  /// [config] is loaded from the API on screen init.
  const factory CheckInState.step({
    @Default(0) int step,
    required CheckInSubmissionDto submission,
    CheckInConfigDto? config,
  }) = CheckInStep;

  /// Submitting the check-in to the backend.
  const factory CheckInState.submitting() = CheckInSubmitting;

  /// Check-in was submitted successfully.
  const factory CheckInState.success(CheckInResponseDto response) =
      CheckInSuccess;

  /// An error occurred.
  const factory CheckInState.error(String message) = CheckInError;
}
