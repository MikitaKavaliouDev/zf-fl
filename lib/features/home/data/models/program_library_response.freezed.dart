// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_library_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProgramLibraryResponse {

 List<AssignedProgramDto> get assignedPrograms; List<ProgramDto> get personalPrograms; List<TemplateLibraryItem> get personalTemplates; List<TemplateLibraryItem> get systemTemplates; List<String> get categories;
/// Create a copy of ProgramLibraryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramLibraryResponseCopyWith<ProgramLibraryResponse> get copyWith => _$ProgramLibraryResponseCopyWithImpl<ProgramLibraryResponse>(this as ProgramLibraryResponse, _$identity);

  /// Serializes this ProgramLibraryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramLibraryResponse&&const DeepCollectionEquality().equals(other.assignedPrograms, assignedPrograms)&&const DeepCollectionEquality().equals(other.personalPrograms, personalPrograms)&&const DeepCollectionEquality().equals(other.personalTemplates, personalTemplates)&&const DeepCollectionEquality().equals(other.systemTemplates, systemTemplates)&&const DeepCollectionEquality().equals(other.categories, categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(assignedPrograms),const DeepCollectionEquality().hash(personalPrograms),const DeepCollectionEquality().hash(personalTemplates),const DeepCollectionEquality().hash(systemTemplates),const DeepCollectionEquality().hash(categories));

@override
String toString() {
  return 'ProgramLibraryResponse(assignedPrograms: $assignedPrograms, personalPrograms: $personalPrograms, personalTemplates: $personalTemplates, systemTemplates: $systemTemplates, categories: $categories)';
}


}

/// @nodoc
abstract mixin class $ProgramLibraryResponseCopyWith<$Res>  {
  factory $ProgramLibraryResponseCopyWith(ProgramLibraryResponse value, $Res Function(ProgramLibraryResponse) _then) = _$ProgramLibraryResponseCopyWithImpl;
@useResult
$Res call({
 List<AssignedProgramDto> assignedPrograms, List<ProgramDto> personalPrograms, List<TemplateLibraryItem> personalTemplates, List<TemplateLibraryItem> systemTemplates, List<String> categories
});




}
/// @nodoc
class _$ProgramLibraryResponseCopyWithImpl<$Res>
    implements $ProgramLibraryResponseCopyWith<$Res> {
  _$ProgramLibraryResponseCopyWithImpl(this._self, this._then);

  final ProgramLibraryResponse _self;
  final $Res Function(ProgramLibraryResponse) _then;

/// Create a copy of ProgramLibraryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? assignedPrograms = null,Object? personalPrograms = null,Object? personalTemplates = null,Object? systemTemplates = null,Object? categories = null,}) {
  return _then(_self.copyWith(
assignedPrograms: null == assignedPrograms ? _self.assignedPrograms : assignedPrograms // ignore: cast_nullable_to_non_nullable
as List<AssignedProgramDto>,personalPrograms: null == personalPrograms ? _self.personalPrograms : personalPrograms // ignore: cast_nullable_to_non_nullable
as List<ProgramDto>,personalTemplates: null == personalTemplates ? _self.personalTemplates : personalTemplates // ignore: cast_nullable_to_non_nullable
as List<TemplateLibraryItem>,systemTemplates: null == systemTemplates ? _self.systemTemplates : systemTemplates // ignore: cast_nullable_to_non_nullable
as List<TemplateLibraryItem>,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProgramLibraryResponse].
extension ProgramLibraryResponsePatterns on ProgramLibraryResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgramLibraryResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgramLibraryResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgramLibraryResponse value)  $default,){
final _that = this;
switch (_that) {
case _ProgramLibraryResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgramLibraryResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ProgramLibraryResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AssignedProgramDto> assignedPrograms,  List<ProgramDto> personalPrograms,  List<TemplateLibraryItem> personalTemplates,  List<TemplateLibraryItem> systemTemplates,  List<String> categories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgramLibraryResponse() when $default != null:
return $default(_that.assignedPrograms,_that.personalPrograms,_that.personalTemplates,_that.systemTemplates,_that.categories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AssignedProgramDto> assignedPrograms,  List<ProgramDto> personalPrograms,  List<TemplateLibraryItem> personalTemplates,  List<TemplateLibraryItem> systemTemplates,  List<String> categories)  $default,) {final _that = this;
switch (_that) {
case _ProgramLibraryResponse():
return $default(_that.assignedPrograms,_that.personalPrograms,_that.personalTemplates,_that.systemTemplates,_that.categories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AssignedProgramDto> assignedPrograms,  List<ProgramDto> personalPrograms,  List<TemplateLibraryItem> personalTemplates,  List<TemplateLibraryItem> systemTemplates,  List<String> categories)?  $default,) {final _that = this;
switch (_that) {
case _ProgramLibraryResponse() when $default != null:
return $default(_that.assignedPrograms,_that.personalPrograms,_that.personalTemplates,_that.systemTemplates,_that.categories);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgramLibraryResponse implements ProgramLibraryResponse {
  const _ProgramLibraryResponse({final  List<AssignedProgramDto> assignedPrograms = const <AssignedProgramDto>[], final  List<ProgramDto> personalPrograms = const <ProgramDto>[], final  List<TemplateLibraryItem> personalTemplates = const <TemplateLibraryItem>[], final  List<TemplateLibraryItem> systemTemplates = const <TemplateLibraryItem>[], final  List<String> categories = const <String>[]}): _assignedPrograms = assignedPrograms,_personalPrograms = personalPrograms,_personalTemplates = personalTemplates,_systemTemplates = systemTemplates,_categories = categories;
  factory _ProgramLibraryResponse.fromJson(Map<String, dynamic> json) => _$ProgramLibraryResponseFromJson(json);

 final  List<AssignedProgramDto> _assignedPrograms;
@override@JsonKey() List<AssignedProgramDto> get assignedPrograms {
  if (_assignedPrograms is EqualUnmodifiableListView) return _assignedPrograms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_assignedPrograms);
}

 final  List<ProgramDto> _personalPrograms;
@override@JsonKey() List<ProgramDto> get personalPrograms {
  if (_personalPrograms is EqualUnmodifiableListView) return _personalPrograms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_personalPrograms);
}

 final  List<TemplateLibraryItem> _personalTemplates;
@override@JsonKey() List<TemplateLibraryItem> get personalTemplates {
  if (_personalTemplates is EqualUnmodifiableListView) return _personalTemplates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_personalTemplates);
}

 final  List<TemplateLibraryItem> _systemTemplates;
@override@JsonKey() List<TemplateLibraryItem> get systemTemplates {
  if (_systemTemplates is EqualUnmodifiableListView) return _systemTemplates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_systemTemplates);
}

