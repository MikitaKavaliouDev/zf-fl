import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Local persistence for notification toggle preferences.
///
/// Backed by [SharedPreferences]. Mirrors the iOS `@AppStorage` pattern
/// where notification toggles are persisted locally until server-side sync
/// is implemented.
@singleton
class NotificationPreferencesService {
  static const _keyWorkoutReminders = 'notif_workout_reminders';
  static const _keySessionReminders = 'notif_session_reminders';
  static const _keyAchievementAlerts = 'notif_achievement_alerts';
  static const _keyTrainerMessages = 'notif_trainer_messages';
  static const _keyEventPromotions = 'notif_event_promotions';
  static const _keyProductUpdates = 'notif_product_updates';

  Future<SharedPreferences> get _prefs => SharedPreferences.getInstance();

  // ── Workout Reminders ──

  Future<bool> getWorkoutReminders() async {
    final prefs = await _prefs;
    return prefs.getBool(_keyWorkoutReminders) ?? true;
  }

  Future<void> setWorkoutReminders(bool value) async {
    final prefs = await _prefs;
    await prefs.setBool(_keyWorkoutReminders, value);
  }

  // ── Session Reminders ──

  Future<bool> getSessionReminders() async {
    final prefs = await _prefs;
    return prefs.getBool(_keySessionReminders) ?? true;
  }

  Future<void> setSessionReminders(bool value) async {
    final prefs = await _prefs;
    await prefs.setBool(_keySessionReminders, value);
  }

  // ── Achievement Alerts ──

  Future<bool> getAchievementAlerts() async {
    final prefs = await _prefs;
    return prefs.getBool(_keyAchievementAlerts) ?? true;
  }

  Future<void> setAchievementAlerts(bool value) async {
    final prefs = await _prefs;
    await prefs.setBool(_keyAchievementAlerts, value);
  }

  // ── Trainer Messages ──

  Future<bool> getTrainerMessages() async {
    final prefs = await _prefs;
    return prefs.getBool(_keyTrainerMessages) ?? true;
  }

  Future<void> setTrainerMessages(bool value) async {
    final prefs = await _prefs;
    await prefs.setBool(_keyTrainerMessages, value);
  }

  // ── Events & Promotions ──

  Future<bool> getEventPromotions() async {
    final prefs = await _prefs;
    return prefs.getBool(_keyEventPromotions) ?? false;
  }

  Future<void> setEventPromotions(bool value) async {
    final prefs = await _prefs;
    await prefs.setBool(_keyEventPromotions, value);
  }

  // ── Product Updates ──

  Future<bool> getProductUpdates() async {
    final prefs = await _prefs;
    return prefs.getBool(_keyProductUpdates) ?? false;
  }

  Future<void> setProductUpdates(bool value) async {
    final prefs = await _prefs;
    await prefs.setBool(_keyProductUpdates, value);
  }

  // ── Bulk Load ──

  /// Loads all six toggle values with their defaults.
  Future<Map<String, bool>> loadAll() async {
    final prefs = await _prefs;
    return {
      'workoutReminders': prefs.getBool(_keyWorkoutReminders) ?? true,
      'sessionReminders': prefs.getBool(_keySessionReminders) ?? true,
      'achievementAlerts': prefs.getBool(_keyAchievementAlerts) ?? true,
      'trainerMessages': prefs.getBool(_keyTrainerMessages) ?? true,
      'eventPromotions': prefs.getBool(_keyEventPromotions) ?? false,
      'productUpdates': prefs.getBool(_keyProductUpdates) ?? false,
    };
  }
}
