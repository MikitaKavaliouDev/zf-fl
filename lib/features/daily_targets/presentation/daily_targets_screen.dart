import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_theme.dart';
import '../cubit/daily_targets_cubit.dart';
import '../cubit/daily_targets_state.dart';
import '../data/models/daily_target_dto.dart';

class DailyTargetsScreen extends StatefulWidget {
  final DateTime? initialDate;

  const DailyTargetsScreen({super.key, this.initialDate});

  @override
  State<DailyTargetsScreen> createState() => _DailyTargetsScreenState();
}

class _DailyTargetsScreenState extends State<DailyTargetsScreen> {
  late DateTime _selectedDate;
  late DailyTargetsCubit _cubit;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate ?? DateTime.now();
    _cubit = getIt<DailyTargetsCubit>();
    _cubit.loadTargets(date: _dateParam);
  }

  String get _dateParam =>
      DateFormat('yyyy-MM-dd').format(_selectedDate);

  void _changeDate(int days) {
    setState(() {
      _selectedDate = _selectedDate.add(Duration(days: days));
    });
    _cubit.loadTargets(date: _dateParam);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DailyTargetsCubit>.value(
      value: _cubit,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded,
                color: AppColors.foreground),
            onPressed: () {
              final router = GoRouter.of(context);
              if (router.canPop()) {
                router.pop();
              } else {
                context.go('/');
              }
            },
          ),
          title: const Text(
            'Daily Targets',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: AppColors.foreground,
            ),
          ),
        ),
        body: Column(
          children: [
            _DateNavigation(
              selectedDate: _selectedDate,
              onPrevious: () => _changeDate(-1),
              onNext: () => _changeDate(1),
            ),
            Expanded(
              child: BlocBuilder<DailyTargetsCubit, DailyTargetsState>(
                builder: (context, state) {
                  return switch (state) {
                    DailyTargetsInitial() || DailyTargetsLoading() =>
                      const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          color: AppColors.primary,
                        ),
                      ),
                    DailyTargetsError(:final message) =>
                      _ErrorView(message: message),
                    DailyTargetsLoaded(:final targets) => targets.isEmpty
                        ? const _EmptyState()
                        : _TargetsList(targets: targets),
                  };
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showCreateDialog(context),
          backgroundColor: AppColors.primary,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }

  void _showCreateDialog(BuildContext context) {
    final titleController = TextEditingController();
    final targetController = TextEditingController();
    final unitController = TextEditingController();
    String selectedType = 'steps';

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: const Text('New Daily Target'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    hintText: 'e.g. Walk 10,000 steps',
                  ),
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  initialValue: selectedType,
                  decoration: const InputDecoration(
                    labelText: 'Type',
                  ),
                  items: const [
                    DropdownMenuItem(value: 'steps', child: Text('Steps')),
                    DropdownMenuItem(value: 'water', child: Text('Water')),
                    DropdownMenuItem(value: 'calories', child: Text('Calories')),
                    DropdownMenuItem(value: 'protein', child: Text('Protein')),
                    DropdownMenuItem(value: 'sleep', child: Text('Sleep')),
                    DropdownMenuItem(value: 'exercise', child: Text('Exercise')),
                    DropdownMenuItem(value: 'custom', child: Text('Custom')),
                  ],
                  onChanged: (v) {
                    if (v != null) setDialogState(() => selectedType = v);
                  },
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: targetController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Target Value',
                    hintText: 'e.g. 10000',
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: unitController,
                  decoration: const InputDecoration(
                    labelText: 'Unit',
                    hintText: 'e.g. steps, ml, mins',
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
                if (titleController.text.trim().isEmpty) return;

                final body = <String, dynamic>{
                  'title': titleController.text.trim(),
                  'type': selectedType,
                  'targetValue': target,
                  'unit': unitController.text.trim().isNotEmpty
                      ? unitController.text.trim()
                      : 'count',
                  'date': _dateParam,
                };

                final success = await _cubit.createTarget(body);
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

class _DateNavigation extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const _DateNavigation({
    required this.selectedDate,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final isToday = _isSameDay(selectedDate, DateTime.now());
    final formatter = DateFormat('EEEE, MMMM d');
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left_rounded),
            onPressed: onPrevious,
            color: AppColors.primary,
          ),
          const SizedBox(width: 8),
          Column(
            children: [
              Text(
                formatter.format(selectedDate),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.foreground,
                ),
              ),
              if (isToday)
                Container(
                  margin: const EdgeInsets.only(top: 2),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.chevron_right_rounded),
            onPressed: onNext,
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}

class _TargetsList extends StatelessWidget {
  final List<DailyTargetDto> targets;

  const _TargetsList({required this.targets});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DailyTargetsCubit>();

    return RefreshIndicator(
      onRefresh: () => cubit.refresh(),
      color: AppColors.primary,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: targets.length,
        itemBuilder: (context, index) {
          final target = targets[index];
          return _TargetCard(
            target: target,
            onToggle: (v) => cubit.toggleComplete(target.id, v),
            onDelete: () => _confirmDelete(context, cubit, target),
            onUpdateProgress: () =>
                _showProgressDialog(context, cubit, target),
          );
        },
      ),
    );
  }

  void _confirmDelete(
    BuildContext context,
    DailyTargetsCubit cubit,
    DailyTargetDto target,
  ) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Target'),
        content: Text('Are you sure you want to delete "${target.title}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              cubit.deleteTarget(target.id);
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showProgressDialog(
    BuildContext context,
    DailyTargetsCubit cubit,
    DailyTargetDto target,
  ) {
    final controller = TextEditingController(
      text: target.currentValue?.toString() ?? '',
    );

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Update "${target.title}" Progress'),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'Current Value'),
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
                cubit.updateProgress(target.id, value);
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

class _TargetCard extends StatelessWidget {
  final DailyTargetDto target;
  final ValueChanged<bool> onToggle;
  final VoidCallback onDelete;
  final VoidCallback onUpdateProgress;

  const _TargetCard({
    required this.target,
    required this.onToggle,
    required this.onDelete,
    required this.onUpdateProgress,
  });

  @override
  Widget build(BuildContext context) {
    final progress = target.targetValue > 0
        ? ((target.currentValue ?? 0) / target.targetValue).clamp(0.0, 1.0)
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
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Checkbox(
                      value: target.isCompleted,
                      onChanged: (v) {
                        if (v != null) onToggle(v);
                      },
                      activeColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          target.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.foreground,
                            decoration: target.isCompleted
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        if (target.description != null)
                          Text(
                            target.description!,
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
                  value: target.isCompleted ? 1.0 : progress,
                  backgroundColor: AppColors.mutedSurface,
                  valueColor: AlwaysStoppedAnimation(
                    target.isCompleted ? Colors.green : AppColors.primary,
                  ),
                  minHeight: 6,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${target.currentValue?.toStringAsFixed(0) ?? '0'} ${target.unit} / ${target.targetValue.toStringAsFixed(0)} ${target.unit}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.mutedText,
                    ),
                  ),
                  Text(
                    '${(progress * 100).toStringAsFixed(0)}%',
                    style: const TextStyle(
                      fontSize: 12,
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
              onPressed: () =>
                  context.read<DailyTargetsCubit>().refresh(),
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
            Icons.checklist_rounded,
            size: 50,
            color: AppColors.mutedText.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 20),
          const Text(
            'No targets for this day',
            style: TextStyle(fontSize: 14, color: AppColors.mutedText),
          ),
          const SizedBox(height: 8),
          const Text(
            'Tap + to create a daily target',
            style: TextStyle(fontSize: 13, color: AppColors.mutedText),
          ),
        ],
      ),
    );
  }
}
      