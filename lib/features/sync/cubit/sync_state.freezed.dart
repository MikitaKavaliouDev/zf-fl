// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SyncState {

 bool get isOnline; int get lastSyncAt;
/// Create a copy of SyncState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncStateCopyWith<SyncState> get copyWith => _$SyncStateCopyWithImpl<SyncState>(this as SyncState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncState&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.lastSyncAt, lastSyncAt) || other.lastSyncAt == lastSyncAt));
}


@override
int get hashCode => Object.hash(runtimeType,isOnline,lastSyncAt);

@override
String toString() {
  return 'SyncState(isOnline: $isOnline, lastSyncAt: $lastSyncAt)';
}


}

/// @nodoc
abstract mixin class $SyncStateCopyWith<$Res>  {
  factory $SyncStateCopyWith(SyncState value, $Res Function(SyncState) _then) = _$SyncStateCopyWithImpl;
@useResult
$Res call({
 bool isOnline, int lastSyncAt
});




}
/// @nodoc
class _$SyncStateCopyWithImpl<$Res>
    implements $SyncStateCopyWith<$Res> {
  _$SyncStateCopyWithImpl(this._self, this._then);

  final SyncState _self;
  final $Res Function(SyncState) _then;

/// Create a copy of SyncState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isOnline = null,Object? lastSyncAt = null,}) {
  return _then(_self.copyWith(
isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,lastSyncAt: null == lastSyncAt ? _self.lastSyncAt : lastSyncAt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SyncState].
extension SyncStatePatterns on SyncState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SyncIdle value)?  idle,TResult Function( SyncInProgress value)?  syncing,TResult Function( SyncError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SyncIdle() when idle != null:
return idle(_that);case SyncInProgress() when syncing != null:
return syncing(_that);case SyncError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SyncIdle value)  idle,required TResult Function( SyncInProgress value)  syncing,required TResult Function( SyncError value)  error,}){
final _that = this;
switch (_that) {
case SyncIdle():
return idle(_that);case SyncInProgress():
return syncing(_that);case SyncError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SyncIdle value)?  idle,TResult? Function( SyncInProgress value)?  syncing,TResult? Function( SyncError value)?  error,}){
final _that = this;
switch (_that) {
case SyncIdle() when idle != null:
return idle(_that);case SyncInProgress() when syncing != null:
return syncing(_that);case SyncError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool isOnline,  int lastSyncAt)?  idle,TResult Function( bool isOnline,  int lastSyncAt,  String? currentTable,  double progress)?  syncing,TResult Function( bool isOnline,  int lastSyncAt,  String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SyncIdle() when idle != null:
return idle(_that.isOnline,_that.lastSyncAt);case SyncInProgress() when syncing != null:
return syncing(_that.isOnline,_that.lastSyncAt,_that.currentTable,_that.progress);case SyncError() when error != null:
return error(_that.isOnline,_that.lastSyncAt,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool isOnline,  int lastSyncAt)  idle,required TResult Function( bool isOnline,  int lastSyncAt,  String? currentTable,  double progress)  syncing,required TResult Function( bool isOnline,  int lastSyncAt,  String message)  error,}) {final _that = this;
switch (_that) {
case SyncIdle():
return idle(_that.isOnline,_that.lastSyncAt);case SyncInProgress():
return syncing(_that.isOnline,_that.lastSyncAt,_that.currentTable,_that.progress);case SyncError():
return error(_that.isOnline,_that.lastSyncAt,_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool isOnline,  int lastSyncAt)?  idle,TResult? Function( bool isOnline,  int lastSyncAt,  String? currentTable,  double progress)?  syncing,TResult? Function( bool isOnline,  int lastSyncAt,  String message)?  error,}) {final _that = this;
switch (_that) {
case SyncIdle() when idle != null:
return idle(_that.isOnline,_that.lastSyncAt);case SyncInProgress() when syncing != null:
return syncing(_that.isOnline,_that.lastSyncAt,_that.currentTable,_that.progress);case SyncError() when error != null:
return error(_that.isOnline,_that.lastSyncAt,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class SyncIdle implements SyncState {
  const SyncIdle({this.isOnline = true, this.lastSyncAt = 0});
  

@override@JsonKey() final  bool isOnline;
@override@JsonKey() final  int lastSyncAt;

/// Create a copy of SyncState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncIdleCopyWith<SyncIdle> get copyWith => _$SyncIdleCopyWithImpl<SyncIdle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncIdle&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.lastSyncAt, lastSyncAt) || other.lastSyncAt == lastSyncAt));
}


@override
int get hashCode => Object.hash(runtimeType,isOnline,lastSyncAt);

@override
String toString() {
  return 'SyncState.idle(isOnline: $isOnline, lastSyncAt: $lastSyncAt)';
}


}

/// @nodoc
abstract mixin class $SyncIdleCopyWith<$Res> implements $SyncStateCopyWith<$Res> {
  factory $SyncIdleCopyWith(SyncIdle value, $Res Function(SyncIdle) _then) = _$SyncIdleCopyWithImpl;
@override @useResult
$Res call({
 bool isOnline, int lastSyncAt
});




}
/// @nodoc
class _$SyncIdleCopyWithImpl<$Res>
    implements $SyncIdleCopyWith<$Res> {
  _$SyncIdleCopyWithImpl(this._self, this._then);

  final SyncIdle _self;
  final $Res Function(SyncIdle) _then;

/// Create a copy of SyncState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isOnline = null,Object? lastSyncAt = null,}) {
  return _then(SyncIdle(
isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,lastSyncAt: null == lastSyncAt ? _self.lastSyncAt : lastSyncAt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class SyncInProgress implements SyncState {
  const SyncInProgress({required this.isOnline, required this.lastSyncAt, this.currentTable, this.progress = 0.0});
  

@override final  bool isOnline;
@override final  int lastSyncAt;
 final  String? currentTable;
@JsonKey() final  double progress;

/// Create a copy of SyncState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncInProgressCopyWith<SyncInProgress> get copyWith => _$SyncInProgressCopyWithImpl<SyncInProgress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncInProgress&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.lastSyncAt, lastSyncAt) || other.lastSyncAt == lastSyncAt)&&(identical(other.currentTable, currentTable) || other.currentTable == currentTable)&&(identical(other.progress, progress) || other.progress == progress));
}


@override
int get hashCode => Object.hash(runtimeType,isOnline,lastSyncAt,currentTable,progress);

@override
String toString() {
  return 'SyncState.syncing(isOnline: $isOnline, lastSyncAt: $lastSyncAt, currentTable: $currentTable, progress: $progress)';
}


}

/// @nodoc
abstract mixin class $SyncInProgressCopyWith<$Res> implements $SyncStateCopyWith<$Res> {
  factory $SyncInProgressCopyWith(SyncInProgress value, $Res Function(SyncInProgress) _then) = _$SyncInProgressCopyWithImpl;
@override @useResult
$Res call({
 bool isOnline, int lastSyncAt, String? currentTable, double progress
});




}
/// @nodoc
class _$SyncInProgressCopyWithImpl<$Res>
    implements $SyncInProgressCopyWith<$Res> {
  _$SyncInProgressCopyWithImpl(this._self, this._then);

  final SyncInProgress _self;
  final $Res Function(SyncInProgress) _then;

/// Create a copy of SyncState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isOnline = null,Object? lastSyncAt = null,Object? currentTable = freezed,Object? progress = null,}) {
  return _then(SyncInProgress(
isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,lastSyncAt: null == lastSyncAt ? _self.lastSyncAt : lastSyncAt // ignore: cast_nullable_to_non_nullable
as int,currentTable: freezed == currentTable ? _self.currentTable : currentTable // ignore: cast_nullable_to_non_nullable
as String?,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class SyncError implements SyncState {
  const SyncError({required this.isOnline, required this.lastSyncAt, required this.message});
  

@override final  bool isOnline;
@override final  int lastSyncAt;
 final  String message;

/// Create a copy of SyncState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncErrorCopyWith<SyncError> get copyWith => _$SyncErrorCopyWithImpl<SyncError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncError&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.lastSyncAt, lastSyncAt) || other.lastSyncAt == lastSyncAt)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,isOnline,lastSyncAt,message);

@override
String toString() {
  return 'SyncState.error(isOnline: $isOnline, lastSyncAt: $lastSyncAt, message: $message)';
}


}

/// @nodoc
abstract mixin class $SyncErrorCopyWith<$Res> implements $SyncStateCopyWith<$Res> {
  factory $SyncErrorCopyWith(SyncError value, $Res Function(SyncError) _then) = _$SyncErrorCopyWithImpl;
@override @useResult
$Res call({
 bool isOnline, int lastSyncAt, String message
});




}
/// @nodoc
class _$SyncErrorCopyWithImpl<$Res>
    implements $SyncErrorCopyWith<$Res> {
  _$SyncErrorCopyWithImpl(this._self, this._then);

  final SyncError _self;
  final $Res Function(SyncError) _then;

/// Create a copy of SyncState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isOnline = null,Object? lastSyncAt = null,Object? message = null,}) {
  return _then(SyncError(
isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,lastSyncAt: null == lastSyncAt ? _self.lastSyncAt : lastSyncAt // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
