import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../trainers/data/models/exercise_dto.dart';
import '../../trainers/data/models/template_dto.dart';
import '../../trainers/data/workout_session_repository.dart';
import 'template_detail_state.dart';

@injectable
class TemplateDetailCubit extends Cubit<TemplateDetailState> {
  final WorkoutSessionRepository _workoutSessionRepo;

  TemplateDetailCubit(this._workoutSessionRepo)
      : super(const TemplateDetailState.initial());

  /// Load a template's details into the state.
  /// If the exercises list is empty and it's not a local template,
  /// fetch the full template details from the backend.
  Future<void> loadTemplate(TemplateDto template) async {
    emit(const TemplateDetailState.loading());

    try {
      if (template.exercises.isEmpty && !template.id.startsWith('local_')) {
        final fullTemplate = await _workoutSessionRepo.getTemplate(template.id);
        emit(TemplateDetailState.loaded(
          template: fullTemplate,
          exercises: List.unmodifiable(fullTemplate.exercises),
        ));
      } else {
        emit(TemplateDetailState.loaded(
          template: template,
          exercises: List.unmodifiable(template.exercises),
        ));
      }
    } catch (e) {
      emit(TemplateDetailState.error('Failed to load template details: $e'));
    }
  }

  /// Fetch the full exercise library for the exercise picker.
  Future<List<ExerciseDto>> fetchExerciseLibrary() async {
    try {
      return await _workoutSessionRepo.getExerciseLibrary();
    } catch (e) {
      return [];
    }
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
      