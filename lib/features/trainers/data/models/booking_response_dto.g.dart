// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookingResponseDto _$BookingResponseDtoFromJson(Map<String, dynamic> json) =>
    _BookingResponseDto(
      id: json['id'] as String,
      trainerId: json['trainerId'] as String,
      clientId: json['clientId'] as String?,
      clientName: json['clientName'] as String?,
      clientEmail: json['clientEmail'] as String?,
      clientNotes: json['clientNotes'] as String?,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      status: json['status'] as String,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$BookingResponseDtoToJson(_BookingResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'trainerId': instance.trainerId,
      'clientId': instance.clientId,
      'clientName': instance.clientName,
      'clientEmail': instance.clientEmail,
      'clientNotes': instance.clientNotes,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
