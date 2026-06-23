import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../home/data/models/active_program_response.dart';

/// Card displaying the user's current active training program.
///
/// Shows program name, progress percentage, a progress bar, and
/// a list of templates with their completion status. Allows
/// starting the next pending template directly.
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
                // Percentage + Complete label
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

            // Template list
            ...program.templates.map(
              (template) => _TemplateRow(
                template: template,
                onStart: () => onStartTemplate(template.id),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A single row in the template list showing status, name, and action.
class _TemplateRow extends StatelessWidget {
  final ProgramTemplateStatus template;
  final VoidCallback onStart;

  const _TemplateRow({
    required this.template,
    required this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    final isCompleted = template.status == 'COMPLETED';
    final isNext = template.status == 'NEXT';

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
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
          const SizedBox(width: 8),

          // Start button (only for NEXT template)
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
            ),
        ],
      ),
    );
  }
}

/// Circular status indicator for a template row.
///
/// Shows a green checkmark for COMPLETED, a blue dot for NEXT,
/// and a gray number for PENDING.
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
                ? const Icon(Icons.circle_rounded, size: 10, color: Colors.white)
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
