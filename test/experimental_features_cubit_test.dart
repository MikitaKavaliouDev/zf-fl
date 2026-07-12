import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ziro_fit/core/settings/experimental_features_service.dart';
import 'package:ziro_fit/features/profile/cubit/experimental_features_cubit.dart';
import 'package:ziro_fit/features/profile/cubit/experimental_features_state.dart';

class MockExperimentalFeaturesService extends Mock
    implements ExperimentalFeaturesService {}

void main() {
  late ExperimentalFeaturesService service;
  late ExperimentalFeaturesCubit cubit;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    service = MockExperimentalFeaturesService();
    cubit = ExperimentalFeaturesCubit(service);
  });

  tearDown(() {
    cubit.close();
  });

  group('ExperimentalFeaturesCubit', () {
    test('initial state has all flags false', () {
      expect(
        cubit.state,
        const ExperimentalFeaturesState(
          dailyExerciseTargets: false,
          voiceFeedbackBeta: false,
          personalRoutines: false,
          customAppMode: false,
        ),
      );
    });

    blocTest<ExperimentalFeaturesCubit, ExperimentalFeaturesState>(
      'load() fetches all flags from service and emits populated state',
      setUp: () {
        when(() => service.getDailyTargetsEnabled())
            .thenAnswer((_) async => true);
        when(() => service.getVoiceFeedbackEnabled())
            .thenAnswer((_) async => false);
        when(() => service.getPersonalRoutinesEnabled())
            .thenAnswer((_) async => true);
        when(() => service.getCustomAppModeEnabled())
            .thenAnswer((_) async => false);
      },
      build: () => cubit,
      act: (cubit) => cubit.load(),
      expect: () => [
        const ExperimentalFeaturesState(
          dailyExerciseTargets: true,
          voiceFeedbackBeta: false,
          personalRoutines: true,
          customAppMode: false,
        ),
      ],
    );

    blocTest<ExperimentalFeaturesCubit, ExperimentalFeaturesState>(
      'setDailyExerciseTargets(true) persists and updates state',
      setUp: () {
        when(() => service.setDailyTargetsEnabled(true))
            .thenAnswer((_) async {});
      },
      build: () => cubit,
      act: (cubit) => cubit.setDailyExerciseTargets(true),
      expect: () => [
        const ExperimentalFeaturesState(dailyExerciseTargets: true),
      ],
      verify: (_) {
        verify(() => service.setDailyTargetsEnabled(true)).called(1);
      },
    );

    blocTest<ExperimentalFeaturesCubit, ExperimentalFeaturesState>(
      'setVoiceFeedbackBeta(true) persists and updates state',
      setUp: () {
        when(() => service.setVoiceFeedbackEnabled(true))
            .thenAnswer((_) async {});
      },
      build: () => cubit,
      act: (cubit) => cubit.setVoiceFeedbackBeta(true),
      expect: () => [
        const ExperimentalFeaturesState(voiceFeedbackBeta: true),
      ],
      verify: (_) {
        verify(() => service.setVoiceFeedbackEnabled(true)).called(1);
      },
    );

    blocTest<ExperimentalFeaturesCubit, ExperimentalFeaturesState>(
      'setPersonalRoutines(true) persists and updates state',
      setUp: () {
        when(() => service.setPersonalRoutinesEnabled(true))
            .thenAnswer((_) async {});
      },
      build: () => cubit,
      act: (cubit) => cubit.setPersonalRoutines(true),
      expect: () => [
        const ExperimentalFeaturesState(personalRoutines: true),
      ],
      verify: (_) {
        verify(() => service.setPersonalRoutinesEnabled(true)).called(1);
      },
    );

    blocTest<ExperimentalFeaturesCubit, ExperimentalFeaturesState>(
      'setCustomAppMode(true) persists and updates state',
      setUp: () {
        when(() => service.setCustomAppModeEnabled(true))
            .thenAnswer((_) async {});
      },
      build: () => cubit,
      act: (cubit) => cubit.setCustomAppMode(true),
      expect: () => [
        const ExperimentalFeaturesState(customAppMode: true),
      ],
      verify: (_) {
        verify(() => service.setCustomAppModeEnabled(true)).called(1);
      },
    );

    blocTest<ExperimentalFeaturesCubit, ExperimentalFeaturesState>(
      'toggling one flag preserves others',
      setUp: () {
        when(() => service.setDailyTargetsEnabled(false))
            .thenAnswer((_) async {});
      },
      build: () => cubit,
      seed: () => const ExperimentalFeaturesState(
        dailyExerciseTargets: true,
        voiceFeedbackBeta: true,
        personalRoutines: true,
        customAppMode: true,
      ),
      act: (cubit) => cubit.setDailyExerciseTargets(false),
      expect: () => [
        const ExperimentalFeaturesState(
          dailyExerciseTargets: false,
          voiceFeedbackBeta: true,
          personalRoutines: true,
          customAppMode: true,
        ),
      ],
    );
  });
}
