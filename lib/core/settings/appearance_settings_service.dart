import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Persisted appearance preference keys.
enum AppThemeOption { light, system }

/// Text scale factor options.
enum TextScaleOption { small, defaultScale, large }

/// Persistent key-value storage for client-side appearance preferences.
///
/// Backed by [SharedPreferences]. Mirrors the iOS `@AppStorage` pattern
/// used in `PreferenceSettingsViews.swift` where `ThemeManager.currentTheme`
/// is persisted locally.
@singleton
class AppearanceSettingsService {
  static const _keyTheme = 'appearance:themeMode';
  static const _keyTextScale = 'appearance:textScale';
  static const _keyReduceMotion = 'appearance:reduceMotion';

  Future<SharedPreferences> get _prefs => SharedPreferences.getInstance();

  AppThemeOption get defaultTheme => AppThemeOption.light;
  TextScaleOption get defaultTextScale => TextScaleOption.defaultScale;
  bool get defaultReduceMotion => false;

  // ── Theme ──

  Future<AppThemeOption> getThemeMode() async {
    final prefs = await _prefs;
    final value = prefs.getString(_keyTheme);
    if (value == null) return defaultTheme;
    return AppThemeOption.values.firstWhere(
      (e) => e.name == value,
      orElse: () => defaultTheme,
    );
  }

  Future<void> setThemeMode(AppThemeOption mode) async {
    final prefs = await _prefs;
    await prefs.setString(_keyTheme, mode.name);
  }

  // ── Text Scale ──

  Future<TextScaleOption> getTextScale() async {
    final prefs = await _prefs;
    final value = prefs.getString(_keyTextScale);
    if (value == null) return defaultTextScale;
    return TextScaleOption.values.firstWhere(
      (e) => e.name == value,
      orElse: () => defaultTextScale,
    );
  }

  Future<void> setTextScale(TextScaleOption scale) async {
    final prefs = await _prefs;
    await prefs.setString(_keyTextScale, scale.name);
  }

  // ── Reduce Motion ──

  Future<bool> getReduceMotion() async {
    final prefs = await _prefs;
    return prefs.getBool(_keyReduceMotion) ?? defaultReduceMotion;
  }

  Future<void> setReduceMotion(bool value) async {
    final prefs = await _prefs;
    await prefs.setBool(_keyReduceMotion, value);
  }
}
