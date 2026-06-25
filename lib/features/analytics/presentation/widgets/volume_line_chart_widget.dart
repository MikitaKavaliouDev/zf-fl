import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../data/models/analytics_response_dto.dart';

/// Line chart showing volume progression over time with gradient fill.
class VolumeLineChartWidget extends StatelessWidget {
  final List<VolumeDataPoint> data;

  const VolumeLineChartWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const SizedBox(
        height: 180,
        child: Center(
          child: Text(
            'No volume data yet',
            style: TextStyle(fontSize: 14, color: AppColors.mutedText),
          ),
        ),
      );
    }

    final maxY =
        data.fold<double>(0, (max, d) => d.volume > max ? d.volume : max);
    final spots = data.asMap().entries.map((entry) {
      return FlSpot(entry.key.toDouble(), entry.value.volume);
    }).toList();

    return SizedBox(
      height: 180,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              preventCurveOverShooting: true,
              color: AppColors.primary,
              barWidth: 2.5,
              dotData: FlDotData(
                show: data.length <= 20,
                getDotPainter: (spot, percent, barData, index) {
                  return FlDotCirclePainter(
                    radius: 3,
                    color: AppColors.primary,
                    strokeWidth: 0,
                  );
                },
              ),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.primary.withValues(alpha: 0.3),
                    AppColors.primary.withValues(alpha: 0.05),
                  ],
                ),
              ),
            ),
          ],
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 28,
                interval: (data.length / 5)
                    .ceilToDouble()
                    .clamp(1, double.infinity),
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index >= 0 && index < data.length) {
                    final label = _shortDate(data[index].date);
                    return Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        label,
                        style: const TextStyle(
                          fontSize: 10,
                          color: AppColors.mutedText,
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toStringAsFixed(0),
                    style: const TextStyle(
                      fontSize: 10,
                      color: AppColors.mutedText,
                    ),
                  );
                },
              ),
            ),
            topTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: (maxY / 4).clamp(1, double.infinity),
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: AppColors.borderMuted,
                strokeWidth: 1,
              );
            },
          ),
          borderData: FlBorderData(show: false),
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              getTooltipItems: (touchedSpots) {
                return touchedSpots.map((spot) {
                  final point = data[spot.spotIndex];
                  return LineTooltipItem(
                    '${point.date}\n${spot.y.toStringAsFixed(0)} kg',
                    const TextStyle(color: Colors.white, fontSize: 12),
                  );
                }).toList();
              },
            ),
          ),
        ),
      ),
    );
  }

  String _shortDate(String isoDate) {
    final parts = isoDate.split('-');
    if (parts.length >= 3) {
      return '${parts[1]}/${parts[2]}';
    }
    return isoDate;
  }
}
