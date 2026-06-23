// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'active_program_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActiveProgramResponse {

 ProgramBasicInfo get program; ProgramProgress get progress; List<ProgramTemplateStatus> get templates;
/// Create a copy of ActiveProgramResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActiveProgramResponseCopyWith<ActiveProgramResponse> get copyWith => _$ActiveProgramResponseCopyWithImpl<ActiveProgramResponse>(this as ActiveProgramResponse, _$identity);

  /// Serializes this ActiveProgramResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveProgramResponse&&(identical(other.program, program) || other.program == program)&&(identical(other.progress, progress) || other.progress == progress)&&const DeepCollectionEquality().equals(other.templates, templates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,program,progress,const DeepCollectionEquality().hash(templates));

@override
String toString() {
  return 'ActiveProgramResponse(program: $program, progress: $progress, templates: $templates)';
}


}

/// @nodoc
abstract mixin class $ActiveProgramResponseCopyWith<$Res>  {
  factory $ActiveProgramResponseCopyWith(ActiveProgramResponse value, $Res Function(ActiveProgramResponse) _then) = _$ActiveProgramResponseCopyWithImpl;
@useResult
$Res call({
 ProgramBasicInfo program, ProgramProgress progress, List<ProgramTemplateStatus> templates
});


$ProgramBasicInfoCopyWith<$Res> get program;$ProgramProgressCopyWith<$Res> get progress;

}
/// @nodoc
class _$ActiveProgramResponseCopyWithImpl<$Res>
    implements $ActiveProgramResponseCopyWith<$Res> {
  _$ActiveProgramResponseCopyWithImpl(this._self, this._then);

  final ActiveProgramResponse _self;
  final $Res Function(ActiveProgramResponse) _then;

/// Create a copy of ActiveProgramResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? program = null,Object? progress = null,Object? templates = null,}) {
  return _then(_self.copyWith(
program: null == program ? _self.program : program // ignore: cast_nullable_to_non_nullable
as ProgramBasicInfo,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as ProgramProgress,templates: null == templates ? _self.templates : templates // ignore: cast_nullable_to_non_nullable
as List<ProgramTemplateStatus>,
  ));
}
/// Create a copy of ActiveProgramResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProgramBasicInfoCopyWith<$Res> get program {
  
  return $ProgramBasicInfoCopyWith<$Res>(_self.program, (value) {
    return _then(_self.copyWith(program: value));
  });
}/// Create a copy of ActiveProgramResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProgramProgressCopyWith<$Res> get progress {
  
  return $ProgramProgressCopyWith<$Res>(_self.progress, (value) {
    return _then(_self.copyWith(progress: value));
  });
}
}


