// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_testimonial_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainerTestimonialDto _$TrainerTestimonialDtoFromJson(
  Map<String, dynamic> json,
) => _TrainerTestimonialDto(
  id: json['id'] as String,
  clientName: json['clientName'] as String,
  testimonialText: json['testimonialText'] as String,
  rating: (json['rating'] as num?)?.toDouble(),
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$TrainerTestimonialDtoToJson(
  _TrainerTestimonialDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'clientName': instance.clientName,
  'testimonialText': instance.testimonialText,
  'rating': instance.rating,
  'createdAt': instance.createdAt,
};
