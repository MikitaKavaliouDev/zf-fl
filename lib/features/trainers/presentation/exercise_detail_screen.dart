import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/cached_exercise_image.dart';
import '../../../core/widgets/error_widget.dart';
import '../cubit/exercise_detail_cubit.dart';
import '../cubit/exercise_detail_state.dart';
import '../data/models/exercise_dto.dart';
import '../data/models/exercise_log_dto.dart';
import '../data/models/workout_session_dto.dart';

class ExerciseDetailScreen extends StatefulWidget {
  final String exerciseId;
  final String exerciseName;
  final void Function(String? videoUrl)? onPlayVideo;

  const ExerciseDetailScreen({
    super.key,
    required this.exerciseId,
    required this.exerciseName,
    this.onPlayVideo,
  });

  @override
  State<ExerciseDetailScreen> createState() => _ExerciseDetailScreenState();
}

class _ExerciseDetailScreenState extends State<ExerciseDetailScreen> {
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _initialized = true;
      context
          .read<ExerciseDetailCubit>()
          .loadExerciseDetail(widget.exerciseId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExerciseDetailCubit, ExerciseDetailState>(
      listener: (context, state) {},
      builder: (context, state) {
        return DefaultTabController(
          length: 4,
          child: Scaffold(
            key: const ValueKey('exerciseDetailScreen'),
            appBar: AppBar(
              title: Text(
                widget.exerciseName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bottom: const TabBar(
                labelColor: AppColors.primary,
                unselectedLabelColor: AppColors.mutedText,
                indicatorColor: AppColors.primary,
                labelStyle:
                    TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                tabs: [
                  Tab(text: 'About'),
                  Tab(text: 'History'),
                  Tab(text: 'Charts'),
                  Tab(text: 'Records'),
                ],
              ),
            ),
            backgroundColor: AppColors.background,
            body: _buildBody(context, state),
          ),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, ExerciseDetailState state) {
    if (state is ExerciseDetailLoading) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      );
    }

    if (state is ExerciseDetailError) {
      return _buildError(context, state.message);
    }

    if (state is! ExerciseDetailLoaded) {
      return const SizedBox.shrink();
    }

    final loaded = state;
    final exercise = loaded.exercise;
    final sessions =
        _sessionsWithExercise(loaded.sessions, exercise.id)
          ..sort((a, b) => b.startTime.compareTo(a.startTime));

    return TabBarView(
      children: [
        _buildAboutTab(exercise),
        _buildHistoryTab(sessions, exercise.id),
        _buildChartsTab(loaded.volumeHistory),
        _buildRecordsTab(loaded, exercise.id),
      ],
    );
  }

  Widget _buildError(BuildContext context, String message) {
    return ZiroErrorWidget(
      message: message,
      iconSize: 64,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      messageFontSize: 16,
      onRetry: () =>
          context.read<ExerciseDetailCubit>().loadExerciseDetail(
                widget.exerciseId,
              ),
    );
  }

  // ═══════════════════════════════════════════════════════════════
  //  TAB 1 – About
  // ═══════════════════════════════════════════════════════════════

  Widget _buildAboutTab(ExerciseDto exercise) {
    final mediaUrl = exercise.imageUrl ?? exercise.videoUrl;
    final isYT =
        mediaUrl != null && CachedExerciseImage.isYouTubeUrl(mediaUrl);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedExerciseImage(
            imageUrl: exercise.imageUrl,
            videoUrl: exercise.videoUrl,
            width: double.infinity,
            height: 260,
            borderRadius: 16,
            fit: BoxFit.contain,
            onTap:
                isYT && widget.onPlayVideo != null
                    ? () => widget.onPlayVideo!(mediaUrl)
                    : null,
          ),
          const SizedBox(height: 20),
          Text(
            exercise.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              if (exercise.muscleGroup != null)
                _buildInfoCapsule(
                  title: 'Target',
                  value: exercise.muscleGroup!,
                  icon: Icons.fitness_center_rounded,
                ),
              if (exercise.equipment != null)
                _buildInfoCapsule(
                  title: 'Equipment',
                  value: exercise.equipment!,
                  icon: Icons.settings_rounded,
                ),
              if (exercise.category != null)
                _buildInfoBadge(exercise.category!),
            ],
          ),
          const SizedBox(height: 24),
          const Divider(color: AppColors.borderMuted),
          const SizedBox(height: 16),
          const Text(
            'Instructions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            exercise.description?.isNotEmpty == true
                ? exercise.description!
                : 'No specific instructions provided for this exercise.',
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: exercise.description?.isNotEmpty == true
                  ? AppColors.foreground
                  : AppColors.mutedText,
              fontStyle: exercise.description?.isNotEmpty == true
                  ? FontStyle.normal
                  : FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCapsule({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: AppColors.mutedText,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 14, color: AppColors.foreground),
              const SizedBox(width: 6),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.foreground,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBadge(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(99),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        ),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════
  //  TAB 2 – History
  // ═══════════════════════════════════════════════════════════════

  Widget _buildHistoryTab(
    List<WorkoutSessionDto> sessions,
    String exerciseId,
  ) {
    if (sessions.isEmpty) {
      return _buildEmptyState(
        icon: Icons.history_rounded,
        message: 'No history for this exercise yet',
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: sessions.length,
      separatorBuilder: (_, _) => const SizedBox(height: 8),
      itemBuilder: (context, index) =>
          _buildHistoryCard(sessions[index], exerciseId),
    );
  }

  Widget _buildHistoryCard(WorkoutSessionDto session, String exerciseId) {
    final logs = _logsForSession(session, exerciseId);
    final date = _parseDateTime(session.startTime);
    final formattedDate = DateFormat('MMM d, yyyy').format(date);
    final formattedTime = DateFormat('h:mm a').format(date);
    final sessionName = session.name ?? 'Workout';

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderMuted),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      formattedDate,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.foreground,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '$sessionName \u00B7 $formattedTime',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.mutedText,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Text(
                  '${logs.length} ${logs.length == 1 ? 'set' : 'sets'}',
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ...logs.asMap().entries.map(
            (entry) => _buildSetRow(entry.key + 1, entry.value),
          ),
        ],
      ),
    );
  }

  Widget _buildSetRow(int setNumber, ExerciseLogDto log) {
    final weightStr = log.weight != null && log.weight! > 0
        ? (log.weight == log.weight!.floorToDouble()
            ? '${log.weight!.toInt()} kg'
            : '${log.weight!.toStringAsFixed(1)} kg')
        : '\u2014';
    final repsStr = log.reps != null && log.reps! > 0 ? '${log.reps}' : '\u2014';
    final volume = _volumeForSet(log);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.borderMuted.withValues(alpha: 0.5),
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: AppColors.mutedSurface,
              borderRadius: BorderRadius.circular(6),
            ),
            alignment: Alignment.center,
            child: Text(
              '$setNumber',
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.mutedText,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              weightStr,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.foreground,
              ),
            ),
          ),
          Expanded(
            child: Text(
              '$repsStr reps',
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.foreground,
              ),
            ),
          ),
          if (volume > 0)
            Text(
              '${volume.toStringAsFixed(0)} kg',
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.mutedText,
              ),
            ),
        ],
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════
  //  TAB 3 – Charts (uses backend stats volume data)
  // ═══════════════════════════════════════════════════════════════

  Widget _buildChartsTab(List<ExerciseStatPoint> volumeHistory) {
    if (volumeHistory.length < 2) {
      return _buildEmptyState(
        icon: Icons.show_chart_rounded,
        message: volumeHistory.isEmpty
            ? 'No volume data for this exercise yet.'
            : 'At least 2 data points needed for a chart.\nComplete more sessions to see your progress.',
      );
    }

    final points = volumeHistory;
    final maxY =
        points.fold<double>(0, (max, p) => p.value > max ? p.value : max);
    final spots = points.asMap().entries.map((entry) {
      return FlSpot(entry.key.toDouble(), entry.value.value);
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Volume Progression',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Total volume (kg) per session',
            style: TextStyle(fontSize: 12, color: AppColors.mutedText),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 220,
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
                      show: points.length <= 20,
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(radius: 3);
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
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28,
                      interval: (points.length / 5)
                          .ceilToDouble()
                          .clamp(1, double.infinity),
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        if (index >= 0 && index < points.length) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              DateFormat('M/d').format(points[index].date),
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
                      reservedSize: 44,
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
                  horizontalInterval: (maxY / 4).clamp(1, double.infinity),
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
                        final point = points[spot.spotIndex];
                        return LineTooltipItem(
                          '${DateFormat('MMM d').format(point.date)}\n${spot.y.toStringAsFixed(0)} kg',
                          const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
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
    );
  }

  // ═══════════════════════════════════════════════════════════════
  //  TAB 4 – Records (uses backend stats data)
  // ═══════════════════════════════════════════════════════════════

  Widget _buildRecordsTab(
    ExerciseDetailLoaded loaded,
    String exerciseId,
  ) {
    final sessions = _sessionsWithExercise(loaded.sessions, exerciseId);
    final est1rm = _bestValue(loaded.e1rmHistory);
    final maxWeight = _bestValue(loaded.bestSetVolumeHistory);
    final maxVolume = _bestValue(loaded.volumeHistory);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Personal Records',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'All-time best performances',
            style: TextStyle(fontSize: 12, color: AppColors.mutedText),
          ),
          const SizedBox(height: 20),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.1,
            children: [
              _buildRecordCard(
                icon: Icons.trending_up_rounded,
                label: 'Est. 1RM',
                value:
                    est1rm != null ? '${est1rm.value.toStringAsFixed(1)} kg' : '\u2014',
                color: const Color(0xFF007AFF),
              ),
              _buildRecordCard(
                icon: Icons.monitor_weight_outlined,
                label: 'Max Weight',
                value: maxWeight != null
                    ? '${maxWeight.value.toStringAsFixed(1)} kg'
                    : '\u2014',
                color: Colors.orange,
              ),
              _buildRecordCard(
                icon: Icons.height_rounded,
                label: 'Max Volume',
                value: maxVolume != null
                    ? '${maxVolume.value.toStringAsFixed(0)} kg'
                    : '\u2014',
                color: Colors.green,
              ),
              _buildRecordCard(
                icon: Icons.fitness_center_rounded,
                label: 'Sessions',
                value: '${sessions.length}',
                color: const Color(0xFF8E8E93),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRecordCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderMuted),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 28, color: color),
          const SizedBox(height: 10),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.mutedText,
            ),
          ),
        ],
      ),
    );
  }

  // ── Shared ──

  Widget _buildEmptyState({
    required IconData icon,
    required String message,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 64,
              color: AppColors.mutedText.withValues(alpha: 0.3),
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Helpers ──

  List<WorkoutSessionDto> _sessionsWithExercise(
    List<WorkoutSessionDto> sessions,
    String exerciseId,
  ) {
    return sessions.where((s) {
      final logs = s.exerciseLogs ?? [];
      return logs.any((l) => l.exerciseId == exerciseId);
    }).toList();
  }

  List<ExerciseLogDto> _logsForSession(
    WorkoutSessionDto session,
    String exerciseId,
  ) {
    return (session.exerciseLogs ?? [])
        .where((l) => l.exerciseId == exerciseId)
        .toList();
  }

  double _volumeForSet(ExerciseLogDto log) {
    return (log.weight ?? 0) * (log.reps ?? 0);
  }

  DateTime _parseDateTime(String iso) {
    return DateTime.tryParse(iso) ?? DateTime.now();
  }

  /// Return the stat point with the highest value (used for records).
  ExerciseStatPoint? _bestValue(List<ExerciseStatPoint> points) {
    if (points.isEmpty) return null;
    return points.fold<ExerciseStatPoint>(
      points.first,
      (best, p) => p.value > best.value ? p : best,
    );
  }
}
