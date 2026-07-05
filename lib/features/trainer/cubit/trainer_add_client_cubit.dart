import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/trainer_clients_api_service.dart';
import 'trainer_add_client_state.dart';

@injectable
class TrainerAddClientCubit extends Cubit<TrainerAddClientState> {
  final TrainerClientsApiService _api;

  TrainerAddClientCubit(this._api) : super(const TrainerAddClientState.initial());

  /// Try to create a new client record for [email].
  /// On `user_exists` → emits [TrainerAddClientState.emailAlreadyExists].
  /// On `client_limit_reached` → emits [TrainerAddClientState.limitReached].
  /// On success → emits [TrainerAddClientState.loaded].
  Future<void> addClient(String email) async {
    emit(const TrainerAddClientState.loading());
    try {
      await _api.createClient(email: email);
      developer.log('Client created: $email', name: 'trainer');
      emit(const TrainerAddClientState.loaded(
        successMessage: 'Client added successfully.',
      ));
    } on DioException catch (e) {
      _handleDioError(e, email);
    } catch (e) {
      developer.log('addClient error: $e', name: 'trainer');
      emit(TrainerAddClientState.error(e.toString()));
    }
  }

  /// Invite a client by email. Sends an invitation email.
  /// On `user_exists` → emits [TrainerAddClientState.emailAlreadyExists].
  /// On `already_linked` → emits [TrainerAddClientState.linkAlreadyPending].
  /// On `limit_reached` → emits [TrainerAddClientState.limitReached].
  /// On success → emits [TrainerAddClientState.loaded].
  Future<void> inviteByEmail(String email) async {
    emit(const TrainerAddClientState.loading());
    try {
      await _api.inviteClient(email: email);
      developer.log('Invitation sent to: $email', name: 'trainer');
      emit(const TrainerAddClientState.loaded(
        successMessage: 'Invitation sent!',
      ));
    } on DioException catch (e) {
      _handleDioError(e, email);
    } catch (e) {
      developer.log('inviteByEmail error: $e', name: 'trainer');
      emit(TrainerAddClientState.error(e.toString()));
    }
  }

  /// Request a link to an existing user by email.
  /// Sends a connection request notification to the client.
  Future<void> requestLink(String email) async {
    emit(const TrainerAddClientState.loading());
    try {
      await _api.requestLink(email);
      developer.log('Connection request sent to: $email', name: 'trainer');
      emit(const TrainerAddClientState.loaded(
        successMessage: 'Connection request sent!',
      ));
    } on DioException catch (e) {
      developer.log('requestLink error: $e', name: 'trainer');
      if (e.response?.statusCode == 404) {
        emit(const TrainerAddClientState.error('No user found with this email.'));
      } else {
        emit(TrainerAddClientState.error(
          _extractErrorMessage(e) ?? 'Failed to send connection request.',
        ));
      }
    } catch (e) {
      developer.log('requestLink error: $e', name: 'trainer');
      emit(TrainerAddClientState.error(e.toString()));
    }
  }

  /// Reset the cubit to initial state.
  void reset() => emit(const TrainerAddClientState.initial());

  void _handleDioError(DioException e, String email) {
    final statusCode = e.response?.statusCode;
    final data = e.response?.data;
    String? errorCode;

    if (data is Map<String, dynamic>) {
      final error = data['error'];
      if (error is Map<String, dynamic>) {
        errorCode = error['code'] as String?;
      }
    }

    developer.log(
      'Client operation failed: status=$statusCode code=$errorCode email=$email',
      name: 'trainer',
    );

    switch (errorCode) {
      case 'user_exists':
        emit(const TrainerAddClientState.emailAlreadyExists());
      case 'already_linked':
        emit(const TrainerAddClientState.linkAlreadyPending());
      case 'client_limit_reached':
      case 'limit_reached':
        emit(const TrainerAddClientState.limitReached());
      default:
        emit(TrainerAddClientState.error(
          _extractErrorMessage(e) ?? 'An unexpected error occurred.',
        ));
    }
  }

  String? _extractErrorMessage(DioException e) {
    final data = e.response?.data;
    if (data is Map<String, dynamic>) {
      final error = data['error'];
      if (error is Map<String, dynamic>) {
        return error['message'] as String?;
      }
    }
    return null;
  }
}