 final  List<String> _categories;
@override@JsonKey() List<String> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of ProgramLibraryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgramLibraryResponseCopyWith<_ProgramLibraryResponse> get copyWith => __$ProgramLibraryResponseCopyWithImpl<_ProgramLibraryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgramLibraryResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgramLibraryResponse&&const DeepCollectionEquality().equals(other._assignedPrograms, _assignedPrograms)&&const DeepCollectionEquality().equals(other._personalPrograms, _personalPrograms)&&const DeepCollectionEquality().equals(other._personalTemplates, _personalTemplates)&&const DeepCollectionEquality().equals(other._systemTemplates, _systemTemplates)&&const DeepCollectionEquality().equals(other._categories, _categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_assignedPrograms),const DeepCollectionEquality().hash(_personalPrograms),const DeepCollectionEquality().hash(_personalTemplates),const DeepCollectionEquality().hash(_systemTemplates),const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'ProgramLibraryResponse(assignedPrograms: $assignedPrograms, personalPrograms: $personalPrograms, personalTemplates: $personalTemplates, systemTemplates: $systemTemplates, categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$ProgramLibraryResponseCopyWith<$Res> implements $ProgramLibraryResponseCopyWith<$Res> {
  factory _$ProgramLibraryResponseCopyWith(_ProgramLibraryResponse value, $Res Function(_ProgramLibraryResponse) _then) = __$ProgramLibraryResponseCopyWithImpl;
@override @useResult
$Res call({
 List<AssignedProgramDto> assignedPrograms, List<ProgramDto> personalPrograms, List<TemplateLibraryItem> personalTemplates, List<TemplateLibraryItem> systemTemplates, List<String> categories
});




}
/// @nodoc
class __$ProgramLibraryResponseCopyWithImpl<$Res>
    implements _$ProgramLibraryResponseCopyWith<$Res> {
  __$ProgramLibraryResponseCopyWithImpl(this._self, this._then);

  final _ProgramLibraryResponse _self;
  final $Res Function(_ProgramLibraryResponse) _then;

/// Create a copy of ProgramLibraryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? assignedPrograms = null,Object? personalPrograms = null,Object? personalTemplates = null,Object? systemTemplates = null,Object? categories = null,}) {
  return _then(_ProgramLibraryResponse(
assignedPrograms: null == assignedPrograms ? _self._assignedPrograms : assignedPrograms // ignore: cast_nullable_to_non_nullable
as List<AssignedProgramDto>,personalPrograms: null == personalPrograms ? _self._personalPrograms : personalPrograms // ignore: cast_nullable_to_non_nullable
as List<ProgramDto>,personalTemplates: null == personalTemplates ? _self._personalTemplates : personalTemplates // ignore: cast_nullable_to_non_nullable
as List<TemplateLibraryItem>,systemTemplates: null == systemTemplates ? _self._systemTemplates : systemTemplates // ignore: cast_nullable_to_non_nullable
as List<TemplateLibraryItem>,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$TemplateLibraryItem {

 String get id; String get name; String? get description; String get programId; int get order; String? get source; TemplateLibraryProgram get program; int get exerciseCount; List<TemplateLibraryExercise> get exercises;
/// Create a copy of TemplateLibraryItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TemplateLibraryItemCopyWith<TemplateLibraryItem> get copyWith => _$TemplateLibraryItemCopyWithImpl<TemplateLibraryItem>(this as TemplateLibraryItem, _$identity);

  /// Serializes this TemplateLibraryItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TemplateLibraryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.programId, programId) || other.programId == programId)&&(identical(other.order, order) || other.order == order)&&(identical(other.source, source) || other.source == source)&&(identical(other.program, program) || other.program == program)&&(identical(other.exerciseCount, exerciseCount) || other.exerciseCount == exerciseCount)&&const DeepCollectionEquality().equals(other.exercises, exercises));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,programId,order,source,program,exerciseCount,const DeepCollectionEquality().hash(exercises));

@override
String toString() {
  return 'TemplateLibraryItem(id: $id, name: $name, description: $description, programId: $programId, order: $order, source: $source, program: $program, exerciseCount: $exerciseCount, exercises: $exercises)';
}


}

/// @nodoc
abstract mixin class $TemplateLibraryItemCopyWith<$Res>  {
  factory $TemplateLibraryItemCopyWith(TemplateLibraryItem value, $Res Function(TemplateLibraryItem) _then) = _$TemplateLibraryItemCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description, String programId, int order, String? source, TemplateLibraryProgram program, int exerciseCount, List<TemplateLibraryExercise> exercises
});


$TemplateLibraryProgramCopyWith<$Res> get program;

}
/// @nodoc
class _$TemplateLibraryItemCopyWithImpl<$Res>
    implements $TemplateLibraryItemCopyWith<$Res> {
  _$TemplateLibraryItemCopyWithImpl(this._self, this._then);

  final TemplateLibraryItem _self;
  final $Res Function(TemplateLibraryItem) _then;

/// Create a copy of TemplateLibraryItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? programId = null,Object? order = null,Object? source = freezed,Object? program = null,Object? exerciseCount = null,Object? exercises = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,programId: null == programId ? _self.programId : programId // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,program: null == program ? _self.program : program // ignore: cast_nullable_to_non_nullable
as TemplateLibraryProgram,exerciseCount: null == exerciseCount ? _self.exerciseCount : exerciseCount // ignore: cast_nullable_to_non_nullable
as int,exercises: null == exercises ? _self.exercises : exercises // ignore: cast_nullable_to_non_nullable
as List<TemplateLibraryExercise>,
  ));
}
/// Create a copy of TemplateLibraryItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TemplateLibraryProgramCopyWith<$Res> get program {
  
  return $TemplateLibraryProgramCopyWith<$Res>(_self.program, (value) {
    return _then(_self.copyWith(program: value));
  });
}
}


