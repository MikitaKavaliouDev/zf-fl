import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/settings/experimental_features_service.dart';
import 'experimental_features_state.dart';

/// Manages experimental feature toggles with local persistence.
///
/// All values are persisted via [ExperimentalFeaturesService]
/// (SharedPreferences) and load instantly from disk — no network
/// dependency, fully offline-first.
///
/// Mirrors the iOS `@AppStorage` flags in `AppState.swift`:
///   - isDailyTargetsEnabled
///   - isVoiceFeedbackEnabled
///   - isRoutinesEnabled
@injectable
class ExperimentalFeaturesCubit extends Cubit<ExperimentalFeaturesState> {
  final ExperimentalFeaturesService _service;

  ExperimentalFeaturesCubit(this._service)
      : super(const ExperimentalFeaturesState());

  /// Load all persisted feature flags from SharedPreferences.
  Future<void> load() async {
    final results = await Future.wait([
      _service.getDailyTargetsEnabled(),
      _service.getVoiceFeedbackEnabled(),
      _service.getPersonalRoutinesEnabled(),
      _service.getCustomAppModeEnabled(),
    ]);
    emit(ExperimentalFeaturesState(
      dailyExerciseTargets: results[0],
      voiceFeedbackBeta: results[1],
      personalRoutines: results[2],
      customAppMode: results[3],
    ));
    developer.log(
      'ExperimentalFeatures: loaded (dailyTargets=$results[0], '
      'voiceFeedback=$results[1], routines=$results[2], '
      'customAppMode=$results[3])',
      name: 'experimental',
    );
  }

  /// Persist and apply the daily exercise targets toggle.
  Future<void> setDailyExerciseTargets(bool value) async {
    await _service.setDailyTargetsEnabled(value);
    emit(state.copyWith(dailyExerciseTargets: value));
    developer.log(
      'ExperimentalFeatures: dailyExerciseTargets → $value',
      name: 'experimental',
    );
  }

  /// Persist and apply the voice feedback (beta) toggle.
  Future<void> setVoiceFeedbackBeta(bool value) async {
    await _service.setVoiceFeedbackEnabled(value);
    emit(state.copyWith(voiceFeedbackBeta: value));
    developer.log(
      'ExperimentalFeatures: voiceFeedbackBeta → $value',
      name: 'experimental',
    );
  }

  /// Persist and apply the personal routines toggle.
  Future<void> setPersonalRoutines(bool value) async {
    await _service.setPersonalRoutinesEnabled(value);
    emit(state.copyWith(personalRoutines: value));
    developer.log(
      'ExperimentalFeatures: personalRoutines → $value',
      name: 'experimental',
    );
  }

  /// Persist and apply the custom app mode toggle.
  Future<void> setCustomAppMode(bool value) async {
    await _service.setCustomAppModeEnabled(value);
    emit(state.copyWith(customAppMode: value));
    developer.log(
      'ExperimentalFeatures: customAppMode → $value',
      name: 'experimental',
    );
  }
}
