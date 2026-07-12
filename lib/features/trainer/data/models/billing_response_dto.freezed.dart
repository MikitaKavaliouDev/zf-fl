// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'billing_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BillingOnboardingDto {

 String get url;
/// Create a copy of BillingOnboardingDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BillingOnboardingDtoCopyWith<BillingOnboardingDto> get copyWith => _$BillingOnboardingDtoCopyWithImpl<BillingOnboardingDto>(this as BillingOnboardingDto, _$identity);

  /// Serializes this BillingOnboardingDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BillingOnboardingDto&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url);

@override
String toString() {
  return 'BillingOnboardingDto(url: $url)';
}


}

/// @nodoc
abstract mixin class $BillingOnboardingDtoCopyWith<$Res>  {
  factory $BillingOnboardingDtoCopyWith(BillingOnboardingDto value, $Res Function(BillingOnboardingDto) _then) = _$BillingOnboardingDtoCopyWithImpl;
@useResult
$Res call({
 String url
});




}
/// @nodoc
class _$BillingOnboardingDtoCopyWithImpl<$Res>
    implements $BillingOnboardingDtoCopyWith<$Res> {
  _$BillingOnboardingDtoCopyWithImpl(this._self, this._then);

  final BillingOnboardingDto _self;
  final $Res Function(BillingOnboardingDto) _then;

/// Create a copy of BillingOnboardingDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,}) {
  return _then(_self.copyWith(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BillingOnboardingDto].
extension BillingOnboardingDtoPatterns on BillingOnboardingDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BillingOnboardingDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BillingOnboardingDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BillingOnboardingDto value)  $default,){
final _that = this;
switch (_that) {
case _BillingOnboardingDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BillingOnboardingDto value)?  $default,){
final _that = this;
switch (_that) {
case _BillingOnboardingDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BillingOnboardingDto() when $default != null:
return $default(_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String url)  $default,) {final _that = this;
switch (_that) {
case _BillingOnboardingDto():
return $default(_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String url)?  $default,) {final _that = this;
switch (_that) {
case _BillingOnboardingDto() when $default != null:
return $default(_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BillingOnboardingDto implements BillingOnboardingDto {
  const _BillingOnboardingDto({required this.url});
  factory _BillingOnboardingDto.fromJson(Map<String, dynamic> json) => _$BillingOnboardingDtoFromJson(json);

@override final  String url;

/// Create a copy of BillingOnboardingDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BillingOnboardingDtoCopyWith<_BillingOnboardingDto> get copyWith => __$BillingOnboardingDtoCopyWithImpl<_BillingOnboardingDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BillingOnboardingDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BillingOnboardingDto&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url);

@override
String toString() {
  return 'BillingOnboardingDto(url: $url)';
}


}

/// @nodoc
abstract mixin class _$BillingOnboardingDtoCopyWith<$Res> implements $BillingOnboardingDtoCopyWith<$Res> {
  factory _$BillingOnboardingDtoCopyWith(_BillingOnboardingDto value, $Res Function(_BillingOnboardingDto) _then) = __$BillingOnboardingDtoCopyWithImpl;
@override @useResult
$Res call({
 String url
});




}
/// @nodoc
class __$BillingOnboardingDtoCopyWithImpl<$Res>
    implements _$BillingOnboardingDtoCopyWith<$Res> {
  __$BillingOnboardingDtoCopyWithImpl(this._self, this._then);

  final _BillingOnboardingDto _self;
  final $Res Function(_BillingOnboardingDto) _then;

/// Create a copy of BillingOnboardingDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,}) {
  return _then(_BillingOnboardingDto(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SubscriptionUpdateResponse {

 bool get success; String? get url;
/// Create a copy of SubscriptionUpdateResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionUpdateResponseCopyWith<SubscriptionUpdateResponse> get copyWith => _$SubscriptionUpdateResponseCopyWithImpl<SubscriptionUpdateResponse>(this as SubscriptionUpdateResponse, _$identity);

  /// Serializes this SubscriptionUpdateResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionUpdateResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,url);

@override
String toString() {
  return 'SubscriptionUpdateResponse(success: $success, url: $url)';
}


}

/// @nodoc
abstract mixin class $SubscriptionUpdateResponseCopyWith<$Res>  {
  factory $SubscriptionUpdateResponseCopyWith(SubscriptionUpdateResponse value, $Res Function(SubscriptionUpdateResponse) _then) = _$SubscriptionUpdateResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String? url
});




}
/// @nodoc
class _$SubscriptionUpdateResponseCopyWithImpl<$Res>
    implements $SubscriptionUpdateResponseCopyWith<$Res> {
  _$SubscriptionUpdateResponseCopyWithImpl(this._self, this._then);

  final SubscriptionUpdateResponse _self;
  final $Res Function(SubscriptionUpdateResponse) _then;

/// Create a copy of SubscriptionUpdateResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? url = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SubscriptionUpdateResponse].
extension SubscriptionUpdateResponsePatterns on SubscriptionUpdateResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubscriptionUpdateResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubscriptionUpdateResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubscriptionUpdateResponse value)  $default,){
final _that = this;
switch (_that) {
case _SubscriptionUpdateResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubscriptionUpdateResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SubscriptionUpdateResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String? url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubscriptionUpdateResponse() when $default != null:
return $default(_that.success,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String? url)  $default,) {final _that = this;
switch (_that) {
case _SubscriptionUpdateResponse():
return $default(_that.success,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String? url)?  $default,) {final _that = this;
switch (_that) {
case _SubscriptionUpdateResponse() when $default != null:
return $default(_that.success,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubscriptionUpdateResponse implements SubscriptionUpdateResponse {
  const _SubscriptionUpdateResponse({required this.success, this.url});
  factory _SubscriptionUpdateResponse.fromJson(Map<String, dynamic> json) => _$SubscriptionUpdateResponseFromJson(json);

@override final  bool success;
@override final  String? url;

/// Create a copy of SubscriptionUpdateResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscriptionUpdateResponseCopyWith<_SubscriptionUpdateResponse> get copyWith => __$SubscriptionUpdateResponseCopyWithImpl<_SubscriptionUpdateResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubscriptionUpdateResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscriptionUpdateResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,url);

@override
String toString() {
  return 'SubscriptionUpdateResponse(success: $success, url: $url)';
}


}

/// @nodoc
abstract mixin class _$SubscriptionUpdateResponseCopyWith<$Res> implements $SubscriptionUpdateResponseCopyWith<$Res> {
  factory _$SubscriptionUpdateResponseCopyWith(_SubscriptionUpdateResponse value, $Res Function(_SubscriptionUpdateResponse) _then) = __$SubscriptionUpdateResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String? url
});




}
/// @nodoc
class __$SubscriptionUpdateResponseCopyWithImpl<$Res>
    implements _$SubscriptionUpdateResponseCopyWith<$Res> {
  __$SubscriptionUpdateResponseCopyWithImpl(this._self, this._then);

  final _SubscriptionUpdateResponse _self;
  final $Res Function(_SubscriptionUpdateResponse) _then;

/// Create a copy of SubscriptionUpdateResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? url = freezed,}) {
  return _then(_SubscriptionUpdateResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
