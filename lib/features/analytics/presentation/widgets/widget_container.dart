import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

/// Reusable container for analytics widget cards with title, optional
/// subtitle, icon, and action buttons (focus/delete).
class WidgetContainer extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final Widget child;
  final VoidCallback? onFocus;
  final VoidCallback? onDelete;

  const WidgetContainer({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    required this.child,
    this.onFocus,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderMuted),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                Icon(icon, size: 18, color: AppColors.primary),
                const SizedBox(width: 8),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.foreground,
                      ),
                    ),
                    if (subtitle != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          subtitle!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.mutedText,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              if (onFocus != null)
                IconButton(
                  icon: const Icon(
                    Icons.center_focus_strong_outlined,
                    size: 18,
                  ),
                  onPressed: onFocus,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  color: AppColors.mutedText,
                ),
              if (onDelete != null) ...[
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.close_rounded, size: 18),
                  onPressed: onDelete,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  color: AppColors.mutedText,
                ),
              ],
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}
