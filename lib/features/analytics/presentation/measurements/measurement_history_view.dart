import 'dart:math' as math;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../data/models/progress_response_dto.dart';

/// Weight history line chart from check-in measurements.
///
/// Matches iOS MeasurementHistoryView pattern.
class MeasurementHistoryView extends StatelessWidget {
  final List<DataPoint> weightData;

  const MeasurementHistoryView({super.key, required this.weightData});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        children: [
          // Drag handle
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 8),
            child: Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.borderActive,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                const Spacer(),
                const Text(
                  'Weight History',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.foreground,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Text(
                    'Done',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: weightData.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.monitor_weight_outlined,
                          size: 60,
                          color: AppColors.mutedText,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'No weight history',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.foreground,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Your past measurements will appear here.',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.mutedText,
                          ),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(20),
                    child: _WeightChart(data: weightData),
                  ),
          ),
        ],
      ),
    );
  }
}

class _WeightChart extends StatelessWidget {
  final List<DataPoint> data;

  const _WeightChart({required this.data});

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
    final maxY = data.fold<double>(0, (max, d) => d.value > max ? d.value : max);
    final minY = data.fold<double>(
      double.infinity,
      (min, d) => d.value < min ? d.value : min,
    );
    final range = _calculateNiceRange(minY, maxY);
    final interval = range['interval']!;
    final chartMinY = range['minY']!;
    final chartMaxY = range['maxY']!;

    final spots = data.asMap().entries.map((entry) {
      return FlSpot(entry.key.toDouble(), entry.value.value);
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Weight Progression',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.foreground,
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: LineChart(
            LineChartData(
              minY: chartMinY,
              maxY: chartMaxY,
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

                      );
                    },
                  ),
                  belowBarData: BarAreaData(
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
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 28,
                    interval: (data.length / 5).ceilToDouble().clamp(1, double.infinity),
                    getTitlesWidget: (value, meta) {
                      final index = value.toInt();
                      if (index >= 0 && index < data.length) {
                        final label = _shortDate(data[index].date);
                        return Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            label,
                            style: const TextStyle(fontSize: 10, color: AppColors.mutedText),
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
                    interval: interval,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        value.toStringAsFixed(1),
                        style: const TextStyle(fontSize: 10, color: AppColors.mutedText),
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
                  return const FlLine(color: AppColors.borderMuted, strokeWidth: 1);
                },
              ),
              borderData: FlBorderData(show: false),
              lineTouchData: LineTouchData(
                touchTooltipData: LineTouchTooltipData(
                  getTooltipItems: (touchedSpots) {
                    return touchedSpots.map((spot) {
                      final point = data[spot.spotIndex];
                      return LineTooltipItem(
                        '${point.date}\n${spot.y.toStringAsFixed(1)} kg',
                        const TextStyle(color: Colors.white, fontSize: 12),
                      );
                    }).toList();
                  },
                ),
              ),
            ),
          ),
        ),
      ],
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
      