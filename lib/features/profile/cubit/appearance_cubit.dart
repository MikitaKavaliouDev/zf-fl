import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/settings/appearance_settings_service.dart';
import 'appearance_state.dart';

/// Manages client-side appearance preferences (theme, text size,
/// reduce motion).
///
/// Persists values via [AppearanceSettingsService] (SharedPreferences),
/// matching the iOS `@AppStorage` + `ThemeManager` pattern.
@injectable
class AppearanceCubit extends Cubit<AppearanceState> {
  final AppearanceSettingsService _service;

  AppearanceCubit(this._service) : super(const AppearanceState());

  /// Load all persisted preferences into state.
  Future<void> load() async {
    final themeMode = await _service.getThemeMode();
    final textScale = await _service.getTextScale();
    final reduceMotion = await _service.getReduceMotion();
    emit(AppearanceState(
      themeMode: themeMode,
      textScale: textScale,
      reduceMotion: reduceMotion,
    ));
  }

  /// Persist and apply a new theme mode.
  Future<void> setThemeMode(AppThemeOption mode) async {
    await _service.setThemeMode(mode);
    emit(state.copyWith(themeMode: mode));
    developer.log('Appearance: theme → $mode', name: 'appearance');
  }

  /// Persist and apply a new text scale factor.
  Future<void> setTextScale(TextScaleOption scale) async {
    await _service.setTextScale(scale);
    emit(state.copyWith(textScale: scale));
    developer.log('Appearance: textScale → $scale', name: 'appearance');
  }

  /// Persist and apply reduce-motion preference.
  Future<void> setReduceMotion(bool value) async {
    await _service.setReduceMotion(value);
    emit(state.copyWith(reduceMotion: value));
    developer.log('Appearance: reduceMotion → $value', name: 'appearance');
  }
}
