import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/network/image_url_helper.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/models/trainer_list_item_dto.dart';

class TrainerCard extends StatelessWidget {
  final TrainerListItemDto trainer;

  const TrainerCard({super.key, required this.trainer});

  String get _name =>
      trainer.name ?? trainer.profile?.name ?? trainer.username ?? 'Trainer';

  String? get _photoPath => trainer.profile?.profilePhotoPath;

  String? get _specialty {
    final certs = trainer.profile?.certifications;
    if (certs != null && certs.isNotEmpty) return certs.first;
    return null;
  }

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

  double? get _rating => trainer.profile?.averageRating;

  int get _reviewCount => trainer.stats?.reviewCount ?? 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: trainer.username != null
            ? () => context.push('/trainer/${trainer.username}')
            : null,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.borderMuted, width: 0.5),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Left: Profile Image (80x80, radius 12) ---
              _ProfileImage(photoPath: _photoPath),

              const SizedBox(width: 16),

              // --- Right: Info Column ---
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name + Rating row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            _name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: AppColors.foreground,
                            ),
                          ),
                        ),
                        if (_rating != null) ...[
                          const SizedBox(width: 8),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                size: 16,
                                color: Colors.amber,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                _rating!.toStringAsFixed(1),
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.foreground,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),

                    // Specialty
                    Text(
                      _specialty ?? 'Fitness Professional',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.mutedText,
                      ),
                    ),
                    const SizedBox(height: 4),

                    // Location row
                    if (_location != null) ...[
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 14,
                            color: AppColors.mutedText,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              _location!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.mutedText,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                    ],

                    // Distance
                    if (trainer.distance != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          '${trainer.distance!.toStringAsFixed(1)} km away',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.mutedText,
                          ),
                        ),
                      ),

                    // Reviews + Link status row
                    Row(
                      children: [
                        if (_reviewCount > 0)
                          Text(
                            '$_reviewCount Reviews',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primary,
                            ),
                          ),
                        const Spacer(),
                        if (trainer.isLinked)
                          const Icon(
                            Icons.link_rounded,
                            size: 16,
                            color: AppColors.primary,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 80×80 rounded profile image with loading and error states.
class _ProfileImage extends StatelessWidget {
  final String? photoPath;

  const _ProfileImage({required this.photoPath});

  @override
  Widget build(BuildContext context) {
    final url = resolveImageUrl(photoPath);
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: 80,
        height: 80,
        child: url.isNotEmpty
            ? Image.network(
                url,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  final total = loadingProgress.expectedTotalBytes;
                  final progress = total != null
                      ? loadingProgress.cumulativeBytesLoaded / total
                      : null;
                  return _Placeholder(
                    child: Center(
                      child: CircularProgressIndicator(
                        value: progress,
                        strokeWidth: 2,
                        color: AppColors.primary,
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) =>
                    const _Placeholder(
                  child: Icon(Icons.person_rounded, size: 36),
                ),
              )
            : const _Placeholder(
                child: Icon(Icons.person_rounded, size: 36),
              ),
      ),
    );
  }
}

/// Gray placeholder used for image loading and error states.
class _Placeholder extends StatelessWidget {
  final Widget child;

  const _Placeholder({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}
      