import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/models/create_exercise_request_dto.dart';
import '../data/models/create_program_request_dto.dart';
import '../data/models/create_template_request_dto.dart';
import '../data/models/template_exercise_dto.dart';
import '../data/trainer_programs_api_service.dart';
import 'trainer_programs_state.dart';

@injectable
class TrainerProgramsCubit extends Cubit<TrainerProgramsState> {
  final TrainerProgramsApiService _api;

  TrainerProgramsCubit(this._api) : super(const TrainerProgramsState.initial());

  Future<void> loadPrograms() async {
    emit(const TrainerProgramsState.loading());
    try {
      final programs = await _api.getPrograms();
      final activePrograms = await _api.getActivePrograms();
      emit(TrainerProgramsState.loaded(
        programs: programs,
        activePrograms: activePrograms,
      ));
    } catch (e) {
      developer.log('Programs load failed: $e', name: 'trainer');
      emit(TrainerProgramsState.error(e.toString()));
    }
  }

  Future<void> createProgram(CreateProgramRequestDto request) async {
    try {
      await _api.createProgram(request);
      await loadPrograms();
    } catch (e) {
      developer.log('Create program failed: $e', name: 'trainer');
    }
  }

  Future<void> deleteProgram(String id) async {
    try {
      await _api.deleteProgram(id);
      await loadPrograms();
    } catch (e) {
      developer.log('Delete program failed: $e', name: 'trainer');
    }
  }

  Future<void> loadAnalytics(String programId) async {
    try {
      final analytics = await _api.getProgramAnalytics(programId);
      final current = state;
      if (current is TrainerProgramsLoaded) {
        emit(current.copyWith(analytics: analytics));
      }
    } catch (e) {
      developer.log('Analytics load failed: $e', name: 'trainer');
    }
  }

  Future<void> createTemplate(CreateTemplateRequestDto request) async {
    try {
      await _api.createTemplate(request.programId, request);
      await loadPrograms();
    } catch (e) {
      developer.log('Create template failed: $e', name: 'trainer');
    }
  }

  Future<void> deleteTemplate(String programId, String templateId) async {
    try {
      await _api.deleteTemplate(programId, templateId);
      await loadPrograms();
    } catch (e) {
      developer.log('Delete template failed: $e', name: 'trainer');
    }
  }

  /// GET /api/trainer/programs/:programId/templates/:templateId
  Future<List<TemplateExerciseDto>> getTemplateExercises(
    String programId,
    String templateId,
  ) async {
    try {
      return await _api.getTemplateExercises(programId, templateId);
    } catch (e) {
      developer.log('Failed to load template exercises: $e', name: 'trainer');
      rethrow;
    }
  }

  Future<void> addExercise(
    String programId,
    String templateId,
    CreateExerciseRequestDto request,
  ) async {
    try {
      await _api.addExercise(programId, templateId, request);
      await loadPrograms();
    } catch (e) {
      developer.log('Add exercise failed: $e', name: 'trainer');
    }
  }

  Future<void> deleteExercise(
    String programId,
    String templateId,
    String exerciseId,
  ) async {
    try {
      await _api.deleteExercise(programId, templateId, exerciseId);
      await loadPrograms();
    } catch (e) {
      developer.log('Delete exercise failed: $e', name: 'trainer');
    }
  }
}