/// Adds pattern-matching-related methods to [TemplateLibraryItem].
extension TemplateLibraryItemPatterns on TemplateLibraryItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TemplateLibraryItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TemplateLibraryItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TemplateLibraryItem value)  $default,){
final _that = this;
switch (_that) {
case _TemplateLibraryItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TemplateLibraryItem value)?  $default,){
final _that = this;
switch (_that) {
case _TemplateLibraryItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  String programId,  int order,  String? source,  TemplateLibraryProgram program,  int exerciseCount,  List<TemplateLibraryExercise> exercises)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TemplateLibraryItem() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.programId,_that.order,_that.source,_that.program,_that.exerciseCount,_that.exercises);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  String programId,  int order,  String? source,  TemplateLibraryProgram program,  int exerciseCount,  List<TemplateLibraryExercise> exercises)  $default,) {final _that = this;
switch (_that) {
case _TemplateLibraryItem():
return $default(_that.id,_that.name,_that.description,_that.programId,_that.order,_that.source,_that.program,_that.exerciseCount,_that.exercises);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description,  String programId,  int order,  String? source,  TemplateLibraryProgram program,  int exerciseCount,  List<TemplateLibraryExercise> exercises)?  $default,) {final _that = this;
switch (_that) {
case _TemplateLibraryItem() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.programId,_that.order,_that.source,_that.program,_that.exerciseCount,_that.exercises);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TemplateLibraryItem implements TemplateLibraryItem {
  const _TemplateLibraryItem({required this.id, required this.name, this.description, required this.programId, this.order = 0, this.source, required this.program, this.exerciseCount = 0, required final  List<TemplateLibraryExercise> exercises}): _exercises = exercises;
  factory _TemplateLibraryItem.fromJson(Map<String, dynamic> json) => _$TemplateLibraryItemFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;
@override final  String programId;
@override@JsonKey() final  int order;
@override final  String? source;
@override final  TemplateLibraryProgram program;
@override@JsonKey() final  int exerciseCount;
 final  List<TemplateLibraryExercise> _exercises;
@override List<TemplateLibraryExercise> get exercises {
  if (_exercises is EqualUnmodifiableListView) return _exercises;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_exercises);
}


/// Create a copy of TemplateLibraryItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TemplateLibraryItemCopyWith<_TemplateLibraryItem> get copyWith => __$TemplateLibraryItemCopyWithImpl<_TemplateLibraryItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TemplateLibraryItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TemplateLibraryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.programId, programId) || other.programId == programId)&&(identical(other.order, order) || other.order == order)&&(identical(other.source, source) || other.source == source)&&(identical(other.program, program) || other.program == program)&&(identical(other.exerciseCount, exerciseCount) || other.exerciseCount == exerciseCount)&&const DeepCollectionEquality().equals(other._exercises, _exercises));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,programId,order,source,program,exerciseCount,const DeepCollectionEquality().hash(_exercises));

@override
String toString() {
  return 'TemplateLibraryItem(id: $id, name: $name, description: $description, programId: $programId, order: $order, source: $source, program: $program, exerciseCount: $exerciseCount, exercises: $exercises)';
}


}

