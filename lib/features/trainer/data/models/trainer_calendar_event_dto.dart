import 'package:freezed_annotation/freezed_annotation.dart';

part 'trainer_calendar_event_dto.freezed.dart';
part 'trainer_calendar_event_dto.g.dart';

@freezed
abstract class TrainerCalendarEventDto with _$TrainerCalendarEventDto {
  const factory TrainerCalendarEventDto({
    required String id,
    required String title,
    required String start,
    required String end,
    required String type,
    String? clientId,
    required String clientName,
    String? clientAvatarUrl,
    String? notes,
    String? templateId,
    String? templateName,
  }) = _TrainerCalendarEventDto;

  factory TrainerCalendarEventDto.fromJson(Map<String, dynamic> json) =>
      _$TrainerCalendarEventDtoFromJson(json);
}
