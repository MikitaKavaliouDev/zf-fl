import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

/// Which section of the explore tab is visible.
enum ExploreSection { trainers, events }

/// Telegram-style capsule segmented tab: Trainers | Events.
/// Matches iOS ExploreSlidingSegment — ExploreComponents.swift lines 1062-1103.
class ExploreSlidingSegment extends StatelessWidget {
  final ExploreSection selectedSection;
  final ValueChanged<ExploreSection> onChanged;

  const ExploreSlidingSegment({
    super.key,
    required this.selectedSection,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const segments = [ExploreSection.trainers, ExploreSection.events];
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.borderMuted, width: 0.5),
      ),
      child: Row(
        children: segments.map((section) {
          final isSelected = section == selectedSection;
          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged(section),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.card : Colors.transparent,
                  borderRadius: BorderRadius.circular(21),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 1),
                          ),
                        ]
                      : null,
                ),
                child: Text(
                  section == ExploreSection.trainers ? 'Trainers' : 'Events',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: isSelected
                        ? AppColors.primary
                        : AppColors.mutedText,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