/// @nodoc
abstract mixin class _$TemplateLibraryItemCopyWith<$Res> implements $TemplateLibraryItemCopyWith<$Res> {
  factory _$TemplateLibraryItemCopyWith(_TemplateLibraryItem value, $Res Function(_TemplateLibraryItem) _then) = __$TemplateLibraryItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description, String programId, int order, String? source, TemplateLibraryProgram program, int exerciseCount, List<TemplateLibraryExercise> exercises
});


@override $TemplateLibraryProgramCopyWith<$Res> get program;

}
/// @nodoc
class __$TemplateLibraryItemCopyWithImpl<$Res>
    implements _$TemplateLibraryItemCopyWith<$Res> {
  __$TemplateLibraryItemCopyWithImpl(this._self, this._then);

  final _TemplateLibraryItem _self;
  final $Res Function(_TemplateLibraryItem) _then;

/// Create a copy of TemplateLibraryItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? programId = null,Object? order = null,Object? source = freezed,Object? program = null,Object? exerciseCount = null,Object? exercises = null,}) {
  return _then(_TemplateLibraryItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,programId: null == programId ? _self.programId : programId // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,program: null == program ? _self.program : program // ignore: cast_nullable_to_non_nullable
as TemplateLibraryProgram,exerciseCount: null == exerciseCount ? _self.exerciseCount : exerciseCount // ignore: cast_nullable_to_non_nullable
as int,exercises: null == exercises ? _self._exercises : exercises // ignore: cast_nullable_to_non_nullable
as List<TemplateLibraryExercise>,
  ));
}

/// Create a copy of TemplateLibraryItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TemplateLibraryProgramCopyWith<$Res> get program {
  
  return $TemplateLibraryProgramCopyWith<$Res>(_self.program, (value) {
    return _then(_self.copyWith(program: value));
  });
}
}


