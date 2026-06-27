import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../fitness_goals/cubit/fitness_goals_cubit.dart';
import '../../../fitness_goals/cubit/fitness_goals_state.dart';

/// Modal bottom sheet for creating a new fitness goal.
///
/// Supports 3 goal types: Weekly Workouts, Weekly Volume, PR Target.
class GoalSettingSheet extends StatefulWidget {
  const GoalSettingSheet({super.key});

  @override
  State<GoalSettingSheet> createState() => _GoalSettingSheetState();
}

class _GoalSettingSheetState extends State<GoalSettingSheet> {
  String _selectedType = 'sessions';
  final _targetController = TextEditingController();
  String _selectedExercise = 'Bench Press';
  String? _validationError;
  bool _isSaving = false;

  final _exercises = [
    'Bench Press',
    'Squat',
    'Deadlift',
    'Overhead Press',
    'Pull Up',
    'Barbell Row',
    'Dumbbell Curl',
    'Tricep Pushdown',
  ];

  @override
  void dispose() {
    _targetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.65,
      minChildSize: 0.4,
      maxChildSize: 0.85,
      expand: false,
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
              const Text(
                'Set Fitness Goal',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 24),

              // Goal Type selector
              const Text(
                'Goal Type',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 12),
              ..._goalTypes.map((type) {
                final isSelected = _selectedType == type.id;
                final isAlreadyActive = _isAlreadyActive(context, type.id);
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: InkWell(
                    onTap: isAlreadyActive ? null : () {
                      setState(() {
                        _selectedType = type.id;
                        _validate();
                      });
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primary.withValues(alpha: 0.08)
                            : AppColors.mutedSurface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primary.withValues(alpha: 0.3)
                              : AppColors.borderMuted,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            type.icon,
                            size: 22,
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.mutedText,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              type.label,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: isAlreadyActive
                                    ? AppColors.mutedText
                                    : isSelected
                                        ? AppColors.primary
                                        : AppColors.foreground,
                              ),
                            ),
                          ),
                          if (isAlreadyActive)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.borderMuted,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                'Active',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: AppColors.mutedText,
                                ),
                              ),
                            ),
                          if (isSelected && !isAlreadyActive)
                            const Icon(
                              Icons.check_circle_rounded,
                              size: 20,
                              color: AppColors.primary,
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              }),

              // Exercise picker (PR goal only)
              if (_selectedType == 'pr') ...[
                const SizedBox(height: 16),
                const Text(
                  'Exercise',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.foreground,
                  ),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  initialValue: _selectedExercise,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: AppColors.borderActive),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  items: _exercises.map((ex) {
                    return DropdownMenuItem(value: ex, child: Text(ex));
                  }).toList(),
                  onChanged: (v) {
                    if (v != null) setState(() => _selectedExercise = v);
                  },
                ),
              ],

              const SizedBox(height: 20),
              const Text(
                'Target Value',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _targetController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter target',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.borderActive),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  suffixText: _unitLabel,
                  suffixStyle: const TextStyle(color: AppColors.mutedText),
                ),
                onChanged: (_) => setState(_validate),
              ),
              if (_validationError != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    _validationError!,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.red,
                    ),
                  ),
                ),

              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isSaving || _validationError != null
                      ? null
                      : _saveGoal,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: AppColors.borderMuted,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(99),
                    ),
                  ),
                  child: _isSaving
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          'Save Goal',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  List<_GoalTypeOption> get _goalTypes => const [
        _GoalTypeOption(
          id: 'sessions',
          label: 'Weekly Workouts',
          icon: Icons.calendar_month_rounded,
        ),
        _GoalTypeOption(
          id: 'volume',
          label: 'Weekly Volume',
          icon: Icons.fitness_center_rounded,
        ),
        _GoalTypeOption(
          id: 'pr',
          label: 'Personal Record Target',
          icon: Icons.emoji_events_rounded,
        ),
      ];

  String get _unitLabel {
    switch (_selectedType) {
      case 'sessions':
        return 'workouts / week';
      case 'volume':
        return 'kg / week';
      case 'pr':
        return 'kg';
      default:
        return '';
    }
  }

  bool _isAlreadyActive(BuildContext context, String typeId) {
    final state = context.read<FitnessGoalsCubit>().state;
    if (state is FitnessGoalsLoaded) {
      return state.goals.any((g) => g.type == typeId);
    }
    return false;
  }

  void _validate() {
    final text = _targetController.text;
    if (text.isEmpty) {
      setState(() => _validationError = null);
      return;
    }
    final value = double.tryParse(text);
    if (value == null) {
      setState(() => _validationError = 'Please enter a valid number');
      return;
    }
    switch (_selectedType) {
      case 'sessions':
        if (value > 21) {
          setState(() => _validationError = 'Maximum 21 sessions per week');
          return;
        }
        if (value < 1) {
          setState(() => _validationError = 'Minimum 1 session per week');
          return;
        }
        break;
      case 'volume':
        if (value > 100000) {
          setState(
              () => _validationError = 'Please enter a logical value');
          return;
        }
        if (value <= 0) {
          setState(() => _validationError = 'Target must be greater than 0');
          return;
        }
        break;
      case 'pr':
        if (value > 1000) {
          setState(() => _validationError = 'Maximum 1000kg');
          return;
        }
        if (value <= 0) {
          setState(() => _validationError = 'Target must be greater than 0');
          return;
        }
        break;
    }
    setState(() => _validationError = null);
  }

  void _saveGoal() {
    final value = double.tryParse(_targetController.text);
    if (value == null || _validationError != null) return;

    setState(() => _isSaving = true);

    final body = <String, dynamic>{
      'type': _selectedType,
      'targetValue': value,
      'startDate': DateTime.now().toIso8601String().split('T')[0],
    };

    if (_selectedType == 'pr') {
      body['exerciseName'] = _selectedExercise;
    }

    context.read<FitnessGoalsCubit>().createGoal(body).then((success) {
      if (mounted) {
        setState(() => _isSaving = false);
        if (success) {
          Navigator.of(context).pop();
        }
      }
    });
  }
}

class _GoalTypeOption {
  final String id;
  final String label;
  final IconData icon;

  const _GoalTypeOption({
    required this.id,
    required this.label,
    required this.icon,
  });
}
