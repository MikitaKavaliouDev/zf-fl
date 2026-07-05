import 'dart:developer' as developer;

import 'package:flutter/material.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/models/create_habit_request_dto.dart';
import '../../data/models/log_habit_request_dto.dart';
import '../../data/models/trainer_habit_dto.dart';
import '../../data/models/trainer_nutrition_plan_dto.dart';
import '../../data/models/update_habit_request_dto.dart';
import '../../data/trainer_clients_api_service.dart';

/// Full-screen nutrition detail view for a trainer to manage a client's
/// nutrition plan with macro progress bars, section blocks, and habits CRUD.
///
/// Mirrors iOS NutritionDetailView at
/// V:\Ziro-Fit\Ziro Fit\Views\Trainer\NutritionDetailView.swift
class TrainerNutritionDetailScreen extends StatefulWidget {
  final String clientId;

  const TrainerNutritionDetailScreen({super.key, required this.clientId});

  @override
  State<TrainerNutritionDetailScreen> createState() =>
      _TrainerNutritionDetailScreenState();
}

class _TrainerNutritionDetailScreenState
    extends State<TrainerNutritionDetailScreen> {
  final TrainerClientsApiService _api = getIt<TrainerClientsApiService>();

  // ── Data state ──
  TrainerNutritionPlanDto? _plan;
  List<TrainerHabitDto> _habits = [];
  bool _isLoading = true;
  String? _errorMessage;

  // ── Date state ──
  DateTime _selectedDate = DateTime.now();

  // ── Habit form state ──
  TrainerHabitDto? _editingHabit;
  final TextEditingController _habitTitleController = TextEditingController();
  final TextEditingController _habitDescriptionController =
      TextEditingController();
  String _habitFrequency = 'DAILY';
  bool _isSavingHabit = false;
  String? _habitFormError;

  String get _dateString =>
      '${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}-${_selectedDate.day.toString().padLeft(2, '0')}';

  bool get _isToday {
    final now = DateTime.now();
    return _selectedDate.year == now.year &&
        _selectedDate.month == now.month &&
        _selectedDate.day == now.day;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadData());
  }

  @override
  void dispose() {
    _habitTitleController.dispose();
    _habitDescriptionController.dispose();
    super.dispose();
  }

  // ── Data Loading ──

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      final results = await Future.wait([
        _api.getClientNutrition(widget.clientId),
        _api.getClientHabits(widget.clientId),
      ]);
      if (!mounted) return;
      setState(() {
        _plan = results[0] as TrainerNutritionPlanDto?;
        _habits = results[1] as List<TrainerHabitDto>;
        _isLoading = false;
      });
    } catch (e) {
      developer.log('Failed to load nutrition data: $e', name: 'trainer');
      if (!mounted) return;
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  // ── Habit CRUD ──

  Future<void> _toggleHabit(TrainerHabitDto habit) async {
    // Check if there's already a log for the selected date
    final existingLog = habit.logs.where((l) => l.date == _dateString).firstOrNull;
    final newIsCompleted = existingLog?.isCompleted != true;

    try {
      await _api.logHabit(
        widget.clientId,
        habit.id,
        LogHabitRequestDto(
          date: _dateString,
          isCompleted: newIsCompleted,
        ),
      );
      developer.log(
        'Toggled habit ${habit.id} to ${newIsCompleted ? "completed" : "incomplete"}',
        name: 'trainer',
      );
      await _loadData();
    } catch (e) {
      developer.log('Failed to toggle habit: $e', name: 'trainer');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to update habit')),
      );
    }
  }

  void _openAddHabitForm() {
    setState(() {
      _editingHabit = null;
      _habitTitleController.clear();
      _habitDescriptionController.clear();
      _habitFrequency = 'DAILY';
      _habitFormError = null;
    });
    _showHabitFormSheet();
  }

  void _openEditHabitForm(TrainerHabitDto habit) {
    setState(() {
      _editingHabit = habit;
      _habitTitleController.text = habit.title;
      _habitDescriptionController.text = habit.description ?? '';
      _habitFrequency = habit.frequency;
      _habitFormError = null;
    });
    _showHabitFormSheet();
  }

  Future<void> _saveHabit() async {
    final title = _habitTitleController.text.trim();
    if (title.isEmpty) {
      setState(() => _habitFormError = 'Title is required');
      return;
    }
    setState(() => _isSavingHabit = true);

    try {
      if (_editingHabit != null) {
        await _api.updateHabit(
          widget.clientId,
          _editingHabit!.id,
          UpdateHabitRequestDto(
            title: title,
            description: _habitDescriptionController.text.trim().isEmpty
                ? null
                : _habitDescriptionController.text.trim(),
            frequency: _habitFrequency,
          ),
        );
      } else {
        await _api.createHabit(
          widget.clientId,
          CreateHabitRequestDto(
            title: title,
            description: _habitDescriptionController.text.trim().isEmpty
                ? null
                : _habitDescriptionController.text.trim(),
            frequency: _habitFrequency,
          ),
        );
      }

      setState(() {
        _isSavingHabit = false;
      });
      await _loadData();
    } catch (e) {
      developer.log('Failed to save habit: $e', name: 'trainer');
      setState(() {
        _habitFormError = e.toString();
        _isSavingHabit = false;
      });
    }
  }

  Future<void> _deleteHabit(TrainerHabitDto habit) async {
    try {
      await _api.deleteHabit(widget.clientId, habit.id);
      developer.log('Deleted habit ${habit.id}', name: 'trainer');
      await _loadData();
    } catch (e) {
      developer.log('Failed to delete habit: $e', name: 'trainer');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to delete habit')),
      );
    }
  }

  // ── Delete Plan ──

  Future<void> _deletePlan() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Nutrition Plan'),
        content: const Text(
          'Are you sure you want to delete this nutrition plan?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;
    if (!mounted) return;

    try {
      await _api.deleteNutritionPlan(_plan!.id);
      developer.log('Deleted nutrition plan ${_plan!.id}', name: 'trainer');
      if (!mounted) return;
      setState(() {
        _plan = null;
      });
    } catch (e) {
      developer.log('Failed to delete nutrition plan: $e', name: 'trainer');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete nutrition plan: $e')),
      );
    }
  }

  // ── Build ──

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Nutrition'),
        actions: [
          if (_plan != null) ...[
            IconButton(
              onPressed: _deletePlan,
              icon: const Icon(Icons.delete_outline_rounded),
              color: Colors.red,
              tooltip: 'Delete plan',
            ),
            TextButton(
              onPressed: () {
                // Edit plan — navigate to editor
                // (placeholder for NutritionFormView equivalent)
              },
              child: const Text(
                'Edit',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      );
    }

    if (_errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline_rounded,
                  size: 48, color: AppColors.mutedText),
              const SizedBox(height: 16),
              Text(
                _errorMessage!,
                style: const TextStyle(color: AppColors.mutedText),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: _loadData,
                icon: const Icon(Icons.refresh_rounded, size: 18),
                label: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    if (_plan == null) {
      return _buildEmptyState();
    }

    return RefreshIndicator(
      onRefresh: _loadData,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 24),
            _buildMacroSection(),
            const SizedBox(height: 24),
            // Section blocks
            if (_plan!.mealNotes != null && _plan!.mealNotes!.isNotEmpty)
              _buildSectionBlock(title: 'Meal Notes', content: _plan!.mealNotes!),
            if (_plan!.foodsToEat != null && _plan!.foodsToEat!.isNotEmpty)
              _buildSectionBlock(title: 'Foods to Eat', content: _plan!.foodsToEat!),
            if (_plan!.foodsToAvoid != null && _plan!.foodsToAvoid!.isNotEmpty)
              _buildSectionBlock(title: 'Foods to Avoid', content: _plan!.foodsToAvoid!),
            if (_plan!.mealTiming != null && _plan!.mealTiming!.isNotEmpty)
              _buildSectionBlock(title: 'Meal Timing', content: _plan!.mealTiming!),
            if (_plan!.hydration != null && _plan!.hydration!.isNotEmpty)
              _buildSectionBlock(title: 'Hydration', content: _plan!.hydration!),
            if (_plan!.supplements != null && _plan!.supplements!.isNotEmpty)
              _buildSectionBlock(title: 'Supplements', content: _plan!.supplements!),
            if (_plan!.habitNotes != null && _plan!.habitNotes!.isNotEmpty)
              _buildSectionBlock(title: 'Habit Notes', content: _plan!.habitNotes!),
            const SizedBox(height: 8),
            _buildHabitsSection(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // ── Empty State ──

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.restaurant_rounded,
              size: 48,
              color: AppColors.mutedText.withValues(alpha: 0.4),
            ),
            const SizedBox(height: 12),
            const Text(
              'No Nutrition Plan',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Create a plan to help your client achieve their goals.',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: () {
                // Open nutrition plan editor
              },
              icon: const Icon(Icons.add_rounded, size: 18),
              label: const Text('Create Nutrition Plan'),
            ),
          ],
        ),
      ),
    );
  }

  // ── Header ──

  Widget _buildHeader() {
    return Row(
      children: [
        Expanded(
          child: Text(
            _plan!.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
        ),
        if (_plan!.isActive)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: const Color(0xFF34C759).withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text(
              'Active',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFF34C759),
              ),
            ),
          ),
      ],
    );
  }

  // ── Macro Progress Bars ──

  Widget _buildMacroSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Daily Targets',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.foreground,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _macroBar(
                label: 'Calories',
                value: _plan!.calories,
                maxValue: 3000,
                unit: '',
                color: Colors.orange,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _macroBar(
                label: 'Protein',
                value: _plan!.protein,
                maxValue: 300,
                unit: 'g',
                color: Colors.blue,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _macroBar(
                label: 'Carbs',
                value: _plan!.carbs,
                maxValue: 400,
                unit: 'g',
                color: Colors.green,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _macroBar(
                label: 'Fats',
                value: _plan!.fats,
                maxValue: 100,
                unit: 'g',
                color: Colors.purple,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _macroBar({
    required String label,
    required int? value,
    required int maxValue,
    required String unit,
    required Color color,
  }) {
    final displayValue = value != null ? '$value$unit' : '--';
    final progress = value != null && maxValue > 0
        ? (value / maxValue).clamp(0.0, 1.0)
        : 0.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.mutedText,
              ),
            ),
            const Spacer(),
            Text(
              displayValue,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.foreground,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: SizedBox(
            height: 8,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    Container(
                      width: constraints.maxWidth,
                      color: AppColors.borderMuted,
                    ),
                    Container(
                      width: constraints.maxWidth * progress,
                      color: color,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  // ── Section Blocks ──

  Widget _buildSectionBlock({
    required String title,
    required String content,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            content,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.mutedText,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  // ── Habits Section ──

  Widget _buildHabitsSection() {
    final activeHabits = _habits.where((h) => h.isActive).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(color: AppColors.borderMuted),
        const SizedBox(height: 12),
        // ── Habits header ──
        Row(
          children: [
            const Text(
              'Habits',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.foreground,
              ),
            ),
            const Spacer(),
            // Date picker button — shown when viewing past dates
            if (!_isToday)
              InkWell(
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate,
                    firstDate: DateTime(2020),
                    lastDate: DateTime.now(),
                    helpText: 'View history',
                  );
                  if (picked != null && mounted) {
                    setState(() => _selectedDate = picked);
                    await _loadData();
                  }
                },
                borderRadius: BorderRadius.circular(8),
                child: const Padding(
                  padding: EdgeInsets.all(4),
                  child: Icon(
                    Icons.calendar_today_rounded,
                    size: 18,
                    color: AppColors.primary,
                  ),
                ),
              ),
            if (!_isToday) const SizedBox(width: 8),
            // Add button
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: _openAddHabitForm,
                borderRadius: BorderRadius.circular(8),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add_rounded, size: 16, color: AppColors.primary),
                      SizedBox(width: 4),
                      Text(
                        'Add',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),

        // ── Habits list ──
        if (activeHabits.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'No active habits assigned.',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
              ),
            ),
          )
        else
          ...activeHabits.map((habit) => _HabitCheckRow(
                habit: habit,
                date: _dateString,
                onToggle: () => _toggleHabit(habit),
                onEdit: () => _openEditHabitForm(habit),
                onDelete: () => _deleteHabit(habit),
              )),

        // ── Back to Today button ──
        if (!_isToday)
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: GestureDetector(
              onTap: () {
                setState(() => _selectedDate = DateTime.now());
                _loadData();
              },
              child: const Text(
                'Back to Today',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
      ],
    );
  }

  // ── Habit Form Bottom Sheet ──

  void _showHabitFormSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetContext) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 24,
                right: 24,
                top: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom + 24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
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

                  // Title
                  Text(
                    _editingHabit == null ? 'Add Habit' : 'Edit Habit',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.foreground,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Title field
                  const Text(
                    'Title',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.foreground,
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextField(
                    controller: _habitTitleController,
                    decoration: const InputDecoration(
                      hintText: 'e.g. Drink water before meals',
                      hintStyle: TextStyle(color: AppColors.mutedText),
                    ),
                    style: const TextStyle(fontSize: 14),
                    onChanged: (_) {
                      if (_habitFormError != null) {
                        setSheetState(() => _habitFormError = null);
                      }
                    },
                  ),
                  const SizedBox(height: 16),

                  // Description field
                  const Text(
                    'Description (optional)',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.foreground,
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextField(
                    controller: _habitDescriptionController,
                    decoration: const InputDecoration(
                      hintText: 'Additional details',
                      hintStyle: TextStyle(color: AppColors.mutedText),
                    ),
                    style: const TextStyle(fontSize: 14),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 16),

                  // Frequency picker
                  const Text(
                    'Frequency',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.foreground,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SegmentedButton<String>(
                    segments: const [
                      ButtonSegment(
                        value: 'DAILY',
                        label: Text('Daily'),
                      ),
                      ButtonSegment(
                        value: 'WEEKLY',
                        label: Text('Weekly'),
                      ),
                    ],
                    selected: {_habitFrequency},
                    onSelectionChanged: (sel) {
                      setSheetState(() => _habitFrequency = sel.first);
                    },
                    style: const ButtonStyle(
                      visualDensity: VisualDensity.compact,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),

                  // Error
                  if (_habitFormError != null) ...[
                    const SizedBox(height: 12),
                    Text(
                      _habitFormError!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.red,
                      ),
                    ),
                  ],

                  const SizedBox(height: 24),

                  // Buttons
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(sheetContext).pop();
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.foreground,
                            side: const BorderSide(color: AppColors.borderActive),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(99),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: FilledButton(
                          onPressed: _isSavingHabit ||
                                  _habitTitleController.text.trim().isEmpty
                              ? null
                              : () async {
                                  await _saveHabit();
                                  if (mounted) {
                                    Navigator.of(sheetContext).pop();
                                  }
                                },
                          style: FilledButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(99),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: _isSavingHabit
                              ? const SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : const Text(
                                  'Save',
                                  style: TextStyle(fontSize: 14),
                                ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

// ── Habit Check Row Widget ──

class _HabitCheckRow extends StatelessWidget {
  final TrainerHabitDto habit;
  final String date;
  final VoidCallback onToggle;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _HabitCheckRow({
    required this.habit,
    required this.date,
    required this.onToggle,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final isCompleted = habit.logs.where((l) => l.date == date).any((l) => l.isCompleted);

    return Dismissible(
      key: ValueKey('habit_${habit.id}'),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(Icons.delete_outline_rounded, color: Colors.white),
      ),
      secondaryBackground: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(Icons.edit_rounded, color: Colors.white),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          // Swipe left → Edit
          onEdit();
          return false;
        } else {
          // Swipe right → Delete — confirm first
          return await showDialog<bool>(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text('Delete Habit'),
              content: Text('Delete "${habit.title}"?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(true),
                  style: TextButton.styleFrom(foregroundColor: Colors.red),
                  child: const Text('Delete'),
                ),
              ],
            ),
          );
        }
      },
      onDismissed: (_) => onDelete(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.borderMuted),
          ),
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: onToggle,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCompleted
                      ? AppColors.primary
                      : Colors.transparent,
                  border: Border.all(
                    color: isCompleted
                        ? AppColors.primary
                        : AppColors.borderActive,
                    width: 2,
                  ),
                ),
                child: isCompleted
                    ? const Icon(
                        Icons.check_rounded,
                        size: 14,
                        color: Colors.white,
                      )
                    : null,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    habit.title,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.foreground,
                      decoration: isCompleted
                          ? TextDecoration.lineThrough
                          : null,
                      decorationColor: AppColors.mutedText,
                    ),
                  ),
                  if (habit.description != null &&
                      habit.description!.isNotEmpty)
                    Text(
                      habit.description!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.mutedText,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.mutedSurface,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                habit.frequency == 'DAILY' ? 'Daily' : 'Weekly',
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: AppColors.mutedText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
