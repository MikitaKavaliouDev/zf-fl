import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';

/// Green checkmark success view shown after a check-in is submitted.
///
/// Matches iOS CheckInSuccessView — CheckInWizardView.swift lines 512-549.
class CheckInSuccessWidget extends StatelessWidget {
  final VoidCallback onDone;

  const CheckInSuccessWidget({super.key, required this.onDone});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.check_circle_rounded,
              size: 80,
              color: Color(0xFF22C55E),
            ),
            const SizedBox(height: 24),
            const Text(
              'Check-in Submitted!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Your trainer has been notified.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onDone,
                child: const Text('Done'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
