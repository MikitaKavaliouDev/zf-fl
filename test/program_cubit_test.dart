import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:ziro_fit/features/home/cubit/program_cubit.dart';
import 'package:ziro_fit/features/home/cubit/program_state.dart';
import 'package:ziro_fit/features/home/data/local_template_repository.dart';
import 'package:ziro_fit/features/home/data/models/assigned_program_dto.dart';
import 'package:ziro_fit/features/home/data/models/program_dto.dart';
import 'package:ziro_fit/features/home/data/models/program_library_response.dart';
import 'package:ziro_fit/features/home/data/program_repository.dart';
import 'package:ziro_fit/features/trainers/data/models/template_dto.dart';
import 'package:ziro_fit/features/trainers/data/workout_session_repository.dart';

class MockProgramRepository extends Mock implements ProgramRepository {}

class MockLocalTemplateRepository extends Mock
    implements LocalTemplateRepository {}

class MockWorkoutSessionRepository extends Mock
    implements WorkoutSessionRepository {}

void main() {
  late ProgramRepository repository;
  late LocalTemplateRepository localRepo;
  late WorkoutSessionRepository workoutSessionRepo;
  late ProgramCubit cubit;

  setUp(() {
    repository = MockProgramRepository();
    localRepo = MockLocalTemplateRepository();
    workoutSessionRepo = MockWorkoutSessionRepository();
    cubit = ProgramCubit(repository, localRepo, workoutSessionRepo);
  });

  tearDown(() {
    cubit.close();
  });

  group('ProgramCubit', () {
    test('initial state is ProgramInitial', () {
      expect(cubit.state, const ProgramState.initial());
    });

    group('loadTemplates', () {
      const apiPersonalTemplate = TemplateLibraryItem(
        id: 'api-1',
        name: 'API Personal Template',
        programId: 'prog-1',
        source: 'self',
        program: TemplateLibraryProgram(
          name: 'My Program',
          trainerId: 'user-1',
        ),
        exerciseCount: 2,
        exercises: [
          TemplateLibraryExercise(
            id: 'te-1',
            type: 'EXERCISE',
            exerciseId: 'ex-1',
            targetReps: '10',
            exercise: TemplateLibraryExerciseDetail(
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
            exercise: TemplateLibraryExerciseDetail(
              id: 'ex-2',
              name: 'Squat',
              muscleGroup: 'Legs',
            ),
          ),
        ],
      );

      const apiSystemTemplate = TemplateLibraryItem(
        id: 'api-2',
        name: 'System Template',
        description: 'From the library',
        programId: 'sys-prog',
        source: 'system',
        program: TemplateLibraryProgram(
          name: 'System Program',
        ),
        exercises: [],
      );

      const libraryResponse = ProgramLibraryResponse(
        personalTemplates: [apiPersonalTemplate],
        systemTemplates: [apiSystemTemplate],
        assignedPrograms: [],
      );

      const assignedTemplate = TemplateDto(
        id: 'assigned-tpl-1',
        name: 'Full Body Foundations',
        programId: 'prog-assigned',
        exerciseCount: 24,
      );

      const libraryWithAssigned = ProgramLibraryResponse(
        personalTemplates: [],
        systemTemplates: [],
        assignedPrograms: [
          AssignedProgramDto(
            assignmentId: 'assign-1',
            isActive: true,
            program: ProgramDto(
              id: 'prog-assigned',
              name: 'Assigned Program',
              templates: [assignedTemplate],
            ),
          ),
        ],
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
          const localTemplate = TemplateDto(
            id: 'local_abc123',
            name: 'Local Template',
            exercises: [
              TemplateExerciseDto(
                id: 'local_ex_1',
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
          const collidingLocal = TemplateDto(
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
        'extracts templates from assigned programs',
        build: () {
          when(() => repository.getPrograms(
                type: any(named: 'type'),
                source: any(named: 'source'),
              )).thenAnswer((_) async => libraryWithAssigned);
          when(() => localRepo.getAll()).thenAnswer((_) async => []);
          return cubit;
        },
        act: (cubit) => cubit.loadTemplates(),
        expect: () => [
          const ProgramState.loading(),
          isA<ProgramLoaded>().having(
            (s) => s.templates.length,
            'template count from assigned program',
            1,
          ).having(
            (s) => s.templates.first.name,
            'template name',
            'Full Body Foundations',
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
      const localTemplate = TemplateDto(
        id: 'local_new',
        name: 'New Local Template',
        exercises: [
          TemplateExerciseDto(
            id: 'le_1',
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
              )).thenAnswer((_) async => const ProgramLibraryResponse(
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
