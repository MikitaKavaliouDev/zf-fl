import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/error_widget.dart';
import '../cubit/workout_session_cubit.dart';
import '../data/models/exercise_log_dto.dart';
import '../data/models/workout_session_dto.dart';

class CompletedSessionDetailScreen extends StatefulWidget {
  final String sessionId;

  const CompletedSessionDetailScreen({
    super.key,
    required this.sessionId,
  });

  @override
  State<CompletedSessionDetailScreen> createState() =>
      _CompletedSessionDetailScreenState();
}

class _CompletedSessionDetailScreenState
    extends State<CompletedSessionDetailScreen> {
  final WorkoutSessionCubit _cubit = getIt<WorkoutSessionCubit>();

  bool _isLoading = true;
  String? _error;
  WorkoutSessionDto? _session;
  List<ExerciseLogDto> _logs = [];

  @override
  void initState() {
    super.initState();
    _loadDetails();
  }

  Future<void> _loadDetails() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      final result = await _cubit.fetchSessionDetails(widget.sessionId);
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _session = result.session;
        _logs = result.logs;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _error = 'Failed to load session details.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded,
              color: AppColors.foreground),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Session Details',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: AppColors.foreground,
          ),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      );
    }

    if (_error != null) {
      return ZiroErrorWidget(
        message: _error!,
        iconSize: 64,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        messageFontSize: 16,
        onRetry: _loadDetails,
      );
    }

    if (_session == null) {
      return ZiroErrorWidget(
        message: 'Session not found.',
        iconSize: 64,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        messageFontSize: 16,
        onRetry: _loadDetails,
      );
    }

    return _buildContent(context, _session!, _logs);
  }

  Widget _buildContent(
      BuildContext context, WorkoutSessionDto session, List<ExerciseLogDto> logs) {
    final startTime = _parseDateTime(session.startTime);
    final endTime =
        session.endTime != null ? _parseDateTime(session.endTime!) : null;

    final durationStr = _computeDuration(startTime, endTime);
    final formattedDate = _formatDate(startTime);
    final timeRangeStr = _formatTimeRange(startTime, endTime);

    // Compute stats
    final totalSets = logs.length;
    final totalVolume = logs.fold<double>(
      0,
      (sum, log) => sum + ((log.weight ?? 0) * (log.reps ?? 0)),
    );

    // Group logs by exercise
    final grouped = <String, List<ExerciseLogDto>>{};
    final exerciseNames = <String, String>{};
    for (final log in logs) {
      grouped.putIfAbsent(log.exerciseId, () => []);
      grouped[log.exerciseId]!.add(log);
      if (log.exercise != null) {
        exerciseNames[log.exerciseId] = log.exercise!.name;
      }
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        children: [
          // Header with avatar
          _buildHeader(formattedDate, timeRangeStr),
          const SizedBox(height: 24),

          // Stats row
          _buildStatsRow(durationStr, totalVolume, totalSets),
          const SizedBox(height: 24),

          // Notes
          if (session.notes != null && session.notes!.isNotEmpty) ...[
            _buildNotes(session.notes!),
            const SizedBox(height: 24),
          ],

          const Divider(),

          // Exercise list
          ...grouped.entries.map(
            (entry) => _buildExerciseSection(
              exerciseNames[entry.key] ?? entry.key,
              entry.value,
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildHeader(String date, String timeRange) {
    return Column(
      children: [
        // Circle avatar with checkmark
        Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF007AFF), Color(0xFF7C3AED)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.check_rounded,
            color: Colors.white,
            size: 32,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          date,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.foreground,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          timeRange,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.mutedText,
          ),
        ),
      ],
    );
  }

  Widget _buildStatsRow(String? duration, double volume, int sets) {
    return Row(
      children: [
        Expanded(
            child: _buildStatCard(
                'Duration', duration ?? '—', Icons.timer_outlined, AppColors.primary)),
        const SizedBox(width: 8),
        Expanded(
          child: _buildStatCard(
            'Volume',
            volume > 0 ? '${volume.toStringAsFixed(0)} kg' : '—',
            Icons.monitor_weight_outlined,
            Colors.orange,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildStatCard(
            'Sets',
            '$sets',
            Icons.repeat_rounded,
            Colors.green,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(
      String label, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderMuted),
      ),
      child: Column(
        children: [
          Icon(icon, size: 22, color: color),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 2),
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

  Widget _buildNotes(String notes) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.notes_rounded, size: 16, color: AppColors.mutedText),
              SizedBox(width: 6),
              Text(
                'Notes',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mutedText,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            notes,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.foreground,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseSection(String name, List<ExerciseLogDto> logs) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Exercise name header
          Row(
            children: [
              Container(
                width: 4,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.foreground,
                ),
              ),
              const Spacer(),
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
          const SizedBox(height: 8),

          // Table header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.mutedSurface,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: [
                SizedBox(width: 28),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'WEIGHT',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: AppColors.mutedText,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'REPS',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: AppColors.mutedText,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'RPE',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: AppColors.mutedText,
                    ),
                  ),
                ),
                SizedBox(width: 32),
              ],
            ),
          ),

          // Set rows
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
            ? log.weight!.toInt().toString()
            : log.weight!.toStringAsFixed(1))
        : '—';
    final repsStr =
        log.reps != null && log.reps! > 0 ? log.reps.toString() : '—';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.borderMuted, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          // Set number badge
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: log.isCompleted
                  ? Colors.green.withValues(alpha: 0.15)
                  : AppColors.mutedSurface,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: Text(
              '$setNumber',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: log.isCompleted ? Colors.green : AppColors.mutedText,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              weightStr,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: AppColors.foreground,
              ),
            ),
          ),
          Expanded(
            child: Text(
              repsStr,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: AppColors.foreground,
              ),
            ),
          ),
          Expanded(
            child: _buildRpeBadge(log.rpe),
          ),
          // Completed indicator
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: log.isCompleted ? Colors.green : Colors.transparent,
              border: log.isCompleted
                  ? null
                  : Border.all(color: AppColors.borderMuted),
            ),
            child: log.isCompleted
                ? const Icon(Icons.check_rounded, size: 14, color: Colors.white)
                : null,
          ),
        ],
      ),
    );
  }

  Widget _buildRpeBadge(int? rpe) {
    if (rpe == null) {
      return const Text(
        '—',
        style: TextStyle(
          fontSize: 14,
          color: AppColors.mutedText,
        ),
      );
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(99),
      ),
      child: Text(
        '$rpe',
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ),
    );
  }

  // ── Date helpers ──

  DateTime _parseDateTime(String iso) {
    return DateTime.tryParse(iso) ?? DateTime.now();
  }

  String _computeDuration(DateTime start, DateTime? end) {
    if (end == null) return '';
    final diff = end.difference(start);
    if (diff.inHours > 0) {
      return '${diff.inHours}h ${diff.inMinutes.remainder(60)}m';
    }
    return '${diff.inMinutes}m';
  }

  String _formatDate(DateTime dt) {
    const weekdays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${weekdays[dt.weekday - 1]}, ${months[dt.month - 1]} ${dt.day}, ${dt.year}';
  }

  String _formatTimeRange(DateTime start, DateTime? end) {
    final startStr = _formatTime(start);
    if (end == null) return startStr;
    final endStr = _formatTime(end);
    return '$startStr - $endStr';
  }

  String _formatTime(DateTime dt) {
    final hour = dt.hour;
    final minute = dt.minute;
    final amPm = hour >= 12 ? 'PM' : 'AM';
    final h = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);
    final m = minute.toString().padLeft(2, '0');
    return '$h:$m $amPm';
  }
}
