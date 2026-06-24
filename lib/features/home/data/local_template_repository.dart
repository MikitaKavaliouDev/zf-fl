import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../../core/database/app_database.dart';
import '../../trainers/data/models/template_dto.dart';

/// Repository for persisting local (client-created) workout templates
/// to the device's SQLite database via Drift.
///
/// Matches iOS `ProgramsViewModel` local template caching with
/// `CacheManager` — but uses Drift instead of UserDefaults.
///
/// Local templates are identified by their `local_*` prefixed IDs.
/// They are NOT synced to the backend — they exist only on-device.
@singleton
class LocalTemplateRepository {
  final AppDatabase _db;

  LocalTemplateRepository(this._db);

  /// Load all non-deleted local templates from the database.
  Future<List<TemplateDto>> getAll() async {
    final entities = await (_db.select(_db.workoutTemplates)
          ..where((t) => t.deletedAt.isNull()))
        .get();
    return entities.map(_toDto).toList();
  }

  /// Get a single template by its ID.
  Future<TemplateDto?> getById(String id) async {
    final entity = await (_db.select(_db.workoutTemplates)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    return entity != null ? _toDto(entity) : null;
  }

  /// Save (insert or update) a template.
  ///
  /// Uses `replace` (insert or replace) semantics so saving a template
  /// with the same ID overwrites the existing row.
  Future<void> save(TemplateDto template) async {
    final now = DateTime.now().millisecondsSinceEpoch;
    final existing = await getById(template.id);
    final companion = _toCompanion(template, now, isNew: existing == null);
    await _db.into(_db.workoutTemplates).insertOnConflictUpdate(companion);
  }

  /// Soft-delete a template by setting [deletedAt].
  Future<void> delete(String id) async {
    final now = DateTime.now().millisecondsSinceEpoch;
    await (_db.update(_db.workoutTemplates)
          ..where((t) => t.id.equals(id)))
        .write(WorkoutTemplatesCompanion(
          deletedAt: Value(now),
          syncStatus: const Value('deleted'),
        ));
  }

  /// Convert a [WorkoutTemplateEntity] from Drift to a [TemplateDto].
  TemplateDto _toDto(WorkoutTemplateEntity entity) {
    return TemplateDto(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      exercises: _parseExercises(entity.exercisesJson),
    );
  }

  /// Parse the JSON-encoded exercises string into a list of
  /// [TemplateExerciseDto]. Returns an empty list on null or invalid JSON.
  List<TemplateExerciseDto> _parseExercises(String? json) {
    if (json == null || json.isEmpty) return [];
    try {
      final list = jsonDecode(json) as List<dynamic>;
      return list
          .map((e) => TemplateExerciseDto.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return [];
    }
  }

  /// Convert a [TemplateDto] to a [WorkoutTemplatesCompanion] for Drift.
  WorkoutTemplatesCompanion _toCompanion(
    TemplateDto template,
    int now, {
    bool isNew = true,
  }) {
    return WorkoutTemplatesCompanion(
      id: Value(template.id),
      name: Value(template.name),
      description: Value(template.description),
      programId: const Value('local'),
      order: const Value(0),
      exercisesJson: Value(_encodeExercises(template.exercises)),
      createdAt: Value(isNew ? now : now),
      updatedAt: Value(now),
      syncStatus: const Value('synced'),
    );
  }

  /// Encode the exercises list to a JSON string for storage.
  String? _encodeExercises(List<TemplateExerciseDto> exercises) {
    if (exercises.isEmpty) return null;
    return jsonEncode(exercises.map((e) => e.toJson()).toList());
  }
}
