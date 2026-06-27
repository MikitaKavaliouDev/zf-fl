import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

/// Displays trainer notes with optional YouTube thumbnail.
///
/// Designed for use inside a modal bottom sheet. Does not manage the sheet
/// lifecycle or handle video playback — delegates play to [onPlayVideo].
///
/// Usage:
/// ```dart
/// showModalBottomSheet(
///   context: context,
///   isScrollControlled: true,
///   backgroundColor: Colors.transparent,
///   builder: (_) => CoachNoteCard(
///     trainerName: 'Coach Sarah',
///     notes: 'Focus on tempo — 3-0-1 on the eccentric.',
///     videoUrl: 'https://youtube.com/watch?v=abc123',
///     onPlayVideo: () => launchUrl(Uri.parse(videoUrl)),
///   ),
/// );
/// ```
class CoachNoteCard extends StatelessWidget {
  /// Display name of the trainer who wrote the notes.
  final String trainerName;

  /// The note / instruction text body.
  final String notes;

  /// Optional YouTube video URL. When non-null a thumbnail placeholder is
  /// shown with a play button overlay.
  final String? videoUrl;

  /// Called when the user taps the play button on the thumbnail.
  final VoidCallback? onPlayVideo;

  const CoachNoteCard({
    super.key,
    required this.trainerName,
    required this.notes,
    this.videoUrl,
    this.onPlayVideo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // --- Trainer name ---
          Text(
            trainerName,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),

          const SizedBox(height: 12),

          // --- Notes body ---
          Text(
            notes,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.mutedText,
            ),
          ),

          // --- Optional video thumbnail ---
          if (videoUrl != null) ...[
            const SizedBox(height: 16),
            GestureDetector(
              onTap: onPlayVideo,
              child: Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF2C2C2E),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Icon(
                    Icons.play_circle_fill_rounded,
                    size: 48,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
