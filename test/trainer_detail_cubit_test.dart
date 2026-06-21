import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:ziro_fit/features/trainers/cubit/trainer_detail_cubit.dart';
import 'package:ziro_fit/features/trainers/cubit/trainer_detail_state.dart';
import 'package:ziro_fit/features/trainers/data/models/trainer_detail_dto.dart';
import 'package:ziro_fit/features/trainers/data/trainer_repository.dart';

class MockTrainerRepository extends Mock implements TrainerRepository {}

void main() {
  late TrainerRepository repository;
  late TrainerDetailCubit cubit;

  setUp(() {
    repository = MockTrainerRepository();
    cubit = TrainerDetailCubit(repository);
  });

  tearDown(() {
    cubit.close();
  });

  group('TrainerDetailCubit', () {
    test('initial state is TrainerDetailInitial', () {
      expect(cubit.state, const TrainerDetailInitial());
    });

    blocTest<TrainerDetailCubit, TrainerDetailState>(
      'emits [loading, loaded] when load succeeds',
      build: () {
        when(() => repository.getTrainerDetail('testuser'))
            .thenAnswer((_) async => const TrainerDetailDto(
                  id: '1',
                  username: 'testuser',
                  name: 'Test Trainer',
                ));
        when(() => repository.getTrainerPackages('testuser'))
            .thenAnswer((_) async => []);
        return cubit;
      },
      act: (cubit) => cubit.load('testuser'),
      expect: () => [
        const TrainerDetailLoading(),
        isA<TrainerDetailLoaded>()
            .having((s) => s.trainer.username, 'username', 'testuser'),
      ],
    );

    blocTest<TrainerDetailCubit, TrainerDetailState>(
      'emits [loading, error] when load fails',
      build: () {
        when(() => repository.getTrainerDetail('testuser'))
            .thenThrow(Exception('API error'));
        return cubit;
      },
      act: (cubit) => cubit.load('testuser'),
      expect: () => [
        const TrainerDetailLoading(),
        isA<TrainerDetailError>(),
      ],
    );
  });
}
