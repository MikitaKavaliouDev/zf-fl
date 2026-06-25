import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

/// Circular progress + linear bar showing workout consistency percentage.
class ConsistencyWidget extends StatelessWidget {
  final int consistency;

  const ConsistencyWidget({super.key, required this.consistency});

  @override
  Widget build(BuildContext context) {
    final percentage = consistency / 100.0;

    return Column(
      children: [
        SizedBox(
          height: 120,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  value: percentage,
                  strokeWidth: 8,
                  backgroundColor: AppColors.borderMuted,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.primary,
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$consistency%',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.foreground,
                    ),
                  ),
                  const Text(
                    'Consistency',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.mutedText,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: percentage,
            minHeight: 6,
            backgroundColor: AppColors.borderMuted,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
          ),
        ),
      ],
    );
  }
}
