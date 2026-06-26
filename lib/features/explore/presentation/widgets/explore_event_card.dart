import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../data/models/explore_event_dto.dart';

/// Featured event card for the carousel.
/// Matches iOS FeaturedEventCard — ExploreComponents.swift lines 144-338.
class FeaturedEventCard extends StatelessWidget {
  final ExploreEventDto event;
  final VoidCallback? onTap;

  const FeaturedEventCard({
    super.key,
    required this.event,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 290,
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Background image
              if (event.imageUrl != null && event.imageUrl!.isNotEmpty)
                CachedNetworkImage(
                  imageUrl: event.imageUrl!,
                  fit: BoxFit.cover,
                  errorWidget: (_, _, _) => _PlaceholderContent(event: event),
                  progressIndicatorBuilder: (_, __, ___) => _PlaceholderContent(event: event),
                )
              else
                _PlaceholderContent(event: event),
              // Gradient overlay
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black87,
                        Colors.black38,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              // Bottom info panel
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.28),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Title
                      Text(
                        event.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 6),
                      // Time + Location row
                      Row(
                        children: [
                          const Icon(Icons.access_time_rounded, size: 12, color: Colors.white70),
                          const SizedBox(width: 4),
                          Text(
                            _formatTime(event.startTime),
                            style: const TextStyle(fontSize: 11, color: Colors.white, height: 1.2),
                          ),
                          const SizedBox(width: 12),
                          const Icon(Icons.location_on_outlined, size: 12, color: Colors.white70),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              event.locationName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 11, color: Colors.white, height: 1.2),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Capacity bar
                      if (event.capacity > 0) ...[
                        Row(
                          children: [
                            Text(
                              '${event.spotsLeft} spots left',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: event.isNearCapacity ? Colors.orange : Colors.white70,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '${event.enrolledCount}/${event.capacity}',
                              style: const TextStyle(fontSize: 10, color: Colors.white54),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: LinearProgressIndicator(
                            value: event.capacity > 0
                                ? event.enrolledCount / event.capacity
                                : 0,
                            backgroundColor: Colors.white24,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              event.isNearCapacity ? Colors.orange : AppColors.primary,
                            ),
                            minHeight: 3,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              // Top badges
              Positioned(
                top: 12,
                left: 12,
                child: _HostBadge(event: event),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: _StatusBadge(event: event),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatTime(DateTime dt) {
    final hour = dt.hour > 12 ? dt.hour - 12 : (dt.hour == 0 ? 12 : dt.hour);
    final amPm = dt.hour >= 12 ? 'PM' : 'AM';
    final min = dt.minute.toString().padLeft(2, '0');
    return '$hour:$min $amPm';
  }
}

class _PlaceholderContent extends StatelessWidget {
  final ExploreEventDto event;
  const _PlaceholderContent({required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade800,
      child: const Center(
        child: Icon(Icons.auto_awesome_rounded, size: 48, color: Colors.white24),
      ),
    );
  }
}

class _HostBadge extends StatelessWidget {
  final ExploreEventDto event;
  const _HostBadge({required this.event});

  IconData _hostIcon() {
    switch (event.organizerType) {
      case 'corporate':
        return Icons.business_rounded;
      case 'gym':
        return Icons.fitness_center_rounded;
      case 'trainer':
        return Icons.person_rounded;
      default:
        return Icons.bolt_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(_hostIcon(), size: 10, color: Colors.white70),
          const SizedBox(width: 4),
          Text(
            (event.hostName ?? 'Host').toUpperCase(),
            style: const TextStyle(fontSize: 8, fontWeight: FontWeight.w900, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final ExploreEventDto event;
  const _StatusBadge({required this.event});

  @override
  Widget build(BuildContext context) {
    String label;
    Color bgColor;
    if (event.isFree) {
      label = 'FREE';
      bgColor = Colors.green;
    } else if (event.isNearCapacity) {
      label = '🔥 SELLING FAST';
      bgColor = Colors.orange;
    } else {
      label = event.categoryId ?? 'Event';
      bgColor = Colors.black87;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 8, fontWeight: FontWeight.w900, color: Colors.white),
      ),
    );
  }
}
