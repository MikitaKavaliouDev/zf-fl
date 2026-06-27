import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_theme.dart';
import '../../cubit/analytics_cubit.dart';
import '../../data/models/measurement_dto.dart';
import 'models/measurement_type.dart';

/// Bottom sheet for adding a new measurement value.
///
/// Matches iOS AddMeasurementSheet pattern.
class AddMeasurementSheet extends StatefulWidget {
  final MeasurementType type;

  const AddMeasurementSheet({super.key, required this.type});

  @override
  State<AddMeasurementSheet> createState() => _AddMeasurementSheetState();
}

class _AddMeasurementSheetState extends State<AddMeasurementSheet> {
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  bool _isSaving = false;

  @override
  void dispose() {
    _valueController.dispose();
    super.dispose();
  }

  /// Whether this measurement type can be saved via the client measurements API.
  bool get _isSupported =>
      widget.type.id == 'weight' || widget.type.id == 'body_fat';

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.3,
      maxChildSize: 0.7,

      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.all(20),
            children: [
              // Drag handle
              Center(
                child: Container(
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.borderActive,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Header
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(fontSize: 14, color: AppColors.mutedText),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Add ${widget.type.name}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.foreground,
                    ),
                  ),
                  const Spacer(),
                  _isSaving
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.primary,
                          ),
                        )
                      : GestureDetector(
                          onTap: _saveMeasurement,
                          child: const Text(
                            'Save',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                ],
              ),
              const SizedBox(height: 24),

              // Value input
              const Text(
                'Details',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _valueController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[\d.]')),
                ],
                decoration: InputDecoration(
                  hintText: 'Value',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.borderActive),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  suffixText: widget.type.unit,
                  suffixStyle: const TextStyle(color: AppColors.mutedText),
                ),
              ),
              const SizedBox(height: 16),

              // Date picker
              InkWell(
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate,
                    firstDate: DateTime(2020),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null) {
                    setState(() => _selectedDate = picked);
                  }
                },
                borderRadius: BorderRadius.circular(12),
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Date',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.borderActive),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  child: Text(
                    '${_selectedDate.year}-'
                    '${_selectedDate.month.toString().padLeft(2, '0')}-'
                    '${_selectedDate.day.toString().padLeft(2, '0')}',
                    style: const TextStyle(color: AppColors.foreground),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Unit info
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.mutedSurface,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.info_outline_rounded,
                      size: 16,
                      color: AppColors.mutedText,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Unit: ${widget.type.unit}',
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.mutedText,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _saveMeasurement() async {
    final value = double.tryParse(_valueController.text);
    if (value == null) return;

    if (!_isSupported) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('This measurement type is not yet supported.')),
        );
      }
      return;
    }

    setState(() => _isSaving = true);

    try {
      final measurementDate =
          '${_selectedDate.year.toString().padLeft(4, '0')}-'
          '${_selectedDate.month.toString().padLeft(2, '0')}-'
          '${_selectedDate.day.toString().padLeft(2, '0')}';

      final request = CreateMeasurementRequest(
        weightKg: widget.type.id == 'weight' ? value : null,
        bodyFatPercentage: widget.type.id == 'body_fat' ? value : null,
        measurementDate: measurementDate,
      );

      await context.read<AnalyticsCubit>().saveMeasurement(request);

      developer.log(
        'Measurement saved: ${widget.type.id}=$value',
        name: 'measurements',
      );

      if (mounted) {
        Navigator.of(context).pop(true);
      }
    } catch (e, stack) {
      developer.log(
        'Failed to save measurement: $e',
        name: 'measurements',
        error: e,
        stackTrace: stack,
      );
      setState(() => _isSaving = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to save measurement. Please try again.')),
        );
      }
    }
  }
}
