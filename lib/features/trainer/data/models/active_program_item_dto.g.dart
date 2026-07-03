// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_program_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ActiveProgramItemDto _$ActiveProgramItemDtoFromJson(
  Map<String, dynamic> json,
) => _ActiveProgramItemDto(
  programId: json['programId'] as String,
  programName: json['programName'] as String,
  clientId: json['clientId'] as String,
  clientName: json['clientName'] as String,
  clientAvatarUrl: json['clientAvatarUrl'] as String?,
  assignedDate: json['assignedDate'] as String,
  currentWeek: (json['currentWeek'] as num).toInt(),
  totalWeeks: (json['totalWeeks'] as num).toInt(),
  sessionsCompleted: (json['sessionsCompleted'] as num).toInt(),
  totalSessions: (json['totalSessions'] as num).toInt(),
  completionRate: (json['completionRate'] as num).toDouble(),
  nextSessionDate: json['nextSessionDate'] as String?,
  status: json['status'] as String,
);

Map<String, dynamic> _$ActiveProgramItemDtoToJson(
  _ActiveProgramItemDto instance,
) => <String, dynamic>{
  'programId': instance.programId,
  'programName': instance.programName,
  'clientId': instance.clientId,
  'clientName': instance.clientName,
  'clientAvatarUrl': instance.clientAvatarUrl,
  'assignedDate': instance.assignedDate,
  'currentWeek': instance.currentWeek,
  'totalWeeks': instance.totalWeeks,
  'sessionsCompleted': instance.sessionsCompleted,
  'totalSessions': instance.totalSessions,
  'completionRate': instance.completionRate,
  'nextSessionDate': instance.nextSessionDate,
  'status': instance.status,
};
