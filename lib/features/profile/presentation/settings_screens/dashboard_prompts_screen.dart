import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class DashboardPromptsScreen extends StatefulWidget {
  const DashboardPromptsScreen({super.key});

  @override
  State<DashboardPromptsScreen> createState() =>
      _DashboardPromptsScreenState();
}

class _DashboardPromptsScreenState extends State<DashboardPromptsScreen> {
  // Prompt visibility toggles — prefilled with defaults.
  // In production these would be fetched from a dashboard config API
  // (POST /api/client/widget-config).
  bool _showCheckInPrompt = true;
  bool _showWorkoutPrompt = true;
  bool _showGoalPrompt = true;
  bool _showStreakCard = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard Prompts')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.mutedSurface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.borderMuted),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.info_outline_rounded,
                  size: 20,
                  color: AppColors.mutedText,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Choose which prompts and cards appear on your home dashboard.',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.mutedText,
                      height: 1.3,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _buildSection(
            title: 'Visible Cards',
            children: [
              _buildToggleRow(
                icon: Icons.check_circle_outline_rounded,
                iconColor: Colors.green,
                title: 'Daily Check-In Prompt',
                subtitle: 'Remind you to log your daily check-in',
                value: _showCheckInPrompt,
                onChanged: (v) =>
                    setState(() => _showCheckInPrompt = v),
              ),
              _buildToggleRow(
                icon: Icons.fitness_center_rounded,
                iconColor: AppColors.primary,
                title: 'Workout Suggestion',
                subtitle: 'Suggested workout based on your routine',
                value: _showWorkoutPrompt,
                onChanged: (v) =>
                    setState(() => _showWorkoutPrompt = v),
              ),
              _buildToggleRow(
                icon: Icons.flag_rounded,
                iconColor: Colors.orange,
                title: 'Goal Progress',
                subtitle: 'Show progress toward fitness goals',
                value: _showGoalPrompt,
                onChanged: (v) => setState(() => _showGoalPrompt = v),
              ),
              _buildToggleRow(
                icon: Icons.local_fire_department_rounded,
                iconColor: Colors.deepOrange,
                title: 'Streak Card',
                subtitle: 'Display current workout streak',
                value: _showStreakCard,
                onChanged: (v) => setState(() => _showStreakCard = v),
                isLast: true,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              'Prompt visibility preferences are saved locally. '
              'Cloud sync is coming soon.',
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