/// @nodoc
mixin _$TemplateLibraryProgram {

 String get name; String? get trainerId;
/// Create a copy of TemplateLibraryProgram
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TemplateLibraryProgramCopyWith<TemplateLibraryProgram> get copyWith => _$TemplateLibraryProgramCopyWithImpl<TemplateLibraryProgram>(this as TemplateLibraryProgram, _$identity);

  /// Serializes this TemplateLibraryProgram to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TemplateLibraryProgram&&(identical(other.name, name) || other.name == name)&&(identical(other.trainerId, trainerId) || other.trainerId == trainerId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,trainerId);

@override
String toString() {
  return 'TemplateLibraryProgram(name: $name, trainerId: $trainerId)';
}


}

/// @nodoc
abstract mixin class $TemplateLibraryProgramCopyWith<$Res>  {
  factory $TemplateLibraryProgramCopyWith(TemplateLibraryProgram value, $Res Function(TemplateLibraryProgram) _then) = _$TemplateLibraryProgramCopyWithImpl;
@useResult
$Res call({
 String name, String? trainerId
});




}
/// @nodoc
class _$TemplateLibraryProgramCopyWithImpl<$Res>
    implements $TemplateLibraryProgramCopyWith<$Res> {
  _$TemplateLibraryProgramCopyWithImpl(this._self, this._then);

  final TemplateLibraryProgram _self;
  final $Res Function(TemplateLibraryProgram) _then;

/// Create a copy of TemplateLibraryProgram
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? trainerId = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,trainerId: freezed == trainerId ? _self.trainerId : trainerId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TemplateLibraryProgram].
extension TemplateLibraryProgramPatterns on TemplateLibraryProgram {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TemplateLibraryProgram value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TemplateLibraryProgram() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TemplateLibraryProgram value)  $default,){
final _that = this;
switch (_that) {
case _TemplateLibraryProgram():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TemplateLibraryProgram value)?  $default,){
final _that = this;
switch (_that) {
case _TemplateLibraryProgram() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? trainerId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TemplateLibraryProgram() when $default != null:
return $default(_that.name,_that.trainerId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? trainerId)  $default,) {final _that = this;
switch (_that) {
case _TemplateLibraryProgram():
return $default(_that.name,_that.trainerId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? trainerId)?  $default,) {final _that = this;
switch (_that) {
case _TemplateLibraryProgram() when $default != null:
return $default(_that.name,_that.trainerId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TemplateLibraryProgram implements TemplateLibraryProgram {
  const _TemplateLibraryProgram({required this.name, this.trainerId});
  factory _TemplateLibraryProgram.fromJson(Map<String, dynamic> json) => _$TemplateLibraryProgramFromJson(json);

@override final  String name;
@override final  String? trainerId;

/// Create a copy of TemplateLibraryProgram
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TemplateLibraryProgramCopyWith<_TemplateLibraryProgram> get copyWith => __$TemplateLibraryProgramCopyWithImpl<_TemplateLibraryProgram>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TemplateLibraryProgramToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TemplateLibraryProgram&&(identical(other.name, name) || other.name == name)&&(identical(other.trainerId, trainerId) || other.trainerId == trainerId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,trainerId);

@override
String toString() {
  return 'TemplateLibraryProgram(name: $name, trainerId: $trainerId)';
}


}

/// @nodoc
abstract mixin class _$TemplateLibraryProgramCopyWith<$Res> implements $TemplateLibraryProgramCopyWith<$Res> {
  factory _$TemplateLibraryProgramCopyWith(_TemplateLibraryProgram value, $Res Function(_TemplateLibraryProgram) _then) = __$TemplateLibraryProgramCopyWithImpl;
@override @useResult
$Res call({
 String name, String? trainerId
});




}
/// @nodoc
class __$TemplateLibraryProgramCopyWithImpl<$Res>
    implements _$TemplateLibraryProgramCopyWith<$Res> {
  __$TemplateLibraryProgramCopyWithImpl(this._self, this._then);

  final _TemplateLibraryProgram _self;
  final $Res Function(_TemplateLibraryProgram) _then;

/// Create a copy of TemplateLibraryProgram
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? trainerId = freezed,}) {
  return _then(_TemplateLibraryProgram(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,trainerId: freezed == trainerId ? _self.trainerId : trainerId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$TemplateLibraryExercise {

 String get id; int get order; String? get type; String? get exerciseId; String? get targetReps; int? get durationSeconds; String? get notes; TemplateLibraryExerciseDetail get exercise;
/// Create a copy of TemplateLibraryExercise
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TemplateLibraryExerciseCopyWith<TemplateLibraryExercise> get copyWith => _$TemplateLibraryExerciseCopyWithImpl<TemplateLibraryExercise>(this as TemplateLibraryExercise, _$identity);

  /// Serializes this TemplateLibraryExercise to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TemplateLibraryExercise&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.type, type) || other.type == type)&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&(identical(other.targetReps, targetReps) || other.targetReps == targetReps)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.exercise, exercise) || other.exercise == exercise));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,type,exerciseId,targetReps,durationSeconds,notes,exercise);

@override
String toString() {
  return 'TemplateLibraryExercise(id: $id, order: $order, type: $type, exerciseId: $exerciseId, targetReps: $targetReps, durationSeconds: $durationSeconds, notes: $notes, exercise: $exercise)';
}


}

/// @nodoc
abstract mixin class $TemplateLibraryExerciseCopyWith<$Res>  {
  factory $TemplateLibraryExerciseCopyWith(TemplateLibraryExercise value, $Res Function(TemplateLibraryExercise) _then) = _$TemplateLibraryExerciseCopyWithImpl;
@useResult
$Res call({
 String id, int order, String? type, String? exerciseId, String? targetReps, int? durationSeconds, String? notes, TemplateLibraryExerciseDetail exercise
});


$TemplateLibraryExerciseDetailCopyWith<$Res> get exercise;

}
/// @nodoc
class _$TemplateLibraryExerciseCopyWithImpl<$Res>
    implements $TemplateLibraryExerciseCopyWith<$Res> {
  _$TemplateLibraryExerciseCopyWithImpl(this._self, this._then);

  final TemplateLibraryExercise _self;
  final $Res Function(TemplateLibraryExercise) _then;

/// Create a copy of TemplateLibraryExercise
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? order = null,Object? type = freezed,Object? exerciseId = freezed,Object? targetReps = freezed,Object? durationSeconds = freezed,Object? notes = freezed,Object? exercise = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,exerciseId: freezed == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String?,targetReps: freezed == targetReps ? _self.targetReps : targetReps // ignore: cast_nullable_to_non_nullable
as String?,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,exercise: null == exercise ? _self.exercise : exercise // ignore: cast_nullable_to_non_nullable
as TemplateLibraryExerciseDetail,
  ));
}
/// Create a copy of TemplateLibraryExercise
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TemplateLibraryExerciseDetailCopyWith<$Res> get exercise {
  
  return $TemplateLibraryExerciseDetailCopyWith<$Res>(_self.exercise, (value) {
    return _then(_self.copyWith(exercise: value));
  });
}
}


/// Adds pattern-matching-related methods to [TemplateLibraryExercise].
extension TemplateLibraryExercisePatterns on TemplateLibraryExercise {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TemplateLibraryExercise value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TemplateLibraryExercise() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TemplateLibraryExercise value)  $default,){
final _that = this;
switch (_that) {
case _TemplateLibraryExercise():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TemplateLibraryExercise value)?  $default,){
final _that = this;
switch (_that) {
case _TemplateLibraryExercise() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int order,  String? type,  String? exerciseId,  String? targetReps,  int? durationSeconds,  String? notes,  TemplateLibraryExerciseDetail exercise)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TemplateLibraryExercise() when $default != null:
return $default(_that.id,_that.order,_that.type,_that.exerciseId,_that.targetReps,_that.durationSeconds,_that.notes,_that.exercise);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int order,  String? type,  String? exerciseId,  String? targetReps,  int? durationSeconds,  String? notes,  TemplateLibraryExerciseDetail exercise)  $default,) {final _that = this;
switch (_that) {
case _TemplateLibraryExercise():
return $default(_that.id,_that.order,_that.type,_that.exerciseId,_that.targetReps,_that.durationSeconds,_that.notes,_that.exercise);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int order,  String? type,  String? exerciseId,  String? targetReps,  int? durationSeconds,  String? notes,  TemplateLibraryExerciseDetail exercise)?  $default,) {final _that = this;
switch (_that) {
case _TemplateLibraryExercise() when $default != null:
return $default(_that.id,_that.order,_that.type,_that.exerciseId,_that.targetReps,_that.durationSeconds,_that.notes,_that.exercise);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TemplateLibraryExercise implements TemplateLibraryExercise {
  const _TemplateLibraryExercise({required this.id, this.order = 0, this.type, this.exerciseId, this.targetReps, this.durationSeconds, this.notes, required this.exercise});
  factory _TemplateLibraryExercise.fromJson(Map<String, dynamic> json) => _$TemplateLibraryExerciseFromJson(json);

@override final  String id;
@override@JsonKey() final  int order;
@override final  String? type;
@override final  String? exerciseId;
@override final  String? targetReps;
@override final  int? durationSeconds;
@override final  String? notes;
@override final  TemplateLibraryExerciseDetail exercise;

/// Create a copy of TemplateLibraryExercise
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TemplateLibraryExerciseCopyWith<_TemplateLibraryExercise> get copyWith => __$TemplateLibraryExerciseCopyWithImpl<_TemplateLibraryExercise>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TemplateLibraryExerciseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TemplateLibraryExercise&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.type, type) || other.type == type)&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&(identical(other.targetReps, targetReps) || other.targetReps == targetReps)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.exercise, exercise) || other.exercise == exercise));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,type,exerciseId,targetReps,durationSeconds,notes,exercise);

