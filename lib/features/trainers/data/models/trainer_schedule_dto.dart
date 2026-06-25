import 'package:freezed_annotation/freezed_annotation.dart';

part 'trainer_schedule_dto.freezed.dart';
part 'trainer_schedule_dto.g.dart';

const _dayNameMap = <String, String>{
  'mon': 'Monday',
  'tue': 'Tuesday',
  'wed': 'Wednesday',
  'thu': 'Thursday',
  'fri': 'Friday',
  'sat': 'Saturday',
  'sun': 'Sunday',
};

/// Splits a time range like "08:00-12:00" into individual hour slots.
List<String> _expandTimeRange(String range) {
  final parts = range.split('-');
  if (parts.length != 2) return [range];
  try {
    final startParts = parts[0].trim().split(':');
    final endParts = parts[1].trim().split(':');
    if (startParts.length != 2 || endParts.length != 2) return [range];
    final startHour = int.tryParse(startParts[0]) ?? 0;
    final endHour = int.tryParse(endParts[0]) ?? 0;
    if (endHour <= startHour) return [range];
    return List.generate(
      endHour - startHour,
      (i) => '${(startHour + i).toString().padLeft(2, '0')}:00',
    );
  } catch (_) {
    return [range];
  }
}

/// Normalizes the schedule availability map: abbreviate → full day names,
/// and splits time ranges into individual slots.
Map<String, List<String>> _normalizeAvailability(Map<String, dynamic>? raw) {
  if (raw == null) return {};
  final result = <String, List<String>>{};
  for (final entry in raw.entries) {
    final dayKey = entry.key.toLowerCase();
    final fullName = _dayNameMap[dayKey] ?? dayKey;
    final rawSlots = entry.value;
    if (rawSlots is List) {
      result[fullName] =
          rawSlots.map((s) => s.toString()).expand(_expandTimeRange).toList();
    }
  }
  return result;
}

/// Weekly availability schedule for a trainer.
/// availability: Map of day name (e.g. "Monday") to list of time slot strings (e.g. "09:00").
/// bookings: List of confirmed booking time ranges.
@freezed
abstract class TrainerScheduleDto with _$TrainerScheduleDto {
  const factory TrainerScheduleDto({
    @Default(<String, List<String>>{}) Map<String, List<String>> availability,
    @Default(<BookingDto>[]) List<BookingDto> bookings,
  }) = _TrainerScheduleDto;

  factory TrainerScheduleDto.fromJson(Map<String, dynamic> json) {
    return _TrainerScheduleDto(
      availability: _normalizeAvailability(
        json['availability'] as Map<String, dynamic>?,
      ),
      bookings: (json['bookings'] as List<dynamic>?)
              ?.map(
                  (e) => BookingDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}

@freezed
abstract class BookingDto with _$BookingDto {
  const factory BookingDto({
    required String startTime,
    required String endTime,
  }) = _BookingDto;

  factory BookingDto.fromJson(Map<String, dynamic> json) =>
      _$BookingDtoFromJson(json);
}
