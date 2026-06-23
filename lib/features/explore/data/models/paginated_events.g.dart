// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_events.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginatedEvents _$PaginatedEventsFromJson(Map<String, dynamic> json) =>
    _PaginatedEvents(
      events:
          (json['events'] as List<dynamic>?)
              ?.map((e) => ExploreEventDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ExploreEventDto>[],
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      hasMore: json['hasMore'] as bool,
      total: (json['total'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$PaginatedEventsToJson(_PaginatedEvents instance) =>
    <String, dynamic>{
      'events': instance.events,
      'page': instance.page,
      'limit': instance.limit,
      'hasMore': instance.hasMore,
      'total': instance.total,
    };
