// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_check_in_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainerCheckInDetailDto {

 String get id; String get clientId; String get date; String get status; String? get checkInType; String? get requestedBy; String? get requestedAt; String? get dueDate; double? get weight; double? get waistCm; double? get sleepHours; int? get energyLevel; int? get stressLevel; int? get hungerLevel; int? get digestionLevel; String? get nutritionCompliance; String? get weeklyNotes; String? get clientNotes; String? get weeklyPhotoUrl; double? get chestCm; double? get armCm; double? get thighCm; double? get hipCm; double? get sleepQuality; String? get energyTrend; int? get programSatisfaction; bool? get hasInjuries; String? get injuryNotes; bool? get goalsOnTrack; String? get goalNotes; String? get monthlyNotes; String? get frontPhotoUrl; String? get sidePhotoUrl; String? get backPhotoUrl; String? get trainerResponse; String? get reviewedAt; String? get reviewedByUserId; List<CheckInPhotoDto> get photos; CheckInClientRefDto get client; String get createdAt; String get updatedAt;
/// Create a copy of TrainerCheckInDetailDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerCheckInDetailDtoCopyWith<TrainerCheckInDetailDto> get copyWith => _$TrainerCheckInDetailDtoCopyWithImpl<TrainerCheckInDetailDto>(this as TrainerCheckInDetailDto, _$identity);

  /// Serializes this TrainerCheckInDetailDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerCheckInDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.date, date) || other.date == date)&&(identical(other.status, status) || other.status == status)&&(identical(other.checkInType, checkInType) || other.checkInType == checkInType)&&(identical(other.requestedBy, requestedBy) || other.requestedBy == requestedBy)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.waistCm, waistCm) || other.waistCm == waistCm)&&(identical(other.sleepHours, sleepHours) || other.sleepHours == sleepHours)&&(identical(other.energyLevel, energyLevel) || other.energyLevel == energyLevel)&&(identical(other.stressLevel, stressLevel) || other.stressLevel == stressLevel)&&(identical(other.hungerLevel, hungerLevel) || other.hungerLevel == hungerLevel)&&(identical(other.digestionLevel, digestionLevel) || other.digestionLevel == digestionLevel)&&(identical(other.nutritionCompliance, nutritionCompliance) || other.nutritionCompliance == nutritionCompliance)&&(identical(other.weeklyNotes, weeklyNotes) || other.weeklyNotes == weeklyNotes)&&(identical(other.clientNotes, clientNotes) || other.clientNotes == clientNotes)&&(identical(other.weeklyPhotoUrl, weeklyPhotoUrl) || other.weeklyPhotoUrl == weeklyPhotoUrl)&&(identical(other.chestCm, chestCm) || other.chestCm == chestCm)&&(identical(other.armCm, armCm) || other.armCm == armCm)&&(identical(other.thighCm, thighCm) || other.thighCm == thighCm)&&(identical(other.hipCm, hipCm) || other.hipCm == hipCm)&&(identical(other.sleepQuality, sleepQuality) || other.sleepQuality == sleepQuality)&&(identical(other.energyTrend, energyTrend) || other.energyTrend == energyTrend)&&(identical(other.programSatisfaction, programSatisfaction) || other.programSatisfaction == programSatisfaction)&&(identical(other.hasInjuries, hasInjuries) || other.hasInjuries == hasInjuries)&&(identical(other.injuryNotes, injuryNotes) || other.injuryNotes == injuryNotes)&&(identical(other.goalsOnTrack, goalsOnTrack) || other.goalsOnTrack == goalsOnTrack)&&(identical(other.goalNotes, goalNotes) || other.goalNotes == goalNotes)&&(identical(other.monthlyNotes, monthlyNotes) || other.monthlyNotes == monthlyNotes)&&(identical(other.frontPhotoUrl, frontPhotoUrl) || other.frontPhotoUrl == frontPhotoUrl)&&(identical(other.sidePhotoUrl, sidePhotoUrl) || other.sidePhotoUrl == sidePhotoUrl)&&(identical(other.backPhotoUrl, backPhotoUrl) || other.backPhotoUrl == backPhotoUrl)&&(identical(other.trainerResponse, trainerResponse) || other.trainerResponse == trainerResponse)&&(identical(other.reviewedAt, reviewedAt) || other.reviewedAt == reviewedAt)&&(identical(other.reviewedByUserId, reviewedByUserId) || other.reviewedByUserId == reviewedByUserId)&&const DeepCollectionEquality().equals(other.photos, photos)&&(identical(other.client, client) || other.client == client)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,clientId,date,status,checkInType,requestedBy,requestedAt,dueDate,weight,waistCm,sleepHours,energyLevel,stressLevel,hungerLevel,digestionLevel,nutritionCompliance,weeklyNotes,clientNotes,weeklyPhotoUrl,chestCm,armCm,thighCm,hipCm,sleepQuality,energyTrend,programSatisfaction,hasInjuries,injuryNotes,goalsOnTrack,goalNotes,monthlyNotes,frontPhotoUrl,sidePhotoUrl,backPhotoUrl,trainerResponse,reviewedAt,reviewedByUserId,const DeepCollectionEquality().hash(photos),client,createdAt,updatedAt]);

