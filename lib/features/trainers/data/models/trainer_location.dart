import 'package:freezed_annotation/freezed_annotation.dart';

part 'trainer_location.freezed.dart';
part 'trainer_location.g.dart';

@freezed
abstract class TrainerLocation with _$TrainerLocation {
  const factory TrainerLocation({
    required String id,
    String? address,
    double? latitude,
    double? longitude,
  }) = _TrainerLocation;

  factory TrainerLocation.fromJson(Map<String, dynamic> json) =>
      _$TrainerLocationFromJson(json);
}
