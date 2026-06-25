<response>
  <reasoning>
    The "Cancel" button on the "New Routine" screen (and other similar sub-screens) is failing because the sub-screens are being opened using `context.go` instead of `context.push` in the parent screen (`WorkoutHistoryScreen`, `NoRoutinePlaceholder`, and `QuickActionsRow`). When `context.go` is used, the navigation history is cleared, causing `Navigator.of(context).maybePop()` or `router.canPop()` to do nothing and leave the user stuck on the screen.

    To resolve this issue, I will do the following:
    1. Update the template library and routine builder button callbacks inside `lib/features/trainers/presentation/workout_history_screen.dart` to use `context.push` instead of `context.go`.
    2. Update the "Templates" action buttons inside `lib/features/home/presentation/widgets/no_routine_placeholder.dart` and `lib/features/home/presentation/widgets/quick_actions_row.dart` to use `context.push` instead of `context.go`.
    3. Update the `onCancel` callbacks inside `lib/features/home/presentation/routine_builder_screen.dart` and `lib/features/home/presentation/create_template_screen.dart` to check `router.canPop() ? router.pop() : context.go('/')` to gracefully exit the screen.
    4. Safe-guard the on-close callback inside `lib/features/home/presentation/routine_scheduler_screen.dart` and `lib/features/home/presentation/template_picker_sheet.dart` with a similar safety fallback.
    5. Update `TASKS.md` with these changes.
  </reasoning>
  <modifications>
    <file path="lib/features/trainers/presentation/workout_history_screen.dart">
      <![CDATA[
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_theme.dart';
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
      ]]>
    </file>
    <file path="lib/features/home/presentation/widgets/quick_actions_row.dart">
      <![CDATA[
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';

/// Quick actions row — two side-by-side cards for Quick Start and Templates.
///
/// Matches iOS Quick Actions — PersonalHomeView.swift lines 833-883.
class QuickActionsRow extends StatelessWidget {
  const QuickActionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.zero,
          child: Text(
            'Actions',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.mutedText,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _QuickActionCard(
                onTap: () => context.go('/workout'),
                icon: Icons.bolt_rounded,
                label: 'Quick Start',
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _QuickActionCard(
                onTap: () => context.push('/home/templates-library'),
                icon: Icons.grid_view_rounded,
                label: 'Templates',
                color: const Color(0xFF8B5CF6),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// A tall card button used inside [QuickActionsRow].
class _QuickActionCard extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String label;
  final Color color;

  const _QuickActionCard({
    required this.onTap,
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          color: AppColors.mutedSurface,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 24, color: color),
              const SizedBox(height: 6),
              Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
      ]]>
    </file>
    <file path="lib/features/home/presentation/widgets/no_routine_placeholder.dart">
      <![CDATA[
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';

/// Placeholder shown when a client has a trainer but no active routine.
///
/// Matches iOS No Routine Assigned — PersonalHomeView.swift lines 561-615.
class NoRoutinePlaceholder extends StatelessWidget {
  const NoRoutinePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon + text
          const Row(
            children: [
              Icon(
                Icons.assignment_rounded,
                size: 28,
                color: Color(0xFFF97316),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'No Routine Assigned',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.foreground,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Awaiting your coach...',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.mutedText,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Action buttons
          Row(
            children: [
              Expanded(
                child: _ActionButton(
                  onTap: () => context.go('/workout'),
                  label: 'Quick Start',
                  icon: Icons.bolt_rounded,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _ActionButton(
                  onTap: () => context.push('/home/templates-library'),
                  label: 'Templates',
                  icon: Icons.grid_view_rounded,
                  color: const Color(0xFF8B5CF6),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Small rounded button used inside [NoRoutinePlaceholder].
class _ActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final IconData icon;
  final Color color;

  const _ActionButton({
    required this.onTap,
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 14, color: color),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
      ]]>
    </file>
    <file path="lib/features/home/presentation/routine_builder_screen.dart">
      <![CDATA[
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../../notifications/presentation/widgets/ziro_sheet_header.dart';
import '../../trainers/data/models/template_dto.dart';
import '../cubit/home_cubit.dart';
import '../cubit/program_cubit.dart';
import '../data/models/program_dto.dart';
import 'template_picker_sheet.dart';

/// A slot holding a template together with an editable day label.
///
/// Matches iOS `RoutineTemplateSlot` — RoutineBuilderView.swift line 3-7.
class _RoutineSlot {
  final TemplateDto template;
  String label;

  _RoutineSlot({required this.template, required this.label});
}

/// Full-screen routine builder for creating or editing workout programs.
///
/// Matches iOS `RoutineBuilderView` — RoutineBuilderView.swift lines 9-205.
class RoutineBuilderScreen extends StatefulWidget {
  /// If non-null, we're editing an existing program.
  final ProgramDto? existingProgram;

  const RoutineBuilderScreen({super.key, this.existingProgram});

  @override
  State<RoutineBuilderScreen> createState() => _RoutineBuilderScreenState();
}

class _RoutineBuilderScreenState extends State<RoutineBuilderScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late List<_RoutineSlot> _slots;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    final program = widget.existingProgram;
    _nameController = TextEditingController(text: program?.name ?? '');
    _descriptionController =
        TextEditingController(text: program?.description ?? '');
    _slots = (program?.templates ?? []).asMap().entries.map((e) {
      final index = e.key;
      final template = e.value;
      final labels = program?.templateLabels ?? [];
      return _RoutineSlot(
        template: template,
        label: index < labels.length ? labels[index] : 'Day ${index + 1}',
      );
    }).toList();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Main scrollable content with reorderable list
          Padding(
            padding: EdgeInsets.only(top: topPadding + 80),
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoSection(),
                  const SizedBox(height: 24),
                  _buildSlotsSection(),
                ],
              ),
            ),
          ),

          // Fixed bottom "Add Workout" button
          if (_slots.isNotEmpty)
            Positioned(
              left: 16,
              right: 16,
              bottom: 32,
              child: SafeArea(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _openTemplatePicker,
                    icon: const Icon(Icons.add_circle_outline_rounded,
                        size: 20),
                    label: const Text('Add Workout'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 4,
                      shadowColor: AppColors.primary.withValues(alpha: 0.3),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),

          // Floating header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ZiroSheetHeader(
              title: widget.existingProgram != null
                  ? 'Edit Routine'
                  : 'New Routine',
              showCancel: true,
              showDone: true,
              onCancel: () {
                final router = GoRouter.of(context);
                if (router.canPop()) {
                  router.pop();
                } else {
                  context.go('/');
                }
              },
              onDone: _save,
              leadingText: 'Cancel',
              trailingText: 'Save',
            ),
          ),

          // Saving overlay
          if (_isSaving)
            Container(
              color: Colors.black26,
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              hintText: 'Routine Name',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16),
            ),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.foreground,
            ),
          ),
          const Divider(height: 1, color: AppColors.borderMuted),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(
              hintText: 'Description (Optional)',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16),
            ),
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.foreground,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSlotsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const Text(
                'Workout Slots',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.foreground,
                ),
              ),
              const Spacer(),
              Text(
                '${_slots.length} Sessions',
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.mutedText,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        // Reorderable slot list or empty state
        if (_slots.isEmpty)
          _buildEmptyState()
        else
          // Use ReorderableListView.builder for drag-to-reorder
          ReorderableListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            buildDefaultDragHandles: false,
            itemCount: _slots.length,
            onReorderItem: _onReorder,
            proxyDecorator: (child, index, animation) {
              return AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.transparent,
                    child: child,
                  );
                },
                child: child,
              );
            },
            itemBuilder: (context, index) =>
                _buildSlotCard(index, _slots[index]),
          ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: _openTemplatePicker,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.3),
              width: 2,
            ),
          ),
          child: Column(
            children: [
              Icon(
                Icons.add_circle_rounded,
                size: 32,
                color: AppColors.primary.withValues(alpha: 0.7),
              ),
              const SizedBox(height: 8),
              Text(
                'Add your first workout template',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary.withValues(alpha: 0.8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSlotCard(int index, _RoutineSlot slot) {
    // Key is required by ReorderableListView for stable item identity.
    // Using ValueKey(slot.template.id) ensures Flutter tracks items through reorder.
    return Container(
      key: ValueKey(slot.template.id),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Slot header: drag handle + label + delete
          Row(
            children: [
              // Drag handle — triggers ReorderableListView reorder
              GestureDetector(
                onLongPressStart: (_) {
                  // ReorderableListView detects long-press on drag handle.
                  // We wrap with LongPressDraggable via default behavior.
                },
                child: const Icon(
                  Icons.drag_handle_rounded,
                  size: 20,
                  color: AppColors.mutedText,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SizedBox(
                  width: 120,
                  child: TextField(
                    controller: TextEditingController(text: slot.label),
                    onChanged: (v) => slot.label = v,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => setState(() => _slots.removeAt(index)),
                child: const Icon(
                  Icons.delete_rounded,
                  size: 20,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Template info
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      slot.template.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.foreground,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${slot.template.exercises.length} Exercises',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.mutedText,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      // newIndex accounts for the removed item — no manual adjustment needed.
      final slot = _slots.removeAt(oldIndex);
      _slots.insert(newIndex, slot);
    });
  }

  void _openTemplatePicker() async {
    final result = await showModalBottomSheet<TemplateDto>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: context.read<ProgramCubit>(),
        child: TemplatePickerSheet(
          existingTemplateIds: _slots.map((s) => s.template.id).toSet(),
        ),
      ),
    );

    if (result != null && mounted) {
      setState(() {
        _slots.add(_RoutineSlot(
          template: result,
          label: 'Day ${_slots.length + 1}',
        ));
      });
    }
  }

  Future<void> _save() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a routine name')),
      );
      return;
    }

    setState(() => _isSaving = true);

    final cubit = context.read<ProgramCubit>();

    if (widget.existingProgram != null) {
      // The client API does not support updating programs — show a message.
      if (mounted) {
        setState(() => _isSaving = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Editing is only available through your trainer.'),
          ),
        );
      }
      return;
    }

    // Create the program via API (name + description only).
    final result = await cubit.createProgram(
      name: name,
      description: _descriptionController.text.trim().nullIfEmpty,
    );

    if (result == null || !mounted) {
      setState(() => _isSaving = false);
      return;
    }

    // Create ALL templates on the backend with inline exercises (single API call each).
    for (var i = 0; i < _slots.length; i++) {
      final slot = _slots[i];

      // Serialize exercises for the API request.
      final exercises = slot.template.exercises.map((e) => {
            'exerciseId': e.exerciseId ?? e.exercise?.id ?? '',
            if (e.targetReps != null) 'targetReps': e.targetReps,
            if (e.targetSets != null) 'targetSets': e.targetSets,
            if (e.durationSeconds != null) 'durationSeconds': e.durationSeconds,
            if (e.notes != null) 'notes': e.notes,
            'order': e.order,
          }).toList();

      final created = await cubit.createTemplate(
        programId: result.id,
        name: slot.template.name,
        description: slot.template.description,
        exercises: exercises.isNotEmpty ? exercises : null,
      );

      if (created != null) {
        _slots[i] = _RoutineSlot(template: created, label: slot.label);
      }
    }

    if (mounted) {
      setState(() => _isSaving = false);
      context.read<HomeCubit>().refresh();
      Navigator.of(context).maybePop();
    }
  }
}

extension on String {
  String? get nullIfEmpty => isEmpty ? null : this;
}
      ]]>
    </file>
    <file path="lib/features/home/presentation/templates_library_screen.dart">
      <![CDATA[
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../../notifications/presentation/widgets/ziro_sheet_header.dart';
import '../../trainers/data/models/template_dto.dart';
import '../cubit/program_cubit.dart';
import '../cubit/program_state.dart';
import 'create_template_screen.dart';

/// Templates Library screen — searchable list of all templates.
///
/// Matches iOS `WorkoutTemplatesView` — WorkoutTemplatesView.swift lines 1-264.
class TemplatesLibraryScreen extends StatefulWidget {
  const TemplatesLibraryScreen({super.key});

  @override
  State<TemplatesLibraryScreen> createState() => _TemplatesLibraryScreenState();
}

class _TemplatesLibraryScreenState extends State<TemplatesLibraryScreen> {
  final _searchController = TextEditingController();
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    context.read<ProgramCubit>().loadTemplates();
  }

  Future<void> _showCreateTemplate() async {
    final result = await Navigator.of(context).push<TemplateDto>(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => const CreateTemplateView(),
      ),
    );
    if (result != null && mounted) {
      // Persist the newly created local template before refreshing the list.
      context.read<ProgramCubit>().saveLocalTemplate(result);
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: topPadding + 80),
              // Search bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.mutedSurface.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (v) => setState(() => _searchText = v),
                    decoration: const InputDecoration(
                      hintText: 'Search templates...',
                      prefixIcon: Icon(Icons.search_rounded,
                          size: 20, color: AppColors.mutedText),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.foreground,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Content
              Expanded(
                child: BlocBuilder<ProgramCubit, ProgramState>(
                  builder: (context, state) {
                    return switch (state) {
                      ProgramInitial() || ProgramLoading() => const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          color: AppColors.primary,
                        ),
                      ),
                      ProgramError(:final message) => _buildError(message),
                      ProgramLoaded(:final templates) =>
                        _buildTemplateList(templates),
                    };
                  },
                ),
              ),
            ],
          ),

          // Header overlay
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ZiroSheetHeader(
              title: 'Templates Library',
              showCancel: true,
              onCancel: () {
                final router = GoRouter.of(context);
                if (router.canPop()) {
                  router.pop();
                } else {
                  context.go('/');
                }
              },
              leadingText: 'Back',
              showDone: true,
              onDone: () {
                final router = GoRouter.of(context);
                if (router.canPop()) {
                  router.pop();
                } else {
                  context.go('/');
                }
              },
              trailingText: 'Done',
              onTrailingIconTap: _showCreateTemplate,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildError(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.cloud_off_rounded,
                size: 48, color: AppColors.mutedText),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.read<ProgramCubit>().loadTemplates(),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTemplateList(List<TemplateDto> templates) {
    final filtered = _searchText.isEmpty
        ? templates
        : templates.where((t) {
            final q = _searchText.toLowerCase();
            return t.name.toLowerCase().contains(q) ||
                (t.description?.toLowerCase().contains(q) ?? false);
          }).toList();

    if (filtered.isEmpty) {
      return _buildEmptyState(templates.isEmpty);
    }

    return RefreshIndicator(
      onRefresh: () => context.read<ProgramCubit>().loadTemplates(),
      color: AppColors.primary,
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
        itemCount: filtered.length,
        itemBuilder: (context, index) {
          final template = filtered[index];
          return _TemplateLibraryRow(
            template: template,
            onPlay: () {
              // Start a workout session with this template
              context.go('/workout');
            },
            onTap: () {
              // Navigate to template detail (matches iOS tap → TemplateDetailView)
              context.push('/home/template-detail', extra: template);
            },
          );
        },
      ),
    );
  }

  Widget _buildEmptyState(bool noTemplatesAtAll) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.grid_view_rounded,
              size: 60,
              color: AppColors.mutedText.withValues(alpha: 0.3),
            ),
            const SizedBox(height: 20),
            const Text(
              'No Templates Yet',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Create a routine to get started.',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
              ),
            ),
            if (noTemplatesAtAll) ...[
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => context.go('/home/routine-builder'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Create New Routine'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// A single template row in the templates library list.
class _TemplateLibraryRow extends StatelessWidget {
  final TemplateDto template;
  final VoidCallback onPlay;
  final VoidCallback? onTap;

  const _TemplateLibraryRow({
    required this.template,
    required this.onPlay,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.mutedSurface.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  template.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.foreground,
                  ),
                ),
                if (template.description != null &&
                    template.description!.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    template.description!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.mutedText,
                    ),
                  ),
                ],
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${template.exercises.length} Exercises',
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Play button
          GestureDetector(
            onTap: onPlay,
            child: Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.play_arrow_rounded,
                size: 22,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
      ]]>
    </file>
    <file path="lib/features/home/presentation/routine_scheduler_screen.dart">
      <![CDATA[
import 'package:add_2_calendar/add_2_calendar.dart' as cal;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_theme.dart';
import '../../notifications/presentation/widgets/ziro_sheet_header.dart';
import '../data/models/program_dto.dart';

/// Full-screen scheduler for setting up a routine's calendar schedule.
///
/// Matches iOS `RoutineSchedulerView` — RoutineSchedulerView.swift lines 1-171.
/// Also matches iOS PlanSchedulerView — WorkoutTemplatesView.swift lines 328-474.
///
/// Since the backend does not have a POST /api/client/programs/:id/schedule
/// endpoint, scheduling adds events to the device calendar and records the
/// schedule locally. The program's `isScheduled`, `scheduledStartDate`,
/// and `scheduleFrequency` fields are stored in-memory.
class RoutineSchedulerScreen extends StatefulWidget {
  final ProgramDto program;

  const RoutineSchedulerScreen({super.key, required this.program});

  @override
  State<_RoutineSchedulerScreenState> createState() => _RoutineSchedulerScreenState();
}

class _RoutineSchedulerScreenState extends State<RoutineSchedulerScreen> {
  late DateTime _startDate;
  String _frequency = 'Sequential';
  int _weeks = 4;
  bool _isScheduling = false;
  bool _isSuccess = false;

  final _frequencies = ['Sequential', 'Daily'];

  @override
  void initState() {
    super.initState();
    _startDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: _isSuccess ? _buildSuccessView() : _buildSchedulerView(),
    );
  }

  Widget _buildSuccessView() {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle_rounded,
                  size: 48,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Routine Scheduled!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                '${widget.program.name} has been scheduled for $_weeks weeks.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.mutedText,
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(99),
                  ),
                ),
                child: const Text('Done'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSchedulerView() {
    final topPadding = MediaQuery.of(context).padding.top;
    return Stack(
      children: [
        // Scrollable content
        Padding(
          padding: EdgeInsets.only(top: topPadding + 80),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRoutineInfo(),
                const SizedBox(height: 20),
                _buildConfiguration(),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),

        // Header
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: ZiroSheetHeader(
            title: 'Schedule Routine',
            onTrailingIconTap: () {
              final router = GoRouter.of(context);
              if (router.canPop()) {
                router.pop();
              } else {
                context.go('/');
              }
            },
          ),
        ),

        // Schedule button at bottom
        Positioned(
          left: 16,
          right: 16,
          bottom: 32,
          child: SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isScheduling ? null : _schedule,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: _isScheduling
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text('Schedule Routine'),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRoutineInfo() {
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
          Text(
            widget.program.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${widget.program.templates.length} Sessions in sequence',
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.mutedText,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConfiguration() {
    return Column(
      children: [
        // Start Date
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.mutedSurface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const Text(
                'Start Date',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.foreground,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: _pickDate,
                child: Text(
                  DateFormat('MMM d, yyyy').format(_startDate),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Frequency
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.mutedSurface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Frequency',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 12),
              SegmentedButton<String>(
                segments: _frequencies
                    .map((f) => ButtonSegment(value: f, label: Text(f)))
                    .toList(),
                selected: {_frequency},
                onSelectionChanged: (v) =>
                    setState(() => _frequency = v.first),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith((states) {
                    if (states.contains(WidgetState.selected)) {
                      return AppColors.primary;
                    }
                    return Colors.transparent;
                  }),
                  foregroundColor: WidgetStateProperty.resolveWith((states) {
                    if (states.contains(WidgetState.selected)) {
                      return Colors.white;
                    }
                    return AppColors.foreground;
                  }),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                _frequency == 'Sequential'
                    ? 'Workouts every other day (e.g. Mon, Wed, Fri, Sun...)'
                    : 'Workouts every single day.',
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.mutedText,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Duration (weeks)
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.mutedSurface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const Text(
                'Duration',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.foreground,
                ),
              ),
              const Spacer(),
              Text(
                '$_weeks Weeks',
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                width: 100,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: _weeks > 1
                          ? () => setState(() => _weeks--)
                          : null,
                      icon: const Icon(Icons.remove_circle_outline_rounded),
                      color: AppColors.primary,
                      iconSize: 28,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: _weeks < 12
                          ? () => setState(() => _weeks++)
                          : null,
                      icon: const Icon(Icons.add_circle_outline_rounded),
                      color: AppColors.primary,
                      iconSize: 28,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() => _startDate = picked);
    }
  }

  Future<void> _schedule() async {
    setState(() => _isScheduling = true);

    try {
      // Create device calendar events for each session.
      // The backend does not have a program schedule endpoint — scheduling
      // is done locally via device calendar (matching iOS Apple Calendar
      // integration behavior from PlanSchedulerView).
      await _addToDeviceCalendar();

      if (!mounted) return;
      setState(() {
        _isScheduling = false;
        _isSuccess = true;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _isScheduling = false);
      _showError('An unexpected error occurred. Please try again.');
    }
  }

  Future<void> _addToDeviceCalendar() async {
    final sessions = widget.program.templates;
    if (sessions.isEmpty) return;

    final isDaily = _frequency == 'DAILY';
    const sessionDuration = Duration(hours: 1);
    int dayOffset = 0;

    for (var i = 0; i < sessions.length; i++) {
      final session = sessions[i];
      final sessionDate = _calculateSessionDate(i, isDaily, dayOffset);
      if (sessionDate == null) continue;

      final start = DateTime(
        sessionDate.year,
        sessionDate.month,
        sessionDate.day,
        7,
      );

      dayOffset = isDaily
          ? dayOffset + 1
          : dayOffset + 2; // Sequential = every other day

      final event = cal.Event(
        title: session.name,
        description: widget.program.name,
        startDate: start,
        endDate: start.add(sessionDuration),
        location: 'ZIRO.FIT',
      );

      try {
        await cal.Add2Calendar.addEvent2Cal(event);
      } catch (_) {
        // Device calendar integration failure is non-blocking.
      }
    }
  }

  DateTime? _calculateSessionDate(
    int index,
    bool isDaily,
    int dayOffset,
  ) {
    if (isDaily) {
      return _startDate.add(Duration(days: index));
    }
    return _startDate.add(Duration(days: index * 2));
  }

  void _showError([String? message]) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.card,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Scheduling Failed',
          style: TextStyle(color: AppColors.foreground),
        ),
        content: Text(
          message ?? 'Could not schedule the routine. Please try again.',
          style: const TextStyle(color: AppColors.mutedText),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text(
              'OK',
              style: TextStyle(color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
      ]]>
    </file>
    <file path="lib/features/home/presentation/template_picker_sheet.dart">
      <![CDATA[
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_theme.dart';
import '../../notifications/presentation/widgets/ziro_sheet_header.dart';
import '../../trainers/data/models/template_dto.dart';
import '../cubit/program_cubit.dart';
import '../cubit/program_state.dart';
import 'create_template_screen.dart';

/// Modal bottom sheet for picking a workout template to add to a routine.
///
/// Matches iOS `RoutineTemplatePickerView` — RoutineBuilderView.swift lines 207-262.
class TemplatePickerSheet extends StatefulWidget {
  /// IDs already in the routine — these will be hidden or disabled.
  final Set<String> existingTemplateIds;

  const TemplatePickerSheet({
    super.key,
    this.existingTemplateIds = const {},
  });

  @override
  State<TemplatePickerSheet> createState() => _TemplatePickerSheetState();
}

class _TemplatePickerSheetState extends State<TemplatePickerSheet> {
  @override
  void initState() {
    super.initState();
    // Load templates through the cubit on mount
    context.read<ProgramCubit>().loadTemplates();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            children: [
              // Sheet header
              ZiroSheetHeader(
                title: 'Choose Template',
                showCancel: true,
                onCancel: () {
                  final router = GoRouter.of(context);
                  if (router.canPop()) {
                    router.pop();
                  } else {
                    context.go('/');
                  }
                },
                leadingText: 'Back',
              ),
              const Divider(height: 1, color: AppColors.borderMuted),

              // Content driven by cubit state
              Expanded(
                child: BlocBuilder<ProgramCubit, ProgramState>(
                  builder: (context, state) {
                    return switch (state) {
                      ProgramInitial() || ProgramLoading() => const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          color: AppColors.primary,
                        ),
                      ),
                      ProgramError(:final message) => _buildError(message),
                      ProgramLoaded(:final templates) =>
                        _buildTemplateList(scrollController, templates),
                    };
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildError(String message) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.cloud_off_rounded,
              size: 40, color: AppColors.mutedText),
          const SizedBox(height: 12),
          Text(
            message,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.mutedText,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.read<ProgramCubit>().loadTemplates(),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  void _showCreateTemplateDialog(BuildContext context) async {
    final result = await Navigator.of(context).push<TemplateDto>(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => BlocProvider.value(
          value: context.read<ProgramCubit>(),
          child: const CreateTemplateView(),
        ),
      ),
    );

    if (result != null && context.mounted) {
      // Persist the template locally so it survives app restart,
      // then return it to the routine builder.
      context.read<ProgramCubit>().saveLocalTemplate(result);
      Navigator.of(context).pop(result);
    }
  }

  Widget _buildTemplateList(
    ScrollController scrollController,
    List<TemplateDto> templates,
  ) {
    if (templates.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.grid_view_rounded,
                size: 60,
                color: AppColors.mutedText.withValues(alpha: 0.3),
              ),
              const SizedBox(height: 20),
              const Text(
                'No Templates Yet',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Create a workout template to get started.',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.mutedText,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => _showCreateTemplateDialog(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Create New Template'),
              ),
            ],
          ),
        ),
      );
    }

    return ListView.separated(
      controller: scrollController,
      padding: const EdgeInsets.all(16),
      itemCount: templates.length,
      separatorBuilder: (_, _) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final template = templates[index];
        final isUsed = widget.existingTemplateIds.contains(template.id);
        return _TemplateRow(
          template: template,
          isUsed: isUsed,
          onTap: isUsed
              ? null
              : () {
                  Navigator.of(context).pop(template);
                },
        );
      },
    );
  }
}

/// A single row in the template picker list.
class _TemplateRow extends StatelessWidget {
  final TemplateDto template;
  final bool isUsed;
  final VoidCallback? onTap;

  const _TemplateRow({
    required this.template,
    required this.isUsed,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isUsed
              ? AppColors.mutedSurface.withValues(alpha: 0.5)
              : AppColors.mutedSurface,
          borderRadius: BorderRadius.circular(12),
          border: isUsed ? Border.all(color: AppColors.borderMuted) : null,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    template.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isUsed
                          ? AppColors.mutedText
                          : AppColors.foreground,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${template.exercises.length} Exercises',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.mutedText,
                    ),
                  ),
                ],
              ),
            ),
            if (isUsed)
              const Text(
                'Added',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mutedText,
                ),
              )
            else
              const Icon(
                Icons.add_circle_outline_rounded,
                size: 24,
                color: AppColors.primary,
              ),
          ],
        ),
      ),
    );
  }
}
      ]]>
    </file>
    <file path="TASKS.md">
      <![CDATA[
- [x] Fix back button on trainer profile screen by using `context.push` instead of `context.go` for trainer details and adding fallback pop routing in TrainerDetailScreen.
- [x] Fix navigation GoError crash on Check-In screen and other sub-sheets/sub-screens by switching from `context.go` to `context.push` and incorporating safe fallback routing on pop actions.
- [x] Fix status bar overlap / header layout UI on HomeScreen and other screens utilizing custom floating headers by dynamically calculating and adding top safe area padding.
- [x] Fix missing back button on Templates Library screen by enabling the back navigation link with a chevron-left arrow in ZiroSheetHeader.
- [x] Fix broken cancel / close actions on Routine Builder, Routine Scheduler, Template Creator, and other builder sheets by ensuring all buttons utilize `context.push` for opening and safe fallback-pop checks.
      ]]>
    </file>
  </modifications>
</response>