import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/theme/app_theme.dart';

/// Custom numeric keyboard overlay for logging exercise set values.
///
/// Features a standard numeric pad plus custom action buttons:
/// - Dismiss button
/// - Custom RPE picker or Plate Calculator launcher
/// - -10 / +10 increment modifiers
/// - Next/Done focus advance button
class WorkoutNumericKeyboard extends StatelessWidget {
  final bool isWeight;
  final bool isLastField;
  final String text;
  final ValueChanged<String> onTextChanged;
  final VoidCallback onNext;
  final VoidCallback onDismiss;
  final VoidCallback? onAction;

  const WorkoutNumericKeyboard({
    super.key,
    required this.isWeight,
    this.isLastField = false,
    required this.text,
    required this.onTextChanged,
    required this.onNext,
    required this.onDismiss,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final bottomPad = MediaQuery.of(context).padding.bottom;
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF2F2F7),
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      padding: EdgeInsets.fromLTRB(10, 10, 10, bottomPad + 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Number grid (3 columns)
              Expanded(
                flex: 3,
                child: _NumberGrid(
                  text: text,
                  onTextChanged: onTextChanged,
                ),
              ),
              const SizedBox(width: 8),
              // Action column
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.22,
                child: _ActionColumn(
                  isWeight: isWeight,
                  isLastField: isLastField,
                  onDismiss: onDismiss,
                  onAction: onAction,
                  onTextChanged: onTextChanged,
                  text: text,
                  onNext: onNext,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Number grid (1-9, 0, decimal, backspace)
// ─────────────────────────────────────────────────────────────────────────────

class _NumberGrid extends StatelessWidget {
  final String text;
  final ValueChanged<String> onTextChanged;

  const _NumberGrid({required this.text, required this.onTextChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _numberRow(['1', '2', '3']),
        const SizedBox(height: 8),
        _numberRow(['4', '5', '6']),
        const SizedBox(height: 8),
        _numberRow(['7', '8', '9']),
        const SizedBox(height: 8),
        _bottomRow,
      ],
    );
  }

  Widget _numberRow(List<String> keys) {
    return Row(
      children: keys
          .map((k) => Expanded(child: _KeyButton(label: k, onTap: () => _handleKey(k))))
          .toList(),
    );
  }

  Widget get _bottomRow => Row(
        children: [
          Expanded(child: _KeyButton(label: '0', onTap: () => _handleKey('0'))),
          Expanded(
            child: _KeyButton(
              label: ',',
              onTap: () {
                // Only one decimal separator allowed
                if (text.contains('.') || text.contains(',')) return;
                onTextChanged('$text,');
                HapticFeedback.lightImpact();
              },
            ),
          ),
          Expanded(
            child: _KeyButton(
              icon: Icons.backspace_outlined,
              onTap: () {
                if (text.isNotEmpty) {
                  onTextChanged(text.substring(0, text.length - 1));
                  HapticFeedback.lightImpact();
                }
              },
            ),
          ),
        ],
      );

  // Matches iOS handleKey logic:
  // - "0" is replaced by digit, not appended
  // - Value capped at 999
  void _handleKey(String key) {
    final candidate = text == '0' ? key : text + key;

    // Validate: cap at 999
    final checkValue = double.tryParse(candidate.replaceAll(',', '.'));
    if (checkValue != null && checkValue > 999) {
      HapticFeedback.lightImpact();
      return;
    }

    onTextChanged(candidate);
    HapticFeedback.lightImpact();
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Action column: dismiss, contextual action, +/-, Next
// ─────────────────────────────────────────────────────────────────────────────

class _ActionColumn extends StatelessWidget {
  final bool isWeight;
  final bool isLastField;
  final VoidCallback onDismiss;
  final VoidCallback? onAction;
  final ValueChanged<String> onTextChanged;
  final String text;
  final VoidCallback onNext;

  const _ActionColumn({
    required this.isWeight,
    required this.isLastField,
    required this.onDismiss,
    this.onAction,
    required this.onTextChanged,
    required this.text,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Dismiss button
        _ActionButton(
          icon: Icons.keyboard_arrow_down_rounded,
          onTap: onDismiss,
        ),
        const SizedBox(height: 8),
        // Contextual action (plate calc / RPE)
        if (onAction != null)
          _ActionButton(
            label: isWeight ? '⚡' : 'RPE',
            onTap: onAction!,
            height: 60,
          ),
        if (onAction != null) const SizedBox(height: 8),
        // Increment / Decrement
        Row(
          children: [
            Expanded(
              child: _ActionButton(
                icon: Icons.remove_rounded,
                onTap: () => _handleIncrement(false),
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: _ActionButton(
                icon: Icons.add_rounded,
                onTap: () => _handleIncrement(true),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Next / Done button
        _ActionButton(
          label: isLastField ? 'Done' : 'Next',
          primary: true,
          onTap: onNext,
          height: 60,
        ),
      ],
    );
  }

  // iOS-style increment: 1.25 for weight, 1 for reps
  void _handleIncrement(bool positive) {
    final current = double.tryParse(text.replaceAll(',', '.')) ?? 0;
    late double newValue;

    if (isWeight) {
      const inc = 1.25;
      if (positive) {
        newValue = (current / inc).floorToDouble() * inc + inc;
      } else {
        newValue = (current / inc).ceilToDouble() * inc - inc;
      }
    } else {
      newValue = positive ? current + 1 : current - 1;
    }

    newValue = newValue.clamp(0, 999);

    final result = newValue == newValue.floor()
        ? newValue.toInt().toString()
        : newValue.toStringAsFixed(2).replaceAll('.', ',');

    onTextChanged(result);
    HapticFeedback.lightImpact();
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Keyboard buttons (two variants)
// ─────────────────────────────────────────────────────────────────────────────

/// Number key button (used in the number grid).
class _KeyButton extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final VoidCallback onTap;

  const _KeyButton({this.label, this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: SizedBox(
        height: 56,
        child: Material(
          color: Colors.white.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(8),
            child: Center(
              child: label != null
                  ? Text(
                      label!,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1C1C1E),
                      ),
                    )
                  : Icon(icon, size: 22, color: const Color(0xFF1C1C1E)),
            ),
          ),
        ),
      ),
    );
  }
}

/// Action column button (dismiss, action, +/- , Next).
class _ActionButton extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final VoidCallback onTap;
  final bool primary;
  final double? height;

  const _ActionButton({
    this.label,
    this.icon,
    required this.onTap,
    this.primary = false,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final h = height ?? 44.0;
    return SizedBox(
      height: h,
      child: Material(
        color: primary
            ? const Color(0xFF007AFF)
            : Colors.white.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Center(
            child: label != null
                ? Text(
                    label!,
                    style: TextStyle(
                      fontSize: primary ? 15 : 20,
                      fontWeight: primary ? FontWeight.bold : FontWeight.w500,
                      color: primary ? Colors.white : const Color(0xFF1C1C1E),
                    ),
                  )
                : Icon(
                    icon,
                    size: 20,
                    color: primary ? Colors.white : const Color(0xFF1C1C1E),
                  ),
          ),
        ),
      ),
    );
  }
}
      