import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person_rounded, size: 64, color: AppColors.mutedText),
            SizedBox(height: 16),
            Text(
              'Profile',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Coming soon',
              style: TextStyle(fontSize: 14, color: AppColors.mutedText),
            ),
          ],
        ),
      ),
    );
  }
}
