import 'package:injectable/injectable.dart';

import '../../trainers/data/models/template_dto.dart';
import 'models/program_dto.dart';
import 'models/program_library_response.dart';
import 'program_api_service.dart';

@singleton
class ProgramRepository {
  final ProgramApiService _api;

  ProgramRepository(this._api);

  Future<ProgramLibraryResponse> getPrograms({String? type, String? source}) =>
      _api.getPrograms(type: type, source: source);

  Future<ProgramDto> createProgram({
    required String name,
    String? description,
  }) =>
      _api.createProgram(name: name, description: description);

  Future<ProgramDto> getProgram(String id) => _api.getProgram(id);

  Future<TemplateDto> createTemplate({
    required String programId,
    required String name,
    String? description,
  }) =>
      _api.createTemplate(
        programId: programId,
        name: name,
        description: description,
      );

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
