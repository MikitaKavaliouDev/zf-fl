import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../trainers/cubit/workout_session_cubit.dart';
import '../../../trainers/cubit/workout_session_state.dart';
import '../../cubit/trainer_calendar_cubit.dart';
import '../../cubit/trainer_calendar_state.dart';
import '../../data/models/trainer_calendar_event_dto.dart';
import 'trainer_agenda_view.dart';
import 'trainer_create_session_sheet.dart';
import 'trainer_day_view.dart';
import 'trainer_month_view.dart';

/// Main calendar screen with segmented toggle (Agenda / Day / Month).
class TrainerCalendarScreen extends StatefulWidget {
  const TrainerCalendarScreen({super.key});

  @override
  State<TrainerCalendarScreen> createState() => _TrainerCalendarScreenState();
}

class _TrainerCalendarScreenState extends State<TrainerCalendarScreen> {
  late DateTime _focusedDate;

  @override
  void initState() {
    super.initState();
    _focusedDate = DateTime.now();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadMonth();
    });
  }

  void _loadMonth() {
    final start =
        DateTime(_focusedDate.year, _focusedDate.month);
    final end =
        DateTime(_focusedDate.year, _focusedDate.month + 1, 0);
    context.read<TrainerCalendarCubit>().loadEvents(startDate: start, endDate: end);
  }

  void _goToToday() {
    setState(() {
      _focusedDate = DateTime.now();
    });
    _loadMonth();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const ValueKey('trainerCalendarScreen'),
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          DateFormat('MMMM yyyy').format(_focusedDate),
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left_rounded),
          onPressed: () {
            setState(() {
              _focusedDate = DateTime(_focusedDate.year, _focusedDate.month - 1);
            });
            _loadMonth();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.chevron_right_rounded),
            onPressed: () {
              setState(() {
                _focusedDate = DateTime(_focusedDate.year, _focusedDate.month + 1);
              });
              _loadMonth();
            },
          ),
          TextButton(
            onPressed: _goToToday,
            child: const Text('Today'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'trainer_calendar_fab',
        onPressed: _openCreateSession,
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add_rounded, color: Colors.white),
      ),
      body: BlocBuilder<TrainerCalendarCubit, TrainerCalendarState>(
        builder: (context, state) {
          return switch (state) {
            TrainerCalendarInitial() || TrainerCalendarLoading() =>
              const Center(child: CircularProgressIndicator(color: AppColors.primary)),
            TrainerCalendarError(:final message) => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(message,
                        style: const TextStyle(color: AppColors.mutedText)),
                    const SizedBox(height: 12),
                    FilledButton.icon(
                      onPressed: _loadMonth,
                      icon: const Icon(Icons.refresh_rounded),
                      label: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            TrainerCalendarLoaded(:final viewMode, :final events) =>
              _buildBody(viewMode, events),
          };
        },
      ),
    );
  }

  Widget _buildBody(
      CalendarViewMode viewMode, List<TrainerCalendarEventDto> events) {
    return Column(
      children: [
        // Segmented control
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SegmentedButton<CalendarViewMode>(
            segments: const [
              ButtonSegment(value: CalendarViewMode.agenda, label: Text('Agenda')),
              ButtonSegment(value: CalendarViewMode.day, label: Text('Day')),
              ButtonSegment(value: CalendarViewMode.month, label: Text('Month')),
            ],
            selected: {viewMode},
            onSelectionChanged: (mode) {
              context.read<TrainerCalendarCubit>().setViewMode(mode.first);
            },
            style: const ButtonStyle(
              visualDensity: VisualDensity.compact,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ),
        const Divider(height: 1, color: AppColors.borderMuted),
        // Content
        Expanded(
          child: switch (viewMode) {
            CalendarViewMode.agenda => TrainerAgendaView(
                events: events,
                focusedDate: _focusedDate,
                onEventTap: (e) => _showEventDetail(e),
              ),
            CalendarViewMode.day => TrainerDayView(
                events: events,
                focusedDate: _focusedDate,
                onEventTap: (e) => _showEventDetail(e),
              ),
            CalendarViewMode.month => TrainerMonthView(
                events: events,
                focusedDate: _focusedDate,
                onDayTap: (date) {
                  setState(() => _focusedDate = date);
                  context
                      .read<TrainerCalendarCubit>()
                      .setViewMode(CalendarViewMode.day);
                },
              ),
          },
        ),
      ],
    );
  }

  bool _canStartSession(TrainerCalendarEventDto event) {
    final startDt = DateTime.tryParse(event.start);
    if (startDt == null) return false;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final eventDay = DateTime(startDt.year, startDt.month, startDt.day);
    return eventDay == today &&
        event.clientId != null &&
        event.type == 'session_planned' &&
        event.templateId != null;
  }

  void _onStartSession(TrainerCalendarEventDto event) {
    Navigator.pop(context); // close sheet
    context.read<WorkoutSessionCubit>().start(
      clientId: event.clientId,
      plannedSessionId: event.id,
      templateId: event.templateId,
    );
    // Navigate to the workout session screen so the user sees the active workout
    context.push('/workout/session');
  }

  void _onMaximizeSession() {
    Navigator.pop(context); // close sheet
    context.read<WorkoutSessionCubit>().maximize();
  }

  void _showEventDetail(TrainerCalendarEventDto event) {
    final wsState = context.read<WorkoutSessionCubit>().state;

    // Check if there's an active session for the same client
    final isActiveForClient = wsState is WorkoutSessionActive &&
        wsState.session.clientId == event.clientId;
    final hasActiveSession = wsState is WorkoutSessionActive;

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => _EventDetailSheet(
        event: event,
        canStartSession: _canStartSession(event) && !hasActiveSession,
        hasActiveSession: isActiveForClient,
        onStartSession: _canStartSession(event) && !hasActiveSession
            ? () => _onStartSession(event)
            : null,
        onMaximizeSession: isActiveForClient ? _onMaximizeSession : null,
        otherSessionActive: hasActiveSession && !isActiveForClient,
      ),
    );
  }

  void _openCreateSession() async {
    try {
      final data =
          await context.read<TrainerCalendarCubit>().getSessionCreationData();
      if (!mounted) return;
      await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (_) => TrainerCreateSessionSheet(creationData: data),
      );
    } catch (_) {
      // Session creation data not loaded yet
    }
  }
}

