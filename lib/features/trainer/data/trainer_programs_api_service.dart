import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'models/active_program_item_dto.dart';
import 'models/add_rest_step_request_dto.dart';
import 'models/copy_template_response_dto.dart';
import 'models/create_exercise_request_dto.dart';
import 'models/create_program_request_dto.dart';
import 'models/create_template_request_dto.dart';
import 'models/program_analytics_dto.dart';
import 'models/template_exercise_dto.dart';
import 'models/program_library_response.dart';
import 'models/trainer_program_brief_dto.dart';
import 'models/trainer_template_summary_dto.dart';

@injectable
class TrainerProgramsApiService {
  final Dio _dio;

  TrainerProgramsApiService(this._dio);

  // ── Programs ──

  /// GET /api/trainer/programs — list trainer's programs + templates.
  Future<ProgramLibraryResponse> getPrograms() async {
    final response = await _dio.get('/api/trainer/programs');
    return ProgramLibraryResponse.fromJson(
        response.data['data'] as Map<String, dynamic>);
  }

  /// POST /api/trainer/programs — create a new program.
  Future<TrainerProgramBriefDto> createProgram(
    CreateProgramRequestDto request,
  ) async {
    final response = await _dio.post(
      '/api/trainer/programs',
      data: request.toJson(),
    );
    final data = response.data['data'] as Map<String, dynamic>;
    final program = data['program'] as Map<String, dynamic>;
    return TrainerProgramBriefDto.fromJson(program);
  }

  /// GET /api/trainer/programs/:id — program detail with templates.
  Future<TrainerProgramBriefDto> getProgram(String id) async {
    final response = await _dio.get('/api/trainer/programs/$id');
    final data = response.data['data'] as Map<String, dynamic>;
    return TrainerProgramBriefDto.fromJson(data);
  }

  /// PUT /api/trainer/programs/:id — update program metadata.
  Future<TrainerProgramBriefDto> updateProgram(
    String id,
    Map<String, dynamic> updates,
  ) async {
    final response = await _dio.put(
      '/api/trainer/programs/$id',
      data: updates,
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return TrainerProgramBriefDto.fromJson(data);
  }

  /// DELETE /api/trainer/programs/:id
  Future<void> deleteProgram(String id) async {
    await _dio.delete('/api/trainer/programs/$id');
  }

  /// GET /api/trainer/programs/:id/analytics — progress metrics.
  Future<ProgramAnalyticsDto> getProgramAnalytics(String id) async {
    final response = await _dio.get('/api/trainer/programs/$id/analytics');
    final data = response.data['data'] as Map<String, dynamic>;
    return ProgramAnalyticsDto.fromJson(data);
  }

  /// GET /api/trainer/programs/active — all active program assignments.
  Future<List<ActiveProgramItemDto>> getActivePrograms() async {
    final response = await _dio.get('/api/trainer/programs/active');
    final data = response.data['data'] as Map<String, dynamic>;
    final items = data['activePrograms'] as List<dynamic>;
    return items
        .map((e) => ActiveProgramItemDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  // ── Templates ──

  /// POST /api/trainer/programs/templates — add template to a program.
  /// `programId` is embedded in the request body, not the URL.
  Future<TrainerTemplateSummaryDto> createTemplate(
    String programId,
    CreateTemplateRequestDto request,
  ) async {
    final response = await _dio.post(
      '/api/trainer/programs/templates',
      data: request.toJson(),
    );
    final body = response.data['data'] as Map<String, dynamic>;
    final templateJson = body['template'] as Map<String, dynamic>;
    return TrainerTemplateSummaryDto.fromJson(templateJson);
  }

  /// PUT /api/trainer/programs/:programId/templates/:id
  Future<TrainerTemplateSummaryDto> updateTemplate(
    String programId,
    String templateId,
    Map<String, dynamic> updates,
  ) async {
    final response = await _dio.put(
      '/api/trainer/programs/$programId/templates/$templateId',
      data: updates,
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return TrainerTemplateSummaryDto.fromJson(data);
  }

  /// DELETE /api/trainer/programs/:programId/templates/:id
  Future<void> deleteTemplate(String programId, String templateId) async {
    await _dio.delete(
      '/api/trainer/programs/$programId/templates/$templateId',
    );
  }

  /// GET /api/trainer/programs/templates/:templateId — template with exercises.
  Future<List<TemplateExerciseDto>> getTemplateExercises(
    String programId,
    String templateId,
  ) async {
    final response = await _dio.get(
      '/api/trainer/programs/templates/$templateId',
    );
    final data = response.data['data'] as Map<String, dynamic>;
    final exercises = data['exercises'] as List<dynamic>;
    return exercises
        .map((e) => TemplateExerciseDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// POST /api/trainer/programs/:programId/templates/:id/exercises
  Future<TemplateExerciseDto> addExercise(
    String programId,
    String templateId,
    CreateExerciseRequestDto request,
  ) async {
    final response = await _dio.post(
      '/api/trainer/programs/$programId/templates/$templateId/exercises',
      data: request.toJson(),
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return TemplateExerciseDto.fromJson(data);
  }

  /// PUT /api/trainer/programs/:programId/templates/:id/exercises/:exerciseId
  Future<TemplateExerciseDto> updateExercise(
    String programId,
    String templateId,
    String exerciseId,
    Map<String, dynamic> updates,
  ) async {
    final response = await _dio.put(
      '/api/trainer/programs/$programId/templates/$templateId/exercises/$exerciseId',
      data: updates,
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return TemplateExerciseDto.fromJson(data);
  }

  /// DELETE /api/trainer/programs/:programId/templates/:id/exercises/:exerciseId
  Future<void> deleteExercise(
    String programId,
    String templateId,
    String exerciseId,
  ) async {
    await _dio.delete(
      '/api/trainer/programs/$programId/templates/$templateId/exercises/$exerciseId',
    );
  }

  /// POST /api/trainer/programs/templates/:templateId/copy
  /// `programId` is NOT part of the URL — the backend resolves from the template.
  Future<CopyTemplateResponseDto> copyTemplate(
    String programId,
    String templateId,
  ) async {
    final response = await _dio.post(
      '/api/trainer/programs/templates/$templateId/copy',
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return CopyTemplateResponseDto.fromJson(data);
  }

  /// POST /api/trainer/templates/:templateId/rest-steps
  Future<void> addRestStep(
    String templateId,
    AddRestStepRequestDto request,
  ) async {
    await _dio.post(
      '/api/trainer/templates/$templateId/rest-steps',
      data: request.toJson(),
    );
  }
}
