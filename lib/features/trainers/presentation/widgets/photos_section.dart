import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../data/models/trainer_transformation_photo_dto.dart';

/// Horizontal scroll of transformation photos.
/// Matches iOS photosSection (lines 671-703) — 200×260, 12pt radius, caption badge.
class PhotosSection extends StatelessWidget {
  final List<TrainerTransformationPhotoDto> photos;

  const PhotosSection({super.key, required this.photos});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader('Photos'),
        if (photos.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'No client photos yet',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
              ),
            ),
          )
        else
          SizedBox(
            height: 260,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: photos.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                final photo = photos[index];
                return _PhotoCard(photo: photo);
              },
            ),
          ),
      ],
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          const SizedBox(
            height: 1,
            width: 20,
            child: Divider(),
          ),
          const SizedBox(width: 0),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _PhotoCard extends StatelessWidget {
  final TrainerTransformationPhotoDto photo;

  const _PhotoCard({required this.photo});

  @override
  Widget build(BuildContext context) {
    final imageUrl = photo.publicUrl ?? photo.imagePath;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: 200,
        height: 260,
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (imageUrl.isNotEmpty)
              CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                errorWidget: (_, _, _) => _placeholder,
                progressIndicatorBuilder: (_, __, ___) => _placeholder,
              )
            else
              _placeholder,

            // Caption badge
            if (photo.caption != null)
              Positioned(
                top: 4,
                right: 4,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    photo.caption!,
                    style: const TextStyle(
                      fontSize: 7,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget get _placeholder => Container(
        color: AppColors.mutedSurface,
        child: const Icon(
          Icons.image_outlined,
          size: 48,
          color: AppColors.mutedText,
        ),
      );
}
