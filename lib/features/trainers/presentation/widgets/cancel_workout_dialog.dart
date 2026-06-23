import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

/// Confirmation dialog for canceling a workout session.
///
/// Usage:
/// ```dart
/// showDialog(
///   context: context,
///   builder: (_) => CancelWorkoutDialog(
///     onConfirm: () => cubit.cancel(),
///     onDismiss: () => Navigator.of(context).pop(),
///   ),
/// );
/// ```
class CancelWorkoutDialog extends StatelessWidget {
  /// Called when user taps "Cancel Workout" (destructive action).
  final VoidCallback onConfirm;

  /// Called when user taps "Keep Working" or taps the overlay.
  final VoidCallback onDismiss;

  const CancelWorkoutDialog({
    super.key,
    required this.onConfirm,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Semi-transparent overlay (tap to dismiss)
        GestureDetector(
          onTap: onDismiss,
          child: Container(color: Colors.black.withValues(alpha: 0.4)),
        ),

        // Centered card
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title
                  const Text(
                    'Cancel Workout?',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.foreground,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Message
                  const Text(
                    'Are you sure you want to cancel this session? All unsaved progress will be lost.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.mutedText,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Keep Working (outlined style)
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: onDismiss,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.primary,
                        side: BorderSide(color: AppColors.primary),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        textStyle: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      child: const Text('Keep Working'),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Cancel Workout (destructive / red)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: onConfirm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        textStyle: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      child: const Text('Cancel Workout'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
