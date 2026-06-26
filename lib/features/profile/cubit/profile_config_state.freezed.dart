// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_config_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileConfigState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileConfigState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileConfigState()';
}


}

/// @nodoc
class $ProfileConfigStateCopyWith<$Res>  {
$ProfileConfigStateCopyWith(ProfileConfigState _, $Res Function(ProfileConfigState) __);
}


/// Adds pattern-matching-related methods to [ProfileConfigState].
extension ProfileConfigStatePatterns on ProfileConfigState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProfileConfigInitial value)?  initial,TResult Function( ProfileConfigLoading value)?  loading,TResult Function( ProfileConfigLoaded value)?  loaded,TResult Function( ProfileConfigError value)?  error,TResult Function( ProfileConfigSaveSuccess value)?  saveSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProfileConfigInitial() when initial != null:
return initial(_that);case ProfileConfigLoading() when loading != null:
return loading(_that);case ProfileConfigLoaded() when loaded != null:
return loaded(_that);case ProfileConfigError() when error != null:
return error(_that);case ProfileConfigSaveSuccess() when saveSuccess != null:
return saveSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProfileConfigInitial value)  initial,required TResult Function( ProfileConfigLoading value)  loading,required TResult Function( ProfileConfigLoaded value)  loaded,required TResult Function( ProfileConfigError value)  error,required TResult Function( ProfileConfigSaveSuccess value)  saveSuccess,}){
final _that = this;
switch (_that) {
case ProfileConfigInitial():
return initial(_that);case ProfileConfigLoading():
return loading(_that);case ProfileConfigLoaded():
return loaded(_that);case ProfileConfigError():
return error(_that);case ProfileConfigSaveSuccess():
return saveSuccess(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProfileConfigInitial value)?  initial,TResult? Function( ProfileConfigLoading value)?  loading,TResult? Function( ProfileConfigLoaded value)?  loaded,TResult? Function( ProfileConfigError value)?  error,TResult? Function( ProfileConfigSaveSuccess value)?  saveSuccess,}){
final _that = this;
switch (_that) {
case ProfileConfigInitial() when initial != null:
return initial(_that);case ProfileConfigLoading() when loading != null:
return loading(_that);case ProfileConfigLoaded() when loaded != null:
return loaded(_that);case ProfileConfigError() when error != null:
return error(_that);case ProfileConfigSaveSuccess() when saveSuccess != null:
return saveSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ProfileCoreInfoDto coreInfo,  ProfileTextContentDto? textContent,  bool isSaving,  bool hasUnsavedChanges,  String? avatarUrl)?  loaded,TResult Function( String message)?  error,TResult Function( String message)?  saveSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProfileConfigInitial() when initial != null:
return initial();case ProfileConfigLoading() when loading != null:
return loading();case ProfileConfigLoaded() when loaded != null:
return loaded(_that.coreInfo,_that.textContent,_that.isSaving,_that.hasUnsavedChanges,_that.avatarUrl);case ProfileConfigError() when error != null:
return error(_that.message);case ProfileConfigSaveSuccess() when saveSuccess != null:
return saveSuccess(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ProfileCoreInfoDto coreInfo,  ProfileTextContentDto? textContent,  bool isSaving,  bool hasUnsavedChanges,  String? avatarUrl)  loaded,required TResult Function( String message)  error,required TResult Function( String message)  saveSuccess,}) {final _that = this;
switch (_that) {
case ProfileConfigInitial():
return initial();case ProfileConfigLoading():
return loading();case ProfileConfigLoaded():
return loaded(_that.coreInfo,_that.textContent,_that.isSaving,_that.hasUnsavedChanges,_that.avatarUrl);case ProfileConfigError():
return error(_that.message);case ProfileConfigSaveSuccess():
return saveSuccess(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ProfileCoreInfoDto coreInfo,  ProfileTextContentDto? textContent,  bool isSaving,  bool hasUnsavedChanges,  String? avatarUrl)?  loaded,TResult? Function( String message)?  error,TResult? Function( String message)?  saveSuccess,}) {final _that = this;
switch (_that) {
case ProfileConfigInitial() when initial != null:
return initial();case ProfileConfigLoading() when loading != null:
return loading();case ProfileConfigLoaded() when loaded != null:
return loaded(_that.coreInfo,_that.textContent,_that.isSaving,_that.hasUnsavedChanges,_that.avatarUrl);case ProfileConfigError() when error != null:
return error(_that.message);case ProfileConfigSaveSuccess() when saveSuccess != null:
return saveSuccess(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ProfileConfigInitial implements ProfileConfigState {
  const ProfileConfigInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileConfigInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileConfigState.initial()';
}


}




/// @nodoc


class ProfileConfigLoading implements ProfileConfigState {
  const ProfileConfigLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileConfigLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileConfigState.loading()';
}


}




/// @nodoc


class ProfileConfigLoaded implements ProfileConfigState {
  const ProfileConfigLoaded({required this.coreInfo, this.textContent, this.isSaving = false, this.hasUnsavedChanges = false, this.avatarUrl});
  

 final  ProfileCoreInfoDto coreInfo;
 final  ProfileTextContentDto? textContent;
@JsonKey() final  bool isSaving;
@JsonKey() final  bool hasUnsavedChanges;
 final  String? avatarUrl;

/// Create a copy of ProfileConfigState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileConfigLoadedCopyWith<ProfileConfigLoaded> get copyWith => _$ProfileConfigLoadedCopyWithImpl<ProfileConfigLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileConfigLoaded&&(identical(other.coreInfo, coreInfo) || other.coreInfo == coreInfo)&&(identical(other.textContent, textContent) || other.textContent == textContent)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.hasUnsavedChanges, hasUnsavedChanges) || other.hasUnsavedChanges == hasUnsavedChanges)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}


@override
int get hashCode => Object.hash(runtimeType,coreInfo,textContent,isSaving,hasUnsavedChanges,avatarUrl);

@override
String toString() {
  return 'ProfileConfigState.loaded(coreInfo: $coreInfo, textContent: $textContent, isSaving: $isSaving, hasUnsavedChanges: $hasUnsavedChanges, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $ProfileConfigLoadedCopyWith<$Res> implements $ProfileConfigStateCopyWith<$Res> {
  factory $ProfileConfigLoadedCopyWith(ProfileConfigLoaded value, $Res Function(ProfileConfigLoaded) _then) = _$ProfileConfigLoadedCopyWithImpl;
@useResult
$Res call({
 ProfileCoreInfoDto coreInfo, ProfileTextContentDto? textContent, bool isSaving, bool hasUnsavedChanges, String? avatarUrl
});


$ProfileCoreInfoDtoCopyWith<$Res> get coreInfo;$ProfileTextContentDtoCopyWith<$Res>? get textContent;

}
/// @nodoc
class _$ProfileConfigLoadedCopyWithImpl<$Res>
    implements $ProfileConfigLoadedCopyWith<$Res> {
  _$ProfileConfigLoadedCopyWithImpl(this._self, this._then);

  final ProfileConfigLoaded _self;
  final $Res Function(ProfileConfigLoaded) _then;

/// Create a copy of ProfileConfigState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? coreInfo = null,Object? textContent = freezed,Object? isSaving = null,Object? hasUnsavedChanges = null,Object? avatarUrl = freezed,}) {
  return _then(ProfileConfigLoaded(
coreInfo: null == coreInfo ? _self.coreInfo : coreInfo // ignore: cast_nullable_to_non_nullable
as ProfileCoreInfoDto,textContent: freezed == textContent ? _self.textContent : textContent // ignore: cast_nullable_to_non_nullable
as ProfileTextContentDto?,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,hasUnsavedChanges: null == hasUnsavedChanges ? _self.hasUnsavedChanges : hasUnsavedChanges // ignore: cast_nullable_to_non_nullable
as bool,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ProfileConfigState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileCoreInfoDtoCopyWith<$Res> get coreInfo {
  
  return $ProfileCoreInfoDtoCopyWith<$Res>(_self.coreInfo, (value) {
    return _then(_self.copyWith(coreInfo: value));
  });
}/// Create a copy of ProfileConfigState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileTextContentDtoCopyWith<$Res>? get textContent {
    if (_self.textContent == null) {
    return null;
  }

  return $ProfileTextContentDtoCopyWith<$Res>(_self.textContent!, (value) {
    return _then(_self.copyWith(textContent: value));
  });
}
}

/// @nodoc


class ProfileConfigError implements ProfileConfigState {
  const ProfileConfigError(this.message);
  

 final  String message;

/// Create a copy of ProfileConfigState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileConfigErrorCopyWith<ProfileConfigError> get copyWith => _$ProfileConfigErrorCopyWithImpl<ProfileConfigError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileConfigError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProfileConfigState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ProfileConfigErrorCopyWith<$Res> implements $ProfileConfigStateCopyWith<$Res> {
  factory $ProfileConfigErrorCopyWith(ProfileConfigError value, $Res Function(ProfileConfigError) _then) = _$ProfileConfigErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ProfileConfigErrorCopyWithImpl<$Res>
    implements $ProfileConfigErrorCopyWith<$Res> {
  _$ProfileConfigErrorCopyWithImpl(this._self, this._then);

  final ProfileConfigError _self;
  final $Res Function(ProfileConfigError) _then;

/// Create a copy of ProfileConfigState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ProfileConfigError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProfileConfigSaveSuccess implements ProfileConfigState {
  const ProfileConfigSaveSuccess(this.message);
  

 final  String message;

/// Create a copy of ProfileConfigState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileConfigSaveSuccessCopyWith<ProfileConfigSaveSuccess> get copyWith => _$ProfileConfigSaveSuccessCopyWithImpl<ProfileConfigSaveSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileConfigSaveSuccess&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProfileConfigState.saveSuccess(message: $message)';
}


}

/// @nodoc
abstract mixin class $ProfileConfigSaveSuccessCopyWith<$Res> implements $ProfileConfigStateCopyWith<$Res> {
  factory $ProfileConfigSaveSuccessCopyWith(ProfileConfigSaveSuccess value, $Res Function(ProfileConfigSaveSuccess) _then) = _$ProfileConfigSaveSuccessCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ProfileConfigSaveSuccessCopyWithImpl<$Res>
    implements $ProfileConfigSaveSuccessCopyWith<$Res> {
  _$ProfileConfigSaveSuccessCopyWithImpl(this._self, this._then);

  final ProfileConfigSaveSuccess _self;
  final $Res Function(ProfileConfigSaveSuccess) _then;

/// Create a copy of ProfileConfigState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ProfileConfigSaveSuccess(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
