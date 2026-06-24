import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../trainers/data/models/exercise_dto.dart';
import '../../trainers/data/models/template_dto.dart';
import 'template_detail_state.dart';

@injectable
class TemplateDetailCubit extends Cubit<TemplateDetailState> {
  TemplateDetailCubit() : super(const TemplateDetailState.initial());

  /// Load a template's details into the state.
  Future<void> loadTemplate(TemplateDto template) async {
    emit(const TemplateDetailState.loading());

    // For local templates, show the data directly.
    // For API templates, use the already-fetched TemplateDto data
    // (full exercise list is included in the template).
    emit(TemplateDetailState.loaded(
      template: template,
      exercises: List.unmodifiable(template.exercises),
    ));
  }

  /// Add an exercise to the template with default reps/sets.
  void addExercise(
    ExerciseDto exercise, {
    String targetReps = '10',
    int targetSets = 3,
  }) {
    final current = state;
    if (current is! TemplateDetailLoaded) return;

    final newExercise = TemplateExerciseDto(
      id: 'local_${DateTime.now().millisecondsSinceEpoch}_${exercise.id}',
      order: current.exercises.length,
      exerciseId: exercise.id,
      type: 'EXERCISE',
      targetReps: targetReps,
      targetSets: targetSets,
      exercise: exercise,
    );

    final updatedExercises = [...current.exercises, newExercise];

    emit(TemplateDetailState.loaded(
      template: current.template.copyWith(exercises: updatedExercises),
      exercises: updatedExercises,
    ));
  }

  /// Remove an exercise from the template by index.
  void removeExercise(int index) {
    final current = state;
    if (current is! TemplateDetailLoaded) return;

    final updatedExercises = [...current.exercises]..removeAt(index);

    emit(TemplateDetailState.loaded(
      template: current.template.copyWith(exercises: updatedExercises),
      exercises: updatedExercises,
    ));
  }
}