/// Bottom sheet showing calendar event details, matching iOS [CalendarView.swift].
///
/// Follows [sessionAction(for:)] pattern:
/// - Today + client + planned → "Start Workout" button
/// - Matching active session → "Ongoing Workout" button (maximize)
/// - Completed → "Completed" label (no action)
class _EventDetailSheet extends StatelessWidget {
  final TrainerCalendarEventDto event;
  final bool canStartSession;
  final bool hasActiveSession;
  final VoidCallback? onStartSession;
  final VoidCallback? onMaximizeSession;
  final bool otherSessionActive;

  const _EventDetailSheet({
    required this.event,
    this.canStartSession = false,
    this.hasActiveSession = false,
    this.onStartSession,
    this.onMaximizeSession,
    this.otherSessionActive = false,
  });

  @override
  Widget build(BuildContext context) {
    final isBooking = event.type == 'booking';
    final color = isBooking ? const Color(0xFFAF52DE) : AppColors.primary;
    final icon = isBooking ? Icons.calendar_today_rounded : Icons.fitness_center_rounded;

    final startDt = DateTime.tryParse(event.start);
    final endDt = DateTime.tryParse(event.end);
    final dateStr = startDt != null ? DateFormat('EEEE, MMMM d, yyyy').format(startDt) : '';
    final timeStr = startDt != null && endDt != null
        ? '${_fmtTime(startDt)} – ${_fmtTime(endDt)}'
        : '';

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag handle
          Center(
            child: Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.borderMuted,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Title row
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  event.title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: AppColors.foreground,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Type badge
          _InfoRow(
            icon: Icons.info_outline_rounded,
            label: 'Type',
            value: isBooking
                ? 'Booking'
                : event.type == 'session_planned'
                    ? 'Planned Session'
                    : 'Completed Session',
            valueColor: color,
          ),
          const SizedBox(height: 12),
          // Date
          if (dateStr.isNotEmpty)
            _InfoRow(
              icon: Icons.calendar_month_rounded,
              label: 'Date',
              value: dateStr,
            ),
          if (dateStr.isNotEmpty) const SizedBox(height: 12),
          // Time
          if (timeStr.isNotEmpty)
            _InfoRow(
              icon: Icons.schedule_rounded,
              label: 'Time',
              value: timeStr,
            ),
          if (timeStr.isNotEmpty) const SizedBox(height: 12),
          // Client
          _InfoRow(
            icon: Icons.person_rounded,
            label: 'Client',
            value: event.clientName,
          ),
          if (event.clientAvatarUrl != null) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                const SizedBox(width: 28),
                ClipOval(
                  child: Image.network(
                    event.clientAvatarUrl!,
                    width: 24,
                    height: 24,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        const Icon(Icons.person_rounded, size: 20, color: AppColors.mutedText),
                  ),
                ),
              ],
            ),
          ],
          if (event.templateName != null) ...[
            const SizedBox(height: 12),
            _InfoRow(
              icon: Icons.fitness_center_rounded,
              label: 'Template',
              value: event.templateName!,
            ),
          ],
          if (event.notes != null && event.notes!.isNotEmpty) ...[
            const SizedBox(height: 12),
            _InfoRow(
              icon: Icons.notes_rounded,
              label: 'Notes',
              value: event.notes!,
            ),
          ],
          const SizedBox(height: 24),
          // Action button — matches iOS sessionAction(for:) pattern
          if (hasActiveSession)
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  onMaximizeSession?.call();
                },
                icon: const Icon(Icons.fitness_center_rounded, size: 18),
                label: const Text('Ongoing Workout',
                    style: TextStyle(fontSize: 15)),
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF34C759),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(99),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            )
          else if (canStartSession)
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: onStartSession,
                icon: const Icon(Icons.play_arrow_rounded, size: 20),
                label: const Text('Start Workout',
                    style: TextStyle(fontSize: 15)),
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(99),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            )
          else if (otherSessionActive)
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: null, // disabled
                icon: const Icon(Icons.lock_rounded, size: 18),
                label: const Text('Another session active',
                    style: TextStyle(fontSize: 15)),
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.borderMuted,
                  disabledBackgroundColor: AppColors.borderMuted,
                  disabledForegroundColor: AppColors.mutedText,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(99),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            )
          else
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => Navigator.pop(context),
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(99),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text('Close', style: TextStyle(fontSize: 15)),
              ),
            ),
        ],
      ),
    );
  }

  String _fmtTime(DateTime dt) {
    final h = dt.hour.toString().padLeft(2, '0');
    final m = dt.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 28,
          child: Icon(icon, size: 18, color: AppColors.mutedText),
        ),
        const SizedBox(width: 12),
        Text('$label:  ',
            style: const TextStyle(
                fontSize: 14, color: AppColors.mutedText)),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: valueColor ?? AppColors.foreground,
            ),
          ),
        ),
      ],
    );
  }
}
