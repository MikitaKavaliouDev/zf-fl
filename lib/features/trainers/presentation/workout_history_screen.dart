import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/error_widget.dart';
import '../cubit/workout_history_cubit.dart';
import '../cubit/workout_history_state.dart';
import '../data/models/workout_session_dto.dart';

class WorkoutHistoryScreen extends StatefulWidget {
  final bool showAppBar;

  const WorkoutHistoryScreen({super.key, this.showAppBar = false});

  @override
  State<WorkoutHistoryScreen> createState() => _WorkoutHistoryScreenState();
}

class _WorkoutHistoryScreenState extends State<WorkoutHistoryScreen> {
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();
  final _collapsedDates = <DateTime>{};
  final _searchFocusNode = FocusNode();
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    _searchFocusNode.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<WorkoutHistoryCubit>().loadMore();
    }
  }

  void _onSearchChanged(String value) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      context.read<WorkoutHistoryCubit>().setSearchQuery(value);
    });
  }

  void _clearSearch() {
    _searchController.clear();
    context.read<WorkoutHistoryCubit>().setSearchQuery('');
    _searchFocusNode.unfocus();
  }

  // ── Filter helpers ──

  List<WorkoutSessionDto> _filterSessions(
    List<WorkoutSessionDto> sessions, {
    required String query,
    required DateTime? selectedDate,
  }) {
    var filtered = sessions;
    if (selectedDate != null) {
      filtered = filtered.where((s) {
        final dt = DateTime.tryParse(s.startTime);
        if (dt == null) return false;
        return dt.year == selectedDate.year &&
            dt.month == selectedDate.month &&
            dt.day == selectedDate.day;
      }).toList();
    }
    if (query.isNotEmpty) {
      final q = query.toLowerCase();
      filtered = filtered.where((s) {
        if (s.name?.toLowerCase().contains(q) == true) return true;
        if (s.notes?.toLowerCase().contains(q) == true) return true;
        if (s.exerciseLogs != null) {
          for (final log in s.exerciseLogs!) {
            if (log.exercise?.name.toLowerCase().contains(q) == true) {
              return true;
            }
            if (log.notes?.toLowerCase().contains(q) == true) return true;
          }
        }
        return false;
      }).toList();
    }
    return filtered;
  }

  int _thisWeekCount(List<WorkoutSessionDto> sessions) {
    final now = DateTime.now();
    final weekday = now.weekday;
    final weekStart = now.subtract(Duration(days: weekday - 1));
    final weekStartDay = DateTime(weekStart.year, weekStart.month, weekStart.day);
    final weekEndDay = weekStartDay.add(const Duration(days: 7));
    return sessions.where((s) {
      final dt = DateTime.tryParse(s.startTime);
      if (dt == null) return false;
      return !dt.isBefore(weekStartDay) && dt.isBefore(weekEndDay);
    }).length;
  }

  // ── Grouping ──

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

  // ── Date helpers ──

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
    return DateFormat('h:mm a').format(dt);
  }

  String _formatDateLabel(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final target = DateTime(date.year, date.month, date.day);
    final diff = target.difference(today).inDays;

    if (diff == 0) return 'Today';
    if (diff == -1) return 'Yesterday';
    return DateFormat('EEE, MMM d').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<WorkoutHistoryCubit>()..loadHistory(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: widget.showAppBar
            ? AppBar(
                backgroundColor: AppColors.background,
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_rounded,
                      color: AppColors.foreground),
                  onPressed: () => context.pop(),
                ),
                title: const Text(
                  'Workout History',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: AppColors.foreground,
                  ),
                ),
              )
            : null,
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
              WorkoutHistoryLoaded(
                :final sessions,
                :final hasMore,
                :final isLoadingMore,
                :final isRefreshing,
                :final searchQuery,
                :final selectedDate,
              ) =>
                _buildLoaded(
                  context,
                  sessions,
                  hasMore,
                  isLoadingMore,
                  isRefreshing,
                  searchQuery,
                  selectedDate,
                ),
              WorkoutHistoryError(:final message) =>
                _buildError(context, message),
            };
          },
        ),
      ),
    );
  }

  Widget _buildLoaded(
    BuildContext context,
    List<WorkoutSessionDto> allSessions,
    bool hasMore,
    bool isLoadingMore,
    bool isRefreshing,
    String searchQuery,
    DateTime? selectedDate,
  ) {
    final filteredSessions = _filterSessions(
      allSessions,
      query: searchQuery,
      selectedDate: selectedDate,
    );

    if (allSessions.isEmpty) {
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

    final grouped = _groupByDate(filteredSessions);
    final sortedDates = grouped.keys.toList()..sort((a, b) => b.compareTo(a));

    return RefreshIndicator(
      onRefresh: () => context.read<WorkoutHistoryCubit>().refresh(),
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification && !hasMore) {
            // prevent unnecessary rebuilds
          }
          return false;
        },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            // ── Header ──
            SliverToBoxAdapter(
              child: _buildHeader(context, selectedDate, allSessions),
            ),
            // ── This Week summary card ──
            if (searchQuery.isEmpty && selectedDate == null)
              SliverToBoxAdapter(
                child: _buildThisWeekCard(context, allSessions),
              ),
            // ── Search bar ──
            SliverToBoxAdapter(
              child: _buildSearchBar(context, searchQuery),
            ),
            // ── Refreshing indicator ──
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
            // ── Empty filtered state ──
            if (filteredSessions.isEmpty && allSessions.isNotEmpty)
              SliverFillRemaining(
                child: _buildEmptySearch(context),
              ),
            // ── Date-grouped sessions ──
            if (filteredSessions.isNotEmpty)
              ...sortedDates.expand((date) {
                final dateSessions = grouped[date]!;
                final isCollapsed = _collapsedDates.contains(date);
                return [
                  SliverToBoxAdapter(
                    child: _buildDateHeader(context, date, dateSessions, isCollapsed),
                  ),
                  if (!isCollapsed)
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final session = dateSessions[index];
                          return _buildSessionCard(context, session);
                        },
                        childCount: dateSessions.length,
                      ),
                    ),
                ];
              }),
            // ── Load more ──
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

  // ── Header ──

  Widget _buildHeader(
    BuildContext context,
    DateTime? selectedDate,
    List<WorkoutSessionDto> allSessions,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      child: Row(
        children: [
          const Text(
            'Workouts',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const Spacer(),
          // Calendar filter button
          if (selectedDate != null) ...[
            GestureDetector(
              onTap: () => context.read<WorkoutHistoryCubit>().clearSelectedDate(),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Text(
                  DateFormat('MMM d').format(selectedDate),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
          ],
          // Calendar button
          IconButton(
            icon: const Icon(Icons.calendar_month_outlined),
            color: AppColors.foreground,
            onPressed: () => _showCalendarPicker(context),
          ),
          // Templates library button
          IconButton(
            icon: const Icon(Icons.dashboard_customize_outlined),
            color: AppColors.foreground,
            onPressed: () => context.push('/home/templates-library'),
          ),
          // Routine builder button
          IconButton(
            icon: const Icon(Icons.assignment_outlined),
            color: AppColors.foreground,
            onPressed: () => context.push('/home/routine-builder'),
          ),
        ],
      ),
    );
  }

  // ── This Week card ──

  Widget _buildThisWeekCard(BuildContext context, List<WorkoutSessionDto> allSessions) {
    final weekCount = _thisWeekCount(allSessions);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.borderMuted),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'THIS WEEK',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mutedText,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$weekCount Workout${weekCount == 1 ? '' : 's'} Done',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.foreground,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.bar_chart_rounded,
                color: AppColors.primary,
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Search bar ──

  Widget _buildSearchBar(BuildContext context, String searchQuery) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        controller: _searchController,
        focusNode: _searchFocusNode,
        onChanged: _onSearchChanged,
        decoration: InputDecoration(
          hintText: 'Search workouts...',
          prefixIcon: const Icon(
            Icons.search_rounded,
            size: 20,
            color: AppColors.mutedText,
          ),
          suffixIcon: searchQuery.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.close_rounded, size: 18),
                  onPressed: _clearSearch,
                  color: AppColors.mutedText,
                )
              : null,
          filled: true,
          fillColor: AppColors.mutedSurface,
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.borderMuted),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.borderMuted),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.borderActive, width: 2),
          ),
        ),
      ),
    );
  }

  // ── Date header with collapse/expand ──

  Widget _buildDateHeader(
    BuildContext context,
    DateTime date,
    List<WorkoutSessionDto> sessions,
    bool isCollapsed,
  ) {
    final dateLabel = _formatDateLabel(date);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isCollapsed) {
            _collapsedDates.remove(date);
          } else {
            _collapsedDates.add(date);
          }
        });
      },
      child: Container(
        color: isCollapsed ? Colors.green.withValues(alpha: 0.06) : null,
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
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
            const Spacer(),
            AnimatedRotation(
              turns: isCollapsed ? -0.25 : 0,
              duration: const Duration(milliseconds: 200),
              child: const Icon(
                Icons.chevron_right_rounded,
                size: 20,
                color: AppColors.mutedText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Session card ──

  Widget _buildSessionCard(BuildContext context, WorkoutSessionDto session) {
    final startTime = _parseDateTime(session.startTime);
    final endTime = session.endTime != null
        ? _parseDateTime(session.endTime!)
        : null;

    final durationStr = _computeDuration(startTime, endTime);
    final timeRangeStr = _formatTimeRange(startTime, endTime);

    final logs = session.exerciseLogs ?? [];
    final exerciseCount = logs.map((l) => l.exerciseId).toSet().length;
    final setCount = logs.length;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: GestureDetector(
        onTap: () {
          context.go('/workout/history/${session.id}');
        },
        onLongPressStart: (details) {
          _showSessionContextMenu(context, details, session);
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

  void _showSessionContextMenu(
    BuildContext outerContext,
    LongPressStartDetails details,
    WorkoutSessionDto session,
  ) {
    final cubit = outerContext.read<WorkoutHistoryCubit>();
    showMenu<String>(
      context: outerContext,
      position: RelativeRect.fromLTRB(
        details.globalPosition.dx,
        details.globalPosition.dy,
        details.globalPosition.dx + 1,
        details.globalPosition.dy + 1,
      ),
      items: [
        const PopupMenuItem(
          value: 'delete',
          child: Row(
            children: [
              Icon(Icons.delete_outline_rounded, size: 18, color: Colors.redAccent),
              SizedBox(width: 10),
              Text('Delete Workout', style: TextStyle(color: Colors.redAccent)),
            ],
          ),
        ),
      ],
    ).then((value) {
      if (value == 'delete') {
        _confirmDeleteSession(cubit, session);
      }
    });
  }

  void _confirmDeleteSession(WorkoutHistoryCubit cubit, WorkoutSessionDto session) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.card,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: AppColors.borderMuted),
        ),
        title: const Text(
          'Delete Workout',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        content: Text(
          'Are you sure you want to delete "${session.name ?? 'Workout'}"? This action cannot be undone.',
          style: const TextStyle(fontSize: 14, color: AppColors.mutedText),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              cubit.deleteSession(session.id);
            },
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.redAccent),
            ),
          ),
        ],
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

  // ── Calendar picker ──

  Future<void> _showCalendarPicker(BuildContext outerContext) async {
    final cubit = outerContext.read<WorkoutHistoryCubit>();
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: outerContext,
      initialDate: now,
      firstDate: now.subtract(const Duration(days: 365)),
      lastDate: now,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              surface: AppColors.card,
              onSurface: AppColors.foreground,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      cubit.setSelectedDate(picked);
    }
  }

  // ── Empty / Error states ──

  Widget _buildError(BuildContext context, String message) {
    return ZiroErrorWidget(
      message: message,
      iconSize: 64,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      messageFontSize: 16,
      onRetry: () => context.read<WorkoutHistoryCubit>().loadHistory(),
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

  Widget _buildEmptySearch(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.search_off_rounded,
              size: 64,
              color: AppColors.mutedText,
            ),
            const SizedBox(height: 16),
            const Text(
              'No workouts found',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _searchController.text.isNotEmpty
                  ? 'No workouts matching "${_searchController.text}"'
                  : 'No workouts on this date.',
              style: const TextStyle(fontSize: 14, color: AppColors.mutedText),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
      