// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_client_active_program_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainerClientActiveProgramDto {

 ProgramInfo get program; ProgramProgress get progress; List<TrainerClientProgramTemplateDto> get templates;
/// Create a copy of TrainerClientActiveProgramDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerClientActiveProgramDtoCopyWith<TrainerClientActiveProgramDto> get copyWith => _$TrainerClientActiveProgramDtoCopyWithImpl<TrainerClientActiveProgramDto>(this as TrainerClientActiveProgramDto, _$identity);

  /// Serializes this TrainerClientActiveProgramDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientActiveProgramDto&&(identical(other.program, program) || other.program == program)&&(identical(other.progress, progress) || other.progress == progress)&&const DeepCollectionEquality().equals(other.templates, templates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,program,progress,const DeepCollectionEquality().hash(templates));

@override
String toString() {
  return 'TrainerClientActiveProgramDto(program: $program, progress: $progress, templates: $templates)';
}


}

/// @nodoc
abstract mixin class $TrainerClientActiveProgramDtoCopyWith<$Res>  {
  factory $TrainerClientActiveProgramDtoCopyWith(TrainerClientActiveProgramDto value, $Res Function(TrainerClientActiveProgramDto) _then) = _$TrainerClientActiveProgramDtoCopyWithImpl;
@useResult
$Res call({
 ProgramInfo program, ProgramProgress progress, List<TrainerClientProgramTemplateDto> templates
});


$ProgramInfoCopyWith<$Res> get program;$ProgramProgressCopyWith<$Res> get progress;

}
/// @nodoc
class _$TrainerClientActiveProgramDtoCopyWithImpl<$Res>
    implements $TrainerClientActiveProgramDtoCopyWith<$Res> {
  _$TrainerClientActiveProgramDtoCopyWithImpl(this._self, this._then);

  final TrainerClientActiveProgramDto _self;
  final $Res Function(TrainerClientActiveProgramDto) _then;

/// Create a copy of TrainerClientActiveProgramDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? program = null,Object? progress = null,Object? templates = null,}) {
  return _then(_self.copyWith(
program: null == program ? _self.program : program // ignore: cast_nullable_to_non_nullable
as ProgramInfo,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as ProgramProgress,templates: null == templates ? _self.templates : templates // ignore: cast_nullable_to_non_nullable
as List<TrainerClientProgramTemplateDto>,
  ));
}
/// Create a copy of TrainerClientActiveProgramDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProgramInfoCopyWith<$Res> get program {
  
  return $ProgramInfoCopyWith<$Res>(_self.program, (value) {
    return _then(_self.copyWith(program: value));
  });
}/// Create a copy of TrainerClientActiveProgramDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProgramProgressCopyWith<$Res> get progress {
  
  return $ProgramProgressCopyWith<$Res>(_self.progress, (value) {
    return _then(_self.copyWith(progress: value));
  });
}
}


