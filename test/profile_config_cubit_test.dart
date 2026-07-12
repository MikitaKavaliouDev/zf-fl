import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:ziro_fit/core/network/response_cache.dart';
import 'package:ziro_fit/features/auth/cubit/auth_cubit.dart';
import 'package:ziro_fit/features/auth/cubit/auth_state.dart';
import 'package:ziro_fit/features/auth/data/models/user.dart';
import 'package:ziro_fit/features/profile/cubit/profile_config_cubit.dart';
import 'package:ziro_fit/features/profile/cubit/profile_config_state.dart';
import 'package:ziro_fit/features/profile/data/models/profile_core_info_dto.dart';
import 'package:ziro_fit/features/profile/data/models/profile_text_content_dto.dart';
import 'package:ziro_fit/features/profile/data/profile_api_service.dart';

class MockProfileApiService extends Mock implements ProfileApiService {}
class MockResponseCache extends Mock implements ResponseCache {}
class MockAuthCubit extends Mock implements AuthCubit {}

void main() {
  late ProfileApiService apiService;
  late ResponseCache cache;
  late AuthCubit authCubit;
  late ProfileConfigCubit cubit;

  final testCoreInfo = const ProfileCoreInfoDto(
    name: 'Test User',
    username: 'testuser',
  );
  final testTextContent = const ProfileTextContentDto(aboutMe: 'About me');

  setUp(() {
    apiService = MockProfileApiService();
    cache = MockResponseCache();
    authCubit = MockAuthCubit();
    cubit = ProfileConfigCubit(apiService, authCubit, cache);

    when(() => authCubit.state).thenReturn(
      const AuthAuthenticated(
        user: User(
          id: 'usr_1',
          email: 'test@ziro.fit',
          name: 'Test User',
          role: 'client',
          username: 'testuser',
        ),
        isTrainer: false,
      ),
    );
  });

  tearDown(() {
    cubit.close();
  });

  group('ProfileConfigCubit cache-first', () {
    blocTest<ProfileConfigCubit, ProfileConfigState>(
      'loads from cache and silently refreshes when cache exists',
      setUp: () {
        final refreshedCoreInfo = ProfileCoreInfoDto(
          name: 'Refreshed User',
          username: 'refreshed',
        );
        when(() => cache.get<ProfileCoreInfoDto>(
              any(),
              any(),
            )).thenAnswer((_) async => testCoreInfo);
        when(() => cache.get<ProfileTextContentDto>(
              any(),
              any(),
            )).thenAnswer((_) async => testTextContent);
        when(() => apiService.getCoreInfo())
            .thenAnswer((_) async => refreshedCoreInfo);
        when(() => apiService.getTextContent())
            .thenAnswer((_) async => testTextContent);
        when(() => cache.set(any(), any())).thenAnswer((_) async {});
      },
      build: () => cubit,
      act: (cubit) => cubit.loadProfile(),
      expect: () => [
        // 1. Loading
        const ProfileConfigState.loading(),
        // 2. Emitted from cache (no loading flash blink)
        ProfileConfigState.loaded(
          coreInfo: testCoreInfo,
          textContent: testTextContent,
          avatarUrl: null,
        ),
        // 3. Silent background refresh with fresh (different) data
        ProfileConfigState.loaded(
          coreInfo: ProfileCoreInfoDto(
            name: 'Refreshed User',
            username: 'refreshed',
          ),
          textContent: testTextContent,
          avatarUrl: null,
        ),
      ],
    );

    blocTest<ProfileConfigCubit, ProfileConfigState>(
      'awaits network when cache is empty',
      setUp: () {
        when(() => cache.get<ProfileCoreInfoDto>(
              any(),
              any(),
            )).thenAnswer((_) async => null);
        when(() => cache.get<ProfileTextContentDto>(
              any(),
              any(),
            )).thenAnswer((_) async => null);
        when(() => apiService.getCoreInfo())
            .thenAnswer((_) async => testCoreInfo);
        when(() => apiService.getTextContent())
            .thenAnswer((_) async => testTextContent);
        when(() => cache.set(any(), any())).thenAnswer((_) async {});
      },
      build: () => cubit,
      act: (cubit) => cubit.loadProfile(),
      expect: () => [
        const ProfileConfigState.loading(),
        ProfileConfigState.loaded(
          coreInfo: testCoreInfo,
          textContent: testTextContent,
          avatarUrl: null,
        ),
      ],
    );

    blocTest<ProfileConfigCubit, ProfileConfigState>(
      'emits error when both cache and network fail',
      setUp: () {
        when(() => cache.get<ProfileCoreInfoDto>(
              any(),
              any(),
            )).thenAnswer((_) async => null);
        when(() => cache.get<ProfileTextContentDto>(
              any(),
              any(),
            )).thenAnswer((_) async => null);
        when(() => apiService.getCoreInfo())
            .thenThrow(Exception('Network error'));
      },
      build: () => cubit,
      act: (cubit) => cubit.loadProfile(),
      expect: () => [
        const ProfileConfigState.loading(),
        const ProfileConfigState.error(
          'Failed to load profile. Please try again.',
        ),
      ],
    );

    blocTest<ProfileConfigCubit, ProfileConfigState>(
      'saveCoreInfo updates cache on success',
      seed: () => ProfileConfigState.loaded(
        coreInfo: testCoreInfo,
        textContent: testTextContent,
      ),
      setUp: () {
        when(() => apiService.updateCoreInfo(any()))
            .thenAnswer((_) async => testCoreInfo);
        when(() => cache.set(any(), any())).thenAnswer((_) async {});
      },
      build: () => cubit,
      act: (cubit) => cubit.saveCoreInfo(
        name: 'Test User',
        username: 'testuser',
        weightUnit: 'KG',
      ),
      expect: () => [
        ProfileConfigState.loaded(
          coreInfo: testCoreInfo,
          textContent: testTextContent,
          isSaving: true,
        ),
        ProfileConfigState.loaded(
          coreInfo: testCoreInfo,
          textContent: testTextContent,
          isSaving: false,
          hasUnsavedChanges: false,
        ),
      ],
      verify: (_) {
        verify(() => cache.set(any(), testCoreInfo.toJson())).called(1);
      },
    );

    blocTest<ProfileConfigCubit, ProfileConfigState>(
      'saveTextContent updates cache on success',
      seed: () => ProfileConfigState.loaded(
        coreInfo: testCoreInfo,
        textContent: const ProfileTextContentDto(aboutMe: 'Old about'),
      ),
      setUp: () {
        when(() => apiService.updateTextContent(any(), any()))
            .thenAnswer((_) async {});
        when(() => cache.set(any(), any())).thenAnswer((_) async {});
      },
      build: () => cubit,
      act: (cubit) => cubit.saveTextContent('New about me'),
      expect: () => [
        ProfileConfigState.loaded(
          coreInfo: testCoreInfo,
          textContent: const ProfileTextContentDto(aboutMe: 'Old about'),
          isSaving: true,
        ),
        ProfileConfigState.loaded(
          coreInfo: testCoreInfo,
          textContent: ProfileTextContentDto(aboutMe: 'New about me'),
          isSaving: false,
          hasUnsavedChanges: false,
        ),
      ],
      verify: (_) {
        verify(() => cache.set(
              any(),
              ProfileTextContentDto(aboutMe: 'New about me').toJson(),
            )).called(1);
      },
    );
  });
}
