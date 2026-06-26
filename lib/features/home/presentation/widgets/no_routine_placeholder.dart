import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../trainers/cubit/workout_session_cubit.dart';

/// Placeholder shown when a client has a trainer but no active routine.
///
/// Matches iOS No Routine Assigned — PersonalHomeView.swift lines 561-615.
class NoRoutinePlaceholder extends StatelessWidget {
  const NoRoutinePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon + text
          const Row(
            children: [
              Icon(
                Icons.assignment_rounded,
                size: 28,
                color: Color(0xFFF97316),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'No Routine Assigned',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.foreground,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Awaiting your coach...',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.mutedText,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Action buttons
          Row(
            children: [
              Expanded(
                child: _ActionButton(
                  onTap: () {
                    context.read<WorkoutSessionCubit>().start();
                    context.push('/workout/session');
                  },
                  label: 'Quick Start',
                  icon: Icons.bolt_rounded,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _ActionButton(
                  onTap: () => context.push('/home/templates-library'),
                  label: 'Templates',
                  icon: Icons.grid_view_rounded,
                  color: const Color(0xFF8B5CF6),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Small rounded button used inside [NoRoutinePlaceholder].
class _ActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final IconData icon;
  final Color color;

  const _ActionButton({
    required this.onTap,
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 14, color: color),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
      