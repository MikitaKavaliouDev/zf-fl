import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:ziro_fit/core/network/response_cache.dart';
import 'package:ziro_fit/features/auth/cubit/auth_cubit.dart';
import 'package:ziro_fit/features/auth/cubit/auth_state.dart';
import 'package:ziro_fit/features/auth/data/models/user.dart';
import 'package:ziro_fit/features/profile/cubit/more_cubit.dart';
import 'package:ziro_fit/features/profile/cubit/more_state.dart';
import 'package:ziro_fit/features/profile/data/models/privacy_settings_dto.dart';
import 'package:ziro_fit/features/profile/data/profile_api_service.dart';

class MockProfileApiService extends Mock implements ProfileApiService {}
class MockResponseCache extends Mock implements ResponseCache {}
class MockAuthCubit extends Mock implements AuthCubit {}

void main() {
  late ProfileApiService apiService;
  late ResponseCache cache;
  late AuthCubit authCubit;
  late MoreCubit cubit;

  final testUser = const User(
    id: 'usr_1',
    email: 'client@ziro.fit',
    name: 'Test Client',
    role: 'client',
    username: 'testclient',
  );
  final testPrivacy = const PrivacySettingsDto(
    shareWorkoutHistory: true,
    shareBodyMeasurements: false,
    shareCheckinNotes: true,
    shareLocation: false,
    allowTrainerExport: false,
    dataRetentionDays: 365,
  );

  setUp(() {
    apiService = MockProfileApiService();
    cache = MockResponseCache();
    authCubit = MockAuthCubit();
    cubit = MoreCubit(apiService, authCubit, cache);

    when(() => authCubit.state).thenReturn(
      const AuthAuthenticated(
        user: User(
          id: 'usr_1',
          email: 'client@ziro.fit',
          name: 'Test Client',
          role: 'client',
          username: 'testclient',
        ),
        isTrainer: false,
      ),
    );
  });

  tearDown(() {
    cubit.close();
  });

  group('MoreCubit cache-first', () {
    blocTest<MoreCubit, MoreState>(
      'emits loaded from cache immediately, then refreshes silently',
      setUp: () {
        final refreshedPrivacy = PrivacySettingsDto(
          shareWorkoutHistory: false,
          shareBodyMeasurements: true,
          shareCheckinNotes: false,
          shareLocation: true,
          allowTrainerExport: true,
          dataRetentionDays: 90,
        );
        when(() => cache.get<PrivacySettingsDto>(
              any(),
              any(),
            )).thenAnswer((_) async => testPrivacy);
        when(() => apiService.getPrivacySettings())
            .thenAnswer((_) async => refreshedPrivacy);
        when(() => cache.set(any(), any())).thenAnswer((_) async {});
      },
      build: () => cubit,
      act: (cubit) => cubit.loadUserData(),
      expect: () => [
        MoreState.loaded(user: testUser, privacy: testPrivacy),
        MoreState.loaded(
          user: testUser,
          privacy: const PrivacySettingsDto(
            shareWorkoutHistory: false,
            shareBodyMeasurements: true,
            shareCheckinNotes: false,
            shareLocation: true,
            allowTrainerExport: true,
            dataRetentionDays: 90,
          ),
        ),
      ],
    );

    blocTest<MoreCubit, MoreState>(
      'shows loading when no cache, then emits loaded from network',
      setUp: () {
        when(() => cache.get<PrivacySettingsDto>(
              any(),
              any(),
            )).thenAnswer((_) async => null);
        when(() => apiService.getPrivacySettings())
            .thenAnswer((_) async => testPrivacy);
        when(() => cache.set(any(), any())).thenAnswer((_) async {});
      },
      build: () => cubit,
      act: (cubit) => cubit.loadUserData(),
      expect: () => [
        const MoreState.loading(),
        MoreState.loaded(user: testUser, privacy: testPrivacy),
      ],
    );

    blocTest<MoreCubit, MoreState>(
      'skips loading flash and emits loaded without privacy when cache exists but network fails silently',
      setUp: () {
        when(() => cache.get<PrivacySettingsDto>(
              any(),
              any(),
            )).thenAnswer((_) async => testPrivacy);
        when(() => apiService.getPrivacySettings())
            .thenThrow(Exception('Network error'));
      },
      build: () => cubit,
      act: (cubit) => cubit.loadUserData(),
      expect: () => [
        // From cache (immediate, no loading flash)
        MoreState.loaded(user: testUser, privacy: testPrivacy),
        // Background refresh fails silently — state unchanged
      ],
    );

    blocTest<MoreCubit, MoreState>(
      'emits loaded with privacy null when network fails and no cache',
      setUp: () {
        when(() => cache.get<PrivacySettingsDto>(
              any(),
              any(),
            )).thenAnswer((_) async => null);
        when(() => apiService.getPrivacySettings())
            .thenThrow(Exception('Network error'));
      },
      build: () => cubit,
      act: (cubit) => cubit.loadUserData(),
      expect: () => [
        const MoreState.loading(),
        MoreState.loaded(user: testUser, privacy: null),
      ],
      verify: (_) {
        // Should still emit loaded even without privacy data
      },
    );

    blocTest<MoreCubit, MoreState>(
      'forceRefresh skips cache and shows loading',
      setUp: () {
        when(() => cache.get<PrivacySettingsDto>(
              any(),
              any(),
            )).thenAnswer((_) async => testPrivacy);
        when(() => apiService.getPrivacySettings())
            .thenAnswer((_) async => testPrivacy);
        when(() => cache.set(any(), any())).thenAnswer((_) async {});
      },
      build: () => cubit,
      act: (cubit) => cubit.loadUserData(forceRefresh: true),
      expect: () => [
        const MoreState.loading(),
        MoreState.loaded(user: testUser, privacy: testPrivacy),
      ],
    );

    blocTest<MoreCubit, MoreState>(
      'trainer role skips privacy API entirely',
      setUp: () {
        when(() => authCubit.state).thenReturn(
          const AuthAuthenticated(
            user: User(
              id: 'tr_1',
              email: 'trainer@ziro.fit',
              name: 'Trainer',
              role: 'trainer',
              username: 'trainer1',
            ),
            isTrainer: true,
          ),
        );
      },
      build: () => cubit,
      act: (cubit) => cubit.loadUserData(),
      expect: () => [
        MoreState.loaded(user: testUser.copyWith(
          id: 'tr_1',
          email: 'trainer@ziro.fit',
          name: 'Trainer',
          role: 'trainer',
          username: 'trainer1',
        )),
      ],
      verify: (_) {
        verifyNever(() => apiService.getPrivacySettings());
        verifyNever(() => cache.get(any(), any()));
      },
    );

    blocTest<MoreCubit, MoreState>(
      'refresh forces reload from network',
      setUp: () {
        when(() => cache.get<PrivacySettingsDto>(
              any(),
              any(),
            )).thenAnswer((_) async => testPrivacy);
        when(() => apiService.getPrivacySettings())
            .thenAnswer((_) async => testPrivacy);
        when(() => cache.set(any(), any())).thenAnswer((_) async {});
      },
      build: () => cubit,
      act: (cubit) => cubit.refresh(),
      expect: () => [
        const MoreState.loading(),
        MoreState.loaded(user: testUser, privacy: testPrivacy),
      ],
      verify: (_) {
        verify(() => apiService.getPrivacySettings()).called(1);
      },
    );

    blocTest<MoreCubit, MoreState>(
      'loadPrivacySettings delegates to API service',
      setUp: () {
        when(() => apiService.getPrivacySettings())
            .thenAnswer((_) async => testPrivacy);
      },
      build: () => cubit,
      act: (cubit) => cubit.loadPrivacySettings(),
      expect: () => [],
      verify: (_) {
        verify(() => apiService.getPrivacySettings()).called(1);
      },
    );

    blocTest<MoreCubit, MoreState>(
      'updatePrivacySettings delegates to API service',
      setUp: () {
        when(() => apiService.updatePrivacySettings(any()))
            .thenAnswer((_) async => testPrivacy);
      },
      build: () => cubit,
      act: (cubit) => cubit.updatePrivacySettings({'shareWorkoutHistory': false}),
      expect: () => [],
      verify: (_) {
        verify(() => apiService.updatePrivacySettings(
              {'shareWorkoutHistory': false},
        )).called(1);
      },
    );
  });
}
