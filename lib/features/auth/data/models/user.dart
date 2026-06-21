import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    required String email,
    String? name,
    required String role,
    String? username,
    String? tier,
    /// Whether onboarding is complete.
    /// Login API user object omits this, /api/auth/me includes it.
    /// Defaults to true so login flow routes to authenticated directly.
    @Default(true) bool hasCompletedOnboarding,
    String? clientId,
    String? subscriptionStatus,
    String? profilePhotoPath,
    bool? isFreeAccessModeEnabled,
    @Default(<String, dynamic>{}) Map<String, dynamic> metadata,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
