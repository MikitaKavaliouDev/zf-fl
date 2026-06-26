import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../trainers/data/models/trainer_preview_media_dto.dart';

/// Preview carousel for trainer profile media (images + videos).
/// Mirrors iOS PreviewCarousel — 240×340 cards, horizontal scroll, page dots.
/// Video items show a thumbnail with a play button overlay.
class PreviewCarousel extends StatefulWidget {
  final List<TrainerPreviewMediaDto> media;

  const PreviewCarousel({super.key, required this.media});

  @override
  State<PreviewCarousel> createState() => _PreviewCarouselState();
}

class _PreviewCarouselState extends State<PreviewCarousel> {
  final _pageController = PageController();
  int _selectedIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = widget.media;
    if (items.isEmpty) return const SizedBox.shrink();

    // Sort: videos first, then images, then by order
    final sorted = List<TrainerPreviewMediaDto>.from(items)
      ..sort((a, b) {
        if (a.type == 'video' && b.type != 'video') return -1;
        if (a.type != 'video' && b.type == 'video') return 1;
        return a.order.compareTo(b.order);
      });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 340,
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollUpdateNotification) {
                final metrics = notification.metrics;
                if (metrics is PageMetrics) {
                  final page = metrics.page;
                  if (page != null) {
                    setState(() {
                      _selectedIndex = page.round();
                    });
                  }
                }
              }
              return false;
            },
            child: PageView.builder(
              controller: _pageController,
              itemCount: sorted.length,
              itemBuilder: (context, index) {
                return _MediaCard(media: sorted[index]);
              },
            ),
          ),
        ),
        // Page dots
        if (sorted.length > 1)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(sorted.length, (index) {
                final isSelected = index == _selectedIndex;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: isSelected ? 16 : 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.foreground
                        : AppColors.borderMuted,
                    borderRadius: BorderRadius.circular(3),
                  ),
                );
              }),
            ),
          ),
      ],
    );
  }
}

/// A single media card (240×340) showing an image or video thumbnail.
class _MediaCard extends StatelessWidget {
  final TrainerPreviewMediaDto media;

  const _MediaCard({required this.media});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: 240,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Image / thumbnail
              if (media.url.isNotEmpty)
                CachedNetworkImage(
                  imageUrl: media.url,
                  fit: BoxFit.cover,
                  errorWidget: (_, _, _) => _placeholder(),
                  progressIndicatorBuilder: (_, __, ___) => _placeholder(
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                )
              else
                _placeholder(),

              // Video badge
              if (media.type == 'video')
                Center(
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),

              // Caption overlay at bottom
              if (media.caption != null && media.caption!.isNotEmpty)
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black54],
                      ),
                    ),
                    child: Text(
                      media.caption!,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _placeholder({Widget? child}) {
    return Container(
      color: AppColors.mutedSurface,
      child: child ??
          const Center(
            child: Icon(Icons.photo_outlined, color: AppColors.mutedText),
          ),
    );
  }
}