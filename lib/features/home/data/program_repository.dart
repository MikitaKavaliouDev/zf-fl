import 'package:injectable/injectable.dart';

import '../../trainers/data/models/template_dto.dart';
import 'models/program_detail_response.dart';
import 'models/program_dto.dart';
import 'models/program_library_response.dart';
import 'program_api_service.dart';

@singleton
class ProgramRepository {
  final ProgramApiService _api;

  ProgramRepository(this._api);

  Future<ProgramLibraryResponse> getPrograms({String? type, String? source}) =>
      _api.getPrograms(type: type, source: source);

  Future<ProgramDto> updateProgram({
    required String id,
    String? name,
    String? description,
  }) =>
      _api.updateProgram(id: id, name: name, description: description);

  Future<ProgramDto> createProgram({
    required String name,
    String? description,
  }) =>
      _api.createProgram(name: name, description: description);

  Future<ProgramDto> getProgram(String id) => _api.getProgram(id);

  /// Get full program detail with isActive flag.
  Future<ProgramDetailResponse> getProgramDetail(String id) =>
      _api.getProgramDetail(id);

  /// Set a program as the active program (PUT /api/client/program/active).
  Future<void> setActiveProgram(String programId) =>
      _api.setActiveProgram(programId);

  Future<TemplateDto> createTemplate({
    required String programId,
    required String name,
    String? description,
    List<Map<String, dynamic>>? exercises,
  }) =>
      _api.createTemplate(
        programId: programId,
        name: name,
        description: description,
        exercises: exercises,
      );

  Future<void> deleteTemplate(String templateId) =>
      _api.deleteTemplate(templateId);

  Future<TemplateExerciseDto> addExerciseToTemplate({
    required String templateId,
    required String exerciseId,
    String? targetReps,
    int? targetSets,
    int? durationSeconds,
    String? notes,
    int? order,
  }) =>
      _api.addExerciseToTemplate(
        templateId: templateId,
        exerciseId: exerciseId,
        targetReps: targetReps,
        targetSets: targetSets,
        durationSeconds: durationSeconds,
        notes: notes,
        order: order,
      );
}
