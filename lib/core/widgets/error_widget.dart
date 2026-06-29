import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Shared error state widget for use across all feature screens.
///
/// Displays a centered icon, error message, and optional retry button.
/// All visual values use design tokens — never hardcoded.
class ZiroErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  final IconData icon;
  final double iconSize;
  final EdgeInsetsGeometry padding;
  final double messageFontSize;

  const ZiroErrorWidget({
    super.key,
    required this.message,
    this.onRetry,
    this.icon = Icons.error_outline_rounded,
    this.iconSize = 48,
    this.padding = const EdgeInsets.all(24),
    this.messageFontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: iconSize, color: AppColors.mutedText),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: messageFontSize,
                color: AppColors.mutedText,
              ),
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: onRetry,
                child: const Text('Retry'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Shared loading indicator widget.
///
/// Displays a centered circular progress indicator using the primary color.
class ZiroLoadingWidget extends StatelessWidget {
  final double size;
  final double strokeWidth;

  const ZiroLoadingWidget({
    super.key,
    this.size = 24,
    this.strokeWidth = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
