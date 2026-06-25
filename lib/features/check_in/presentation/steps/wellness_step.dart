import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

/// Step 1: Wellness — energy, stress, hunger, digestion sliders + nutrition
/// compliance.
///
/// Matches iOS QualitativeStep — CheckInWizardView.swift lines 268-440.
class WellnessStep extends StatelessWidget {
  final int energyLevel;
  final int stressLevel;
  final int hungerLevel;
  final int digestionLevel;
  final String? nutritionCompliance;
  final ValueChanged<int> onEnergyLevelChanged;
  final ValueChanged<int> onStressLevelChanged;
  final ValueChanged<int> onHungerLevelChanged;
  final ValueChanged<int> onDigestionLevelChanged;
  final ValueChanged<String> onNutritionComplianceChanged;

  const WellnessStep({
    super.key,
    required this.energyLevel,
    required this.stressLevel,
    required this.hungerLevel,
    required this.digestionLevel,
    this.nutritionCompliance,
    required this.onEnergyLevelChanged,
    required this.onStressLevelChanged,
    required this.onHungerLevelChanged,
    required this.onDigestionLevelChanged,
    required this.onNutritionComplianceChanged,
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
            'Wellness',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'How are you feeling this week?',
            style: TextStyle(
              fontSize: 13,
              color: AppColors.mutedText,
            ),
          ),
          const SizedBox(height: 24),
          _SliderRow(
            label: 'Energy',
            value: energyLevel,
            onChanged: onEnergyLevelChanged,
          ),
          const SizedBox(height: 16),
          _SliderRow(
            label: 'Stress',
            value: stressLevel,
            onChanged: onStressLevelChanged,
          ),
          const SizedBox(height: 16),
          _SliderRow(
            label: 'Hunger',
            value: hungerLevel,
            onChanged: onHungerLevelChanged,
          ),
          const SizedBox(height: 16),
          _SliderRow(
            label: 'Digestion',
            value: digestionLevel,
            onChanged: onDigestionLevelChanged,
          ),
          const SizedBox(height: 24),
          const Text(
            'Nutrition Compliance',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 12),
          _CompliancePicker(
            value: nutritionCompliance,
            onChanged: onNutritionComplianceChanged,
          ),
        ],
      ),
    );
  }
}

class _SliderRow extends StatelessWidget {
  final String label;
  final int value;
  final ValueChanged<int> onChanged;

  const _SliderRow({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.foreground,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.mutedSurface,
                borderRadius: BorderRadius.circular(99),
              ),
              child: Text(
                '$value/10',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: AppColors.primary,
            inactiveTrackColor: AppColors.borderMuted,
            thumbColor: AppColors.primary,
            overlayColor: AppColors.primary.withValues(alpha: 0.12),
            valueIndicatorColor: AppColors.primary,
            valueIndicatorTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
            trackHeight: 4,
          ),
          child: Slider(
            value: value.toDouble(),
            min: 1,
            max: 10,
            divisions: 9,
            label: '$value/10',
            onChanged: (v) => onChanged(v.round()),
          ),
        ),
      ],
    );
  }
}

class _CompliancePicker extends StatelessWidget {
  final String? value;
  final ValueChanged<String> onChanged;

  const _CompliancePicker({
    required this.value,
    required this.onChanged,
  });

  static const _options = [
    _ComplianceOption('ON_TRACK', 'On Track'),
    _ComplianceOption('MOSTLY', 'Mostly'),
    _ComplianceOption('OFF_TRACK', 'Off Track'),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _options.map((option) {
        final isSelected = value == option.value;
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: GestureDetector(
              onTap: () => onChanged(option.value),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.mutedSurface,
                  borderRadius: BorderRadius.circular(99),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primary
                        : AppColors.borderMuted,
                  ),
                ),
                child: Text(
                  option.label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color:
                        isSelected ? Colors.white : AppColors.foreground,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _ComplianceOption {
  final String value;
  final String label;
  const _ComplianceOption(this.value, this.label);
}
