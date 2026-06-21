import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../data/models/trainer_list_item_dto.dart';

class TrainerCard extends StatelessWidget {
  final TrainerListItemDto trainer;

  const TrainerCard({super.key, required this.trainer});

  @override
  Widget build(BuildContext context) {
    final name = trainer.profile?.name ?? trainer.username;
    final photoPath = trainer.profile?.profilePhotoPath;
    final distance = trainer.distance;
    final rating = trainer.profile?.averageRating;
    final isLinked = trainer.isLinked;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          radius: 24,
          backgroundImage:
              photoPath != null ? NetworkImage(photoPath) : null,
          child: photoPath == null ? const Icon(Icons.person) : null,
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (distance != null)
              Text(
                '${distance.toStringAsFixed(1)} km away',
                style: const TextStyle(fontSize: 12),
              ),
            if (rating != null)
              Row(
                children: [
                  const Icon(Icons.star_rounded,
                      size: 16, color: Colors.amber),
                  const SizedBox(width: 4),
                  Text(
                    rating.toStringAsFixed(1),
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
          ],
        ),
        trailing: isLinked
            ? const Icon(Icons.link_rounded, color: AppColors.primary)
            : null,
        onTap: () => context.go('/trainer/${trainer.username}'),
      ),
    );
  }
}
