import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Blue-purple gradient banner encouraging the user to find a coach.
///
/// Matches iOS Need a Coach? banner — PersonalHomeView.swift lines 479-522.
class NeedCoachBanner extends StatelessWidget {
  const NeedCoachBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/explore/discovery'),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [Color(0xFF007AFF), Color(0xFF8B5CF6)],
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Need a Coach?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Browse pro trainers or try our AI.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            const Icon(
              Icons.arrow_circle_right_rounded,
              size: 32,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
