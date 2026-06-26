import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/theme/app_theme.dart';

/// Parses a YouTube video ID from various URL formats.
///
/// Supports:
/// - `https://www.youtube.com/watch?v=VIDEO_ID`
/// - `https://youtu.be/VIDEO_ID`
/// - `https://www.youtube.com/embed/VIDEO_ID`
/// - Any other format returns `null`.
String? _parseYouTubeId(String url) {
  final uri = Uri.tryParse(url);
  if (uri == null) return null;

  if (uri.host.contains('youtube.com')) {
    if (uri.path.contains('/embed/')) {
      return uri.pathSegments.last;
    }
    if (uri.path == '/watch') {
      return uri.queryParameters['v'];
    }
  }

  if (uri.host == 'youtu.be') {
    return uri.pathSegments.first;
  }

  return null;
}

/// Shows a YouTube video in a modal bottom sheet.
///
/// Attempts to display the video inline using a placeholder UI. When the user
/// taps to play, the video opens in the device's default browser (or the
/// YouTube app if installed) via [url_launcher].
///
/// [videoUrl] accepts standard YouTube URL formats:
/// - `https://www.youtube.com/watch?v=VIDEO_ID`
/// - `https://youtu.be/VIDEO_ID`
/// - `https://www.youtube.com/embed/VIDEO_ID`
Future<void> showYouTubeVideo(BuildContext context, String videoUrl) async {
  final videoId = _parseYouTubeId(videoUrl);
  final embedUrl = videoId != null
      ? 'https://www.youtube.com/embed/$videoId'
      : videoUrl;

  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _YouTubePlayerSheet(
      embedUrl: embedUrl,
      videoId: videoId,
    ),
  );
}

class _YouTubePlayerSheet extends StatelessWidget {
  final String embedUrl;
  final String? videoId;

  const _YouTubePlayerSheet({
    required this.embedUrl,
    this.videoId,
  });

  Future<void> _launchVideo(BuildContext context) async {
    final uri = Uri.parse(embedUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.5 + bottomInset,
      decoration: const BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          // --- Drag handle + close button row ---
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 12,
              top: 12,
              bottom: 8,
            ),
            child: Row(
              children: [
                // Drag handle (visual only)
                Container(
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.borderActive,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close_rounded),
                  color: AppColors.foreground,
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),

          // --- Video player area ---
          Expanded(
            child: GestureDetector(
              onTap: () => _launchVideo(context),
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF18181B),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Play button
                    Icon(
                      Icons.play_circle_fill_rounded,
                      size: 64,
                      color: Colors.white.withValues(alpha: 0.9),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Tap to open in YouTube',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withValues(alpha: 0.7),
                      ),
                    ),
                    // Thumbnail hint via video ID
                    if (videoId != null) ...[
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: 'https://img.youtube.com/vi/$videoId/hqdefault.jpg',
                        height: 120,
                        width: 200,
                        fit: BoxFit.cover,
                        errorWidget: (_, _, _) => const SizedBox.shrink(),
                      ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
