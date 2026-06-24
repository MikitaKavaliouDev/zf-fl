import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../trainers/data/models/exercise_dto.dart';
import '../../trainers/data/models/template_dto.dart';
import '../data/models/program_dto.dart';
import '../data/program_repository.dart';
import 'program_state.dart';

@injectable
class ProgramCubit extends Cubit<ProgramState> {
  final ProgramRepository _repository;

  ProgramCubit(this._repository) : super(const ProgramState.initial());

  /// Load all programs for the current client.
  Future<void> loadPrograms() async {
    emit(const ProgramState.loading());
    try {
      final library = await _repository.getPrograms();
      // Merge assigned and personal programs into a single list
      final allPrograms = [
        ...library.assignedPrograms,
        ...library.personalPrograms,
      ];
      emit(ProgramState.loaded(
        programs: allPrograms,
      ));
    } catch (e) {
      developer.log('ProgramCubit.loadPrograms failed: $e', name: 'program');
      emit(const ProgramState.error('Failed to load programs.'));
    }
  }

  /// Load templates from the program library (type=template).
  Future<void> loadTemplates() async {
    emit(const ProgramState.loading());
    try {
      final library = await _repository.getPrograms(type: 'template');
      final templateDtos = [
        ...library.personalTemplates.map(_toTemplateDto),
        ...library.systemTemplates.map(_toTemplateDto),
      ];
      emit(ProgramState.loaded(
        programs: [
          ...library.assignedPrograms,
          ...library.personalPrograms,
        ],
        templates: templateDtos,
      ));
    } catch (e) {
      developer.log('ProgramCubit.loadTemplates failed: $e', name: 'program');
      emit(const ProgramState.error('Failed to load templates.'));
    }
  }

  /// Create a new program with name and description only.
  /// Templates are added separately via the builder flow.
  Future<ProgramDto?> createProgram({
    required String name,
    String? description,
  }) async {
    try {
      final program = await _repository.createProgram(
        name: name,
        description: description,
      );
      await loadPrograms();
      return program;
    } catch (e) {
      developer.log('ProgramCubit.createProgram failed: $e', name: 'program');
      emit(const ProgramState.error('Failed to create program.'));
      return null;
    }
  }

  /// Get a single program by ID.
  Future<ProgramDto?> getProgram(String id) async {
    try {
      return await _repository.getProgram(id);
    } catch (e) {
      developer.log('ProgramCubit.getProgram failed: $e', name: 'program');
      emit(const ProgramState.error('Failed to load program.'));
      return null;
    }
  }

  /// Create a template under a program.
  Future<TemplateDto?> createTemplate({
    required String programId,
    required String name,
    String? description,
  }) async {
    try {
      final template = await _repository.createTemplate(
        programId: programId,
        name: name,
        description: description,
      );
      await loadPrograms();
      return template;
    } catch (e) {
      developer.log(
        'ProgramCubit.createTemplate failed: $e',
        name: 'program',
      );
      emit(const ProgramState.error('Failed to create template.'));
      return null;
    }
  }

  /// Add an exercise to a template.
  Future<TemplateExerciseDto?> addExerciseToTemplate({
    required String templateId,
    required String exerciseId,
    String? targetReps,
    int? targetSets,
    int? durationSeconds,
    String? notes,
    int? order,
  }) async {
    try {
      return await _repository.addExerciseToTemplate(
        templateId: templateId,
        exerciseId: exerciseId,
        targetReps: targetReps,
        targetSets: targetSets,
        durationSeconds: durationSeconds,
        notes: notes,
        order: order,
      );
    } catch (e) {
      developer.log(
        'ProgramCubit.addExerciseToTemplate failed: $e',
        name: 'program',
      );
      return null;
    }
  }

  /// Convert a [TemplateLibraryItem] from the API to a [TemplateDto].
  TemplateDto _toTemplateDto(dynamic item) {
    return TemplateDto(
      id: item.id,
      name: item.name,
      description: item.description,
      exercises: (item.exercises as List<dynamic>?)?.map((e) {
        final exercise = e['exercise'] as Map<String, dynamic>?;
        return TemplateExerciseDto(
          id: e['id'] as String,
          order: (e['order'] as num?)?.toInt() ?? 0,
          exerciseId: e['exerciseId'] as String?,
          type: e['type'] as String?,
          targetReps: e['targetReps'] as String?,
          durationSeconds: (e['durationSeconds'] as num?)?.toInt(),
          notes: e['notes'] as String?,
          exercise: exercise != null
              ? ExerciseDto(
                  id: exercise['id'] as String,
                  name: exercise['name'] as String,
                )
              : null,
        );
      }).toList() ??
          [],
    );
  }
}
