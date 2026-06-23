import 'package:flutter/material.dart';
import 'package:ziro_fit/features/explore/cubit/explore_map_state.dart';

class ClusterAnnotation extends StatelessWidget {
  final MapCluster cluster;
  final bool isSelected;
  final VoidCallback? onTap;

  const ClusterAnnotation({
    super.key,
    required this.cluster,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = isSelected ? 60.0 : 50.0;
    final items = cluster.items;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size + 10,
        height: size + 10,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Bottom card (3rd item)
            if (items.length > 2)
              Positioned(
                right: 0,
                bottom: 0,
                child: Transform.rotate(
                  angle: isSelected ? 0.17 : 0.1,
                  child: _buildClusterCard(items[2], isSelected ? 54 : 44),
                ),
              ),
            // Middle card (2nd item)
            if (items.length > 1)
              Positioned(
                right: 2,
                bottom: 2,
                child: Transform.rotate(
                  angle: isSelected ? -0.09 : -0.05,
                  child: _buildClusterCard(items[1], isSelected ? 54 : 44),
                ),
              ),
            // Top card (1st item)
            Positioned(
              right: 4,
              bottom: 4,
              child: _buildClusterCard(items.first, size),
            ),
            // Count badge
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Color(0xFF007aff),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '${items.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClusterCard(MapItem item, double cardSize) {
    final innerSize = cardSize - 6;
    return Container(
      width: cardSize,
      height: cardSize,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(9),
        child: item.when(
          trainer: (trainer) {
            final avatarUrl = trainer.profile?.profilePhotoPath;
            if (avatarUrl != null && avatarUrl.isNotEmpty) {
              return Image.network(
                avatarUrl,
                width: innerSize,
                height: innerSize,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => _placeholderIcon(innerSize),
              );
            }
            return _placeholderIcon(innerSize);
          },
          event: (event) {
            if (event.imageUrl != null && event.imageUrl!.isNotEmpty) {
              return Image.network(
                event.imageUrl!,
                width: innerSize,
                height: innerSize,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => _eventPlaceholder(innerSize),
              );
            }
            return _eventPlaceholder(innerSize);
          },
        ),
      ),
    );
  }

  Widget _placeholderIcon(double size) {
    return Container(
      width: size,
      height: size,
      color: Colors.grey.shade200,
      child: Icon(Icons.person, color: Colors.grey, size: size * 0.4),
    );
  }

  Widget _eventPlaceholder(double size) {
    return Container(
      width: size,
      height: size,
color: const Color(0xFF007aff).withValues(alpha: 0.1),
       child: Icon(Icons.calendar_today, color: const Color(0xFF007aff), size: size * 0.4),
    );
  }
}
