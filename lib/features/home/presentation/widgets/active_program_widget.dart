import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../home/data/models/active_program_response.dart';

/// Card displaying the user's current active training program on the home
/// dashboard. Matches web ActiveProgramWidget.tsx behavior.
///
/// Shows:
/// - "Current Program" header with program name + progress %
/// - Progress bar
/// - Template roadmap with COMPLETED/NEXT/PENDING status
/// - Tap a template to see its exercises in a bottom sheet
/// - Start button for NEXT template
class ActiveProgramWidget extends StatelessWidget {
  final ActiveProgramResponse program;
  final void Function(String templateId) onStartTemplate;
  final VoidCallback onTap;
  const ActiveProgramWidget({
    super.key,
    required this.program,
    required this.onStartTemplate,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final progress = program.progress;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.mutedSurface,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row: "Current Routine" + program name + percentage
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Current Routine',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        program.program.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.foreground,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${progress.progressPercentage}%',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.foreground,
                      ),
                    ),
                    const Text(
                      'Complete',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.mutedText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Progress bar
            ClipRRect(
              borderRadius: BorderRadius.circular(99),
              child: LinearProgressIndicator(
                value: progress.totalCount > 0
                    ? progress.completedCount / progress.totalCount
                    : 0,
                minHeight: 8,
                backgroundColor: AppColors.borderActive,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.primary,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Divider
            const Divider(height: 1, color: AppColors.borderMuted),
            const SizedBox(height: 12),

            // Template list with tap-to-expand
            ...program.templates.map(
              (template) => _TemplateRow(
                template: template,
                onStart: () => onStartTemplate(template.id),
                onTap: () => _showTemplateModal(context, template),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showTemplateModal(
      BuildContext context, ProgramTemplateStatus template) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _TemplateDetailModal(
        template: template,
        onStartWorkout: () {
          Navigator.of(context).pop();
          onStartTemplate(template.id);
        },
      ),
    );
  }
}

/// Full-screen modal showing template exercises and start action.
class _TemplateDetailModal extends StatefulWidget {
  final ProgramTemplateStatus template;
  final VoidCallback onStartWorkout;

  const _TemplateDetailModal({
    required this.template,
    required this.onStartWorkout,
  });

  @override
  State<_TemplateDetailModal> createState() => _TemplateDetailModalState();
}

class _TemplateDetailModalState extends State<_TemplateDetailModal> {
  @override
  void initState() {
    super.initState();
    // The active program template only has exerciseCount, not full exercises.
    // We can't fetch exercises without a template detail endpoint.
    // For now show that exercises are available.
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      minChildSize: 0.3,
      maxChildSize: 0.8,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Drag handle
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.borderMuted,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.template.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.foreground,
                      ),
                    ),
                    if (widget.template.description != null &&
                        widget.template.description!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          widget.template.description!,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.mutedText,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Content
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(20),
                  children: [
                    // Exercises section
                    const Text(
                      'Workout Outline',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: AppColors.mutedText,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Placeholder exercise items
                    // Since we don't have a template detail endpoint for
                    // active program templates, show the count.
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.mutedSurface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.borderMuted),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.fitness_center_rounded,
                            size: 32,
                            color: AppColors.mutedText.withValues(alpha: 0.3),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${widget.template.exerciseCount} exercises',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.foreground,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Start the workout to see your exercises!',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.mutedText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Start button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: widget.onStartWorkout,
                        icon: const Icon(Icons.play_arrow_rounded, size: 20),
                        label: const Text('Start Workout'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// A single row in the template list showing status, name, and action.
class _TemplateRow extends StatelessWidget {
  final ProgramTemplateStatus template;
  final VoidCallback onStart;
  final VoidCallback onTap;

  const _TemplateRow({
    required this.template,
    required this.onStart,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isCompleted = template.status == 'COMPLETED';
    final isNext = template.status == 'NEXT';

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isNext
                ? AppColors.card
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: isNext
                ? Border.all(color: AppColors.primary.withValues(alpha: 0.2))
                : null,
          ),
          child: Row(
            children: [
              // Status icon
              _StatusIcon(
                status: template.status,
                order: template.order,
              ),
              const SizedBox(width: 12),

              // Template name + exercise count
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      template.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: isCompleted
                            ? AppColors.mutedText
                            : AppColors.foreground,
                        decoration:
                            isCompleted ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    Text(
                      '${template.exerciseCount} exercises',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.mutedText,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 4),

              // Status badge or start button
              if (isNext)
                SizedBox(
                  height: 32,
                  child: ElevatedButton(
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
                )
              else if (!isCompleted)
                Icon(
                  Icons.lock_rounded,
                  size: 16,
                  color: AppColors.mutedText.withValues(alpha: 0.5),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Circular status indicator for a template row.
class _StatusIcon extends StatelessWidget {
  final String status;
  final int order;

  const _StatusIcon({
    required this.status,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    final isCompleted = status == 'COMPLETED';
    final isNext = status == 'NEXT';

    return Container(
      width: 28,
      height: 28,
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
            ? const Icon(Icons.check_rounded, size: 16, color: Colors.white)
            : isNext
                ? const Icon(Icons.circle_rounded,
                    size: 10, color: Colors.white)
                : Text(
                    '${order + 1}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mutedText,
                    ),
                  ),
      ),
    );
  }
}
