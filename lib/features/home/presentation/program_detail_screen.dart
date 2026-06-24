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
