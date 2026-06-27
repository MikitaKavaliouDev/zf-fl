import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/error_widget.dart';
import '../../../core/theme/app_theme.dart';
import '../../trainers/data/models/template_dto.dart';
import '../../trainers/presentation/widgets/exercise_picker_sheet.dart';
import '../cubit/template_detail_cubit.dart';
import '../cubit/template_detail_state.dart';

/// Full-screen template detail view matching iOS TemplateDetailView.swift.
///
/// Shows the template's exercises with sets/reps, allows adding and removing
/// exercises, and supports editing exercise parameters.
class TemplateDetailScreen extends StatefulWidget {
  final TemplateDto template;

  const TemplateDetailScreen({super.key, required this.template});

  @override
  State<TemplateDetailScreen> createState() => _TemplateDetailScreenState();
}

class _TemplateDetailScreenState extends State<TemplateDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TemplateDetailCubit>().loadTemplate(widget.template);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          widget.template.name,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: AppColors.foreground,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: AppColors.foreground),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).maybePop(),
            child: const Text(
              'Done',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<TemplateDetailCubit, TemplateDetailState>(
        builder: (context, state) {
          return switch (state) {
            TemplateDetailInitial() || TemplateDetailLoading() => const Center(
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: AppColors.primary,
              ),
            ),
            TemplateDetailError(:final message) => _buildError(message),
            TemplateDetailLoaded(:final exercises) => _buildContent(exercises),
          };
        },
      ),
    );
  }

  Widget _buildError(String message) {
    return ZiroErrorWidget(
      message: message,
      padding: const EdgeInsets.all(32),
      onRetry: () => context.read<TemplateDetailCubit>().loadTemplate(widget.template),
    );
  }

  Widget _buildContent(List<TemplateExerciseDto> exercises) {
    return Column(
      children: [
        Expanded(
          child: exercises.isEmpty ? _buildEmptyState() : _buildExerciseList(exercises),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: _showExercisePicker,
              icon: const Icon(Icons.add_circle_outline_rounded, size: 20),
              label: const Text('Add Exercise'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primary,
                side: const BorderSide(color: AppColors.primary),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.fitness_center_rounded,
              size: 60,
              color: AppColors.mutedText.withValues(alpha: 0.3),
            ),
            const SizedBox(height: 20),
            const Text(
              'No exercises added yet',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Add exercises to make your template ready.',
              style: TextStyle(fontSize: 14, color: AppColors.mutedText),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExerciseList(List<TemplateExerciseDto> exercises) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: exercises.length,
      itemBuilder: (context, index) {
        final exercise = exercises[index];
        return _ExerciseCard(
          exercise: exercise,
          index: index,
          onDelete: () => context.read<TemplateDetailCubit>().removeExercise(index),
        );
      },
    );
  }

  Future<void> _showExercisePicker() async {
    final allExercises = await context.read<TemplateDetailCubit>().fetchExerciseLibrary();
    if (allExercises.isEmpty) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not load exercise library.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    if (!context.mounted) return;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ExercisePickerSheet.multiple(
        exercises: allExercises,
        isLoading: false,
        onExercisesSelected: (selected) {
          for (final exercise in selected) {
            context.read<TemplateDetailCubit>().addExercise(exercise);
          }
        },
      ),
    );
  }
}

/// A single exercise card in the template detail list.
///
/// Matches the visual style of CreateTemplateView's _buildExerciseCard.
class _ExerciseCard extends StatelessWidget {
  final TemplateExerciseDto exercise;
  final int index;
  final VoidCallback onDelete;

  const _ExerciseCard({
    required this.exercise,
    required this.index,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(exercise.id),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: const Icon(
          Icons.drag_handle_rounded,
          size: 20,
          color: AppColors.mutedText,
        ),
        title: Text(
          exercise.exercise?.name ?? 'Exercise',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.foreground,
          ),
        ),
        subtitle: exercise.exercise?.muscleGroup != null
            ? Text(
                exercise.exercise!.muscleGroup!,
                style: const TextStyle(fontSize: 12, color: AppColors.mutedText),
              )
            : null,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Sets/Reps badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                '${exercise.targetSets ?? 3}×${exercise.targetReps ?? '10'}',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ),
            const SizedBox(width: 8),
            // Remove button
            GestureDetector(
              onTap: onDelete,
              child: const Icon(
                Icons.close_rounded,
                size: 18,
                color: AppColors.mutedText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
