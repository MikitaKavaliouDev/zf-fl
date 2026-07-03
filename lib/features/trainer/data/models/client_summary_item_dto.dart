import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_summary_item_dto.freezed.dart';
part 'client_summary_item_dto.g.dart';

@freezed
abstract class ClientSummaryItemDto with _$ClientSummaryItemDto {
  const factory ClientSummaryItemDto({
    required String date,
    required String clientId,
    required String clientFirstName,
    required String clientLastName,
    String? clientAvatarUrl,
  }) = _ClientSummaryItemDto;

  factory ClientSummaryItemDto.fromJson(Map<String, dynamic> json) =>
      _$ClientSummaryItemDtoFromJson(json);
}
