import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Envelope icon
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withAlpha(25),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Icon(
                    Icons.email_outlined,
                    size: 48,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 32),

                const Text(
                  'Check your email',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.foreground,
                  ),
                ),
                const SizedBox(height: 12),

                const Text(
                  "We've sent a confirmation link to your email address. "
                  'Please verify your email before signing in.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.mutedText,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 40),

                ElevatedButton(
                  onPressed: () => context.go('/login'),
                  child: const Text('Back to Sign In'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
