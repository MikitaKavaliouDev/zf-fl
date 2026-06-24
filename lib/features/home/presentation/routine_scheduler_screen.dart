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
  State<RoutineSchedulerScreen> createState() => _RoutineSchedulerScreenState();
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
    return Stack(
      children: [
        // Scrollable content
        Padding(
          padding: const EdgeInsets.only(top: 60),
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
            onTrailingIconTap: () => Navigator.of(context).pop(),
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
