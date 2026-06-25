// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'widget_config_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WidgetConfigDto {

 List<WidgetConfigItem> get widgets;
/// Create a copy of WidgetConfigDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WidgetConfigDtoCopyWith<WidgetConfigDto> get copyWith => _$WidgetConfigDtoCopyWithImpl<WidgetConfigDto>(this as WidgetConfigDto, _$identity);

  /// Serializes this WidgetConfigDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WidgetConfigDto&&const DeepCollectionEquality().equals(other.widgets, widgets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(widgets));

@override
String toString() {
  return 'WidgetConfigDto(widgets: $widgets)';
}


}

/// @nodoc
abstract mixin class $WidgetConfigDtoCopyWith<$Res>  {
  factory $WidgetConfigDtoCopyWith(WidgetConfigDto value, $Res Function(WidgetConfigDto) _then) = _$WidgetConfigDtoCopyWithImpl;
@useResult
$Res call({
 List<WidgetConfigItem> widgets
});




}
/// @nodoc
class _$WidgetConfigDtoCopyWithImpl<$Res>
    implements $WidgetConfigDtoCopyWith<$Res> {
  _$WidgetConfigDtoCopyWithImpl(this._self, this._then);

  final WidgetConfigDto _self;
  final $Res Function(WidgetConfigDto) _then;

/// Create a copy of WidgetConfigDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? widgets = null,}) {
  return _then(_self.copyWith(
widgets: null == widgets ? _self.widgets : widgets // ignore: cast_nullable_to_non_nullable
as List<WidgetConfigItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [WidgetConfigDto].
extension WidgetConfigDtoPatterns on WidgetConfigDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WidgetConfigDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WidgetConfigDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WidgetConfigDto value)  $default,){
final _that = this;
switch (_that) {
case _WidgetConfigDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WidgetConfigDto value)?  $default,){
final _that = this;
switch (_that) {
case _WidgetConfigDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<WidgetConfigItem> widgets)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WidgetConfigDto() when $default != null:
return $default(_that.widgets);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<WidgetConfigItem> widgets)  $default,) {final _that = this;
switch (_that) {
case _WidgetConfigDto():
return $default(_that.widgets);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<WidgetConfigItem> widgets)?  $default,) {final _that = this;
switch (_that) {
case _WidgetConfigDto() when $default != null:
return $default(_that.widgets);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WidgetConfigDto implements WidgetConfigDto {
  const _WidgetConfigDto({final  List<WidgetConfigItem> widgets = const <WidgetConfigItem>[]}): _widgets = widgets;
  factory _WidgetConfigDto.fromJson(Map<String, dynamic> json) => _$WidgetConfigDtoFromJson(json);

 final  List<WidgetConfigItem> _widgets;
@override@JsonKey() List<WidgetConfigItem> get widgets {
  if (_widgets is EqualUnmodifiableListView) return _widgets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_widgets);
}


/// Create a copy of WidgetConfigDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WidgetConfigDtoCopyWith<_WidgetConfigDto> get copyWith => __$WidgetConfigDtoCopyWithImpl<_WidgetConfigDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WidgetConfigDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WidgetConfigDto&&const DeepCollectionEquality().equals(other._widgets, _widgets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_widgets));

@override
String toString() {
  return 'WidgetConfigDto(widgets: $widgets)';
}


}

/// @nodoc
abstract mixin class _$WidgetConfigDtoCopyWith<$Res> implements $WidgetConfigDtoCopyWith<$Res> {
  factory _$WidgetConfigDtoCopyWith(_WidgetConfigDto value, $Res Function(_WidgetConfigDto) _then) = __$WidgetConfigDtoCopyWithImpl;
@override @useResult
$Res call({
 List<WidgetConfigItem> widgets
});




}
/// @nodoc
class __$WidgetConfigDtoCopyWithImpl<$Res>
    implements _$WidgetConfigDtoCopyWith<$Res> {
  __$WidgetConfigDtoCopyWithImpl(this._self, this._then);

  final _WidgetConfigDto _self;
  final $Res Function(_WidgetConfigDto) _then;

/// Create a copy of WidgetConfigDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? widgets = null,}) {
  return _then(_WidgetConfigDto(
widgets: null == widgets ? _self._widgets : widgets // ignore: cast_nullable_to_non_nullable
as List<WidgetConfigItem>,
  ));
}


}


