import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ziro_fit/core/database/app_database.dart';
import 'package:ziro_fit/features/home/data/local_template_repository.dart';
import 'package:ziro_fit/features/trainers/data/models/exercise_dto.dart';
import 'package:ziro_fit/features/trainers/data/models/template_dto.dart';

void main() {
  late AppDatabase db;
  late LocalTemplateRepository repository;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    repository = LocalTemplateRepository(db);
  });

  tearDown(() async {
    await db.close();
  });

  TemplateDto createTemplate({
    String id = 't1',
    String name = 'Test Template',
    String? description,
    List<TemplateExerciseDto> exercises = const [],
  }) {
    return TemplateDto(
      id: id,
      name: name,
      description: description,
      exercises: exercises,
    );
  }

  TemplateExerciseDto createExercise({
    String id = 'e1',
    String exerciseId = 'ex-001',
    int order = 0,
    String? targetReps,
    int? targetSets,
    ExerciseDto? exercise,
  }) {
    return TemplateExerciseDto(
      id: id,
      exerciseId: exerciseId,
      order: order,
      targetReps: targetReps,
      targetSets: targetSets,
      exercise: exercise,
    );
  }

  group('LocalTemplateRepository', () {
    test('save and getAll — saves template and retrieves it with exercises', () async {
      final exercises = [
        createExercise(exerciseId: 'pushup', targetReps: '12', targetSets: 3),
        createExercise(id: 'e2', exerciseId: 'squat', order: 1, targetReps: '15', targetSets: 4),
      ];
      final template = createTemplate(
        id: 'full-1',
        name: 'Full Body',
        exercises: exercises,
      );

      await repository.save(template);
      final all = await repository.getAll();

      expect(all, hasLength(1));
      expect(all.first.id, 'full-1');
      expect(all.first.name, 'Full Body');
      expect(all.first.exercises, hasLength(2));
      expect(all.first.exercises[0].exerciseId, 'pushup');
      expect(all.first.exercises[0].targetReps, '12');
      expect(all.first.exercises[0].targetSets, 3);
      expect(all.first.exercises[1].exerciseId, 'squat');
      expect(all.first.exercises[1].targetReps, '15');
      expect(all.first.exercises[1].targetSets, 4);
    });

    test('getById — returns template after save', () async {
      final template = createTemplate(id: 'get-by-id', name: 'Findable');

      await repository.save(template);
      final result = await repository.getById('get-by-id');

      expect(result, isNotNull);
      expect(result!.id, 'get-by-id');
      expect(result.name, 'Findable');
    });

    test('getById — returns null for non-existent id', () async {
      final result = await repository.getById('non-existent');
      expect(result, isNull);
    });

    test('delete — soft-deletes and excludes from getAll', () async {
      final template = createTemplate(id: 'to-delete', name: 'Delete Me');

      await repository.save(template);
      expect(await repository.getAll(), hasLength(1));

      await repository.delete('to-delete');
      final all = await repository.getAll();
      expect(all, isEmpty);
    });

    test('delete — soft-delete preserves row but sets deletedAt', () async {
      final template = createTemplate(id: 'soft', name: 'Soft Delete');

      await repository.save(template);
      await repository.delete('soft');

      // Direct DB query should still find the row but with deletedAt set
      final row = await (db.select(db.workoutTemplates)
            ..where((t) => t.id.equals('soft')))
          .getSingleOrNull();

      expect(row, isNotNull);
      expect(row!.deletedAt, isNotNull);
      expect(row.syncStatus, 'deleted');

      // Repository.getAll() filters out deleted
      expect(await repository.getAll(), isEmpty);
    });

    test('update — save with same id overwrites name and exercises', () async {
      final original = createTemplate(id: 'updatable', name: 'Original');
      await repository.save(original);

      final updated = createTemplate(
        id: 'updatable',
        name: 'Updated Name',
        exercises: [
          createExercise(id: 'e-upd', exerciseId: 'new-ex'),
        ],
      );
      await repository.save(updated);

      final all = await repository.getAll();
      expect(all, hasLength(1));
      expect(all.first.name, 'Updated Name');
      expect(all.first.exercises, hasLength(1));
      expect(all.first.exercises[0].exerciseId, 'new-ex');
    });

    test('multiple templates — getAll returns all saved templates', () async {
      await repository.save(createTemplate(id: 'a', name: 'Alpha'));
      await repository.save(createTemplate(id: 'b', name: 'Beta'));
      await repository.save(createTemplate(id: 'c', name: 'Gamma'));

      final all = await repository.getAll();
      expect(all, hasLength(3));

      final names = all.map((t) => t.name).toSet();
      expect(names, containsAll(['Alpha', 'Beta', 'Gamma']));
    });

    test('exercises JSON round-trip — preserves targetReps and targetSets', () async {
      final exercises = [
        createExercise(
          id: 'roundtrip-1',
          exerciseId: 'bench',
          targetReps: '12',
          targetSets: 4,
          exercise: const ExerciseDto(
            id: 'bench-detail',
            name: 'Bench Press',
            muscleGroup: 'Chest',
          ),
        ),
        createExercise(
          id: 'roundtrip-2',
          exerciseId: 'curl',
          order: 1,
          targetReps: '10',
          targetSets: 3,
        ),
      ];
      final template = createTemplate(
        id: 'roundtrip',
        name: 'Round Trip',
        exercises: exercises,
      );

      await repository.save(template);
      final result = await repository.getById('roundtrip');

      expect(result, isNotNull);
      expect(result!.exercises, hasLength(2));

      // First exercise: full details
      expect(result.exercises[0].id, 'roundtrip-1');
      expect(result.exercises[0].exerciseId, 'bench');
      expect(result.exercises[0].targetReps, '12');
      expect(result.exercises[0].targetSets, 4);
      expect(result.exercises[0].order, 0);
      expect(result.exercises[0].exercise, isNotNull);
      expect(result.exercises[0].exercise!.name, 'Bench Press');
      expect(result.exercises[0].exercise!.muscleGroup, 'Chest');

      // Second exercise: minimal
      expect(result.exercises[1].id, 'roundtrip-2');
      expect(result.exercises[1].exerciseId, 'curl');
      expect(result.exercises[1].targetReps, '10');
      expect(result.exercises[1].targetSets, 3);
    });

    test('empty exercises — saves and returns template with empty list', () async {
      final template = createTemplate(
        id: 'empty-ex',
        name: 'No Exercises',
        description: 'Just a placeholder',
        exercises: [],
      );

      await repository.save(template);
      final result = await repository.getById('empty-ex');

      expect(result, isNotNull);
      expect(result!.name, 'No Exercises');
      expect(result.description, 'Just a placeholder');
      expect(result.exercises, isEmpty);
    });

    test('getAll — excludes soft-deleted templates', () async {
      await repository.save(createTemplate(id: 'keep', name: 'Keep Me'));
      await repository.save(createTemplate(id: 'delete', name: 'Delete Me'));
      await repository.save(createTemplate(id: 'keep2', name: 'Keep Me Too'));

      await repository.delete('delete');

      final all = await repository.getAll();
      expect(all, hasLength(2));
      expect(all.map((t) => t.id), containsAll(['keep', 'keep2']));
      expect(all.map((t) => t.id), isNot(contains('delete')));
    });
  });
}
