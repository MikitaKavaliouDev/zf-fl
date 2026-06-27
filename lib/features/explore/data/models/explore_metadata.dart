import 'package:freezed_annotation/freezed_annotation.dart';

import 'explore_category.dart';
import 'explore_city.dart';

part 'explore_metadata.freezed.dart';
part 'explore_metadata.g.dart';

@freezed
abstract class ExploreMetadata with _$ExploreMetadata {
  const factory ExploreMetadata({
    @Default(<ExploreCity>[]) List<ExploreCity> cities,
    @Default(<ExploreCategory>[]) List<ExploreCategory> categories,
  }) = _ExploreMetadata;

  factory ExploreMetadata.fromJson(Map<String, dynamic> json) =>
      _$ExploreMetadataFromJson(json);
}
