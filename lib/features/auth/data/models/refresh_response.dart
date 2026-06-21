import 'package:freezed_annotation/freezed_annotation.dart';

import 'user.dart';

part 'refresh_response.freezed.dart';
part 'refresh_response.g.dart';

@freezed
abstract class RefreshResponse with _$RefreshResponse {
  const factory RefreshResponse({
    required String accessToken,
    required String refreshToken,
    required int expiresAt,
    required User user,
  }) = _RefreshResponse;

  factory RefreshResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshResponseFromJson(json);
}
