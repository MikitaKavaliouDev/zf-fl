import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:ziro_fit/features/trainers/cubit/trainer_list_cubit.dart';
import 'package:ziro_fit/features/trainers/cubit/trainer_list_state.dart';
import 'package:ziro_fit/features/trainers/data/models/trainer_list_item_dto.dart';
import 'package:ziro_fit/features/trainers/data/trainer_repository.dart';

class MockTrainerRepository extends Mock implements TrainerRepository {}

void main() {
  late TrainerRepository repository;
  late TrainerListCubit cubit;

  setUp(() {
    repository = MockTrainerRepository();
    cubit = TrainerListCubit(repository);
  });

  tearDown(() {
    cubit.close();
  });

  group('TrainerListCubit', () {
    test('initial state is TrainerListInitial', () {
      expect(cubit.state, const TrainerListInitial());
    });

    blocTest<TrainerListCubit, TrainerListState>(
      'emits [loading, loaded] when load succeeds',
      build: () {
        when(() => repository.getTrainers())
            .thenAnswer((_) async => [
                  const TrainerListItemDto(id: '1', username: 'trainer1'),
                  const TrainerListItemDto(id: '2', username: 'trainer2'),
                ]);
        return cubit;
      },
      act: (cubit) => cubit.load(),
      expect: () => [
        const TrainerListLoading(),
        isA<TrainerListLoaded>()
            .having((s) => s.trainers.length, 'length', 2)
            .having((s) => s.hasMore, 'hasMore', false),
      ],
    );

    blocTest<TrainerListCubit, TrainerListState>(
      'emits [loading, error] when load fails',
      build: () {
        when(() => repository.getTrainers())
            .thenThrow(Exception('API error'));
        return cubit;
      },
      act: (cubit) => cubit.load(),
      expect: () => [
        const TrainerListLoading(),
        isA<TrainerListError>(),
      ],
    );

    blocTest<TrainerListCubit, TrainerListState>(
      'loads more pages with loadMore (emits loadingMore intermediate state)',
      build: () {
        when(() => repository.getTrainers())
            .thenAnswer((_) async => [
                  for (int i = 0; i < 15; i++)
                    TrainerListItemDto(id: '$i', username: 't$i'),
                ]);
        when(() => repository.getTrainers(page: 2))
            .thenAnswer((_) async => [
                  const TrainerListItemDto(id: '16', username: 't16'),
                ]);
        return cubit;
      },
      act: (cubit) async {
        await cubit.load();
        await cubit.loadMore();
      },
      expect: () => [
        const TrainerListLoading(),
        isA<TrainerListLoaded>()
            .having((s) => s.trainers.length, 'after load', 15)
            .having((s) => s.hasMore, 'hasMore', true),
        isA<TrainerListLoadingMore>(),
        isA<TrainerListLoaded>()
            .having((s) => s.trainers.length, 'after loadMore', 16)
            .having((s) => s.page, 'page', 2),
      ],
    );

    blocTest<TrainerListCubit, TrainerListState>(
      'load with query returns filtered results',
      build: () {
        when(() => repository.getTrainers(query: 'yo'))
            .thenAnswer((_) async => [
                  const TrainerListItemDto(id: '1', username: 'yogini'),
                ]);
        return cubit;
      },
      act: (cubit) => cubit.load(query: 'yo'),
      expect: () => [
        const TrainerListLoading(),
        isA<TrainerListLoaded>()
            .having((s) => s.trainers.length, 'length', 1)
            .having((s) => s.query, 'query', 'yo'),
      ],
    );
  });
}
