import 'package:flutter/material.dart';
import 'package:ziro_fit/features/explore/cubit/explore_map_state.dart';

class SingleItemAnnotation extends StatelessWidget {
  final MapItem item;
  final bool isSelected;
  final VoidCallback? onTap;

  const SingleItemAnnotation({
    super.key,
    required this.item,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = isSelected ? 60.0 : 50.0;
    final innerSize = isSelected ? 54.0 : 44.0;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
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
                  errorBuilder: (_, __, ___) => _placeholderIcon(),
                );
              }
              return _placeholderIcon();
            },
            event: (event) {
              if (event.imageUrl != null && event.imageUrl!.isNotEmpty) {
                return Image.network(
                  event.imageUrl!,
                  width: innerSize,
                  height: innerSize,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => _eventPlaceholder(),
                );
              }
              return _eventPlaceholder();
            },
          ),
        ),
      ),
    );
  }

  Widget _placeholderIcon() {
    return Container(
      width: 54,
      height: 54,
      color: Colors.grey.shade200,
      child: const Icon(Icons.person, color: Colors.grey, size: 24),
    );
  }

  Widget _eventPlaceholder() {
    return Container(
      width: 54,
      height: 54,
      color: const Color(0xFF007aff).withOpacity(0.1),
      child: const Icon(Icons.calendar_today, color: Color(0xFF007aff), size: 20),
    );
  }
}
