import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/cached_exercise_image.dart';
import '../../../notifications/presentation/widgets/ziro_sheet_header.dart';
import '../../data/models/exercise_dto.dart';

/// Selection mode for [ExercisePickerSheet].
enum ExercisePickerMode {
  /// Pick a single exercise — tap immediately selects and returns.
  single,

  /// Pick multiple exercises — checkboxes + "Add (N)" confirm button.
  multiple,
}

/// Reusable bottom sheet for picking exercises from the exercise library.
///
/// Supports both single-select (used in live workout "Add Exercise") and
/// multi-select (used in template creation "Add Exercises").
///
/// Features fuzzy/typo-tolerant search matching the iOS muscle-group
/// filtered picker pattern.
///
/// Usage:
/// ```dart
/// final result = await showModalBottomSheet(
///   context: context,
///   isScrollControlled: true,
///   backgroundColor: Colors.transparent,
///   builder: (_) => ExercisePickerSheet.multiple(
///     exercises: allExercises,
///     onExercisesSelected: (selected) { /* ... */ },
///   ),
/// );
/// ```
class ExercisePickerSheet extends StatefulWidget {
  /// All available exercises to pick from.
  final List<ExerciseDto> exercises;

  /// Whether the list is still loading.
  final bool isLoading;

  /// Selection mode.
  final ExercisePickerMode mode;

  /// Called in [single] mode when the user taps an exercise.
  final void Function(ExerciseDto exercise)? onExerciseSelected;

  /// Called in [multiple] mode when the user taps Done.
  final void Function(List<ExerciseDto> exercises)? onExercisesSelected;

  const ExercisePickerSheet._({
    super.key,
    required this.exercises,
    this.isLoading = false,
    required this.mode,
    this.onExerciseSelected,
    this.onExercisesSelected,
  });

  /// Single-select constructor — tap immediately selects and returns.
  factory ExercisePickerSheet.single({
    Key? key,
    required List<ExerciseDto> exercises,
    bool isLoading = false,
    required void Function(ExerciseDto exercise) onExerciseSelected,
  }) {
    return ExercisePickerSheet._(
      key: key,
      exercises: exercises,
      isLoading: isLoading,
      mode: ExercisePickerMode.single,
      onExerciseSelected: onExerciseSelected,
    );
  }

  /// Multi-select constructor — checkboxes + "Add (N)" confirm.
  factory ExercisePickerSheet.multiple({
    Key? key,
    required List<ExerciseDto> exercises,
    bool isLoading = false,
    required void Function(List<ExerciseDto> exercises) onExercisesSelected,
  }) {
    return ExercisePickerSheet._(
      key: key,
      exercises: exercises,
      isLoading: isLoading,
      mode: ExercisePickerMode.multiple,
      onExercisesSelected: onExercisesSelected,
    );
  }

  @override
  State<ExercisePickerSheet> createState() => _ExercisePickerSheetState();
}

