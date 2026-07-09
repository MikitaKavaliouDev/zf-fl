import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_theme.dart';
import '../../cubit/notifications_cubit.dart';
import '../../data/models/notification_dto.dart';

/// A single notification row — replicates iOS NotificationRow exactly.
///
/// Layout:
/// - Icon circle (40×40) with type-dependent icon/color at 10% opacity
/// - Message text (15pt, max 3 lines)
/// - Formatted date (11pt gray)
/// - Cross-mode badge (Professional / Personal)
/// - Unread dot (8×8 blue circle)
/// - Accept/Decline buttons for link request notifications (unread only)
class NotificationRow extends StatelessWidget {
  final NotificationDto notification;
  final NotificationsCubit cubit;
  final String? currentMode; // 'client' or 'trainer'
  final VoidCallback? onTap;

  const NotificationRow({
    super.key,
    required this.notification,
    required this.cubit,
    this.currentMode,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final read = notification.readStatus;
    final icon = _iconData(notification);
    final color = _iconColor(notification);

    return GestureDetector(
      key: const ValueKey('notificationRow'),
      onTap: () {
        if (!read) cubit.markAsRead(notification.id);
        onTap?.call();
      },
      child: Container(
        color: read ? Colors.transparent : const Color(0xFF007AFF).withValues(alpha: 0.05),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Main row: icon, message + date, unread dot
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon circle
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color.withValues(alpha: 0.1),
                    ),
                    child: Icon(icon, color: color, size: 20),
                  ),
                  const SizedBox(width: 16),
                  // Message + date column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notification.message,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: AppColors.foreground,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              _formatDate(notification.createdAt),
                              style: const TextStyle(
                                fontSize: 11,
                                color: AppColors.mutedText,
                              ),
                            ),
                            if (_showCrossModeBadge) ...[
                              const SizedBox(width: 8),
                              _CrossModeBadge(
                                isProfessional: currentMode == 'client' &&
                                    notification.targetRole == 'trainer',
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Unread dot
                  if (!read)
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF007AFF),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            // Link request action buttons (unread only)
            if (_isLinkRequest && !read)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        key: const ValueKey('acceptButton'),
                        onPressed: () => cubit.acceptRequest(notification.id),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text(
                          'Accept',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextButton(
                        key: const ValueKey('declineButton'),
                        onPressed: () => cubit.declineRequest(notification.id),
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFFEF4444),
                          backgroundColor: const Color(0xFFEF4444).withValues(alpha: 0.1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text(
                          'Decline',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  // ─── Helpers ──────────────────────────────────────────────────────

  bool get _isLinkRequest =>
      notification.type == 'client_link_request' ||
      notification.type == 'link_request' ||
      notification.message.contains('requests to connect') ||
      notification.message.contains('wants to connect');

  bool get _showCrossModeBadge =>
      currentMode != null &&
      notification.targetRole != null &&
      ((currentMode == 'client' && notification.targetRole == 'trainer') ||
          (currentMode == 'trainer' && notification.targetRole == 'client'));

  /// Map notification type to icon data.
  IconData _iconData(NotificationDto n) {
    if (_isLinkRequest) return Icons.person_add_alt_1;
    switch (n.type) {
      case 'workout_completed':
        return Icons.fitness_center;
      case 'check_in':
        return Icons.check_circle;
      case 'booking':
        return Icons.calendar_month;
      default:
        return Icons.notifications;
    }
  }

  /// Map notification type to icon color.
  Color _iconColor(NotificationDto n) {
    if (_isLinkRequest) return AppColors.primary;
    switch (n.type) {
      case 'workout_completed':
        return const Color(0xFF7C3AED);
      case 'check_in':
        return const Color(0xFF22C55E);
      case 'booking':
        return const Color(0xFFF97316);
      default:
        return AppColors.primary;
    }
  }

  /// Format createdAt (Unix ms) to localized date + time.
  String _formatDate(int createdAt) {
    final date = DateTime.fromMillisecondsSinceEpoch(createdAt);
    return DateFormat.yMd().add_jm().format(date);
  }
}

/// Small pill badge indicating cross-mode notification context.
///
/// - "Professional" (orange) when a client gets trainer-targeted notification.
/// - "Personal" (blue) when a trainer gets client-targeted notification.
class _CrossModeBadge extends StatelessWidget {
  final bool isProfessional;

  const _CrossModeBadge({required this.isProfessional});

  @override
  Widget build(BuildContext context) {
    final label = isProfessional ? 'Professional' : 'Personal';
    final textColor = isProfessional
        ? const Color(0xFFF97316)
        : AppColors.primary;
    final bgColor = isProfessional
        ? const Color(0xFFF97316).withValues(alpha: 0.2)
        : AppColors.primary.withValues(alpha: 0.2);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }
}
