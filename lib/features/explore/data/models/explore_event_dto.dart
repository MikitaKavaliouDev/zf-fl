import 'package:freezed_annotation/freezed_annotation.dart';

part 'explore_event_dto.freezed.dart';
part 'explore_event_dto.g.dart';

@freezed
abstract class ExploreEventDto with _$ExploreEventDto {
  const factory ExploreEventDto({
    required String id,
    required String title,
    String? description,
    required DateTime startTime,
    DateTime? endTime,
    @JsonKey(name: 'locationName') required String locationName,
    String? address,
    String? imageUrl,
    @JsonKey(name: 'category') String? categoryId,
    @JsonKey(name: 'city') String? cityId,
    @Default(0) double price,
    @Default('PLN') String currency,
    @Default(0) int capacity,
    @Default(0) int enrolledCount,
    @Default(false) bool isNearCapacity,
    @Default(false) bool isBooked,
    @JsonKey(name: 'trainerName') String? hostName,
    @JsonKey(name: 'trainerId') String? hostId,
    double? distance,
    String? organizerType,
    @Default(<String>[]) List<String> highlights,
    TrainerInfo? trainer,
  }) = _ExploreEventDto;

  const ExploreEventDto._(); // Required for custom getters

  factory ExploreEventDto.fromJson(Map<String, dynamic> json) =>
      _$ExploreEventDtoFromJson(json);

  /// Whether the event is full.
  bool get isFull => capacity > 0 && enrolledCount >= capacity;

  /// Spots remaining.
  int get spotsLeft => capacity > 0 ? capacity - enrolledCount : 0;

  /// isFree is NOT sent by the backend — derive from price.
  bool get isFree => price == 0;
}

@freezed
abstract class TrainerInfo with _$TrainerInfo {
  const factory TrainerInfo({
    required String name,
    String? username,
    String? profilePhotoPath,
    String? aboutMe,
  }) = _TrainerInfo;

  factory TrainerInfo.fromJson(Map<String, dynamic> json) =>
      _$TrainerInfoFromJson(json);
}
