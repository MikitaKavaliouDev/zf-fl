import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../trainers/data/models/template_dto.dart';
import 'models/program_detail_response.dart';
import 'models/program_dto.dart';
import 'models/program_library_response.dart';

/// API service for workout program / routine operations.
///
/// Actual backend endpoints (verified from `~/pr/zirofit-next`):
///   GET    /api/client/programs                     — list all programs/templates
///   POST   /api/client/programs                     — create a new program
///   GET    /api/client/programs/:id                 — get single program with templates
///   PUT    /api/client/program/active               — set active program
///   POST   /api/client/programs/templates           — create a template under a program
///
/// The client cannot update or delete programs — those are trainer-only operations.
@injectable
class ProgramApiService {
  final Dio _dio;

  ProgramApiService(this._dio);

  /// GET /api/client/programs — list all programs and templates.
  ///
  /// Supports query filters:
  ///   ?type=program   — only programs
  ///   ?type=template  — only templates
  ///   ?source=self|assigned|system
  Future<ProgramLibraryResponse> getPrograms({
    String? type,
    String? source,
  }) async {
    final queryParams = <String, String>{};
    if (type != null) queryParams['type'] = type;
    if (source != null) queryParams['source'] = source;

    final response = await _dio.get(
      '/api/client/programs',
      queryParameters: queryParams.isNotEmpty ? queryParams : null,
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return ProgramLibraryResponse.fromJson(data);
  }

  /// POST /api/client/programs — create a new program (name + description only).
  ///
  /// Returns the created program with its (empty) templates array.
  /// Templates must be added separately via [createTemplate].
  Future<ProgramDto> createProgram({
    required String name,
    String? description,
  }) async {
    final response = await _dio.post(
      '/api/client/programs',
      data: {
        'name': name,
        'description': description,
      },
    );
    final data = response.data['data'] as Map<String, dynamic>;
    final programJson = data['program'] as Map<String, dynamic>;
    return ProgramDto.fromJson(programJson);
  }

  /// GET /api/client/programs/:id — get a single program with templates.
  Future<ProgramDto> getProgram(String id) async {
    final response = await _dio.get('/api/client/programs/$id');
    final data = response.data['data'] as Map<String, dynamic>;
    final programJson = data['program'] as Map<String, dynamic>;
    return ProgramDto.fromJson(programJson);
  }

  /// GET /api/client/programs/:id — get full program detail with isActive flag.
  ///
  /// Returns [ProgramDetailResponse] with the full program (templates + exercises)
  /// and an `isActive` flag indicating if it's the client's active program.
  Future<ProgramDetailResponse> getProgramDetail(String id) async {
    final response = await _dio.get('/api/client/programs/$id');
    final data = response.data['data'] as Map<String, dynamic>;
    return ProgramDetailResponse.fromJson(data);
  }

  /// PUT /api/client/program/active — set a program as the active program.
  ///
  /// Body: { programId: string }
  /// Deactivates all other assignments and activates this one.
  Future<void> setActiveProgram(String programId) async {
    await _dio.put(
      '/api/client/program/active',
      data: {'programId': programId},
    );
  }

  /// POST /api/client/programs/templates — create a template under a program.
  ///
  /// Body: { name, description?, programId, exercises? }
  /// When [exercises] is provided, the backend creates the template + all
  /// exercises in a single transaction — no need for separate add-exercise calls.
  Future<TemplateDto> createTemplate({
    required String programId,
    required String name,
    String? description,
    List<Map<String, dynamic>>? exercises,
  }) async {
    final data = <String, dynamic>{
      'name': name,
      'programId': programId,
      'description': ?description,
      if (exercises != null && exercises.isNotEmpty) 'exercises': exercises,
    };
    final response = await _dio.post(
      '/api/client/programs/templates',
      data: data,
    );
    final responseData = response.data['data'] as Map<String, dynamic>;
    final templateJson = responseData['template'] as Map<String, dynamic>;
    return TemplateDto.fromJson(templateJson);
  }

  /// POST /api/client/programs/templates/:templateId/exercises — add exercise to template.
  ///
  /// Body: { exerciseId, targetReps?, targetSets?, durationSeconds?, notes?, order? }
  Future<TemplateExerciseDto> addExerciseToTemplate({
    required String templateId,
    required String exerciseId,
    String? targetReps,
    int? targetSets,
    int? durationSeconds,
    String? notes,
    int? order,
  }) async {
    final response = await _dio.post(
      '/api/client/programs/templates/$templateId/exercises',
      data: {
        'exerciseId': exerciseId,
        'targetReps': ?targetReps,
        'targetSets': ?targetSets,
        'durationSeconds': ?durationSeconds,
        'notes': ?notes,
        'order': ?order,
      },
    );
    final data = response.data['data'] as Map<String, dynamic>;
    final exerciseJson = data['templateExercise'] as Map<String, dynamic>;
    return TemplateExerciseDto.fromJson(exerciseJson);
  }
}
