<response>
  <reasoning>
    My plan of action is as follows:
    1. **Fix Routine Saving**:
       - There is a critical syntax error in `lib/features/home/data/program_api_service.dart` and `lib/features/trainers/data/workout_session_api_service.dart` where parameters in body/query maps were prepended with `?` (e.g. `'description': ?description`). I will fix all these syntax errors so that the API compilation and requests succeed.
       - The newly added templates are initially instantiated with empty `exercises` lists because `ProgramCubit.loadTemplates` only queries templates in a lightweight/paginated manner (relying on `exerciseCount`). To fix this, when a template is chosen in the `_openTemplatePicker` modal, I will dynamically fetch its fully detailed record (including all listed exercises) using `getIt<WorkoutSessionRepository>().getTemplate(result.id)`. This guarantees that the fully populated template gets saved properly with its full exercise list on the backend.
    2. **Fix Day Labels**:
       - Re-creating `TextEditingController` directly within `_buildSlotCard` on every rebuild is highly inefficient and causes focus loss and text offset issues. I will update `_RoutineSlot` to store and manage its own dedicated `TextEditingController`.
       - I will update the card layout to use `AppColors.card` (white) for a cleaner, cohesive look, and center-align the Day label inside a beautifully padded primary capsule, giving it a premium iOS feel.
    3. **Update Tasks File**:
       - I will update `TASKS.md` to document and track these completions.
  </reasoning>
  <modifications>
    <file path="lib/features/home/data/program_api_service.dart">
      <![CDATA[
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
      'description': description,
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
        'targetReps': targetReps,
        'targetSets': targetSets,
        'durationSeconds': durationSeconds,
        'notes': notes,
        'order': order,
      },
    );
    final data = response.data['data'] as Map<String, dynamic>;
    final exerciseJson = data['templateExercise'] as Map<String, dynamic>;
    return TemplateExerciseDto.fromJson(exerciseJson);
  }
}
      ]]>
    </file>
    <file path="lib/features/trainers/data/workout_session_api_service.dart">
      <![CDATA[
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'models/exercise_dto.dart';
import 'models/exercise_log_dto.dart';
import 'models/template_dto.dart';
import 'models/workout_session_response.dart';

@injectable
class WorkoutSessionApiService {
  final Dio _dio;

  WorkoutSessionApiService(this._dio);

  /// Fetch the exercise library (system + custom).
  Future<List<ExerciseDto>> getExerciseLibrary() async {
    final response = await _dio.get(
      '/api/exercises/sync',
      queryParameters: {'lastPulledAt': 0},
    );
    final data = response.data['data'] as Map<String, dynamic>;
    final changes = data['changes'] as List<dynamic>;
    return changes
        .map((e) => ExerciseDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// Start a new workout session.
  Future<StartSessionResponse> startSession({
    String? clientId,
    String? plannedSessionId,
    String? templateId,
    String? clientPackageId,
  }) async {
    final response = await _dio.post(
      '/api/workout-sessions/start',
      data: {
        'clientId': clientId,
        'plannedSessionId': plannedSessionId,
        'templateId': templateId,
        'clientPackageId': clientPackageId,
      },
    );
    final data = _normalizeSessionData(
      response.data['data'] as Map<String, dynamic>,
    );
    return StartSessionResponse.fromJson(data);
  }

  /// Get the currently active workout session.
  Future<LiveSessionResponse> getLiveSession() async {
    final response = await _dio.get('/api/workout-sessions/live');
    final data = _normalizeSessionData(
      response.data['data'] as Map<String, dynamic>,
    );
    return LiveSessionResponse.fromJson(data);
  }

  /// Backend returns `client` as nested `{id, name, ...}` but the DTO
  /// expects a flat `clientId`. Also, `exerciseLogs` entries lack
  /// `clientId`/`workoutSessionId` at the individual log level.
  /// This normalizer injects those fields before parsing.
  Map<String, dynamic> _normalizeSessionData(Map<String, dynamic> data) {
    if (data['session'] == null) return data;

    final session = Map<String, dynamic>.from(
      data['session'] as Map<String, dynamic>,
    );

    // Inject flat clientId from nested client object
    final clientId =
        (session['client'] as Map<String, dynamic>?)?['id'] as String?;
    if (clientId != null) {
      session['clientId'] = clientId;
    }

    // Extract exerciseLogs, inject missing clientId/workoutSessionId/exerciseId
    final rawLogs = session.remove('exerciseLogs') as List<dynamic>?;
    if (rawLogs != null && rawLogs.isNotEmpty && clientId != null) {
      final sessionId = session['id'] as String?;
      data['exerciseLogs'] = rawLogs.map((e) {
        final log = Map<String, dynamic>.from(e as Map<String, dynamic>);
        log['clientId'] = log['clientId'] ?? clientId;
        log['workoutSessionId'] = log['workoutSessionId'] ?? sessionId;
        log['exerciseId'] = log['exerciseId'] ??
            (log['exercise'] as Map<String, dynamic>?)?['id'];
        if (log['completed'] != null) {
          log['isCompleted'] = log['completed'];
        }
        return log;
      }).toList();
    }

    data['session'] = session;

    // Normalize nested exercise objects: inject id from exerciseId
    // when the backend returns a partial exercise without id.
    if (rawLogs != null) {
      for (final l in rawLogs) {
        final log = l as Map<String, dynamic>;
        if (log['completed'] != null) {
          log['isCompleted'] = log['completed'];
        }
        if (log['exercise'] is Map<String, dynamic>) {
          final exercise = log['exercise'] as Map<String, dynamic>;
          if (exercise['id'] == null && log['exerciseId'] != null) {
            exercise['id'] = log['exerciseId'];
          }
        }
      }
    }

    return data;
  }

  /// Log an exercise set for a live session (create or update).
  Future<LogExerciseResponse> logExercise({
    String? logId,
    required String workoutSessionId,
    required String exerciseId,
    required int reps,
    double? weight,
    int? rpe,
    String? tempo,
    int? order,
    String? supersetKey,
    int? orderInSuperset,
    bool? isCompleted,
  }) async {
    final response = await _dio.post(
      '/api/workout-sessions/live',
      data: {
        'logId': logId,
        'workoutSessionId': workoutSessionId,
        'exerciseId': exerciseId,
        'reps': reps,
        'weight': weight,
        'rpe': rpe,
        'tempo': tempo,
        'order': order,
        'supersetKey': supersetKey,
        'orderInSuperset': orderInSuperset,
        'isCompleted': isCompleted,
      },
    );
    final data = response.data['data'] as Map<String, dynamic>;
    if (data['log'] != null) {
      final logMap = Map<String, dynamic>.from(data['log'] as Map<String, dynamic>);
      if (logMap['completed'] != null) {
        logMap['isCompleted'] = logMap['completed'];
      }
      data['log'] = logMap;
    }
    return LogExerciseResponse.fromJson(data);
  }

  /// Finish a workout session. Returns the updated session and its logs.
  Future<LiveSessionResponse> finishSession({
    required String workoutSessionId,
    String? notes,
    bool? completeUnfinished,
  }) async {
    final response = await _dio.post(
      '/api/workout-sessions/finish',
      data: {
        'workoutSessionId': workoutSessionId,
        'notes': notes,
        'completeUnfinished': completeUnfinished,
      },
    );
    final data = _normalizeSessionData(
      response.data['data'] as Map<String, dynamic>,
    );
    return LiveSessionResponse.fromJson(data);
  }

  /// Get workout session history.
  Future<SessionHistoryResponse> getHistory({
    String? clientId,
    int limit = 20,
    String? cursor,
  }) async {
    final response = await _dio.get(
      '/api/workout-sessions/history',
      queryParameters: {
        'clientId': clientId,
        'limit': limit,
        'cursor': cursor,
      },
    );
    final data = response.data['data'] as Map<String, dynamic>;

    // Normalize: the backend sometimes returns partial exercise objects
    // (e.g. `{ "name": "..." }` without `id`). Inject `id` from the
    // parent log's `exerciseId` so ExerciseDto.fromJson doesn't crash.
    final sessions = data['sessions'] as List<dynamic>?;
    if (sessions != null) {
      for (final s in sessions) {
        final session = s as Map<String, dynamic>;
        final logs = session['exerciseLogs'] as List<dynamic>?;
        if (logs != null) {
          for (final l in logs) {
            final log = l as Map<String, dynamic>;
            if (log['completed'] != null) {
              log['isCompleted'] = log['completed'];
            }
            if (log['exercise'] is Map<String, dynamic>) {
              final exercise = log['exercise'] as Map<String, dynamic>;
              if (exercise['id'] == null && log['exerciseId'] != null) {
                exercise['id'] = log['exerciseId'];
              }
            }
          }
        }
      }
    }

    return SessionHistoryResponse.fromJson(data);
  }

  /// Add exercises to an in-progress session. Returns the created log entries.
  Future<List<ExerciseLogDto>> addExercises({
    required String sessionId,
    required List<String> exerciseIds,
  }) async {
    final response = await _dio.post(
      '/api/workout-sessions/$sessionId/exercises',
      data: {'exerciseIds': exerciseIds},
    );
    final data = response.data['data'] as Map<String, dynamic>;
    final logs = (data['logs'] as List<dynamic>)
        .map((e) => ExerciseLogDto.fromJson(e as Map<String, dynamic>))
        .toList();
    return logs;
  }

  /// Start rest timer on backend.
  Future<void> startRest(String sessionId) async {
    await _dio.post('/api/workout-sessions/$sessionId/rest/start');
  }

  /// End rest timer on backend.
  Future<void> endRest(String sessionId) async {
    await _dio.post('/api/workout-sessions/$sessionId/rest/end');
  }

  /// Cancel a workout session.
  Future<void> cancelSession({required String workoutSessionId}) async {
    await _dio.post('/api/workout-sessions/$workoutSessionId/cancel');
  }

  /// Remove an exercise from the active session.
  Future<void> removeExercise({
    required String sessionId,
    required String exerciseId,
  }) async {
    await _dio.delete('/api/workout-sessions/$sessionId/exercises/$exerciseId');
  }

  /// Get full details for a specific session (including exercise logs).
  Future<LiveSessionResponse> getSessionDetails(String sessionId) async {
    final response = await _dio.get('/api/workout-sessions/$sessionId');
    final data = _normalizeSessionData(
      response.data['data'] as Map<String, dynamic>,
    );
    return LiveSessionResponse.fromJson(data);
  }

  /// Get all templates for the current user's active program.
  Future<List<TemplateDto>> getTemplates() async {
    final response = await _dio.get('/api/client/program/active');
    final data = response.data['data'];
    if (data == null) return [];
    final templates = data['templates'] as List<dynamic>;
    return templates
        .map((e) => TemplateDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// Get a specific template with exercises.
  Future<TemplateDto> getTemplate(String templateId) async {
    final response = await _dio.get('/api/workout-templates/$templateId');
    final data = response.data['data'] as Map<String, dynamic>;
    return TemplateDto.fromJson(data);
  }

  /// Save a completed session as a new template.
  Future<void> saveSessionAsTemplate({
    required String sessionId,
    required String templateName,
  }) async {
    await _dio.post(
      '/api/workout-sessions/$sessionId/save-as-template',
      data: {'templateName': templateName},
    );
  }
}
      ]]>
    </file>
    <file path="lib/features/home/presentation/routine_builder_screen.dart">
      <![CDATA[
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'dart:developer' as developer;

import '../../../core/di/injection.dart';
import '../../../core/theme/app_theme.dart';
import '../../notifications/presentation/widgets/ziro_sheet_header.dart';
import '../../trainers/data/models/template_dto.dart';
import '../../trainers/data/workout_session_repository.dart';
import '../cubit/program_cubit.dart';
import '../cubit/program_state.dart';
import '../data/models/program_dto.dart';
import 'template_picker_sheet.dart';

/// A slot holding a template together with an editable day label.
///
/// Matches iOS `RoutineTemplateSlot` — RoutineBuilderView.swift line 3-7.
class _RoutineSlot {
  final TemplateDto template;
  final TextEditingController controller;

  _RoutineSlot({required this.template, required String label})
      : controller = TextEditingController(text: label);

  String get label => controller.text;
  set label(String value) => controller.text = value;

  void dispose() {
    controller.dispose();
  }
}

/// Full-screen routine builder for creating or editing workout programs.
///
/// Matches iOS `RoutineBuilderView` — RoutineBuilderView.swift lines 9-205.
class RoutineBuilderScreen extends StatefulWidget {
  /// If non-null, we're editing an existing program.
  final ProgramDto? existingProgram;

  const RoutineBuilderScreen({super.key, this.existingProgram});

  @override
  State<RoutineBuilderScreen> createState() => _RoutineBuilderScreenState();
}

class _RoutineBuilderScreenState extends State<RoutineBuilderScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late List<_RoutineSlot> _slots;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    final program = widget.existingProgram;
    _nameController = TextEditingController(text: program?.name ?? '');
    _descriptionController =
        TextEditingController(text: program?.description ?? '');
    _slots = (program?.templates ?? []).asMap().entries.map((e) {
      final index = e.key;
      final template = e.value;
      final labels = program?.templateLabels ?? [];
      return _RoutineSlot(
        template: template,
        label: index < labels.length ? labels[index] : 'Day ${index + 1}',
      );
    }).toList();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    for (final slot in _slots) {
      slot.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Main scrollable content with reorderable list
          Padding(
            padding: EdgeInsets.only(top: topPadding + 80),
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoSection(),
                  const SizedBox(height: 24),
                  _buildSlotsSection(),
                ],
              ),
            ),
          ),

          // Fixed bottom "Add Template" button
          if (_slots.isNotEmpty)
            Positioned(
              left: 16,
              right: 16,
              bottom: 32,
              child: SafeArea(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _openTemplatePicker,
                    icon: const Icon(Icons.add_circle_outline_rounded,
                        size: 20),
                    label: const Text('Add Template'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 4,
                      shadowColor: AppColors.primary.withValues(alpha: 0.3),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),

          // Floating header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ZiroSheetHeader(
              title: widget.existingProgram != null
                  ? 'Edit Routine'
                  : 'New Routine',
              showCancel: true,
              showDone: true,
              onCancel: () {
                final router = GoRouter.of(context);
                if (router.canPop()) {
                  router.pop();
                } else {
                  context.go('/');
                }
              },
              onDone: _save,
              leadingText: 'Cancel',
              trailingText: 'Save',
            ),
          ),

          // Saving overlay
          if (_isSaving)
            Container(
              color: Colors.black26,
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              hintText: 'Routine Name',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16),
            ),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.foreground,
            ),
          ),
          const Divider(height: 1, color: AppColors.borderMuted),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(
              hintText: 'Description (Optional)',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16),
            ),
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.foreground,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSlotsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const Text(
                'Routine Templates',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.foreground,
                ),
              ),
              const Spacer(),
              Text(
                '${_slots.length} Templates',
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.mutedText,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        // Reorderable slot list or empty state
        if (_slots.isEmpty)
          _buildEmptyState()
        else
          // Use ReorderableListView.builder for drag-to-reorder
          ReorderableListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            buildDefaultDragHandles: false,
            itemCount: _slots.length,
            onReorderItem: _onReorder,
            proxyDecorator: (child, index, animation) {
              return AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.transparent,
                    child: child,
                  );
                },
                child: child,
              );
            },
            itemBuilder: (context, index) =>
                _buildSlotCard(index, _slots[index]),
          ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: _openTemplatePicker,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.3),
              width: 2,
            ),
          ),
          child: Column(
            children: [
              Icon(
                Icons.add_circle_rounded,
                size: 32,
                color: AppColors.primary.withValues(alpha: 0.7),
              ),
              const SizedBox(height: 8),
              Text(
                'Add your first template',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary.withValues(alpha: 0.8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSlotCard(int index, _RoutineSlot slot) {
    // Key is required by ReorderableListView for stable item identity.
    // Using ValueKey(slot.template.id) ensures Flutter tracks items through reorder.
    final exerciseCount = slot.template.exercises.isNotEmpty
        ? slot.template.exercises.length
        : slot.template.exerciseCount;

    return Container(
      key: ValueKey(slot.template.id),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.borderMuted),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Slot header: drag handle + day label + delete
          Row(
            children: [
              // Drag handle — triggers ReorderableListView reorder natively
              ReorderableDragStartListener(
                index: index,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  child: const Icon(
                    Icons.drag_handle_rounded,
                    size: 20,
                    color: AppColors.mutedText,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              // Beautiful iOS-style day label chip
              Container(
                width: 100,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: slot.controller,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => setState(() => _slots.removeAt(index)),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  child: const Icon(
                    Icons.delete_rounded,
                    size: 20,
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Template info
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      slot.template.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.foreground,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$exerciseCount Exercises',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.mutedText,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      // newIndex accounts for the removed item — no manual adjustment needed.
      final slot = _slots.removeAt(oldIndex);
      _slots.insert(newIndex, slot);
    });
  }

  void _openTemplatePicker() async {
    final result = await showModalBottomSheet<TemplateDto>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: context.read<ProgramCubit>(),
        child: TemplatePickerSheet(
          existingTemplateIds: _slots.map((s) => s.template.id).toSet(),
        ),
      ),
    );

    if (result != null && mounted) {
      TemplateDto fullTemplate = result;
      // If we selected a standalone library template with empty exercises,
      // dynamically fetch the fully populated detailed record from the DB.
      if (result.exercises.isEmpty && !result.id.startsWith('local_')) {
        setState(() => _isSaving = true);
        try {
          fullTemplate = await getIt<WorkoutSessionRepository>().getTemplate(result.id);
        } catch (e) {
          developer.log('Failed to fetch full template: $e', name: 'routine_builder');
        } finally {
          if (mounted) {
            setState(() => _isSaving = false);
          }
        }
      }
      setState(() {
        _slots.add(_RoutineSlot(
          template: fullTemplate,
          label: 'Day ${_slots.length + 1}',
        ));
      });
    }
  }

  Future<void> _save() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a routine name')),
      );
      return;
    }

    setState(() => _isSaving = true);

    final cubit = context.read<ProgramCubit>();

    if (widget.existingProgram != null) {
      // The client API does not support updating programs — show a message.
      if (mounted) {
        setState(() => _isSaving = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Editing is only available through your trainer.'),
          ),
        );
      }
      return;
    }

    // Create the program via API (name + description only).
    final result = await cubit.createProgram(
      name: name,
      description: _descriptionController.text.trim().nullIfEmpty,
    );

    if (result == null || !mounted) {
      setState(() => _isSaving = false);
      return;
    }

    // Create ALL templates on the backend with inline exercises (single API call each).
    for (var i = 0; i < _slots.length; i++) {
      final slot = _slots[i];

      // Serialize exercises for the API request.
      final exercises = slot.template.exercises.map((e) => {
            'exerciseId': e.exerciseId ?? e.exercise?.id ?? '',
            if (e.targetReps != null) 'targetReps': e.targetReps,
            if (e.targetSets != null) 'targetSets': e.targetSets,
            if (e.durationSeconds != null) 'durationSeconds': e.durationSeconds,
            if (e.notes != null) 'notes': e.notes,
            'order': e.order,
          }).toList();

      final created = await cubit.createTemplate(
        programId: result.id,
        name: slot.template.name,
        description: slot.template.description,
        exercises: exercises.isNotEmpty ? exercises : null,
      );

      if (created != null) {
        // Re-construct the slot using the newly created template and its label.
        _slots[i] = _RoutineSlot(template: created, label: slot.label);
      }
    }

    if (mounted) {
      setState(() => _isSaving = false);
      context.read<HomeCubit>().refresh();
      Navigator.of(context).maybePop();
    }
  }
}

extension on String {
  String? get nullIfEmpty => isEmpty ? null : this;
}
      ]]>
    </file>
    <file path="TASKS.md">
      <![CDATA[
- [x] Fix exercise count in Routine Builder screen to show the correct count of exercises in each assigned template.
- [x] Resolve compile error in RoutineBuilderScreen by properly structuring it as a single StatefulWidget.
- [x] Fix routine saving by loading the full list of template exercises on selection and fixing API syntax errors.
- [x] Modernize and fix Day labels input styling to use proper TextEditingControllers and clean up the visual hierarchy.
      ]]>
    </file>
  </modifications>
</response>