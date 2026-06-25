import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_theme.dart';
import '../cubit/fitness_goals_cubit.dart';
import '../cubit/fitness_goals_state.dart';
import '../data/models/fitness_goal_dto.dart';

class FitnessGoalsScreen extends StatelessWidget {
  const FitnessGoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<FitnessGoalsCubit>()..loadGoals(),
      child: const _FitnessGoalsBody(),
    );
  }
}

class _FitnessGoalsBody extends StatelessWidget {
  const _FitnessGoalsBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Fitness Goals'),
      ),
      body: BlocBuilder<FitnessGoalsCubit, FitnessGoalsState>(
        builder: (context, state) {
          return switch (state) {
            FitnessGoalsInitial() || FitnessGoalsLoading() => const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: AppColors.primary,
                ),
              ),
            FitnessGoalsError(:final message) => _ErrorView(message: message),
            FitnessGoalsLoaded(:final goals) => goals.isEmpty
                ? const _EmptyState()
                : _GoalsList(goals: goals),
          };
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateDialog(context),
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _showCreateDialog(BuildContext context) {
    final controller = TextEditingController();
    final targetController = TextEditingController();
    String selectedType = 'weight_loss';

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: const Text('New Fitness Goal'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<String>(
                  initialValue: selectedType,
                  decoration: const InputDecoration(
                    labelText: 'Goal Type',
                  ),
                  items: const [
                    DropdownMenuItem(value: 'weight_loss', child: Text('Weight Loss')),
                    DropdownMenuItem(value: 'weight_gain', child: Text('Weight Gain')),
                    DropdownMenuItem(value: 'strength', child: Text('Strength')),
                    DropdownMenuItem(value: 'endurance', child: Text('Endurance')),
                    DropdownMenuItem(value: 'habit', child: Text('Habit')),
                    DropdownMenuItem(value: 'custom', child: Text('Custom')),
                  ],
                  onChanged: (v) {
                    if (v != null) setDialogState(() => selectedType = v);
                  },
                ),
                const SizedBox(height: 12),
                if (selectedType == 'custom')
                  TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      labelText: 'Goal Name',
                      hintText: 'e.g. Run 5k',
                    ),
                  ),
                TextField(
                  controller: targetController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Target Value',
                    hintText: 'e.g. 70',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                final target = double.tryParse(targetController.text);
                if (target == null || target <= 0) return;

                final name = selectedType == 'custom'
                    ? controller.text
                    : selectedType;

                final body = <String, dynamic>{
                  'type': name,
                  'targetValue': target,
                  'startDate': DateTime.now().toIso8601String().split('T')[0],
                };

                final cubit = context.read<FitnessGoalsCubit>();
                final success = await cubit.createGoal(body);
                if (success && ctx.mounted) Navigator.of(ctx).pop();
              },
              child: const Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}

class _GoalsList extends StatelessWidget {
  final List<FitnessGoalDto> goals;

  const _GoalsList({required this.goals});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FitnessGoalsCubit>();

    return RefreshIndicator(
      onRefresh: () => cubit.refresh(),
      color: AppColors.primary,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: goals.length,
        itemBuilder: (context, index) {
          final goal = goals[index];
          return _GoalCard(
            goal: goal,
            onDelete: () => _confirmDelete(context, cubit, goal),
            onUpdateProgress: () =>
                _showProgressDialog(context, cubit, goal),
          );
        },
      ),
    );
  }

  void _confirmDelete(
    BuildContext context,
    FitnessGoalsCubit cubit,
    FitnessGoalDto goal,
  ) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Goal'),
        content: Text('Are you sure you want to delete "${goal.type}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              cubit.deleteGoal(goal.id);
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showProgressDialog(
    BuildContext context,
    FitnessGoalsCubit cubit,
    FitnessGoalDto goal,
  ) {
    final controller = TextEditingController(
      text: goal.currentValue?.toString() ?? '',
    );

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Update "${goal.type}" Progress'),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Current Value',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final value = double.tryParse(controller.text);
              if (value != null) {
                cubit.updateGoal(goal.id, currentValue: value);
                Navigator.of(ctx).pop();
              }
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }
}

class _GoalCard extends StatelessWidget {
  final FitnessGoalDto goal;
  final VoidCallback onDelete;
  final VoidCallback onUpdateProgress;

  const _GoalCard({
    required this.goal,
    required this.onDelete,
    required this.onUpdateProgress,
  });

  @override
  Widget build(BuildContext context) {
    final progress = goal.targetValue > 0
        ? ((goal.currentValue ?? 0) / goal.targetValue).clamp(0.0, 1.0)
        : 0.0;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onUpdateProgress,
        borderRadius: BorderRadius.circular(24),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.track_changes_rounded,
                      size: 20,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _formatType(goal.type),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.foreground,
                          ),
                        ),
                        if (goal.exerciseName != null)
                          Text(
                            goal.exerciseName!,
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.mutedText,
                            ),
                          ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: onDelete,
                    borderRadius: BorderRadius.circular(8),
                    child: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(
                        Icons.delete_outline_rounded,
                        size: 20,
                        color: AppColors.mutedText,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: AppColors.mutedSurface,
                  valueColor: const AlwaysStoppedAnimation(AppColors.primary),
                  minHeight: 6,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${goal.currentValue?.toStringAsFixed(1) ?? '0'} / ${goal.targetValue.toStringAsFixed(1)}',
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.mutedText,
                    ),
                  ),
                  Text(
                    '${(progress * 100).toStringAsFixed(0)}%',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatType(String type) {
    return type.replaceAll('_', ' ').split(' ').map((w) {
      if (w.isEmpty) return w;
      return '${w[0].toUpperCase()}${w.substring(1)}';
    }).join(' ');
  }
}

class _ErrorView extends StatelessWidget {
  final String message;

  const _ErrorView({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              size: 48,
              color: AppColors.mutedText,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: AppColors.mutedText),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.read<FitnessGoalsCubit>().refresh(),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.track_changes_rounded,
            size: 50,
            color: AppColors.mutedText.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 20),
          const Text(
            'No fitness goals yet',
            style: TextStyle(fontSize: 14, color: AppColors.mutedText),
          ),
          const SizedBox(height: 8),
          const Text(
            'Tap + to create your first goal',
            style: TextStyle(fontSize: 13, color: AppColors.mutedText),
          ),
        ],
      ),
    );
  }
}
