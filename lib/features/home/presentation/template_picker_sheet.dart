import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/error_widget.dart';
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
  String _selectedCategory = 'All';

  static const _categories = [
    'All',
    'Trainer Assigned',
    'System',
    'Personal',
  ];

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

              // Category filter bar
              const SizedBox(height: 8),
              _buildCategoryFilters(),
              const SizedBox(height: 8),

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

  Widget _buildCategoryFilters() {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = _categories[index];
          final isSelected = category == _selectedCategory;
          return GestureDetector(
            onTap: () => setState(() => _selectedCategory = category),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary
                    : AppColors.mutedSurface,
                borderRadius: BorderRadius.circular(99),
              ),
              child: Text(
                category,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight:
                      isSelected ? FontWeight.w600 : FontWeight.normal,
                  color: isSelected
                      ? Colors.white
                      : AppColors.foreground,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildError(String message) {
    return ZiroErrorWidget(
      message: message,
      icon: Icons.cloud_off_rounded,
      iconSize: 40,
      padding: EdgeInsets.zero,
      onRetry: () => context.read<ProgramCubit>().loadTemplates(),
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
    var filtered = templates;
    if (_selectedCategory != 'All') {
      filtered = templates.where((t) => t.category == _selectedCategory).toList();
    }

    if (filtered.isEmpty) {
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
      itemCount: filtered.length,
      separatorBuilder: (_, _) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final template = filtered[index];
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
    final exerciseCount = template.exercises.isNotEmpty
        ? template.exercises.length
        : template.exerciseCount;

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
                  Row(
                    children: [
                      Text(
                        '$exerciseCount Exercises',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.mutedText,
                        ),
                      ),
                      if (template.category != null) ...[
                        const SizedBox(width: 8),
                        Text(
                          '\u2022  ${template.category}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.mutedText,
                          ),
                        ),
                      ],
                    ],
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
      