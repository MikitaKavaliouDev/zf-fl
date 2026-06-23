import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_theme.dart';
import '../cubit/workout_history_cubit.dart';
import '../cubit/workout_history_state.dart';
import '../data/models/workout_session_dto.dart';
import 'completed_session_detail_screen.dart';


class WorkoutHistoryScreen extends StatefulWidget {
  const WorkoutHistoryScreen({super.key});

  @override
  State<WorkoutHistoryScreen> createState() => _WorkoutHistoryScreenState();
}

class _WorkoutHistoryScreenState extends State<WorkoutHistoryScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<WorkoutHistoryCubit>().loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<WorkoutHistoryCubit>()..loadHistory(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Workout History')),
        body: BlocConsumer<WorkoutHistoryCubit, WorkoutHistoryState>(
          listener: (context, state) {
            if (state is WorkoutHistoryError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }
          },
          builder: (context, state) {
            return switch (state) {
              WorkoutHistoryInitial() || WorkoutHistoryLoading() =>
                const Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                ),
              WorkoutHistoryLoaded(:final sessions, :final hasMore, :final isLoadingMore, :final isRefreshing) =>
                _buildLoaded(context, sessions, hasMore, isLoadingMore, isRefreshing),
              WorkoutHistoryError(:final message) => _buildError(context, message),
            };
          },
        ),
      ),
    );
  }

  Widget _buildLoaded(
    BuildContext context,
    List<WorkoutSessionDto> sessions,
    bool hasMore,
    bool isLoadingMore,
    bool isRefreshing,
  ) {
    if (sessions.isEmpty) {
      return RefreshIndicator(
        onRefresh: () => context.read<WorkoutHistoryCubit>().refresh(),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: _buildEmpty(context),
            ),
          ],
        ),
      );
    }

    final grouped = _groupByDate(sessions);
    final sortedDates = grouped.keys.toList()..sort((a, b) => b.compareTo(a));

    return RefreshIndicator(
      onRefresh: () => context.read<WorkoutHistoryCubit>().refresh(),
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification && !hasMore) {
            // no-op: just prevent unnecessary rebuilds
          }
          return false;
        },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            if (isRefreshing)
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ),
            for (final date in sortedDates) ...[
              SliverToBoxAdapter(
                child: _buildDateHeader(context, date, grouped[date]!),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final session = grouped[date]![index];
                    return _buildSessionCard(context, session);
                  },
                  childCount: grouped[date]!.length,
                ),
              ),
            ],
            if (isLoadingMore)
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 24),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildError(BuildContext context, String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              size: 64,
              color: AppColors.mutedText,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () =>
                  context.read<WorkoutHistoryCubit>().loadHistory(),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmpty(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.fitness_center_rounded,
              size: 80,
              color: AppColors.mutedText.withValues(alpha: 0.3),
            ),
            const SizedBox(height: 24),
            const Text(
              'No workouts yet',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Complete a workout to see it here.',
              style: TextStyle(fontSize: 14, color: AppColors.mutedText),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateHeader(
    BuildContext context,
    DateTime date,
    List<WorkoutSessionDto> sessions,
  ) {
    final now = DateTime.now();
    final isToday = date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
    final isYesterday = date.year == now.year &&
        date.month == now.month &&
        date.day == now.day - 1;

    String dateLabel;
    if (isToday) {
      dateLabel = 'Today';
    } else if (isYesterday) {
      dateLabel = 'Yesterday';
    } else {
      const weekdays = [
        'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'
      ];
      const months = [
        'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
      ];
      dateLabel =
          '${weekdays[date.weekday % 7]}, ${months[date.month - 1]} ${date.day}';
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
      child: Row(
        children: [
          Text(
            dateLabel,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: AppColors.mutedSurface,
              borderRadius: BorderRadius.circular(99),
            ),
            child: Text(
              '${sessions.length}',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.mutedText,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSessionCard(BuildContext context, WorkoutSessionDto session) {
    final startTime = _parseDateTime(session.startTime);
    final endTime = session.endTime != null
        ? _parseDateTime(session.endTime!)
        : null;

    final durationStr = _computeDuration(startTime, endTime);
    final timeRangeStr = _formatTimeRange(startTime, endTime);

    // Compute exercise/set counts from exerciseLogs
    final logs = session.exerciseLogs ?? [];
    final exerciseCount =
        logs.map((l) => l.exerciseId).toSet().length;
    final setCount = logs.length;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => CompletedSessionDetailScreen(
                sessionId: session.id,
              ),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.borderMuted),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title row
              Row(
                children: [
                  Expanded(
                    child: Text(
                      session.name ?? 'Workout',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.foreground,
                      ),
                    ),
                  ),
                  _buildStatusBadge('Completed'),
                ],
              ),
              const SizedBox(height: 8),

              // Date + time range
              Row(
                children: [
                  const Icon(Icons.schedule_rounded,
                      size: 14, color: AppColors.mutedText),
                  const SizedBox(width: 4),
                  Text(
                    timeRangeStr,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.mutedText,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Stats row
              Row(
                children: [
                  // Duration
                  if (durationStr != null) ...[
                    const Icon(Icons.timer_outlined,
                        size: 14, color: AppColors.primary),
                    const SizedBox(width: 4),
                    Text(
                      durationStr,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(width: 16),
                  ],
                  // Exercises
                  if (exerciseCount > 0) ...[
                    const Icon(Icons.fitness_center_rounded,
                        size: 14, color: AppColors.mutedText),
                    const SizedBox(width: 4),
                    Text(
                      '$exerciseCount ${exerciseCount == 1 ? 'exercise' : 'exercises'}',
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.mutedText,
                      ),
                    ),
                    const SizedBox(width: 16),
                  ],
                  // Sets
                  if (setCount > 0) ...[
                    const Icon(Icons.repeat_rounded,
                        size: 14, color: AppColors.mutedText),
                    const SizedBox(width: 4),
                    Text(
                      '$setCount ${setCount == 1 ? 'set' : 'sets'}',
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.mutedText,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.green.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(99),
      ),
      child: Text(
        status,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: Colors.green,
        ),
      ),
    );
  }

  // ── Date helpers ──

  Map<DateTime, List<WorkoutSessionDto>> _groupByDate(
    List<WorkoutSessionDto> sessions,
  ) {
    final map = <DateTime, List<WorkoutSessionDto>>{};
    for (final s in sessions) {
      final dt = _parseDateTime(s.startTime);
      final day = DateTime(dt.year, dt.month, dt.day);
      map.putIfAbsent(day, () => []);
      map[day]!.add(s);
    }
    return map;
  }

  DateTime _parseDateTime(String iso) {
    return DateTime.tryParse(iso) ?? DateTime.now();
  }

  String? _computeDuration(DateTime start, DateTime? end) {
    if (end == null) return null;
    final diff = end.difference(start);
    if (diff.inHours > 0) {
      return '${diff.inHours}h ${diff.inMinutes.remainder(60)}m';
    }
    return '${diff.inMinutes}m';
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
