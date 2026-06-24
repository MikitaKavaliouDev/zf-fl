// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_library_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProgramLibraryResponse _$ProgramLibraryResponseFromJson(
  Map<String, dynamic> json,
) => _ProgramLibraryResponse(
  assignedPrograms:
      (json['assignedPrograms'] as List<dynamic>?)
          ?.map((e) => ProgramDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ProgramDto>[],
  personalPrograms:
      (json['personalPrograms'] as List<dynamic>?)
          ?.map((e) => ProgramDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ProgramDto>[],
  personalTemplates:
      (json['personalTemplates'] as List<dynamic>?)
          ?.map((e) => TemplateLibraryItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <TemplateLibraryItem>[],
  systemTemplates:
      (json['systemTemplates'] as List<dynamic>?)
          ?.map((e) => TemplateLibraryItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <TemplateLibraryItem>[],
  categories:
      (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
);

Map<String, dynamic> _$ProgramLibraryResponseToJson(
  _ProgramLibraryResponse instance,
) => <String, dynamic>{
  'assignedPrograms': instance.assignedPrograms,
  'personalPrograms': instance.personalPrograms,
  'personalTemplates': instance.personalTemplates,
  'systemTemplates': instance.systemTemplates,
  'categories': instance.categories,
};

_TemplateLibraryItem _$TemplateLibraryItemFromJson(Map<String, dynamic> json) =>
    _TemplateLibraryItem(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      programId: json['programId'] as String,
      order: (json['order'] as num?)?.toInt() ?? 0,
      source: json['source'] as String?,
      program: TemplateLibraryProgram.fromJson(
        json['program'] as Map<String, dynamic>,
      ),
      exerciseCount: (json['exerciseCount'] as num?)?.toInt() ?? 0,
      exercises: (json['exercises'] as List<dynamic>)
          .map(
            (e) => TemplateLibraryExercise.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$TemplateLibraryItemToJson(
  _TemplateLibraryItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'programId': instance.programId,
  'order': instance.order,
  'source': instance.source,
  'program': instance.program,
  'exerciseCount': instance.exerciseCount,
  'exercises': instance.exercises,
};

_TemplateLibraryProgram _$TemplateLibraryProgramFromJson(
  Map<String, dynamic> json,
) => _TemplateLibraryProgram(
  name: json['name'] as String,
  trainerId: json['trainerId'] as String?,
);

Map<String, dynamic> _$TemplateLibraryProgramToJson(
  _TemplateLibraryProgram instance,
) => <String, dynamic>{'name': instance.name, 'trainerId': instance.trainerId};

_TemplateLibraryExercise _$TemplateLibraryExerciseFromJson(
  Map<String, dynamic> json,
) => _TemplateLibraryExercise(
  id: json['id'] as String,
  order: (json['order'] as num?)?.toInt() ?? 0,
  type: json['type'] as String?,
  exerciseId: json['exerciseId'] as String?,
  targetReps: json['targetReps'] as String?,
  durationSeconds: (json['durationSeconds'] as num?)?.toInt(),
  notes: json['notes'] as String?,
  exercise: TemplateLibraryExerciseDetail.fromJson(
    json['exercise'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$TemplateLibraryExerciseToJson(
  _TemplateLibraryExercise instance,
) => <String, dynamic>{
  'id': instance.id,
  'order': instance.order,
  'type': instance.type,
  'exerciseId': instance.exerciseId,
  'targetReps': instance.targetReps,
  'durationSeconds': instance.durationSeconds,
  'notes': instance.notes,
  'exercise': instance.exercise,
};

_TemplateLibraryExerciseDetail _$TemplateLibraryExerciseDetailFromJson(
  Map<String, dynamic> json,
) => _TemplateLibraryExerciseDetail(
  id: json['id'] as String,
  name: json['name'] as String,
  muscleGroup: json['muscleGroup'] as String?,
  equipment: json['equipment'] as String?,
);

Map<String, dynamic> _$TemplateLibraryExerciseDetailToJson(
  _TemplateLibraryExerciseDetail instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'muscleGroup': instance.muscleGroup,
  'equipment': instance.equipment,
};
