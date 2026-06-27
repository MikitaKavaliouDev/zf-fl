import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_theme.dart';
import '../cubit/nutrition_habits_cubit.dart';
import '../cubit/nutrition_habits_state.dart';
import '../data/models/daily_habit_dto.dart';
import '../data/models/habit_log_dto.dart';
import '../data/models/nutrition_plan_dto.dart';

/// Nutrition plan + habit tracking screen.
///
/// Maps to iOS NutritionDetailView + Today's Habits section
/// (see ios-nutrition-habits-handoff.md).
class NutritionHabitsScreen extends StatefulWidget {
  const NutritionHabitsScreen({super.key});

  @override
  State<NutritionHabitsScreen> createState() => _NutritionHabitsScreenState();
}

class _NutritionHabitsScreenState extends State<NutritionHabitsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NutritionHabitsCubit>().loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Nutrition & Habits',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: AppColors.foreground,
          ),
        ),
      ),
      body: BlocBuilder<NutritionHabitsCubit, NutritionHabitsState>(
        builder: (context, state) {
          return switch (state) {
            NutritionHabitsInitial() || NutritionHabitsLoading() =>
              const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: AppColors.primary,
                ),
              ),
            NutritionHabitsError(:final message) =>
              _ErrorView(message: message, onRetry: () => context.read<NutritionHabitsCubit>().loadData()),
            NutritionHabitsLoaded(:final plan, :final habits) =>
              RefreshIndicator(
                onRefresh: () => context.read<NutritionHabitsCubit>().refresh(),
                color: AppColors.primary,
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
                  children: [
                    // ── Nutrition Plan Section ──
                    if (plan != null) ...[
                      _NutritionPlanCard(plan: plan),
                      const SizedBox(height: 24),
                    ] else ...[
                      _NoPlanCard(),
                      const SizedBox(height: 24),
                    ],

                    // ── Today's Habits Section ──
                    _HabitsSection(
                      habits: habits,
                      onToggle: (habitId, isCompleted) =>
                          context.read<NutritionHabitsCubit>().toggleHabit(habitId, isCompleted),
                    ),
                  ],
                ),
              ),
          };
        },
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Nutrition Plan Card
// ─────────────────────────────────────────────────────────────────────────────

class _NutritionPlanCard extends StatelessWidget {
  final NutritionPlanDto plan;

  const _NutritionPlanCard({required this.plan});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title + active badge
        Row(
          children: [
            Expanded(
              child: Text(
                plan.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.foreground,
                ),
              ),
            ),
            if (plan.isActive)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(99),
                ),
                child: const Text(
                  'Active',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.green,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 20),

        // ── Daily Targets / Macros ──
        const Text(
          'Daily Targets',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.mutedText,
          ),
        ),
        const SizedBox(height: 12),
        _MacroBar(
          label: 'Calories',
          value: plan.calories,
          unit: 'kcal',
          maxRef: 3000,
          color: AppColors.primary,
        ),
        const SizedBox(height: 10),
        _MacroBar(
          label: 'Protein',
          value: plan.protein,
          unit: 'g',
          maxRef: 300,
          color: const Color(0xFF22C55E),
        ),
        const SizedBox(height: 10),
        _MacroBar(
          label: 'Carbs',
          value: plan.carbs,
          unit: 'g',
          maxRef: 400,
          color: const Color(0xFFF59E0B),
        ),
        const SizedBox(height: 10),
        _MacroBar(
          label: 'Fats',
          value: plan.fats,
          unit: 'g',
          maxRef: 100,
          color: const Color(0xFFEF4444),
        ),

        // ── Section dividers ──
        if (plan.mealNotes != null && plan.mealNotes!.isNotEmpty) ...[
          const SizedBox(height: 24),
          _SectionBlock(title: 'Meal Notes', content: plan.mealNotes!),
        ],

        if (plan.foodsToEat != null && plan.foodsToEat!.isNotEmpty) ...[
          const SizedBox(height: 20),
          _SectionBlock(title: 'Foods to Eat', content: plan.foodsToEat!),
        ],

        if (plan.foodsToAvoid != null && plan.foodsToAvoid!.isNotEmpty) ...[
          const SizedBox(height: 20),
          _SectionBlock(title: 'Foods to Avoid', content: plan.foodsToAvoid!),
        ],

        if (plan.mealTiming != null && plan.mealTiming!.isNotEmpty) ...[
          const SizedBox(height: 20),
          _SectionBlock(title: 'Meal Timing', content: plan.mealTiming!),
        ],

        if (plan.hydration != null && plan.hydration!.isNotEmpty) ...[
          const SizedBox(height: 20),
          _SectionBlock(title: 'Hydration', content: plan.hydration!),
        ],

        if (plan.supplements != null && plan.supplements!.isNotEmpty) ...[
          const SizedBox(height: 20),
          _SectionBlock(title: 'Supplements', content: plan.supplements!),
        ],

        if (plan.habitNotes != null && plan.habitNotes!.isNotEmpty) ...[
          const SizedBox(height: 20),
          _SectionBlock(title: 'Habit Notes', content: plan.habitNotes!),
        ],
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// No Plan Card (empty state)
// ─────────────────────────────────────────────────────────────────────────────

