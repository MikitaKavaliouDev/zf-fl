import 'dart:developer' as developer;
import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_theme.dart';
import '../../cubit/trainer_client_sessions_cubit.dart';
import '../../cubit/trainer_client_sessions_state.dart';
import '../../data/models/trainer_client_session_dto.dart';

/// Client workout history viewed from the trainer perspective.
///
/// Mirrors iOS `ClientHistoryView` (V:\Ziro-Fit\Ziro Fit\Views\Trainer\ClientHistoryView.swift).
/// Displays a volume progression chart at top and a reverse-chronological
/// list of completed workout sessions.
class TrainerClientHistoryScreen extends StatefulWidget {
  final String clientId;
  final String clientName;

  const TrainerClientHistoryScreen({
    super.key,
    required this.clientId,
    required this.clientName,
  });

  @override
  State<TrainerClientHistoryScreen> createState() =>
      _TrainerClientHistoryScreenState();
}

class _TrainerClientHistoryScreenState
    extends State<TrainerClientHistoryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<TrainerClientSessionsCubit>()
          .loadSessions(widget.clientId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const ValueKey('trainerClientHistoryScreen'),
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(widget.clientName),
      ),
      body: BlocBuilder<TrainerClientSessionsCubit,
          TrainerClientSessionsState>(
        builder: (context, state) {
          return switch (state) {
            TrainerClientSessionsInitial() ||
            TrainerClientSessionsLoading() =>
              const Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              ),
            TrainerClientSessionsError(:final message) =>
              _ErrorState(message: message, onRetry: () {
                context
                    .read<TrainerClientSessionsCubit>()
                    .loadSessions(widget.clientId);
              }),
            TrainerClientSessionsLoaded(:final sessions) =>
              _buildContent(sessions),
          };
        },
      ),
    );
  }

  Widget _buildContent(List<TrainerClientSessionDto> sessions) {
    if (sessions.isEmpty) {
      return const _EmptyHistoryView();
    }

    // Completed sessions only for the chart
    final completed = sessions
        .where((s) => s.status == 'COMPLETED')
        .toList();

    return ListView(
      padding: const EdgeInsets.only(top: 16, bottom: 50),
      children: [
        // ── Volume Progression Chart ──
        if (completed.length >= 2)
          _VolumeChartSection(sessions: completed),

        // ── Workout History List ──
        _WorkoutHistorySection(sessions: sessions),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// Volume Progression Chart Section
// ═══════════════════════════════════════════════════════════════════════════════

class _VolumeChartSection extends StatelessWidget {
  final List<TrainerClientSessionDto> sessions;

  const _VolumeChartSection({required this.sessions});

  @override
  Widget build(BuildContext context) {
    // Sort chronologically (oldest → newest) for the chart X-axis
    final chartSessions = List<TrainerClientSessionDto>.from(sessions)
      ..sort((a, b) => a.startTime.compareTo(b.startTime));

    final maxVolume =
        chartSessions.fold<double>(0, (max, s) => s.volume > max ? s.volume : max);
    final range = _calculateNiceRange(0, maxVolume, forceZeroStart: true);
    final interval = range['interval']!;
    final chartMinY = range['minY']!;
    final chartMaxY = range['maxY']!;

    final spots = chartSessions.asMap().entries.map((entry) {
      return FlSpot(entry.key.toDouble(), entry.value.volume);
    }).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.mutedSurface,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Volume Progression',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
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
                        show: chartSessions.length <= 30,
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
                            AppColors.primary.withValues(alpha: 0.25),
                            AppColors.primary.withValues(alpha: 0.02),
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
                        interval: (chartSessions.length / 5)
                            .ceilToDouble()
                            .clamp(1, double.infinity),
                        getTitlesWidget: (value, meta) {
                          final index = value.toInt();
                          if (index >= 0 && index < chartSessions.length) {
                            final label =
                                _formatDateShort(chartSessions[index].startTime);
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
                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipItems: (touchedSpots) {
                        return touchedSpots.map((spot) {
                          final point = chartSessions[spot.spotIndex];
                          final date =
                              _formatDateFull(point.startTime);
                          return LineTooltipItem(
                            '$date\n${spot.y.toStringAsFixed(0)} kg',
                            const TextStyle(
                                color: Colors.white, fontSize: 12),
                          );
                        }).toList();
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// Workout History Section
// ═══════════════════════════════════════════════════════════════════════════════

class _WorkoutHistorySection extends StatelessWidget {
  final List<TrainerClientSessionDto> sessions;

  const _WorkoutHistorySection({required this.sessions});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Workout History',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.foreground,
              ),
            ),
          ),
          const SizedBox(height: 12),
          ...sessions.map(
            (session) => Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 6),
              child: _SessionCard(session: session),
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// Session Card
// ═══════════════════════════════════════════════════════════════════════════════

class _SessionCard extends StatelessWidget {
  final TrainerClientSessionDto session;

  const _SessionCard({required this.session});

  @override
  Widget build(BuildContext context) {
    final dateStr = _formatDateAbbreviated(session.startTime);
    final isCompleted = session.status == 'COMPLETED';
    final duration = _computeDuration(session);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderMuted),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Date & Status
          Row(
            children: [
              const Icon(Icons.calendar_today_rounded,
                  size: 14, color: AppColors.primary),
              const SizedBox(width: 6),
              Text(
                dateStr,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.foreground,
                ),
              ),
              const Spacer(),
              if (isCompleted)
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Completed',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
              const SizedBox(width: 4),
              const Icon(Icons.chevron_right_rounded,
                  size: 20, color: AppColors.mutedText),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(
            height: 1,
            thickness: 1,
            color: AppColors.borderMuted,
          ),
          const SizedBox(height: 12),

          // Stats Row
          Row(
            children: [
              _StatCompact(
                  value: '${session.volume.toStringAsFixed(0)} kg',
                  label: 'Volume'),
              const SizedBox(width: 24),
              _StatCompact(
                  value: '${session.totalSets}', label: 'Sets'),
              const SizedBox(width: 24),
              _StatCompact(
                  value: '${duration}m', label: 'Duration'),
            ],
          ),

          // Exercises Preview
          if (session.exerciseNames.isNotEmpty) ...[
            const SizedBox(height: 10),
            const Text(
              'Exercises',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.mutedText,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              session.exerciseNames.join(' • '),
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.mutedText,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// Stat Compact Widget
// ═══════════════════════════════════════════════════════════════════════════════

class _StatCompact extends StatelessWidget {
  final String value;
  final String label;

  const _StatCompact({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.foreground,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: AppColors.mutedText,
          ),
        ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// Empty State
// ═══════════════════════════════════════════════════════════════════════════════

class _EmptyHistoryView extends StatelessWidget {
  const _EmptyHistoryView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.document_scanner_outlined,
              size: 50,
              color: AppColors.mutedText.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 16),
            const Text(
              'No workout history found',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.mutedText,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Start a session for this client to see stats here.',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// Error State
// ═══════════════════════════════════════════════════════════════════════════════

class _ErrorState extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorState({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              style: const TextStyle(color: AppColors.mutedText),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded, size: 18),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// Helpers
// ═══════════════════════════════════════════════════════════════════════════════

/// Parses an ISO date string (e.g. "2026-06-18T16:00:00.000Z") to DateTime.
DateTime? _parseIso(String iso) {
  try {
    return DateTime.parse(iso);
  } catch (e) {
    developer.log('Failed to parse date: $iso', name: 'trainer');
    return null;
  }
}

/// Formats a date as "M/d" (e.g. "6/18").
String _formatDateShort(String iso) {
  final dt = _parseIso(iso);
  if (dt == null) return iso;
  return DateFormat('M/d').format(dt);
}

/// Formats a date as abbreviated month + day (e.g. "Jun 18").
String _formatDateAbbreviated(String iso) {
  final dt = _parseIso(iso);
  if (dt == null) return iso;
  return DateFormat('MMM d').format(dt);
}

/// Formats a date as full date string for tooltips (e.g. "Jun 18, 2026").
String _formatDateFull(String iso) {
  final dt = _parseIso(iso);
  if (dt == null) return iso;
  return DateFormat('MMM d, yyyy').format(dt);
}

/// Computes session duration in minutes from startTime → endTime.
int _computeDuration(TrainerClientSessionDto session) {
  final start = _parseIso(session.startTime);
  final end = session.endTime != null ? _parseIso(session.endTime!) : null;
  if (start == null || end == null) return 0;
  final diff = end.difference(start);
  return diff.inMinutes;
}

/// Calculates "nice" axis range with clean intervals for chart Y-axis.
///
/// Mirrors _calculateNiceRange in VolumeLineChartWidget.
Map<String, double> _calculateNiceRange(
  double minY,
  double maxY, {
  bool forceZeroStart = false,
}) {
  final double minVal = forceZeroStart ? 0 : minY;
  final double maxVal = maxY;

  double range = maxVal - minVal;
  if (range <= 0) {
    range = 10;
  }

  final rawInterval = range / 4;
  final log10 =
      rawInterval > 0 ? (math.log(rawInterval) / math.ln10).floor() : 0;
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

  final double chartMinY =
      forceZeroStart ? 0 : (minVal / cleanInterval).floor() * cleanInterval;
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