/// Adds pattern-matching-related methods to [ActiveProgramResponse].
extension ActiveProgramResponsePatterns on ActiveProgramResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActiveProgramResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActiveProgramResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActiveProgramResponse value)  $default,){
final _that = this;
switch (_that) {
case _ActiveProgramResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActiveProgramResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ActiveProgramResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProgramBasicInfo program,  ProgramProgress progress,  List<ProgramTemplateStatus> templates)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActiveProgramResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProgramBasicInfo program,  ProgramProgress progress,  List<ProgramTemplateStatus> templates)  $default,) {final _that = this;
switch (_that) {
case _ActiveProgramResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProgramBasicInfo program,  ProgramProgress progress,  List<ProgramTemplateStatus> templates)?  $default,) {final _that = this;
switch (_that) {
case _ActiveProgramResponse() when $default != null:
return $default(_that.program,_that.progress,_that.templates);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ActiveProgramResponse implements ActiveProgramResponse {
  const _ActiveProgramResponse({required this.program, required this.progress, required final  List<ProgramTemplateStatus> templates}): _templates = templates;
  factory _ActiveProgramResponse.fromJson(Map<String, dynamic> json) => _$ActiveProgramResponseFromJson(json);

@override final  ProgramBasicInfo program;
@override final  ProgramProgress progress;
 final  List<ProgramTemplateStatus> _templates;
@override List<ProgramTemplateStatus> get templates {
  if (_templates is EqualUnmodifiableListView) return _templates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_templates);
}


/// Create a copy of ActiveProgramResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActiveProgramResponseCopyWith<_ActiveProgramResponse> get copyWith => __$ActiveProgramResponseCopyWithImpl<_ActiveProgramResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActiveProgramResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActiveProgramResponse&&(identical(other.program, program) || other.program == program)&&(identical(other.progress, progress) || other.progress == progress)&&const DeepCollectionEquality().equals(other._templates, _templates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,program,progress,const DeepCollectionEquality().hash(_templates));

@override
String toString() {
  return 'ActiveProgramResponse(program: $program, progress: $progress, templates: $templates)';
}


}

/// @nodoc
abstract mixin class _$ActiveProgramResponseCopyWith<$Res> implements $ActiveProgramResponseCopyWith<$Res> {
  factory _$ActiveProgramResponseCopyWith(_ActiveProgramResponse value, $Res Function(_ActiveProgramResponse) _then) = __$ActiveProgramResponseCopyWithImpl;
@override @useResult
$Res call({
 ProgramBasicInfo program, ProgramProgress progress, List<ProgramTemplateStatus> templates
});


@override $ProgramBasicInfoCopyWith<$Res> get program;@override $ProgramProgressCopyWith<$Res> get progress;

}
/// @nodoc
class __$ActiveProgramResponseCopyWithImpl<$Res>
    implements _$ActiveProgramResponseCopyWith<$Res> {
  __$ActiveProgramResponseCopyWithImpl(this._self, this._then);

  final _ActiveProgramResponse _self;
  final $Res Function(_ActiveProgramResponse) _then;

/// Create a copy of ActiveProgramResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? program = null,Object? progress = null,Object? templates = null,}) {
  return _then(_ActiveProgramResponse(
program: null == program ? _self.program : program // ignore: cast_nullable_to_non_nullable
as ProgramBasicInfo,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as ProgramProgress,templates: null == templates ? _self._templates : templates // ignore: cast_nullable_to_non_nullable
as List<ProgramTemplateStatus>,
  ));
}

/// Create a copy of ActiveProgramResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProgramBasicInfoCopyWith<$Res> get program {
  
  return $ProgramBasicInfoCopyWith<$Res>(_self.program, (value) {
    return _then(_self.copyWith(program: value));
  });
}/// Create a copy of ActiveProgramResponse
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
mixin _$ProgramBasicInfo {

 String get id; String get name; String? get description;
/// Create a copy of ProgramBasicInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramBasicInfoCopyWith<ProgramBasicInfo> get copyWith => _$ProgramBasicInfoCopyWithImpl<ProgramBasicInfo>(this as ProgramBasicInfo, _$identity);

  /// Serializes this ProgramBasicInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramBasicInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description);

@override
String toString() {
  return 'ProgramBasicInfo(id: $id, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class $ProgramBasicInfoCopyWith<$Res>  {
  factory $ProgramBasicInfoCopyWith(ProgramBasicInfo value, $Res Function(ProgramBasicInfo) _then) = _$ProgramBasicInfoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description
});




}
/// @nodoc
class _$ProgramBasicInfoCopyWithImpl<$Res>
    implements $ProgramBasicInfoCopyWith<$Res> {
  _$ProgramBasicInfoCopyWithImpl(this._self, this._then);

  final ProgramBasicInfo _self;
  final $Res Function(ProgramBasicInfo) _then;

/// Create a copy of ProgramBasicInfo
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


/// Adds pattern-matching-related methods to [ProgramBasicInfo].
extension ProgramBasicInfoPatterns on ProgramBasicInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgramBasicInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgramBasicInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgramBasicInfo value)  $default,){
final _that = this;
switch (_that) {
case _ProgramBasicInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgramBasicInfo value)?  $default,){
final _that = this;
switch (_that) {
case _ProgramBasicInfo() when $default != null:
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
case _ProgramBasicInfo() when $default != null:
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
case _ProgramBasicInfo():
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
case _ProgramBasicInfo() when $default != null:
return $default(_that.id,_that.name,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgramBasicInfo implements ProgramBasicInfo {
  const _ProgramBasicInfo({required this.id, required this.name, this.description});
  factory _ProgramBasicInfo.fromJson(Map<String, dynamic> json) => _$ProgramBasicInfoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;

/// Create a copy of ProgramBasicInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgramBasicInfoCopyWith<_ProgramBasicInfo> get copyWith => __$ProgramBasicInfoCopyWithImpl<_ProgramBasicInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgramBasicInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgramBasicInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description);

@override
String toString() {
  return 'ProgramBasicInfo(id: $id, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class _$ProgramBasicInfoCopyWith<$Res> implements $ProgramBasicInfoCopyWith<$Res> {
  factory _$ProgramBasicInfoCopyWith(_ProgramBasicInfo value, $Res Function(_ProgramBasicInfo) _then) = __$ProgramBasicInfoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description
});




}
/// @nodoc
class __$ProgramBasicInfoCopyWithImpl<$Res>
    implements _$ProgramBasicInfoCopyWith<$Res> {
  __$ProgramBasicInfoCopyWithImpl(this._self, this._then);

  final _ProgramBasicInfo _self;
  final $Res Function(_ProgramBasicInfo) _then;

/// Create a copy of ProgramBasicInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,}) {
  return _then(_ProgramBasicInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ProgramProgress {

 int get completedCount; int get totalCount; int get progressPercentage; String? get nextTemplateId;
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
 int completedCount, int totalCount, int progressPercentage, String? nextTemplateId
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
as int,nextTemplateId: freezed == nextTemplateId ? _self.nextTemplateId : nextTemplateId // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int completedCount,  int totalCount,  int progressPercentage,  String? nextTemplateId)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int completedCount,  int totalCount,  int progressPercentage,  String? nextTemplateId)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int completedCount,  int totalCount,  int progressPercentage,  String? nextTemplateId)?  $default,) {final _that = this;
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
  const _ProgramProgress({required this.completedCount, required this.totalCount, required this.progressPercentage, this.nextTemplateId});
  factory _ProgramProgress.fromJson(Map<String, dynamic> json) => _$ProgramProgressFromJson(json);

@override final  int completedCount;
@override final  int totalCount;
@override final  int progressPercentage;
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
 int completedCount, int totalCount, int progressPercentage, String? nextTemplateId
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
as int,nextTemplateId: freezed == nextTemplateId ? _self.nextTemplateId : nextTemplateId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ProgramTemplateStatus {

 String get id; String get name; String? get description; int get order; String get status; int get exerciseCount;
/// Create a copy of ProgramTemplateStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramTemplateStatusCopyWith<ProgramTemplateStatus> get copyWith => _$ProgramTemplateStatusCopyWithImpl<ProgramTemplateStatus>(this as ProgramTemplateStatus, _$identity);

  /// Serializes this ProgramTemplateStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramTemplateStatus&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.order, order) || other.order == order)&&(identical(other.status, status) || other.status == status)&&(identical(other.exerciseCount, exerciseCount) || other.exerciseCount == exerciseCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,order,status,exerciseCount);

@override
String toString() {
  return 'ProgramTemplateStatus(id: $id, name: $name, description: $description, order: $order, status: $status, exerciseCount: $exerciseCount)';
}


}

/// @nodoc
abstract mixin class $ProgramTemplateStatusCopyWith<$Res>  {
  factory $ProgramTemplateStatusCopyWith(ProgramTemplateStatus value, $Res Function(ProgramTemplateStatus) _then) = _$ProgramTemplateStatusCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description, int order, String status, int exerciseCount
});




}
/// @nodoc
class _$ProgramTemplateStatusCopyWithImpl<$Res>
    implements $ProgramTemplateStatusCopyWith<$Res> {
  _$ProgramTemplateStatusCopyWithImpl(this._self, this._then);

  final ProgramTemplateStatus _self;
  final $Res Function(ProgramTemplateStatus) _then;

/// Create a copy of ProgramTemplateStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? order = null,Object? status = null,Object? exerciseCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,exerciseCount: null == exerciseCount ? _self.exerciseCount : exerciseCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProgramTemplateStatus].
extension ProgramTemplateStatusPatterns on ProgramTemplateStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgramTemplateStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgramTemplateStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgramTemplateStatus value)  $default,){
final _that = this;
switch (_that) {
case _ProgramTemplateStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgramTemplateStatus value)?  $default,){
final _that = this;
switch (_that) {
case _ProgramTemplateStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  int order,  String status,  int exerciseCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgramTemplateStatus() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.order,_that.status,_that.exerciseCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  int order,  String status,  int exerciseCount)  $default,) {final _that = this;
switch (_that) {
case _ProgramTemplateStatus():
return $default(_that.id,_that.name,_that.description,_that.order,_that.status,_that.exerciseCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description,  int order,  String status,  int exerciseCount)?  $default,) {final _that = this;
switch (_that) {
case _ProgramTemplateStatus() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.order,_that.status,_that.exerciseCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgramTemplateStatus implements ProgramTemplateStatus {
  const _ProgramTemplateStatus({required this.id, required this.name, this.description, required this.order, required this.status, required this.exerciseCount});
  factory _ProgramTemplateStatus.fromJson(Map<String, dynamic> json) => _$ProgramTemplateStatusFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;
@override final  int order;
@override final  String status;
@override final  int exerciseCount;

/// Create a copy of ProgramTemplateStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgramTemplateStatusCopyWith<_ProgramTemplateStatus> get copyWith => __$ProgramTemplateStatusCopyWithImpl<_ProgramTemplateStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgramTemplateStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgramTemplateStatus&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.order, order) || other.order == order)&&(identical(other.status, status) || other.status == status)&&(identical(other.exerciseCount, exerciseCount) || other.exerciseCount == exerciseCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,order,status,exerciseCount);

@override
String toString() {
  return 'ProgramTemplateStatus(id: $id, name: $name, description: $description, order: $order, status: $status, exerciseCount: $exerciseCount)';
}


}

/// @nodoc
abstract mixin class _$ProgramTemplateStatusCopyWith<$Res> implements $ProgramTemplateStatusCopyWith<$Res> {
  factory _$ProgramTemplateStatusCopyWith(_ProgramTemplateStatus value, $Res Function(_ProgramTemplateStatus) _then) = __$ProgramTemplateStatusCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description, int order, String status, int exerciseCount
});




}
/// @nodoc
class __$ProgramTemplateStatusCopyWithImpl<$Res>
    implements _$ProgramTemplateStatusCopyWith<$Res> {
  __$ProgramTemplateStatusCopyWithImpl(this._self, this._then);

  final _ProgramTemplateStatus _self;
  final $Res Function(_ProgramTemplateStatus) _then;

/// Create a copy of ProgramTemplateStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? order = null,Object? status = null,Object? exerciseCount = null,}) {
  return _then(_ProgramTemplateStatus(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,exerciseCount: null == exerciseCount ? _self.exerciseCount : exerciseCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
