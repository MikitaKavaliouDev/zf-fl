/// Formatting utilities for workout session displays.
///
/// Consolidates 3 similar private formatters from the screen into one
/// focused utility — DRY principle.
library;

import 'package:flutter/material.dart';

/// Formats [d] as `MM:SS` or `H:MM:SS` when hours > 0.
String formatDuration(Duration d) {
  final hours = d.inHours;
  final minutes = d.inMinutes.remainder(60);
  final seconds = d.inSeconds.remainder(60);
  if (hours > 0) {
    return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
  return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
}

/// Formats a countdown [totalSeconds] as `M:SS` (no hours).
String formatCountdown(int totalSeconds) {
  final m = totalSeconds ~/ 60;
  final s = totalSeconds.remainder(60);
  return '$m:${s.toString().padLeft(2, '0')}';
}

/// Formats a rest [Duration] as `M:SS`.
String formatRestDuration(Duration d) => formatCountdown(d.inSeconds);

/// Formats a weight value for display in a non-focused set row.
/// Returns `—` for null/zero, strips decimals from whole numbers.
String formatWeightDisplay(double? weight) {
  if (weight == null || weight == 0) return '—';
  if (weight == weight.floorToDouble()) {
    return weight.toInt().toString();
  }
  return weight.toStringAsFixed(1);
}

/// Formats a reps value for display in a non-focused set row.
/// Returns `—` for null/zero.
String formatRepsDisplay(int? reps) {
  if (reps == null || reps == 0) return '—';
  return reps.toString();
}

/// Formats a numeric value for the custom input field.
/// Returns empty string for null/zero, uses comma as decimal separator.
String formatInputValue(double? value) {
  if (value == null || value == 0) return '';
  if (value == value.floorToDouble()) {
    return value.toInt().toString();
  }
  return value.toStringAsFixed(1).replaceAll('.', ',');
}

/// Colors used for rest timer UI.
class RestTimerColors {
  RestTimerColors._();
  static const Color idle = Color(0xFFE5E7EB);
  static const Color running = Color(0xFFFF9500);
  static const Color finished = Color(0xFF34C759);
}
