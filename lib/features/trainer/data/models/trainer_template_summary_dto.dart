import 'package:freezed_annotation/freezed_annotation.dart';

part 'trainer_template_summary_dto.freezed.dart';
part 'trainer_template_summary_dto.g.dart';

/// Extract exercise count from Prisma's {_count: {exercises: N}} format.
/// Must be a top-level function (not a class static method) so freezed
/// generated code can reference it across library boundaries.
int countToExerciseCount(Map<String, dynamic>? json) {
  if (json == null) return 0;
  return (json['exercises'] as num?)?.toInt() ?? 0;
}

@freezed
abstract class TrainerTemplateSummaryDto with _$TrainerTemplateSummaryDto {
  const factory TrainerTemplateSummaryDto({
    required String id,
    required String name,
    String? description,
    required int order,
    String? programId,
    @JsonKey(name: '_count', fromJson: countToExerciseCount)
    @Default(0)
    int exerciseCount,
  }) = _TrainerTemplateSummaryDto;

  factory TrainerTemplateSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$TrainerTemplateSummaryDtoFromJson(json);
}
