import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_theme.dart';
import '../../cubit/trainer_client_analytics_cubit.dart';
import '../../cubit/trainer_client_analytics_state.dart';
import '../../cubit/trainer_client_detail_cubit.dart';
import '../../cubit/trainer_client_detail_state.dart';
import '../../cubit/trainer_client_habits_cubit.dart';
import '../../cubit/trainer_client_habits_state.dart';
import '../../cubit/trainer_client_nutrition_cubit.dart';
import '../../cubit/trainer_client_nutrition_state.dart';
import '../../data/models/trainer_client_detail_dto.dart';
import 'trainer_assign_program_sheet.dart';
import 'trainer_nutrition_plan_editor_sheet.dart';

/// Full client detail with segmented tabs.
class TrainerClientDetailScreen extends StatefulWidget {
  final String clientId;

  const TrainerClientDetailScreen({super.key, required this.clientId});

  @override
  State<TrainerClientDetailScreen> createState() =>
      _TrainerClientDetailScreenState();
}

class _TrainerClientDetailScreenState
    extends State<TrainerClientDetailScreen> {
  int _selectedTab = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TrainerClientDetailCubit>().loadClient(widget.clientId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Client')),
      body: BlocBuilder<TrainerClientDetailCubit, TrainerClientDetailState>(
        builder: (context, state) {
          return switch (state) {
            TrainerClientDetailInitial() || TrainerClientDetailLoading() =>
              const Center(
                  child: CircularProgressIndicator(color: AppColors.primary)),
            TrainerClientDetailError(:final message) => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(message,
                        style:
                            const TextStyle(color: AppColors.mutedText)),
                    const SizedBox(height: 12),
                    FilledButton.icon(
                      onPressed: () => context
                          .read<TrainerClientDetailCubit>()
                          .loadClient(widget.clientId),
                      icon: const Icon(Icons.refresh_rounded),
                      label: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            TrainerClientDetailLoaded(:final client) => Column(
                children: [
                  // Profile header
                  _ProfileHeader(client: client),
                  // Tab bar
                  TabBar(
                    tabs: const [
                      Tab(text: 'Profile'),
                      Tab(text: 'Programs'),
                      Tab(text: 'Analytics'),
                      Tab(text: 'Habits'),
                      Tab(text: 'Nutrition'),
                    ],
                    onTap: (i) => setState(() => _selectedTab = i),
                    labelColor: AppColors.primary,
                    unselectedLabelColor: AppColors.mutedText,
                  ),
                  // Tab content
                  Expanded(
                    child: _buildTabContent(client),
                  ),
                ],
              ),
          };
        },
      ),
    );
  }

  Widget _buildTabContent(TrainerClientDetailDto client) {
    switch (_selectedTab) {
      case 0:
        return _ProfileTab(client: client);
      case 1:
        return _ProgramsTab(clientId: client.id);
      case 2:
        return _AnalyticsTab(clientId: client.id);
      case 3:
        return _HabitsTab(clientId: client.id);
      case 4:
        return _NutritionTab(clientId: client.id);
      default:
        return const SizedBox.shrink();
    }
  }
}

// ── Profile Header ──

class _ProfileHeader extends StatelessWidget {
  final TrainerClientDetailDto client;

  const _ProfileHeader({required this.client});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: AppColors.primary.withValues(alpha: 0.15),
            child: Text(
              client.name.isNotEmpty ? client.name[0].toUpperCase() : '?',
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(client.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700)),
                if (client.email != null)
                  Text(client.email!,
                      style: const TextStyle(
                          fontSize: 13, color: AppColors.mutedText)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Tabs ──

class _ProfileTab extends StatelessWidget {
  final TrainerClientDetailDto client;

  const _ProfileTab({required this.client});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _InfoRow(label: 'Email', value: client.email ?? '—'),
        _InfoRow(label: 'Phone', value: client.phone ?? '—'),
        _InfoRow(label: 'Status', value: client.status),
        _InfoRow(label: 'Goals', value: client.goals ?? '—'),
        _InfoRow(label: 'Health Notes', value: client.healthNotes ?? '—'),
        _InfoRow(
            label: 'Emergency Contact',
            value: client.emergencyContactName ?? '—'),
        if (client.emergencyContactPhone != null)
          _InfoRow(
              label: 'Emergency Phone',
              value: client.emergencyContactPhone!),
      ],
    );
  }
}

class _ProgramsTab extends StatelessWidget {
  final String clientId;

