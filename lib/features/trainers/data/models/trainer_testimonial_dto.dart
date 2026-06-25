import 'package:freezed_annotation/freezed_annotation.dart';

part 'trainer_testimonial_dto.freezed.dart';
part 'trainer_testimonial_dto.g.dart';

@freezed
abstract class TrainerTestimonialDto with _$TrainerTestimonialDto {
  const factory TrainerTestimonialDto({
    required String id,
    required String clientName,
    required String testimonialText,
    double? rating,
    String? createdAt,
  }) = _TrainerTestimonialDto;

  factory TrainerTestimonialDto.fromJson(Map<String, dynamic> json) =>
      _$TrainerTestimonialDtoFromJson(json);
}