/// Adds pattern-matching-related methods to [TrainerClientActiveProgramDto].
extension TrainerClientActiveProgramDtoPatterns on TrainerClientActiveProgramDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainerClientActiveProgramDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainerClientActiveProgramDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainerClientActiveProgramDto value)  $default,){
final _that = this;
switch (_that) {
case _TrainerClientActiveProgramDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainerClientActiveProgramDto value)?  $default,){
final _that = this;
switch (_that) {
case _TrainerClientActiveProgramDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProgramInfo program,  ProgramProgress progress,  List<TrainerClientProgramTemplateDto> templates)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainerClientActiveProgramDto() when $default != null:
return $default(_that.program,_that.progress,_that.templates);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProgramInfo program,  ProgramProgress progress,  List<TrainerClientProgramTemplateDto> templates)  $default,) {final _that = this;
switch (_that) {
case _TrainerClientActiveProgramDto():
return $default(_that.program,_that.progress,_that.templates);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProgramInfo program,  ProgramProgress progress,  List<TrainerClientProgramTemplateDto> templates)?  $default,) {final _that = this;
switch (_that) {
case _TrainerClientActiveProgramDto() when $default != null:
return $default(_that.program,_that.progress,_that.templates);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainerClientActiveProgramDto implements TrainerClientActiveProgramDto {
  const _TrainerClientActiveProgramDto({required this.program, required this.progress, final  List<TrainerClientProgramTemplateDto> templates = const <TrainerClientProgramTemplateDto>[]}): _templates = templates;
  factory _TrainerClientActiveProgramDto.fromJson(Map<String, dynamic> json) => _$TrainerClientActiveProgramDtoFromJson(json);

@override final  ProgramInfo program;
@override final  ProgramProgress progress;
 final  List<TrainerClientProgramTemplateDto> _templates;
@override@JsonKey() List<TrainerClientProgramTemplateDto> get templates {
  if (_templates is EqualUnmodifiableListView) return _templates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_templates);
}


/// Create a copy of TrainerClientActiveProgramDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainerClientActiveProgramDtoCopyWith<_TrainerClientActiveProgramDto> get copyWith => __$TrainerClientActiveProgramDtoCopyWithImpl<_TrainerClientActiveProgramDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainerClientActiveProgramDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainerClientActiveProgramDto&&(identical(other.program, program) || other.program == program)&&(identical(other.progress, progress) || other.progress == progress)&&const DeepCollectionEquality().equals(other._templates, _templates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,program,progress,const DeepCollectionEquality().hash(_templates));

@override
String toString() {
  return 'TrainerClientActiveProgramDto(program: $program, progress: $progress, templates: $templates)';
}


}

/// @nodoc
abstract mixin class _$TrainerClientActiveProgramDtoCopyWith<$Res> implements $TrainerClientActiveProgramDtoCopyWith<$Res> {
  factory _$TrainerClientActiveProgramDtoCopyWith(_TrainerClientActiveProgramDto value, $Res Function(_TrainerClientActiveProgramDto) _then) = __$TrainerClientActiveProgramDtoCopyWithImpl;
@override @useResult
$Res call({
 ProgramInfo program, ProgramProgress progress, List<TrainerClientProgramTemplateDto> templates
});


@override $ProgramInfoCopyWith<$Res> get program;@override $ProgramProgressCopyWith<$Res> get progress;

}
/// @nodoc
class __$TrainerClientActiveProgramDtoCopyWithImpl<$Res>
    implements _$TrainerClientActiveProgramDtoCopyWith<$Res> {
  __$TrainerClientActiveProgramDtoCopyWithImpl(this._self, this._then);

  final _TrainerClientActiveProgramDto _self;
  final $Res Function(_TrainerClientActiveProgramDto) _then;

/// Create a copy of TrainerClientActiveProgramDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? program = null,Object? progress = null,Object? templates = null,}) {
  return _then(_TrainerClientActiveProgramDto(
program: null == program ? _self.program : program // ignore: cast_nullable_to_non_nullable
as ProgramInfo,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as ProgramProgress,templates: null == templates ? _self._templates : templates // ignore: cast_nullable_to_non_nullable
as List<TrainerClientProgramTemplateDto>,
  ));
}

/// Create a copy of TrainerClientActiveProgramDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProgramInfoCopyWith<$Res> get program {
  
  return $ProgramInfoCopyWith<$Res>(_self.program, (value) {
    return _then(_self.copyWith(program: value));
  });
}/// Create a copy of TrainerClientActiveProgramDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProgramProgressCopyWith<$Res> get progress {
  
  return $ProgramProgressCopyWith<$Res>(_self.progress, (value) {
    return _then(_self.copyWith(progress: value));
  });
}
}


