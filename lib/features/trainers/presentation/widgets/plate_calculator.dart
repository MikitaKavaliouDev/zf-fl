import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

/// Shows barbell plate configuration for the given weight.
///
/// Standard plates: 25kg, 20kg, 15kg, 10kg, 5kg, 2.5kg, 1.25kg
/// Barbell weight: 20kg (default)
///
/// Usage (bottom sheet mode):
/// ```dart
/// showModalBottomSheet(
///   context: context,
///   builder: (_) => PlateCalculator(
///     targetWeight: weight,
///     barbellWeight: 20,
///   ),
/// );
/// ```
///
/// Usage (inline mode):
/// ```dart
/// PlateCalculator.inline(
///   targetWeight: weight,
///   barbellWeight: 20,
/// )
/// ```
class PlateCalculator extends StatelessWidget {
  final double targetWeight;
  final double barbellWeight;
  final _PlateCalculatorMode _mode;

  /// Full bottom sheet with handle, title, and Done button.
  const PlateCalculator({
    super.key,
    required this.targetWeight,
    this.barbellWeight = 20,
  }) : _mode = _PlateCalculatorMode.sheet;

  /// Compact inline card without drag handle, title, or Done button.
  ///
  /// Renders as a small card with muted background, per-side text, and plate chips.
  factory PlateCalculator.inline({
    required double targetWeight,
    double barbellWeight = 20,
  }) {
    return PlateCalculator._inline(
      targetWeight: targetWeight,
      barbellWeight: barbellWeight,
    );
  }

  const PlateCalculator._inline({
    required this.targetWeight,
    this.barbellWeight = 20,
  }) : _mode = _PlateCalculatorMode.inline;

  static const _availablePlates = [25.0, 20.0, 15.0, 10.0, 5.0, 2.5, 1.25];

  List<double> calculatePlates() {
    final perSide = (targetWeight - barbellWeight) / 2;
    if (perSide <= 0) return [];

    final List<double> result = [];
    double remaining = perSide;

    for (final plate in _availablePlates) {
      while ((remaining - plate) >= -0.01) {
        result.add(plate);
        remaining -= plate;
      }
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final plates = calculatePlates();
    final perSide = (targetWeight - barbellWeight) / 2;

    switch (_mode) {
      case _PlateCalculatorMode.inline:
        return _buildInline(context, plates, perSide);
      case _PlateCalculatorMode.sheet:
        return _buildSheet(context, plates, perSide);
    }
  }

  Widget _buildInline(BuildContext context, List<double> plates, double perSide) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Per side: ${perSide.toStringAsFixed(1)} kg',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 8),
          if (plates.isEmpty)
            const Text(
              'Weight is less than barbell weight',
              style: TextStyle(fontSize: 12, color: AppColors.mutedText),
            )
          else
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: plates.map((plate) {
                return Chip(
                  label: Text(
                    '${plate.toStringAsFixed(1)} kg',
                    style: const TextStyle(fontSize: 11),
                  ),
                  backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                  side: BorderSide.none,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                );
              }).toList(),
            ),
        ],
      ),
    );
  }

  Widget _buildSheet(BuildContext context, List<double> plates, double perSide) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Plate Calculator',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '${targetWeight.toStringAsFixed(1)} kg — Barbell ${barbellWeight.toStringAsFixed(0)} kg',
              style: const TextStyle(fontSize: 14, color: AppColors.mutedText),
            ),
            const SizedBox(height: 8),
            Text(
              '${perSide.toStringAsFixed(1)} kg per side',
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            if (plates.isEmpty)
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Weight is less than barbell weight (20 kg)',
                  style: TextStyle(color: AppColors.mutedText),
                ),
              )
            else
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: plates.map((plate) {
                  return Chip(
                    label: Text('${plate.toStringAsFixed(1)} kg'),
                    backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                    side: BorderSide.none,
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  );
                }).toList(),
              ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Done'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum _PlateCalculatorMode { sheet, inline }
