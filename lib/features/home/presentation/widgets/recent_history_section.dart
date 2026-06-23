import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_theme.dart';
import '../../data/models/client_recent_session.dart';

/// Section showing recent workout history.
///
/// Matches iOS Recent History — PersonalHomeView.swift lines 886-922.
class RecentHistorySection extends StatelessWidget {
  final List<ClientRecentSession> sessions;

  const RecentHistorySection({super.key, required this.sessions});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.zero,
          child: Text(
            'Recent History',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
        ),
        const SizedBox(height: 16),
        if (sessions.isEmpty)
          _buildEmptyState()
        else
          ...sessions.take(3).map(
                (session) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ClientHistoryRow(session: session),
                ),
              ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40),
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.fitness_center_rounded,
            size: 40,
            color: AppColors.mutedText.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 12),
          const Text(
            'No workouts logged yet.',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.mutedText,
            ),
          ),
        ],
      ),
    );
  }
}

/// A single history row showing date, session name, duration, and status.
///
/// Matches iOS ClientHistoryRow — PersonalHomeView.swift lines 925-973.
class ClientHistoryRow extends StatelessWidget {
  final ClientRecentSession session;

  const ClientHistoryRow({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    final month = DateFormat('MMM').format(session.startTime);
    final day = DateFormat('d').format(session.startTime);

    return GestureDetector(
      onTap: () => context.go('/workout/history/${session.id}'),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.mutedSurface,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            // Date column
            Container(
              width: 44,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    month,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                  Text(
                    day,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: AppColors.foreground,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            // Session info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    session.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.foreground,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${session.durationMinutes} min • ${_statusLabel()}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.mutedText,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.chevron_right_rounded,
              size: 18,
              color: AppColors.mutedText,
            ),
          ],
        ),
      ),
    );
  }

  String _statusLabel() {
    switch (session.status) {
      case 'completed':
        return 'Finished';
      case 'in_progress':
        return 'In Progress';
      default:
        return session.status;
    }
  }
}
