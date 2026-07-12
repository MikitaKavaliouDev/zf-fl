import 'package:freezed_annotation/freezed_annotation.dart';

part 'experimental_features_state.freezed.dart';

/// Sealed state for the [ExperimentalFeaturesCubit].
///
/// Holds the current value of every experimental feature toggle.
/// All values are persisted locally via [ExperimentalFeaturesService]
/// (SharedPreferences) and never synced to the backend.
@freezed
sealed class ExperimentalFeaturesState with _$ExperimentalFeaturesState {
  const factory ExperimentalFeaturesState({
    @Default(false) bool dailyExerciseTargets,
    @Default(false) bool voiceFeedbackBeta,
    @Default(false) bool personalRoutines,
    @Default(false) bool customAppMode,
  }) = _ExperimentalFeaturesState;
}
