import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Local persistence for experimental feature toggles.
///
/// Backed by [SharedPreferences]. Mirrors the iOS `@AppStorage` pattern
/// where `isDailyTargetsEnabled`, `isVoiceFeedbackEnabled`, etc. are
/// persisted locally and never synced to the backend.
@singleton
class ExperimentalFeaturesService {
  static const _keyDailyTargets = 'experimental:dailyTargets';
  static const _keyVoiceFeedback = 'experimental:voiceFeedback';
  static const _keyPersonalRoutines = 'experimental:personalRoutines';
  static const _keyCustomAppMode = 'experimental:customAppMode';

  Future<SharedPreferences> get _prefs => SharedPreferences.getInstance();

  bool get defaultDailyTargets => false;
  bool get defaultVoiceFeedback => false;
  bool get defaultPersonalRoutines => false;
  bool get defaultCustomAppMode => false;

  // ── Daily Exercise Targets ──

  Future<bool> getDailyTargetsEnabled() async {
    final prefs = await _prefs;
    return prefs.getBool(_keyDailyTargets) ?? defaultDailyTargets;
  }

  Future<void> setDailyTargetsEnabled(bool value) async {
    final prefs = await _prefs;
    await prefs.setBool(_keyDailyTargets, value);
  }

  // ── Voice Feedback (Beta) ──

  Future<bool> getVoiceFeedbackEnabled() async {
    final prefs = await _prefs;
    return prefs.getBool(_keyVoiceFeedback) ?? defaultVoiceFeedback;
  }

  Future<void> setVoiceFeedbackEnabled(bool value) async {
    final prefs = await _prefs;
    await prefs.setBool(_keyVoiceFeedback, value);
  }

  // ── Personal Routines ──

  Future<bool> getPersonalRoutinesEnabled() async {
    final prefs = await _prefs;
    return prefs.getBool(_keyPersonalRoutines) ?? defaultPersonalRoutines;
  }

  Future<void> setPersonalRoutinesEnabled(bool value) async {
    final prefs = await _prefs;
    await prefs.setBool(_keyPersonalRoutines, value);
  }

  // ── Custom App Mode ──

  Future<bool> getCustomAppModeEnabled() async {
    final prefs = await _prefs;
    return prefs.getBool(_keyCustomAppMode) ?? defaultCustomAppMode;
  }

  Future<void> setCustomAppModeEnabled(bool value) async {
    final prefs = await _prefs;
    await prefs.setBool(_keyCustomAppMode, value);
  }
}
