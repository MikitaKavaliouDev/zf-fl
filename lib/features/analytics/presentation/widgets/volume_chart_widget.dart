import 'dart:math' as math;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../data/models/analytics_response_dto.dart';

/// Bar chart showing workout volume per week/day.
class VolumeChartWidget extends StatelessWidget {
  final List<VolumeDataPoint> data;

  const VolumeChartWidget({super.key, required this.data});

  Map<String, double> _calculateNiceRange(double minY, double maxY, {bool forceZeroStart = false}) {
    final double minVal = forceZeroStart ? 0 : minY;
    final double maxVal = maxY;

    double range = maxVal - minVal;
    if (range <= 0) {
      range = 10;
    }

    final rawInterval = range / 4;
    final log10 = rawInterval > 0 ? (math.log(rawInterval) / math.ln10).floor() : 0;
    final magnitude = math.pow(10, log10).toDouble();
    final residual = magnitude > 0 ? rawInterval / magnitude : 1.0;

    double cleanInterval;
    if (residual < 1.5) {
      cleanInterval = 1.0 * magnitude;
    } else if (residual < 3.0) {
      cleanInterval = 2.0 * magnitude;
    } else if (residual < 7.0) {
      cleanInterval = 5.0 * magnitude;
    } else {
      cleanInterval = 10.0 * magnitude;
    }

    if (cleanInterval <= 0) {
      cleanInterval = 1.0;
    }

    final double chartMinY = forceZeroStart ? 0 : (minVal / cleanInterval).floor() * cleanInterval;
    double chartMaxY = (maxVal / cleanInterval).ceil() * cleanInterval;

    if (chartMinY == chartMaxY) {
      chartMaxY += cleanInterval;
    }

    return {
      'minY': chartMinY,
      'maxY': chartMaxY,
      'interval': cleanInterval,
    };
  }

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
    final range = _calculateNiceRange(0, maxY, forceZeroStart: true);
    final interval = range['interval']!;
    final chartMaxY = range['maxY']!;

    return SizedBox(
      height: 180,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: chartMaxY,
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                final point = data[group.x];
                final datePart = point.date.contains('T') ? point.date.split('T')[0] : point.date;
                return BarTooltipItem(
                  '$datePart\n${rod.toY.toStringAsFixed(0)} kg',
                  const TextStyle(color: Colors.white, fontSize: 12),
                );
              },
            ),
          ),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 28,
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
                interval: (data.length / 5).ceilToDouble().clamp(1, double.infinity),
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                interval: interval,
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
            topTitles: const AxisTitles(),
            rightTitles: const AxisTitles(),
          ),
          gridData: FlGridData(
            drawVerticalLine: false,
            horizontalInterval: interval,
            getDrawingHorizontalLine: (value) {
              return const FlLine(
                color: AppColors.borderMuted,
                strokeWidth: 1,
              );
            },
          ),
          borderData: FlBorderData(show: false),
          barGroups: data.asMap().entries.map((entry) {
            final i = entry.key;
            final d = entry.value;
            return BarChartGroupData(
              x: i,
              barRods: [
                BarChartRodData(
                  toY: d.volume,
                  color: const Color(0xFF7B2FBE).withValues(alpha: 0.8),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      const Color(0xFF7B2FBE).withValues(alpha: 0.4),
                      const Color(0xFF7B2FBE).withValues(alpha: 0.9),
                    ],
                  ),
                  width: 12,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(4)),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  String _shortDate(String isoDate) {
    final datePart = isoDate.contains('T') ? isoDate.split('T')[0] : isoDate;
    final cleanDatePart = datePart.contains(' ') ? datePart.split(' ')[0] : datePart;
    final parts = cleanDatePart.split('-');
    if (parts.length >= 3) {
      return '${parts[1]}/${parts[2]}';
    }
    return isoDate;
  }
}
      