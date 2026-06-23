import 'package:flutter/material.dart';
import 'package:ziro_fit/features/explore/cubit/explore_map_state.dart';

class MapFilterMenu extends StatelessWidget {
  final MapFilterMode selectedMode;
  final ValueChanged<MapFilterMode> onSelect;

  const MapFilterMenu({
    super.key,
    required this.selectedMode,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'Map Modes',
              style: TextStyle(fontSize: 12, color: Color(0xFF8E8E93)),
            ),
          ),
          ...MapFilterMode.values.map((mode) {
            final isSelected = mode == selectedMode;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () => onSelect(mode),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          _iconForMode(mode),
                          size: 20,
                          color:
                              isSelected ? Colors.black : const Color(0xFF8E8E93),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            _labelForMode(mode),
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight:
                                  isSelected ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        ),
                        if (isSelected)
                          const Icon(Icons.check, size: 16, color: Colors.black),
                      ],
                    ),
                  ),
                ),
                if (mode != MapFilterMode.values.last)
                  const Divider(indent: 52),
              ],
            );
          }),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  IconData _iconForMode(MapFilterMode mode) {
    switch (mode) {
      case MapFilterMode.all:
        return Icons.grid_view;
      case MapFilterMode.trainers:
        return Icons.group;
      case MapFilterMode.events:
        return Icons.calendar_month;
      case MapFilterMode.yoga:
        return Icons.self_improvement;
    }
  }

  String _labelForMode(MapFilterMode mode) {
    switch (mode) {
      case MapFilterMode.all:
        return 'All Categories';
      case MapFilterMode.trainers:
        return 'Trainers';
      case MapFilterMode.events:
        return 'Events';
      case MapFilterMode.yoga:
        return 'Yoga Coaches';
    }
  }
}

/// Filter trigger pill button (circular, ultraThinMaterial style).
class MapFilterPill extends StatelessWidget {
  final VoidCallback onTap;

  const MapFilterPill({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
color: Colors.white.withValues(alpha: 0.7),
             shape: BoxShape.circle,
             boxShadow: [
               BoxShadow(
                 color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: const Icon(
            Icons.tune,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
