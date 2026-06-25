// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_in_submission_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CheckInSubmissionDto _$CheckInSubmissionDtoFromJson(
  Map<String, dynamic> json,
) => _CheckInSubmissionDto(
  weight: (json['weight'] as num?)?.toDouble(),
  waistCm: (json['waistCm'] as num?)?.toDouble(),
  sleepHours: (json['sleepHours'] as num?)?.toDouble(),
  energyLevel: (json['energyLevel'] as num?)?.toInt(),
  stressLevel: (json['stressLevel'] as num?)?.toInt(),
  hungerLevel: (json['hungerLevel'] as num?)?.toInt(),
  digestionLevel: (json['digestionLevel'] as num?)?.toInt(),
  nutritionCompliance: json['nutritionCompliance'] as String?,
  clientNotes: json['clientNotes'] as String? ?? '',
  photos:
      (json['photos'] as List<dynamic>?)
          ?.map((e) => CheckInPhotoDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <CheckInPhotoDto>[],
);

Map<String, dynamic> _$CheckInSubmissionDtoToJson(
  _CheckInSubmissionDto instance,
) => <String, dynamic>{
  'weight': instance.weight,
  'waistCm': instance.waistCm,
  'sleepHours': instance.sleepHours,
  'energyLevel': instance.energyLevel,
  'stressLevel': instance.stressLevel,
  'hungerLevel': instance.hungerLevel,
  'digestionLevel': instance.digestionLevel,
  'nutritionCompliance': instance.nutritionCompliance,
  'clientNotes': instance.clientNotes,
  'photos': instance.photos,
};

_CheckInPhotoDto _$CheckInPhotoDtoFromJson(Map<String, dynamic> json) =>
    _CheckInPhotoDto(
      imagePath: json['imagePath'] as String,
      caption: json['caption'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$CheckInPhotoDtoToJson(_CheckInPhotoDto instance) =>
    <String, dynamic>{
      'imagePath': instance.imagePath,
      'caption': instance.caption,
      'date': instance.date,
    };
