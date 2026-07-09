import 'dart:async';

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

    test('initial state is SyncIdle with isOnline=false when offline', () {
      when(() => connectivity.isOnline).thenReturn(false);
      final offlineCubit = SyncCubit(repository, connectivity);
      expect(
        offlineCubit.state,
        isA<SyncIdle>().having((s) => s.isOnline, 'isOnline', false),
      );
      offlineCubit.close();
    });

    group('sync()', () {
      blocTest<SyncCubit, SyncState>(
        'succeeds when online',
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
        'emits error when offline',
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
        'emits error on repository failure',
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

      blocTest<SyncCubit, SyncState>(
        'retry after error succeeds (recovery)',
        build: () {
          // First call fails, second succeeds
          when(() => connectivity.checkConnectivity())
              .thenAnswer((_) async => true);
          when(() => repository.sync(any()))
              .thenThrow(Exception('First attempt failed'));
          return cubit;
        },
        act: (cubit) async {
          cubit.sync(); // fails
          await Future.delayed(const Duration(milliseconds: 10));
          // Reconfigure mock for success on retry
          when(() => repository.sync(any())).thenAnswer((_) async => 2000);
          cubit.sync(); // succeeds
        },
        expect: () => [
          isA<SyncInProgress>(),
          isA<SyncError>(),
          isA<SyncInProgress>(),
          isA<SyncIdle>().having((s) => s.lastSyncAt, 'lastSyncAt', 2000),
        ],
      );
    });

    group('connectivity changes', () {
      test('emits isOnline=true when coming back online', () async {
        final controller = StreamController<bool>();
        when(() => connectivity.isOnline).thenReturn(false);
        when(() => connectivity.onConnectivityChanged)
            .thenAnswer((_) => controller.stream);
        when(() => connectivity.checkConnectivity())
            .thenAnswer((_) async => true);
        when(() => repository.sync(any())).thenAnswer((_) async => 3000);

        final onlineCubit = SyncCubit(repository, connectivity);

        // Initial state: offline
        expect(
          onlineCubit.state,
          isA<SyncIdle>().having((s) => s.isOnline, 'isOnline', false),
        );

        // Simulate going online — should trigger auto-sync
        controller.add(true);
        await Future.delayed(const Duration(milliseconds: 50));

        // Should reach SyncIdle with updated timestamp
        expect(
          onlineCubit.state,
          isA<SyncIdle>().having((s) => s.lastSyncAt, 'lastSyncAt', 3000),
        );

        await controller.close();
        onlineCubit.close();
      });

      test('emits isOnline=false when connection lost in SyncIdle', () async {
        final controller = StreamController<bool>();
        when(() => connectivity.isOnline).thenReturn(true);
        when(() => connectivity.onConnectivityChanged)
            .thenAnswer((_) => controller.stream);

        final testCubit = SyncCubit(repository, connectivity);

        // Start online, then go offline
        controller.add(false);
        await Future.delayed(const Duration(milliseconds: 10));

        expect(
          testCubit.state,
          isA<SyncIdle>().having((s) => s.isOnline, 'isOnline', false),
        );

        await controller.close();
        testCubit.close();
      });

      test('emits isOnline=true when connection restored in SyncError', () async {
        final controller = StreamController<bool>();
        when(() => connectivity.isOnline).thenReturn(true);
        when(() => connectivity.onConnectivityChanged)
            .thenAnswer((_) => controller.stream);
        when(() => connectivity.checkConnectivity())
            .thenAnswer((_) async => true);
        when(() => repository.sync(any()))
            .thenThrow(Exception('Fail'));

        final testCubit = SyncCubit(repository, connectivity);

        // Trigger sync that fails → SyncError
        testCubit.sync();
        await Future.delayed(const Duration(milliseconds: 10));

        expect(testCubit.state, isA<SyncError>());

        // Connection lost → isOnline=false still in SyncError
        controller.add(false);
        await Future.delayed(const Duration(milliseconds: 10));

        expect((testCubit.state as SyncError).isOnline, false);

        // Connection restored → auto-sync triggers → success
        when(() => repository.sync(any())).thenAnswer((_) async => 4000);
        controller.add(true);
        await Future.delayed(const Duration(milliseconds: 50));

        expect(testCubit.state, isA<SyncIdle>());
        expect((testCubit.state as SyncIdle).lastSyncAt, 4000);

        await controller.close();
        testCubit.close();
      });

      test('does not auto-sync when already in progress', () async {
        final controller = StreamController<bool>();
        when(() => connectivity.isOnline).thenReturn(true);
        when(() => connectivity.onConnectivityChanged)
            .thenAnswer((_) => controller.stream);
        when(() => connectivity.checkConnectivity())
            .thenAnswer((_) async => true);

        // Start a sync that hangs
        when(() => repository.sync(any())).thenAnswer((_) async {
          await Future.delayed(const Duration(seconds: 1));
          return 5000;
        });

        final testCubit = SyncCubit(repository, connectivity);

        testCubit.sync();
        await Future.delayed(const Duration(milliseconds: 20));

        // Now SyncInProgress — connectivity change should not trigger another sync
        expect(testCubit.state, isA<SyncInProgress>());

        controller.add(true);
        await Future.delayed(const Duration(milliseconds: 20));

        // Still in progress (no duplicate sync)
        expect(testCubit.state, isA<SyncInProgress>());

        await controller.close();
        testCubit.close();
      });
    });

    group('lastSyncAt preservation', () {
      blocTest<SyncCubit, SyncState>(
        'preserves lastSyncAt across error state',
        build: () {
          when(() => connectivity.checkConnectivity())
              .thenAnswer((_) async => true);
          // First sync succeeds, then fails
          when(() => repository.sync(any())).thenAnswer((_) async {
            await Future.delayed(const Duration(milliseconds: 10));
            return 1000;
          });
          return cubit;
        },
        act: (cubit) async {
          cubit.sync(); // succeeds, lastSyncAt=1000
          await Future.delayed(const Duration(milliseconds: 20));
          // Reconfigure to fail
          when(() => repository.sync(any()))
              .thenThrow(Exception('Second attempt failed'));
          cubit.sync(); // fails
        },
        expect: () => [
          isA<SyncInProgress>(),
          isA<SyncIdle>().having((s) => s.lastSyncAt, 'first sync', 1000),
          isA<SyncInProgress>().having(
            (s) => s.lastSyncAt,
            'preserved lastSyncAt',
            1000,
          ),
          isA<SyncError>().having(
            (s) => s.lastSyncAt,
            'error preserves lastSyncAt',
            1000,
          ),
        ],
      );
    });
  });
}
