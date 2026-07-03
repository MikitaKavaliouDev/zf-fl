import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_creation_client_dto.freezed.dart';
part 'session_creation_client_dto.g.dart';

@freezed
abstract class SessionCreationClientDto with _$SessionCreationClientDto {
  const factory SessionCreationClientDto({
    required String id,
    required String name,
    required int availableCredits,
  }) = _SessionCreationClientDto;

  factory SessionCreationClientDto.fromJson(Map<String, dynamic> json) =>
      _$SessionCreationClientDtoFromJson(json);
}
