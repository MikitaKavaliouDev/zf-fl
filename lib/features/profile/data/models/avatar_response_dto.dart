import 'package:freezed_annotation/freezed_annotation.dart';

part 'avatar_response_dto.freezed.dart';
part 'avatar_response_dto.g.dart';

@freezed
abstract class AvatarResponseDto with _$AvatarResponseDto {
  const factory AvatarResponseDto({
    required String avatarUrl,
    required String storagePath,
  }) = _AvatarResponseDto;

  factory AvatarResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AvatarResponseDtoFromJson(json);
}
