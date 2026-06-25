import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_target_dto.freezed.dart';
part 'daily_target_dto.g.dart';

@freezed
abstract class DailyTargetDto with _$DailyTargetDto {
  const factory DailyTargetDto({
    required String id,
    required String clientId,
    required String title,
    String? description,
    required String type,
    required double targetValue,
    required String unit,
    required DateTime date,
    double? currentValue,
    @Default(false) bool isCompleted,
    @Default(0) int order,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _DailyTargetDto;

  const DailyTargetDto._();

  factory DailyTargetDto.fromJson(Map<String, dynamic> json) =>
      _$DailyTargetDtoFromJson(json);
}
