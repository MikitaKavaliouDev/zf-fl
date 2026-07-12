import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../core/network/response_cache.dart';
import '../../auth/cubit/auth_cubit.dart';
import '../../auth/cubit/auth_state.dart';
import '../data/models/profile_core_info_dto.dart';
import '../data/models/profile_text_content_dto.dart';
import '../data/profile_api_service.dart';
import 'profile_config_state.dart';

@injectable
class ProfileConfigCubit extends Cubit<ProfileConfigState> {
  final ProfileApiService _apiService;
  final AuthCubit _authCubit;
  final ResponseCache _cache;

  ProfileConfigCubit(this._apiService, this._authCubit, this._cache)
      : super(const ProfileConfigState.initial());

  static const _coreInfoCacheKey = 'profile:coreInfo';
  static const _textContentCacheKey = 'profile:textContent';

  /// Load core info and text content.
  ///
  /// Cache-first — if cached data exists, emits [ProfileConfigLoaded]
  /// immediately without a loading flash, then silently refreshes.
  Future<void> loadProfile() async {
    emit(const ProfileConfigState.loading());

    // 1. Check cache first
    final cachedCoreInfo = await _cache.get<ProfileCoreInfoDto>(
      _coreInfoCacheKey,
      ProfileCoreInfoDto.fromJson,
    );
    final cachedTextContent = await _cache.get<ProfileTextContentDto>(
      _textContentCacheKey,
      ProfileTextContentDto.fromJson,
    );

    // Get current avatar URL from AuthCubit
    final authState = _authCubit.state;
    final avatarUrl = authState is AuthAuthenticated
        ? authState.user.profilePhotoPath
        : null;

    if (cachedCoreInfo != null) {
      // Show cached immediately
      emit(ProfileConfigState.loaded(
        coreInfo: cachedCoreInfo,
        textContent: cachedTextContent,
        avatarUrl: avatarUrl,
      ));

      // 2. Silent background refresh
      try {
        final coreInfo = await _apiService.getCoreInfo();
        await _cache.set(_coreInfoCacheKey, coreInfo.toJson());

        ProfileTextContentDto? textContent;
        try {
          textContent = await _apiService.getTextContent();
          await _cache.set(_textContentCacheKey, textContent.toJson());
        } catch (e) {
          developer.log('Failed to refresh text content: $e', name: 'profile');
        }

        if (!isClosed) {
          final freshAuthState = _authCubit.state;
          final freshAvatarUrl = freshAuthState is AuthAuthenticated
              ? freshAuthState.user.profilePhotoPath
              : null;
          emit(ProfileConfigState.loaded(
            coreInfo: coreInfo,
            textContent: textContent ?? cachedTextContent,
            avatarUrl: freshAvatarUrl ?? avatarUrl,
          ));
        }
      } catch (e) {
        developer.log('Background refresh failed: $e', name: 'profile');
        // Cached data is already showing, no error toast needed
      }
      return;
    }

    // 3. No cache — await network
    try {
      final coreInfo = await _apiService.getCoreInfo();
      await _cache.set(_coreInfoCacheKey, coreInfo.toJson());

      ProfileTextContentDto? textContent;
      try {
        textContent = await _apiService.getTextContent();
        await _cache.set(_textContentCacheKey, textContent.toJson());
      } catch (e) {
        developer.log('Failed to load text content: $e', name: 'profile');
      }

      emit(ProfileConfigState.loaded(
        coreInfo: coreInfo,
        textContent: textContent,
        avatarUrl: avatarUrl,
      ));
    } catch (e) {
      developer.log('ProfileConfigCubit.loadProfile failed: $e',
          name: 'profile');
      emit(const ProfileConfigState.error(
          'Failed to load profile. Please try again.'));
    }
  }

  /// Save core info fields (name, username, phone, weightUnit).
  Future<void> saveCoreInfo({
    required String name,
    required String username,
    String? phone,
    required String weightUnit,
  }) async {
    final current = state;
    if (current is! ProfileConfigLoaded) return;

    emit(current.copyWith(isSaving: true));
    try {
      final updated = await _apiService.updateCoreInfo({
        'name': name.trim(),
        'username': username,
        if (phone != null) 'phone': phone.trim().isEmpty ? null : phone.trim(),
        'weightUnit': weightUnit,
      });

      // Update cache with fresh data
      await _cache.set(_coreInfoCacheKey, updated.toJson());

      emit(current.copyWith(
        coreInfo: updated,
        isSaving: false,
        hasUnsavedChanges: false,
      ));
    } catch (e) {
      developer.log('ProfileConfigCubit.saveCoreInfo failed: $e',
          name: 'profile');
      emit(current.copyWith(isSaving: false));
      rethrow;
    }
  }

  /// Save text content (aboutMe).
  Future<void> saveTextContent(String aboutMe) async {
    final current = state;
    if (current is! ProfileConfigLoaded) return;

    emit(current.copyWith(isSaving: true));
    try {
      await _apiService.updateTextContent('aboutMe', aboutMe);

      final updatedTextContent = current.textContent?.copyWith(aboutMe: aboutMe) ??
          ProfileTextContentDto(aboutMe: aboutMe);
      // Update cache with fresh data
      await _cache.set(_textContentCacheKey, updatedTextContent.toJson());

      emit(current.copyWith(
        textContent: updatedTextContent,
        isSaving: false,
        hasUnsavedChanges: false,
      ));
    } catch (e) {
      developer.log('ProfileConfigCubit.saveTextContent failed: $e',
          name: 'profile');
      emit(current.copyWith(isSaving: false));
      rethrow;
    }
  }

  /// Upload a new avatar photo.
  Future<String?> uploadAvatar(String filePath) async {
    final current = state;
    if (current is! ProfileConfigLoaded) return null;

    emit(current.copyWith(isSaving: true));
    try {
      final response = await _apiService.uploadAvatar(filePath);
      // The response has avatarUrl (full URL) and storagePath
      final newAvatarUrl = response.avatarUrl;

      emit(current.copyWith(
        avatarUrl: newAvatarUrl,
        isSaving: false,
      ));

      // Refresh auth state to update header avatar
      try {
        await _authCubit.refreshUser();
      } catch (e) {
        developer.log('ProfileConfigCubit.refreshUser after avatar upload failed: $e', name: 'profile');
      }

      return newAvatarUrl;
    } catch (e) {
      developer.log('ProfileConfigCubit.uploadAvatar failed: $e',
          name: 'profile');
      emit(current.copyWith(isSaving: false));
      rethrow;
    }
  }

  /// Pick image from gallery.
  Future<String?> pickImage() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 85,
    );
    return image?.path;
  }

  /// Mark that there are unsaved changes (called by form on change).
  void markChanged() {
    final current = state;
    if (current is ProfileConfigLoaded && !current.hasUnsavedChanges) {
      emit(current.copyWith(hasUnsavedChanges: true));
    }
  }

  /// Indicate save success.
  void emitSaveSuccess(String message) {
    emit(ProfileConfigState.saveSuccess(message));
  }

  /// Reload everything.
  Future<void> refresh() async {
    await loadProfile();
  }
}
