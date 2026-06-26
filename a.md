<response>
  <reasoning>
    I will fix the two main layout and formatting issues in the Analytics charts:
    1. **Overlapping X-Axis Dates under "Workouts Per Week" (VolumeChartWidget):** The previous layout rendered with a hardcoded `interval: 1`, forcing every single bar to have a label. By changing it to a dynamic interval like we have on the line charts, we will cleanly space out the labels so only about 5 dates are shown across the axis, preventing any overlap.
    2. **Ugly ISO DateTime formats under "Weight History" (WeightLineChartWidget, ExerciseProgressWidget, MeasurementHistoryView, etc.):** The previous `_shortDate` parser split string dates only by `-`. If the string was a full ISO 8601 timestamp (e.g., containing `T00:00:00.000Z`), the time portion remained appended to the day (e.g., `03/21T00:00:00.000Z`), which squished the text. I will implement a robust `_shortDate` parser that extracts the date portion first, removing any time strings before splitting.

    I will modify all 5 relevant chart files to apply these clean formatting fixes.
  </reasoning>
  <modifications>
    <file path="lib/features/analytics/presentation/widgets/volume_chart_widget.dart">
      <![CDATA[
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
            show: true,
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
          barGroups: data.asMap().entries.map((entry) {
            final i = entry.key;
            final d = entry.value;
            return BarChartGroupData(
              x: i,
              barRods: [
                BarChartRodData(
                  toY: d.volume,
                  color: const Color(0xFF7B2FBE).withOpacity(0.8),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      const Color(0xFF7B2FBE).withOpacity(0.4),
                      const Color(0xFF7B2FBE).withOpacity(0.9),
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
      ]]>
    </file>
    <file path="lib/features/analytics/presentation/widgets/volume_line_chart_widget.dart">
      <![CDATA[
import 'dart:math' as math;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../data/models/analytics_response_dto.dart';

/// Line chart showing volume progression over time with gradient fill.
class VolumeLineChartWidget extends StatelessWidget {
  final List<VolumeDataPoint> data;

  const VolumeLineChartWidget({super.key, required this.data});

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
    final chartMinY = range['minY']!;
    final chartMaxY = range['maxY']!;

    final spots = data.asMap().entries.map((entry) {
      return FlSpot(entry.key.toDouble(), entry.value.volume);
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
    final datePart = isoDate.contains('T') ? isoDate.split('T')[0] : isoDate;
    final cleanDatePart = datePart.contains(' ') ? datePart.split(' ')[0] : datePart;
    final parts = cleanDatePart.split('-');
    if (parts.length >= 3) {
      return '${parts[1]}/${parts[2]}';
    }
    return isoDate;
  }
}
      ]]>
    </file>
    <file path="lib/features/analytics/presentation/widgets/weight_line_chart_widget.dart">
      <![CDATA[
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
      ]]>
    </file>
    <file path="lib/features/analytics/presentation/widgets/exercise_progress_widget.dart">
      <![CDATA[
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
      ]]>
    </file>
    <file path="lib/features/analytics/presentation/measurements/measurement_history_view.dart">
      <![CDATA[
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
    final maxY = data.fold<double>(0, (max, d) => d.value > max ? d.value : max);
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
                        AppColors.primary.withOpacity(0.3),
                        AppColors.primary.withOpacity(0.05),
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
      ]]>
    </file>
  </modifications>
</response>