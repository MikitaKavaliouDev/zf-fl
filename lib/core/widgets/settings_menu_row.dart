import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// A single row in a grouped settings menu.
///
/// Matches the iOS `MoreView` row pattern:
/// - 32×32 icon in a tinted rounded container
/// - Title + optional subtitle
/// - Optional trailing widget (chevron, switch, value)
/// - Divider between rows (hidden for [isLast])
///
/// Usage:
/// ```dart
/// _buildMenuGroup([
///   SettingsMenuRow(
///     icon: Icons.palette_outlined,
///     iconColor: Colors.pink,
///     title: 'Appearance',
///     onTap: () => _push(context, const AppearanceSettingsScreen()),
///   ),
///   SettingsMenuRow(
///     icon: Icons.light_mode_rounded,
///     iconColor: AppColors.primary,
///     title: 'Theme',
///     subtitle: 'Light',
///     trailing: const Icon(Icons.chevron_right_rounded, size: 20, color: AppColors.mutedText),
///     isLast: true,
///   ),
/// ]);
/// ```
class SettingsMenuRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool isLast;

  const SettingsMenuRow({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: isLast
              ? const BorderRadius.vertical(bottom: Radius.circular(16))
              : BorderRadius.zero,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                // Icon in tinted container
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
                // Title + subtitle
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
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            subtitle!,
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.mutedText,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                // Trailing widget (default: chevron)
                trailing ??
                    const Icon(
                      Icons.chevron_right_rounded,
                      size: 20,
                      color: AppColors.mutedText,
                    ),
              ],
            ),
          ),
        ),
        if (!isLast) const Divider(height: 1, indent: 60),
      ],
    );
  }
}
