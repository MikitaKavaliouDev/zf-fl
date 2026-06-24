import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

/// Reusable bottom sheet / overlay header — replicates ZiroSheetHeader.swift.
///
/// Layout:
/// - Drag handle (40×5 rounded pill)
/// - Title centered in a 44pt bar
/// - Optional Cancel (left) and Done (right) buttons
/// - Background uses .ultraThinMaterial effect (simulated with 95% opacity white)
class ZiroSheetHeader extends StatelessWidget {
  final String title;
  final bool showDone;
  final VoidCallback? onDone;
  final bool showCancel;
  final VoidCallback? onCancel;
  final String? leadingText;
  final String? trailingText;
  final VoidCallback? onTrailingIconTap;

  const ZiroSheetHeader({
    super.key,
    required this.title,
    this.showDone = false,
    this.onDone,
    this.showCancel = false,
    this.onCancel,
    this.leadingText,
    this.trailingText,
    this.onTrailingIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background.withValues(alpha: 0.95),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          // Drag handle
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(2.5),
            ),
          ),
          const SizedBox(height: 8),
          // Header content — Row layout avoids Stack/Positioned.fill overflow trap
          SizedBox(
            height: 44,
            child: Row(
              children: [
                if (showCancel)
                  TextButton(
                    onPressed: onCancel,
                    child: Text(
                      leadingText ?? 'Cancel',
                      style: const TextStyle(
                        fontSize: 17,
                        color: AppColors.primary,
                      ),
                    ),
                  )
                else
                  const SizedBox(width: 64),
                Expanded(
                  child: Center(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: AppColors.foreground,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (onTrailingIconTap != null)
                      IconButton(
                        icon: const Icon(
                          Icons.add_circle_outline_rounded,
                          size: 24,
                          color: AppColors.primary,
                        ),
                        onPressed: onTrailingIconTap,
                      ),
                    if (showDone)
                      TextButton(
                        onPressed: onDone,
                        child: Text(
                          trailingText ?? 'Done',
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                      )
                    else
                      const SizedBox(width: 64),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
