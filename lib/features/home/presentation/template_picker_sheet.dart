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
                onCancel: () => Navigator.of(this.context).pop(),
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
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => BlocProvider.value(
          value: context.read<ProgramCubit>(),
          child: const CreateTemplateView(),
        ),
      ),
    );

    if (result != null && result is TemplateDto && context.mounted) {
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
