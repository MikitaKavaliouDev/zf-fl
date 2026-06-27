import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/explore_api_service.dart';
import '../data/models/event_detail_dto.dart';

/// Thin wrapper around [ExploreApiService] for the Event Detail screen.
///
/// UI state is managed by tanquery's [QueryBuilder] and local setState;
/// this cubit only provides pass-through methods so screens never reference
/// [ExploreApiService] directly.
@injectable
class EventDetailCubit extends Cubit<EventDetailState> {
  final ExploreApiService _api;

  EventDetailCubit(this._api) : super(EventDetailState.initial);

  /// GET /api/events/{id} — single event detail.
  Future<EventDetailDto> getEventDetail(String id) =>
      _api.getEventDetail(id);

  /// POST /api/events/{id}/join — join a free event.
  Future<Map<String, dynamic>> joinFreeEvent(String id) =>
      _api.joinFreeEvent(id);

  /// POST /api/checkout/session — Stripe checkout for paid events.
  Future<String> createCheckoutSession({
    required String type,
    required String id,
    bool isMobile = true,
  }) =>
      _api.createCheckoutSession(type: type, id: id, isMobile: isMobile);
}

/// Minimal state — tanquery manages loading/error for queryFn results.
class EventDetailState {
  const EventDetailState._();
  static const initial = EventDetailState._();
}
