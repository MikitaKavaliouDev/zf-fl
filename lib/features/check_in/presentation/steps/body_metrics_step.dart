import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/theme/app_theme.dart';

/// Step 0: Body Metrics — weight, waist, sleep hours.
///
/// Matches iOS QuantitativeStep — CheckInWizardView.swift lines 162-267.
class BodyMetricsStep extends StatelessWidget {
  final double? weight;
  final double? waistCm;
  final double? sleepHours;
  final ValueChanged<double?> onWeightChanged;
  final ValueChanged<double?> onWaistCmChanged;
  final ValueChanged<double?> onSleepHoursChanged;

  const BodyMetricsStep({
    super.key,
    this.weight,
    this.waistCm,
    this.sleepHours,
    required this.onWeightChanged,
    required this.onWaistCmChanged,
    required this.onSleepHoursChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          const Text(
            'Body Metrics',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Track your progress with these measurements.',
            style: TextStyle(
              fontSize: 13,
              color: AppColors.mutedText,
            ),
          ),
          const SizedBox(height: 24),
          _MetricRow(
            label: 'Weight',
            unit: 'kg',
            value: weight,
            onChanged: onWeightChanged,
          ),
          const SizedBox(height: 16),
          _MetricRow(
            label: 'Waist',
            unit: 'cm',
            value: waistCm,
            onChanged: onWaistCmChanged,
          ),
          const SizedBox(height: 16),
          _MetricRow(
            label: 'Avg Sleep',
            unit: 'hrs',
            value: sleepHours,
            onChanged: onSleepHoursChanged,
          ),
        ],
      ),
    );
  }
}

class _MetricRow extends StatelessWidget {
  final String label;
  final String unit;
  final double? value;
  final ValueChanged<double?> onChanged;

  const _MetricRow({
    required this.label,
    required this.unit,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.foreground,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: TextField(
            controller: TextEditingController(
              text: value?.toStringAsFixed(1) ?? '',
            )..selection = TextSelection.fromPosition(
                TextPosition(
                  offset: value?.toStringAsFixed(1).length ?? 0,
                ),
              ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[\d.]')),
            ],
            decoration: InputDecoration(
              hintText: '0.0',
              suffixText: unit,
              suffixStyle: const TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
              ),
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.foreground,
            ),
            onChanged: (text) {
              final parsed = double.tryParse(text);
              onChanged(parsed);
            },
          ),
        ),
      ],
    );
  }
}
