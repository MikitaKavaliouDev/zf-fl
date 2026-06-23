import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

/// Modal dialog for finishing a workout with options.
///
/// Matches iOS `FinishWorkoutAlert.swift` — shows three options:
/// - Complete Unfinished Sets (green)
/// - Discard Unfinished Sets (red)
/// - Cancel (gray)
///
/// Usage:
/// ```dart
/// showDialog(
///   context: context,
///   builder: (_) => FinishWorkoutDialog(
///     onCompleteUnfinished: () => cubit.finishWithOption(.completeUnfinished),
///     onDiscardUnfinished: () => cubit.finishWithOption(.discardUnfinished),
///     onCancel: () => Navigator.of(context).pop(),
///   ),
/// );
/// ```
class FinishWorkoutDialog extends StatelessWidget {
  /// Called when user taps "Complete Unfinished Sets".
  final VoidCallback onCompleteUnfinished;

  /// Called when user taps "Discard Unfinished Sets".
  final VoidCallback onDiscardUnfinished;

  /// Called when user taps "Cancel" or taps the overlay.
  final VoidCallback onCancel;

  const FinishWorkoutDialog({
    super.key,
    required this.onCompleteUnfinished,
    required this.onDiscardUnfinished,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Semi-transparent overlay (tap to dismiss)
        GestureDetector(
          onTap: onCancel,
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
                  // Emoji
                  const Text(
                    '🎉',
                    style: TextStyle(fontSize: 50),
                  ),

                  const SizedBox(height: 16),

                  // Title
                  const Text(
                    'Finish Workout?',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.foreground,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Subtitle
                  const Text(
                    'There are valid sets in this workout that have not been marked as complete.\nInvalid or empty sets will be removed.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.mutedText,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Complete Unfinished Sets (green)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: onCompleteUnfinished,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
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
                      child: const Text('Complete Unfinished Sets'),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Discard Unfinished Sets (red)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: onDiscardUnfinished,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.withValues(alpha: 0.1),
                        foregroundColor: Colors.red,
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
                      child: const Text('Discard Unfinished Sets'),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Cancel
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: onCancel,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE5E5EA), // systemGray5
                        foregroundColor: Colors.black,
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
                      child: const Text('Cancel'),
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
