import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../data/models/exercise_log_dto.dart';

/// The metric a user wants to focus on for a given exercise.
enum FocusMetric {
  none,
  volume,
  maxWeight,
  maxReps,
}

/// Dropdown selector for choosing a focus metric (None/Volume/Max Weight/Max Reps)
/// during a workout session. Computes the current value from completed sets.
///
/// Layout: Row with label "Focus:", dropdown, and computed value badge.
///
/// Usage:
/// ```dart
/// FocusMetricSelector(
///   currentMetric: _focusMetric,
///   exerciseName: exercise.name,
///   completedSets: completedSets,
///   onMetricChanged: (metric) { setState(() => _focusMetric = metric); },
/// )
/// ```
class FocusMetricSelector extends StatelessWidget {
  /// The currently selected focus metric.
  final FocusMetric currentMetric;

  /// Name of the exercise (used in the info sheet).
  final String exerciseName;

  /// List of completed exercise log entries to compute values from.
  final List<ExerciseLogDto> completedSets;

  /// Called when the user selects a different focus metric.
  final ValueChanged<FocusMetric> onMetricChanged;

  const FocusMetricSelector({
    super.key,
    required this.currentMetric,
    required this.exerciseName,
    required this.completedSets,
    required this.onMetricChanged,
  });

  // ───────────────────────────────────────────────────────────────────────────
  // Computed values from completed sets
  // ───────────────────────────────────────────────────────────────────────────

  /// Total volume = sum(weight × reps) across all completed sets.
  double? get _totalVolume {
    final done = _completedSets;
    if (done.isEmpty) return null;
    double sum = 0;
    for (final set in done) {
      final w = set.weight;
      final r = set.reps;
      if (w != null && r != null) {
        sum += w * r;
      }
    }
    return sum;
  }

  /// Maximum weight across all completed sets.
  double? get _maxWeight {
    final done = _completedSets;
    if (done.isEmpty) return null;
    final weights = done.map((s) => s.weight).whereType<double>();
    if (weights.isEmpty) return null;
    return weights.reduce(max);
  }

  /// Maximum reps across all completed sets.
  int? get _maxReps {
    final done = _completedSets;
    if (done.isEmpty) return null;
    final reps = done.map((s) => s.reps).whereType<int>();
    if (reps.isEmpty) return null;
    return reps.reduce(max);
  }

  /// Only sets where `isCompleted == true`.
  List<ExerciseLogDto> get _completedSets =>
      completedSets.where((s) => s.isCompleted).toList();

  // ───────────────────────────────────────────────────────────────────────────
  // Formatting helpers
  // ───────────────────────────────────────────────────────────────────────────

  String get _currentValueDisplay {
    switch (currentMetric) {
      case FocusMetric.none:
        return '—';
      case FocusMetric.volume:
        final v = _totalVolume;
        return v != null ? _formatVolume(v) : '—';
      case FocusMetric.maxWeight:
        final w = _maxWeight;
        return w != null ? '${w.toStringAsFixed(0)} kg' : '—';
      case FocusMetric.maxReps:
        final r = _maxReps;
        return r != null ? '$r reps' : '—';
    }
  }

  String _formatVolume(double v) {
    if (v >= 1000) {
      return '${(v / 1000).toStringAsFixed(1)}k kg';
    }
    return '${v.toStringAsFixed(0)} kg';
  }

  static const _metricLabels = <FocusMetric, String>{
    FocusMetric.none: 'None',
    FocusMetric.volume: 'Volume',
    FocusMetric.maxWeight: 'Max Weight',
    FocusMetric.maxReps: 'Max Reps',
  };

  // ───────────────────────────────────────────────────────────────────────────
  // Build
  // ───────────────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Label
        const Text(
          'Focus:',
          style: TextStyle(
            fontSize: 14.0,
            color: AppColors.foreground,
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(width: 8),

        // Dropdown
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.mutedSurface,
            borderRadius: BorderRadius.circular(99),
            border: Border.all(color: AppColors.borderMuted),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<FocusMetric>(
              value: currentMetric,
              icon: const Icon(Icons.keyboard_arrow_down, size: 18),
              iconSize: 18,
              style: const TextStyle(
                fontSize: 14.0,
                color: AppColors.foreground,
              ),
              dropdownColor: AppColors.card,
              isDense: true,
              items: FocusMetric.values.map((metric) {
                return DropdownMenuItem<FocusMetric>(
                  value: metric,
                  child: Text(
                    _metricLabels[metric]!,
                    style: const TextStyle(fontSize: 14.0),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) onMetricChanged(value);
              },
            ),
          ),
        ),

        const SizedBox(width: 12),

        // Computed value badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: currentMetric != FocusMetric.none
                ? AppColors.primary.withValues(alpha: 0.1)
                : AppColors.mutedSurface,
            borderRadius: BorderRadius.circular(99),
          ),
          child: Text(
            _currentValueDisplay,
            style: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.w600,
              color: currentMetric != FocusMetric.none
                  ? AppColors.primary
                  : AppColors.mutedText,
            ),
          ),
        ),

        const Spacer(),

        // Info button
        GestureDetector(
          onTap: () => showFocusMetricInfoSheet(context),
          child: const Padding(
            padding: EdgeInsets.all(4),
            child: Icon(
              Icons.info_outline,
              size: 18,
              color: AppColors.mutedText,
            ),
          ),
        ),
      ],
    );
  }

  // ───────────────────────────────────────────────────────────────────────────
  // Info bottom sheet
  // ───────────────────────────────────────────────────────────────────────────

  /// Shows a modal bottom sheet explaining each focus metric.
  static void showFocusMetricInfoSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => _FocusMetricInfoSheet(),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Info bottom sheet
// ─────────────────────────────────────────────────────────────────────────────

class _FocusMetricInfoSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag handle
          Center(
            child: Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.borderMuted,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Focus Metrics',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),

          const SizedBox(height: 16),

          const _InfoRow(
            label: 'None',
            description: 'No focus metric selected. Standard workout view.',
          ),

          const SizedBox(height: 12),

          const _InfoRow(
            label: 'Volume',
            description:
                'Total weight lifted across all completed sets\n'
                '(weight × reps per set, summed).',
          ),

          const SizedBox(height: 12),

          const _InfoRow(
            label: 'Max Weight',
            description:
                'Highest single weight used across all\n'
                'completed sets.',
          ),

          const SizedBox(height: 12),

          const _InfoRow(
            label: 'Max Reps',
            description:
                'Highest number of reps performed in a\n'
                'single completed set.',
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String description;

  const _InfoRow({
    required this.label,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              color: AppColors.foreground,
            ),
          ),
        ),
        Expanded(
          child: Text(
            description,
            style: const TextStyle(
              fontSize: 13.0,
              color: AppColors.mutedText,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
