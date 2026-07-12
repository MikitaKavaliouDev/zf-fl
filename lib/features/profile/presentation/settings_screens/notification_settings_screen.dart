import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../features/notifications/data/services/notification_preferences_service.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  // Notification toggles — prefilled with defaults.
  // In production these would be fetched from a notification preferences API.
  bool _workoutReminders = true;
  bool _sessionReminders = true;
  bool _achievementAlerts = true;
  bool _trainerMessages = true;
  bool _eventPromotions = false;
  bool _productUpdates = false;

  NotificationPreferencesService? _prefsService;

  @override
  void initState() {
    super.initState();
    _prefsService = GetIt.instance<NotificationPreferencesService>();
    _prefsService!.loadAll().then((prefs) {
      if (!mounted) return;
      setState(() {
        _workoutReminders = prefs['workoutReminders'] as bool;
        _sessionReminders = prefs['sessionReminders'] as bool;
        _achievementAlerts = prefs['achievementAlerts'] as bool;
        _trainerMessages = prefs['trainerMessages'] as bool;
        _eventPromotions = prefs['eventPromotions'] as bool;
        _productUpdates = prefs['productUpdates'] as bool;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          const SizedBox(height: 8),
          _buildSection(
            title: 'Training Alerts',
            children: [
              _buildToggleRow(
                icon: Icons.fitness_center_rounded,
                iconColor: AppColors.primary,
                title: 'Workout Reminders',
                subtitle: 'Daily reminders for scheduled workouts',
                value: _workoutReminders,
                onChanged: (v) {
                  _prefsService!.setWorkoutReminders(v);
                  setState(() => _workoutReminders = v);
                },
              ),
              _buildToggleRow(
                icon: Icons.timer_rounded,
                iconColor: AppColors.primary,
                title: 'Session Reminders',
                subtitle: 'Reminders before training sessions',
                value: _sessionReminders,
                onChanged: (v) {
                  _prefsService!.setSessionReminders(v);
                  setState(() => _sessionReminders = v);
                },
              ),
              _buildToggleRow(
                icon: Icons.emoji_events_rounded,
                iconColor: Colors.orange,
                title: 'Achievement Alerts',
                subtitle: 'When you hit a new personal record',
                value: _achievementAlerts,
                onChanged: (v) {
                  _prefsService!.setAchievementAlerts(v);
                  setState(() => _achievementAlerts = v);
                },
                isLast: true,
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildSection(
            title: 'Communication',
            children: [
              _buildToggleRow(
                icon: Icons.message_rounded,
                iconColor: AppColors.primary,
                title: 'Trainer Messages',
                subtitle: 'Messages from your trainer',
                value: _trainerMessages,
                onChanged: (v) {
                  _prefsService!.setTrainerMessages(v);
                  setState(() => _trainerMessages = v);
                },
              ),
              _buildToggleRow(
                icon: Icons.campaign_rounded,
                iconColor: Colors.orange,
                title: 'Events & Promotions',
                subtitle: 'Workshops, challenges, and special offers',
                value: _eventPromotions,
                onChanged: (v) {
                  _prefsService!.setEventPromotions(v);
                  setState(() => _eventPromotions = v);
                },
              ),
              _buildToggleRow(
                icon: Icons.new_releases_rounded,
                iconColor: AppColors.primary,
                title: 'Product Updates',
                subtitle: 'New features and improvements',
                value: _productUpdates,
                onChanged: (v) {
                  _prefsService!.setProductUpdates(v);
                  setState(() => _productUpdates = v);
                },
                isLast: true,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              'Notification preferences are currently managed locally. '
              'Server-side sync is coming soon.',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.mutedText.withValues(alpha: 0.7),
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.mutedText,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.borderMuted),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildToggleRow({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
    bool isLast = false,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, size: 18, color: iconColor),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.foreground,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.mutedText,
                      ),
                    ),
                  ],
                ),
              ),
              Switch(
                value: value,
                onChanged: onChanged,
                activeTrackColor: AppColors.primary,
              ),
            ],
          ),
        ),
        if (!isLast) const Divider(height: 1, indent: 60),
      ],
    );
  }
}
