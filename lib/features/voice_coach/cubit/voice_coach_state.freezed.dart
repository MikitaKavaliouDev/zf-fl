// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voice_coach_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VoiceCoachState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoiceCoachState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VoiceCoachState()';
}


}

/// @nodoc
class $VoiceCoachStateCopyWith<$Res>  {
$VoiceCoachStateCopyWith(VoiceCoachState _, $Res Function(VoiceCoachState) __);
}


/// Adds pattern-matching-related methods to [VoiceCoachState].
extension VoiceCoachStatePatterns on VoiceCoachState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( VoiceCoachDisconnected value)?  disconnected,TResult Function( VoiceCoachConnecting value)?  connecting,TResult Function( VoiceCoachConnected value)?  connected,TResult Function( VoiceCoachError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case VoiceCoachDisconnected() when disconnected != null:
return disconnected(_that);case VoiceCoachConnecting() when connecting != null:
return connecting(_that);case VoiceCoachConnected() when connected != null:
return connected(_that);case VoiceCoachError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( VoiceCoachDisconnected value)  disconnected,required TResult Function( VoiceCoachConnecting value)  connecting,required TResult Function( VoiceCoachConnected value)  connected,required TResult Function( VoiceCoachError value)  error,}){
final _that = this;
switch (_that) {
case VoiceCoachDisconnected():
return disconnected(_that);case VoiceCoachConnecting():
return connecting(_that);case VoiceCoachConnected():
return connected(_that);case VoiceCoachError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( VoiceCoachDisconnected value)?  disconnected,TResult? Function( VoiceCoachConnecting value)?  connecting,TResult? Function( VoiceCoachConnected value)?  connected,TResult? Function( VoiceCoachError value)?  error,}){
final _that = this;
switch (_that) {
case VoiceCoachDisconnected() when disconnected != null:
return disconnected(_that);case VoiceCoachConnecting() when connecting != null:
return connecting(_that);case VoiceCoachConnected() when connected != null:
return connected(_that);case VoiceCoachError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  disconnected,TResult Function()?  connecting,TResult Function( List<VoiceMessage> messages,  double audioLevel,  VoiceCoachAgentState agentState,  String? conversationId)?  connected,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case VoiceCoachDisconnected() when disconnected != null:
return disconnected();case VoiceCoachConnecting() when connecting != null:
return connecting();case VoiceCoachConnected() when connected != null:
return connected(_that.messages,_that.audioLevel,_that.agentState,_that.conversationId);case VoiceCoachError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  disconnected,required TResult Function()  connecting,required TResult Function( List<VoiceMessage> messages,  double audioLevel,  VoiceCoachAgentState agentState,  String? conversationId)  connected,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case VoiceCoachDisconnected():
return disconnected();case VoiceCoachConnecting():
return connecting();case VoiceCoachConnected():
return connected(_that.messages,_that.audioLevel,_that.agentState,_that.conversationId);case VoiceCoachError():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  disconnected,TResult? Function()?  connecting,TResult? Function( List<VoiceMessage> messages,  double audioLevel,  VoiceCoachAgentState agentState,  String? conversationId)?  connected,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case VoiceCoachDisconnected() when disconnected != null:
return disconnected();case VoiceCoachConnecting() when connecting != null:
return connecting();case VoiceCoachConnected() when connected != null:
return connected(_that.messages,_that.audioLevel,_that.agentState,_that.conversationId);case VoiceCoachError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class VoiceCoachDisconnected implements VoiceCoachState {
  const VoiceCoachDisconnected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoiceCoachDisconnected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VoiceCoachState.disconnected()';
}


}




/// @nodoc


class VoiceCoachConnecting implements VoiceCoachState {
  const VoiceCoachConnecting();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoiceCoachConnecting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VoiceCoachState.connecting()';
}


}




/// @nodoc


class VoiceCoachConnected implements VoiceCoachState {
  const VoiceCoachConnected({final  List<VoiceMessage> messages = const <VoiceMessage>[], this.audioLevel = 0.0, this.agentState = VoiceCoachAgentState.listening, this.conversationId}): _messages = messages;
  

 final  List<VoiceMessage> _messages;
@JsonKey() List<VoiceMessage> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

@JsonKey() final  double audioLevel;
@JsonKey() final  VoiceCoachAgentState agentState;
 final  String? conversationId;

/// Create a copy of VoiceCoachState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoiceCoachConnectedCopyWith<VoiceCoachConnected> get copyWith => _$VoiceCoachConnectedCopyWithImpl<VoiceCoachConnected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoiceCoachConnected&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.audioLevel, audioLevel) || other.audioLevel == audioLevel)&&(identical(other.agentState, agentState) || other.agentState == agentState)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages),audioLevel,agentState,conversationId);

@override
String toString() {
  return 'VoiceCoachState.connected(messages: $messages, audioLevel: $audioLevel, agentState: $agentState, conversationId: $conversationId)';
}


}

/// @nodoc
abstract mixin class $VoiceCoachConnectedCopyWith<$Res> implements $VoiceCoachStateCopyWith<$Res> {
  factory $VoiceCoachConnectedCopyWith(VoiceCoachConnected value, $Res Function(VoiceCoachConnected) _then) = _$VoiceCoachConnectedCopyWithImpl;
@useResult
$Res call({
 List<VoiceMessage> messages, double audioLevel, VoiceCoachAgentState agentState, String? conversationId
});




}
/// @nodoc
class _$VoiceCoachConnectedCopyWithImpl<$Res>
    implements $VoiceCoachConnectedCopyWith<$Res> {
  _$VoiceCoachConnectedCopyWithImpl(this._self, this._then);

  final VoiceCoachConnected _self;
  final $Res Function(VoiceCoachConnected) _then;

/// Create a copy of VoiceCoachState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messages = null,Object? audioLevel = null,Object? agentState = null,Object? conversationId = freezed,}) {
  return _then(VoiceCoachConnected(
messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<VoiceMessage>,audioLevel: null == audioLevel ? _self.audioLevel : audioLevel // ignore: cast_nullable_to_non_nullable
as double,agentState: null == agentState ? _self.agentState : agentState // ignore: cast_nullable_to_non_nullable
as VoiceCoachAgentState,conversationId: freezed == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class VoiceCoachError implements VoiceCoachState {
  const VoiceCoachError(this.message);
  

 final  String message;

/// Create a copy of VoiceCoachState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoiceCoachErrorCopyWith<VoiceCoachError> get copyWith => _$VoiceCoachErrorCopyWithImpl<VoiceCoachError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoiceCoachError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'VoiceCoachState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $VoiceCoachErrorCopyWith<$Res> implements $VoiceCoachStateCopyWith<$Res> {
  factory $VoiceCoachErrorCopyWith(VoiceCoachError value, $Res Function(VoiceCoachError) _then) = _$VoiceCoachErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$VoiceCoachErrorCopyWithImpl<$Res>
    implements $VoiceCoachErrorCopyWith<$Res> {
  _$VoiceCoachErrorCopyWithImpl(this._self, this._then);

  final VoiceCoachError _self;
  final $Res Function(VoiceCoachError) _then;

/// Create a copy of VoiceCoachState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(VoiceCoachError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
