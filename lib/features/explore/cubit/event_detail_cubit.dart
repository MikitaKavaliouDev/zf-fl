import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/explore_repository.dart';
import 'event_detail_state.dart';

class EventDetailCubit extends Cubit<EventDetailState> {
  final ExploreRepository _repository;

  EventDetailCubit(this._repository) : super(const EventDetailInitial());

  Future<void> load(String id) async {
    emit(const EventDetailLoading());
    try {
      final event = await _repository.getEventDetail(id);
      emit(EventDetailLoaded(event: event));
    } catch (e) {
      emit(const EventDetailError('Failed to load event details.'));
    }
  }

  /// Enroll in a free event or redirect to Stripe for paid events.
  Future<void> enroll(String eventId) async {
    final current = state;
    if (current is! EventDetailLoaded) return;

    emit(current.copyWith(enrolling: true));
    try {
      if (current.event.isFree) {
        await _repository.joinFreeEvent(eventId);
        emit(current.copyWith(enrolled: true, enrolling: false));
      } else {
        // Paid event — get Stripe checkout URL
        final url = await _repository.createCheckoutSession(
          type: 'EVENT_TICKET',
          id: eventId,
        );
        emit(current.copyWith(enrolling: false, checkoutUrl: url));
      }
    } catch (e) {
      emit(current.copyWith(enrolling: false));
      rethrow;
    }
  }
}
