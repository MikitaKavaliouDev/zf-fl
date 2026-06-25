import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../data/models/analytics_response_dto.dart';

/// List of recent personal records with orange accent values.
class PRsListWidget extends StatelessWidget {
  final List<PRDataPoint> data;

  const PRsListWidget({super.key, required this.data});

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

    return Column(
      children: data.map((pr) => _PRRow(pr: pr)).toList(),
    );
  }
}

class _PRRow extends StatelessWidget {
  final PRDataPoint pr;

  const _PRRow({required this.pr});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
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
                  pr.date,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.mutedText,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${pr.value.toStringAsFixed(1)} kg',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFF9500),
            ),
          ),
        ],
      ),
    );
  }
}
