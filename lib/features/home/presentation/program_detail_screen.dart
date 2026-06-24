import 'package:add_2_calendar/add_2_calendar.dart' as cal;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../data/models/active_program_response.dart';
import '../data/models/program_dto.dart';

/// Full-screen detail view for a client's training program.
///
/// Accepts either [ActiveProgramResponse] (from dashboard endpoint) or
/// [ProgramDto] (from program CRUD API), normalizes internally for display.
///
/// Matches iOS behavior from PersonalHomeView showProgramDetail sheet.
class ProgramDetailScreen extends StatelessWidget {
  final ActiveProgramResponse? activeProgram;
  final ProgramDto? programDto;

  const ProgramDetailScreen({
    super.key,
    this.activeProgram,
    this.programDto,
  }) : assert(activeProgram != null || programDto != null,
            'Either activeProgram or programDto must be provided');

  /// Program name normalized from either model.
  String get _name {
    if (activeProgram != null) return activeProgram!.program.name;
    return programDto!.name;
  }

  /// Description normalized from either model.
  String? get _description {
    if (activeProgram != null) return activeProgram!.program.description;
    return programDto!.description;
  }

  /// Template count normalized from either model.
  int get _templateCount {
    if (activeProgram != null) return activeProgram!.templates.length;
    return programDto!.templates.length;
  }

  /// Template names normalized from either model.
  List<String> get _templateNames {
    if (activeProgram != null) {
      return activeProgram!.templates.map((t) => t.name).toList();
    }
    return programDto!.templates.map((t) => t.name).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded,
              color: AppColors.foreground),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Program Details',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: AppColors.foreground,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Program header card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.mutedSurface,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.foreground,
                    ),
                  ),
                  if (_description != null &&
                      _description!.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      _description!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.mutedText,
                      ),
                    ),
                  ],
                  const SizedBox(height: 20),

                  // Progress stats (only for active program response)
                  if (activeProgram != null) ...[
                    Row(
                      children: [
                        _StatBadge(
                          label: 'Completed',
                          value: '${activeProgram!.progress.completedCount}',
                        ),
                        const SizedBox(width: 16),
                        _StatBadge(
                          label: 'Total',
                          value: '${activeProgram!.progress.totalCount}',
                        ),
                        const SizedBox(width: 16),
                        _StatBadge(
                          label: 'Progress',
                          value:
                              '${activeProgram!.progress.progressPercentage}%',
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(99),
                      child: LinearProgressIndicator(
                        value: activeProgram!.progress.totalCount > 0
                            ? activeProgram!.progress.completedCount /
                                activeProgram!.progress.totalCount
                            : 0,
                        minHeight: 8,
                        backgroundColor: AppColors.borderActive,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Schedule info (for ProgramDto with scheduling)
            if (programDto != null && programDto!.isScheduled) ...[
              _buildScheduleInfo(),
              const SizedBox(height: 24),
            ],

            // Template list header
            Text(
              'Workouts ($_templateCount)',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 12),

            // Template rows
            if (activeProgram != null)
              ...activeProgram!.templates.map(
                (template) => _TemplateDetailRow(
                  templateName: template.name,
                  exerciseCount: template.exerciseCount,
                  status: template.status,
                  onStart: template.status == 'NEXT'
                      ? () => context.go('/workout')
                      : null,
                ),
              )
            else
              ...programDto!.templates.map(
                (template) => _TemplateDetailRow(
                  templateName: template.name,
                  exerciseCount: template.exercises.length,
                ),
              ),

            const SizedBox(height: 24),
            _CalendarButton(
              programName: _name,
              templateNames: _templateNames,
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildScheduleInfo() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.calendar_month_rounded,
              size: 20, color: AppColors.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Scheduled ${programDto!.scheduleFrequency ?? ""}',
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.foreground,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Small stat badge showing a label and value.
class _StatBadge extends StatelessWidget {
  final String label;
  final String value;

  const _StatBadge({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.foreground,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.mutedText,
          ),
        ),
      ],
    );
  }
}

/// Stateful calendar button matching iOS MyProgramDetailView's addAllToCalendar.
class _CalendarButton extends StatefulWidget {
  final String programName;
  final List<String> templateNames;

  const _CalendarButton({
    required this.programName,
    required this.templateNames,
  });

  @override
  State<_CalendarButton> createState() => _CalendarButtonState();
}

class _CalendarButtonState extends State<_CalendarButton> {
  bool _addedToCalendar = false;

  Future<void> _addAllToCalendar() async {
    final now = DateTime.now();
    final tomorrow = DateTime(now.year, now.month, now.day + 1);

    for (var i = 0; i < widget.templateNames.length; i++) {
      final startDate = tomorrow.add(Duration(days: i));
      final endDate = startDate.add(const Duration(hours: 1));

      final event = cal.Event(
        title: '${widget.programName} - ${widget.templateNames[i]}',
        startDate: startDate,
        endDate: endDate,
        location: 'ZIRO.FIT',
      );

      try {
        await cal.Add2Calendar.addEvent2Cal(event);
      } catch (_) {
        // Calendar integration failure is non-blocking (matching iOS behavior).
      }
    }

    if (mounted) {
      setState(() => _addedToCalendar = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.templateNames.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: _addedToCalendar ? null : _addAllToCalendar,
          icon: Icon(
            _addedToCalendar
                ? Icons.check_circle_rounded
                : Icons.calendar_month_rounded,
            size: 20,
          ),
          label: Text(
            _addedToCalendar ? 'Added to Calendar' : 'Add All to Calendar',
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor:
                _addedToCalendar ? const Color(0xFF22C55E) : AppColors.primary,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

/// A single template row in the program detail list.
class _TemplateDetailRow extends StatelessWidget {
  final String templateName;
  final int exerciseCount;
  final String? status;
  final VoidCallback? onStart;

  const _TemplateDetailRow({
    required this.templateName,
    required this.exerciseCount,
    this.status,
    this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    final isCompleted = status == 'COMPLETED';
    final isNext = status == 'NEXT';

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(16),
        border: isNext
            ? Border.all(color: AppColors.primary.withValues(alpha: 0.3))
            : null,
      ),
      child: Row(
        children: [
          // Status icon
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isCompleted
                  ? const Color(0xFF22C55E)
                  : isNext
                      ? AppColors.primary
                      : AppColors.borderActive,
            ),
            child: Center(
              child: isCompleted
                  ? const Icon(Icons.check_rounded,
                      size: 18, color: Colors.white)
                  : isNext
                      ? const Icon(Icons.play_arrow_rounded,
                          size: 18, color: Colors.white)
                      : null,
            ),
          ),
          const SizedBox(width: 12),
          // Name and exercise count
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  templateName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: isCompleted
                        ? AppColors.mutedText
                        : AppColors.foreground,
                    decoration:
                        isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '$exerciseCount exercises',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.mutedText,
                  ),
                ),
              ],
            ),
          ),
          // Action button for NEXT template
          if (isNext && onStart != null)
            ElevatedButton(
              onPressed: onStart,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(99),
                ),
                elevation: 0,
                textStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text('Start'),
            ),
        ],
      ),
    );
  }
}