/// @nodoc
mixin _$WidgetConfigItem {

 String get id; String get type; bool get isVisible; int get order;
/// Create a copy of WidgetConfigItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WidgetConfigItemCopyWith<WidgetConfigItem> get copyWith => _$WidgetConfigItemCopyWithImpl<WidgetConfigItem>(this as WidgetConfigItem, _$identity);

  /// Serializes this WidgetConfigItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WidgetConfigItem&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,isVisible,order);

@override
String toString() {
  return 'WidgetConfigItem(id: $id, type: $type, isVisible: $isVisible, order: $order)';
}


}

/// @nodoc
abstract mixin class $WidgetConfigItemCopyWith<$Res>  {
  factory $WidgetConfigItemCopyWith(WidgetConfigItem value, $Res Function(WidgetConfigItem) _then) = _$WidgetConfigItemCopyWithImpl;
@useResult
$Res call({
 String id, String type, bool isVisible, int order
});




}
/// @nodoc
class _$WidgetConfigItemCopyWithImpl<$Res>
    implements $WidgetConfigItemCopyWith<$Res> {
  _$WidgetConfigItemCopyWithImpl(this._self, this._then);

  final WidgetConfigItem _self;
  final $Res Function(WidgetConfigItem) _then;

/// Create a copy of WidgetConfigItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? isVisible = null,Object? order = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isVisible: null == isVisible ? _self.isVisible : isVisible // ignore: cast_nullable_to_non_nullable
as bool,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WidgetConfigItem].
extension WidgetConfigItemPatterns on WidgetConfigItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WidgetConfigItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WidgetConfigItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WidgetConfigItem value)  $default,){
final _that = this;
switch (_that) {
case _WidgetConfigItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WidgetConfigItem value)?  $default,){
final _that = this;
switch (_that) {
case _WidgetConfigItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String type,  bool isVisible,  int order)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WidgetConfigItem() when $default != null:
return $default(_that.id,_that.type,_that.isVisible,_that.order);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String type,  bool isVisible,  int order)  $default,) {final _that = this;
switch (_that) {
case _WidgetConfigItem():
return $default(_that.id,_that.type,_that.isVisible,_that.order);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String type,  bool isVisible,  int order)?  $default,) {final _that = this;
switch (_that) {
case _WidgetConfigItem() when $default != null:
return $default(_that.id,_that.type,_that.isVisible,_that.order);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WidgetConfigItem implements WidgetConfigItem {
  const _WidgetConfigItem({required this.id, required this.type, this.isVisible = true, this.order = 0});
  factory _WidgetConfigItem.fromJson(Map<String, dynamic> json) => _$WidgetConfigItemFromJson(json);

@override final  String id;
@override final  String type;
@override@JsonKey() final  bool isVisible;
@override@JsonKey() final  int order;

/// Create a copy of WidgetConfigItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WidgetConfigItemCopyWith<_WidgetConfigItem> get copyWith => __$WidgetConfigItemCopyWithImpl<_WidgetConfigItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WidgetConfigItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WidgetConfigItem&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,isVisible,order);

@override
String toString() {
  return 'WidgetConfigItem(id: $id, type: $type, isVisible: $isVisible, order: $order)';
}


}

/// @nodoc
abstract mixin class _$WidgetConfigItemCopyWith<$Res> implements $WidgetConfigItemCopyWith<$Res> {
  factory _$WidgetConfigItemCopyWith(_WidgetConfigItem value, $Res Function(_WidgetConfigItem) _then) = __$WidgetConfigItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String type, bool isVisible, int order
});




}
/// @nodoc
class __$WidgetConfigItemCopyWithImpl<$Res>
    implements _$WidgetConfigItemCopyWith<$Res> {
  __$WidgetConfigItemCopyWithImpl(this._self, this._then);

  final _WidgetConfigItem _self;
  final $Res Function(_WidgetConfigItem) _then;

/// Create a copy of WidgetConfigItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? isVisible = null,Object? order = null,}) {
  return _then(_WidgetConfigItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isVisible: null == isVisible ? _self.isVisible : isVisible // ignore: cast_nullable_to_non_nullable
as bool,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
