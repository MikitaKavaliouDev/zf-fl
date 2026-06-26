import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../data/auth_repository.dart';
import '../data/models/user.dart';
import 'auth_state.dart';

part 'auth_cubit.freezed.dart';

@freezed
sealed class AuthEvent with _$AuthEvent {
  /// Check stored tokens and call /api/auth/me on app start.
  const factory AuthEvent.checkAuthStatus() = CheckAuthStatus;

  /// Login with email + password.
  const factory AuthEvent.login({
    required String email,
    required String password,
  }) = LoginSubmitted;

  /// Register new account.
  const factory AuthEvent.register({
    required String email,
    required String password,
    String? name,
    String? trainerId,
  }) = RegisterSubmitted;

  /// Complete the full onboarding flow (role selection + details).
  const factory AuthEvent.completeOnboarding({
    required String role,
    required String name,
    String? bio,
    String? location,
  }) = CompleteOnboarding;

  /// Log out — clear session.
  const factory AuthEvent.logout() = LogoutRequested;

  /// Dismiss error and return to previous state.
  const factory AuthEvent.clearError() = ClearError;
}

@injectable
class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _repository;

  AuthCubit(this._repository) : super(const AuthState.initial());

  // ── Event handlers ──

  Future<void> checkAuthStatus() async {
    emit(const AuthState.loading());
    try {
      final user = await _repository.getCurrentUser();
      if (user == null) {
        emit(const AuthState.unauthenticated());
        return;
      }
      _routeByUserState(user);
    } catch (e, s) {
      developer.log('checkAuthStatus failed', name: 'auth', error: e, stackTrace: s);
      emit(const AuthState.unauthenticated());
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(const AuthState.loading());
    try {
      final response = await _repository.login(
        email: email,
        password: password,
      );
      _routeByUserState(response.user);
    } on DioException catch (e) {
      final message = _extractErrorMessage(e);
      emit(AuthState.error(message: message));
    } catch (e) {
      emit(AuthState.error(message: _fallbackError(e)));
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
      emit(AuthState.registerSuccess(response: response));
    } on DioException catch (e) {
      final message = _extractErrorMessage(e);
      emit(AuthState.error(message: message));
    } catch (e) {
      emit(AuthState.error(message: _fallbackError(e)));
    }
  }

  Future<void> completeOnboarding({
    required String role,
    required String name,
    String? bio,
    String? location,
  }) async {
    emit(const AuthState.loading());
    try {
      await _repository.completeOnboarding();
      // Re-fetch user to reflect updated state
      await checkAuthStatus();
    } on DioException catch (e) {
      final message = _extractErrorMessage(e);
      emit(AuthState.error(message: message));
    } catch (e) {
      emit(AuthState.error(message: _fallbackError(e)));
    }
  }

  Future<void> logout() async {
    await _repository.logout();
    emit(const AuthState.unauthenticated());
  }

  /// Refresh user data from server without showing loading state.
  Future<void> refreshUser() async {
    try {
      final user = await _repository.getCurrentUser();
      if (user != null) {
        _routeByUserState(user);
      }
    } catch (e, s) {
      developer.log('refreshUser failed', name: 'auth', error: e, stackTrace: s);
    }
  }

  void clearError() {
    // Go back to unauthenticated — the caller was either login or register.
    emit(const AuthState.unauthenticated());
  }

  // ── Helpers ──

  /// Determine the correct state based on user role and onboarding status.
  void _routeByUserState(User user) {
    if (user.role == 'pending') {
      emit(AuthState.pendingRole(user: user));
    } else if (!user.hasCompletedOnboarding) {
      emit(AuthState.needsOnboarding(user: user));
    } else {
      emit(AuthState.authenticated(user: user));
    }
  }

  String _extractErrorMessage(DioException e) {
    // Network-level errors (no response received)
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
        // Try to extract a meaningful error from the response body
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

