import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../data/models/explore_category.dart';

/// Browse by Category — horizontal scroll of pill-shaped category tiles.
/// Matches iOS ExploreCategoryFilter — ExploreComponents.swift lines 342-400.
class ExploreCategoryFilter extends StatelessWidget {
  final List<ExploreCategory> categories;
  final ExploreCategory? selectedCategory;
  final ValueChanged<ExploreCategory?> onSelected;

  const ExploreCategoryFilter({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16, bottom: 12),
          child: Text(
            'Browse by Category',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
        ),
        SizedBox(
          height: 44,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: categories.length + 1, // +1 for "All"
            separatorBuilder: (_, _) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              if (index == 0) {
                return _CategoryPill(
                  name: 'All',
                  icon: Icons.auto_awesome_rounded,
                  color: 0xFF8B5CF6,
                  isSelected: selectedCategory == null,
                  onTap: () => onSelected(null),
                );
              }
              final cat = categories[index - 1];
              final isSelected = selectedCategory?.id == cat.id;
              return _CategoryPill(
                name: cat.name,
                icon: Icons.fitness_center_rounded,
                color: CategoryVisuals.colorFor(cat.name),
                isSelected: isSelected,
                onTap: () => onSelected(cat),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _CategoryPill extends StatelessWidget {
  final String name;
  final IconData icon;
  final int color;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryPill({
    required this.name,
    required this.icon,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final c = Color(color);
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: isSelected
              ? c.withValues(alpha: 0.15)
              : AppColors.mutedSurface,
          borderRadius: BorderRadius.circular(99),
          border: Border.all(
            color: isSelected ? c.withValues(alpha: 0.5) : AppColors.borderMuted,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: isSelected ? c : AppColors.mutedText,
            ),
            const SizedBox(width: 6),
            Text(
              name,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: isSelected ? c : AppColors.foreground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
