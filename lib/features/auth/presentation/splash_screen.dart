import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';

/// Shown while auth state is being resolved on cold start.
///
/// Prevents the login screen from flashing before the router redirects
/// to the authenticated home (or login, if no session exists).
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
              image: AssetImage('assets/images/ziro_logo_light.png'),
              height: 48,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 32),
            SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
