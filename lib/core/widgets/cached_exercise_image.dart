import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Reusable widget for displaying exercise media (GIFs, images, YouTube thumbnails).
///
/// Behavior (matching iOS WorkoutExerciseCard.AboutView):
/// - `.gif` URLs → animated GIF via [CachedNetworkImage]
/// - YouTube URLs → thumbnail with play button overlay
/// - Regular image URLs → cached image
/// - Null/empty → fallback dumbbell icon
///
/// Uses [CachedNetworkImage] for all image/GIF loading, which handles
/// disk caching and animated GIF playback natively.
class CachedExerciseImage extends StatelessWidget {
  /// The exercise image URL (highest priority).
  final String? imageUrl;

  /// The exercise video/GIF URL (fallback if [imageUrl] is null).
  final String? videoUrl;

  /// Width of the widget. If null, fills available width.
  final double? width;

  /// Height of the widget.
  final double height;

  /// Border radius for the image container.
  final double borderRadius;

  /// How to inscribe the image into the space.
  final BoxFit fit;

  /// Whether to show a YouTube play overlay when a YouTube URL is detected.
  final bool showYouTubeOverlay;

  /// Whether to show a full-sized section (for detail view) vs a compact one.
  final bool compact;

  /// Callback when the image/GIF is tapped (e.g., to open YouTube).
  final VoidCallback? onTap;

  const CachedExerciseImage({
    super.key,
    this.imageUrl,
    this.videoUrl,
    this.width,
    this.height = 44,
    this.borderRadius = 8,
    this.fit = BoxFit.cover,
    this.showYouTubeOverlay = true,
    this.compact = true,
    this.onTap,
  });

  /// Resolve the best available URL — imageUrl takes priority.
  String? get _effectiveUrl => imageUrl ?? videoUrl;

  /// Detect YouTube URLs (matching iOS pattern).
  static bool isYouTubeUrl(String url) {
    final lower = url.toLowerCase();
    return lower.contains('youtube.com') || lower.contains('youtu.be');
  }

  @override
  Widget build(BuildContext context) {
    final url = _effectiveUrl;

    if (url == null || url.isEmpty) {
      return _buildFallback();
    }

    if (isYouTubeUrl(url)) {
      return _buildYouTubeContent(url);
    }

    return _buildNetworkContent(url);
  }

  Widget _buildFallback() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Icon(
        Icons.fitness_center_rounded,
        size: height * 0.45,
        color: AppColors.mutedText.withValues(alpha: 0.3),
      ),
    );
  }

  Widget _buildYouTubeContent(String url) {
    // Extract YouTube video ID for thumbnail
    final videoId = _extractYouTubeId(url);
    final thumbnailUrl = videoId != null
        ? 'https://img.youtube.com/vi/$videoId/mqdefault.jpg'
        : null;

    final content = Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Thumbnail image
          if (thumbnailUrl != null)
            CachedNetworkImage(
              imageUrl: thumbnailUrl,
              fit: BoxFit.cover,
              placeholder: (_, _) => Container(
                color: AppColors.mutedSurface,
                child: const Center(
                  child: SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
              ),
              errorWidget: (_, _, _) => _buildFallback(),
            )
          else
            _buildFallback(),

          // Play button overlay
          if (showYouTubeOverlay)
            Positioned.fill(
              child: Center(
                child: Container(
                  width: compact ? 24 : 48,
                  height: compact ? 24 : 48,
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.5),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.play_arrow_rounded,
                    size: compact ? 14 : 28,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );

    if (onTap != null) {
      return GestureDetector(onTap: onTap, child: content);
    }
    return content;
  }

  Widget _buildNetworkContent(String url) {
    final content = Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      clipBehavior: Clip.antiAlias,
      child: CachedNetworkImage(
        imageUrl: url,
        fit: fit,
        placeholder: (_, __) => const Center(
          child: SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
        errorWidget: (_, __, ___) => _buildFallback(),
      ),
    );

    if (onTap != null) {
      return GestureDetector(onTap: onTap, child: content);
    }
    return content;
  }

  /// Extract YouTube video ID from various URL formats.
  String? _extractYouTubeId(String url) {
    final lower = url.toLowerCase();
    // youtu.be/VIDEO_ID
    if (lower.contains('youtu.be/')) {
      final parts = url.split('youtu.be/');
      if (parts.length > 1) {
        return parts[1].split('?').first.split('&').first;
      }
    }
    // youtube.com/watch?v=VIDEO_ID
    if (lower.contains('v=')) {
      final parts = url.split('v=');
      if (parts.length > 1) {
        return parts[1].split('&').first;
      }
    }
    // youtube.com/embed/VIDEO_ID
    if (lower.contains('embed/')) {
      final parts = url.split('embed/');
      if (parts.length > 1) {
        return parts[1].split('?').first.split('&').first;
      }
    }
    return null;
  }
}
