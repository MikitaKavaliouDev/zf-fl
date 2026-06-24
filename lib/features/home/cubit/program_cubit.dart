import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../trainers/data/models/exercise_dto.dart';
import '../../trainers/data/models/template_dto.dart';
import '../data/local_template_repository.dart';
import '../data/models/program_dto.dart';
import '../data/models/program_library_response.dart';
import '../data/program_repository.dart';
import 'program_state.dart';

@injectable
class ProgramCubit extends Cubit<ProgramState> {
  final ProgramRepository _repository;
  final LocalTemplateRepository _localRepo;

  ProgramCubit(this._repository, this._localRepo)
      : super(const ProgramState.initial());

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

  /// Load templates from the program library (type=template), merged with
  /// persisted local templates. Local templates with IDs that collide with
  /// API templates are skipped (API wins).
  Future<void> loadTemplates() async {
    emit(const ProgramState.loading());
    try {
      // 1. Fetch API templates
      final library = await _repository.getPrograms(type: 'template');
      final apiTemplates = <String, TemplateDto>{};
      for (final t in [
        ...library.personalTemplates.map(_toTemplateDto),
        ...library.systemTemplates.map(_toTemplateDto),
      ]) {
        apiTemplates[t.id] = t;
      }

      // 2. Fetch local templates, merge with API (API wins on ID collision)
      final localTemplates = await _localRepo.getAll();
      for (final t in localTemplates) {
        if (!apiTemplates.containsKey(t.id)) {
          apiTemplates[t.id] = t;
        }
      }

      emit(ProgramState.loaded(
        programs: [
          ...library.assignedPrograms,
          ...library.personalPrograms,
        ],
        templates: apiTemplates.values.toList(),
      ));
    } catch (e) {
      developer.log('ProgramCubit.loadTemplates failed: $e', name: 'program');
      emit(const ProgramState.error('Failed to load templates.'));
    }
  }

  /// Save a [TemplateDto] to local persistence and refresh the template list.
  Future<void> saveLocalTemplate(TemplateDto template) async {
    try {
      await _localRepo.save(template);
      await loadTemplates();
    } catch (e) {
      developer.log(
        'ProgramCubit.saveLocalTemplate failed: $e',
        name: 'program',
      );
      emit(const ProgramState.error('Failed to save template.'));
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

  /// Create a template under a program, optionally with inline exercises.
  Future<TemplateDto?> createTemplate({
    required String programId,
    required String name,
    String? description,
    List<Map<String, dynamic>>? exercises,
  }) async {
    try {
      final template = await _repository.createTemplate(
        programId: programId,
        name: name,
        description: description,
        exercises: exercises,
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
      exercises: (item.exercises as List<dynamic>?)
              ?.map<TemplateExerciseDto>((e) {
            final ex = e as TemplateLibraryExercise;
            return TemplateExerciseDto(
              id: ex.id,
              order: ex.order,
              exerciseId: ex.exerciseId,
              type: ex.type,
              targetReps: ex.targetReps,
              durationSeconds: ex.durationSeconds,
              notes: ex.notes,
              exercise: ExerciseDto(
                id: ex.exercise.id,
                name: ex.exercise.name,
                muscleGroup: ex.exercise.muscleGroup,
              ),
            );
          }).toList() ??
          [],
    );
  }
}
