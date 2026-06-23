import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../data/models/explore_city.dart';

/// City picker bottom sheet — list of available cities + current location.
/// Matches iOS CityPickerSheet — ExploreComponents.swift lines 936-1002.
class CityPickerSheet extends StatelessWidget {
  final List<ExploreCity> cities;
  final ExploreCity? selectedCity;
  final ValueChanged<ExploreCity?> onSelected;

  const CityPickerSheet({
    super.key,
    required this.cities,
    required this.selectedCity,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 4),
            child: Container(
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: AppColors.borderActive,
                borderRadius: BorderRadius.circular(99),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(24, 16, 24, 8),
            child: Text(
              'Select City',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.foreground,
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Current location
          Material(
            type: MaterialType.transparency,
            child: ListTile(
              leading: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.my_location_rounded,
                  size: 18,
                  color: AppColors.primary,
                ),
              ),
              title: const Text(
                'Current Location',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.foreground,
                ),
              ),
              trailing: selectedCity == null
                  ? const Icon(Icons.check_rounded, color: AppColors.primary)
                  : null,
              onTap: () => onSelected(null),
            ),
          ),
          const Divider(indent: 24, endIndent: 24),
          // City list
          ...cities.map(
            (city) => Material(
              type: MaterialType.transparency,
              child: ListTile(
                leading: city.imageUrl != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          city.imageUrl!,
                          width: 38,
                          height: 38,
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) => _CityIcon(city: city),
                        ),
                      )
                    : _CityIcon(city: city),
                title: Text(
                  city.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.foreground,
                  ),
                ),
                trailing: selectedCity?.id == city.id
                    ? const Icon(Icons.check_rounded, color: AppColors.primary)
                    : null,
                onTap: () => onSelected(city),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 16),
        ],
      ),
    );
  }
}

class _CityIcon extends StatelessWidget {
  final ExploreCity city;
  const _CityIcon({required this.city});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(
        Icons.location_city_rounded,
        size: 18,
        color: AppColors.mutedText,
      ),
    );
  }
}