@override
String toString() {
  return 'TemplateLibraryExercise(id: $id, order: $order, type: $type, exerciseId: $exerciseId, targetReps: $targetReps, durationSeconds: $durationSeconds, notes: $notes, exercise: $exercise)';
}


}

/// @nodoc
abstract mixin class _$TemplateLibraryExerciseCopyWith<$Res> implements $TemplateLibraryExerciseCopyWith<$Res> {
  factory _$TemplateLibraryExerciseCopyWith(_TemplateLibraryExercise value, $Res Function(_TemplateLibraryExercise) _then) = __$TemplateLibraryExerciseCopyWithImpl;
@override @useResult
$Res call({
 String id, int order, String? type, String? exerciseId, String? targetReps, int? durationSeconds, String? notes, TemplateLibraryExerciseDetail exercise
});


@override $TemplateLibraryExerciseDetailCopyWith<$Res> get exercise;

}
/// @nodoc
class __$TemplateLibraryExerciseCopyWithImpl<$Res>
    implements _$TemplateLibraryExerciseCopyWith<$Res> {
  __$TemplateLibraryExerciseCopyWithImpl(this._self, this._then);

  final _TemplateLibraryExercise _self;
  final $Res Function(_TemplateLibraryExercise) _then;

/// Create a copy of TemplateLibraryExercise
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? order = null,Object? type = freezed,Object? exerciseId = freezed,Object? targetReps = freezed,Object? durationSeconds = freezed,Object? notes = freezed,Object? exercise = null,}) {
  return _then(_TemplateLibraryExercise(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,exerciseId: freezed == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String?,targetReps: freezed == targetReps ? _self.targetReps : targetReps // ignore: cast_nullable_to_non_nullable
as String?,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,exercise: null == exercise ? _self.exercise : exercise // ignore: cast_nullable_to_non_nullable
as TemplateLibraryExerciseDetail,
  ));
}

