import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class CustomExercisesScreen extends StatelessWidget {
  const CustomExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Exercises'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_rounded),
            onPressed: () {
              // In production: open exercise creation form/sheet
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.fitness_center_rounded,
                  size: 36,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Custom Exercises',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Create and manage your own exercises.\nTap + to add a new custom exercise.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.mutedText,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 32),
              // Example: empty exercise list — in production this loads
              // from GET /api/exercises/sync or a custom exercises endpoint
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.mutedSurface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.borderMuted),
                ),
                child: const Column(
                  children: [
                    Icon(
                      Icons.info_outline_rounded,
                      size: 20,
                      color: AppColors.mutedText,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Custom exercises sync across your devices.\nAdd exercises like "Turkish Get-Up" or\n"Pallof Press" that aren\'t in the library.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.mutedText,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
