import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../data/models/check_in_submission_dto.dart';

/// Step 2: Optional progress photos.
///
/// Matches iOS PhotosStep — CheckInWizardView.swift lines 441-511.
class PhotosStep extends StatelessWidget {
  final List<CheckInPhotoDto> photos;
  final ValueChanged<int> onRemovePhoto;
  final VoidCallback onAddPhoto;

  const PhotosStep({
    super.key,
    required this.photos,
    required this.onRemovePhoto,
    required this.onAddPhoto,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          const Text(
            'Progress Photos',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Optional — add photos to show your progress.',
            style: TextStyle(
              fontSize: 13,
              color: AppColors.mutedText,
            ),
          ),
          const SizedBox(height: 24),
          if (photos.isEmpty)
            _EmptyPhotoState(onAddPhoto: onAddPhoto),
          if (photos.isNotEmpty)
            _PhotoGrid(
              photos: photos,
              onRemovePhoto: onRemovePhoto,
              onAddPhoto: onAddPhoto,
            ),
        ],
      ),
    );
  }
}

class _EmptyPhotoState extends StatelessWidget {
  final VoidCallback onAddPhoto;

  const _EmptyPhotoState({required this.onAddPhoto});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onAddPhoto,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 48),
        decoration: BoxDecoration(
          color: AppColors.mutedSurface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.borderMuted,
          ),
        ),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.add_a_photo_rounded,
              size: 40,
              color: AppColors.mutedText,
            ),
            SizedBox(height: 12),
            Text(
              'Add Photos',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.foreground,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Show your progress visually',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.mutedText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PhotoGrid extends StatelessWidget {
  final List<CheckInPhotoDto> photos;
  final ValueChanged<int> onRemovePhoto;
  final VoidCallback onAddPhoto;

  const _PhotoGrid({
    required this.photos,
    required this.onRemovePhoto,
    required this.onAddPhoto,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        ...photos.asMap().entries.map(
              (entry) => _PhotoTile(
                photo: entry.value,
                onRemove: () => onRemovePhoto(entry.key),
              ),
            ),
        _AddPhotoButton(onTap: onAddPhoto),
      ],
    );
  }
}

class _PhotoTile extends StatelessWidget {
  final CheckInPhotoDto photo;
  final VoidCallback onRemove;

  const _PhotoTile({
    required this.photo,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          Image.file(
            File(photo.imagePath),
            width: 100,
            height: 100,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => Container(
              width: 100,
              height: 100,
              color: AppColors.mutedSurface,
              child: const Icon(
                Icons.broken_image_rounded,
                color: AppColors.mutedText,
              ),
            ),
          ),
          Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: onRemove,
              child: Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close_rounded,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AddPhotoButton extends StatelessWidget {
  final VoidCallback onTap;

  const _AddPhotoButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: AppColors.mutedSurface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.borderMuted,
          ),
        ),
        child: const Icon(
          Icons.add_rounded,
          size: 32,
          color: AppColors.mutedText,
        ),
      ),
    );
  }
}
