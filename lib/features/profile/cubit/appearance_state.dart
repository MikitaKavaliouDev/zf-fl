import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/settings/appearance_settings_service.dart';

part 'appearance_state.freezed.dart';

/// Sealed state for the [AppearanceCubit].
///
/// Holds the current value of every client-side appearance preference.
@freezed
sealed class AppearanceState with _$AppearanceState {
  const factory AppearanceState({
    @Default(AppThemeOption.light) AppThemeOption themeMode,
    @Default(TextScaleOption.defaultScale) TextScaleOption textScale,
    @Default(false) bool reduceMotion,
  }) = _AppearanceState;
}
