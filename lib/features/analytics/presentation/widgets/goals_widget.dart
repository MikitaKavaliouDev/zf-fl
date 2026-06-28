import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../fitness_goals/cubit/fitness_goals_cubit.dart';
import '../../../fitness_goals/cubit/fitness_goals_state.dart';
import '../../../fitness_goals/data/models/fitness_goal_dto.dart';
import 'goal_setting_sheet.dart';

/// Interactive fitness goal widget for the analytics screen.
///
/// Integrates with existing FitnessGoalsCubit to show active goals
/// with progress bars, empty state CTA, and add/edit/delete.
class GoalsWidget extends StatelessWidget {
  const GoalsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<FitnessGoalsCubit>()..loadGoals(),
      child: BlocBuilder<FitnessGoalsCubit, FitnessGoalsState>(
        builder: (context, state) {
          return switch (state) {
            FitnessGoalsInitial() || FitnessGoalsLoading() => const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: AppColors.primary,
                ),
              ),
            ),
            FitnessGoalsError() => const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Center(
                child: Text(
                  'Could not load goals',
                  style: TextStyle(fontSize: 13, color: AppColors.mutedText),
                ),
              ),
            ),
            FitnessGoalsLoaded(:final goals) => goals.isEmpty
                ? _EmptyGoalView()
                : _ActiveGoalsView(goals: goals),
          };
        },
      ),
    );
  }
}

class _EmptyGoalView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.track_changes_rounded,
              size: 28,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Fitness Goals',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Set targets for your volume, frequency, or personal records to track your progress visually.',
              style: TextStyle(fontSize: 13, color: AppColors.mutedText),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _showGoalSheet(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text(
              'Set Your First Goal',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  void _showGoalSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: context.read<FitnessGoalsCubit>(),
        child: const GoalSettingSheet(),
      ),
    );
  }
}

class _ActiveGoalsView extends StatelessWidget {
  final List<FitnessGoalDto> goals;

  const _ActiveGoalsView({required this.goals});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...goals.map((goal) => _GoalProgressRow(
              goal: goal,
              onDelete: () {
                context.read<FitnessGoalsCubit>().deleteGoal(goal.id);
              },
            )),
        if (goals.length < 3)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: TextButton.icon(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) => BlocProvider.value(
                    value: context.read<FitnessGoalsCubit>(),
                    child: const GoalSettingSheet(),
                  ),
                );
              },
              icon: const Icon(Icons.add_circle_outline_rounded, size: 18),
              label: const Text('Add Another Goal'),
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primary,
                textStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _GoalProgressRow extends StatelessWidget {
  final FitnessGoalDto goal;
  final VoidCallback onDelete;

  const _GoalProgressRow({
    required this.goal,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final progress = goal.targetValue > 0
        ? ((goal.currentValue ?? 0) / goal.targetValue).clamp(0.0, 1.0)
        : 0.0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  _formatType(goal.type),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
              PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'delete') onDelete();
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'delete',
                    child: Row(
                      children: [
                        Icon(Icons.delete_outline_rounded, size: 18, color: Colors.red),
                        SizedBox(width: 8),
                        Text('Remove Goal', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                ],
                icon: const Icon(Icons.more_horiz_rounded, size: 18, color: AppColors.mutedText),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
          if (goal.exerciseName != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(
                goal.exerciseName!,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.foreground,
                ),
              ),
            ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                (goal.currentValue ?? 0).toStringAsFixed(0),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '/ ${goal.targetValue.toStringAsFixed(0)} ${_unitLabel(goal.type)}',
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.mutedText,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${(progress * 100).toStringAsFixed(0)}%',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: AppColors.borderMuted,
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
            ),
          ),
          if (progress >= 1.0)
            const Padding(
              padding: EdgeInsets.only(top: 4),
              child: Text(
                'Goal achieved! Great work.',
                style: TextStyle(fontSize: 11, color: AppColors.mutedText),
              ),
            ),
        ],
      ),
    );
  }

  String _formatType(String type) {
    return type.replaceAll('_', ' ').split(' ').map((w) {
      if (w.isEmpty) return w;
      return '${w[0].toUpperCase()}${w.substring(1)}';
    }).join(' ');
  }

  String _unitLabel(String type) {
    if (type == 'sessions' || type == 'Weekly Workouts') return 'workouts';
    if (type == 'pr' || type == 'Personal Record Target') return 'kg';
    return 'kg'; // volume
  }
}
