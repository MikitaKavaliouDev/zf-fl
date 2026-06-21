import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ziro_fit/core/connectivity/connectivity_service.dart';
import 'package:ziro_fit/features/sync/cubit/sync_cubit.dart';
import 'package:ziro_fit/features/sync/cubit/sync_state.dart';
import 'package:ziro_fit/features/sync/data/sync_repository.dart';

class MockSyncRepository extends Mock implements SyncRepository {}
class MockConnectivityService extends Mock implements ConnectivityService {}

void main() {
  late SyncRepository repository;
  late ConnectivityService connectivity;
  late SyncCubit cubit;

  setUp(() {
    repository = MockSyncRepository();
    connectivity = MockConnectivityService();
    when(() => connectivity.isOnline).thenReturn(true);
    when(() => connectivity.onConnectivityChanged)
        .thenAnswer((_) => const Stream.empty());
    cubit = SyncCubit(repository, connectivity);
  });

  tearDown(() {
    cubit.close();
  });

  group('SyncCubit', () {
    test('initial state is SyncIdle with isOnline=true', () {
      expect(
        cubit.state,
        isA<SyncIdle>().having((s) => s.isOnline, 'isOnline', true),
      );
    });

    blocTest<SyncCubit, SyncState>(
      'sync() succeeds when online',
      build: () {
        when(() => connectivity.checkConnectivity())
            .thenAnswer((_) async => true);
        when(() => repository.sync(any())).thenAnswer((_) async => 1000);
        return cubit;
      },
      act: (cubit) => cubit.sync(),
      expect: () => [
        isA<SyncInProgress>(),
        isA<SyncIdle>().having((s) => s.lastSyncAt, 'lastSyncAt', 1000),
      ],
    );

    blocTest<SyncCubit, SyncState>(
      'sync() emits error when offline',
      build: () {
        when(() => connectivity.checkConnectivity())
            .thenAnswer((_) async => false);
        return cubit;
      },
      act: (cubit) => cubit.sync(),
      expect: () => [
        isA<SyncError>().having(
          (s) => s.message,
          'message',
          contains('No internet'),
        ),
      ],
    );

    blocTest<SyncCubit, SyncState>(
      'sync() emits error on repository failure',
      build: () {
        when(() => connectivity.checkConnectivity())
            .thenAnswer((_) async => true);
        when(() => repository.sync(any()))
            .thenThrow(Exception('Server error'));
        return cubit;
      },
      act: (cubit) => cubit.sync(),
      expect: () => [
        isA<SyncInProgress>(),
        isA<SyncError>(),
      ],
    );

    blocTest<SyncCubit, SyncState>(
      'does not sync twice',
      build: () {
        when(() => connectivity.checkConnectivity())
            .thenAnswer((_) async => true);
        when(() => repository.sync(any())).thenAnswer((_) async {
          await Future.delayed(const Duration(milliseconds: 50));
          return 1000;
        });
        return cubit;
      },
      act: (cubit) async {
        cubit.sync();
        cubit.sync(); // second call should be no-op
        await Future.delayed(const Duration(milliseconds: 100));
      },
      expect: () => [
        isA<SyncInProgress>(),
        isA<SyncIdle>(),
      ],
    );
  });
}