  const _ProgramsTab({required this.clientId});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('No program assigned.',
                style: TextStyle(color: AppColors.mutedText)),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: () => showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (_) =>
                    TrainerAssignProgramSheet(clientId: clientId),
              ),
              icon: const Icon(Icons.add_rounded),
              label: const Text('Assign Program'),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnalyticsTab extends StatelessWidget {
  final String clientId;

  const _AnalyticsTab({required this.clientId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TrainerClientAnalyticsCubit>(
      create: (_) {
        final cubit = getIt<TrainerClientAnalyticsCubit>();
        cubit.loadAnalytics(clientId);
        return cubit;
      },
      child: BlocBuilder<TrainerClientAnalyticsCubit,
          TrainerClientAnalyticsState>(
        builder: (context, state) {
          return switch (state) {
            TrainerClientAnalyticsInitial() ||
            TrainerClientAnalyticsLoading() =>
              const Center(
                  child: CircularProgressIndicator(
                      color: AppColors.primary)),
            TrainerClientAnalyticsError(:final message) => Center(
                child: Text(message,
                    style: const TextStyle(color: AppColors.mutedText))),
            TrainerClientAnalyticsLoaded(:final analytics) => ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _StatCard(
                      label: 'Consistency',
                      value: '${(analytics.consistency * 100).toInt()}%'),
                  const SizedBox(height: 12),
                  Text('Recent PRs',
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600)),
                  ...analytics.recentPRs.map(
                    (pr) => ListTile(
                      title: Text(pr.exercise),
                      subtitle:
                          Text('${pr.value} ${pr.type} • ${pr.date}'),
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
          };
        },
      ),
    );
  }
}

class _HabitsTab extends StatelessWidget {
  final String clientId;

  const _HabitsTab({required this.clientId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TrainerClientHabitsCubit>(
      create: (_) {
        final cubit = getIt<TrainerClientHabitsCubit>();
        cubit.loadHabits(clientId);
        return cubit;
      },
      child: BlocBuilder<TrainerClientHabitsCubit, TrainerClientHabitsState>(
        builder: (context, state) {
          return switch (state) {
            TrainerClientHabitsInitial() || TrainerClientHabitsLoading() =>
              const Center(
                  child: CircularProgressIndicator(
                      color: AppColors.primary)),
            TrainerClientHabitsError(:final message) => Center(
                child: Text(message,
                    style: const TextStyle(color: AppColors.mutedText))),
            TrainerClientHabitsLoaded(:final habits) => ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  ...habits.map((h) => ListTile(
                        leading: Checkbox(
                          value: h.logs.isNotEmpty,
                          onChanged: (_) {},
                          activeColor: AppColors.primary,
                        ),
                        title: Text(h.title,
                            style: const TextStyle(fontSize: 14)),
                        subtitle: Text(h.frequency,
                            style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.mutedText)),
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                      )),
                  const SizedBox(height: 16),
                  FilledButton.icon(
                    onPressed: () {
                      // TODO: Add habit dialog
                    },
                    icon: const Icon(Icons.add_rounded, size: 18),
                    label: const Text('Add Habit'),
                  ),
                ],
              ),
          };
        },
      ),
    );
  }
}

class _NutritionTab extends StatelessWidget {
  final String clientId;

  const _NutritionTab({required this.clientId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TrainerClientNutritionCubit>(
      create: (_) {
        final cubit = getIt<TrainerClientNutritionCubit>();
        cubit.loadPlan(clientId);
        return cubit;
      },
      child:
          BlocBuilder<TrainerClientNutritionCubit,
              TrainerClientNutritionState>(
        builder: (context, state) {
          return switch (state) {
            TrainerClientNutritionInitial() ||
            TrainerClientNutritionLoading() =>
              const Center(
                  child: CircularProgressIndicator(
                      color: AppColors.primary)),
            TrainerClientNutritionError(:final message) => Center(
                child: Text(message,
                    style: const TextStyle(color: AppColors.mutedText))),
            TrainerClientNutritionLoaded(:final plan) =>
              plan == null
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('No nutrition plan.',
                              style:
                                  TextStyle(color: AppColors.mutedText)),
                          const SizedBox(height: 16),
                          FilledButton.icon(
                            onPressed: () =>
                                showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)),
                              ),
                              builder: (_) =>
                                  TrainerNutritionPlanEditorSheet(
                                clientId: clientId,
                              ),
                            ),
                            icon: const Icon(Icons.add_rounded),
                            label: const Text('Create Plan'),
                          ),
                        ],
                      ),
                    )
                  : ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        _InfoRow(
                            label: 'Calories',
                            value: '${plan.calories ?? '—'}'),
                        _InfoRow(
                            label: 'Protein',
                            value: '${plan.protein ?? '—'}g'),
                        _InfoRow(
                            label: 'Carbs',
                            value: '${plan.carbs ?? '—'}g'),
                        _InfoRow(
                            label: 'Fats',
                            value: '${plan.fats ?? '—'}g'),
                        _InfoRow(
                            label: 'Meal Notes',
                            value: plan.mealNotes ?? '—'),
                        _InfoRow(
                            label: 'Foods to Eat',
                            value: plan.foodsToEat ?? '—'),
                        _InfoRow(
                            label: 'Foods to Avoid',
                            value: plan.foodsToAvoid ?? '—'),
                      ],
                    ),
          };
        },
      ),
    );
  }
}

// ── Shared Widgets ──

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(label,
                style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.mutedText)),
          ),
          Expanded(
            child: Text(value,
                style: const TextStyle(
                    fontSize: 14, color: AppColors.foreground)),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;

  const _StatCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderMuted),
      ),
      child: Row(
        children: [
          Text(value,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary)),
          const SizedBox(width: 12),
          Text(label,
              style: const TextStyle(
                  fontSize: 14, color: AppColors.mutedText)),
        ],
      ),
    );
  }
}
