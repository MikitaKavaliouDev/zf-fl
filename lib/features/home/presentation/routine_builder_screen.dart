import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'dart:developer' as developer;

import '../../../core/di/injection.dart';
import '../../../core/theme/app_theme.dart';
import '../../notifications/presentation/widgets/ziro_sheet_header.dart';
import '../../trainers/data/models/template_dto.dart';
import '../../trainers/data/workout_session_repository.dart';
import '../cubit/program_cubit.dart';
import '../cubit/program_state.dart';
import '../data/models/program_dto.dart';
import 'template_picker_sheet.dart';

/// A slot holding a template together with an editable day label.
///
/// Matches iOS `RoutineTemplateSlot` — RoutineBuilderView.swift line 3-7.
class _RoutineSlot {
  final TemplateDto template;
  final TextEditingController controller;

  _RoutineSlot({required this.template, required String label})
      : controller = TextEditingController(text: label);

  String get label => controller.text;
  set label(String value) => controller.text = value;

  void dispose() {
    controller.dispose();
  }
}

/// Full-screen routine builder for creating or editing workout programs.
///
/// Matches iOS `RoutineBuilderView` — RoutineBuilderView.swift lines 9-205.
class RoutineBuilderScreen extends StatefulWidget {
  /// If non-null, we're editing an existing program.
  final ProgramDto? existingProgram;

  const RoutineBuilderScreen({super.key, this.existingProgram});

  @override
  State<RoutineBuilderScreen> createState() => _RoutineBuilderScreenState();
}

