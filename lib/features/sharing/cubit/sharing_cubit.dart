import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/sharing_repository.dart';
import 'sharing_state.dart';

@injectable
class SharingCubit extends Cubit<SharingState> {
  final SharingRepository _repository;

  SharingCubit(this._repository) : super(const SharingState.initial());

  /// Load current sharing configuration from the API.
  Future<void> loadConfig() async {
    emit(const SharingState.loading());
    try {
      final config = await _repository.getConfig();
      emit(SharingState.loaded(config: config));
    } catch (e) {
      developer.log('SharingCubit.loadConfig failed: $e', name: 'sharing');
      emit(const SharingState.error('Failed to load sharing settings.'));
    }
  }

  /// Update the sharing duration.
  void updateDuration(String duration) {
    final s = state;
    if (s is! SharingLoaded) return;
    emit(SharingState.loaded(
      config: s.config.copyWith(duration: duration),
    ));
  }

  /// Toggle a specific sharing setting key.
  void toggleSetting(String key) {
    final s = state;
    if (s is! SharingLoaded) return;
    final settings = s.config.settings;
    final updated = switch (key) {
      'workouts' => settings.copyWith(workouts: !settings.workouts),
      'measurements' => settings.copyWith(measurements: !settings.measurements),
      'photos' => settings.copyWith(photos: !settings.photos),
      'checkins' => settings.copyWith(checkins: !settings.checkins),
      _ => settings,
    };
    emit(SharingState.loaded(
      config: s.config.copyWith(settings: updated),
    ));
  }

  /// Save the current config to the API with optimistic UI + rollback.
  Future<bool> save() async {
    final s = state;
    if (s is! SharingLoaded) return false;
    final snapshot = s;

    emit(const SharingState.saving());
    try {
      final body = <String, dynamic>{
        'duration': s.config.duration,
        'settings': {
          'workouts': s.config.settings.workouts,
          'measurements': s.config.settings.measurements,
          'photos': s.config.settings.photos,
          'checkins': s.config.settings.checkins,
        },
      };
      await _repository.updateConfig(body);
      _repository.invalidateCache();
      emit(SharingState.loaded(config: s.config));
      return true;
    } catch (e) {
      developer.log('SharingCubit.save failed: $e', name: 'sharing');
      emit(snapshot); // rollback to pre-save state
      return false;
    }
  }
}
