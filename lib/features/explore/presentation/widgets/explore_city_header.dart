import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../cubit/explore_state.dart';
import '../../cubit/explore_cubit.dart';
import 'city_picker_sheet.dart';

/// Floating frosted-glass header showing current city with search & map buttons.
/// Matches iOS ExploreCityHeader — ExploreComponents.swift lines 52-141.
class ExploreCityHeader extends StatelessWidget {
  const ExploreCityHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreCubit, ExploreState>(
      builder: (context, state) {
        if (state is! ExploreStateLoaded) return const SizedBox.shrink();
        final loaded = state;
        return Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 8,
            left: 16,
            right: 16,
            bottom: 12,
          ),
          decoration: BoxDecoration(
            color: AppColors.background.withValues(alpha: 0.85),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
            border: Border(
              bottom: BorderSide(color: AppColors.borderMuted, width: 0.5),
            ),
          ),
          child: Row(
            children: [
              // City selector
              Expanded(
                child: GestureDetector(
                  onTap: () => _showCityPicker(context),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: loaded.selectedCity == null
                              ? AppColors.primary.withValues(alpha: 0.12)
                              : Colors.red.withValues(alpha: 0.12),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          loaded.selectedCity == null
                              ? Icons.my_location_rounded
                              : Icons.location_on_rounded,
                          size: 18,
                          color: loaded.selectedCity == null
                              ? AppColors.primary
                              : Colors.redAccent,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              loaded.selectedCity?.name ?? 'SF',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.4,
                                color: AppColors.foreground,
                              ),
                            ),
                            Text(
                              loaded.selectedCity != null
                                  ? 'Active Region'
                                  : 'Current Location',
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: AppColors.mutedText,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 18,
                        color: AppColors.mutedText,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              // Search button
              _HeaderButton(
                icon: Icons.search_rounded,
                onTap: () => context.push('/explore/discovery'),
              ),
              const SizedBox(width: 8),
              // Map button
              _HeaderButton(
                icon: Icons.map_outlined,
                onTap: () => context.push('/explore/map'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showCityPicker(BuildContext context) {
    final state = context.read<ExploreCubit>().state;
    if (state is! ExploreStateLoaded) return;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => CityPickerSheet(
        cities: state.content.cities,
        selectedCity: state.selectedCity,
        onSelected: (city) {
          context.read<ExploreCubit>().selectCity(city);
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

class _HeaderButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _HeaderButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: AppColors.mutedSurface,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 20, color: AppColors.foreground),
      ),
    );
  }
}
