import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:ziro_fit/features/home/cubit/program_cubit.dart';
import 'package:ziro_fit/features/home/cubit/program_state.dart';
import 'package:ziro_fit/features/home/data/local_template_repository.dart';
import 'package:ziro_fit/features/home/data/models/program_library_response.dart';
import 'package:ziro_fit/features/home/data/program_repository.dart';
import 'package:ziro_fit/features/trainers/data/models/template_dto.dart';

class MockProgramRepository extends Mock implements ProgramRepository {}

class MockLocalTemplateRepository extends Mock
    implements LocalTemplateRepository {}

void main() {
  late ProgramRepository repository;
  late LocalTemplateRepository localRepo;
  late ProgramCubit cubit;

  setUp(() {
    repository = MockProgramRepository();
    localRepo = MockLocalTemplateRepository();
    cubit = ProgramCubit(repository, localRepo);
  });

  tearDown(() {
    cubit.close();
  });

  group('ProgramCubit', () {
    test('initial state is ProgramInitial', () {
      expect(cubit.state, const ProgramState.initial());
    });

    group('loadTemplates', () {
      final apiPersonalTemplate = TemplateLibraryItem(
        id: 'api-1',
        name: 'API Personal Template',
        description: null,
        programId: 'prog-1',
        order: 0,
        source: 'self',
        program: const TemplateLibraryProgram(
          name: 'My Program',
          trainerId: 'user-1',
        ),
        exerciseCount: 2,
        exercises: [
          TemplateLibraryExercise(
            id: 'te-1',
            order: 0,
            type: 'EXERCISE',
            exerciseId: 'ex-1',
            targetReps: '10',
            exercise: const TemplateLibraryExerciseDetail(
              id: 'ex-1',
              name: 'Push Up',
              muscleGroup: 'Chest',
            ),
          ),
          TemplateLibraryExercise(
            id: 'te-2',
            order: 1,
            type: 'EXERCISE',
            exerciseId: 'ex-2',
            targetReps: '12',
            exercise: const TemplateLibraryExerciseDetail(
              id: 'ex-2',
              name: 'Squat',
              muscleGroup: 'Legs',
            ),
          ),
        ],
      );

      final apiSystemTemplate = TemplateLibraryItem(
        id: 'api-2',
        name: 'System Template',
        description: 'From the library',
        programId: 'sys-prog',
        order: 0,
        source: 'system',
        program: const TemplateLibraryProgram(
          name: 'System Program',
          trainerId: null,
        ),
        exerciseCount: 0,
        exercises: [],
      );

      final libraryResponse = ProgramLibraryResponse(
        personalTemplates: [apiPersonalTemplate],
        systemTemplates: [apiSystemTemplate],
      );

      blocTest<ProgramCubit, ProgramState>(
        'emits [loading, loaded] with API templates only when local is empty',
        build: () {
          when(() => repository.getPrograms(
                type: any(named: 'type'),
                source: any(named: 'source'),
              )).thenAnswer((_) async => libraryResponse);
          when(() => localRepo.getAll()).thenAnswer((_) async => []);
          return cubit;
        },
        act: (cubit) => cubit.loadTemplates(),
        expect: () => [
          const ProgramState.loading(),
          isA<ProgramLoaded>().having(
            (s) => s.templates.length,
            'template count',
            2,
          ),
        ],
      );

      blocTest<ProgramCubit, ProgramState>(
        'merges local templates with API templates',
        build: () {
          final localTemplate = TemplateDto(
            id: 'local_abc123',
            name: 'Local Template',
            exercises: [
              TemplateExerciseDto(
                id: 'local_ex_1',
                order: 0,
                exerciseId: 'ex-local',
                type: 'EXERCISE',
                targetReps: '10',
                targetSets: 3,
              ),
            ],
          );

          when(() => repository.getPrograms(
                type: any(named: 'type'),
                source: any(named: 'source'),
              )).thenAnswer((_) async => libraryResponse);
          when(() => localRepo.getAll())
              .thenAnswer((_) async => [localTemplate]);
          return cubit;
        },
        act: (cubit) => cubit.loadTemplates(),
        expect: () => [
          const ProgramState.loading(),
          isA<ProgramLoaded>().having(
            (s) => s.templates.length,
            'template count (2 API + 1 local)',
            3,
          ),
        ],
      );

      blocTest<ProgramCubit, ProgramState>(
        'API template wins when local has colliding ID',
        build: () {
          // Local template with same ID as API template
          final collidingLocal = TemplateDto(
            id: 'api-1',
            name: 'Local Version (should not appear)',
            exercises: [],
          );

          when(() => repository.getPrograms(
                type: any(named: 'type'),
                source: any(named: 'source'),
              )).thenAnswer((_) async => libraryResponse);
          when(() => localRepo.getAll())
              .thenAnswer((_) async => [collidingLocal]);
          return cubit;
        },
        act: (cubit) => cubit.loadTemplates(),
        expect: () => [
          const ProgramState.loading(),
          isA<ProgramLoaded>().having(
            (s) => s.templates.length,
            'still 2 templates (collision resolved)',
            2,
          ).having(
            (s) => s.templates.firstWhere((t) => t.id == 'api-1').name,
            'API name preserved',
            'API Personal Template',
          ),
        ],
      );

      blocTest<ProgramCubit, ProgramState>(
        'emits error when repository fails',
        build: () {
          when(() => repository.getPrograms(
                type: any(named: 'type'),
                source: any(named: 'source'),
              )).thenThrow(Exception('Network error'));
          return cubit;
        },
        act: (cubit) => cubit.loadTemplates(),
        expect: () => [
          const ProgramState.loading(),
          isA<ProgramError>(),
        ],
      );
    });

    group('saveLocalTemplate', () {
      final localTemplate = TemplateDto(
        id: 'local_new',
        name: 'New Local Template',
        exercises: [
          TemplateExerciseDto(
            id: 'le_1',
            order: 0,
            exerciseId: 'ex-1',
            type: 'EXERCISE',
            targetReps: '12',
            targetSets: 4,
          ),
        ],
      );

      blocTest<ProgramCubit, ProgramState>(
        'saves local template and refreshes list',
        build: () {
          when(() => localRepo.save(localTemplate)).thenAnswer((_) async {});
          // After save, loadTemplates is called — mock the full chain
          when(() => repository.getPrograms(
                type: any(named: 'type'),
                source: any(named: 'source'),
              )).thenAnswer((_) async => ProgramLibraryResponse(
                    personalTemplates: [],
                    systemTemplates: [],
                  ));
          when(() => localRepo.getAll()).thenAnswer((_) async => []);

          // Mock the save to succeed then return empty for the reload
          return cubit;
        },
        act: (cubit) => cubit.saveLocalTemplate(localTemplate),
        expect: () => [
          // saveLocalTemplate calls _localRepo.save then loadTemplates
          // which emits loading then loaded
          isA<ProgramState>(),
          isA<ProgramLoaded>(),
        ],
        verify: (_) {
          verify(() => localRepo.save(localTemplate)).called(1);
        },
      );
    });
  });
}