@override
String toString() {
  return 'TrainerCheckInDetailDto(id: $id, clientId: $clientId, date: $date, status: $status, checkInType: $checkInType, requestedBy: $requestedBy, requestedAt: $requestedAt, dueDate: $dueDate, weight: $weight, waistCm: $waistCm, sleepHours: $sleepHours, energyLevel: $energyLevel, stressLevel: $stressLevel, hungerLevel: $hungerLevel, digestionLevel: $digestionLevel, nutritionCompliance: $nutritionCompliance, weeklyNotes: $weeklyNotes, clientNotes: $clientNotes, weeklyPhotoUrl: $weeklyPhotoUrl, chestCm: $chestCm, armCm: $armCm, thighCm: $thighCm, hipCm: $hipCm, sleepQuality: $sleepQuality, energyTrend: $energyTrend, programSatisfaction: $programSatisfaction, hasInjuries: $hasInjuries, injuryNotes: $injuryNotes, goalsOnTrack: $goalsOnTrack, goalNotes: $goalNotes, monthlyNotes: $monthlyNotes, frontPhotoUrl: $frontPhotoUrl, sidePhotoUrl: $sidePhotoUrl, backPhotoUrl: $backPhotoUrl, trainerResponse: $trainerResponse, reviewedAt: $reviewedAt, reviewedByUserId: $reviewedByUserId, photos: $photos, client: $client, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TrainerCheckInDetailDtoCopyWith<$Res>  {
  factory $TrainerCheckInDetailDtoCopyWith(TrainerCheckInDetailDto value, $Res Function(TrainerCheckInDetailDto) _then) = _$TrainerCheckInDetailDtoCopyWithImpl;
@useResult
$Res call({
 String id, String clientId, String date, String status, String? checkInType, String? requestedBy, String? requestedAt, String? dueDate, double? weight, double? waistCm, double? sleepHours, int? energyLevel, int? stressLevel, int? hungerLevel, int? digestionLevel, String? nutritionCompliance, String? weeklyNotes, String? clientNotes, String? weeklyPhotoUrl, double? chestCm, double? armCm, double? thighCm, double? hipCm, double? sleepQuality, String? energyTrend, int? programSatisfaction, bool? hasInjuries, String? injuryNotes, bool? goalsOnTrack, String? goalNotes, String? monthlyNotes, String? frontPhotoUrl, String? sidePhotoUrl, String? backPhotoUrl, String? trainerResponse, String? reviewedAt, String? reviewedByUserId, List<CheckInPhotoDto> photos, CheckInClientRefDto client, String createdAt, String updatedAt
});


$CheckInClientRefDtoCopyWith<$Res> get client;

}
/// @nodoc
class _$TrainerCheckInDetailDtoCopyWithImpl<$Res>
    implements $TrainerCheckInDetailDtoCopyWith<$Res> {
  _$TrainerCheckInDetailDtoCopyWithImpl(this._self, this._then);

  final TrainerCheckInDetailDto _self;
  final $Res Function(TrainerCheckInDetailDto) _then;

/// Create a copy of TrainerCheckInDetailDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? clientId = null,Object? date = null,Object? status = null,Object? checkInType = freezed,Object? requestedBy = freezed,Object? requestedAt = freezed,Object? dueDate = freezed,Object? weight = freezed,Object? waistCm = freezed,Object? sleepHours = freezed,Object? energyLevel = freezed,Object? stressLevel = freezed,Object? hungerLevel = freezed,Object? digestionLevel = freezed,Object? nutritionCompliance = freezed,Object? weeklyNotes = freezed,Object? clientNotes = freezed,Object? weeklyPhotoUrl = freezed,Object? chestCm = freezed,Object? armCm = freezed,Object? thighCm = freezed,Object? hipCm = freezed,Object? sleepQuality = freezed,Object? energyTrend = freezed,Object? programSatisfaction = freezed,Object? hasInjuries = freezed,Object? injuryNotes = freezed,Object? goalsOnTrack = freezed,Object? goalNotes = freezed,Object? monthlyNotes = freezed,Object? frontPhotoUrl = freezed,Object? sidePhotoUrl = freezed,Object? backPhotoUrl = freezed,Object? trainerResponse = freezed,Object? reviewedAt = freezed,Object? reviewedByUserId = freezed,Object? photos = null,Object? client = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,checkInType: freezed == checkInType ? _self.checkInType : checkInType // ignore: cast_nullable_to_non_nullable
as String?,requestedBy: freezed == requestedBy ? _self.requestedBy : requestedBy // ignore: cast_nullable_to_non_nullable
as String?,requestedAt: freezed == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as String?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,waistCm: freezed == waistCm ? _self.waistCm : waistCm // ignore: cast_nullable_to_non_nullable
as double?,sleepHours: freezed == sleepHours ? _self.sleepHours : sleepHours // ignore: cast_nullable_to_non_nullable
as double?,energyLevel: freezed == energyLevel ? _self.energyLevel : energyLevel // ignore: cast_nullable_to_non_nullable
as int?,stressLevel: freezed == stressLevel ? _self.stressLevel : stressLevel // ignore: cast_nullable_to_non_nullable
as int?,hungerLevel: freezed == hungerLevel ? _self.hungerLevel : hungerLevel // ignore: cast_nullable_to_non_nullable
as int?,digestionLevel: freezed == digestionLevel ? _self.digestionLevel : digestionLevel // ignore: cast_nullable_to_non_nullable
as int?,nutritionCompliance: freezed == nutritionCompliance ? _self.nutritionCompliance : nutritionCompliance // ignore: cast_nullable_to_non_nullable
as String?,weeklyNotes: freezed == weeklyNotes ? _self.weeklyNotes : weeklyNotes // ignore: cast_nullable_to_non_nullable
as String?,clientNotes: freezed == clientNotes ? _self.clientNotes : clientNotes // ignore: cast_nullable_to_non_nullable
as String?,weeklyPhotoUrl: freezed == weeklyPhotoUrl ? _self.weeklyPhotoUrl : weeklyPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,chestCm: freezed == chestCm ? _self.chestCm : chestCm // ignore: cast_nullable_to_non_nullable
as double?,armCm: freezed == armCm ? _self.armCm : armCm // ignore: cast_nullable_to_non_nullable
as double?,thighCm: freezed == thighCm ? _self.thighCm : thighCm // ignore: cast_nullable_to_non_nullable
as double?,hipCm: freezed == hipCm ? _self.hipCm : hipCm // ignore: cast_nullable_to_non_nullable
as double?,sleepQuality: freezed == sleepQuality ? _self.sleepQuality : sleepQuality // ignore: cast_nullable_to_non_nullable
as double?,energyTrend: freezed == energyTrend ? _self.energyTrend : energyTrend // ignore: cast_nullable_to_non_nullable
as String?,programSatisfaction: freezed == programSatisfaction ? _self.programSatisfaction : programSatisfaction // ignore: cast_nullable_to_non_nullable
as int?,hasInjuries: freezed == hasInjuries ? _self.hasInjuries : hasInjuries // ignore: cast_nullable_to_non_nullable
as bool?,injuryNotes: freezed == injuryNotes ? _self.injuryNotes : injuryNotes // ignore: cast_nullable_to_non_nullable
as String?,goalsOnTrack: freezed == goalsOnTrack ? _self.goalsOnTrack : goalsOnTrack // ignore: cast_nullable_to_non_nullable
as bool?,goalNotes: freezed == goalNotes ? _self.goalNotes : goalNotes // ignore: cast_nullable_to_non_nullable
as String?,monthlyNotes: freezed == monthlyNotes ? _self.monthlyNotes : monthlyNotes // ignore: cast_nullable_to_non_nullable
as String?,frontPhotoUrl: freezed == frontPhotoUrl ? _self.frontPhotoUrl : frontPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,sidePhotoUrl: freezed == sidePhotoUrl ? _self.sidePhotoUrl : sidePhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,backPhotoUrl: freezed == backPhotoUrl ? _self.backPhotoUrl : backPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,trainerResponse: freezed == trainerResponse ? _self.trainerResponse : trainerResponse // ignore: cast_nullable_to_non_nullable
as String?,reviewedAt: freezed == reviewedAt ? _self.reviewedAt : reviewedAt // ignore: cast_nullable_to_non_nullable
as String?,reviewedByUserId: freezed == reviewedByUserId ? _self.reviewedByUserId : reviewedByUserId // ignore: cast_nullable_to_non_nullable
as String?,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<CheckInPhotoDto>,client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as CheckInClientRefDto,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of TrainerCheckInDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheckInClientRefDtoCopyWith<$Res> get client {
  
  return $CheckInClientRefDtoCopyWith<$Res>(_self.client, (value) {
    return _then(_self.copyWith(client: value));
  });
}
}


