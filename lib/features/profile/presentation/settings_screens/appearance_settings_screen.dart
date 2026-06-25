import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class AppearanceSettingsScreen extends StatelessWidget {
  const AppearanceSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Appearance')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          const SizedBox(height: 8),
          _buildSection(
            title: 'Display',
            children: [
              _buildMenuRow(
                icon: Icons.light_mode_rounded,
                iconColor: AppColors.primary,
                title: 'Theme',
                subtitle: 'Light',
              ),
              _buildMenuRow(
                icon: Icons.text_fields_rounded,
                iconColor: AppColors.foreground,
                title: 'Text Size',
                subtitle: 'Default',
                isLast: true,
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildSection(
            title: 'App Icon',
            children: [
              _buildMenuRow(
                icon: Icons.grid_view_rounded,
                iconColor: AppColors.primary,
                title: 'App Icon',
                subtitle: 'Default',
                isLast: true,
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildSection(
            title: 'Accessibility',
            children: [
              _buildMenuRow(
                icon: Icons.accessibility_new_rounded,
                iconColor: AppColors.primary,
                title: 'Reduce Motion',
                subtitle: 'Off',
                trailing: Switch(
                  value: false,
                  onChanged: (_) {},
                  activeTrackColor: AppColors.primary,
                ),
                isLast: true,
              ),
            ],
          ),
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

  Widget _buildMenuRow({
    required IconData icon,
    required Color iconColor,
    required String title,
    String? subtitle,
    Widget? trailing,
    bool isLast = false,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
                    if (subtitle != null)
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.mutedText,
                        ),
                      ),
                  ],
                ),
              ),
              trailing ??
                  const Icon(
                    Icons.chevron_right_rounded,
                    size: 20,
                    color: AppColors.mutedText,
                  ),
            ],
          ),
        ),
        if (!isLast) const Divider(height: 1, indent: 60),
      ],
    );
  }
}
