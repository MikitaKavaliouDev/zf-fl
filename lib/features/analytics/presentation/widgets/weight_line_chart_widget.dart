import 'dart:math' as math;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../data/models/progress_response_dto.dart';

/// Line chart showing body weight history from check-ins.
class WeightLineChartWidget extends StatelessWidget {
  final List<DataPoint> data;

  const WeightLineChartWidget({super.key, required this.data});

  Map<String, double> _calculateNiceRange(double minY, double maxY, {bool forceZeroStart = false}) {
    double minVal = forceZeroStart ? 0 : minY;
    double maxVal = maxY;

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

    double chartMinY = forceZeroStart ? 0 : (minVal / cleanInterval).floor() * cleanInterval;
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
            'No weight data yet',
            style: TextStyle(fontSize: 14, color: AppColors.mutedText),
          ),
        ),
      );
    }

    final maxY =
        data.fold<double>(0, (max, d) => d.value > max ? d.value : max);
    final minY = data.fold<double>(
      double.infinity,
      (min, d) => d.value < min ? d.value : min,
    );
    final range = _calculateNiceRange(minY, maxY, forceZeroStart: false);
    final interval = range['interval']!;
    final chartMinY = range['minY']!;
    final chartMaxY = range['maxY']!;

    final spots = data.asMap().entries.map((entry) {
      return FlSpot(entry.key.toDouble(), entry.value.value);
    }).toList();

    return SizedBox(
      height: 180,
      child: LineChart(
        LineChartData(
          minY: chartMinY,
          maxY: chartMaxY,
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              preventCurveOverShooting: true,
              color: const Color(0xFF7B2FBE),
              barWidth: 2.5,
              dotData: FlDotData(
                show: data.length <= 20,
                getDotPainter: (spot, percent, barData, index) {
                  return FlDotCirclePainter(
                    radius: 3,
                    color: const Color(0xFF7B2FBE),
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
                    const Color(0xFF7B2FBE).withOpacity(0.3),
                    const Color(0xFF7B2FBE).withOpacity(0.05),
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
                interval: interval,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toStringAsFixed(1),
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
            horizontalInterval: interval,
            getDrawingHorizontalLine: (value) {
              return const FlLine(
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
                    '${point.date}\n${spot.y.toStringAsFixed(1)} kg',
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
    final datePart = isoDate.contains('T') ? isoDate.split('T')[0] : isoDate;
    final cleanDatePart = datePart.contains(' ') ? datePart.split(' ')[0] : datePart;
    final parts = cleanDatePart.split('-');
    if (parts.length >= 3) {
      return '${parts[1]}/${parts[2]}';
    }
    return isoDate;
  }
}
      