class _NoPlanCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: const BoxDecoration(
              color: Color(0xFF22C55E),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.restaurant_rounded,
              size: 28,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'No Nutrition Plan',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Your trainer hasn\'t assigned a nutrition plan yet.\nCheck back after your next consultation.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: AppColors.mutedText,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Macro Progress Bar
// ─────────────────────────────────────────────────────────────────────────────

class _MacroBar extends StatelessWidget {
  final String label;
  final int? value;
  final String unit;
  final int maxRef;
  final Color color;

  const _MacroBar({
    required this.label,
    required this.value,
    required this.unit,
    required this.maxRef,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final displayValue = value ?? 0;
    final fraction = (displayValue / maxRef).clamp(0.0, 1.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.foreground,
              ),
            ),
            Text(
              '$displayValue $unit',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.foreground,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: displayValue > 0 ? fraction : 0,
            backgroundColor: AppColors.mutedSurface,
            valueColor: AlwaysStoppedAnimation(color),
            minHeight: 8,
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Section Block (labeled text section)
// ─────────────────────────────────────────────────────────────────────────────

class _SectionBlock extends StatelessWidget {
  final String title;
  final String content;

  const _SectionBlock({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.mutedText,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.mutedSurface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            content,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.foreground,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Habits Section
// ─────────────────────────────────────────────────────────────────────────────

class _HabitsSection extends StatelessWidget {
  final List<DailyHabitDto> habits;
  final void Function(String habitId, bool isCompleted) onToggle;

  const _HabitsSection({
    required this.habits,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              "Today's Habits",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.mutedText,
              ),
            ),
            if (habits.isNotEmpty) ...[
              const SizedBox(width: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Text(
                  '${habits.length}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 12),
        if (habits.isEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.mutedSurface,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              'No habits assigned yet.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: AppColors.mutedText),
            ),
          )
        else
          ...habits.map((habit) => _HabitRow(
                habit: habit,
                onToggle: (v) => onToggle(habit.id, v),
              )),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Individual Habit Row
// ─────────────────────────────────────────────────────────────────────────────

class _HabitRow extends StatelessWidget {
  final DailyHabitDto habit;
  final ValueChanged<bool> onToggle;

  const _HabitRow({required this.habit, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    final todayStr = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final todayLog = habit.logs.firstWhere(
      (log) => DateFormat('yyyy-MM-dd').format(log.date) == todayStr,
      orElse: () => HabitLogDto(
        id: '',
        habitId: habit.id,
        clientId: '',
        date: DateTime.now(),
        isCompleted: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );
    final isCompleted = todayLog.isCompleted;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () => onToggle(!isCompleted),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            child: Row(
              children: [
                // Checkbox
                Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCompleted
                        ? Colors.green
                        : AppColors.borderMuted,
                  ),
                  child: isCompleted
                      ? const Icon(Icons.check, size: 16, color: Colors.white)
                      : null,
                ),
                const SizedBox(width: 14),
                // Title
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        habit.title,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColors.foreground,
                          decoration: isCompleted
                              ? TextDecoration.lineThrough
                              : null,
                          decorationColor: AppColors.mutedText,
                        ),
                      ),
                      if (habit.description != null &&
                          habit.description!.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            habit.description!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.mutedText,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                // Frequency badge
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: Text(
                    habit.frequency.toLowerCase(),
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: AppColors.mutedText,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Error View
// ─────────────────────────────────────────────────────────────────────────────

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorView({required this.message, required this.onRetry});

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
              onPressed: onRetry,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
