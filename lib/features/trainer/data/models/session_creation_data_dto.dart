import 'package:freezed_annotation/freezed_annotation.dart';

import 'session_creation_client_dto.dart';
import 'session_creation_template_dto.dart';

part 'session_creation_data_dto.freezed.dart';
part 'session_creation_data_dto.g.dart';

@freezed
abstract class SessionCreationDataDto with _$SessionCreationDataDto {
  const factory SessionCreationDataDto({
    required List<SessionCreationClientDto> clients,
    required List<SessionCreationTemplateDto> templates,
  }) = _SessionCreationDataDto;

  factory SessionCreationDataDto.fromJson(Map<String, dynamic> json) =>
      _$SessionCreationDataDtoFromJson(json);
}
