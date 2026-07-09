import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tanquery_flutter/tanquery_flutter.dart';

import '../../../core/database/app_database.dart';
import '../../../core/models/app_mode.dart';
import '../../../core/network/response_cache.dart';
import '../../../core/security/active_mode_holder.dart';
import '../data/auth_repository.dart';
import '../data/models/user.dart';
import 'auth_state.dart';

part 'auth_cubit.freezed.dart';

@freezed
sealed class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkAuthStatus() = CheckAuthStatus;

  const factory AuthEvent.login({
    required String email,
    required String password,
  }) = LoginSubmitted;

  const factory AuthEvent.register({
    required String email,
    required String password,
    String? name,
    String? trainerId,
  }) = RegisterSubmitted;

  const factory AuthEvent.completeOnboarding({
    required String role,
    required String name,
    String? location,
    String? bio,
    String? avatarPath,
  }) = CompleteOnboarding;

  const factory AuthEvent.logout() = LogoutRequested;

  const factory AuthEvent.clearError() = ClearError;
}

@singleton
class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _repository;
  final ActiveModeHolder _modeHolder;
  final ResponseCache _cache;
  final AppDatabase _database;
  final QueryClient _queryClient;

  /// Cached user for the non-active mode (preserved during switches).
  User? _trainerUser;
  User? _clientUser;

  AuthCubit(
    this._repository,
    this._modeHolder,
    this._cache,
    this._database,
    this._queryClient,
  ) : super(const AuthState.initial());

  // ── Event handlers ──

  /// On startup, try to restore BOTH client and trainer sessions.
  /// The active mode is determined by "lastUsedAppMode" preference.
  Future<void> checkAuthStatus() async {
    emit(const AuthState.loading());
    try {
      // Try client session first
      final clientUser =
          await _repository.getCurrentUser(mode: AppMode.client);
      if (clientUser != null) _clientUser = clientUser;

      // Then try trainer session (independent of client)
      final trainerUser =
          await _repository.getCurrentUser(mode: AppMode.trainer);
      if (trainerUser != null) _trainerUser = trainerUser;

      // Determine which mode should be active
      final preferredMode = await _resolvePreferredMode();
      final activeUser = preferredMode == AppMode.trainer
          ? (_trainerUser ?? _clientUser)
          : (_clientUser ?? _trainerUser);

      if (activeUser == null) {
        emit(const AuthState.unauthenticated());
        return;
      }

      _modeHolder.currentMode =
          activeUser.role == 'trainer' ? AppMode.trainer : AppMode.client;

      // If the user's role doesn't match the storage that has the tokens,
      // migrate them so the AuthInterceptor can find them. This happens
      // when login() stores tokens under the default currentMode (client)
      // before _routeByUserState corrects the role.
      if (_modeHolder.currentMode == AppMode.trainer &&
          _trainerUser == null &&
          _clientUser != null) {
        await _repository.migrateTokens(
          source: AppMode.client,
          target: AppMode.trainer,
        );
        // Also copy user cache so _trainerUser is available next cold start
        _trainerUser = _clientUser;
      }

      if (activeUser.role == 'pending') {
        emit(AuthState.pendingRole(user: activeUser));
      } else if (!activeUser.hasCompletedOnboarding) {
        emit(AuthState.needsOnboarding(user: activeUser));
      } else {
        emit(AuthState.authenticated(
          user: activeUser,
          isTrainer: activeUser.role == 'trainer',
        ));
      }
    } catch (e, s) {
      developer.log('checkAuthStatus failed', name: 'auth', error: e, stackTrace: s);
      // Fallback: try cached users
      final cachedClient = await _repository.getCachedUser(mode: AppMode.client);
      final cachedTrainer =
          await _repository.getCachedUser(mode: AppMode.trainer);
      final preferredMode = await _resolvePreferredMode();
      final activeUser = preferredMode == AppMode.trainer
          ? (cachedTrainer ?? cachedClient)
          : (cachedClient ?? cachedTrainer);

      if (activeUser != null) {
        if (preferredMode == AppMode.trainer) _trainerUser = activeUser;
        else _clientUser = activeUser;
      _modeHolder.currentMode =
          activeUser.role == 'trainer' ? AppMode.trainer : AppMode.client;
        emit(AuthState.authenticated(
          user: activeUser,
          isTrainer: activeUser.role == 'trainer',
          isOffline: true,
        ));
        return;
      }
      emit(const AuthState.unauthenticated());
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(const AuthState.loading());
    try {
      // Determine which mode this login is for by trying to detect the role.
      // We don't know the role until the response comes back, so we store
      // under the current mode and correct it in _routeByUserState.
      final mode = _modeHolder.currentMode;
      final response = await _repository.login(
        email: email,
        password: password,
        mode: mode,
      );
      await _routeByUserState(response.user, role: response.role);
    } on DioException catch (e) {
      final message = _extractErrorMessage(e);
      emit(AuthState.error(message: message));
    } catch (e) {
      emit(AuthState.error(message: _fallbackError(e)));
    }
  }

  /// Login for a specific mode (used during mode switch flow).
  /// Stores tokens under [targetMode] and switches to it on success.
  Future<bool> loginAs({
    required String email,
    required String password,
    required AppMode targetMode,
  }) async {
    try {
      final response = await _repository.login(
        email: email,
        password: password,
        mode: targetMode,
      );
      final user = response.user;

      // Cache the user for this mode
      if (targetMode.isTrainer) {
        _trainerUser = user;
      } else {
        _clientUser = user;
      }

      _modeHolder.currentMode = targetMode;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('lastUsedAppMode', targetMode.isTrainer);

      emit(AuthState.authenticated(
        user: user,
        isTrainer: targetMode.isTrainer,
      ));
      return true;
    } on DioException catch (e) {
      developer.log('loginAs($targetMode) failed', name: 'auth', error: e);
      return false;
    } catch (e) {
      developer.log('loginAs($targetMode) failed', name: 'auth', error: e);
      return false;
    }
  }

  Future<void> register({
    required String email,
    required String password,
    String? name,
    String? trainerId,
  }) async {
    emit(const AuthState.loading());
    try {
      final response = await _repository.register(
        email: email,
        password: password,
        name: name,
        trainerId: trainerId,
      );
      emit(AuthState.registerSuccess(email: email, response: response));
    } on DioException catch (e) {
      final message = _extractErrorMessage(e);
      emit(AuthState.error(message: message));
    } catch (e) {
      emit(AuthState.error(message: _fallbackError(e)));
    }
  }

  Future<void> resendVerification(String email) async {
    try {
      await _repository.resendVerification(email);
    } catch (e) {
      // Silently fail — the endpoint will resend if the user exists
      developer.log('resendVerification failed', name: 'auth', error: e);
    }
  }

  Future<void> verifyEmailCode(String email, String code) async {
    try {
      await _repository.verifyEmailCode(email, code);
    } catch (e) {
      developer.log('verifyEmailCode failed', name: 'auth', error: e);
      rethrow;
    }
  }

  Future<void> completeOnboarding({
    required String role,
    required String name,
    String? location,
    String? bio,
    String? avatarPath,
  }) async {
    emit(const AuthState.loading());
    try {
      final updatedUser = await _repository.completeOnboardingFull(
        role: role,
        name: name,
        location: location,
        bio: bio,
        avatarPath: avatarPath,
      );

      // Cache the user and cache tokens if needed
      final roleIsTrainer = updatedUser.role == 'trainer';
      final mode = roleIsTrainer ? AppMode.trainer : AppMode.client;

      if (mode.isTrainer) {
        _trainerUser = updatedUser;
      } else {
        _clientUser = updatedUser;
      }

      _modeHolder.currentMode = mode;

      // If the server changed the role, migrate tokens so the
      // AuthInterceptor can find them under the correct mode.
      if (mode == AppMode.trainer) {
        await _repository.migrateTokens(
          source: AppMode.client,
          target: AppMode.trainer,
        );
      }

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('lastUsedAppMode', roleIsTrainer);

      emit(AuthState.authenticated(
        user: updatedUser,
        isTrainer: roleIsTrainer,
      ));
    } on DioException catch (e) {
      final message = _extractErrorMessage(e);
      emit(AuthState.error(message: message));
    } catch (e) {
      emit(AuthState.error(message: _fallbackError(e)));
    }
  }

  /// Log out ONLY the currently active mode.
  /// The other mode's session is preserved.
  Future<void> logout() async {
    final mode = _modeHolder.currentMode;
    if (mode == AppMode.trainer) _trainerUser = null;
    else _clientUser = null;
    await _repository.logout();

    // Clear all local data — cache keys like "workout:history:all:20:0"
    // lack user isolation, so they must be wiped on any user transition
    // (mode switch or full logout).
    await _clearLocalData();

    // If the other mode still has a cached session, switch to it
    final otherUser = mode == AppMode.trainer ? _clientUser : _trainerUser;
    if (otherUser != null) {
      final otherMode = mode == AppMode.trainer ? AppMode.client : AppMode.trainer;
      _modeHolder.currentMode = otherMode;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('lastUsedAppMode', otherMode.isTrainer);
      emit(AuthState.authenticated(
        user: otherUser,
        isTrainer: otherMode.isTrainer,
      ));
    } else {
      emit(const AuthState.unauthenticated());
    }
  }

  /// Wipe all locally cached/persisted data so the next login starts fresh.
  Future<void> _clearLocalData() async {
    try {
      await _cache.clearAll();
      await _database.clearAll();
      _queryClient.clear();
      developer.log('Local data cleared (cache, db, tanquery)', name: 'auth');
    } catch (e, s) {
      developer.log('_clearLocalData error', name: 'auth', error: e, stackTrace: s);
    }
  }

  /// Switch between client and trainer modes instantly.
  /// Requires both modes to have cached sessions.
  Future<void> switchMode() async {
    final current = state;
    if (current is! AuthAuthenticated) return;

    final newMode = _modeHolder.currentMode == AppMode.trainer
        ? AppMode.client
        : AppMode.trainer;

    final user = newMode == AppMode.trainer ? _trainerUser : _clientUser;
    if (user == null) {
      developer.log('switchMode: no cached user for $newMode', name: 'auth');
      return;
    }

    _modeHolder.currentMode = newMode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('lastUsedAppMode', newMode.isTrainer);

    emit(AuthState.authenticated(
      user: user,
      isTrainer: newMode.isTrainer,
    ));
  }

  /// Re-fetch the current user from the server and re-emit auth state.
  Future<void> refreshUser() async {
    try {
      final user = await _repository.getCurrentUser(mode: _modeHolder.currentMode);
      if (user != null) {
        if (_modeHolder.currentMode.isTrainer) _trainerUser = user;
        else _clientUser = user;
        emit(AuthState.authenticated(
          user: user,
          isTrainer: _modeHolder.currentMode.isTrainer,
        ));
      }
    } catch (e, s) {
      developer.log('refreshUser failed', name: 'auth', error: e, stackTrace: s);
    }
  }

  void clearError() {
    emit(const AuthState.unauthenticated());
  }

  // ── Helpers ──

  /// Read the persisted "lastUsedAppMode" and resolve which mode to use,
  /// falling back to whichever has an available session.
  Future<AppMode> _resolvePreferredMode() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getBool('lastUsedAppMode');
    if (saved == true && _trainerUser != null) return AppMode.trainer;
    if (saved == false && _clientUser != null) return AppMode.client;
    // lastUsedAppMode is trainer but tokens were stored under client prefix
    if (saved == true && _clientUser?.role == 'trainer') return AppMode.trainer;
    // Fallback: prefer trainer if both exist
    if (_trainerUser?.role == 'trainer') return AppMode.trainer;
    if (_clientUser?.role == 'trainer') return AppMode.trainer;
    return AppMode.client;
  }

  /// Routes the user based on their [role] (which may differ from
  /// [user.role] during login — the login response has the app-level
  /// role at the top level, while [user.role] reflects the Supabase
  /// auth role "authenticated").
  Future<void> _routeByUserState(User user, {String? role}) async {
    final effectiveRole = role ?? user.role;
    if (effectiveRole == 'pending') {
      emit(AuthState.pendingRole(user: user));
    } else if (!user.hasCompletedOnboarding) {
      emit(AuthState.needsOnboarding(user: user));
    } else {
      final roleIsTrainer = effectiveRole == 'trainer';
      final mode = roleIsTrainer ? AppMode.trainer : AppMode.client;

      // Cache user for this mode
      if (mode.isTrainer) _trainerUser = user;
      else _clientUser = user;

      _modeHolder.currentMode = mode;

      // If the user's role differs from the storage mode the tokens were
      // saved under (login() uses currentMode which defaults to client),
      // migrate them so the AuthInterceptor can find them.
      if (mode == AppMode.trainer) {
        await _repository.migrateTokens(
          source: AppMode.client,
          target: AppMode.trainer,
        );
      }

      // Check persisted mode override
      final prefs = await SharedPreferences.getInstance();
      final savedIsTrainer = prefs.getBool('lastUsedAppMode');
      final effectiveIsTrainer =
          savedIsTrainer ?? roleIsTrainer;

      // Persist the active mode so cold start recovery works correctly
      await prefs.setBool('lastUsedAppMode', effectiveIsTrainer);

      emit(AuthState.authenticated(
        user: user,
        isTrainer: effectiveIsTrainer,
      ));
    }
  }

  String _extractErrorMessage(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timed out. Please check your network.';
      case DioExceptionType.sendTimeout:
        return 'Request timed out. Please try again.';
      case DioExceptionType.receiveTimeout:
        return 'Server is not responding. Please try again.';
      case DioExceptionType.connectionError:
        return 'Network error. Please check your connection.';
      case DioExceptionType.badResponse:
        final data = e.response?.data;
        if (data is Map<String, dynamic>) {
          final error = data['error'];
          if (error is Map<String, dynamic>) {
            return (error['message'] as String?) ?? 'An unexpected error occurred.';
          }
        }
        return 'An unexpected error occurred. Please try again.';
      case DioExceptionType.cancel:
        return 'Request was cancelled.';
      case DioExceptionType.badCertificate:
        return 'Connection is not secure. Please try again later.';
      case DioExceptionType.unknown:
        return 'Network error. Please check your connection.';
    }
  }

  String _fallbackError(Object e) {
    developer.log('Auth error', name: 'auth', error: e);
    return 'An unexpected error occurred. Please try again.';
  }
}
