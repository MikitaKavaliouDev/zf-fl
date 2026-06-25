import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_theme.dart';
import '../../data/models/analytics_response_dto.dart';

/// iOS-style PRs list — tappable rows with orange trophy, chevron, formatted
/// date. Shows top 5. Matches PersonalAnalyticsView.
class PRsListWidget extends StatelessWidget {
  final List<PRDataPoint> data;
  final void Function(PRDataPoint)? onTapPr;

  const PRsListWidget({super.key, required this.data, this.onTapPr});

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: Text(
            'No PRs yet. Keep training!',
            style: TextStyle(fontSize: 14, color: AppColors.mutedText),
          ),
        ),
      );
    }

    final shown = data.take(5).toList();

    return Column(
      children: List.generate(shown.length * 2 - 1, (i) {
        if (i.isOdd) {
          return const Divider(height: 1, color: AppColors.borderMuted);
        }
        final pr = shown[i ~/ 2];
        return _PRRow(
          pr: pr,
          onTap: onTapPr != null ? () => onTapPr!(pr) : null,
        );
      }),
    );
  }
}

class _PRRow extends StatelessWidget {
  final PRDataPoint pr;
  final VoidCallback? onTap;

  const _PRRow({required this.pr, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            // Trophy icon container
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: const Color(0xFFFF9500).withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.emoji_events_rounded,
                size: 16,
                color: Color(0xFFFF9500),
              ),
            ),
            const SizedBox(width: 12),
            // Exercise + date
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pr.exercise,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.foreground,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    _formatDate(pr.date),
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.mutedText,
                    ),
                  ),
                ],
              ),
            ),
            // Value + "PR" label
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${pr.value.toStringAsFixed(1)} kg',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF9500),
                  ),
                ),
                const Text(
                  'PR',
                  style: TextStyle(fontSize: 10, color: AppColors.mutedText),
                ),
              ],
            ),
            const SizedBox(width: 8),
            // Chevron
            const Icon(
              Icons.chevron_right_rounded,
              size: 16,
              color: AppColors.mutedText,
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(String isoDate) {
    try {
      final parsed = DateTime.parse(isoDate);
      return DateFormat('MMM dd, yyyy').format(parsed);
    } catch (_) {
      return isoDate;
    }
  }
}
