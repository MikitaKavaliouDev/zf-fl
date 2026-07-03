import 'package:freezed_annotation/freezed_annotation.dart';

part 'recent_pr_item_dto.freezed.dart';
part 'recent_pr_item_dto.g.dart';

@freezed
abstract class RecentPrItemDto with _$RecentPrItemDto {
  const factory RecentPrItemDto({
    required String exercise,
    required double value,
    required String type,
    required String date,
  }) = _RecentPrItemDto;

  factory RecentPrItemDto.fromJson(Map<String, dynamic> json) =>
      _$RecentPrItemDtoFromJson(json);
}
