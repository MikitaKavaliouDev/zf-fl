// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_in_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CheckInDetailDto _$CheckInDetailDtoFromJson(Map<String, dynamic> json) =>
    _CheckInDetailDto(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      status: json['status'] as String,
      weight: (json['weight'] as num?)?.toDouble(),
      waistCm: (json['waistCm'] as num?)?.toDouble(),
      sleepHours: (json['sleepHours'] as num?)?.toDouble(),
      energyLevel: (json['energyLevel'] as num?)?.toInt(),
      stressLevel: (json['stressLevel'] as num?)?.toInt(),
      hungerLevel: (json['hungerLevel'] as num?)?.toInt(),
      digestionLevel: (json['digestionLevel'] as num?)?.toInt(),
      nutritionCompliance: json['nutritionCompliance'] as String?,
      clientNotes: json['clientNotes'] as String?,
      photos:
          (json['photos'] as List<dynamic>?)
              ?.map(
                (e) =>
                    CheckInPhotoDetailDto.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <CheckInPhotoDetailDto>[],
      reviewedBy: json['reviewedBy'] == null
          ? null
          : CheckInReviewerDto.fromJson(
              json['reviewedBy'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$CheckInDetailDtoToJson(_CheckInDetailDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'status': instance.status,
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
      'reviewedBy': instance.reviewedBy,
    };

_CheckInPhotoDetailDto _$CheckInPhotoDetailDtoFromJson(
  Map<String, dynamic> json,
) => _CheckInPhotoDetailDto(
  id: json['id'] as String,
  imageUrl: json['imageUrl'] as String,
  caption: json['caption'] as String?,
  photoDate: json['photoDate'] == null
      ? null
      : DateTime.parse(json['photoDate'] as String),
);

Map<String, dynamic> _$CheckInPhotoDetailDtoToJson(
  _CheckInPhotoDetailDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'imageUrl': instance.imageUrl,
  'caption': instance.caption,
  'photoDate': instance.photoDate?.toIso8601String(),
};

_CheckInReviewerDto _$CheckInReviewerDtoFromJson(Map<String, dynamic> json) =>
    _CheckInReviewerDto(
      name: json['name'] as String,
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$CheckInReviewerDtoToJson(_CheckInReviewerDto instance) =>
    <String, dynamic>{'name': instance.name, 'photoUrl': instance.photoUrl};
