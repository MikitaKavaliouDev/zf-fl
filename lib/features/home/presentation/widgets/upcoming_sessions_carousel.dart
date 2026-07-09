import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../home/data/models/client_dashboard_session.dart';

/// Horizontal carousel of upcoming workout sessions.
///
/// Displays a scrollable row of session cards with date badge,
/// session title, duration, and a coach-assigned indicator.
class UpcomingSessionsCarousel extends StatelessWidget {
  final List<ClientDashboardSession> sessions;
  final void Function(ClientDashboardSession) onSessionTap;

  const UpcomingSessionsCarousel({
    Key? key,
    required this.sessions,
    required this.onSessionTap,
  }) : super(key: key ?? const ValueKey('upcomingSessionsCarousel'));

  @override
  Widget build(BuildContext context) {
    if (sessions.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Upcoming',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 140,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: sessions.length,
            separatorBuilder: (_, _) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final session = sessions[index];
              return _SessionCard(
                session: session,
                onTap: () => onSessionTap(session),
              );
            },
          ),
        ),
      ],
    );
  }
}

/// A single session card in the carousel.
class _SessionCard extends StatelessWidget {
  final ClientDashboardSession session;
  final VoidCallback onTap;

  const _SessionCard({
    required this.session,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isAssigned = session.isTrainerAssigned ?? false;
    final dateFormat = DateFormat.MMMd();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        height: 140,
        decoration: BoxDecoration(
          color: isAssigned ? Colors.deepPurple : AppColors.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row: date badge + icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Date badge
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    dateFormat.format(session.date),
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                // Star or calendar icon
                Icon(
                  isAssigned
                      ? Icons.star_rounded
                      : Icons.calendar_today_rounded,
                  size: 18,
                  color: Colors.white.withValues(alpha: 0.9),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Coach Assigned label
            if (isAssigned)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.amber.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'Coach Assigned',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
              ),

            const Spacer(),

            // Session title
            Text(
              session.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),

            // Duration
            Text(
              '${session.duration} min',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white.withValues(alpha: 0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
