import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../daily_targets/cubit/daily_targets_cubit.dart';
import '../../../daily_targets/cubit/daily_targets_state.dart';
import '../../../daily_targets/data/models/daily_target_dto.dart';

/// Section displaying the user's daily targets on the home dashboard.
///
/// Listens to [DailyTargetsCubit] (app-level) and shows today's targets
/// when loaded, or an empty state with a prompt to set a target.
class DailyTargetsSection extends StatefulWidget {
  final VoidCallback? onTapAddTarget;

  const DailyTargetsSection({super.key, this.onTapAddTarget});

  @override
  State<DailyTargetsSection> createState() => _DailyTargetsSectionState();
}

class _DailyTargetsSectionState extends State<DailyTargetsSection> {
  bool _initialLoadDone = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialLoadDone) {
      _initialLoadDone = true;
      final today = DateFormat('yyyy-MM-dd').format(DateTime.now());
      context.read<DailyTargetsCubit>().loadTargets(date: today);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DailyTargetsCubit, DailyTargetsState>(
      builder: (context, state) {
        final targets = switch (state) {
          DailyTargetsLoaded(:final targets) => targets,
          _ => <DailyTargetDto>[],
        };

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Daily Targets',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.foreground,
                    ),
                  ),
                  IconButton(
                    onPressed: widget.onTapAddTarget,
                    icon: const Icon(
                      Icons.add_circle_outline,
                      color: AppColors.primary,
                      size: 24,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: 32,
                      minHeight: 32,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            if (targets.isEmpty)
              _EmptyTargetsState(onTapSetTarget: widget.onTapAddTarget)
            else
              ...targets.map((t) => _CompactTargetCard(target: t)),
          ],
        );
      },
    );
  }
}

/// Compact single-target card for the dashboard.
class _CompactTargetCard extends StatelessWidget {
  final DailyTargetDto target;

  const _CompactTargetCard({required this.target});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DailyTargetsCubit>();
    final progress = target.targetValue > 0
        ? ((target.currentValue ?? 0) / target.targetValue).clamp(0.0, 1.0)
        : 0.0;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.mutedSurface,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 22,
                  height: 22,
                  child: Checkbox(
                    value: target.isCompleted,
                    onChanged: (v) {
                      if (v != null) cubit.toggleComplete(target.id, v);
                    },
                    activeColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    target.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.foreground,
                      decoration: target.isCompleted
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: target.isCompleted ? 1.0 : progress,
                backgroundColor: AppColors.borderMuted,
                valueColor: AlwaysStoppedAnimation(
                  target.isCompleted ? Colors.green : AppColors.primary,
                ),
                minHeight: 5,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              '${target.currentValue?.toStringAsFixed(0) ?? '0'} ${target.unit} / ${target.targetValue.toStringAsFixed(0)} ${target.unit}',
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.mutedText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Empty state shown when no daily targets exist for today.
class _EmptyTargetsState extends StatelessWidget {
  final VoidCallback? onTapSetTarget;

  const _EmptyTargetsState({this.onTapSetTarget});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'No daily targets set',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.mutedText,
            ),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: onTapSetTarget,
            style: TextButton.styleFrom(
              foregroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(99),
              ),
            ),
            child: const Text(
              'Set a Daily Target',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
