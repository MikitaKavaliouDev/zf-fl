import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_theme.dart';
import '../cubit/custom_exercises_cubit.dart';
import '../cubit/custom_exercises_state.dart';
import '../data/models/custom_exercise_dto.dart';

class CustomExercisesScreen extends StatelessWidget {
  const CustomExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CustomExercisesCubit>(
      create: (_) => getIt<CustomExercisesCubit>()..load(),
      child: const _CustomExercisesView(),
    );
  }
}

class _CustomExercisesView extends StatefulWidget {
  const _CustomExercisesView();

  @override
  State<_CustomExercisesView> createState() => _CustomExercisesViewState();
}

class _CustomExercisesViewState extends State<_CustomExercisesView> {
  final _searchController = TextEditingController();
  Timer? _debounceTimer;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onSearchChanged() {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      setState(() {
        _searchQuery = _searchController.text.trim().toLowerCase();
      });
    });
  }

  List<CustomExerciseDto> _filterExercises(List<CustomExerciseDto> exercises) {
    if (_searchQuery.isEmpty) return exercises;
    return exercises.where((e) {
      final name = e.name.toLowerCase();
      final muscle = e.muscleGroup?.toLowerCase() ?? '';
      final equip = e.equipment?.toLowerCase() ?? '';
      return name.contains(_searchQuery) ||
          muscle.contains(_searchQuery) ||
          equip.contains(_searchQuery);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const ValueKey('customExercisesScreen'),
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Custom Exercises'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded),
            onPressed: () {
              // Focus is handled by the search bar always visible
            },
          ),
          IconButton(
            key: const ValueKey('addExerciseButton'),
            icon: const Icon(Icons.add_rounded),
            onPressed: () => _showCreateSheet(context),
          ),
        ],
      ),
      body: BlocConsumer<CustomExercisesCubit, CustomExercisesState>(
        listener: (context, state) {
          if (state is CustomExercisesError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red.shade400,
              ),
            );
          }
        },
        builder: (context, state) {
          return switch (state) {
            CustomExercisesInitial() || CustomExercisesLoading() =>
              const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: AppColors.primary,
                ),
              ),
            CustomExercisesError(:final message) => _ErrorView(
                message: message,
                onRetry: () => context.read<CustomExercisesCubit>().load(),
              ),
            CustomExercisesLoaded(:final exercises) => _ExerciseListView(
                exercises: _filterExercises(exercises),
                searchQuery: _searchQuery,
                searchController: _searchController,
                onDelete: (id, name) =>
                    _confirmDelete(context, id, name),
                onEdit: (exercise) =>
                    _showEditSheet(context, exercise),
              ),
          };
        },
      ),
    );
  }

  void _showCreateSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _ExerciseFormSheet(
        isEditing: false,
        onSave: (data) {
          context.read<CustomExercisesCubit>().create(
                name: data['name'] as String,
                metricType: data['metricType'] as String?,
                muscleGroup: data['muscleGroup'] as String?,
                equipment: data['equipment'] as String?,
                description: data['description'] as String?,
                videoUrl: data['videoUrl'] as String?,
              );
        },
      ),
    );
  }

  void _showEditSheet(BuildContext context, CustomExerciseDto exercise) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _ExerciseFormSheet(
        isEditing: true,
        initialExercise: exercise,
        onSave: (data) {
          context.read<CustomExercisesCubit>().update(
                exercise.id,
                data,
              );
        },
        onDelete: () {
          Navigator.of(context).pop();
          _confirmDelete(context, exercise.id, exercise.name);
        },
      ),
    );
  }

  void _confirmDelete(
      BuildContext context, String id, String name) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.card,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        title: const Text(
          'Delete Exercise?',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.foreground,
          ),
        ),
        content: Text(
          'Are you sure you want to delete "$name"? This cannot be undone.',
          style: const TextStyle(fontSize: 14, color: AppColors.mutedText),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text(
              'Cancel',
              style: TextStyle(color: AppColors.mutedText),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              context.read<CustomExercisesCubit>().delete(id);
            },
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

}

// ── Error View ──

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              size: 50,
              color: AppColors.mutedText,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded, size: 18),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Exercise List View ──

class _ExerciseListView extends StatelessWidget {
  final List<CustomExerciseDto> exercises;
  final String searchQuery;
  final TextEditingController searchController;
  final void Function(String id, String name) onDelete;
  final void Function(CustomExerciseDto exercise) onEdit;

  const _ExerciseListView({
    required this.exercises,
    required this.searchQuery,
    required this.searchController,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final hasResults = exercises.isNotEmpty;

    return Column(
      children: [
        // Search bar
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'Search exercises...',
              prefixIcon: const Icon(
                Icons.search_rounded,
                size: 20,
                color: AppColors.mutedText,
              ),
              suffixIcon: searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(
                        Icons.clear_rounded,
                        size: 18,
                        color: AppColors.mutedText,
                      ),
                      onPressed: () {
                        searchController.clear();
                      },
                    )
                  : null,
            ),
          ),
        ),
        if (!hasResults)
          Expanded(
            child: searchQuery.isEmpty
                ? _buildEmptyState()
                : _buildSearchEmptyState(),
          )
        else
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await context.read<CustomExercisesCubit>().load();
              },
              color: AppColors.primary,
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 24),
                itemCount: exercises.length,
                itemBuilder: (context, index) {
                  final exercise = exercises[index];
                  return _ExerciseRow(
                    exercise: exercise,
                    onTap: () => onEdit(exercise),
                    onDelete: () =>
                        onDelete(exercise.id, exercise.name),
                  );
                },
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.fitness_center_rounded,
                size: 36,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Custom Exercises',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Create your own exercises by tapping +',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          'No exercises found matching "$searchQuery"',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.mutedText,
          ),
        ),
      ),
    );
  }
}

