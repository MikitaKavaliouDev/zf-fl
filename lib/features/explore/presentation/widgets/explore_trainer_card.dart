import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../trainers/data/models/trainer_list_item_dto.dart';

/// Horizontal scroll trainer card used in "Near You", "Featured", "Recommends" sections.
/// Matches iOS ExploreTrainerCard — ExploreComponents.swift lines 541-652.
class ExploreTrainerCard extends StatelessWidget {
  final TrainerListItemDto trainer;
  final String? promotionLabel;

  const ExploreTrainerCard({
    super.key,
    required this.trainer,
    this.promotionLabel,
  });

  String get _name =>
      trainer.name ?? trainer.profile?.name ?? trainer.username ?? 'Trainer';

  String? get _specialty {
    final certs = trainer.profile?.certifications;
    if (certs != null && certs.isNotEmpty) return certs.first;
    return null;
  }

  double? get _rating => trainer.profile?.averageRating;

  String? get _photoPath => trainer.profile?.profilePhotoPath;

  String? get _location {
    final locations = trainer.profile?.locations;
    if (locations != null && locations.isNotEmpty) {
      final loc = locations.first;
      final address = loc.address;
      if (address != null && address.isNotEmpty) return address;
      return loc.toString();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/trainer/${trainer.username ?? ''}'),
      child: Container(
        width: 144,
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image area (144x144)
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Container(
                    width: 144,
                    height: 144,
                    color: AppColors.mutedSurface,
                    child: _photoPath != null
                        ? Image.network(
                            _photoPath!,
                            fit: BoxFit.cover,
                            errorBuilder: (_, _, _) => const Icon(
                              Icons.person_rounded,
                              size: 48,
                              color: AppColors.mutedText,
                            ),
                          )
                        : const Icon(
                            Icons.person_rounded,
                            size: 48,
                            color: AppColors.mutedText,
                          ),
                  ),
                ),
                // Rating overlay top-right
                if (_rating != null)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star_rounded, size: 10, color: Colors.amber),
                          const SizedBox(width: 2),
                          Text(
                            _rating!.toStringAsFixed(1),
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                // Promotion badge top-left
                if (promotionLabel != null)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: promotionLabel == 'Featured'
                            ? Colors.amber.withValues(alpha: 0.9)
                            : const Color(0xFF4F46E5).withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            promotionLabel == 'Featured'
                                ? Icons.star_rounded
                                : Icons.auto_awesome_rounded,
                            size: 10,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            promotionLabel!,
                            style: const TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            // Info section
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.foreground,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _specialty ?? 'Fitness Professional',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mutedText,
                    ),
                  ),
                  if (_location != null) ...[
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined, size: 10, color: AppColors.mutedText),
                        const SizedBox(width: 2),
                        Expanded(
                          child: Text(
                            _location!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 10,
                              color: AppColors.mutedText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
