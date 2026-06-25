import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../data/models/trainer_testimonial_dto.dart';

/// Testimonial card for the reviews horizontal scroll section.
/// Matches iOS testimonial card (lines 410-445) — 220pt wide, 14pt radius.
class ReviewCard extends StatelessWidget {
  final TrainerTestimonialDto testimonial;

  const ReviewCard({super.key, required this.testimonial});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Client name + rating
          Row(
            children: [
              Expanded(
                child: Text(
                  testimonial.clientName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: AppColors.foreground,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              // Star rating
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(5, (i) {
                  final filled = testimonial.rating != null && i < testimonial.rating!.round();
                  return Icon(
                    filled ? Icons.star_rounded : Icons.star_border_rounded,
                    size: 10,
                    color: filled ? Colors.orange : AppColors.borderActive,
                  );
                }),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Testimonial text
          Expanded(
            child: Text(
              testimonial.testimonialText,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.mutedText,
                height: 1.4,
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Date
          if (testimonial.createdAt != null)
            Text(
              _formatDate(testimonial.createdAt!),
              style: const TextStyle(
                fontSize: 9,
                color: AppColors.mutedText,
              ),
            ),
        ],
      ),
    );
  }

  String _formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      final months = [
        '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
      ];
      return '${months[date.month]} ${date.day}, ${date.year}';
    } catch (_) {
      return dateStr;
    }
  }
}