class _RoutineBuilderScreenState extends State<RoutineBuilderScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late List<_RoutineSlot> _slots;
  bool _isSaving = false;

  /// Set of template IDs that were part of the original program (edit mode).
  /// Used to determine which slots are new additions vs pre-existing.
  final Set<String> _originalTemplateIds = {};

  @override
  void initState() {
    super.initState();
    final program = widget.existingProgram;
    _nameController = TextEditingController(text: program?.name ?? '');
    _descriptionController =
        TextEditingController(text: program?.description ?? '');
    _slots = (program?.templates ?? []).asMap().entries.map((e) {
      final index = e.key;
      final template = e.value;
      final labels = program?.templateLabels ?? [];
      _originalTemplateIds.add(template.id);
      return _RoutineSlot(
        template: template,
        label: index < labels.length ? labels[index] : 'Day ${index + 1}',
      );
    }).toList();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    for (final slot in _slots) {
      slot.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      key: const ValueKey('routineBuilderScreen'),
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Main scrollable content with reorderable list
          Padding(
            padding: EdgeInsets.only(top: topPadding + 80),
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoSection(),
                  const SizedBox(height: 24),
                  _buildSlotsSection(),
                ],
              ),
            ),
          ),

          // Fixed bottom "Add Template" button
          if (_slots.isNotEmpty)
            Positioned(
              left: 16,
              right: 16,
              bottom: 32,
              child: SafeArea(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _openTemplatePicker,
                    icon: const Icon(Icons.add_circle_outline_rounded,
                        size: 20),
                    label: const Text('Add Template'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 4,
                      shadowColor: AppColors.primary.withValues(alpha: 0.3),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),

          // Floating header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ZiroSheetHeader(
              title: widget.existingProgram != null
                  ? 'Edit Routine'
                  : 'New Routine',
              showCancel: true,
              showDone: true,
              onCancel: () {
                final router = GoRouter.of(context);
                if (router.canPop()) {
                  router.pop();
                } else {
                  context.go('/');
                }
              },
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

  Widget _buildInfoSection() {
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
              hintText: 'Routine Name',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16),
            ),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.foreground,
            ),
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

  Widget _buildSlotsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const Text(
                'Routine Templates',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.foreground,
                ),
              ),
              const Spacer(),
              Text(
                '${_slots.length} Templates',
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.mutedText,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        // Reorderable slot list or empty state
        if (_slots.isEmpty)
          _buildEmptyState()
        else
          // Use ReorderableListView.builder for drag-to-reorder
          ReorderableListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            buildDefaultDragHandles: false,
            itemCount: _slots.length,
            onReorderItem: _onReorder,
            proxyDecorator: (child, index, animation) {
              return AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.transparent,
                    child: child,
                  );
                },
                child: child,
              );
            },
            itemBuilder: (context, index) =>
                _buildSlotCard(index, _slots[index]),
          ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: _openTemplatePicker,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.3),
              width: 2,
            ),
          ),
          child: Column(
            children: [
              Icon(
                Icons.add_circle_rounded,
                size: 32,
                color: AppColors.primary.withValues(alpha: 0.7),
              ),
              const SizedBox(height: 8),
              Text(
                'Add your first template',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary.withValues(alpha: 0.8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSlotCard(int index, _RoutineSlot slot) {
    // Key is required by ReorderableListView for stable item identity.
    // Using ValueKey(slot.template.id) ensures Flutter tracks items through reorder.
    final exerciseCount = slot.template.exercises.isNotEmpty
        ? slot.template.exercises.length
        : slot.template.exerciseCount;

    return Container(
      key: ValueKey(slot.template.id),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.borderMuted),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Slot header: drag handle + day label + delete
          Row(
            children: [
              // Drag handle — triggers ReorderableListView reorder natively
              ReorderableDragStartListener(
                index: index,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  child: const Icon(
                    Icons.drag_handle_rounded,
                    size: 20,
                    color: AppColors.mutedText,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              // Beautiful iOS-style day label chip
              Container(
                width: 100,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: slot.controller,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => setState(() => _slots.removeAt(index)),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  child: const Icon(
                    Icons.delete_rounded,
                    size: 20,
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Template info — tap to view exercise details
          GestureDetector(
            onTap: () => _showTemplateExercises(slot),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        slot.template.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.foreground,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '$exerciseCount Exercises',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.mutedText,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      // newIndex accounts for the removed item — no manual adjustment needed.
      final slot = _slots.removeAt(oldIndex);
      _slots.insert(newIndex, slot);
    });
  }

  /// Show a bottom sheet with template exercise details.
  ///
  /// If the template's exercises are empty (common for library/API templates
  /// that only include [exerciseCount]), fetches the full template from the
  /// backend to populate the exercise list.
  Future<void> _showTemplateExercises(_RoutineSlot slot) async {
    var exercises = slot.template.exercises;

    // Fetch full template if exercises are missing but should exist.
    if (exercises.isEmpty &&
        !slot.template.id.startsWith('local_') &&
        slot.template.exerciseCount > 0) {
      try {
        final fullTemplate =
            await getIt<WorkoutSessionRepository>().getTemplate(slot.template.id);
        exercises = fullTemplate.exercises;
      } catch (e) {
        developer.log(
          'Failed to fetch full template: $e',
          name: 'routine_builder',
        );
      }
    }

    if (!mounted) return;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _TemplateExercisesSheet(
        templateName: slot.template.name,
        templateDescription: slot.template.description,
        exercises: exercises,
      ),
    );
  }

  void _openTemplatePicker() async {
    final result = await showModalBottomSheet<TemplateDto>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: context.read<ProgramCubit>(),
        child: TemplatePickerSheet(
          existingTemplateIds: _slots.map((s) => s.template.id).toSet(),
        ),
      ),
    );

    if (result != null && mounted) {
      TemplateDto fullTemplate = result;
      // If we selected a standalone library template with empty exercises,
      // dynamically fetch the fully populated detailed record from the DB.
      if (result.exercises.isEmpty && !result.id.startsWith('local_')) {
        setState(() => _isSaving = true);
        try {
          fullTemplate = await getIt<WorkoutSessionRepository>().getTemplate(result.id);
        } catch (e) {
          developer.log('Failed to fetch full template: $e', name: 'routine_builder');
        } finally {
          if (mounted) {
            setState(() => _isSaving = false);
          }
        }
      }
      setState(() {
        _slots.add(_RoutineSlot(
          template: fullTemplate,
          label: 'Day ${_slots.length + 1}',
        ));
      });
    }
  }

  Future<void> _save() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a routine name')),
      );
      return;
    }

    setState(() => _isSaving = true);

    final cubit = context.read<ProgramCubit>();
    final existingProgram = widget.existingProgram;

    // ── Edit mode ──────────────────────────────────────────────────────────
    if (existingProgram != null) {
      // Self-created programs (source == "self") can be edited by the user.
      if (existingProgram.source == 'self') {
        // 1. Update program name/description.
        final updated = await cubit.updateProgram(
          id: existingProgram.id,
          name: name,
          description: _descriptionController.text.trim().nullIfEmpty,
        );

        if (updated == null || !mounted) {
          setState(() => _isSaving = false);
          return;
        }

        // 2. Delete templates that were removed by the user.
        final currentIds = _slots.map((s) => s.template.id).toSet();
        final removedIds =
            _originalTemplateIds.difference(currentIds);
        for (final id in removedIds) {
          await cubit.deleteTemplate(id);
        }

        // 3. Create templates for NEW slots (not part of the original program).
        for (var i = 0; i < _slots.length; i++) {
          final slot = _slots[i];
          if (_originalTemplateIds.contains(slot.template.id)) continue;

          final exercises = slot.template.exercises
              .where((e) => (e.exerciseId ?? e.exercise?.id) != null)
              .map((e) => {
                    'exerciseId': e.exerciseId ?? e.exercise!.id,
                    if (e.targetReps != null) 'targetReps': e.targetReps,
                    if (e.targetSets != null) 'targetSets': e.targetSets,
                    if (e.durationSeconds != null)
                      'durationSeconds': e.durationSeconds,
                    if (e.notes != null) 'notes': e.notes,
                    'order': e.order,
                  })
              .toList();

          await cubit.createTemplate(
            programId: existingProgram.id,
            name: slot.template.name,
            description: slot.template.description,
            exercises: exercises.isNotEmpty ? exercises : null,
          );
        }

        if (mounted) {
          setState(() => _isSaving = false);
          await cubit.loadPrograms();
          Navigator.of(context).maybePop();
        }
        return;
      }

      // Trainer-assigned programs cannot be edited by the client.
      if (mounted) {
        setState(() => _isSaving = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Editing is only available through your trainer.'),
          ),
        );
      }
      return;
    }

    // ── Create mode ────────────────────────────────────────────────────────
    // Create the program via API (name + description only).
    final result = await cubit.createProgram(
      name: name,
      description: _descriptionController.text.trim().nullIfEmpty,
    );

    if (result == null || !mounted) {
      setState(() => _isSaving = false);
      return;
    }

    // Create ALL templates on the backend with inline exercises (single API call each).
    for (var i = 0; i < _slots.length; i++) {
      final slot = _slots[i];

      // Serialize exercises for the API request.
      // Filter out entries with no exerciseId (rest/timed-only steps).
      final exercises = slot.template.exercises
          .where((e) => (e.exerciseId ?? e.exercise?.id) != null)
          .map((e) => {
                'exerciseId': e.exerciseId ?? e.exercise!.id,
                if (e.targetReps != null) 'targetReps': e.targetReps,
                if (e.targetSets != null) 'targetSets': e.targetSets,
                if (e.durationSeconds != null)
                  'durationSeconds': e.durationSeconds,
                if (e.notes != null) 'notes': e.notes,
                'order': e.order,
              })
          .toList();

      final created = await cubit.createTemplate(
        programId: result.id,
        name: slot.template.name,
        description: slot.template.description,
        exercises: exercises.isNotEmpty ? exercises : null,
      );

      if (created != null) {
        // Re-construct the slot using the newly created template and its label.
        _slots[i] = _RoutineSlot(template: created, label: slot.label);
      }
    }

    if (mounted) {
      setState(() => _isSaving = false);
      await cubit.loadPrograms();
      Navigator.of(context).maybePop();
    }
  }
}

/// Bottom sheet showing template exercise details from the routine builder.
class _TemplateExercisesSheet extends StatelessWidget {
  final String templateName;
  final String? templateDescription;
  final List<TemplateExerciseDto> exercises;

  const _TemplateExercisesSheet({
    required this.templateName,
    this.templateDescription,
    required this.exercises,
  });

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        children: [
          ZiroSheetHeader(
            title: templateName,
            showCancel: true,
            onCancel: () => Navigator.of(context).maybePop(),
            leadingText: 'Close',
          ),
          if (templateDescription != null &&
              templateDescription!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
              child: Text(
                templateDescription!,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.mutedText,
                ),
              ),
            ),
          const Divider(height: 1, color: AppColors.borderMuted),
          Expanded(
            child: exercises.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    padding: EdgeInsets.fromLTRB(16, 12, 16, bottomPadding + 16),
                    itemCount: exercises.length,
                    itemBuilder: (context, index) =>
                        _buildExerciseCard(exercises[index], index),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.fitness_center_rounded,
              size: 48,
              color: AppColors.mutedText,
            ),
            SizedBox(height: 16),
            Text(
              'No exercises in this template.',
              style: TextStyle(fontSize: 15, color: AppColors.mutedText),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExerciseCard(TemplateExerciseDto exercise, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Exercise name + order number
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  exercise.exercise?.name ?? 'Exercise',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.foreground,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Details row: muscle group | sets×reps | duration
          _buildDetailRow(exercise),
          // Notes
          if (exercise.notes != null && exercise.notes!.isNotEmpty) ...[
            const SizedBox(height: 6),
            Text(
              exercise.notes!,
              style: const TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
                color: AppColors.mutedText,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDetailRow(TemplateExerciseDto exercise) {
    final chips = <Widget>[];

    if (exercise.exercise?.muscleGroup != null) {
      chips.add(_buildChip(exercise.exercise!.muscleGroup!));
    }
    if (exercise.targetReps != null && exercise.targetReps!.isNotEmpty) {
      chips.add(_buildChip(
        '${exercise.targetSets ?? 3}×${exercise.targetReps}',
      ));
    }
    if (exercise.durationSeconds != null && exercise.durationSeconds! > 0) {
      final minutes = exercise.durationSeconds! ~/ 60;
      final seconds = exercise.durationSeconds! % 60;
      final durationText = minutes > 0
          ? '${minutes}m${seconds > 0 ? ' ${seconds}s' : ''}'
          : '${seconds}s';
      chips.add(_buildChip(durationText));
    }

    if (chips.isEmpty) return const SizedBox.shrink();

    return Wrap(
      spacing: 6,
      runSpacing: 4,
      children: chips,
    );
  }

  Widget _buildChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ),
    );
  }
}

extension on String {
  String? get nullIfEmpty => isEmpty ? null : this;
}
      