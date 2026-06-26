import 'dart:math' as math;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../data/models/progress_response_dto.dart';

/// Per-exercise progress chart with exercise selector dropdown.
///
/// Shows a line chart of e1RM/volume progression for the selected exercise.
class ExerciseProgressWidget extends StatefulWidget {
  final List<FavoriteExerciseDto> favoriteExercises;
  final Future<List<DataPoint>> Function(String exerciseId) onFetchExerciseStats;

  const ExerciseProgressWidget({
    super.key,
    required this.favoriteExercises,
    required this.onFetchExerciseStats,
  });

  @override
  State<ExerciseProgressWidget> createState() => _ExerciseProgressWidgetState();
}

class _ExerciseProgressWidgetState extends State<ExerciseProgressWidget> {
  String? _selectedExerciseId;
  List<DataPoint> _chartData = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.favoriteExercises.isNotEmpty) {
      _selectedExerciseId = widget.favoriteExercises.first.exerciseId;
      _fetchData();
    }
  }

  Future<void> _fetchData() async {
    if (_selectedExerciseId == null) return;
    setState(() => _isLoading = true);
    try {
      final data = await widget.onFetchExerciseStats(_selectedExerciseId!);
      if (mounted) setState(() => _chartData = data);
    } catch (_) {
      if (mounted) setState(() => _chartData = []);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.favoriteExercises.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: Text(
            'No exercise data yet',
            style: TextStyle(fontSize: 13, color: AppColors.mutedText),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Exercise selector dropdown
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.08),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedExerciseId,
              isDense: true,
              items: widget.favoriteExercises.map((ex) {
                return DropdownMenuItem(
                  value: ex.exerciseId,
                  child: Text(
                    ex.exerciseName,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() => _selectedExerciseId = value);
                  _fetchData();
                }
              },
            ),
          ),
        ),
        const SizedBox(height: 12),
        // Chart
        if (_isLoading)
          const SizedBox(
            height: 150,
            child: Center(
              child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.primary),
            ),
          )
        else if (_chartData.isEmpty)
          const SizedBox(
            height: 150,
            child: Center(
              child: Text(
                'No data for this exercise',
                style: TextStyle(fontSize: 13, color: AppColors.mutedText),
              ),
            ),
          )
        else
          SizedBox(
            height: 150,
            child: _ExerciseLineChart(data: _chartData),
          ),
      ],
    );
  }
}

class _ExerciseLineChart extends StatelessWidget {
  final List<DataPoint> data;

  const _ExerciseLineChart({required this.data});

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

    return LineChart(
      LineChartData(
        minY: chartMinY,
        maxY: chartMaxY,
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            preventCurveOverShooting: true,
            color: AppColors.primary,
            barWidth: 2,
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
                  AppColors.primary.withOpacity(0.25),
                  AppColors.primary.withOpacity(0.02),
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
              reservedSize: 24,
              interval: (data.length / 4).ceilToDouble().clamp(1, double.infinity),
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index >= 0 && index < data.length) {
                  final label = _shortDate(data[index].date);
                  return Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      label,
                      style: const TextStyle(fontSize: 9, color: AppColors.mutedText),
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
              reservedSize: 36,
              interval: interval,
              getTitlesWidget: (value, meta) {
                return Text(
                  value.toStringAsFixed(0),
                  style: const TextStyle(fontSize: 9, color: AppColors.mutedText),
                );
              },
            ),
          ),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        gridData: FlGridData(
          show: true,
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
                  const TextStyle(color: Colors.white, fontSize: 11),
                );
              }).toList();
            },
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
      