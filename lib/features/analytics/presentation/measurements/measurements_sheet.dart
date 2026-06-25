import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../data/models/progress_response_dto.dart';
import 'add_measurement_sheet.dart';
import 'measurement_history_view.dart';
import 'models/measurement_type.dart';

/// Bottom sheet listing all measurement types grouped by Core / Body Part.
///
/// Matches iOS MeasurementsView pattern.
class MeasurementsSheet extends StatelessWidget {
  final List<DataPoint> weightData;

  const MeasurementsSheet({super.key, this.weightData = const []});

  static const List<MeasurementType> _coreTypes = [
    MeasurementType(id: 'weight', name: 'Weight', category: 'core', icon: Icons.monitor_weight_outlined, unit: 'kg'),
    MeasurementType(id: 'height', name: 'Height', category: 'core', icon: Icons.straighten_rounded, unit: 'cm'),
    MeasurementType(id: 'body_fat', name: 'Body Fat', category: 'core', icon: Icons.percent_rounded, unit: '%'),
    MeasurementType(id: 'caloric_intake', name: 'Caloric Intake', category: 'core', icon: Icons.local_fire_department_outlined, unit: 'kcal'),
  ];

  static const List<MeasurementType> _bodyPartTypes = [
    MeasurementType(id: 'neck', name: 'Neck', category: 'bodyPart', unit: 'cm'),
    MeasurementType(id: 'shoulders', name: 'Shoulders', category: 'bodyPart', unit: 'cm'),
    MeasurementType(id: 'chest', name: 'Chest', category: 'bodyPart', unit: 'cm'),
    MeasurementType(id: 'left_bicep', name: 'Left Bicep', category: 'bodyPart', unit: 'cm'),
    MeasurementType(id: 'right_bicep', name: 'Right Bicep', category: 'bodyPart', unit: 'cm'),
    MeasurementType(id: 'left_forearm', name: 'Left Forearm', category: 'bodyPart', unit: 'cm'),
    MeasurementType(id: 'right_forearm', name: 'Right Forearm', category: 'bodyPart', unit: 'cm'),
    MeasurementType(id: 'upper_abs', name: 'Upper Abs', category: 'bodyPart', unit: 'cm'),
    MeasurementType(id: 'waist', name: 'Waist', category: 'bodyPart', unit: 'cm'),
    MeasurementType(id: 'lower_abs', name: 'Lower Abs', category: 'bodyPart', unit: 'cm'),
    MeasurementType(id: 'hips', name: 'Hips', category: 'bodyPart', unit: 'cm'),
    MeasurementType(id: 'left_thigh', name: 'Left Thigh', category: 'bodyPart', unit: 'cm'),
    MeasurementType(id: 'right_thigh', name: 'Right Thigh', category: 'bodyPart', unit: 'cm'),
    MeasurementType(id: 'left_calf', name: 'Left Calf', category: 'bodyPart', unit: 'cm'),
    MeasurementType(id: 'right_calf', name: 'Right Calf', category: 'bodyPart', unit: 'cm'),
  ];

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            children: [
              // Drag handle
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 8),
                child: Container(
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.borderActive,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Text(
                        'Close',
                        style: TextStyle(fontSize: 14, color: AppColors.mutedText),
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'Measurements',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.foreground,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        _showHistory(context);
                      },
                      child: const Text(
                        'History',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              // Measurement types list
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.only(bottom: 24),
                  children: [
                    // Core section
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                      child: Text(
                        'CORE',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.mutedText,
                        ),
                      ),
                    ),
                    ..._coreTypes.map((type) => _MeasurementRow(
                          type: type,
                          onTap: () => _openAddSheet(context, type),
                        )),

                    // Body Part section
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                      child: Text(
                        'BODY PART',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.mutedText,
                        ),
                      ),
                    ),
                    ..._bodyPartTypes.map((type) => _MeasurementRow(
                          type: type,
                          onTap: () => _openAddSheet(context, type),
                        )),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _openAddSheet(BuildContext context, MeasurementType type) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => AddMeasurementSheet(type: type),
    );
  }

  void _showHistory(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => MeasurementHistoryView(weightData: weightData),
    );
  }
}

class _MeasurementRow extends StatelessWidget {
  final MeasurementType type;
  final VoidCallback onTap;

  const _MeasurementRow({
    required this.type,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          if (type.icon != null) ...[
            Icon(type.icon, size: 20, color: AppColors.primary),
            const SizedBox(width: 12),
          ] else ...[
            const SizedBox(width: 32),
          ],
          Expanded(
            child: Text(
              type.name,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.foreground,
              ),
            ),
          ),
          Text(
            type.unit,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.mutedText,
            ),
          ),
          const SizedBox(width: 12),
          IconButton(
            icon: const Icon(Icons.add_circle_outline_rounded),
            color: AppColors.primary,
            iconSize: 24,
            onPressed: onTap,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}
