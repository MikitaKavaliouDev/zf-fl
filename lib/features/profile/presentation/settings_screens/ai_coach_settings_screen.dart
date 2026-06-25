import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class AiCoachSettingsScreen extends StatefulWidget {
  const AiCoachSettingsScreen({super.key});

  @override
  State<AiCoachSettingsScreen> createState() => _AiCoachSettingsScreenState();
}

class _AiCoachSettingsScreenState extends State<AiCoachSettingsScreen> {
  bool _voiceFeedback = true;
  bool _aiCoachEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Coach Settings')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          const SizedBox(height: 8),
          _buildSection(
            title: 'Voice Feedback',
            children: [
              _buildToggleRow(
                icon: Icons.record_voice_over_rounded,
                iconColor: AppColors.primary,
                title: 'Voice Feedback',
                subtitle: 'Hear audio cues during workouts',
                value: _voiceFeedback,
                onChanged: (v) => setState(() => _voiceFeedback = v),
                isLast: true,
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildSection(
            title: 'AI Coach',
            children: [
              _buildToggleRow(
                icon: Icons.auto_awesome_rounded,
                iconColor: AppColors.primary,
                title: 'AI Coach Enabled',
                subtitle: 'Get personalized coaching and recommendations',
                value: _aiCoachEnabled,
                onChanged: (v) => setState(() => _aiCoachEnabled = v),
                isLast: true,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              'AI Coach settings are currently managed locally. '
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
