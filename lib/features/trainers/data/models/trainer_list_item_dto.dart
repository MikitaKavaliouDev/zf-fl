import 'package:freezed_annotation/freezed_annotation.dart';

part 'trainer_list_item_dto.freezed.dart';
part 'trainer_list_item_dto.g.dart';

List<String> _parseStringList(dynamic value) {
  if (value == null) return [];
  if (value is List) return value.cast<String>();
  if (value is String) {
    if (value.isEmpty) return [];
    return value.split(',').map((s) => s.trim()).where((s) => s.isNotEmpty).toList();
  }
  return [];
}

@freezed
abstract class TrainerProfileSummary with _$TrainerProfileSummary {
  const factory TrainerProfileSummary({
    String? profilePhotoPath,
    @JsonKey(fromJson: _parseStringList) @Default(<String>[]) List<String> certifications,
    @Default(<dynamic>[]) List<dynamic> locations,
    @Default(<dynamic>[]) List<dynamic> services,
    double? averageRating,
    String? businessCurrency,
    String? name,
    String? bio,
  }) = _TrainerProfileSummary;

  factory TrainerProfileSummary.fromJson(Map<String, dynamic> json) =>
      _$TrainerProfileSummaryFromJson(json);
}

@freezed
abstract class TrainerStats with _$TrainerStats {
  const factory TrainerStats({
    @Default(0) int reviewCount,
    @Default(0) int clientsCoached,
  }) = _TrainerStats;

  factory TrainerStats.fromJson(Map<String, dynamic> json) =>
      _$TrainerStatsFromJson(json);
}

@freezed
abstract class TrainerListItemDto with _$TrainerListItemDto {
  const factory TrainerListItemDto({
    required String id,
    String? username, // nullable — backend Trainer type has `string | null`
    String? name,
    TrainerProfileSummary? profile,
    TrainerStats? stats,
    double? distance,
    @Default(false) bool isLinked,
  }) = _TrainerListItemDto;

  factory TrainerListItemDto.fromJson(Map<String, dynamic> json) =>
      _$TrainerListItemDtoFromJson(json);
}

@freezed
abstract class TrainerListResponse with _$TrainerListResponse {
  const factory TrainerListResponse({
    @Default(<TrainerListItemDto>[]) List<TrainerListItemDto> trainers,
    @Default(0) int totalTrainers,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
  }) = _TrainerListResponse;

  factory TrainerListResponse.fromJson(Map<String, dynamic> json) =>
      _$TrainerListResponseFromJson(json);
}
