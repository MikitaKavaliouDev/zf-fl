// ignore_for_file: use_null_aware_elements

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'models/auth_response.dart';
import 'models/login_request.dart';
import 'models/refresh_response.dart';
import 'models/register_request.dart';
import 'models/register_response.dart';
import 'models/user.dart';

@injectable
class AuthApiService {
  final Dio _dio;

  AuthApiService(this._dio);

  Future<AuthResponse> login(LoginRequest request) async {
    final response = await _dio.post('/api/auth/login', data: request.toJson());
    final data = response.data['data'] as Map<String, dynamic>;
    return AuthResponse.fromJson(data);
  }

  Future<RegisterResponse> register(RegisterRequest request) async {
    final response = await _dio.post('/api/auth/register', data: request.toJson());
    final data = response.data['data'] as Map<String, dynamic>;
    return RegisterResponse.fromJson(data);
  }

  Future<RefreshResponse> refresh(String refreshToken) async {
    final response = await _dio.post(
      '/api/auth/refresh',
      data: {'refreshToken': refreshToken},
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return RefreshResponse.fromJson(data);
  }

  Future<User> getMe({String? accessToken}) async {
    final options = accessToken != null
        ? Options(headers: {'Authorization': 'Bearer $accessToken'})
        : null;
    final response = await _dio.get('/api/auth/me', options: options);
    final data = response.data['data'] as Map<String, dynamic>;
    return User.fromJson(data);
  }

  Future<void> signOut() async {
    await _dio.post('/api/auth/signout');
  }

  Future<void> completeOnboarding() async {
    await _dio.post('/api/auth/complete-onboarding');
  }

  /// Full onboarding with role selection, profile data, and optional avatar.
  /// Calls the /api/onboarding/complete endpoint with multipart/form-data.
  /// Returns updated user data with the new role (client/trainer).
  Future<User> completeOnboardingFull({
    required String role,
    required String name,
    String? location,
    String? bio,
    String? avatarPath,
  }) async {
    final map = <String, dynamic>{
      'role': role,
      'name': name,
    };
    if (location != null && location.isNotEmpty) map['location'] = location;
    if (bio != null && bio.isNotEmpty) map['bio'] = bio;

    // Build FormData — include file if provided
    final formData = FormData.fromMap({
      ...map,
      if (avatarPath != null && avatarPath.isNotEmpty)
        'avatar': await MultipartFile.fromFile(avatarPath),
    });

    final response = await _dio.post('/api/onboarding/complete', data: formData);
    final data = response.data['data'] as Map<String, dynamic>;
    final userData = data['user'] as Map<String, dynamic>;
    return User.fromJson(userData);
  }

  Future<void> forgotPassword(String email, {String? redirectTo}) async {
    await _dio.post('/api/auth/forgot-password', data: {
      'email': email,
      if (redirectTo != null) 'redirectTo': redirectTo,
    });
  }

  Future<void> updatePassword(String password) async {
    await _dio.post('/api/auth/update-password', data: {'password': password});
  }

  Future<void> resendVerification(String email, {String? redirect}) async {
    await _dio.post('/api/auth/resend-verification-email', data: {
      'email': email,
      if (redirect != null) 'redirect': redirect,
    });
  }

  Future<void> verifyEmailCode(String email, String code) async {
    await _dio.post('/api/auth/verify-email-code', data: {
      'email': email,
      'code': code,
    });
  }
}
