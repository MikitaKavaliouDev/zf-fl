import 'package:freezed_annotation/freezed_annotation.dart';

import 'explore_event_dto.dart';

part 'paginated_events.freezed.dart';
part 'paginated_events.g.dart';

@freezed
abstract class PaginatedEvents with _$PaginatedEvents {
  const factory PaginatedEvents({
    @Default(<ExploreEventDto>[]) List<ExploreEventDto> events,
    required int page,
    required int limit,
    required bool hasMore,
    @Default(0) int total,
  }) = _PaginatedEvents;

  factory PaginatedEvents.fromJson(Map<String, dynamic> json) =>
      _$PaginatedEventsFromJson(json);
}