/// @nodoc
mixin _$ProgramInfo {

 String get id; String get name; String? get description;
/// Create a copy of ProgramInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramInfoCopyWith<ProgramInfo> get copyWith => _$ProgramInfoCopyWithImpl<ProgramInfo>(this as ProgramInfo, _$identity);

  /// Serializes this ProgramInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description);

@override
String toString() {
  return 'ProgramInfo(id: $id, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class $ProgramInfoCopyWith<$Res>  {
  factory $ProgramInfoCopyWith(ProgramInfo value, $Res Function(ProgramInfo) _then) = _$ProgramInfoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description
});




}
/// @nodoc
class _$ProgramInfoCopyWithImpl<$Res>
    implements $ProgramInfoCopyWith<$Res> {
  _$ProgramInfoCopyWithImpl(this._self, this._then);

  final ProgramInfo _self;
  final $Res Function(ProgramInfo) _then;

/// Create a copy of ProgramInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProgramInfo].
extension ProgramInfoPatterns on ProgramInfo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgramInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgramInfo() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgramInfo value)  $default,){
final _that = this;
switch (_that) {
case _ProgramInfo():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgramInfo value)?  $default,){
final _that = this;
switch (_that) {
case _ProgramInfo() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgramInfo() when $default != null:
return $default(_that.id,_that.name,_that.description);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description)  $default,) {final _that = this;
switch (_that) {
case _ProgramInfo():
return $default(_that.id,_that.name,_that.description);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _ProgramInfo() when $default != null:
return $default(_that.id,_that.name,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgramInfo implements ProgramInfo {
  const _ProgramInfo({required this.id, required this.name, this.description});
  factory _ProgramInfo.fromJson(Map<String, dynamic> json) => _$ProgramInfoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;

/// Create a copy of ProgramInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgramInfoCopyWith<_ProgramInfo> get copyWith => __$ProgramInfoCopyWithImpl<_ProgramInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgramInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgramInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description);

@override
String toString() {
  return 'ProgramInfo(id: $id, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class _$ProgramInfoCopyWith<$Res> implements $ProgramInfoCopyWith<$Res> {
  factory _$ProgramInfoCopyWith(_ProgramInfo value, $Res Function(_ProgramInfo) _then) = __$ProgramInfoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description
});




}
/// @nodoc
class __$ProgramInfoCopyWithImpl<$Res>
    implements _$ProgramInfoCopyWith<$Res> {
  __$ProgramInfoCopyWithImpl(this._self, this._then);

  final _ProgramInfo _self;
  final $Res Function(_ProgramInfo) _then;

/// Create a copy of ProgramInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,}) {
  return _then(_ProgramInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ProgramProgress {

 int get completedCount; int get totalCount; double get progressPercentage; String? get nextTemplateId;
/// Create a copy of ProgramProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramProgressCopyWith<ProgramProgress> get copyWith => _$ProgramProgressCopyWithImpl<ProgramProgress>(this as ProgramProgress, _$identity);

  /// Serializes this ProgramProgress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramProgress&&(identical(other.completedCount, completedCount) || other.completedCount == completedCount)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.progressPercentage, progressPercentage) || other.progressPercentage == progressPercentage)&&(identical(other.nextTemplateId, nextTemplateId) || other.nextTemplateId == nextTemplateId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,completedCount,totalCount,progressPercentage,nextTemplateId);

@override
String toString() {
  return 'ProgramProgress(completedCount: $completedCount, totalCount: $totalCount, progressPercentage: $progressPercentage, nextTemplateId: $nextTemplateId)';
}


}

/// @nodoc
abstract mixin class $ProgramProgressCopyWith<$Res>  {
  factory $ProgramProgressCopyWith(ProgramProgress value, $Res Function(ProgramProgress) _then) = _$ProgramProgressCopyWithImpl;
@useResult
$Res call({
 int completedCount, int totalCount, double progressPercentage, String? nextTemplateId
});




}
/// @nodoc
class _$ProgramProgressCopyWithImpl<$Res>
    implements $ProgramProgressCopyWith<$Res> {
  _$ProgramProgressCopyWithImpl(this._self, this._then);

  final ProgramProgress _self;
  final $Res Function(ProgramProgress) _then;

/// Create a copy of ProgramProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? completedCount = null,Object? totalCount = null,Object? progressPercentage = null,Object? nextTemplateId = freezed,}) {
  return _then(_self.copyWith(
completedCount: null == completedCount ? _self.completedCount : completedCount // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,progressPercentage: null == progressPercentage ? _self.progressPercentage : progressPercentage // ignore: cast_nullable_to_non_nullable
as double,nextTemplateId: freezed == nextTemplateId ? _self.nextTemplateId : nextTemplateId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProgramProgress].
extension ProgramProgressPatterns on ProgramProgress {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgramProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgramProgress() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgramProgress value)  $default,){
final _that = this;
switch (_that) {
case _ProgramProgress():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgramProgress value)?  $default,){
final _that = this;
switch (_that) {
case _ProgramProgress() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int completedCount,  int totalCount,  double progressPercentage,  String? nextTemplateId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgramProgress() when $default != null:
return $default(_that.completedCount,_that.totalCount,_that.progressPercentage,_that.nextTemplateId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int completedCount,  int totalCount,  double progressPercentage,  String? nextTemplateId)  $default,) {final _that = this;
switch (_that) {
case _ProgramProgress():
return $default(_that.completedCount,_that.totalCount,_that.progressPercentage,_that.nextTemplateId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int completedCount,  int totalCount,  double progressPercentage,  String? nextTemplateId)?  $default,) {final _that = this;
switch (_that) {
case _ProgramProgress() when $default != null:
return $default(_that.completedCount,_that.totalCount,_that.progressPercentage,_that.nextTemplateId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgramProgress implements ProgramProgress {
  const _ProgramProgress({this.completedCount = 0, this.totalCount = 0, this.progressPercentage = 0.0, this.nextTemplateId});
  factory _ProgramProgress.fromJson(Map<String, dynamic> json) => _$ProgramProgressFromJson(json);

@override@JsonKey() final  int completedCount;
@override@JsonKey() final  int totalCount;
@override@JsonKey() final  double progressPercentage;
@override final  String? nextTemplateId;

/// Create a copy of ProgramProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgramProgressCopyWith<_ProgramProgress> get copyWith => __$ProgramProgressCopyWithImpl<_ProgramProgress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgramProgressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgramProgress&&(identical(other.completedCount, completedCount) || other.completedCount == completedCount)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.progressPercentage, progressPercentage) || other.progressPercentage == progressPercentage)&&(identical(other.nextTemplateId, nextTemplateId) || other.nextTemplateId == nextTemplateId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,completedCount,totalCount,progressPercentage,nextTemplateId);

@override
String toString() {
  return 'ProgramProgress(completedCount: $completedCount, totalCount: $totalCount, progressPercentage: $progressPercentage, nextTemplateId: $nextTemplateId)';
}


}

/// @nodoc
abstract mixin class _$ProgramProgressCopyWith<$Res> implements $ProgramProgressCopyWith<$Res> {
  factory _$ProgramProgressCopyWith(_ProgramProgress value, $Res Function(_ProgramProgress) _then) = __$ProgramProgressCopyWithImpl;
@override @useResult
$Res call({
 int completedCount, int totalCount, double progressPercentage, String? nextTemplateId
});




}
/// @nodoc
class __$ProgramProgressCopyWithImpl<$Res>
    implements _$ProgramProgressCopyWith<$Res> {
  __$ProgramProgressCopyWithImpl(this._self, this._then);

  final _ProgramProgress _self;
  final $Res Function(_ProgramProgress) _then;

/// Create a copy of ProgramProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? completedCount = null,Object? totalCount = null,Object? progressPercentage = null,Object? nextTemplateId = freezed,}) {
  return _then(_ProgramProgress(
completedCount: null == completedCount ? _self.completedCount : completedCount // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,progressPercentage: null == progressPercentage ? _self.progressPercentage : progressPercentage // ignore: cast_nullable_to_non_nullable
as double,nextTemplateId: freezed == nextTemplateId ? _self.nextTemplateId : nextTemplateId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
