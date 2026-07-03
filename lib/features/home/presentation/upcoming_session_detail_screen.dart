import 'package:add_2_calendar/add_2_calendar.dart' as cal;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/error_widget.dart';
import '../../notifications/presentation/widgets/ziro_sheet_header.dart';
import '../../trainers/cubit/workout_session_cubit.dart';
import '../../trainers/data/models/exercise_dto.dart';
import '../../trainers/data/models/exercise_log_dto.dart';
import '../../trainers/data/models/workout_session_dto.dart';

/// Detail view for an upcoming workout session — presented as a modal sheet.
///
/// Matches iOS `UpcomingSessionDetailView` behavior: loads session details
/// from the API, shows header info, exercises, and an "Add to Calendar" button.
class UpcomingSessionDetailScreen extends StatefulWidget {
  final String sessionId;

  const UpcomingSessionDetailScreen({
    super.key,
    required this.sessionId,
  });

  @override
  State<UpcomingSessionDetailScreen> createState() =>
      _UpcomingSessionDetailScreenState();
}

class _UpcomingSessionDetailScreenState
    extends State<UpcomingSessionDetailScreen> {
  final WorkoutSessionCubit _cubit = getIt<WorkoutSessionCubit>();

  bool _isLoading = true;
  String? _error;
  WorkoutSessionDto? _session;
  List<ExerciseLogDto> _logs = [];
  bool _addedToCalendar = false;

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
    return DraggableScrollableSheet(
      initialChildSize: 0.92,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              const ZiroSheetHeader(title: 'Session Details'),
              Expanded(
                child: _buildBody(scrollController),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBody(ScrollController scrollController) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      );
    }

    if (_error != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: ZiroErrorWidget(
          message: _error!,
          iconSize: 64,
          messageFontSize: 16,
          onRetry: _loadDetails,
        ),
      );
    }

    if (_session == null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: ZiroErrorWidget(
          message: 'Session not found.',
          iconSize: 64,
          messageFontSize: 16,
          onRetry: _loadDetails,
        ),
      );
    }

    return _buildContent(_session!, _logs, scrollController);
  }

  Widget _buildContent(
    WorkoutSessionDto session,
    List<ExerciseLogDto> logs,
    ScrollController scrollController,
  ) {
    // Parse dates
    final startTime = _parseDateTime(session.startTime);
    final endTime =
        session.endTime != null ? _parseDateTime(session.endTime!) : null;

    // Duration
    final durationStr = _computeDuration(startTime, endTime);
    final formattedDate = _formatDate(startTime);
    final formattedTime = endTime != null
        ? '${_formatTime(startTime)} – ${_formatTime(endTime)}'
        : _formatTime(startTime);

    // Group logs by exercise
    final grouped = <String, List<ExerciseLogDto>>{};
    final exerciseNames = <String, String>{};
    final exerciseDetails = <String, ExerciseDto?>{};
    for (final log in logs) {
      grouped.putIfAbsent(log.exerciseId, () => []);
      grouped[log.exerciseId]!.add(log);
      if (log.exercise != null) {
        exerciseNames[log.exerciseId] = log.exercise!.name;
        exerciseDetails[log.exerciseId] = log.exercise;
      }
    }

    return SingleChildScrollView(
      controller: scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header Card ──
          _buildHeaderCard(
            session.name ?? 'Workout Session',
            formattedDate,
            formattedTime,
            durationStr,
          ),
          const SizedBox(height: 24),

          // ── Exercises Section ──
          if (grouped.isNotEmpty) ...[
            const Text(
              'Exercises',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 12),
            ...grouped.entries.map(
              (entry) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _buildExerciseCard(
                  exerciseNames[entry.key] ?? entry.key,
                  entry.value,
                  exerciseDetails[entry.key],
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],

          // ── Add to Calendar ──
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _addedToCalendar
                  ? null
                  : () => _addToCalendar(session, formattedDate),
              icon: Icon(
                _addedToCalendar
                    ? Icons.check_circle_rounded
                    : Icons.calendar_today_rounded,
                size: 20,
              ),
              label: Text(
                _addedToCalendar ? 'Added to Calendar' : 'Add to My Calendar',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    _addedToCalendar ? Colors.green : AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildHeaderCard(
    String name,
    String date,
    String time,
    String duration,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderMuted),
      ),
      child: Row(
        children: [
          // Dumbbell icon
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.fitness_center_rounded,
              color: AppColors.primary,
              size: 26,
            ),
          ),
          const SizedBox(width: 14),
          // Text content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.foreground,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$date at $time',
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.mutedText,
                  ),
                ),
                if (duration.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      const Icon(
                        Icons.timer_outlined,
                        size: 13,
                        color: AppColors.mutedText,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        duration,
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.mutedText,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseCard(
    String name,
    List<ExerciseLogDto> logs,
    ExerciseDto? exercise,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderMuted),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Exercise name row
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.mutedSurface,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.fitness_center_rounded,
                  size: 18,
                  color: AppColors.mutedText,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.foreground,
                  ),
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

          // Set rows
          ...logs.asMap().entries.map(
            (entry) => _buildSetRow(entry.key + 1, entry.value),
          ),

          // Coaching video link
          if (exercise?.videoUrl != null && exercise!.videoUrl!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: InkWell(
                onTap: () {
                  // TODO: Open coaching video — use url_launcher or a video player
                },
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.red.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.play_circle_fill_rounded,
                        size: 16,
                        color: Colors.red,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Watch Coaching Video',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.red[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
        : null;
    final repsStr =
        log.reps != null && log.reps! > 0 ? log.reps.toString() : null;
    final hasMetrics = weightStr != null || repsStr != null;

    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Row(
        children: [
          // Set number
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
          const SizedBox(width: 10),
          // Weight + reps
          if (hasMetrics)
            Expanded(
              child: Text(
                [
              if (weightStr != null) '$weightStr kg',
              if (repsStr != null) '$repsStr reps',
                ].join(' × '),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.foreground,
                ),
              ),
            ),
          // Tempo
          if (log.tempo != null && log.tempo!.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.orange.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                log.tempo!,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ),
          // Notes
          if (log.notes != null && log.notes!.isNotEmpty)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  log.notes!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.mutedText,
                    fontStyle: FontStyle.italic,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
        ],
      ),
    );
  }

  // ── Calendar ──

  Future<void> _addToCalendar(WorkoutSessionDto session, String dateStr) async {
    final startTime = _parseDateTime(session.startTime);
    // Default duration: 1 hour if no end time
    final endTime = session.endTime != null
        ? _parseDateTime(session.endTime!)
        : startTime.add(const Duration(hours: 1));

    final event = cal.Event(
      title: session.name ?? 'Workout Session',
      description: 'ZIRO.FIT Workout Session',
      startDate: startTime,
      endDate: endTime,
      location: 'ZIRO.FIT',
    );

    try {
      await cal.Add2Calendar.addEvent2Cal(event);
      if (!mounted) return;
      setState(() {
        _addedToCalendar = true;
      });
    } catch (_) {
      // Calendar integration failure is non-blocking.
    }
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
    return DateFormat.yMMMd().format(dt);
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