/// Create a copy of TemplateLibraryExercise
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TemplateLibraryExerciseDetailCopyWith<$Res> get exercise {
  
  return $TemplateLibraryExerciseDetailCopyWith<$Res>(_self.exercise, (value) {
    return _then(_self.copyWith(exercise: value));
  });
}
}


/// @nodoc
mixin _$TemplateLibraryExerciseDetail {

 String get id; String get name; String? get muscleGroup; String? get equipment;
/// Create a copy of TemplateLibraryExerciseDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TemplateLibraryExerciseDetailCopyWith<TemplateLibraryExerciseDetail> get copyWith => _$TemplateLibraryExerciseDetailCopyWithImpl<TemplateLibraryExerciseDetail>(this as TemplateLibraryExerciseDetail, _$identity);

  /// Serializes this TemplateLibraryExerciseDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TemplateLibraryExerciseDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.muscleGroup, muscleGroup) || other.muscleGroup == muscleGroup)&&(identical(other.equipment, equipment) || other.equipment == equipment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,muscleGroup,equipment);

@override
String toString() {
  return 'TemplateLibraryExerciseDetail(id: $id, name: $name, muscleGroup: $muscleGroup, equipment: $equipment)';
}


}

/// @nodoc
abstract mixin class $TemplateLibraryExerciseDetailCopyWith<$Res>  {
  factory $TemplateLibraryExerciseDetailCopyWith(TemplateLibraryExerciseDetail value, $Res Function(TemplateLibraryExerciseDetail) _then) = _$TemplateLibraryExerciseDetailCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? muscleGroup, String? equipment
});




}
/// @nodoc
class _$TemplateLibraryExerciseDetailCopyWithImpl<$Res>
    implements $TemplateLibraryExerciseDetailCopyWith<$Res> {
  _$TemplateLibraryExerciseDetailCopyWithImpl(this._self, this._then);

  final TemplateLibraryExerciseDetail _self;
  final $Res Function(TemplateLibraryExerciseDetail) _then;

/// Create a copy of TemplateLibraryExerciseDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? muscleGroup = freezed,Object? equipment = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,muscleGroup: freezed == muscleGroup ? _self.muscleGroup : muscleGroup // ignore: cast_nullable_to_non_nullable
as String?,equipment: freezed == equipment ? _self.equipment : equipment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TemplateLibraryExerciseDetail].
extension TemplateLibraryExerciseDetailPatterns on TemplateLibraryExerciseDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TemplateLibraryExerciseDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TemplateLibraryExerciseDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TemplateLibraryExerciseDetail value)  $default,){
final _that = this;
switch (_that) {
case _TemplateLibraryExerciseDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TemplateLibraryExerciseDetail value)?  $default,){
final _that = this;
switch (_that) {
case _TemplateLibraryExerciseDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? muscleGroup,  String? equipment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TemplateLibraryExerciseDetail() when $default != null:
return $default(_that.id,_that.name,_that.muscleGroup,_that.equipment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? muscleGroup,  String? equipment)  $default,) {final _that = this;
switch (_that) {
case _TemplateLibraryExerciseDetail():
return $default(_that.id,_that.name,_that.muscleGroup,_that.equipment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? muscleGroup,  String? equipment)?  $default,) {final _that = this;
switch (_that) {
case _TemplateLibraryExerciseDetail() when $default != null:
return $default(_that.id,_that.name,_that.muscleGroup,_that.equipment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TemplateLibraryExerciseDetail implements TemplateLibraryExerciseDetail {
  const _TemplateLibraryExerciseDetail({required this.id, required this.name, this.muscleGroup, this.equipment});
  factory _TemplateLibraryExerciseDetail.fromJson(Map<String, dynamic> json) => _$TemplateLibraryExerciseDetailFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? muscleGroup;
@override final  String? equipment;

/// Create a copy of TemplateLibraryExerciseDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TemplateLibraryExerciseDetailCopyWith<_TemplateLibraryExerciseDetail> get copyWith => __$TemplateLibraryExerciseDetailCopyWithImpl<_TemplateLibraryExerciseDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TemplateLibraryExerciseDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TemplateLibraryExerciseDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.muscleGroup, muscleGroup) || other.muscleGroup == muscleGroup)&&(identical(other.equipment, equipment) || other.equipment == equipment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,muscleGroup,equipment);

@override
String toString() {
  return 'TemplateLibraryExerciseDetail(id: $id, name: $name, muscleGroup: $muscleGroup, equipment: $equipment)';
}


}

/// @nodoc
abstract mixin class _$TemplateLibraryExerciseDetailCopyWith<$Res> implements $TemplateLibraryExerciseDetailCopyWith<$Res> {
  factory _$TemplateLibraryExerciseDetailCopyWith(_TemplateLibraryExerciseDetail value, $Res Function(_TemplateLibraryExerciseDetail) _then) = __$TemplateLibraryExerciseDetailCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? muscleGroup, String? equipment
});




}
/// @nodoc
class __$TemplateLibraryExerciseDetailCopyWithImpl<$Res>
    implements _$TemplateLibraryExerciseDetailCopyWith<$Res> {
  __$TemplateLibraryExerciseDetailCopyWithImpl(this._self, this._then);

  final _TemplateLibraryExerciseDetail _self;
  final $Res Function(_TemplateLibraryExerciseDetail) _then;

/// Create a copy of TemplateLibraryExerciseDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? muscleGroup = freezed,Object? equipment = freezed,}) {
  return _then(_TemplateLibraryExerciseDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,muscleGroup: freezed == muscleGroup ? _self.muscleGroup : muscleGroup // ignore: cast_nullable_to_non_nullable
as String?,equipment: freezed == equipment ? _self.equipment : equipment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
