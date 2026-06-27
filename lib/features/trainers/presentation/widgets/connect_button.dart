import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

/// Three-state connect button matching iOS design (lines 271-320):
/// - Not linked: blue capsule "Connect" with shadow
/// - Pending: gray capsule "Pending" (disabled)
/// - Linked: green capsule "Connected" with unlink confirmation
class ConnectButton extends StatelessWidget {
  final bool isLinked;
  final bool isPending;
  final bool isLoading;
  final VoidCallback? onConnect;
  final VoidCallback? onUnlink;

  const ConnectButton({
    super.key,
    required this.isLinked,
    this.isPending = false,
    this.isLoading = false,
    this.onConnect,
    this.onUnlink,
  });

  @override
  Widget build(BuildContext context) {
    if (isLinked) {
      return GestureDetector(
        onTap: () => _showUnlinkConfirmation(context),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF22C55E),
            borderRadius: BorderRadius.circular(99),
          ),
          child: const Text(
            'Connected',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    if (isPending) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.borderMuted,
          borderRadius: BorderRadius.circular(99),
        ),
        child: const Text(
          'Pending',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.mutedText,
          ),
        ),
      );
    }

    // Not linked
    return GestureDetector(
      onTap: isLoading ? null : onConnect,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(99),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withAlpha(50),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: isLoading
            ? const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : const Text(
                'Connect',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }

  void _showUnlinkConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text('Trainer Connection'),
        content: const Text(
          'Are you sure you want to disconnect from this trainer?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              onUnlink?.call();
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Unlink from Trainer'),
          ),
        ],
      ),
    );
  }
}
