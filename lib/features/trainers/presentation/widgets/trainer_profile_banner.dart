import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

/// 200pt hero banner with gradient fallback + avatar overlay.
/// Matches iOS PublicTrainerProfileView banner (lines 41-73).
class TrainerProfileBanner extends StatelessWidget {
  final String? bannerImageUrl;
  final String? avatarUrl;
  final double avatarSize;

  const TrainerProfileBanner({
    super.key,
    this.bannerImageUrl,
    this.avatarUrl,
    this.avatarSize = 72,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Banner (200pt)
        SizedBox(
          height: 200,
          width: double.infinity,
          child: bannerImageUrl != null
              ? Image.network(
                  bannerImageUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => _gradientBanner,
                  loadingBuilder: (_, child, progress) {
                    if (progress == null) return child;
                    return _gradientBanner;
                  },
                )
              : _gradientBanner,
        ),
        // Avatar positioned at bottom-left, offset from edge
        Positioned(
          left: 20,
          bottom: -30,
          child: Container(
            width: avatarSize,
            height: avatarSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.mutedSurface,
              border: Border.all(
                color: AppColors.background,
                width: 3,
              ),
            ),
            child: ClipOval(
              child: avatarUrl != null
                  ? Image.network(
                      avatarUrl!,
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => const Icon(
                        Icons.person_rounded,
                        size: 32,
                        color: AppColors.mutedText,
                      ),
                      loadingBuilder: (_, child, progress) {
                        if (progress == null) return child;
                        return const Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        );
                      },
                    )
                  : const Icon(
                      Icons.person_rounded,
                      size: 32,
                      color: AppColors.mutedText,
                    ),
            ),
          ),
        ),
      ],
    );
  }

  Widget get _gradientBanner => Container(
        height: 200,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF007AFF), Color(0xFF7C3AED)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      );
}
