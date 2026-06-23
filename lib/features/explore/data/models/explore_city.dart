import 'package:freezed_annotation/freezed_annotation.dart';

part 'explore_city.freezed.dart';
part 'explore_city.g.dart';

@freezed
abstract class ExploreCity with _$ExploreCity {
  const factory ExploreCity({
    required String id,
    required String name,
    String? imageUrl,
    double? latitude,
    double? longitude,
    @Default(false) bool isCurrentLocation,
  }) = _ExploreCity;

  factory ExploreCity.fromJson(Map<String, dynamic> json) =>
      _$ExploreCityFromJson(json);
}
