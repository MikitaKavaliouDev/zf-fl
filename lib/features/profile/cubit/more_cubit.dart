import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../auth/cubit/auth_cubit.dart';
import '../../auth/cubit/auth_state.dart';
import '../data/models/privacy_settings_dto.dart';
import '../data/profile_api_service.dart';
import 'more_state.dart';

@injectable
class MoreCubit extends Cubit<MoreState> {
  final ProfileApiService _apiService;
  final AuthCubit _authCubit;

  MoreCubit(this._apiService, this._authCubit) : super(const MoreState.initial());

  /// Load user data and privacy settings.
  Future<void> loadUserData() async {
    emit(const MoreState.loading());
    try {
      // Get user from AuthCubit's current state
      final authState = _authCubit.state;
      final user = authState is AuthAuthenticated ? authState.user : null;

      PrivacySettingsDto? privacy;
      try {
        privacy = await _apiService.getPrivacySettings();
      } catch (e) {
        developer.log('Failed to load privacy settings: $e', name: 'more');
        // Non-critical — continue without privacy data
      }

      emit(MoreState.loaded(user: user, privacy: privacy));
    } catch (e) {
      developer.log('MoreCubit.loadUserData failed: $e', name: 'more');
      emit(const MoreState.error('Failed to load profile. Please check your connection.'));
    }
  }

  /// Sign out via AuthCubit.
  Future<void> signOut() async {
    await _authCubit.logout();
  }

  /// Pull-to-refresh — reload user data.
  Future<void> refresh() async {
    await loadUserData();
  }
}
