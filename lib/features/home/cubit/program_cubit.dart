import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../trainers/data/models/exercise_dto.dart';
import '../../trainers/data/models/template_dto.dart';
import '../../trainers/data/workout_session_repository.dart';
import '../data/local_template_repository.dart';
import '../data/models/program_detail_response.dart';
import '../data/models/program_dto.dart';
import '../data/models/program_library_response.dart';
import '../data/program_repository.dart';
import 'program_state.dart';

@injectable
class ProgramCubit extends Cubit<ProgramState> {
  final ProgramRepository _repository;
  final LocalTemplateRepository _localRepo;
  final WorkoutSessionRepository _workoutSessionRepo;

  ProgramCubit(this._repository, this._localRepo, this._workoutSessionRepo)
      : super(const ProgramState.initial());

  /// Load all programs (assigned + personal) with categories.
  /// Also determines the active program ID from assigned programs.
  Future<void> loadPrograms() async {
    emit(const ProgramState.loading());
    try {
      final library = await _repository.getPrograms();

      // Determine active program ID from assigned programs
      final activeId = library.assignedPrograms
          .where((a) => a.isActive)
          .map((a) => a.program.id)
          .firstOrNull;

      emit(ProgramState.loaded(
        assignedPrograms: library.assignedPrograms,
        personalPrograms: library.personalPrograms,
        categories: library.categories,
        activeProgramId: activeId,
      ));
    } catch (e) {
      developer.log('ProgramCubit.loadPrograms failed: $e', name: 'program');
      emit(const ProgramState.error('Failed to load programs.'));
    }
  }

  /// Load templates from the program library, merged with persisted local
  /// templates. Collects templates from three sources in a single API call:
  ///
  ///   1. Templates inside assigned programs (assignedPrograms[].program.templates)
  ///   2. Standalone personal templates (personalTemplates)
  ///   3. Standalone system templates (systemTemplates)
  ///
  /// Local templates with IDs that collide with API templates are skipped
  /// (API wins). Matches the web app's single-call pattern in
  /// ClientProgramsView.tsx (GET /api/client/programs, no ?type= filter).
  Future<void> loadTemplates() async {
    emit(const ProgramState.loading());
    try {
      // 1. Single API call — no ?type= filter (web app parity)
      final library = await _repository.getPrograms();

      // 2. Collect templates from all three sources
      final apiTemplates = <String, TemplateDto>{};

      // 2a. Templates embedded in assigned programs
      for (final assignment in library.assignedPrograms) {
        for (final template in assignment.program.templates) {
          apiTemplates[template.id] = template.copyWith(
            programId: assignment.program.id,
            exerciseCount: template.exercises.isNotEmpty
                ? template.exercises.length
                : template.exerciseCount,
            category: 'Trainer Assigned',
            source: 'assigned',
            programName: assignment.program.name,
          );
        }
      }

      // 2b. Standalone personal templates
      for (final t in library.personalTemplates.map(_toTemplateDto)) {
        apiTemplates[t.id] = t;
      }

      // 2c. Standalone system templates
      for (final t in library.systemTemplates.map(_toTemplateDto)) {
        apiTemplates[t.id] = t;
      }

      // 3. Fetch local templates, merge with API (API wins on ID collision)
      final localTemplates = await _localRepo.getAll();
      for (final t in localTemplates) {
        if (!apiTemplates.containsKey(t.id)) {
          apiTemplates[t.id] = t.copyWith(
            category: 'Personal',
            source: 'local',
            programName: 'My Templates',
          );
        }
      }

      // 4. Determine active program ID
      final activeId = library.assignedPrograms
          .where((a) => a.isActive)
          .map((a) => a.program.id)
          .firstOrNull;

      emit(ProgramState.loaded(
        assignedPrograms: library.assignedPrograms,
        personalPrograms: library.personalPrograms,
        categories: library.categories,
        activeProgramId: activeId,
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

  /// Get a single program by ID (returns the bare program DTO).
  Future<ProgramDto?> getProgram(String id) async {
    try {
      return await _repository.getProgram(id);
    } catch (e) {
      developer.log('ProgramCubit.getProgram failed: $e', name: 'program');
      emit(const ProgramState.error('Failed to load program.'));
      return null;
    }
  }

  /// Get full program detail with templates, exercises, and isActive flag.
  Future<ProgramDetailResponse?> getProgramDetail(String id) async {
    try {
      return await _repository.getProgramDetail(id);
    } catch (e) {
      developer.log(
        'ProgramCubit.getProgramDetail failed: $e',
        name: 'program',
      );
      emit(const ProgramState.error('Failed to load program detail.'));
      return null;
    }
  }

  /// Set a program as the active program.
  ///
  /// Calls PUT /api/client/program/active and refreshes the program list.
  Future<bool> setActiveProgram(String programId) async {
    final current = state;
    if (current is! ProgramLoaded) return false;

    emit(current.copyWith(isSettingActive: true));
    try {
      await _repository.setActiveProgram(programId);
      // Refresh to update active state
      await loadPrograms();
      return true;
    } catch (e) {
      developer.log(
        'ProgramCubit.setActiveProgram failed: $e',
        name: 'program',
      );
      emit(current.copyWith(isSettingActive: false));
      return false;
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

  /// Fetch the full exercise library for the exercise picker.
  Future<List<ExerciseDto>> fetchExerciseLibrary() async {
    try {
      return await _workoutSessionRepo.getExerciseLibrary();
    } catch (e) {
      return [];
    }
  }

  /// Convert a [TemplateLibraryItem] from the API to a [TemplateDto].
  TemplateDto _toTemplateDto(dynamic item) {
    final cat = item.source == 'system'
        ? 'System'
        : (item.source == 'self' ? 'Personal' : 'Trainer Assigned');
    return TemplateDto(
      id: item.id,
      name: item.name,
      description: item.description,
      exerciseCount: item.exerciseCount ?? 0,
      programId: item.programId,
      order: item.order ?? 0,
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
      category: cat,
      source: item.source,
      programName: item.program.name,
    );
  }
}
      