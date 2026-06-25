import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../../notifications/presentation/widgets/ziro_sheet_header.dart';
import '../../trainers/data/models/template_dto.dart';
import '../cubit/home_cubit.dart';
import '../cubit/program_cubit.dart';
import '../data/models/program_dto.dart';
import 'template_picker_sheet.dart';

/// A slot holding a template together with an editable day label.
///
/// Matches iOS `RoutineTemplateSlot` — RoutineBuilderView.swift line 3-7.
class _RoutineSlot {
  final TemplateDto template;
  String label;

  _RoutineSlot({required this.template, required this.label});
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
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

          // Fixed bottom "Add Workout" button
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
                    label: const Text('Add Workout'),
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
                'Workout Slots',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.foreground,
                ),
              ),
              const Spacer(),
              Text(
                '${_slots.length} Sessions',
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
                'Add your first workout template',
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
    return Container(
      key: ValueKey(slot.template.id),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Slot header: drag handle + label + delete
          Row(
            children: [
              // Drag handle — triggers ReorderableListView reorder
              GestureDetector(
                onLongPressStart: (_) {
                  // ReorderableListView detects long-press on drag handle.
                  // We wrap with LongPressDraggable via default behavior.
                },
                child: const Icon(
                  Icons.drag_handle_rounded,
                  size: 20,
                  color: AppColors.mutedText,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SizedBox(
                  width: 120,
                  child: TextField(
                    controller: TextEditingController(text: slot.label),
                    onChanged: (v) => slot.label = v,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => setState(() => _slots.removeAt(index)),
                child: const Icon(
                  Icons.delete_rounded,
                  size: 20,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Template info
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      slot.template.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.foreground,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${slot.template.exercises.length} Exercises',
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
      setState(() {
        _slots.add(_RoutineSlot(
          template: result,
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

    if (widget.existingProgram != null) {
      // The client API does not support updating programs — show a message.
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
      final exercises = slot.template.exercises.map((e) => {
            'exerciseId': e.exerciseId ?? e.exercise?.id ?? '',
            if (e.targetReps != null) 'targetReps': e.targetReps,
            if (e.targetSets != null) 'targetSets': e.targetSets,
            if (e.durationSeconds != null) 'durationSeconds': e.durationSeconds,
            if (e.notes != null) 'notes': e.notes,
            'order': e.order,
          }).toList();

      final created = await cubit.createTemplate(
        programId: result.id,
        name: slot.template.name,
        description: slot.template.description,
        exercises: exercises.isNotEmpty ? exercises : null,
      );

      if (created != null) {
        _slots[i] = _RoutineSlot(template: created, label: slot.label);
      }
    }

    if (mounted) {
      setState(() => _isSaving = false);
      context.read<HomeCubit>().refresh();
      Navigator.of(context).maybePop();
    }
  }
}

extension on String {
  String? get nullIfEmpty => isEmpty ? null : this;
}
      