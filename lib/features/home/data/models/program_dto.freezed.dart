// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProgramDto {

 String get id; String get name; String? get description; String? get trainerId; String? get category; List<TemplateDto> get templates; List<String> get templateLabels; bool get isScheduled; int? get scheduledStartDate; String? get scheduleFrequency; int get activeTemplateIndex; String? get trainerName; String? get trainerAvatarUrl;/// Source of the program: "assigned", "self", or null.
 String? get source;/// Assignment metadata (only for assigned programs).
 String? get assignmentId; int? get startDate; bool get isActive;
/// Create a copy of ProgramDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramDtoCopyWith<ProgramDto> get copyWith => _$ProgramDtoCopyWithImpl<ProgramDto>(this as ProgramDto, _$identity);

  /// Serializes this ProgramDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.trainerId, trainerId) || other.trainerId == trainerId)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other.templates, templates)&&const DeepCollectionEquality().equals(other.templateLabels, templateLabels)&&(identical(other.isScheduled, isScheduled) || other.isScheduled == isScheduled)&&(identical(other.scheduledStartDate, scheduledStartDate) || other.scheduledStartDate == scheduledStartDate)&&(identical(other.scheduleFrequency, scheduleFrequency) || other.scheduleFrequency == scheduleFrequency)&&(identical(other.activeTemplateIndex, activeTemplateIndex) || other.activeTemplateIndex == activeTemplateIndex)&&(identical(other.trainerName, trainerName) || other.trainerName == trainerName)&&(identical(other.trainerAvatarUrl, trainerAvatarUrl) || other.trainerAvatarUrl == trainerAvatarUrl)&&(identical(other.source, source) || other.source == source)&&(identical(other.assignmentId, assignmentId) || other.assignmentId == assignmentId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,trainerId,category,const DeepCollectionEquality().hash(templates),const DeepCollectionEquality().hash(templateLabels),isScheduled,scheduledStartDate,scheduleFrequency,activeTemplateIndex,trainerName,trainerAvatarUrl,source,assignmentId,startDate,isActive);

