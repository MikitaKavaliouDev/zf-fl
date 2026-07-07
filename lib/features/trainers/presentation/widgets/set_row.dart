import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import 'input_field.dart';
import 'set_number_badge.dart';
import 'workout_formatting.dart';

/// A single set row within an exercise card.
///
/// Displays set number, weight, reps, optional tempo, RPE indicator,
/// and a completion checkbox with an elastic scale-pulse animation.
/// The row background smoothly morphs to a green tint when completed.
class SetRow extends StatelessWidget {
  const SetRow({
    super.key,
    required this.setNumber,
    this.weight,
    this.reps,
    this.rpe,
    this.tempo,
    this.isCompleted = false,
    required this.isWeightFocused,
    required this.isRepsFocused,
    required this.activeInputText,
    required this.onTapWeight,
    required this.onTapReps,
    required this.onComplete,
    required this.onTapRpe,
    this.onTapTempo,
  });

  final int setNumber;
  final double? weight;
  final int? reps;
  final int? rpe;
  final String? tempo;
  final bool isCompleted;
  final bool isWeightFocused;
  final bool isRepsFocused;
  final String activeInputText;
  final VoidCallback onTapWeight;
  final VoidCallback onTapReps;
  final VoidCallback onComplete;
  final VoidCallback onTapRpe;
  final VoidCallback? onTapTempo;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      color: isCompleted ? Colors.green.withValues(alpha: 0.06) : Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          SetNumberBadge(number: setNumber, isCompleted: isCompleted),
          const SizedBox(width: 12),
          Expanded(
            child: InputField(
              text: _displayWeight,
              isFocused: isWeightFocused,
              onTap: onTapWeight,
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: InputField(
              text: _displayReps,
              isFocused: isRepsFocused,
              onTap: onTapReps,
            ),
          ),
          if (onTapTempo != null) ...[
            const SizedBox(width: 4),
            GestureDetector(
              onTap: onTapTempo,
              child: Container(
                width: 40,
                height: 28,
                decoration: BoxDecoration(
                  color: rpe != null
                      ? AppColors.primary.withValues(alpha: 0.1)
                      : AppColors.mutedSurface,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text(
                  tempo ?? '--',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: tempo != null ? Colors.orange : AppColors.mutedText,
                  ),
                ),
              ),
            ),
          ],
          const SizedBox(width: 4),
          GestureDetector(
            onTap: onTapRpe,
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: rpe != null
                    ? AppColors.primary.withValues(alpha: 0.1)
                    : AppColors.mutedSurface,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Text(
                rpe != null ? '$rpe' : 'RPE',
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                  color: rpe != null ? AppColors.primary : AppColors.mutedText,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          _AnimatedCheckbox(
            isCompleted: isCompleted,
            onTap: onComplete,
          ),
        ],
      ),
    );
  }

  String get _displayWeight {
    if (isWeightFocused) {
      return activeInputText.isEmpty ? '0' : activeInputText;
    }
    return formatWeightDisplay(weight);
  }

  String get _displayReps {
    if (isRepsFocused) {
      return activeInputText.isEmpty ? '0' : activeInputText;
    }
    return formatRepsDisplay(reps);
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Animated checkbox with scale pulse + color morph
// ─────────────────────────────────────────────────────────────────────────────

/// Circular check button that plays an elastic scale-pulse (1.0 → 0.85 → 1.0)
/// on every tap and morphs between hollow (incomplete) and filled (completed).
class _AnimatedCheckbox extends StatefulWidget {
  final bool isCompleted;
  final VoidCallback onTap;

  const _AnimatedCheckbox({
    required this.isCompleted,
    required this.onTap,
  });

  @override
  State<_AnimatedCheckbox> createState() => _AnimatedCheckboxState();
}

class _AnimatedCheckboxState extends State<_AnimatedCheckbox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void didUpdateWidget(covariant _AnimatedCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Play a quick pulse when completion status changes from outside
    if (widget.isCompleted && !oldWidget.isCompleted) {
      _controller.forward().then((_) => _controller.reverse());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    // Trigger the scale pulse
    _controller.forward().then((_) => _controller.reverse());
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final scale = 1.0 - 0.15 * _controller.value; // 1.0 → 0.85 → 1.0
          return Transform.scale(
            scale: scale,
            child: child,
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: widget.isCompleted ? Colors.green : AppColors.mutedSurface,
            borderRadius: BorderRadius.circular(99),
            border: Border.all(
              color: widget.isCompleted ? Colors.green : AppColors.borderMuted,
              width: widget.isCompleted ? 0 : 1.5,
            ),
          ),
          child: widget.isCompleted
              ? const Icon(Icons.check_rounded, size: 18, color: Colors.white)
              : null,
        ),
      ),
    );
  }
}
