import 'package:freezed_annotation/freezed_annotation.dart';

import 'explore_event_dto.dart';

part 'featured_content.freezed.dart';
part 'featured_content.g.dart';

@freezed
abstract class FeaturedContent with _$FeaturedContent {
  const factory FeaturedContent({
    @Default(<FeaturedTrainerDto>[]) List<FeaturedTrainerDto> featuredTrainers,
    @Default(<ExploreEventDto>[]) List<ExploreEventDto> featuredEvents,
  }) = _FeaturedContent;

  factory FeaturedContent.fromJson(Map<String, dynamic> json) =>
      _$FeaturedContentFromJson(json);
}

@freezed
abstract class FeaturedTrainerDto with _$FeaturedTrainerDto {
  const factory FeaturedTrainerDto({
    required String id,
    @Default('Trainer') String name,
    String? username,
    String? avatarUrl,
    @Default(5.0) double rating,
    @Default(false) bool isVerified,
    @Default(<String>[]) List<String> specialties,
    String? tier,
    @Default('algorithm') String source,
  }) = _FeaturedTrainerDto;

  factory FeaturedTrainerDto.fromJson(Map<String, dynamic> json) =>
      _$FeaturedTrainerDtoFromJson(json);
}