@override
String toString() {
  return 'ProgramDto(id: $id, name: $name, description: $description, trainerId: $trainerId, category: $category, templates: $templates, templateLabels: $templateLabels, isScheduled: $isScheduled, scheduledStartDate: $scheduledStartDate, scheduleFrequency: $scheduleFrequency, activeTemplateIndex: $activeTemplateIndex, trainerName: $trainerName, trainerAvatarUrl: $trainerAvatarUrl, source: $source, assignmentId: $assignmentId, startDate: $startDate, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $ProgramDtoCopyWith<$Res>  {
  factory $ProgramDtoCopyWith(ProgramDto value, $Res Function(ProgramDto) _then) = _$ProgramDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description, String? trainerId, String? category, List<TemplateDto> templates, List<String> templateLabels, bool isScheduled, int? scheduledStartDate, String? scheduleFrequency, int activeTemplateIndex, String? trainerName, String? trainerAvatarUrl, String? source, String? assignmentId, int? startDate, bool isActive
});




}
/// @nodoc
class _$ProgramDtoCopyWithImpl<$Res>
    implements $ProgramDtoCopyWith<$Res> {
  _$ProgramDtoCopyWithImpl(this._self, this._then);

  final ProgramDto _self;
  final $Res Function(ProgramDto) _then;

/// Create a copy of ProgramDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? trainerId = freezed,Object? category = freezed,Object? templates = null,Object? templateLabels = null,Object? isScheduled = null,Object? scheduledStartDate = freezed,Object? scheduleFrequency = freezed,Object? activeTemplateIndex = null,Object? trainerName = freezed,Object? trainerAvatarUrl = freezed,Object? source = freezed,Object? assignmentId = freezed,Object? startDate = freezed,Object? isActive = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,trainerId: freezed == trainerId ? _self.trainerId : trainerId // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,templates: null == templates ? _self.templates : templates // ignore: cast_nullable_to_non_nullable
as List<TemplateDto>,templateLabels: null == templateLabels ? _self.templateLabels : templateLabels // ignore: cast_nullable_to_non_nullable
as List<String>,isScheduled: null == isScheduled ? _self.isScheduled : isScheduled // ignore: cast_nullable_to_non_nullable
as bool,scheduledStartDate: freezed == scheduledStartDate ? _self.scheduledStartDate : scheduledStartDate // ignore: cast_nullable_to_non_nullable
as int?,scheduleFrequency: freezed == scheduleFrequency ? _self.scheduleFrequency : scheduleFrequency // ignore: cast_nullable_to_non_nullable
as String?,activeTemplateIndex: null == activeTemplateIndex ? _self.activeTemplateIndex : activeTemplateIndex // ignore: cast_nullable_to_non_nullable
as int,trainerName: freezed == trainerName ? _self.trainerName : trainerName // ignore: cast_nullable_to_non_nullable
as String?,trainerAvatarUrl: freezed == trainerAvatarUrl ? _self.trainerAvatarUrl : trainerAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,assignmentId: freezed == assignmentId ? _self.assignmentId : assignmentId // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as int?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ProgramDto].
extension ProgramDtoPatterns on ProgramDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgramDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgramDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgramDto value)  $default,){
final _that = this;
switch (_that) {
case _ProgramDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgramDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProgramDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  String? trainerId,  String? category,  List<TemplateDto> templates,  List<String> templateLabels,  bool isScheduled,  int? scheduledStartDate,  String? scheduleFrequency,  int activeTemplateIndex,  String? trainerName,  String? trainerAvatarUrl,  String? source,  String? assignmentId,  int? startDate,  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgramDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.trainerId,_that.category,_that.templates,_that.templateLabels,_that.isScheduled,_that.scheduledStartDate,_that.scheduleFrequency,_that.activeTemplateIndex,_that.trainerName,_that.trainerAvatarUrl,_that.source,_that.assignmentId,_that.startDate,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  String? trainerId,  String? category,  List<TemplateDto> templates,  List<String> templateLabels,  bool isScheduled,  int? scheduledStartDate,  String? scheduleFrequency,  int activeTemplateIndex,  String? trainerName,  String? trainerAvatarUrl,  String? source,  String? assignmentId,  int? startDate,  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _ProgramDto():
return $default(_that.id,_that.name,_that.description,_that.trainerId,_that.category,_that.templates,_that.templateLabels,_that.isScheduled,_that.scheduledStartDate,_that.scheduleFrequency,_that.activeTemplateIndex,_that.trainerName,_that.trainerAvatarUrl,_that.source,_that.assignmentId,_that.startDate,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description,  String? trainerId,  String? category,  List<TemplateDto> templates,  List<String> templateLabels,  bool isScheduled,  int? scheduledStartDate,  String? scheduleFrequency,  int activeTemplateIndex,  String? trainerName,  String? trainerAvatarUrl,  String? source,  String? assignmentId,  int? startDate,  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _ProgramDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.trainerId,_that.category,_that.templates,_that.templateLabels,_that.isScheduled,_that.scheduledStartDate,_that.scheduleFrequency,_that.activeTemplateIndex,_that.trainerName,_that.trainerAvatarUrl,_that.source,_that.assignmentId,_that.startDate,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgramDto implements ProgramDto {
  const _ProgramDto({required this.id, required this.name, this.description, this.trainerId, this.category, final  List<TemplateDto> templates = const <TemplateDto>[], final  List<String> templateLabels = const <String>[], this.isScheduled = false, this.scheduledStartDate, this.scheduleFrequency, this.activeTemplateIndex = 0, this.trainerName, this.trainerAvatarUrl, this.source, this.assignmentId, this.startDate, this.isActive = false}): _templates = templates,_templateLabels = templateLabels;
  factory _ProgramDto.fromJson(Map<String, dynamic> json) => _$ProgramDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;
@override final  String? trainerId;
@override final  String? category;
 final  List<TemplateDto> _templates;
@override@JsonKey() List<TemplateDto> get templates {
  if (_templates is EqualUnmodifiableListView) return _templates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_templates);
}

 final  List<String> _templateLabels;
@override@JsonKey() List<String> get templateLabels {
  if (_templateLabels is EqualUnmodifiableListView) return _templateLabels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_templateLabels);
}

@override@JsonKey() final  bool isScheduled;
@override final  int? scheduledStartDate;
@override final  String? scheduleFrequency;
@override@JsonKey() final  int activeTemplateIndex;
@override final  String? trainerName;
@override final  String? trainerAvatarUrl;
/// Source of the program: "assigned", "self", or null.
@override final  String? source;
/// Assignment metadata (only for assigned programs).
@override final  String? assignmentId;
@override final  int? startDate;
@override@JsonKey() final  bool isActive;

/// Create a copy of ProgramDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgramDtoCopyWith<_ProgramDto> get copyWith => __$ProgramDtoCopyWithImpl<_ProgramDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgramDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgramDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.trainerId, trainerId) || other.trainerId == trainerId)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._templates, _templates)&&const DeepCollectionEquality().equals(other._templateLabels, _templateLabels)&&(identical(other.isScheduled, isScheduled) || other.isScheduled == isScheduled)&&(identical(other.scheduledStartDate, scheduledStartDate) || other.scheduledStartDate == scheduledStartDate)&&(identical(other.scheduleFrequency, scheduleFrequency) || other.scheduleFrequency == scheduleFrequency)&&(identical(other.activeTemplateIndex, activeTemplateIndex) || other.activeTemplateIndex == activeTemplateIndex)&&(identical(other.trainerName, trainerName) || other.trainerName == trainerName)&&(identical(other.trainerAvatarUrl, trainerAvatarUrl) || other.trainerAvatarUrl == trainerAvatarUrl)&&(identical(other.source, source) || other.source == source)&&(identical(other.assignmentId, assignmentId) || other.assignmentId == assignmentId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,trainerId,category,const DeepCollectionEquality().hash(_templates),const DeepCollectionEquality().hash(_templateLabels),isScheduled,scheduledStartDate,scheduleFrequency,activeTemplateIndex,trainerName,trainerAvatarUrl,source,assignmentId,startDate,isActive);

@override
String toString() {
  return 'ProgramDto(id: $id, name: $name, description: $description, trainerId: $trainerId, category: $category, templates: $templates, templateLabels: $templateLabels, isScheduled: $isScheduled, scheduledStartDate: $scheduledStartDate, scheduleFrequency: $scheduleFrequency, activeTemplateIndex: $activeTemplateIndex, trainerName: $trainerName, trainerAvatarUrl: $trainerAvatarUrl, source: $source, assignmentId: $assignmentId, startDate: $startDate, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$ProgramDtoCopyWith<$Res> implements $ProgramDtoCopyWith<$Res> {
  factory _$ProgramDtoCopyWith(_ProgramDto value, $Res Function(_ProgramDto) _then) = __$ProgramDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description, String? trainerId, String? category, List<TemplateDto> templates, List<String> templateLabels, bool isScheduled, int? scheduledStartDate, String? scheduleFrequency, int activeTemplateIndex, String? trainerName, String? trainerAvatarUrl, String? source, String? assignmentId, int? startDate, bool isActive
});




}
/// @nodoc
class __$ProgramDtoCopyWithImpl<$Res>
    implements _$ProgramDtoCopyWith<$Res> {
  __$ProgramDtoCopyWithImpl(this._self, this._then);

  final _ProgramDto _self;
  final $Res Function(_ProgramDto) _then;

/// Create a copy of ProgramDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? trainerId = freezed,Object? category = freezed,Object? templates = null,Object? templateLabels = null,Object? isScheduled = null,Object? scheduledStartDate = freezed,Object? scheduleFrequency = freezed,Object? activeTemplateIndex = null,Object? trainerName = freezed,Object? trainerAvatarUrl = freezed,Object? source = freezed,Object? assignmentId = freezed,Object? startDate = freezed,Object? isActive = null,}) {
  return _then(_ProgramDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,trainerId: freezed == trainerId ? _self.trainerId : trainerId // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,templates: null == templates ? _self._templates : templates // ignore: cast_nullable_to_non_nullable
as List<TemplateDto>,templateLabels: null == templateLabels ? _self._templateLabels : templateLabels // ignore: cast_nullable_to_non_nullable
as List<String>,isScheduled: null == isScheduled ? _self.isScheduled : isScheduled // ignore: cast_nullable_to_non_nullable
as bool,scheduledStartDate: freezed == scheduledStartDate ? _self.scheduledStartDate : scheduledStartDate // ignore: cast_nullable_to_non_nullable
as int?,scheduleFrequency: freezed == scheduleFrequency ? _self.scheduleFrequency : scheduleFrequency // ignore: cast_nullable_to_non_nullable
as String?,activeTemplateIndex: null == activeTemplateIndex ? _self.activeTemplateIndex : activeTemplateIndex // ignore: cast_nullable_to_non_nullable
as int,trainerName: freezed == trainerName ? _self.trainerName : trainerName // ignore: cast_nullable_to_non_nullable
as String?,trainerAvatarUrl: freezed == trainerAvatarUrl ? _self.trainerAvatarUrl : trainerAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,assignmentId: freezed == assignmentId ? _self.assignmentId : assignmentId // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as int?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
