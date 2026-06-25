import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

/// iOS-style recovery widget — heart icon + "under development" text.
///
/// Matches PersonalAnalyticsView recovery widget.
class RecoveryWidget extends StatelessWidget {
  const RecoveryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          Icon(
            Icons.favorite_border_rounded,
            size: 32,
            color: Colors.orange,
          ),
          SizedBox(height: 12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Recovery tracking and training load analysis is under development.',
              style: TextStyle(
                fontSize: 13,
                color: AppColors.mutedText,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