class _ExercisePickerSheetState extends State<ExercisePickerSheet> {
  final Set<String> _selectedIds = {};
  String _searchQuery = '';
  late List<ExerciseDto> _filtered;
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filtered = widget.exercises;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ExercisePickerSheet oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.exercises != widget.exercises) {
      _applyFilter(_searchQuery);
    }
  }

  // ── Fuzzy matching ────────────────────────────────────────────────────

  /// Each character in [query] must appear in order in [text], but not
  /// necessarily consecutively — makes the search typo-tolerant.
  bool _fuzzyMatch(String text, String query) {
    if (query.isEmpty) return true;
    final t = text.toLowerCase();
    final q = query.toLowerCase();
    int ti = 0;
    for (int qi = 0; qi < q.length; qi++) {
      ti = t.indexOf(q[qi], ti);
      if (ti == -1) return false;
      ti++;
    }
    return true;
  }

  void _applyFilter(String query) {
    setState(() {
      _searchQuery = query;
      if (query.isEmpty) {
        _filtered = widget.exercises;
      } else {
        final lower = query.toLowerCase();
        _filtered = widget.exercises.where((e) {
          return _fuzzyMatch(e.name, lower) ||
              _fuzzyMatch(e.muscleGroup ?? '', lower) ||
              _fuzzyMatch(e.category ?? '', lower);
        }).toList();
      }
    });
  }

  // ── Toggle ────────────────────────────────────────────────────────────

  void _toggle(String id) {
    setState(() {
      if (_selectedIds.contains(id)) {
        _selectedIds.remove(id);
      } else {
        _selectedIds.add(id);
      }
    });
  }

  // ── Build ─────────────────────────────────────────────────────────────

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
              // Header — Cancel + "Add Exercise" + Done/Add(N)
              _buildHeader(),

              const Divider(height: 1, color: AppColors.borderMuted),

              // Search bar
              _buildSearchBar(),

              // Exercise list
              Expanded(
                child: widget.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : _filtered.isEmpty
                        ? _buildEmptyState()
                        : ListView.builder(
                            controller: scrollController,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            itemCount: _filtered.length,
                            itemBuilder: (context, index) {
                              final exercise = _filtered[index];
                              final isSelected =
                                  _selectedIds.contains(exercise.id);
                              return _ExerciseRow(
                                exercise: exercise,
                                isSelected: isSelected,
                                mode: widget.mode,
                                onTap: () {
                                  if (widget.mode == ExercisePickerMode.single) {
                                    widget.onExerciseSelected?.call(exercise);
                                    Navigator.of(context).pop();
                                  } else {
                                    _toggle(exercise.id);
                                  }
                                },
                              );
                            },
                          ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    if (widget.mode == ExercisePickerMode.single) {
      return ZiroSheetHeader(
        title: 'Add Exercise',
        showCancel: true,
        onCancel: () => Navigator.of(context).pop(),
        leadingText: 'Cancel',
      );
    }

    return ZiroSheetHeader(
      title: 'Add Exercise',
      showCancel: true,
      onCancel: () => Navigator.of(context).pop(),
      showDone: true,
      onDone: () {
        final selected = widget.exercises
            .where((e) => _selectedIds.contains(e.id))
            .toList();
        widget.onExercisesSelected?.call(selected);
        Navigator.of(context).pop();
      },
      trailingText: _selectedIds.isEmpty
          ? 'Add'
          : 'Add (${_selectedIds.length})',
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextField(
        controller: _searchController,
        onChanged: _applyFilter,
        decoration: InputDecoration(
          hintText: 'Search exercises...',
          prefixIcon: const Icon(Icons.search_rounded, size: 20),
          suffixIcon: _searchQuery.isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    _searchController.clear();
                    _applyFilter('');
                  },
                  child: const Icon(Icons.clear_rounded, size: 18),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: AppColors.mutedSurface,
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    final msg = _searchQuery.isNotEmpty
        ? 'No exercises match "$_searchQuery"'
        : 'No exercises found';
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _searchQuery.isNotEmpty
                  ? Icons.search_off_rounded
                  : Icons.fitness_center_rounded,
              size: 48,
              color: AppColors.mutedText.withValues(alpha: 0.3),
            ),
            const SizedBox(height: 16),
            Text(
              msg,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Exercise Row
// ─────────────────────────────────────────────────────────────────────────────

class _ExerciseRow extends StatelessWidget {
  final ExerciseDto exercise;
  final bool isSelected;
  final ExercisePickerMode mode;
  final VoidCallback onTap;

  const _ExerciseRow({
    required this.exercise,
    required this.isSelected,
    required this.mode,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withValues(alpha: 0.1)
              : AppColors.mutedSurface,
          borderRadius: BorderRadius.circular(10),
          border: isSelected
              ? Border.all(color: AppColors.primary.withValues(alpha: 0.3))
              : null,
        ),
        child: Row(
          children: [
            // Selection indicator
            _SelectionIndicator(
              isSelected: isSelected,
              mode: mode,
            ),
            const SizedBox(width: 10),

            // Thumbnail — matches iOS ExerciseRow (44×44, rounded)
            CachedExerciseImage(
              imageUrl: exercise.imageUrl,
              videoUrl: exercise.videoUrl,
              height: 44,
              width: 44,
              borderRadius: 8,
              compact: true,
            ),
            const SizedBox(width: 12),

            // Exercise info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exercise.name,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.foreground,
                    ),
                  ),
                  if (exercise.muscleGroup != null)
                    Text(
                      exercise.muscleGroup!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.mutedText,
                      ),
                    ),
                ],
              ),
            ),

            // Muscle group badge (when not selected)
            if (!isSelected && exercise.muscleGroup != null)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.mutedSurface,
                  borderRadius: BorderRadius.circular(99),
                  border: Border.all(color: AppColors.borderMuted),
                ),
                child: Text(
                  exercise.muscleGroup!,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: AppColors.mutedText,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Selection Indicator — circle for single, checkbox circle for multiple
// ─────────────────────────────────────────────────────────────────────────────

class _SelectionIndicator extends StatelessWidget {
  final bool isSelected;
  final ExercisePickerMode mode;

  const _SelectionIndicator({
    required this.isSelected,
    required this.mode,
  });

  @override
  Widget build(BuildContext context) {
    if (mode == ExercisePickerMode.single) {
      return Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? AppColors.primary : Colors.transparent,
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.borderMuted,
            width: 2,
          ),
        ),
        child: isSelected
            ? const Icon(Icons.chevron_right_rounded,
                size: 14, color: Colors.white)
            : null,
      );
    }

    // Multiple mode — checkbox circle
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? AppColors.primary : Colors.transparent,
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.borderMuted,
          width: 2,
        ),
      ),
      child: isSelected
          ? const Icon(Icons.check, size: 14, color: Colors.white)
          : null,
    );
  }
}
