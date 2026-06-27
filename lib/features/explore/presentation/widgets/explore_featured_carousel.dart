import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../data/models/explore_event_dto.dart';
import 'explore_event_card.dart';

/// Featured Events horizontal carousel.
/// Matches iOS ExploreFeaturedCarousel — ExploreComponents.swift lines 144-338.
class ExploreFeaturedCarousel extends StatelessWidget {
  final List<ExploreEventDto> events;
  final void Function(ExploreEventDto event)? onEventTap;

  const ExploreFeaturedCarousel({
    super.key,
    required this.events,
    this.onEventTap,
  });

  @override
  Widget build(BuildContext context) {
    if (events.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16, bottom: 12),
          child: Text(
            'Featured Events',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
        ),
        SizedBox(
          height: 290,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: events.length,
            separatorBuilder: (_, _) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              return FeaturedEventCard(
                event: events[index],
                onTap: () => onEventTap?.call(events[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