// ── Exercise Row ──

class _ExerciseRow extends StatelessWidget {
  final CustomExerciseDto exercise;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const _ExerciseRow({
    required this.exercise,
    required this.onTap,
    required this.onDelete,
  });

  Color _metricTypeColor(String metricType) {
    switch (metricType) {
      case 'STRENGTH':
        return Colors.orange;
      case 'CARDIO':
        return Colors.red;
      case 'BODYWEIGHT':
        return Colors.green;
      case 'DURATION':
        return Colors.blue;
      default:
        return AppColors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(exercise.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 24),
        color: Colors.red.shade400,
        child: const Icon(
          Icons.delete_rounded,
          color: Colors.white,
          size: 24,
        ),
      ),
      confirmDismiss: (_) async {
        onDelete();
        return false;
      },
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              // 40x40 icon with colored background
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: _metricTypeColor(exercise.metricType)
                      .withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.fitness_center_rounded,
                  size: 20,
                  color: _metricTypeColor(exercise.metricType),
                ),
              ),
              const SizedBox(width: 12),
              // Name + subtitle
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exercise.name,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.foreground,
                      ),
                    ),
                    if (exercise.muscleGroup != null ||
                        exercise.equipment != null)
                      Text(
                        [
                          if (exercise.muscleGroup != null)
                            exercise.muscleGroup,
                          if (exercise.equipment != null)
                            exercise.equipment,
                        ].join(' · '),
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.mutedText,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                size: 20,
                color: AppColors.mutedText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Create/Edit Bottom Sheet ──

class _ExerciseFormSheet extends StatefulWidget {
  final bool isEditing;
  final CustomExerciseDto? initialExercise;
  final void Function(Map<String, dynamic> data) onSave;
  final VoidCallback? onDelete;

  const _ExerciseFormSheet({
    required this.isEditing,
    this.initialExercise,
    required this.onSave,
    this.onDelete,
  });

  @override
  State<_ExerciseFormSheet> createState() => _ExerciseFormSheetState();
}

class _ExerciseFormSheetState extends State<_ExerciseFormSheet> {
  late final TextEditingController _nameController;
  late final TextEditingController _muscleGroupController;
  late final TextEditingController _equipmentController;
  late final TextEditingController _descriptionController;

  String? _metricType;

  static const _metricTypes = [
    'STRENGTH',
    'CARDIO',
    'BODYWEIGHT',
    'DURATION',
  ];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: widget.initialExercise?.name ?? '',
    );
    _muscleGroupController = TextEditingController(
      text: widget.initialExercise?.muscleGroup ?? '',
    );
    _equipmentController = TextEditingController(
      text: widget.initialExercise?.equipment ?? '',
    );
    _descriptionController = TextEditingController(
      text: widget.initialExercise?.description ?? '',
    );
    _metricType = widget.initialExercise?.metricType;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _muscleGroupController.dispose();
    _equipmentController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Map<String, dynamic> _buildData() {
    return {
      'name': _nameController.text.trim(),
      if (_metricType != null) 'metricType': _metricType,
      if (_muscleGroupController.text.trim().isNotEmpty)
        'muscleGroup': _muscleGroupController.text.trim(),
      if (_equipmentController.text.trim().isNotEmpty)
        'equipment': _equipmentController.text.trim(),
      if (_descriptionController.text.trim().isNotEmpty)
        'description': _descriptionController.text.trim(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      padding: EdgeInsets.only(bottom: bottomInset),
      decoration: const BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Drag handle
              Center(
                child: Container(
                  width: 36,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: AppColors.borderActive,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              // Title
              Text(
                widget.isEditing ? 'Edit Exercise' : 'New Exercise',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 20),
              // Name field
              const Text(
                'Exercise Name *',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                key: const ValueKey('exerciseNameField'),
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: 'e.g. Turkish Get-Up',
                ),
                textCapitalization: TextCapitalization.words,
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 16),
              // Metric type dropdown
              const Text(
                'Metric Type',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 6),
              DropdownButtonFormField<String>(
                initialValue: _metricType,
                decoration: const InputDecoration(
                  hintText: 'Select metric type',
                ),
                items: _metricTypes
                    .map(
                      (t) => DropdownMenuItem(
                        value: t,
                        child: Text(
                          t[0] + t.substring(1).toLowerCase(),
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.foreground,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (v) => setState(() => _metricType = v),
              ),
              const SizedBox(height: 16),
              // Muscle group
              const Text(
                'Muscle Group',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                controller: _muscleGroupController,
                decoration: const InputDecoration(
                  hintText: 'e.g. Core, Shoulders',
                ),
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(height: 16),
              // Equipment
              const Text(
                'Equipment',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                controller: _equipmentController,
                decoration: const InputDecoration(
                  hintText: 'e.g. Kettlebell, Band',
                ),
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(height: 16),
              // Description
              const Text(
                'Description',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  hintText: 'Optional notes...',
                ),
                maxLines: 4,
                textCapitalization: TextCapitalization.sentences,
              ),
              const SizedBox(height: 24),
              // Save button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _nameController.text.trim().isEmpty
                      ? null
                      : () {
                          widget.onSave(_buildData());
                          Navigator.of(context).pop();
                        },
                  child: Text(
                    widget.isEditing ? 'Save Changes' : 'Create Exercise',
                  ),
                ),
              ),
              // Delete button (edit mode only)
              if (widget.isEditing && widget.onDelete != null) ...[
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: widget.onDelete,
                    child: const Text(
                      'Delete Exercise',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
