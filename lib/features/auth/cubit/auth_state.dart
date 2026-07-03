import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/register_response.dart';
import '../data/models/user.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  /// App just launched — no auth check performed yet.
  const factory AuthState.initial() = AuthInitial;

  /// Auth check or login/register in progress.
  const factory AuthState.loading() = AuthLoading;

  /// No valid session.
  const factory AuthState.unauthenticated() = AuthUnauthenticated;

  /// Valid session — every state after loading transitions here through
  /// needsOnboarding when onboarding is incomplete.
  /// [isTrainer] is derived from [User.role] — `"trainer"` routes to the
  /// trainer shell, everything else to the client shell.
  const factory AuthState.authenticated({
    required User user,
    @Default(false) bool isOffline,
    @Default(false) bool isTrainer,
  }) = AuthAuthenticated;

  /// User registered but role is "pending" — email not yet verified.
  const factory AuthState.pendingRole({
    required User user,
  }) = AuthPendingRole;

  /// User has verified email but must complete onboarding first.
  const factory AuthState.needsOnboarding({
    required User user,
  }) = AuthNeedsOnboarding;

  /// Registration just completed — show email verification screen.
  const factory AuthState.registerSuccess({
    required RegisterResponse response,
  }) = AuthRegisterSuccess;

  /// Any auth operation failed.
  const factory AuthState.error({
    required String message,
  }) = AuthError;
}
