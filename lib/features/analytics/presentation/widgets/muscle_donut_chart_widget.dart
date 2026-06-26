import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../data/models/analytics_response_dto.dart';

/// Donut chart showing muscle group distribution.
class MuscleDonutChartWidget extends StatelessWidget {
  final List<MuscleDataPoint> data;

  const MuscleDonutChartWidget({super.key, required this.data});

  static const _chartColors = [
    Color(0xFF007AFF),
    Color(0xFF5856D6),
    Color(0xFF34C759),
    Color(0xFFFF9500),
    Color(0xFFFF3B30),
    Color(0xFFAF52DE),
    Color(0xFFFF2D55),
    Color(0xFF5AC8FA),
    Color(0xFF00C7BE),
    Color(0xFFFF6482),
  ];

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const SizedBox(
        height: 180,
        child: Center(
          child: Text(
            'No muscle distribution data',
            style: TextStyle(fontSize: 14, color: AppColors.mutedText),
          ),
        ),
      );
    }

    return Column(
      children: [
        SizedBox(
          height: 180,
          child: PieChart(
            PieChartData(
              sectionsSpace: 2,
              centerSpaceRadius: 40,
              sections: data.asMap().entries.map((entry) {
                final i = entry.key;
                final d = entry.value;
                final total =
                    data.fold<int>(0, (sum, p) => sum + p.count);
                final pct = total > 0 ? d.count / total : 0.0;
                return PieChartSectionData(
                  value: pct * 100,
                  color: _chartColors[i % _chartColors.length],
                  radius: 30,
                  title: pct >= 0.05 ? '${(pct * 100).toStringAsFixed(0)}%' : '',
                  titleStyle: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Beautiful, structured 2-column legend grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4.5,
            mainAxisSpacing: 8,
            crossAxisSpacing: 16,
          ),
          itemCount: data.length,
          itemBuilder: (context, index) {
            final d = data[index];
            final color = _chartColors[index % _chartColors.length];
            return Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '${d.muscle} (${d.count})',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.foreground,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
      