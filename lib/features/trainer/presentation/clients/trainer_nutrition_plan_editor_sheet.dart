import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_theme.dart';
import '../../cubit/trainer_client_nutrition_cubit.dart';
import '../../data/models/upsert_nutrition_plan_request_dto.dart';

/// Modal bottom sheet to create/edit a client's nutrition plan.
class TrainerNutritionPlanEditorSheet extends StatefulWidget {
  final String clientId;

  const TrainerNutritionPlanEditorSheet({
    super.key,
    required this.clientId,
  });

  @override
  State<TrainerNutritionPlanEditorSheet> createState() =>
      _TrainerNutritionPlanEditorSheetState();
}

class _TrainerNutritionPlanEditorSheetState
    extends State<TrainerNutritionPlanEditorSheet> {
  final _titleController = TextEditingController();
  final _caloriesController = TextEditingController();
  final _proteinController = TextEditingController();
  final _carbsController = TextEditingController();
  final _fatsController = TextEditingController();
  final _mealNotesController = TextEditingController();
  final _habitNotesController = TextEditingController();
  final _foodsToEatController = TextEditingController();
  final _foodsToAvoidController = TextEditingController();
  final _mealTimingController = TextEditingController();
  final _hydrationController = TextEditingController();
  final _supplementsController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _caloriesController.dispose();
    _proteinController.dispose();
    _carbsController.dispose();
    _fatsController.dispose();
    _mealNotesController.dispose();
    _habitNotesController.dispose();
    _foodsToEatController.dispose();
    _foodsToAvoidController.dispose();
    _mealTimingController.dispose();
    _hydrationController.dispose();
    _supplementsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: DraggableScrollableSheet(
        initialChildSize: 0.85,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.borderActive,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancel'),
                    ),
                    const Spacer(),
                    const Text('Nutrition Plan',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600)),
                    const Spacer(),
                    TextButton(
                      onPressed:
                          _titleController.text.isNotEmpty ? _save : null,
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1, color: AppColors.borderMuted),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  children: [
                    _field('Title', _titleController, required: true),
                    const SizedBox(height: 16),
                    _field('Calories', _caloriesController,
                        keyboardType: TextInputType.number),
                    const SizedBox(height: 12),
                    _field('Protein (g)', _proteinController,
                        keyboardType: TextInputType.number),
                    const SizedBox(height: 12),
                    _field('Carbs (g)', _carbsController,
                        keyboardType: TextInputType.number),
                    const SizedBox(height: 12),
                    _field('Fats (g)', _fatsController,
                        keyboardType: TextInputType.number),
                    const SizedBox(height: 16),
                    _field('Meal Notes', _mealNotesController, maxLines: 3),
                    const SizedBox(height: 12),
                    _field('Habit Notes', _habitNotesController,
                        maxLines: 2),
                    const SizedBox(height: 12),
                    _field('Foods to Eat', _foodsToEatController,
                        maxLines: 3),
                    const SizedBox(height: 12),
                    _field('Foods to Avoid', _foodsToAvoidController,
                        maxLines: 3),
                    const SizedBox(height: 12),
                    _field('Meal Timing', _mealTimingController,
                        maxLines: 2),
                    const SizedBox(height: 12),
                    _field('Hydration', _hydrationController, maxLines: 2),
                    const SizedBox(height: 12),
                    _field('Supplements', _supplementsController,
                        maxLines: 2),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _field(String label, TextEditingController controller,
      {bool required = false,
      TextInputType? keyboardType,
      int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label${required ? ' *' : ''}',
          style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColors.foreground),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.mutedSurface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.borderMuted),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          ),
          onChanged: (_) => setState(() {}),
        ),
      ],
    );
  }

  void _save() {
    final request = UpsertNutritionPlanRequestDto(
      title: _titleController.text,
      calories: int.tryParse(_caloriesController.text),
      protein: int.tryParse(_proteinController.text),
      carbs: int.tryParse(_carbsController.text),
      fats: int.tryParse(_fatsController.text),
      mealNotes: _mealNotesController.text.isNotEmpty
          ? _mealNotesController.text
          : null,
      habitNotes: _habitNotesController.text.isNotEmpty
          ? _habitNotesController.text
          : null,
      foodsToEat: _foodsToEatController.text.isNotEmpty
          ? _foodsToEatController.text
          : null,
      foodsToAvoid: _foodsToAvoidController.text.isNotEmpty
          ? _foodsToAvoidController.text
          : null,
      mealTiming: _mealTimingController.text.isNotEmpty
          ? _mealTimingController.text
          : null,
      hydration: _hydrationController.text.isNotEmpty
          ? _hydrationController.text
          : null,
      supplements: _supplementsController.text.isNotEmpty
          ? _supplementsController.text
          : null,
    );

    context
        .read<TrainerClientNutritionCubit>()
        .upsertPlan(widget.clientId, request)
        .then((_) {
      if (mounted) Navigator.of(context).pop();
    });
  }
}
