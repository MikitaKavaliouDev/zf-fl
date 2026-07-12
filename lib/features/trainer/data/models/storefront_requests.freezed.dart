// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'storefront_requests.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateCoreInfoRequest {

 String get name; String get username; String? get certifications; String? get phone; List<String> get specialties;
/// Create a copy of UpdateCoreInfoRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateCoreInfoRequestCopyWith<UpdateCoreInfoRequest> get copyWith => _$UpdateCoreInfoRequestCopyWithImpl<UpdateCoreInfoRequest>(this as UpdateCoreInfoRequest, _$identity);

  /// Serializes this UpdateCoreInfoRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateCoreInfoRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.certifications, certifications) || other.certifications == certifications)&&(identical(other.phone, phone) || other.phone == phone)&&const DeepCollectionEquality().equals(other.specialties, specialties));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,username,certifications,phone,const DeepCollectionEquality().hash(specialties));

@override
String toString() {
  return 'UpdateCoreInfoRequest(name: $name, username: $username, certifications: $certifications, phone: $phone, specialties: $specialties)';
}


}

/// @nodoc
abstract mixin class $UpdateCoreInfoRequestCopyWith<$Res>  {
  factory $UpdateCoreInfoRequestCopyWith(UpdateCoreInfoRequest value, $Res Function(UpdateCoreInfoRequest) _then) = _$UpdateCoreInfoRequestCopyWithImpl;
@useResult
$Res call({
 String name, String username, String? certifications, String? phone, List<String> specialties
});




}
/// @nodoc
class _$UpdateCoreInfoRequestCopyWithImpl<$Res>
    implements $UpdateCoreInfoRequestCopyWith<$Res> {
  _$UpdateCoreInfoRequestCopyWithImpl(this._self, this._then);

  final UpdateCoreInfoRequest _self;
  final $Res Function(UpdateCoreInfoRequest) _then;

/// Create a copy of UpdateCoreInfoRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? username = null,Object? certifications = freezed,Object? phone = freezed,Object? specialties = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,certifications: freezed == certifications ? _self.certifications : certifications // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,specialties: null == specialties ? _self.specialties : specialties // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateCoreInfoRequest].
extension UpdateCoreInfoRequestPatterns on UpdateCoreInfoRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateCoreInfoRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateCoreInfoRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateCoreInfoRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateCoreInfoRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateCoreInfoRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateCoreInfoRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String username,  String? certifications,  String? phone,  List<String> specialties)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateCoreInfoRequest() when $default != null:
return $default(_that.name,_that.username,_that.certifications,_that.phone,_that.specialties);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String username,  String? certifications,  String? phone,  List<String> specialties)  $default,) {final _that = this;
switch (_that) {
case _UpdateCoreInfoRequest():
return $default(_that.name,_that.username,_that.certifications,_that.phone,_that.specialties);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String username,  String? certifications,  String? phone,  List<String> specialties)?  $default,) {final _that = this;
switch (_that) {
case _UpdateCoreInfoRequest() when $default != null:
return $default(_that.name,_that.username,_that.certifications,_that.phone,_that.specialties);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateCoreInfoRequest implements UpdateCoreInfoRequest {
  const _UpdateCoreInfoRequest({required this.name, required this.username, this.certifications, this.phone, final  List<String> specialties = const []}): _specialties = specialties;
  factory _UpdateCoreInfoRequest.fromJson(Map<String, dynamic> json) => _$UpdateCoreInfoRequestFromJson(json);

@override final  String name;
@override final  String username;
@override final  String? certifications;
@override final  String? phone;
 final  List<String> _specialties;
@override@JsonKey() List<String> get specialties {
  if (_specialties is EqualUnmodifiableListView) return _specialties;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_specialties);
}


/// Create a copy of UpdateCoreInfoRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateCoreInfoRequestCopyWith<_UpdateCoreInfoRequest> get copyWith => __$UpdateCoreInfoRequestCopyWithImpl<_UpdateCoreInfoRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateCoreInfoRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateCoreInfoRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.certifications, certifications) || other.certifications == certifications)&&(identical(other.phone, phone) || other.phone == phone)&&const DeepCollectionEquality().equals(other._specialties, _specialties));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,username,certifications,phone,const DeepCollectionEquality().hash(_specialties));

@override
String toString() {
  return 'UpdateCoreInfoRequest(name: $name, username: $username, certifications: $certifications, phone: $phone, specialties: $specialties)';
}


}

/// @nodoc
abstract mixin class _$UpdateCoreInfoRequestCopyWith<$Res> implements $UpdateCoreInfoRequestCopyWith<$Res> {
  factory _$UpdateCoreInfoRequestCopyWith(_UpdateCoreInfoRequest value, $Res Function(_UpdateCoreInfoRequest) _then) = __$UpdateCoreInfoRequestCopyWithImpl;
@override @useResult
$Res call({
 String name, String username, String? certifications, String? phone, List<String> specialties
});




}
/// @nodoc
class __$UpdateCoreInfoRequestCopyWithImpl<$Res>
    implements _$UpdateCoreInfoRequestCopyWith<$Res> {
  __$UpdateCoreInfoRequestCopyWithImpl(this._self, this._then);

  final _UpdateCoreInfoRequest _self;
  final $Res Function(_UpdateCoreInfoRequest) _then;

/// Create a copy of UpdateCoreInfoRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? username = null,Object? certifications = freezed,Object? phone = freezed,Object? specialties = null,}) {
  return _then(_UpdateCoreInfoRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,certifications: freezed == certifications ? _self.certifications : certifications // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,specialties: null == specialties ? _self._specialties : specialties // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$TextContentRequest {

 String get fieldName; String get content;
/// Create a copy of TextContentRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextContentRequestCopyWith<TextContentRequest> get copyWith => _$TextContentRequestCopyWithImpl<TextContentRequest>(this as TextContentRequest, _$identity);

  /// Serializes this TextContentRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TextContentRequest&&(identical(other.fieldName, fieldName) || other.fieldName == fieldName)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fieldName,content);

@override
String toString() {
  return 'TextContentRequest(fieldName: $fieldName, content: $content)';
}


}

/// @nodoc
abstract mixin class $TextContentRequestCopyWith<$Res>  {
  factory $TextContentRequestCopyWith(TextContentRequest value, $Res Function(TextContentRequest) _then) = _$TextContentRequestCopyWithImpl;
@useResult
$Res call({
 String fieldName, String content
});




}
/// @nodoc
class _$TextContentRequestCopyWithImpl<$Res>
    implements $TextContentRequestCopyWith<$Res> {
  _$TextContentRequestCopyWithImpl(this._self, this._then);

  final TextContentRequest _self;
  final $Res Function(TextContentRequest) _then;

/// Create a copy of TextContentRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fieldName = null,Object? content = null,}) {
  return _then(_self.copyWith(
fieldName: null == fieldName ? _self.fieldName : fieldName // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TextContentRequest].
extension TextContentRequestPatterns on TextContentRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TextContentRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TextContentRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TextContentRequest value)  $default,){
final _that = this;
switch (_that) {
case _TextContentRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TextContentRequest value)?  $default,){
final _that = this;
switch (_that) {
case _TextContentRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fieldName,  String content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TextContentRequest() when $default != null:
return $default(_that.fieldName,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fieldName,  String content)  $default,) {final _that = this;
switch (_that) {
case _TextContentRequest():
return $default(_that.fieldName,_that.content);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fieldName,  String content)?  $default,) {final _that = this;
switch (_that) {
case _TextContentRequest() when $default != null:
return $default(_that.fieldName,_that.content);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TextContentRequest implements TextContentRequest {
  const _TextContentRequest({required this.fieldName, required this.content});
  factory _TextContentRequest.fromJson(Map<String, dynamic> json) => _$TextContentRequestFromJson(json);

@override final  String fieldName;
@override final  String content;

/// Create a copy of TextContentRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TextContentRequestCopyWith<_TextContentRequest> get copyWith => __$TextContentRequestCopyWithImpl<_TextContentRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TextContentRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TextContentRequest&&(identical(other.fieldName, fieldName) || other.fieldName == fieldName)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fieldName,content);

@override
String toString() {
  return 'TextContentRequest(fieldName: $fieldName, content: $content)';
}


}

/// @nodoc
abstract mixin class _$TextContentRequestCopyWith<$Res> implements $TextContentRequestCopyWith<$Res> {
  factory _$TextContentRequestCopyWith(_TextContentRequest value, $Res Function(_TextContentRequest) _then) = __$TextContentRequestCopyWithImpl;
@override @useResult
$Res call({
 String fieldName, String content
});




}
/// @nodoc
class __$TextContentRequestCopyWithImpl<$Res>
    implements _$TextContentRequestCopyWith<$Res> {
  __$TextContentRequestCopyWithImpl(this._self, this._then);

  final _TextContentRequest _self;
  final $Res Function(_TextContentRequest) _then;

/// Create a copy of TextContentRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fieldName = null,Object? content = null,}) {
  return _then(_TextContentRequest(
fieldName: null == fieldName ? _self.fieldName : fieldName // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PackageRequest {

 String get name; String? get description; double get price; int get numberOfSessions;
/// Create a copy of PackageRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PackageRequestCopyWith<PackageRequest> get copyWith => _$PackageRequestCopyWithImpl<PackageRequest>(this as PackageRequest, _$identity);

  /// Serializes this PackageRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PackageRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.numberOfSessions, numberOfSessions) || other.numberOfSessions == numberOfSessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,price,numberOfSessions);

@override
String toString() {
  return 'PackageRequest(name: $name, description: $description, price: $price, numberOfSessions: $numberOfSessions)';
}


}

/// @nodoc
abstract mixin class $PackageRequestCopyWith<$Res>  {
  factory $PackageRequestCopyWith(PackageRequest value, $Res Function(PackageRequest) _then) = _$PackageRequestCopyWithImpl;
@useResult
$Res call({
 String name, String? description, double price, int numberOfSessions
});




}
/// @nodoc
class _$PackageRequestCopyWithImpl<$Res>
    implements $PackageRequestCopyWith<$Res> {
  _$PackageRequestCopyWithImpl(this._self, this._then);

  final PackageRequest _self;
  final $Res Function(PackageRequest) _then;

/// Create a copy of PackageRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = freezed,Object? price = null,Object? numberOfSessions = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,numberOfSessions: null == numberOfSessions ? _self.numberOfSessions : numberOfSessions // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PackageRequest].
extension PackageRequestPatterns on PackageRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PackageRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PackageRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PackageRequest value)  $default,){
final _that = this;
switch (_that) {
case _PackageRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PackageRequest value)?  $default,){
final _that = this;
switch (_that) {
case _PackageRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? description,  double price,  int numberOfSessions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PackageRequest() when $default != null:
return $default(_that.name,_that.description,_that.price,_that.numberOfSessions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? description,  double price,  int numberOfSessions)  $default,) {final _that = this;
switch (_that) {
case _PackageRequest():
return $default(_that.name,_that.description,_that.price,_that.numberOfSessions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? description,  double price,  int numberOfSessions)?  $default,) {final _that = this;
switch (_that) {
case _PackageRequest() when $default != null:
return $default(_that.name,_that.description,_that.price,_that.numberOfSessions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PackageRequest implements PackageRequest {
  const _PackageRequest({required this.name, this.description, required this.price, required this.numberOfSessions});
  factory _PackageRequest.fromJson(Map<String, dynamic> json) => _$PackageRequestFromJson(json);

@override final  String name;
@override final  String? description;
@override final  double price;
@override final  int numberOfSessions;

/// Create a copy of PackageRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PackageRequestCopyWith<_PackageRequest> get copyWith => __$PackageRequestCopyWithImpl<_PackageRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PackageRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PackageRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.numberOfSessions, numberOfSessions) || other.numberOfSessions == numberOfSessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,price,numberOfSessions);

@override
String toString() {
  return 'PackageRequest(name: $name, description: $description, price: $price, numberOfSessions: $numberOfSessions)';
}


}

/// @nodoc
abstract mixin class _$PackageRequestCopyWith<$Res> implements $PackageRequestCopyWith<$Res> {
  factory _$PackageRequestCopyWith(_PackageRequest value, $Res Function(_PackageRequest) _then) = __$PackageRequestCopyWithImpl;
@override @useResult
$Res call({
 String name, String? description, double price, int numberOfSessions
});




}
/// @nodoc
class __$PackageRequestCopyWithImpl<$Res>
    implements _$PackageRequestCopyWith<$Res> {
  __$PackageRequestCopyWithImpl(this._self, this._then);

  final _PackageRequest _self;
  final $Res Function(_PackageRequest) _then;

/// Create a copy of PackageRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = freezed,Object? price = null,Object? numberOfSessions = null,}) {
  return _then(_PackageRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,numberOfSessions: null == numberOfSessions ? _self.numberOfSessions : numberOfSessions // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ServiceRequest {

 String get title; String? get description; double? get price; String? get currency; int? get duration;
/// Create a copy of ServiceRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceRequestCopyWith<ServiceRequest> get copyWith => _$ServiceRequestCopyWithImpl<ServiceRequest>(this as ServiceRequest, _$identity);

  /// Serializes this ServiceRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequest&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,price,currency,duration);

@override
String toString() {
  return 'ServiceRequest(title: $title, description: $description, price: $price, currency: $currency, duration: $duration)';
}


}

/// @nodoc
abstract mixin class $ServiceRequestCopyWith<$Res>  {
  factory $ServiceRequestCopyWith(ServiceRequest value, $Res Function(ServiceRequest) _then) = _$ServiceRequestCopyWithImpl;
@useResult
$Res call({
 String title, String? description, double? price, String? currency, int? duration
});




}
/// @nodoc
class _$ServiceRequestCopyWithImpl<$Res>
    implements $ServiceRequestCopyWith<$Res> {
  _$ServiceRequestCopyWithImpl(this._self, this._then);

  final ServiceRequest _self;
  final $Res Function(ServiceRequest) _then;

/// Create a copy of ServiceRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = freezed,Object? price = freezed,Object? currency = freezed,Object? duration = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceRequest].
extension ServiceRequestPatterns on ServiceRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceRequest value)  $default,){
final _that = this;
switch (_that) {
case _ServiceRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String? description,  double? price,  String? currency,  int? duration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceRequest() when $default != null:
return $default(_that.title,_that.description,_that.price,_that.currency,_that.duration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String? description,  double? price,  String? currency,  int? duration)  $default,) {final _that = this;
switch (_that) {
case _ServiceRequest():
return $default(_that.title,_that.description,_that.price,_that.currency,_that.duration);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String? description,  double? price,  String? currency,  int? duration)?  $default,) {final _that = this;
switch (_that) {
case _ServiceRequest() when $default != null:
return $default(_that.title,_that.description,_that.price,_that.currency,_that.duration);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceRequest implements ServiceRequest {
  const _ServiceRequest({required this.title, this.description, this.price, this.currency, this.duration});
  factory _ServiceRequest.fromJson(Map<String, dynamic> json) => _$ServiceRequestFromJson(json);

@override final  String title;
@override final  String? description;
@override final  double? price;
@override final  String? currency;
@override final  int? duration;

/// Create a copy of ServiceRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceRequestCopyWith<_ServiceRequest> get copyWith => __$ServiceRequestCopyWithImpl<_ServiceRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceRequest&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,price,currency,duration);

@override
String toString() {
  return 'ServiceRequest(title: $title, description: $description, price: $price, currency: $currency, duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$ServiceRequestCopyWith<$Res> implements $ServiceRequestCopyWith<$Res> {
  factory _$ServiceRequestCopyWith(_ServiceRequest value, $Res Function(_ServiceRequest) _then) = __$ServiceRequestCopyWithImpl;
@override @useResult
$Res call({
 String title, String? description, double? price, String? currency, int? duration
});




}
/// @nodoc
class __$ServiceRequestCopyWithImpl<$Res>
    implements _$ServiceRequestCopyWith<$Res> {
  __$ServiceRequestCopyWithImpl(this._self, this._then);

  final _ServiceRequest _self;
  final $Res Function(_ServiceRequest) _then;

/// Create a copy of ServiceRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = freezed,Object? price = freezed,Object? currency = freezed,Object? duration = freezed,}) {
  return _then(_ServiceRequest(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$SocialLinkRequest {

 String get platform; String get username;@JsonKey(name: 'profileUrl') String get profileUrl;
/// Create a copy of SocialLinkRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SocialLinkRequestCopyWith<SocialLinkRequest> get copyWith => _$SocialLinkRequestCopyWithImpl<SocialLinkRequest>(this as SocialLinkRequest, _$identity);

  /// Serializes this SocialLinkRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SocialLinkRequest&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.username, username) || other.username == username)&&(identical(other.profileUrl, profileUrl) || other.profileUrl == profileUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,platform,username,profileUrl);

@override
String toString() {
  return 'SocialLinkRequest(platform: $platform, username: $username, profileUrl: $profileUrl)';
}


}

/// @nodoc
abstract mixin class $SocialLinkRequestCopyWith<$Res>  {
  factory $SocialLinkRequestCopyWith(SocialLinkRequest value, $Res Function(SocialLinkRequest) _then) = _$SocialLinkRequestCopyWithImpl;
@useResult
$Res call({
 String platform, String username,@JsonKey(name: 'profileUrl') String profileUrl
});




}
/// @nodoc
class _$SocialLinkRequestCopyWithImpl<$Res>
    implements $SocialLinkRequestCopyWith<$Res> {
  _$SocialLinkRequestCopyWithImpl(this._self, this._then);

  final SocialLinkRequest _self;
  final $Res Function(SocialLinkRequest) _then;

/// Create a copy of SocialLinkRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? platform = null,Object? username = null,Object? profileUrl = null,}) {
  return _then(_self.copyWith(
platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,profileUrl: null == profileUrl ? _self.profileUrl : profileUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SocialLinkRequest].
extension SocialLinkRequestPatterns on SocialLinkRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SocialLinkRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SocialLinkRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SocialLinkRequest value)  $default,){
final _that = this;
switch (_that) {
case _SocialLinkRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SocialLinkRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SocialLinkRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String platform,  String username, @JsonKey(name: 'profileUrl')  String profileUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SocialLinkRequest() when $default != null:
return $default(_that.platform,_that.username,_that.profileUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String platform,  String username, @JsonKey(name: 'profileUrl')  String profileUrl)  $default,) {final _that = this;
switch (_that) {
case _SocialLinkRequest():
return $default(_that.platform,_that.username,_that.profileUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String platform,  String username, @JsonKey(name: 'profileUrl')  String profileUrl)?  $default,) {final _that = this;
switch (_that) {
case _SocialLinkRequest() when $default != null:
return $default(_that.platform,_that.username,_that.profileUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SocialLinkRequest implements SocialLinkRequest {
  const _SocialLinkRequest({required this.platform, required this.username, @JsonKey(name: 'profileUrl') required this.profileUrl});
  factory _SocialLinkRequest.fromJson(Map<String, dynamic> json) => _$SocialLinkRequestFromJson(json);

@override final  String platform;
@override final  String username;
@override@JsonKey(name: 'profileUrl') final  String profileUrl;

/// Create a copy of SocialLinkRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SocialLinkRequestCopyWith<_SocialLinkRequest> get copyWith => __$SocialLinkRequestCopyWithImpl<_SocialLinkRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SocialLinkRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SocialLinkRequest&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.username, username) || other.username == username)&&(identical(other.profileUrl, profileUrl) || other.profileUrl == profileUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,platform,username,profileUrl);

@override
String toString() {
  return 'SocialLinkRequest(platform: $platform, username: $username, profileUrl: $profileUrl)';
}


}

/// @nodoc
abstract mixin class _$SocialLinkRequestCopyWith<$Res> implements $SocialLinkRequestCopyWith<$Res> {
  factory _$SocialLinkRequestCopyWith(_SocialLinkRequest value, $Res Function(_SocialLinkRequest) _then) = __$SocialLinkRequestCopyWithImpl;
@override @useResult
$Res call({
 String platform, String username,@JsonKey(name: 'profileUrl') String profileUrl
});




}
/// @nodoc
class __$SocialLinkRequestCopyWithImpl<$Res>
    implements _$SocialLinkRequestCopyWith<$Res> {
  __$SocialLinkRequestCopyWithImpl(this._self, this._then);

  final _SocialLinkRequest _self;
  final $Res Function(_SocialLinkRequest) _then;

/// Create a copy of SocialLinkRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? platform = null,Object? username = null,Object? profileUrl = null,}) {
  return _then(_SocialLinkRequest(
platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,profileUrl: null == profileUrl ? _self.profileUrl : profileUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ExternalLinkRequest {

 String get label;@JsonKey(name: 'linkUrl') String get linkUrl;
/// Create a copy of ExternalLinkRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExternalLinkRequestCopyWith<ExternalLinkRequest> get copyWith => _$ExternalLinkRequestCopyWithImpl<ExternalLinkRequest>(this as ExternalLinkRequest, _$identity);

  /// Serializes this ExternalLinkRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExternalLinkRequest&&(identical(other.label, label) || other.label == label)&&(identical(other.linkUrl, linkUrl) || other.linkUrl == linkUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,linkUrl);

@override
String toString() {
  return 'ExternalLinkRequest(label: $label, linkUrl: $linkUrl)';
}


}

/// @nodoc
abstract mixin class $ExternalLinkRequestCopyWith<$Res>  {
  factory $ExternalLinkRequestCopyWith(ExternalLinkRequest value, $Res Function(ExternalLinkRequest) _then) = _$ExternalLinkRequestCopyWithImpl;
@useResult
$Res call({
 String label,@JsonKey(name: 'linkUrl') String linkUrl
});




}
/// @nodoc
class _$ExternalLinkRequestCopyWithImpl<$Res>
    implements $ExternalLinkRequestCopyWith<$Res> {
  _$ExternalLinkRequestCopyWithImpl(this._self, this._then);

  final ExternalLinkRequest _self;
  final $Res Function(ExternalLinkRequest) _then;

/// Create a copy of ExternalLinkRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? linkUrl = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,linkUrl: null == linkUrl ? _self.linkUrl : linkUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ExternalLinkRequest].
extension ExternalLinkRequestPatterns on ExternalLinkRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExternalLinkRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExternalLinkRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExternalLinkRequest value)  $default,){
final _that = this;
switch (_that) {
case _ExternalLinkRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExternalLinkRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ExternalLinkRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label, @JsonKey(name: 'linkUrl')  String linkUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExternalLinkRequest() when $default != null:
return $default(_that.label,_that.linkUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label, @JsonKey(name: 'linkUrl')  String linkUrl)  $default,) {final _that = this;
switch (_that) {
case _ExternalLinkRequest():
return $default(_that.label,_that.linkUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label, @JsonKey(name: 'linkUrl')  String linkUrl)?  $default,) {final _that = this;
switch (_that) {
case _ExternalLinkRequest() when $default != null:
return $default(_that.label,_that.linkUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExternalLinkRequest implements ExternalLinkRequest {
  const _ExternalLinkRequest({required this.label, @JsonKey(name: 'linkUrl') required this.linkUrl});
  factory _ExternalLinkRequest.fromJson(Map<String, dynamic> json) => _$ExternalLinkRequestFromJson(json);

@override final  String label;
@override@JsonKey(name: 'linkUrl') final  String linkUrl;

/// Create a copy of ExternalLinkRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExternalLinkRequestCopyWith<_ExternalLinkRequest> get copyWith => __$ExternalLinkRequestCopyWithImpl<_ExternalLinkRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExternalLinkRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExternalLinkRequest&&(identical(other.label, label) || other.label == label)&&(identical(other.linkUrl, linkUrl) || other.linkUrl == linkUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,linkUrl);

@override
String toString() {
  return 'ExternalLinkRequest(label: $label, linkUrl: $linkUrl)';
}


}

/// @nodoc
abstract mixin class _$ExternalLinkRequestCopyWith<$Res> implements $ExternalLinkRequestCopyWith<$Res> {
  factory _$ExternalLinkRequestCopyWith(_ExternalLinkRequest value, $Res Function(_ExternalLinkRequest) _then) = __$ExternalLinkRequestCopyWithImpl;
@override @useResult
$Res call({
 String label,@JsonKey(name: 'linkUrl') String linkUrl
});




}
/// @nodoc
class __$ExternalLinkRequestCopyWithImpl<$Res>
    implements _$ExternalLinkRequestCopyWith<$Res> {
  __$ExternalLinkRequestCopyWithImpl(this._self, this._then);

  final _ExternalLinkRequest _self;
  final $Res Function(_ExternalLinkRequest) _then;

/// Create a copy of ExternalLinkRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? linkUrl = null,}) {
  return _then(_ExternalLinkRequest(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,linkUrl: null == linkUrl ? _self.linkUrl : linkUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
