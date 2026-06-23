// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_session_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StartSessionResponse _$StartSessionResponseFromJson(
  Map<String, dynamic> json,
) => _StartSessionResponse(
  session: WorkoutSessionDto.fromJson(json['session'] as Map<String, dynamic>),
  exerciseLogs:
      (json['exerciseLogs'] as List<dynamic>?)
          ?.map((e) => ExerciseLogDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ExerciseLogDto>[],
);

Map<String, dynamic> _$StartSessionResponseToJson(
  _StartSessionResponse instance,
) => <String, dynamic>{
  'session': instance.session,
  'exerciseLogs': instance.exerciseLogs,
};

_LiveSessionResponse _$LiveSessionResponseFromJson(Map<String, dynamic> json) =>
    _LiveSessionResponse(
      session: json['session'] == null
          ? null
          : WorkoutSessionDto.fromJson(json['session'] as Map<String, dynamic>),
      exerciseLogs:
          (json['exerciseLogs'] as List<dynamic>?)
              ?.map((e) => ExerciseLogDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$LiveSessionResponseToJson(
  _LiveSessionResponse instance,
) => <String, dynamic>{
  'session': instance.session,
  'exerciseLogs': instance.exerciseLogs,
};

_LogExerciseResponse _$LogExerciseResponseFromJson(Map<String, dynamic> json) =>
    _LogExerciseResponse(
      log: ExerciseLogDto.fromJson(json['log'] as Map<String, dynamic>),
      newRecords: json['newRecords'] as List<dynamic>?,
    );

Map<String, dynamic> _$LogExerciseResponseToJson(
  _LogExerciseResponse instance,
) => <String, dynamic>{'log': instance.log, 'newRecords': instance.newRecords};

_SessionHistoryResponse _$SessionHistoryResponseFromJson(
  Map<String, dynamic> json,
) => _SessionHistoryResponse(
  sessions: (json['sessions'] as List<dynamic>)
      .map((e) => WorkoutSessionDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  nextCursor: json['nextCursor'] as String?,
  hasMore: json['hasMore'] as bool? ?? false,
);

Map<String, dynamic> _$SessionHistoryResponseToJson(
  _SessionHistoryResponse instance,
) => <String, dynamic>{
  'sessions': instance.sessions,
  'nextCursor': instance.nextCursor,
  'hasMore': instance.hasMore,
};
