import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_theme.dart';
import '../../notifications/presentation/widgets/ziro_sheet_header.dart';
import '../../trainers/data/models/exercise_dto.dart';
import '../../trainers/data/models/template_dto.dart';
import '../../trainers/presentation/widgets/exercise_picker_sheet.dart';
import '../cubit/program_cubit.dart';

/// Full-screen template creation view matching iOS `CreateTemplateView.swift`.
///
/// Allows the user to:
/// 1. Enter a template name and optional description
/// 2. Add exercises from the exercise library
/// 3. Reorder exercises via drag-and-drop
/// 4. Remove exercises
/// 5. Save as a local template (returned via Navigator.pop)
class CreateTemplateView extends StatefulWidget {
  const CreateTemplateView({super.key});

  @override
  State<CreateTemplateView> createState() => _CreateTemplateViewState();
}

class _CreateTemplateViewState extends State<CreateTemplateView> {
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  final List<_TemplateExerciseEntry> _exercises = [];
  final bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
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
          // Main content
          Padding(
            padding: EdgeInsets.only(top: topPadding + 80),
            child: Column(
              children: [
                // Header fields
                _buildHeaderSection(),
                const SizedBox(height: 16),
                // Exercise list or empty state
                Expanded(
                  child: _exercises.isEmpty
                      ? _buildEmptyState()
                      : _buildExerciseList(),
                ),
              ],
            ),
          ),

          // Floating header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ZiroSheetHeader(
              title: 'New Template',
              showCancel: true,
              showDone: true,
              onCancel: () => Navigator.of(context).maybePop(),
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

  Widget _buildHeaderSection() {
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
              hintText: 'Template Name (e.g. Leg Day)',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16),
            ),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.foreground,
            ),
            textCapitalization: TextCapitalization.words,
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
              'Your Template is Empty',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Add exercises to build your workout template.',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _showExercisePicker,
              icon: const Icon(Icons.add_circle_outline_rounded, size: 20),
              label: const Text('Add Exercise'),
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExerciseList() {
    return Column(
      children: [
        // Section header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const Text(
                'Exercises',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.foreground,
                ),
              ),
              const Spacer(),
              Text(
                '${_exercises.length} exercises',
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.mutedText,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),

        // Reorderable exercise list
        Expanded(
          child: ReorderableListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _exercises.length,
            onReorderItem: (oldIndex, newIndex) {
              setState(() {
                final item = _exercises.removeAt(oldIndex);
                _exercises.insert(newIndex, item);
                // Update order values
                for (var i = 0; i < _exercises.length; i++) {
                  _exercises[i] = _TemplateExerciseEntry(
                    id: _exercises[i].id,
                    exercise: _exercises[i].exercise,
                    targetReps: _exercises[i].targetReps,
                    targetSets: _exercises[i].targetSets,
                    order: i,
                  );
                }
              });
            },
            itemBuilder: (context, index) {
              final entry = _exercises[index];
              return _buildExerciseCard(entry, index);
            },
          ),
        ),

        // Add exercise button at bottom
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

  Widget _buildExerciseCard(_TemplateExerciseEntry entry, int index) {
    return Container(
      key: ValueKey(entry.id),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        type: MaterialType.transparency,
        child: ListTile(
        leading: const Icon(
          Icons.drag_handle_rounded,
          size: 20,
          color: AppColors.mutedText,
        ),
        title: Text(
          entry.exercise.name,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.foreground,
          ),
        ),
        subtitle: entry.exercise.muscleGroup != null
            ? Text(
                entry.exercise.muscleGroup!,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.mutedText,
                ),
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
                '${entry.targetSets}×${entry.targetReps}',
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
              onTap: () => setState(() => _exercises.removeAt(index)),
              child: const Icon(
                Icons.close_rounded,
                size: 18,
                color: AppColors.mutedText,
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }

  Future<void> _showExercisePicker() async {
    final allExercises =
        await context.read<ProgramCubit>().fetchExerciseLibrary();
    if (allExercises.isEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not load exercise library.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    if (!mounted) return;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ExercisePickerSheet.multiple(
        exercises: allExercises,
        onExercisesSelected: (selected) {
          setState(() {
            for (final exercise in selected) {
              _exercises.add(_TemplateExerciseEntry(
                id: 'local_${DateTime.now().millisecondsSinceEpoch}_${exercise.id}',
                exercise: exercise,
                targetReps: '10',
                targetSets: 3,
                order: _exercises.length,
              ));
            }
          });
        },
      ),
    );
  }

  void _save() {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a template name')),
      );
      return;
    }

    if (_exercises.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please add at least one exercise')),
      );
      return;
    }

    // Create the template with exercises
    final template = TemplateDto(
      id: 'local_${DateTime.now().millisecondsSinceEpoch}',
      name: name,
      description: _descriptionController.text.trim().nullIfEmpty,
      exercises: _exercises.map((e) => TemplateExerciseDto(
        id: e.id,
        order: e.order,
        exerciseId: e.exercise.id,
        type: 'EXERCISE',
        targetReps: e.targetReps,
        targetSets: e.targetSets,
        exercise: e.exercise,
      )).toList(),
    );

    Navigator.of(context).pop(template);
  }
}

/// Internal model for an exercise entry in the template.
class _TemplateExerciseEntry {
  final String id;
  final ExerciseDto exercise;
  final String targetReps;
  final int targetSets;
  final int order;

  _TemplateExerciseEntry({
    required this.id,
    required this.exercise,
    required this.targetReps,
    required this.targetSets,
    required this.order,
  });
}



extension on String {
  String? get nullIfEmpty => isEmpty ? null : this;
}
      