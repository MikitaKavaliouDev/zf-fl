import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

/// Overlay/popup widget for selecting Rate of Perceived Exertion (RPE) 1–10.
///
/// Presents a grid of 10 buttons in 2 rows of 5 with descriptive labels.
/// A selected value is highlighted with primary color.
///
/// Usage:
/// ```dart
/// showDialog(
///   context: context,
///   builder: (_) => RpePicker(
///     currentRpe: currentRpe,
///     onSelected: (rpe) {
///       if (rpe != null) cubit.logSet(rpe: rpe);
///       Navigator.of(context).pop();
///     },
///   ),
/// );
/// ```
class RpePicker extends StatefulWidget {
  /// Pre-selected RPE value, or null for no selection.
  final int? currentRpe;

  /// Called with the selected RPE value (1–10) or `null` when cleared.
  final void Function(int? rpe) onSelected;

  const RpePicker({
    super.key,
    this.currentRpe,
    required this.onSelected,
  });

  @override
  State<RpePicker> createState() => _RpePickerState();
}

class _RpePickerState extends State<RpePicker> {
  int? _selected;

  // RPE labels per value.
  static const _labels = <int, String>{
    1: 'Very Light',
    2: 'Light',
    3: 'Light',
    4: 'Moderate',
    5: 'Moderate',
    6: 'Hard',
    7: 'Hard',
    8: 'Very Hard',
    9: 'Very Hard',
    10: 'Max Effort',
  };

  @override
  void initState() {
    super.initState();
    _selected = widget.currentRpe;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Semi-transparent overlay (tap to dismiss)
        GestureDetector(
          onTap: () => widget.onSelected(_selected),
          child: Container(color: Colors.black.withValues(alpha: 0.4)),
        ),

        // Centered card
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title
                  const Text(
                    'RPE (1-10)',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.foreground,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Grid of 10 buttons (2 rows × 5 cols)
                  _buildGrid(),

                  const SizedBox(height: 20),

                  // Action buttons
                  Row(
                    children: [
                      // Clear
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() => _selected = null);
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.red,
                            side: BorderSide(color: Colors.red.withValues(alpha: 0.3)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          child: const Text('Clear'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Confirm
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => widget.onSelected(_selected),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          child: const Text('Confirm'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGrid() {
    // 2 rows of 5
    return Column(
      children: [
        _buildRow(1, 5),
        const SizedBox(height: 10),
        _buildRow(6, 10),
      ],
    );
  }

  Widget _buildRow(int start, int end) {
    return Row(
      children: List.generate(end - start + 1, (i) {
        final value = start + i;
        final isSelected = _selected == value;
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: i == 0 ? 0 : 6,
              right: i == end - start ? 0 : 6,
            ),
            child: _RpeButton(
              value: value,
              label: _labels[value]!,
              isSelected: isSelected,
              onTap: () => setState(() => _selected = value),
            ),
          ),
        );
      }),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Individual RPE button
// ─────────────────────────────────────────────────────────────────────────────

class _RpeButton extends StatelessWidget {
  final int value;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _RpeButton({
    required this.value,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.mutedSurface,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$value',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : AppColors.foreground,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w500,
                color: isSelected
                    ? Colors.white.withValues(alpha: 0.9)
                    : AppColors.mutedText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