/// Adds pattern-matching-related methods to [TrainerCheckInDetailDto].
extension TrainerCheckInDetailDtoPatterns on TrainerCheckInDetailDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainerCheckInDetailDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainerCheckInDetailDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainerCheckInDetailDto value)  $default,){
final _that = this;
switch (_that) {
case _TrainerCheckInDetailDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainerCheckInDetailDto value)?  $default,){
final _that = this;
switch (_that) {
case _TrainerCheckInDetailDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String clientId,  String date,  String status,  String? checkInType,  String? requestedBy,  String? requestedAt,  String? dueDate,  double? weight,  double? waistCm,  double? sleepHours,  int? energyLevel,  int? stressLevel,  int? hungerLevel,  int? digestionLevel,  String? nutritionCompliance,  String? weeklyNotes,  String? clientNotes,  String? weeklyPhotoUrl,  double? chestCm,  double? armCm,  double? thighCm,  double? hipCm,  double? sleepQuality,  String? energyTrend,  int? programSatisfaction,  bool? hasInjuries,  String? injuryNotes,  bool? goalsOnTrack,  String? goalNotes,  String? monthlyNotes,  String? frontPhotoUrl,  String? sidePhotoUrl,  String? backPhotoUrl,  String? trainerResponse,  String? reviewedAt,  String? reviewedByUserId,  List<CheckInPhotoDto> photos,  CheckInClientRefDto client,  String createdAt,  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainerCheckInDetailDto() when $default != null:
return $default(_that.id,_that.clientId,_that.date,_that.status,_that.checkInType,_that.requestedBy,_that.requestedAt,_that.dueDate,_that.weight,_that.waistCm,_that.sleepHours,_that.energyLevel,_that.stressLevel,_that.hungerLevel,_that.digestionLevel,_that.nutritionCompliance,_that.weeklyNotes,_that.clientNotes,_that.weeklyPhotoUrl,_that.chestCm,_that.armCm,_that.thighCm,_that.hipCm,_that.sleepQuality,_that.energyTrend,_that.programSatisfaction,_that.hasInjuries,_that.injuryNotes,_that.goalsOnTrack,_that.goalNotes,_that.monthlyNotes,_that.frontPhotoUrl,_that.sidePhotoUrl,_that.backPhotoUrl,_that.trainerResponse,_that.reviewedAt,_that.reviewedByUserId,_that.photos,_that.client,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String clientId,  String date,  String status,  String? checkInType,  String? requestedBy,  String? requestedAt,  String? dueDate,  double? weight,  double? waistCm,  double? sleepHours,  int? energyLevel,  int? stressLevel,  int? hungerLevel,  int? digestionLevel,  String? nutritionCompliance,  String? weeklyNotes,  String? clientNotes,  String? weeklyPhotoUrl,  double? chestCm,  double? armCm,  double? thighCm,  double? hipCm,  double? sleepQuality,  String? energyTrend,  int? programSatisfaction,  bool? hasInjuries,  String? injuryNotes,  bool? goalsOnTrack,  String? goalNotes,  String? monthlyNotes,  String? frontPhotoUrl,  String? sidePhotoUrl,  String? backPhotoUrl,  String? trainerResponse,  String? reviewedAt,  String? reviewedByUserId,  List<CheckInPhotoDto> photos,  CheckInClientRefDto client,  String createdAt,  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TrainerCheckInDetailDto():
return $default(_that.id,_that.clientId,_that.date,_that.status,_that.checkInType,_that.requestedBy,_that.requestedAt,_that.dueDate,_that.weight,_that.waistCm,_that.sleepHours,_that.energyLevel,_that.stressLevel,_that.hungerLevel,_that.digestionLevel,_that.nutritionCompliance,_that.weeklyNotes,_that.clientNotes,_that.weeklyPhotoUrl,_that.chestCm,_that.armCm,_that.thighCm,_that.hipCm,_that.sleepQuality,_that.energyTrend,_that.programSatisfaction,_that.hasInjuries,_that.injuryNotes,_that.goalsOnTrack,_that.goalNotes,_that.monthlyNotes,_that.frontPhotoUrl,_that.sidePhotoUrl,_that.backPhotoUrl,_that.trainerResponse,_that.reviewedAt,_that.reviewedByUserId,_that.photos,_that.client,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String clientId,  String date,  String status,  String? checkInType,  String? requestedBy,  String? requestedAt,  String? dueDate,  double? weight,  double? waistCm,  double? sleepHours,  int? energyLevel,  int? stressLevel,  int? hungerLevel,  int? digestionLevel,  String? nutritionCompliance,  String? weeklyNotes,  String? clientNotes,  String? weeklyPhotoUrl,  double? chestCm,  double? armCm,  double? thighCm,  double? hipCm,  double? sleepQuality,  String? energyTrend,  int? programSatisfaction,  bool? hasInjuries,  String? injuryNotes,  bool? goalsOnTrack,  String? goalNotes,  String? monthlyNotes,  String? frontPhotoUrl,  String? sidePhotoUrl,  String? backPhotoUrl,  String? trainerResponse,  String? reviewedAt,  String? reviewedByUserId,  List<CheckInPhotoDto> photos,  CheckInClientRefDto client,  String createdAt,  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TrainerCheckInDetailDto() when $default != null:
return $default(_that.id,_that.clientId,_that.date,_that.status,_that.checkInType,_that.requestedBy,_that.requestedAt,_that.dueDate,_that.weight,_that.waistCm,_that.sleepHours,_that.energyLevel,_that.stressLevel,_that.hungerLevel,_that.digestionLevel,_that.nutritionCompliance,_that.weeklyNotes,_that.clientNotes,_that.weeklyPhotoUrl,_that.chestCm,_that.armCm,_that.thighCm,_that.hipCm,_that.sleepQuality,_that.energyTrend,_that.programSatisfaction,_that.hasInjuries,_that.injuryNotes,_that.goalsOnTrack,_that.goalNotes,_that.monthlyNotes,_that.frontPhotoUrl,_that.sidePhotoUrl,_that.backPhotoUrl,_that.trainerResponse,_that.reviewedAt,_that.reviewedByUserId,_that.photos,_that.client,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainerCheckInDetailDto implements TrainerCheckInDetailDto {
  const _TrainerCheckInDetailDto({required this.id, required this.clientId, required this.date, required this.status, this.checkInType, this.requestedBy, this.requestedAt, this.dueDate, this.weight, this.waistCm, this.sleepHours, this.energyLevel, this.stressLevel, this.hungerLevel, this.digestionLevel, this.nutritionCompliance, this.weeklyNotes, this.clientNotes, this.weeklyPhotoUrl, this.chestCm, this.armCm, this.thighCm, this.hipCm, this.sleepQuality, this.energyTrend, this.programSatisfaction, this.hasInjuries, this.injuryNotes, this.goalsOnTrack, this.goalNotes, this.monthlyNotes, this.frontPhotoUrl, this.sidePhotoUrl, this.backPhotoUrl, this.trainerResponse, this.reviewedAt, this.reviewedByUserId, final  List<CheckInPhotoDto> photos = const <CheckInPhotoDto>[], required this.client, required this.createdAt, required this.updatedAt}): _photos = photos;
  factory _TrainerCheckInDetailDto.fromJson(Map<String, dynamic> json) => _$TrainerCheckInDetailDtoFromJson(json);

@override final  String id;
@override final  String clientId;
@override final  String date;
@override final  String status;
@override final  String? checkInType;
@override final  String? requestedBy;
@override final  String? requestedAt;
@override final  String? dueDate;
@override final  double? weight;
@override final  double? waistCm;
@override final  double? sleepHours;
@override final  int? energyLevel;
@override final  int? stressLevel;
@override final  int? hungerLevel;
@override final  int? digestionLevel;
@override final  String? nutritionCompliance;
@override final  String? weeklyNotes;
@override final  String? clientNotes;
@override final  String? weeklyPhotoUrl;
@override final  double? chestCm;
@override final  double? armCm;
@override final  double? thighCm;
@override final  double? hipCm;
@override final  double? sleepQuality;
@override final  String? energyTrend;
@override final  int? programSatisfaction;
@override final  bool? hasInjuries;
@override final  String? injuryNotes;
@override final  bool? goalsOnTrack;
@override final  String? goalNotes;
@override final  String? monthlyNotes;
@override final  String? frontPhotoUrl;
@override final  String? sidePhotoUrl;
@override final  String? backPhotoUrl;
@override final  String? trainerResponse;
@override final  String? reviewedAt;
@override final  String? reviewedByUserId;
 final  List<CheckInPhotoDto> _photos;
@override@JsonKey() List<CheckInPhotoDto> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}

@override final  CheckInClientRefDto client;
@override final  String createdAt;
@override final  String updatedAt;

/// Create a copy of TrainerCheckInDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainerCheckInDetailDtoCopyWith<_TrainerCheckInDetailDto> get copyWith => __$TrainerCheckInDetailDtoCopyWithImpl<_TrainerCheckInDetailDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainerCheckInDetailDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainerCheckInDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.date, date) || other.date == date)&&(identical(other.status, status) || other.status == status)&&(identical(other.checkInType, checkInType) || other.checkInType == checkInType)&&(identical(other.requestedBy, requestedBy) || other.requestedBy == requestedBy)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.waistCm, waistCm) || other.waistCm == waistCm)&&(identical(other.sleepHours, sleepHours) || other.sleepHours == sleepHours)&&(identical(other.energyLevel, energyLevel) || other.energyLevel == energyLevel)&&(identical(other.stressLevel, stressLevel) || other.stressLevel == stressLevel)&&(identical(other.hungerLevel, hungerLevel) || other.hungerLevel == hungerLevel)&&(identical(other.digestionLevel, digestionLevel) || other.digestionLevel == digestionLevel)&&(identical(other.nutritionCompliance, nutritionCompliance) || other.nutritionCompliance == nutritionCompliance)&&(identical(other.weeklyNotes, weeklyNotes) || other.weeklyNotes == weeklyNotes)&&(identical(other.clientNotes, clientNotes) || other.clientNotes == clientNotes)&&(identical(other.weeklyPhotoUrl, weeklyPhotoUrl) || other.weeklyPhotoUrl == weeklyPhotoUrl)&&(identical(other.chestCm, chestCm) || other.chestCm == chestCm)&&(identical(other.armCm, armCm) || other.armCm == armCm)&&(identical(other.thighCm, thighCm) || other.thighCm == thighCm)&&(identical(other.hipCm, hipCm) || other.hipCm == hipCm)&&(identical(other.sleepQuality, sleepQuality) || other.sleepQuality == sleepQuality)&&(identical(other.energyTrend, energyTrend) || other.energyTrend == energyTrend)&&(identical(other.programSatisfaction, programSatisfaction) || other.programSatisfaction == programSatisfaction)&&(identical(other.hasInjuries, hasInjuries) || other.hasInjuries == hasInjuries)&&(identical(other.injuryNotes, injuryNotes) || other.injuryNotes == injuryNotes)&&(identical(other.goalsOnTrack, goalsOnTrack) || other.goalsOnTrack == goalsOnTrack)&&(identical(other.goalNotes, goalNotes) || other.goalNotes == goalNotes)&&(identical(other.monthlyNotes, monthlyNotes) || other.monthlyNotes == monthlyNotes)&&(identical(other.frontPhotoUrl, frontPhotoUrl) || other.frontPhotoUrl == frontPhotoUrl)&&(identical(other.sidePhotoUrl, sidePhotoUrl) || other.sidePhotoUrl == sidePhotoUrl)&&(identical(other.backPhotoUrl, backPhotoUrl) || other.backPhotoUrl == backPhotoUrl)&&(identical(other.trainerResponse, trainerResponse) || other.trainerResponse == trainerResponse)&&(identical(other.reviewedAt, reviewedAt) || other.reviewedAt == reviewedAt)&&(identical(other.reviewedByUserId, reviewedByUserId) || other.reviewedByUserId == reviewedByUserId)&&const DeepCollectionEquality().equals(other._photos, _photos)&&(identical(other.client, client) || other.client == client)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,clientId,date,status,checkInType,requestedBy,requestedAt,dueDate,weight,waistCm,sleepHours,energyLevel,stressLevel,hungerLevel,digestionLevel,nutritionCompliance,weeklyNotes,clientNotes,weeklyPhotoUrl,chestCm,armCm,thighCm,hipCm,sleepQuality,energyTrend,programSatisfaction,hasInjuries,injuryNotes,goalsOnTrack,goalNotes,monthlyNotes,frontPhotoUrl,sidePhotoUrl,backPhotoUrl,trainerResponse,reviewedAt,reviewedByUserId,const DeepCollectionEquality().hash(_photos),client,createdAt,updatedAt]);

@override
String toString() {
  return 'TrainerCheckInDetailDto(id: $id, clientId: $clientId, date: $date, status: $status, checkInType: $checkInType, requestedBy: $requestedBy, requestedAt: $requestedAt, dueDate: $dueDate, weight: $weight, waistCm: $waistCm, sleepHours: $sleepHours, energyLevel: $energyLevel, stressLevel: $stressLevel, hungerLevel: $hungerLevel, digestionLevel: $digestionLevel, nutritionCompliance: $nutritionCompliance, weeklyNotes: $weeklyNotes, clientNotes: $clientNotes, weeklyPhotoUrl: $weeklyPhotoUrl, chestCm: $chestCm, armCm: $armCm, thighCm: $thighCm, hipCm: $hipCm, sleepQuality: $sleepQuality, energyTrend: $energyTrend, programSatisfaction: $programSatisfaction, hasInjuries: $hasInjuries, injuryNotes: $injuryNotes, goalsOnTrack: $goalsOnTrack, goalNotes: $goalNotes, monthlyNotes: $monthlyNotes, frontPhotoUrl: $frontPhotoUrl, sidePhotoUrl: $sidePhotoUrl, backPhotoUrl: $backPhotoUrl, trainerResponse: $trainerResponse, reviewedAt: $reviewedAt, reviewedByUserId: $reviewedByUserId, photos: $photos, client: $client, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TrainerCheckInDetailDtoCopyWith<$Res> implements $TrainerCheckInDetailDtoCopyWith<$Res> {
  factory _$TrainerCheckInDetailDtoCopyWith(_TrainerCheckInDetailDto value, $Res Function(_TrainerCheckInDetailDto) _then) = __$TrainerCheckInDetailDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String clientId, String date, String status, String? checkInType, String? requestedBy, String? requestedAt, String? dueDate, double? weight, double? waistCm, double? sleepHours, int? energyLevel, int? stressLevel, int? hungerLevel, int? digestionLevel, String? nutritionCompliance, String? weeklyNotes, String? clientNotes, String? weeklyPhotoUrl, double? chestCm, double? armCm, double? thighCm, double? hipCm, double? sleepQuality, String? energyTrend, int? programSatisfaction, bool? hasInjuries, String? injuryNotes, bool? goalsOnTrack, String? goalNotes, String? monthlyNotes, String? frontPhotoUrl, String? sidePhotoUrl, String? backPhotoUrl, String? trainerResponse, String? reviewedAt, String? reviewedByUserId, List<CheckInPhotoDto> photos, CheckInClientRefDto client, String createdAt, String updatedAt
});


@override $CheckInClientRefDtoCopyWith<$Res> get client;

}
/// @nodoc
class __$TrainerCheckInDetailDtoCopyWithImpl<$Res>
    implements _$TrainerCheckInDetailDtoCopyWith<$Res> {
  __$TrainerCheckInDetailDtoCopyWithImpl(this._self, this._then);

  final _TrainerCheckInDetailDto _self;
  final $Res Function(_TrainerCheckInDetailDto) _then;

/// Create a copy of TrainerCheckInDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? clientId = null,Object? date = null,Object? status = null,Object? checkInType = freezed,Object? requestedBy = freezed,Object? requestedAt = freezed,Object? dueDate = freezed,Object? weight = freezed,Object? waistCm = freezed,Object? sleepHours = freezed,Object? energyLevel = freezed,Object? stressLevel = freezed,Object? hungerLevel = freezed,Object? digestionLevel = freezed,Object? nutritionCompliance = freezed,Object? weeklyNotes = freezed,Object? clientNotes = freezed,Object? weeklyPhotoUrl = freezed,Object? chestCm = freezed,Object? armCm = freezed,Object? thighCm = freezed,Object? hipCm = freezed,Object? sleepQuality = freezed,Object? energyTrend = freezed,Object? programSatisfaction = freezed,Object? hasInjuries = freezed,Object? injuryNotes = freezed,Object? goalsOnTrack = freezed,Object? goalNotes = freezed,Object? monthlyNotes = freezed,Object? frontPhotoUrl = freezed,Object? sidePhotoUrl = freezed,Object? backPhotoUrl = freezed,Object? trainerResponse = freezed,Object? reviewedAt = freezed,Object? reviewedByUserId = freezed,Object? photos = null,Object? client = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_TrainerCheckInDetailDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,checkInType: freezed == checkInType ? _self.checkInType : checkInType // ignore: cast_nullable_to_non_nullable
as String?,requestedBy: freezed == requestedBy ? _self.requestedBy : requestedBy // ignore: cast_nullable_to_non_nullable
as String?,requestedAt: freezed == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as String?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,waistCm: freezed == waistCm ? _self.waistCm : waistCm // ignore: cast_nullable_to_non_nullable
as double?,sleepHours: freezed == sleepHours ? _self.sleepHours : sleepHours // ignore: cast_nullable_to_non_nullable
as double?,energyLevel: freezed == energyLevel ? _self.energyLevel : energyLevel // ignore: cast_nullable_to_non_nullable
as int?,stressLevel: freezed == stressLevel ? _self.stressLevel : stressLevel // ignore: cast_nullable_to_non_nullable
as int?,hungerLevel: freezed == hungerLevel ? _self.hungerLevel : hungerLevel // ignore: cast_nullable_to_non_nullable
as int?,digestionLevel: freezed == digestionLevel ? _self.digestionLevel : digestionLevel // ignore: cast_nullable_to_non_nullable
as int?,nutritionCompliance: freezed == nutritionCompliance ? _self.nutritionCompliance : nutritionCompliance // ignore: cast_nullable_to_non_nullable
as String?,weeklyNotes: freezed == weeklyNotes ? _self.weeklyNotes : weeklyNotes // ignore: cast_nullable_to_non_nullable
as String?,clientNotes: freezed == clientNotes ? _self.clientNotes : clientNotes // ignore: cast_nullable_to_non_nullable
as String?,weeklyPhotoUrl: freezed == weeklyPhotoUrl ? _self.weeklyPhotoUrl : weeklyPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,chestCm: freezed == chestCm ? _self.chestCm : chestCm // ignore: cast_nullable_to_non_nullable
as double?,armCm: freezed == armCm ? _self.armCm : armCm // ignore: cast_nullable_to_non_nullable
as double?,thighCm: freezed == thighCm ? _self.thighCm : thighCm // ignore: cast_nullable_to_non_nullable
as double?,hipCm: freezed == hipCm ? _self.hipCm : hipCm // ignore: cast_nullable_to_non_nullable
as double?,sleepQuality: freezed == sleepQuality ? _self.sleepQuality : sleepQuality // ignore: cast_nullable_to_non_nullable
as double?,energyTrend: freezed == energyTrend ? _self.energyTrend : energyTrend // ignore: cast_nullable_to_non_nullable
as String?,programSatisfaction: freezed == programSatisfaction ? _self.programSatisfaction : programSatisfaction // ignore: cast_nullable_to_non_nullable
as int?,hasInjuries: freezed == hasInjuries ? _self.hasInjuries : hasInjuries // ignore: cast_nullable_to_non_nullable
as bool?,injuryNotes: freezed == injuryNotes ? _self.injuryNotes : injuryNotes // ignore: cast_nullable_to_non_nullable
as String?,goalsOnTrack: freezed == goalsOnTrack ? _self.goalsOnTrack : goalsOnTrack // ignore: cast_nullable_to_non_nullable
as bool?,goalNotes: freezed == goalNotes ? _self.goalNotes : goalNotes // ignore: cast_nullable_to_non_nullable
as String?,monthlyNotes: freezed == monthlyNotes ? _self.monthlyNotes : monthlyNotes // ignore: cast_nullable_to_non_nullable
as String?,frontPhotoUrl: freezed == frontPhotoUrl ? _self.frontPhotoUrl : frontPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,sidePhotoUrl: freezed == sidePhotoUrl ? _self.sidePhotoUrl : sidePhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,backPhotoUrl: freezed == backPhotoUrl ? _self.backPhotoUrl : backPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,trainerResponse: freezed == trainerResponse ? _self.trainerResponse : trainerResponse // ignore: cast_nullable_to_non_nullable
as String?,reviewedAt: freezed == reviewedAt ? _self.reviewedAt : reviewedAt // ignore: cast_nullable_to_non_nullable
as String?,reviewedByUserId: freezed == reviewedByUserId ? _self.reviewedByUserId : reviewedByUserId // ignore: cast_nullable_to_non_nullable
as String?,photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<CheckInPhotoDto>,client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as CheckInClientRefDto,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of TrainerCheckInDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheckInClientRefDtoCopyWith<$Res> get client {
  
  return $CheckInClientRefDtoCopyWith<$Res>(_self.client, (value) {
    return _then(_self.copyWith(client: value));
  });
}
}

// dart format on
