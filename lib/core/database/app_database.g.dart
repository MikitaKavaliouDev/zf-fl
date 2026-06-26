// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $AnalyticsCacheTable extends AnalyticsCache
    with TableInfo<$AnalyticsCacheTable, AnalyticsCacheData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AnalyticsCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'analytics_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<AnalyticsCacheData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  AnalyticsCacheData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AnalyticsCacheData(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $AnalyticsCacheTable createAlias(String alias) {
    return $AnalyticsCacheTable(attachedDatabase, alias);
  }
}

class AnalyticsCacheData extends DataClass
    implements Insertable<AnalyticsCacheData> {
  final String key;
  final String value;
  final int updatedAt;
  const AnalyticsCacheData({
    required this.key,
    required this.value,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  AnalyticsCacheCompanion toCompanion(bool nullToAbsent) {
    return AnalyticsCacheCompanion(
      key: Value(key),
      value: Value(value),
      updatedAt: Value(updatedAt),
    );
  }

  factory AnalyticsCacheData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AnalyticsCacheData(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  AnalyticsCacheData copyWith({String? key, String? value, int? updatedAt}) =>
      AnalyticsCacheData(
        key: key ?? this.key,
        value: value ?? this.value,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  AnalyticsCacheData copyWithCompanion(AnalyticsCacheCompanion data) {
    return AnalyticsCacheData(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AnalyticsCacheData(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AnalyticsCacheData &&
          other.key == this.key &&
          other.value == this.value &&
          other.updatedAt == this.updatedAt);
}

class AnalyticsCacheCompanion extends UpdateCompanion<AnalyticsCacheData> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const AnalyticsCacheCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AnalyticsCacheCompanion.insert({
    required String key,
    required String value,
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value),
       updatedAt = Value(updatedAt);
  static Insertable<AnalyticsCacheData> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AnalyticsCacheCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return AnalyticsCacheCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnalyticsCacheCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncMetadataTable extends SyncMetadata
    with TableInfo<$SyncMetadataTable, SyncMetadataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncMetadataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_metadata';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncMetadataData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  SyncMetadataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncMetadataData(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $SyncMetadataTable createAlias(String alias) {
    return $SyncMetadataTable(attachedDatabase, alias);
  }
}

class SyncMetadataData extends DataClass
    implements Insertable<SyncMetadataData> {
  final String key;
  final String value;
  const SyncMetadataData({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  SyncMetadataCompanion toCompanion(bool nullToAbsent) {
    return SyncMetadataCompanion(key: Value(key), value: Value(value));
  }

  factory SyncMetadataData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncMetadataData(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  SyncMetadataData copyWith({String? key, String? value}) =>
      SyncMetadataData(key: key ?? this.key, value: value ?? this.value);
  SyncMetadataData copyWithCompanion(SyncMetadataCompanion data) {
    return SyncMetadataData(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncMetadataData(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncMetadataData &&
          other.key == this.key &&
          other.value == this.value);
}

class SyncMetadataCompanion extends UpdateCompanion<SyncMetadataData> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const SyncMetadataCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncMetadataCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<SyncMetadataData> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncMetadataCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return SyncMetadataCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncMetadataCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ClientsTableTable extends ClientsTable
    with TableInfo<$ClientsTableTable, ClientEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClientsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _trainerIdMeta = const VerificationMeta(
    'trainerId',
  );
  @override
  late final GeneratedColumn<String> trainerId = GeneratedColumn<String>(
    'trainer_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _avatarPathMeta = const VerificationMeta(
    'avatarPath',
  );
  @override
  late final GeneratedColumn<String> avatarPath = GeneratedColumn<String>(
    'avatar_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('active'),
  );
  static const VerificationMeta _dateOfBirthMeta = const VerificationMeta(
    'dateOfBirth',
  );
  @override
  late final GeneratedColumn<DateTime> dateOfBirth = GeneratedColumn<DateTime>(
    'date_of_birth',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _goalsMeta = const VerificationMeta('goals');
  @override
  late final GeneratedColumn<String> goals = GeneratedColumn<String>(
    'goals',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _healthNotesMeta = const VerificationMeta(
    'healthNotes',
  );
  @override
  late final GeneratedColumn<String> healthNotes = GeneratedColumn<String>(
    'health_notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emergencyContactNameMeta =
      const VerificationMeta('emergencyContactName');
  @override
  late final GeneratedColumn<String> emergencyContactName =
      GeneratedColumn<String>(
        'emergency_contact_name',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _emergencyContactPhoneMeta =
      const VerificationMeta('emergencyContactPhone');
  @override
  late final GeneratedColumn<String> emergencyContactPhone =
      GeneratedColumn<String>(
        'emergency_contact_phone',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _checkInDayMeta = const VerificationMeta(
    'checkInDay',
  );
  @override
  late final GeneratedColumn<int> checkInDay = GeneratedColumn<int>(
    'check_in_day',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _checkInHourMeta = const VerificationMeta(
    'checkInHour',
  );
  @override
  late final GeneratedColumn<int> checkInHour = GeneratedColumn<int>(
    'check_in_hour',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dataSharingExpiresAtMeta =
      const VerificationMeta('dataSharingExpiresAt');
  @override
  late final GeneratedColumn<DateTime> dataSharingExpiresAt =
      GeneratedColumn<DateTime>(
        'data_sharing_expires_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _sharingSettingsMeta = const VerificationMeta(
    'sharingSettings',
  );
  @override
  late final GeneratedColumn<String> sharingSettings = GeneratedColumn<String>(
    'sharing_settings',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _widgetConfigMeta = const VerificationMeta(
    'widgetConfig',
  );
  @override
  late final GeneratedColumn<String> widgetConfig = GeneratedColumn<String>(
    'widget_config',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<int> deletedAt = GeneratedColumn<int>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    trainerId,
    userId,
    name,
    email,
    phone,
    avatarPath,
    status,
    dateOfBirth,
    goals,
    healthNotes,
    emergencyContactName,
    emergencyContactPhone,
    checkInDay,
    checkInHour,
    dataSharingExpiresAt,
    sharingSettings,
    widgetConfig,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'clients_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ClientEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('trainer_id')) {
      context.handle(
        _trainerIdMeta,
        trainerId.isAcceptableOrUnknown(data['trainer_id']!, _trainerIdMeta),
      );
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('avatar_path')) {
      context.handle(
        _avatarPathMeta,
        avatarPath.isAcceptableOrUnknown(data['avatar_path']!, _avatarPathMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('date_of_birth')) {
      context.handle(
        _dateOfBirthMeta,
        dateOfBirth.isAcceptableOrUnknown(
          data['date_of_birth']!,
          _dateOfBirthMeta,
        ),
      );
    }
    if (data.containsKey('goals')) {
      context.handle(
        _goalsMeta,
        goals.isAcceptableOrUnknown(data['goals']!, _goalsMeta),
      );
    }
    if (data.containsKey('health_notes')) {
      context.handle(
        _healthNotesMeta,
        healthNotes.isAcceptableOrUnknown(
          data['health_notes']!,
          _healthNotesMeta,
        ),
      );
    }
    if (data.containsKey('emergency_contact_name')) {
      context.handle(
        _emergencyContactNameMeta,
        emergencyContactName.isAcceptableOrUnknown(
          data['emergency_contact_name']!,
          _emergencyContactNameMeta,
        ),
      );
    }
    if (data.containsKey('emergency_contact_phone')) {
      context.handle(
        _emergencyContactPhoneMeta,
        emergencyContactPhone.isAcceptableOrUnknown(
          data['emergency_contact_phone']!,
          _emergencyContactPhoneMeta,
        ),
      );
    }
    if (data.containsKey('check_in_day')) {
      context.handle(
        _checkInDayMeta,
        checkInDay.isAcceptableOrUnknown(
          data['check_in_day']!,
          _checkInDayMeta,
        ),
      );
    }
    if (data.containsKey('check_in_hour')) {
      context.handle(
        _checkInHourMeta,
        checkInHour.isAcceptableOrUnknown(
          data['check_in_hour']!,
          _checkInHourMeta,
        ),
      );
    }
    if (data.containsKey('data_sharing_expires_at')) {
      context.handle(
        _dataSharingExpiresAtMeta,
        dataSharingExpiresAt.isAcceptableOrUnknown(
          data['data_sharing_expires_at']!,
          _dataSharingExpiresAtMeta,
        ),
      );
    }
    if (data.containsKey('sharing_settings')) {
      context.handle(
        _sharingSettingsMeta,
        sharingSettings.isAcceptableOrUnknown(
          data['sharing_settings']!,
          _sharingSettingsMeta,
        ),
      );
    }
    if (data.containsKey('widget_config')) {
      context.handle(
        _widgetConfigMeta,
        widgetConfig.isAcceptableOrUnknown(
          data['widget_config']!,
          _widgetConfigMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ClientEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClientEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      trainerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}trainer_id'],
      ),
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      avatarPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}avatar_path'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      dateOfBirth: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_of_birth'],
      ),
      goals: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}goals'],
      ),
      healthNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}health_notes'],
      ),
      emergencyContactName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emergency_contact_name'],
      ),
      emergencyContactPhone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emergency_contact_phone'],
      ),
      checkInDay: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}check_in_day'],
      ),
      checkInHour: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}check_in_hour'],
      ),
      dataSharingExpiresAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}data_sharing_expires_at'],
      ),
      sharingSettings: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sharing_settings'],
      ),
      widgetConfig: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}widget_config'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
    );
  }

  @override
  $ClientsTableTable createAlias(String alias) {
    return $ClientsTableTable(attachedDatabase, alias);
  }
}

class ClientEntity extends DataClass implements Insertable<ClientEntity> {
  final String id;
  final String? trainerId;
  final String? userId;
  final String name;
  final String? email;
  final String? phone;
  final String? avatarPath;
  final String status;
  final DateTime? dateOfBirth;
  final String? goals;
  final String? healthNotes;
  final String? emergencyContactName;
  final String? emergencyContactPhone;
  final int? checkInDay;
  final int? checkInHour;
  final DateTime? dataSharingExpiresAt;
  final String? sharingSettings;
  final String? widgetConfig;
  final int createdAt;
  final int updatedAt;
  final int? deletedAt;
  final String syncStatus;
  const ClientEntity({
    required this.id,
    this.trainerId,
    this.userId,
    required this.name,
    this.email,
    this.phone,
    this.avatarPath,
    required this.status,
    this.dateOfBirth,
    this.goals,
    this.healthNotes,
    this.emergencyContactName,
    this.emergencyContactPhone,
    this.checkInDay,
    this.checkInHour,
    this.dataSharingExpiresAt,
    this.sharingSettings,
    this.widgetConfig,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || trainerId != null) {
      map['trainer_id'] = Variable<String>(trainerId);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || avatarPath != null) {
      map['avatar_path'] = Variable<String>(avatarPath);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || dateOfBirth != null) {
      map['date_of_birth'] = Variable<DateTime>(dateOfBirth);
    }
    if (!nullToAbsent || goals != null) {
      map['goals'] = Variable<String>(goals);
    }
    if (!nullToAbsent || healthNotes != null) {
      map['health_notes'] = Variable<String>(healthNotes);
    }
    if (!nullToAbsent || emergencyContactName != null) {
      map['emergency_contact_name'] = Variable<String>(emergencyContactName);
    }
    if (!nullToAbsent || emergencyContactPhone != null) {
      map['emergency_contact_phone'] = Variable<String>(emergencyContactPhone);
    }
    if (!nullToAbsent || checkInDay != null) {
      map['check_in_day'] = Variable<int>(checkInDay);
    }
    if (!nullToAbsent || checkInHour != null) {
      map['check_in_hour'] = Variable<int>(checkInHour);
    }
    if (!nullToAbsent || dataSharingExpiresAt != null) {
      map['data_sharing_expires_at'] = Variable<DateTime>(dataSharingExpiresAt);
    }
    if (!nullToAbsent || sharingSettings != null) {
      map['sharing_settings'] = Variable<String>(sharingSettings);
    }
    if (!nullToAbsent || widgetConfig != null) {
      map['widget_config'] = Variable<String>(widgetConfig);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<int>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  ClientsTableCompanion toCompanion(bool nullToAbsent) {
    return ClientsTableCompanion(
      id: Value(id),
      trainerId: trainerId == null && nullToAbsent
          ? const Value.absent()
          : Value(trainerId),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      name: Value(name),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      avatarPath: avatarPath == null && nullToAbsent
          ? const Value.absent()
          : Value(avatarPath),
      status: Value(status),
      dateOfBirth: dateOfBirth == null && nullToAbsent
          ? const Value.absent()
          : Value(dateOfBirth),
      goals: goals == null && nullToAbsent
          ? const Value.absent()
          : Value(goals),
      healthNotes: healthNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(healthNotes),
      emergencyContactName: emergencyContactName == null && nullToAbsent
          ? const Value.absent()
          : Value(emergencyContactName),
      emergencyContactPhone: emergencyContactPhone == null && nullToAbsent
          ? const Value.absent()
          : Value(emergencyContactPhone),
      checkInDay: checkInDay == null && nullToAbsent
          ? const Value.absent()
          : Value(checkInDay),
      checkInHour: checkInHour == null && nullToAbsent
          ? const Value.absent()
          : Value(checkInHour),
      dataSharingExpiresAt: dataSharingExpiresAt == null && nullToAbsent
          ? const Value.absent()
          : Value(dataSharingExpiresAt),
      sharingSettings: sharingSettings == null && nullToAbsent
          ? const Value.absent()
          : Value(sharingSettings),
      widgetConfig: widgetConfig == null && nullToAbsent
          ? const Value.absent()
          : Value(widgetConfig),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory ClientEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ClientEntity(
      id: serializer.fromJson<String>(json['id']),
      trainerId: serializer.fromJson<String?>(json['trainerId']),
      userId: serializer.fromJson<String?>(json['userId']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String?>(json['email']),
      phone: serializer.fromJson<String?>(json['phone']),
      avatarPath: serializer.fromJson<String?>(json['avatarPath']),
      status: serializer.fromJson<String>(json['status']),
      dateOfBirth: serializer.fromJson<DateTime?>(json['dateOfBirth']),
      goals: serializer.fromJson<String?>(json['goals']),
      healthNotes: serializer.fromJson<String?>(json['healthNotes']),
      emergencyContactName: serializer.fromJson<String?>(
        json['emergencyContactName'],
      ),
      emergencyContactPhone: serializer.fromJson<String?>(
        json['emergencyContactPhone'],
      ),
      checkInDay: serializer.fromJson<int?>(json['checkInDay']),
      checkInHour: serializer.fromJson<int?>(json['checkInHour']),
      dataSharingExpiresAt: serializer.fromJson<DateTime?>(
        json['dataSharingExpiresAt'],
      ),
      sharingSettings: serializer.fromJson<String?>(json['sharingSettings']),
      widgetConfig: serializer.fromJson<String?>(json['widgetConfig']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      deletedAt: serializer.fromJson<int?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'trainerId': serializer.toJson<String?>(trainerId),
      'userId': serializer.toJson<String?>(userId),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String?>(email),
      'phone': serializer.toJson<String?>(phone),
      'avatarPath': serializer.toJson<String?>(avatarPath),
      'status': serializer.toJson<String>(status),
      'dateOfBirth': serializer.toJson<DateTime?>(dateOfBirth),
      'goals': serializer.toJson<String?>(goals),
      'healthNotes': serializer.toJson<String?>(healthNotes),
      'emergencyContactName': serializer.toJson<String?>(emergencyContactName),
      'emergencyContactPhone': serializer.toJson<String?>(
        emergencyContactPhone,
      ),
      'checkInDay': serializer.toJson<int?>(checkInDay),
      'checkInHour': serializer.toJson<int?>(checkInHour),
      'dataSharingExpiresAt': serializer.toJson<DateTime?>(
        dataSharingExpiresAt,
      ),
      'sharingSettings': serializer.toJson<String?>(sharingSettings),
      'widgetConfig': serializer.toJson<String?>(widgetConfig),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'deletedAt': serializer.toJson<int?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  ClientEntity copyWith({
    String? id,
    Value<String?> trainerId = const Value.absent(),
    Value<String?> userId = const Value.absent(),
    String? name,
    Value<String?> email = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> avatarPath = const Value.absent(),
    String? status,
    Value<DateTime?> dateOfBirth = const Value.absent(),
    Value<String?> goals = const Value.absent(),
    Value<String?> healthNotes = const Value.absent(),
    Value<String?> emergencyContactName = const Value.absent(),
    Value<String?> emergencyContactPhone = const Value.absent(),
    Value<int?> checkInDay = const Value.absent(),
    Value<int?> checkInHour = const Value.absent(),
    Value<DateTime?> dataSharingExpiresAt = const Value.absent(),
    Value<String?> sharingSettings = const Value.absent(),
    Value<String?> widgetConfig = const Value.absent(),
    int? createdAt,
    int? updatedAt,
    Value<int?> deletedAt = const Value.absent(),
    String? syncStatus,
  }) => ClientEntity(
    id: id ?? this.id,
    trainerId: trainerId.present ? trainerId.value : this.trainerId,
    userId: userId.present ? userId.value : this.userId,
    name: name ?? this.name,
    email: email.present ? email.value : this.email,
    phone: phone.present ? phone.value : this.phone,
    avatarPath: avatarPath.present ? avatarPath.value : this.avatarPath,
    status: status ?? this.status,
    dateOfBirth: dateOfBirth.present ? dateOfBirth.value : this.dateOfBirth,
    goals: goals.present ? goals.value : this.goals,
    healthNotes: healthNotes.present ? healthNotes.value : this.healthNotes,
    emergencyContactName: emergencyContactName.present
        ? emergencyContactName.value
        : this.emergencyContactName,
    emergencyContactPhone: emergencyContactPhone.present
        ? emergencyContactPhone.value
        : this.emergencyContactPhone,
    checkInDay: checkInDay.present ? checkInDay.value : this.checkInDay,
    checkInHour: checkInHour.present ? checkInHour.value : this.checkInHour,
    dataSharingExpiresAt: dataSharingExpiresAt.present
        ? dataSharingExpiresAt.value
        : this.dataSharingExpiresAt,
    sharingSettings: sharingSettings.present
        ? sharingSettings.value
        : this.sharingSettings,
    widgetConfig: widgetConfig.present ? widgetConfig.value : this.widgetConfig,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  ClientEntity copyWithCompanion(ClientsTableCompanion data) {
    return ClientEntity(
      id: data.id.present ? data.id.value : this.id,
      trainerId: data.trainerId.present ? data.trainerId.value : this.trainerId,
      userId: data.userId.present ? data.userId.value : this.userId,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      phone: data.phone.present ? data.phone.value : this.phone,
      avatarPath: data.avatarPath.present
          ? data.avatarPath.value
          : this.avatarPath,
      status: data.status.present ? data.status.value : this.status,
      dateOfBirth: data.dateOfBirth.present
          ? data.dateOfBirth.value
          : this.dateOfBirth,
      goals: data.goals.present ? data.goals.value : this.goals,
      healthNotes: data.healthNotes.present
          ? data.healthNotes.value
          : this.healthNotes,
      emergencyContactName: data.emergencyContactName.present
          ? data.emergencyContactName.value
          : this.emergencyContactName,
      emergencyContactPhone: data.emergencyContactPhone.present
          ? data.emergencyContactPhone.value
          : this.emergencyContactPhone,
      checkInDay: data.checkInDay.present
          ? data.checkInDay.value
          : this.checkInDay,
      checkInHour: data.checkInHour.present
          ? data.checkInHour.value
          : this.checkInHour,
      dataSharingExpiresAt: data.dataSharingExpiresAt.present
          ? data.dataSharingExpiresAt.value
          : this.dataSharingExpiresAt,
      sharingSettings: data.sharingSettings.present
          ? data.sharingSettings.value
          : this.sharingSettings,
      widgetConfig: data.widgetConfig.present
          ? data.widgetConfig.value
          : this.widgetConfig,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ClientEntity(')
          ..write('id: $id, ')
          ..write('trainerId: $trainerId, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('avatarPath: $avatarPath, ')
          ..write('status: $status, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('goals: $goals, ')
          ..write('healthNotes: $healthNotes, ')
          ..write('emergencyContactName: $emergencyContactName, ')
          ..write('emergencyContactPhone: $emergencyContactPhone, ')
          ..write('checkInDay: $checkInDay, ')
          ..write('checkInHour: $checkInHour, ')
          ..write('dataSharingExpiresAt: $dataSharingExpiresAt, ')
          ..write('sharingSettings: $sharingSettings, ')
          ..write('widgetConfig: $widgetConfig, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    trainerId,
    userId,
    name,
    email,
    phone,
    avatarPath,
    status,
    dateOfBirth,
    goals,
    healthNotes,
    emergencyContactName,
    emergencyContactPhone,
    checkInDay,
    checkInHour,
    dataSharingExpiresAt,
    sharingSettings,
    widgetConfig,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClientEntity &&
          other.id == this.id &&
          other.trainerId == this.trainerId &&
          other.userId == this.userId &&
          other.name == this.name &&
          other.email == this.email &&
          other.phone == this.phone &&
          other.avatarPath == this.avatarPath &&
          other.status == this.status &&
          other.dateOfBirth == this.dateOfBirth &&
          other.goals == this.goals &&
          other.healthNotes == this.healthNotes &&
          other.emergencyContactName == this.emergencyContactName &&
          other.emergencyContactPhone == this.emergencyContactPhone &&
          other.checkInDay == this.checkInDay &&
          other.checkInHour == this.checkInHour &&
          other.dataSharingExpiresAt == this.dataSharingExpiresAt &&
          other.sharingSettings == this.sharingSettings &&
          other.widgetConfig == this.widgetConfig &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus);
}

class ClientsTableCompanion extends UpdateCompanion<ClientEntity> {
  final Value<String> id;
  final Value<String?> trainerId;
  final Value<String?> userId;
  final Value<String> name;
  final Value<String?> email;
  final Value<String?> phone;
  final Value<String?> avatarPath;
  final Value<String> status;
  final Value<DateTime?> dateOfBirth;
  final Value<String?> goals;
  final Value<String?> healthNotes;
  final Value<String?> emergencyContactName;
  final Value<String?> emergencyContactPhone;
  final Value<int?> checkInDay;
  final Value<int?> checkInHour;
  final Value<DateTime?> dataSharingExpiresAt;
  final Value<String?> sharingSettings;
  final Value<String?> widgetConfig;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int?> deletedAt;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const ClientsTableCompanion({
    this.id = const Value.absent(),
    this.trainerId = const Value.absent(),
    this.userId = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.avatarPath = const Value.absent(),
    this.status = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.goals = const Value.absent(),
    this.healthNotes = const Value.absent(),
    this.emergencyContactName = const Value.absent(),
    this.emergencyContactPhone = const Value.absent(),
    this.checkInDay = const Value.absent(),
    this.checkInHour = const Value.absent(),
    this.dataSharingExpiresAt = const Value.absent(),
    this.sharingSettings = const Value.absent(),
    this.widgetConfig = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ClientsTableCompanion.insert({
    this.id = const Value.absent(),
    this.trainerId = const Value.absent(),
    this.userId = const Value.absent(),
    required String name,
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.avatarPath = const Value.absent(),
    this.status = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.goals = const Value.absent(),
    this.healthNotes = const Value.absent(),
    this.emergencyContactName = const Value.absent(),
    this.emergencyContactPhone = const Value.absent(),
    this.checkInDay = const Value.absent(),
    this.checkInHour = const Value.absent(),
    this.dataSharingExpiresAt = const Value.absent(),
    this.sharingSettings = const Value.absent(),
    this.widgetConfig = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ClientEntity> custom({
    Expression<String>? id,
    Expression<String>? trainerId,
    Expression<String>? userId,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? phone,
    Expression<String>? avatarPath,
    Expression<String>? status,
    Expression<DateTime>? dateOfBirth,
    Expression<String>? goals,
    Expression<String>? healthNotes,
    Expression<String>? emergencyContactName,
    Expression<String>? emergencyContactPhone,
    Expression<int>? checkInDay,
    Expression<int>? checkInHour,
    Expression<DateTime>? dataSharingExpiresAt,
    Expression<String>? sharingSettings,
    Expression<String>? widgetConfig,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? deletedAt,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (trainerId != null) 'trainer_id': trainerId,
      if (userId != null) 'user_id': userId,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (avatarPath != null) 'avatar_path': avatarPath,
      if (status != null) 'status': status,
      if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
      if (goals != null) 'goals': goals,
      if (healthNotes != null) 'health_notes': healthNotes,
      if (emergencyContactName != null)
        'emergency_contact_name': emergencyContactName,
      if (emergencyContactPhone != null)
        'emergency_contact_phone': emergencyContactPhone,
      if (checkInDay != null) 'check_in_day': checkInDay,
      if (checkInHour != null) 'check_in_hour': checkInHour,
      if (dataSharingExpiresAt != null)
        'data_sharing_expires_at': dataSharingExpiresAt,
      if (sharingSettings != null) 'sharing_settings': sharingSettings,
      if (widgetConfig != null) 'widget_config': widgetConfig,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ClientsTableCompanion copyWith({
    Value<String>? id,
    Value<String?>? trainerId,
    Value<String?>? userId,
    Value<String>? name,
    Value<String?>? email,
    Value<String?>? phone,
    Value<String?>? avatarPath,
    Value<String>? status,
    Value<DateTime?>? dateOfBirth,
    Value<String?>? goals,
    Value<String?>? healthNotes,
    Value<String?>? emergencyContactName,
    Value<String?>? emergencyContactPhone,
    Value<int?>? checkInDay,
    Value<int?>? checkInHour,
    Value<DateTime?>? dataSharingExpiresAt,
    Value<String?>? sharingSettings,
    Value<String?>? widgetConfig,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int?>? deletedAt,
    Value<String>? syncStatus,
    Value<int>? rowid,
  }) {
    return ClientsTableCompanion(
      id: id ?? this.id,
      trainerId: trainerId ?? this.trainerId,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      avatarPath: avatarPath ?? this.avatarPath,
      status: status ?? this.status,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      goals: goals ?? this.goals,
      healthNotes: healthNotes ?? this.healthNotes,
      emergencyContactName: emergencyContactName ?? this.emergencyContactName,
      emergencyContactPhone:
          emergencyContactPhone ?? this.emergencyContactPhone,
      checkInDay: checkInDay ?? this.checkInDay,
      checkInHour: checkInHour ?? this.checkInHour,
      dataSharingExpiresAt: dataSharingExpiresAt ?? this.dataSharingExpiresAt,
      sharingSettings: sharingSettings ?? this.sharingSettings,
      widgetConfig: widgetConfig ?? this.widgetConfig,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (trainerId.present) {
      map['trainer_id'] = Variable<String>(trainerId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (avatarPath.present) {
      map['avatar_path'] = Variable<String>(avatarPath.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (dateOfBirth.present) {
      map['date_of_birth'] = Variable<DateTime>(dateOfBirth.value);
    }
    if (goals.present) {
      map['goals'] = Variable<String>(goals.value);
    }
    if (healthNotes.present) {
      map['health_notes'] = Variable<String>(healthNotes.value);
    }
    if (emergencyContactName.present) {
      map['emergency_contact_name'] = Variable<String>(
        emergencyContactName.value,
      );
    }
    if (emergencyContactPhone.present) {
      map['emergency_contact_phone'] = Variable<String>(
        emergencyContactPhone.value,
      );
    }
    if (checkInDay.present) {
      map['check_in_day'] = Variable<int>(checkInDay.value);
    }
    if (checkInHour.present) {
      map['check_in_hour'] = Variable<int>(checkInHour.value);
    }
    if (dataSharingExpiresAt.present) {
      map['data_sharing_expires_at'] = Variable<DateTime>(
        dataSharingExpiresAt.value,
      );
    }
    if (sharingSettings.present) {
      map['sharing_settings'] = Variable<String>(sharingSettings.value);
    }
    if (widgetConfig.present) {
      map['widget_config'] = Variable<String>(widgetConfig.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<int>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClientsTableCompanion(')
          ..write('id: $id, ')
          ..write('trainerId: $trainerId, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('avatarPath: $avatarPath, ')
          ..write('status: $status, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('goals: $goals, ')
          ..write('healthNotes: $healthNotes, ')
          ..write('emergencyContactName: $emergencyContactName, ')
          ..write('emergencyContactPhone: $emergencyContactPhone, ')
          ..write('checkInDay: $checkInDay, ')
          ..write('checkInHour: $checkInHour, ')
          ..write('dataSharingExpiresAt: $dataSharingExpiresAt, ')
          ..write('sharingSettings: $sharingSettings, ')
          ..write('widgetConfig: $widgetConfig, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProfilesTableTable extends ProfilesTable
    with TableInfo<$ProfilesTableTable, ProfileEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProfilesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _certificationsMeta = const VerificationMeta(
    'certifications',
  );
  @override
  late final GeneratedColumn<String> certifications = GeneratedColumn<String>(
    'certifications',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _aboutMeMeta = const VerificationMeta(
    'aboutMe',
  );
  @override
  late final GeneratedColumn<String> aboutMe = GeneratedColumn<String>(
    'about_me',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _philosophyMeta = const VerificationMeta(
    'philosophy',
  );
  @override
  late final GeneratedColumn<String> philosophy = GeneratedColumn<String>(
    'philosophy',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _methodologyMeta = const VerificationMeta(
    'methodology',
  );
  @override
  late final GeneratedColumn<String> methodology = GeneratedColumn<String>(
    'methodology',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _brandingMeta = const VerificationMeta(
    'branding',
  );
  @override
  late final GeneratedColumn<String> branding = GeneratedColumn<String>(
    'branding',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bannerImagePathMeta = const VerificationMeta(
    'bannerImagePath',
  );
  @override
  late final GeneratedColumn<String> bannerImagePath = GeneratedColumn<String>(
    'banner_image_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _customDomainMeta = const VerificationMeta(
    'customDomain',
  );
  @override
  late final GeneratedColumn<String> customDomain = GeneratedColumn<String>(
    'custom_domain',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _domainVerifiedMeta = const VerificationMeta(
    'domainVerified',
  );
  @override
  late final GeneratedColumn<bool> domainVerified = GeneratedColumn<bool>(
    'domain_verified',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("domain_verified" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _profilePhotoPathMeta = const VerificationMeta(
    'profilePhotoPath',
  );
  @override
  late final GeneratedColumn<String> profilePhotoPath = GeneratedColumn<String>(
    'profile_photo_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _specialtiesMeta = const VerificationMeta(
    'specialties',
  );
  @override
  late final GeneratedColumn<String> specialties = GeneratedColumn<String>(
    'specialties',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _trainingTypesMeta = const VerificationMeta(
    'trainingTypes',
  );
  @override
  late final GeneratedColumn<String> trainingTypes = GeneratedColumn<String>(
    'training_types',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _businessCurrencyMeta = const VerificationMeta(
    'businessCurrency',
  );
  @override
  late final GeneratedColumn<String> businessCurrency = GeneratedColumn<String>(
    'business_currency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('PLN'),
  );
  static const VerificationMeta _averageRatingMeta = const VerificationMeta(
    'averageRating',
  );
  @override
  late final GeneratedColumn<double> averageRating = GeneratedColumn<double>(
    'average_rating',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _completionPercentageMeta =
      const VerificationMeta('completionPercentage');
  @override
  late final GeneratedColumn<int> completionPercentage = GeneratedColumn<int>(
    'completion_percentage',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _missingFieldsMeta = const VerificationMeta(
    'missingFields',
  );
  @override
  late final GeneratedColumn<String> missingFields = GeneratedColumn<String>(
    'missing_fields',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isVerifiedMeta = const VerificationMeta(
    'isVerified',
  );
  @override
  late final GeneratedColumn<bool> isVerified = GeneratedColumn<bool>(
    'is_verified',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_verified" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _availabilityMeta = const VerificationMeta(
    'availability',
  );
  @override
  late final GeneratedColumn<String> availability = GeneratedColumn<String>(
    'availability',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _minServicePriceMeta = const VerificationMeta(
    'minServicePrice',
  );
  @override
  late final GeneratedColumn<double> minServicePrice = GeneratedColumn<double>(
    'min_service_price',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<int> deletedAt = GeneratedColumn<int>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    certifications,
    phone,
    aboutMe,
    philosophy,
    methodology,
    branding,
    bannerImagePath,
    customDomain,
    domainVerified,
    profilePhotoPath,
    specialties,
    trainingTypes,
    businessCurrency,
    averageRating,
    completionPercentage,
    missingFields,
    isVerified,
    availability,
    minServicePrice,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'profiles_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProfileEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('certifications')) {
      context.handle(
        _certificationsMeta,
        certifications.isAcceptableOrUnknown(
          data['certifications']!,
          _certificationsMeta,
        ),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('about_me')) {
      context.handle(
        _aboutMeMeta,
        aboutMe.isAcceptableOrUnknown(data['about_me']!, _aboutMeMeta),
      );
    }
    if (data.containsKey('philosophy')) {
      context.handle(
        _philosophyMeta,
        philosophy.isAcceptableOrUnknown(data['philosophy']!, _philosophyMeta),
      );
    }
    if (data.containsKey('methodology')) {
      context.handle(
        _methodologyMeta,
        methodology.isAcceptableOrUnknown(
          data['methodology']!,
          _methodologyMeta,
        ),
      );
    }
    if (data.containsKey('branding')) {
      context.handle(
        _brandingMeta,
        branding.isAcceptableOrUnknown(data['branding']!, _brandingMeta),
      );
    }
    if (data.containsKey('banner_image_path')) {
      context.handle(
        _bannerImagePathMeta,
        bannerImagePath.isAcceptableOrUnknown(
          data['banner_image_path']!,
          _bannerImagePathMeta,
        ),
      );
    }
    if (data.containsKey('custom_domain')) {
      context.handle(
        _customDomainMeta,
        customDomain.isAcceptableOrUnknown(
          data['custom_domain']!,
          _customDomainMeta,
        ),
      );
    }
    if (data.containsKey('domain_verified')) {
      context.handle(
        _domainVerifiedMeta,
        domainVerified.isAcceptableOrUnknown(
          data['domain_verified']!,
          _domainVerifiedMeta,
        ),
      );
    }
    if (data.containsKey('profile_photo_path')) {
      context.handle(
        _profilePhotoPathMeta,
        profilePhotoPath.isAcceptableOrUnknown(
          data['profile_photo_path']!,
          _profilePhotoPathMeta,
        ),
      );
    }
    if (data.containsKey('specialties')) {
      context.handle(
        _specialtiesMeta,
        specialties.isAcceptableOrUnknown(
          data['specialties']!,
          _specialtiesMeta,
        ),
      );
    }
    if (data.containsKey('training_types')) {
      context.handle(
        _trainingTypesMeta,
        trainingTypes.isAcceptableOrUnknown(
          data['training_types']!,
          _trainingTypesMeta,
        ),
      );
    }
    if (data.containsKey('business_currency')) {
      context.handle(
        _businessCurrencyMeta,
        businessCurrency.isAcceptableOrUnknown(
          data['business_currency']!,
          _businessCurrencyMeta,
        ),
      );
    }
    if (data.containsKey('average_rating')) {
      context.handle(
        _averageRatingMeta,
        averageRating.isAcceptableOrUnknown(
          data['average_rating']!,
          _averageRatingMeta,
        ),
      );
    }
    if (data.containsKey('completion_percentage')) {
      context.handle(
        _completionPercentageMeta,
        completionPercentage.isAcceptableOrUnknown(
          data['completion_percentage']!,
          _completionPercentageMeta,
        ),
      );
    }
    if (data.containsKey('missing_fields')) {
      context.handle(
        _missingFieldsMeta,
        missingFields.isAcceptableOrUnknown(
          data['missing_fields']!,
          _missingFieldsMeta,
        ),
      );
    }
    if (data.containsKey('is_verified')) {
      context.handle(
        _isVerifiedMeta,
        isVerified.isAcceptableOrUnknown(data['is_verified']!, _isVerifiedMeta),
      );
    }
    if (data.containsKey('availability')) {
      context.handle(
        _availabilityMeta,
        availability.isAcceptableOrUnknown(
          data['availability']!,
          _availabilityMeta,
        ),
      );
    }
    if (data.containsKey('min_service_price')) {
      context.handle(
        _minServicePriceMeta,
        minServicePrice.isAcceptableOrUnknown(
          data['min_service_price']!,
          _minServicePriceMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProfileEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProfileEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      certifications: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}certifications'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      aboutMe: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}about_me'],
      ),
      philosophy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}philosophy'],
      ),
      methodology: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}methodology'],
      ),
      branding: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}branding'],
      ),
      bannerImagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}banner_image_path'],
      ),
      customDomain: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}custom_domain'],
      ),
      domainVerified: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}domain_verified'],
      )!,
      profilePhotoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}profile_photo_path'],
      ),
      specialties: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}specialties'],
      )!,
      trainingTypes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}training_types'],
      )!,
      businessCurrency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}business_currency'],
      )!,
      averageRating: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}average_rating'],
      ),
      completionPercentage: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}completion_percentage'],
      )!,
      missingFields: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}missing_fields'],
      ),
      isVerified: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_verified'],
      )!,
      availability: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}availability'],
      ),
      minServicePrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}min_service_price'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
    );
  }

  @override
  $ProfilesTableTable createAlias(String alias) {
    return $ProfilesTableTable(attachedDatabase, alias);
  }
}

class ProfileEntity extends DataClass implements Insertable<ProfileEntity> {
  final String id;
  final String userId;
  final String? certifications;
  final String? phone;
  final String? aboutMe;
  final String? philosophy;
  final String? methodology;
  final String? branding;
  final String? bannerImagePath;
  final String? customDomain;
  final bool domainVerified;
  final String? profilePhotoPath;
  final String specialties;
  final String trainingTypes;
  final String businessCurrency;
  final double? averageRating;
  final int completionPercentage;
  final String? missingFields;
  final bool isVerified;
  final String? availability;
  final double? minServicePrice;
  final int createdAt;
  final int updatedAt;
  final int? deletedAt;
  final String syncStatus;
  const ProfileEntity({
    required this.id,
    required this.userId,
    this.certifications,
    this.phone,
    this.aboutMe,
    this.philosophy,
    this.methodology,
    this.branding,
    this.bannerImagePath,
    this.customDomain,
    required this.domainVerified,
    this.profilePhotoPath,
    required this.specialties,
    required this.trainingTypes,
    required this.businessCurrency,
    this.averageRating,
    required this.completionPercentage,
    this.missingFields,
    required this.isVerified,
    this.availability,
    this.minServicePrice,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || certifications != null) {
      map['certifications'] = Variable<String>(certifications);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || aboutMe != null) {
      map['about_me'] = Variable<String>(aboutMe);
    }
    if (!nullToAbsent || philosophy != null) {
      map['philosophy'] = Variable<String>(philosophy);
    }
    if (!nullToAbsent || methodology != null) {
      map['methodology'] = Variable<String>(methodology);
    }
    if (!nullToAbsent || branding != null) {
      map['branding'] = Variable<String>(branding);
    }
    if (!nullToAbsent || bannerImagePath != null) {
      map['banner_image_path'] = Variable<String>(bannerImagePath);
    }
    if (!nullToAbsent || customDomain != null) {
      map['custom_domain'] = Variable<String>(customDomain);
    }
    map['domain_verified'] = Variable<bool>(domainVerified);
    if (!nullToAbsent || profilePhotoPath != null) {
      map['profile_photo_path'] = Variable<String>(profilePhotoPath);
    }
    map['specialties'] = Variable<String>(specialties);
    map['training_types'] = Variable<String>(trainingTypes);
    map['business_currency'] = Variable<String>(businessCurrency);
    if (!nullToAbsent || averageRating != null) {
      map['average_rating'] = Variable<double>(averageRating);
    }
    map['completion_percentage'] = Variable<int>(completionPercentage);
    if (!nullToAbsent || missingFields != null) {
      map['missing_fields'] = Variable<String>(missingFields);
    }
    map['is_verified'] = Variable<bool>(isVerified);
    if (!nullToAbsent || availability != null) {
      map['availability'] = Variable<String>(availability);
    }
    if (!nullToAbsent || minServicePrice != null) {
      map['min_service_price'] = Variable<double>(minServicePrice);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<int>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  ProfilesTableCompanion toCompanion(bool nullToAbsent) {
    return ProfilesTableCompanion(
      id: Value(id),
      userId: Value(userId),
      certifications: certifications == null && nullToAbsent
          ? const Value.absent()
          : Value(certifications),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      aboutMe: aboutMe == null && nullToAbsent
          ? const Value.absent()
          : Value(aboutMe),
      philosophy: philosophy == null && nullToAbsent
          ? const Value.absent()
          : Value(philosophy),
      methodology: methodology == null && nullToAbsent
          ? const Value.absent()
          : Value(methodology),
      branding: branding == null && nullToAbsent
          ? const Value.absent()
          : Value(branding),
      bannerImagePath: bannerImagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(bannerImagePath),
      customDomain: customDomain == null && nullToAbsent
          ? const Value.absent()
          : Value(customDomain),
      domainVerified: Value(domainVerified),
      profilePhotoPath: profilePhotoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(profilePhotoPath),
      specialties: Value(specialties),
      trainingTypes: Value(trainingTypes),
      businessCurrency: Value(businessCurrency),
      averageRating: averageRating == null && nullToAbsent
          ? const Value.absent()
          : Value(averageRating),
      completionPercentage: Value(completionPercentage),
      missingFields: missingFields == null && nullToAbsent
          ? const Value.absent()
          : Value(missingFields),
      isVerified: Value(isVerified),
      availability: availability == null && nullToAbsent
          ? const Value.absent()
          : Value(availability),
      minServicePrice: minServicePrice == null && nullToAbsent
          ? const Value.absent()
          : Value(minServicePrice),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory ProfileEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProfileEntity(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      certifications: serializer.fromJson<String?>(json['certifications']),
      phone: serializer.fromJson<String?>(json['phone']),
      aboutMe: serializer.fromJson<String?>(json['aboutMe']),
      philosophy: serializer.fromJson<String?>(json['philosophy']),
      methodology: serializer.fromJson<String?>(json['methodology']),
      branding: serializer.fromJson<String?>(json['branding']),
      bannerImagePath: serializer.fromJson<String?>(json['bannerImagePath']),
      customDomain: serializer.fromJson<String?>(json['customDomain']),
      domainVerified: serializer.fromJson<bool>(json['domainVerified']),
      profilePhotoPath: serializer.fromJson<String?>(json['profilePhotoPath']),
      specialties: serializer.fromJson<String>(json['specialties']),
      trainingTypes: serializer.fromJson<String>(json['trainingTypes']),
      businessCurrency: serializer.fromJson<String>(json['businessCurrency']),
      averageRating: serializer.fromJson<double?>(json['averageRating']),
      completionPercentage: serializer.fromJson<int>(
        json['completionPercentage'],
      ),
      missingFields: serializer.fromJson<String?>(json['missingFields']),
      isVerified: serializer.fromJson<bool>(json['isVerified']),
      availability: serializer.fromJson<String?>(json['availability']),
      minServicePrice: serializer.fromJson<double?>(json['minServicePrice']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      deletedAt: serializer.fromJson<int?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'certifications': serializer.toJson<String?>(certifications),
      'phone': serializer.toJson<String?>(phone),
      'aboutMe': serializer.toJson<String?>(aboutMe),
      'philosophy': serializer.toJson<String?>(philosophy),
      'methodology': serializer.toJson<String?>(methodology),
      'branding': serializer.toJson<String?>(branding),
      'bannerImagePath': serializer.toJson<String?>(bannerImagePath),
      'customDomain': serializer.toJson<String?>(customDomain),
      'domainVerified': serializer.toJson<bool>(domainVerified),
      'profilePhotoPath': serializer.toJson<String?>(profilePhotoPath),
      'specialties': serializer.toJson<String>(specialties),
      'trainingTypes': serializer.toJson<String>(trainingTypes),
      'businessCurrency': serializer.toJson<String>(businessCurrency),
      'averageRating': serializer.toJson<double?>(averageRating),
      'completionPercentage': serializer.toJson<int>(completionPercentage),
      'missingFields': serializer.toJson<String?>(missingFields),
      'isVerified': serializer.toJson<bool>(isVerified),
      'availability': serializer.toJson<String?>(availability),
      'minServicePrice': serializer.toJson<double?>(minServicePrice),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'deletedAt': serializer.toJson<int?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  ProfileEntity copyWith({
    String? id,
    String? userId,
    Value<String?> certifications = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> aboutMe = const Value.absent(),
    Value<String?> philosophy = const Value.absent(),
    Value<String?> methodology = const Value.absent(),
    Value<String?> branding = const Value.absent(),
    Value<String?> bannerImagePath = const Value.absent(),
    Value<String?> customDomain = const Value.absent(),
    bool? domainVerified,
    Value<String?> profilePhotoPath = const Value.absent(),
    String? specialties,
    String? trainingTypes,
    String? businessCurrency,
    Value<double?> averageRating = const Value.absent(),
    int? completionPercentage,
    Value<String?> missingFields = const Value.absent(),
    bool? isVerified,
    Value<String?> availability = const Value.absent(),
    Value<double?> minServicePrice = const Value.absent(),
    int? createdAt,
    int? updatedAt,
    Value<int?> deletedAt = const Value.absent(),
    String? syncStatus,
  }) => ProfileEntity(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    certifications: certifications.present
        ? certifications.value
        : this.certifications,
    phone: phone.present ? phone.value : this.phone,
    aboutMe: aboutMe.present ? aboutMe.value : this.aboutMe,
    philosophy: philosophy.present ? philosophy.value : this.philosophy,
    methodology: methodology.present ? methodology.value : this.methodology,
    branding: branding.present ? branding.value : this.branding,
    bannerImagePath: bannerImagePath.present
        ? bannerImagePath.value
        : this.bannerImagePath,
    customDomain: customDomain.present ? customDomain.value : this.customDomain,
    domainVerified: domainVerified ?? this.domainVerified,
    profilePhotoPath: profilePhotoPath.present
        ? profilePhotoPath.value
        : this.profilePhotoPath,
    specialties: specialties ?? this.specialties,
    trainingTypes: trainingTypes ?? this.trainingTypes,
    businessCurrency: businessCurrency ?? this.businessCurrency,
    averageRating: averageRating.present
        ? averageRating.value
        : this.averageRating,
    completionPercentage: completionPercentage ?? this.completionPercentage,
    missingFields: missingFields.present
        ? missingFields.value
        : this.missingFields,
    isVerified: isVerified ?? this.isVerified,
    availability: availability.present ? availability.value : this.availability,
    minServicePrice: minServicePrice.present
        ? minServicePrice.value
        : this.minServicePrice,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  ProfileEntity copyWithCompanion(ProfilesTableCompanion data) {
    return ProfileEntity(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      certifications: data.certifications.present
          ? data.certifications.value
          : this.certifications,
      phone: data.phone.present ? data.phone.value : this.phone,
      aboutMe: data.aboutMe.present ? data.aboutMe.value : this.aboutMe,
      philosophy: data.philosophy.present
          ? data.philosophy.value
          : this.philosophy,
      methodology: data.methodology.present
          ? data.methodology.value
          : this.methodology,
      branding: data.branding.present ? data.branding.value : this.branding,
      bannerImagePath: data.bannerImagePath.present
          ? data.bannerImagePath.value
          : this.bannerImagePath,
      customDomain: data.customDomain.present
          ? data.customDomain.value
          : this.customDomain,
      domainVerified: data.domainVerified.present
          ? data.domainVerified.value
          : this.domainVerified,
      profilePhotoPath: data.profilePhotoPath.present
          ? data.profilePhotoPath.value
          : this.profilePhotoPath,
      specialties: data.specialties.present
          ? data.specialties.value
          : this.specialties,
      trainingTypes: data.trainingTypes.present
          ? data.trainingTypes.value
          : this.trainingTypes,
      businessCurrency: data.businessCurrency.present
          ? data.businessCurrency.value
          : this.businessCurrency,
      averageRating: data.averageRating.present
          ? data.averageRating.value
          : this.averageRating,
      completionPercentage: data.completionPercentage.present
          ? data.completionPercentage.value
          : this.completionPercentage,
      missingFields: data.missingFields.present
          ? data.missingFields.value
          : this.missingFields,
      isVerified: data.isVerified.present
          ? data.isVerified.value
          : this.isVerified,
      availability: data.availability.present
          ? data.availability.value
          : this.availability,
      minServicePrice: data.minServicePrice.present
          ? data.minServicePrice.value
          : this.minServicePrice,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProfileEntity(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('certifications: $certifications, ')
          ..write('phone: $phone, ')
          ..write('aboutMe: $aboutMe, ')
          ..write('philosophy: $philosophy, ')
          ..write('methodology: $methodology, ')
          ..write('branding: $branding, ')
          ..write('bannerImagePath: $bannerImagePath, ')
          ..write('customDomain: $customDomain, ')
          ..write('domainVerified: $domainVerified, ')
          ..write('profilePhotoPath: $profilePhotoPath, ')
          ..write('specialties: $specialties, ')
          ..write('trainingTypes: $trainingTypes, ')
          ..write('businessCurrency: $businessCurrency, ')
          ..write('averageRating: $averageRating, ')
          ..write('completionPercentage: $completionPercentage, ')
          ..write('missingFields: $missingFields, ')
          ..write('isVerified: $isVerified, ')
          ..write('availability: $availability, ')
          ..write('minServicePrice: $minServicePrice, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    userId,
    certifications,
    phone,
    aboutMe,
    philosophy,
    methodology,
    branding,
    bannerImagePath,
    customDomain,
    domainVerified,
    profilePhotoPath,
    specialties,
    trainingTypes,
    businessCurrency,
    averageRating,
    completionPercentage,
    missingFields,
    isVerified,
    availability,
    minServicePrice,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProfileEntity &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.certifications == this.certifications &&
          other.phone == this.phone &&
          other.aboutMe == this.aboutMe &&
          other.philosophy == this.philosophy &&
          other.methodology == this.methodology &&
          other.branding == this.branding &&
          other.bannerImagePath == this.bannerImagePath &&
          other.customDomain == this.customDomain &&
          other.domainVerified == this.domainVerified &&
          other.profilePhotoPath == this.profilePhotoPath &&
          other.specialties == this.specialties &&
          other.trainingTypes == this.trainingTypes &&
          other.businessCurrency == this.businessCurrency &&
          other.averageRating == this.averageRating &&
          other.completionPercentage == this.completionPercentage &&
          other.missingFields == this.missingFields &&
          other.isVerified == this.isVerified &&
          other.availability == this.availability &&
          other.minServicePrice == this.minServicePrice &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus);
}

class ProfilesTableCompanion extends UpdateCompanion<ProfileEntity> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String?> certifications;
  final Value<String?> phone;
  final Value<String?> aboutMe;
  final Value<String?> philosophy;
  final Value<String?> methodology;
  final Value<String?> branding;
  final Value<String?> bannerImagePath;
  final Value<String?> customDomain;
  final Value<bool> domainVerified;
  final Value<String?> profilePhotoPath;
  final Value<String> specialties;
  final Value<String> trainingTypes;
  final Value<String> businessCurrency;
  final Value<double?> averageRating;
  final Value<int> completionPercentage;
  final Value<String?> missingFields;
  final Value<bool> isVerified;
  final Value<String?> availability;
  final Value<double?> minServicePrice;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int?> deletedAt;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const ProfilesTableCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.certifications = const Value.absent(),
    this.phone = const Value.absent(),
    this.aboutMe = const Value.absent(),
    this.philosophy = const Value.absent(),
    this.methodology = const Value.absent(),
    this.branding = const Value.absent(),
    this.bannerImagePath = const Value.absent(),
    this.customDomain = const Value.absent(),
    this.domainVerified = const Value.absent(),
    this.profilePhotoPath = const Value.absent(),
    this.specialties = const Value.absent(),
    this.trainingTypes = const Value.absent(),
    this.businessCurrency = const Value.absent(),
    this.averageRating = const Value.absent(),
    this.completionPercentage = const Value.absent(),
    this.missingFields = const Value.absent(),
    this.isVerified = const Value.absent(),
    this.availability = const Value.absent(),
    this.minServicePrice = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProfilesTableCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    this.certifications = const Value.absent(),
    this.phone = const Value.absent(),
    this.aboutMe = const Value.absent(),
    this.philosophy = const Value.absent(),
    this.methodology = const Value.absent(),
    this.branding = const Value.absent(),
    this.bannerImagePath = const Value.absent(),
    this.customDomain = const Value.absent(),
    this.domainVerified = const Value.absent(),
    this.profilePhotoPath = const Value.absent(),
    this.specialties = const Value.absent(),
    this.trainingTypes = const Value.absent(),
    this.businessCurrency = const Value.absent(),
    this.averageRating = const Value.absent(),
    this.completionPercentage = const Value.absent(),
    this.missingFields = const Value.absent(),
    this.isVerified = const Value.absent(),
    this.availability = const Value.absent(),
    this.minServicePrice = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : userId = Value(userId),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ProfileEntity> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? certifications,
    Expression<String>? phone,
    Expression<String>? aboutMe,
    Expression<String>? philosophy,
    Expression<String>? methodology,
    Expression<String>? branding,
    Expression<String>? bannerImagePath,
    Expression<String>? customDomain,
    Expression<bool>? domainVerified,
    Expression<String>? profilePhotoPath,
    Expression<String>? specialties,
    Expression<String>? trainingTypes,
    Expression<String>? businessCurrency,
    Expression<double>? averageRating,
    Expression<int>? completionPercentage,
    Expression<String>? missingFields,
    Expression<bool>? isVerified,
    Expression<String>? availability,
    Expression<double>? minServicePrice,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? deletedAt,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (certifications != null) 'certifications': certifications,
      if (phone != null) 'phone': phone,
      if (aboutMe != null) 'about_me': aboutMe,
      if (philosophy != null) 'philosophy': philosophy,
      if (methodology != null) 'methodology': methodology,
      if (branding != null) 'branding': branding,
      if (bannerImagePath != null) 'banner_image_path': bannerImagePath,
      if (customDomain != null) 'custom_domain': customDomain,
      if (domainVerified != null) 'domain_verified': domainVerified,
      if (profilePhotoPath != null) 'profile_photo_path': profilePhotoPath,
      if (specialties != null) 'specialties': specialties,
      if (trainingTypes != null) 'training_types': trainingTypes,
      if (businessCurrency != null) 'business_currency': businessCurrency,
      if (averageRating != null) 'average_rating': averageRating,
      if (completionPercentage != null)
        'completion_percentage': completionPercentage,
      if (missingFields != null) 'missing_fields': missingFields,
      if (isVerified != null) 'is_verified': isVerified,
      if (availability != null) 'availability': availability,
      if (minServicePrice != null) 'min_service_price': minServicePrice,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProfilesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String?>? certifications,
    Value<String?>? phone,
    Value<String?>? aboutMe,
    Value<String?>? philosophy,
    Value<String?>? methodology,
    Value<String?>? branding,
    Value<String?>? bannerImagePath,
    Value<String?>? customDomain,
    Value<bool>? domainVerified,
    Value<String?>? profilePhotoPath,
    Value<String>? specialties,
    Value<String>? trainingTypes,
    Value<String>? businessCurrency,
    Value<double?>? averageRating,
    Value<int>? completionPercentage,
    Value<String?>? missingFields,
    Value<bool>? isVerified,
    Value<String?>? availability,
    Value<double?>? minServicePrice,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int?>? deletedAt,
    Value<String>? syncStatus,
    Value<int>? rowid,
  }) {
    return ProfilesTableCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      certifications: certifications ?? this.certifications,
      phone: phone ?? this.phone,
      aboutMe: aboutMe ?? this.aboutMe,
      philosophy: philosophy ?? this.philosophy,
      methodology: methodology ?? this.methodology,
      branding: branding ?? this.branding,
      bannerImagePath: bannerImagePath ?? this.bannerImagePath,
      customDomain: customDomain ?? this.customDomain,
      domainVerified: domainVerified ?? this.domainVerified,
      profilePhotoPath: profilePhotoPath ?? this.profilePhotoPath,
      specialties: specialties ?? this.specialties,
      trainingTypes: trainingTypes ?? this.trainingTypes,
      businessCurrency: businessCurrency ?? this.businessCurrency,
      averageRating: averageRating ?? this.averageRating,
      completionPercentage: completionPercentage ?? this.completionPercentage,
      missingFields: missingFields ?? this.missingFields,
      isVerified: isVerified ?? this.isVerified,
      availability: availability ?? this.availability,
      minServicePrice: minServicePrice ?? this.minServicePrice,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (certifications.present) {
      map['certifications'] = Variable<String>(certifications.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (aboutMe.present) {
      map['about_me'] = Variable<String>(aboutMe.value);
    }
    if (philosophy.present) {
      map['philosophy'] = Variable<String>(philosophy.value);
    }
    if (methodology.present) {
      map['methodology'] = Variable<String>(methodology.value);
    }
    if (branding.present) {
      map['branding'] = Variable<String>(branding.value);
    }
    if (bannerImagePath.present) {
      map['banner_image_path'] = Variable<String>(bannerImagePath.value);
    }
    if (customDomain.present) {
      map['custom_domain'] = Variable<String>(customDomain.value);
    }
    if (domainVerified.present) {
      map['domain_verified'] = Variable<bool>(domainVerified.value);
    }
    if (profilePhotoPath.present) {
      map['profile_photo_path'] = Variable<String>(profilePhotoPath.value);
    }
    if (specialties.present) {
      map['specialties'] = Variable<String>(specialties.value);
    }
    if (trainingTypes.present) {
      map['training_types'] = Variable<String>(trainingTypes.value);
    }
    if (businessCurrency.present) {
      map['business_currency'] = Variable<String>(businessCurrency.value);
    }
    if (averageRating.present) {
      map['average_rating'] = Variable<double>(averageRating.value);
    }
    if (completionPercentage.present) {
      map['completion_percentage'] = Variable<int>(completionPercentage.value);
    }
    if (missingFields.present) {
      map['missing_fields'] = Variable<String>(missingFields.value);
    }
    if (isVerified.present) {
      map['is_verified'] = Variable<bool>(isVerified.value);
    }
    if (availability.present) {
      map['availability'] = Variable<String>(availability.value);
    }
    if (minServicePrice.present) {
      map['min_service_price'] = Variable<double>(minServicePrice.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<int>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfilesTableCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('certifications: $certifications, ')
          ..write('phone: $phone, ')
          ..write('aboutMe: $aboutMe, ')
          ..write('philosophy: $philosophy, ')
          ..write('methodology: $methodology, ')
          ..write('branding: $branding, ')
          ..write('bannerImagePath: $bannerImagePath, ')
          ..write('customDomain: $customDomain, ')
          ..write('domainVerified: $domainVerified, ')
          ..write('profilePhotoPath: $profilePhotoPath, ')
          ..write('specialties: $specialties, ')
          ..write('trainingTypes: $trainingTypes, ')
          ..write('businessCurrency: $businessCurrency, ')
          ..write('averageRating: $averageRating, ')
          ..write('completionPercentage: $completionPercentage, ')
          ..write('missingFields: $missingFields, ')
          ..write('isVerified: $isVerified, ')
          ..write('availability: $availability, ')
          ..write('minServicePrice: $minServicePrice, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkoutSessionsTableTable extends WorkoutSessionsTable
    with TableInfo<$WorkoutSessionsTableTable, WorkoutSessionEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutSessionsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _clientIdMeta = const VerificationMeta(
    'clientId',
  );
  @override
  late final GeneratedColumn<String> clientId = GeneratedColumn<String>(
    'client_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startTimeMeta = const VerificationMeta(
    'startTime',
  );
  @override
  late final GeneratedColumn<int> startTime = GeneratedColumn<int>(
    'start_time',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endTimeMeta = const VerificationMeta(
    'endTime',
  );
  @override
  late final GeneratedColumn<int> endTime = GeneratedColumn<int>(
    'end_time',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('IN_PROGRESS'),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _restStartedAtMeta = const VerificationMeta(
    'restStartedAt',
  );
  @override
  late final GeneratedColumn<int> restStartedAt = GeneratedColumn<int>(
    'rest_started_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _workoutTemplateIdMeta = const VerificationMeta(
    'workoutTemplateId',
  );
  @override
  late final GeneratedColumn<String> workoutTemplateId =
      GeneratedColumn<String>(
        'workout_template_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _plannedDateMeta = const VerificationMeta(
    'plannedDate',
  );
  @override
  late final GeneratedColumn<int> plannedDate = GeneratedColumn<int>(
    'planned_date',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _clientPackageIdMeta = const VerificationMeta(
    'clientPackageId',
  );
  @override
  late final GeneratedColumn<String> clientPackageId = GeneratedColumn<String>(
    'client_package_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isTrainerLedMeta = const VerificationMeta(
    'isTrainerLed',
  );
  @override
  late final GeneratedColumn<bool> isTrainerLed = GeneratedColumn<bool>(
    'is_trainer_led',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_trainer_led" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _reminderTimeMeta = const VerificationMeta(
    'reminderTime',
  );
  @override
  late final GeneratedColumn<int> reminderTime = GeneratedColumn<int>(
    'reminder_time',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _trainerReminderSentMeta =
      const VerificationMeta('trainerReminderSent');
  @override
  late final GeneratedColumn<bool> trainerReminderSent = GeneratedColumn<bool>(
    'trainer_reminder_sent',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("trainer_reminder_sent" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _trainerNotesMeta = const VerificationMeta(
    'trainerNotes',
  );
  @override
  late final GeneratedColumn<String> trainerNotes = GeneratedColumn<String>(
    'trainer_notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _trainerNotesUpdatedAtMeta =
      const VerificationMeta('trainerNotesUpdatedAt');
  @override
  late final GeneratedColumn<int> trainerNotesUpdatedAt = GeneratedColumn<int>(
    'trainer_notes_updated_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<int> deletedAt = GeneratedColumn<int>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    clientId,
    name,
    startTime,
    endTime,
    status,
    notes,
    restStartedAt,
    workoutTemplateId,
    plannedDate,
    clientPackageId,
    isTrainerLed,
    reminderTime,
    trainerReminderSent,
    trainerNotes,
    trainerNotesUpdatedAt,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_sessions_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<WorkoutSessionEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('client_id')) {
      context.handle(
        _clientIdMeta,
        clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta),
      );
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('start_time')) {
      context.handle(
        _startTimeMeta,
        startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(
        _endTimeMeta,
        endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('rest_started_at')) {
      context.handle(
        _restStartedAtMeta,
        restStartedAt.isAcceptableOrUnknown(
          data['rest_started_at']!,
          _restStartedAtMeta,
        ),
      );
    }
    if (data.containsKey('workout_template_id')) {
      context.handle(
        _workoutTemplateIdMeta,
        workoutTemplateId.isAcceptableOrUnknown(
          data['workout_template_id']!,
          _workoutTemplateIdMeta,
        ),
      );
    }
    if (data.containsKey('planned_date')) {
      context.handle(
        _plannedDateMeta,
        plannedDate.isAcceptableOrUnknown(
          data['planned_date']!,
          _plannedDateMeta,
        ),
      );
    }
    if (data.containsKey('client_package_id')) {
      context.handle(
        _clientPackageIdMeta,
        clientPackageId.isAcceptableOrUnknown(
          data['client_package_id']!,
          _clientPackageIdMeta,
        ),
      );
    }
    if (data.containsKey('is_trainer_led')) {
      context.handle(
        _isTrainerLedMeta,
        isTrainerLed.isAcceptableOrUnknown(
          data['is_trainer_led']!,
          _isTrainerLedMeta,
        ),
      );
    }
    if (data.containsKey('reminder_time')) {
      context.handle(
        _reminderTimeMeta,
        reminderTime.isAcceptableOrUnknown(
          data['reminder_time']!,
          _reminderTimeMeta,
        ),
      );
    }
    if (data.containsKey('trainer_reminder_sent')) {
      context.handle(
        _trainerReminderSentMeta,
        trainerReminderSent.isAcceptableOrUnknown(
          data['trainer_reminder_sent']!,
          _trainerReminderSentMeta,
        ),
      );
    }
    if (data.containsKey('trainer_notes')) {
      context.handle(
        _trainerNotesMeta,
        trainerNotes.isAcceptableOrUnknown(
          data['trainer_notes']!,
          _trainerNotesMeta,
        ),
      );
    }
    if (data.containsKey('trainer_notes_updated_at')) {
      context.handle(
        _trainerNotesUpdatedAtMeta,
        trainerNotesUpdatedAt.isAcceptableOrUnknown(
          data['trainer_notes_updated_at']!,
          _trainerNotesUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutSessionEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutSessionEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      clientId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      startTime: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_time'],
      )!,
      endTime: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}end_time'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      restStartedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rest_started_at'],
      ),
      workoutTemplateId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}workout_template_id'],
      ),
      plannedDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}planned_date'],
      ),
      clientPackageId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_package_id'],
      ),
      isTrainerLed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_trainer_led'],
      )!,
      reminderTime: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reminder_time'],
      ),
      trainerReminderSent: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}trainer_reminder_sent'],
      )!,
      trainerNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}trainer_notes'],
      ),
      trainerNotesUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}trainer_notes_updated_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
    );
  }

  @override
  $WorkoutSessionsTableTable createAlias(String alias) {
    return $WorkoutSessionsTableTable(attachedDatabase, alias);
  }
}

class WorkoutSessionEntity extends DataClass
    implements Insertable<WorkoutSessionEntity> {
  final String id;
  final String clientId;
  final String? name;
  final int startTime;
  final int? endTime;
  final String status;
  final String? notes;
  final int? restStartedAt;
  final String? workoutTemplateId;
  final int? plannedDate;
  final String? clientPackageId;
  final bool isTrainerLed;
  final int? reminderTime;
  final bool trainerReminderSent;
  final String? trainerNotes;
  final int? trainerNotesUpdatedAt;
  final int createdAt;
  final int updatedAt;
  final int? deletedAt;
  final String syncStatus;
  const WorkoutSessionEntity({
    required this.id,
    required this.clientId,
    this.name,
    required this.startTime,
    this.endTime,
    required this.status,
    this.notes,
    this.restStartedAt,
    this.workoutTemplateId,
    this.plannedDate,
    this.clientPackageId,
    required this.isTrainerLed,
    this.reminderTime,
    required this.trainerReminderSent,
    this.trainerNotes,
    this.trainerNotesUpdatedAt,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['client_id'] = Variable<String>(clientId);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    map['start_time'] = Variable<int>(startTime);
    if (!nullToAbsent || endTime != null) {
      map['end_time'] = Variable<int>(endTime);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || restStartedAt != null) {
      map['rest_started_at'] = Variable<int>(restStartedAt);
    }
    if (!nullToAbsent || workoutTemplateId != null) {
      map['workout_template_id'] = Variable<String>(workoutTemplateId);
    }
    if (!nullToAbsent || plannedDate != null) {
      map['planned_date'] = Variable<int>(plannedDate);
    }
    if (!nullToAbsent || clientPackageId != null) {
      map['client_package_id'] = Variable<String>(clientPackageId);
    }
    map['is_trainer_led'] = Variable<bool>(isTrainerLed);
    if (!nullToAbsent || reminderTime != null) {
      map['reminder_time'] = Variable<int>(reminderTime);
    }
    map['trainer_reminder_sent'] = Variable<bool>(trainerReminderSent);
    if (!nullToAbsent || trainerNotes != null) {
      map['trainer_notes'] = Variable<String>(trainerNotes);
    }
    if (!nullToAbsent || trainerNotesUpdatedAt != null) {
      map['trainer_notes_updated_at'] = Variable<int>(trainerNotesUpdatedAt);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<int>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  WorkoutSessionsTableCompanion toCompanion(bool nullToAbsent) {
    return WorkoutSessionsTableCompanion(
      id: Value(id),
      clientId: Value(clientId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      startTime: Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      status: Value(status),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      restStartedAt: restStartedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(restStartedAt),
      workoutTemplateId: workoutTemplateId == null && nullToAbsent
          ? const Value.absent()
          : Value(workoutTemplateId),
      plannedDate: plannedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(plannedDate),
      clientPackageId: clientPackageId == null && nullToAbsent
          ? const Value.absent()
          : Value(clientPackageId),
      isTrainerLed: Value(isTrainerLed),
      reminderTime: reminderTime == null && nullToAbsent
          ? const Value.absent()
          : Value(reminderTime),
      trainerReminderSent: Value(trainerReminderSent),
      trainerNotes: trainerNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(trainerNotes),
      trainerNotesUpdatedAt: trainerNotesUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(trainerNotesUpdatedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory WorkoutSessionEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutSessionEntity(
      id: serializer.fromJson<String>(json['id']),
      clientId: serializer.fromJson<String>(json['clientId']),
      name: serializer.fromJson<String?>(json['name']),
      startTime: serializer.fromJson<int>(json['startTime']),
      endTime: serializer.fromJson<int?>(json['endTime']),
      status: serializer.fromJson<String>(json['status']),
      notes: serializer.fromJson<String?>(json['notes']),
      restStartedAt: serializer.fromJson<int?>(json['restStartedAt']),
      workoutTemplateId: serializer.fromJson<String?>(
        json['workoutTemplateId'],
      ),
      plannedDate: serializer.fromJson<int?>(json['plannedDate']),
      clientPackageId: serializer.fromJson<String?>(json['clientPackageId']),
      isTrainerLed: serializer.fromJson<bool>(json['isTrainerLed']),
      reminderTime: serializer.fromJson<int?>(json['reminderTime']),
      trainerReminderSent: serializer.fromJson<bool>(
        json['trainerReminderSent'],
      ),
      trainerNotes: serializer.fromJson<String?>(json['trainerNotes']),
      trainerNotesUpdatedAt: serializer.fromJson<int?>(
        json['trainerNotesUpdatedAt'],
      ),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      deletedAt: serializer.fromJson<int?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'clientId': serializer.toJson<String>(clientId),
      'name': serializer.toJson<String?>(name),
      'startTime': serializer.toJson<int>(startTime),
      'endTime': serializer.toJson<int?>(endTime),
      'status': serializer.toJson<String>(status),
      'notes': serializer.toJson<String?>(notes),
      'restStartedAt': serializer.toJson<int?>(restStartedAt),
      'workoutTemplateId': serializer.toJson<String?>(workoutTemplateId),
      'plannedDate': serializer.toJson<int?>(plannedDate),
      'clientPackageId': serializer.toJson<String?>(clientPackageId),
      'isTrainerLed': serializer.toJson<bool>(isTrainerLed),
      'reminderTime': serializer.toJson<int?>(reminderTime),
      'trainerReminderSent': serializer.toJson<bool>(trainerReminderSent),
      'trainerNotes': serializer.toJson<String?>(trainerNotes),
      'trainerNotesUpdatedAt': serializer.toJson<int?>(trainerNotesUpdatedAt),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'deletedAt': serializer.toJson<int?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  WorkoutSessionEntity copyWith({
    String? id,
    String? clientId,
    Value<String?> name = const Value.absent(),
    int? startTime,
    Value<int?> endTime = const Value.absent(),
    String? status,
    Value<String?> notes = const Value.absent(),
    Value<int?> restStartedAt = const Value.absent(),
    Value<String?> workoutTemplateId = const Value.absent(),
    Value<int?> plannedDate = const Value.absent(),
    Value<String?> clientPackageId = const Value.absent(),
    bool? isTrainerLed,
    Value<int?> reminderTime = const Value.absent(),
    bool? trainerReminderSent,
    Value<String?> trainerNotes = const Value.absent(),
    Value<int?> trainerNotesUpdatedAt = const Value.absent(),
    int? createdAt,
    int? updatedAt,
    Value<int?> deletedAt = const Value.absent(),
    String? syncStatus,
  }) => WorkoutSessionEntity(
    id: id ?? this.id,
    clientId: clientId ?? this.clientId,
    name: name.present ? name.value : this.name,
    startTime: startTime ?? this.startTime,
    endTime: endTime.present ? endTime.value : this.endTime,
    status: status ?? this.status,
    notes: notes.present ? notes.value : this.notes,
    restStartedAt: restStartedAt.present
        ? restStartedAt.value
        : this.restStartedAt,
    workoutTemplateId: workoutTemplateId.present
        ? workoutTemplateId.value
        : this.workoutTemplateId,
    plannedDate: plannedDate.present ? plannedDate.value : this.plannedDate,
    clientPackageId: clientPackageId.present
        ? clientPackageId.value
        : this.clientPackageId,
    isTrainerLed: isTrainerLed ?? this.isTrainerLed,
    reminderTime: reminderTime.present ? reminderTime.value : this.reminderTime,
    trainerReminderSent: trainerReminderSent ?? this.trainerReminderSent,
    trainerNotes: trainerNotes.present ? trainerNotes.value : this.trainerNotes,
    trainerNotesUpdatedAt: trainerNotesUpdatedAt.present
        ? trainerNotesUpdatedAt.value
        : this.trainerNotesUpdatedAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  WorkoutSessionEntity copyWithCompanion(WorkoutSessionsTableCompanion data) {
    return WorkoutSessionEntity(
      id: data.id.present ? data.id.value : this.id,
      clientId: data.clientId.present ? data.clientId.value : this.clientId,
      name: data.name.present ? data.name.value : this.name,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      status: data.status.present ? data.status.value : this.status,
      notes: data.notes.present ? data.notes.value : this.notes,
      restStartedAt: data.restStartedAt.present
          ? data.restStartedAt.value
          : this.restStartedAt,
      workoutTemplateId: data.workoutTemplateId.present
          ? data.workoutTemplateId.value
          : this.workoutTemplateId,
      plannedDate: data.plannedDate.present
          ? data.plannedDate.value
          : this.plannedDate,
      clientPackageId: data.clientPackageId.present
          ? data.clientPackageId.value
          : this.clientPackageId,
      isTrainerLed: data.isTrainerLed.present
          ? data.isTrainerLed.value
          : this.isTrainerLed,
      reminderTime: data.reminderTime.present
          ? data.reminderTime.value
          : this.reminderTime,
      trainerReminderSent: data.trainerReminderSent.present
          ? data.trainerReminderSent.value
          : this.trainerReminderSent,
      trainerNotes: data.trainerNotes.present
          ? data.trainerNotes.value
          : this.trainerNotes,
      trainerNotesUpdatedAt: data.trainerNotesUpdatedAt.present
          ? data.trainerNotesUpdatedAt.value
          : this.trainerNotesUpdatedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutSessionEntity(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('name: $name, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('restStartedAt: $restStartedAt, ')
          ..write('workoutTemplateId: $workoutTemplateId, ')
          ..write('plannedDate: $plannedDate, ')
          ..write('clientPackageId: $clientPackageId, ')
          ..write('isTrainerLed: $isTrainerLed, ')
          ..write('reminderTime: $reminderTime, ')
          ..write('trainerReminderSent: $trainerReminderSent, ')
          ..write('trainerNotes: $trainerNotes, ')
          ..write('trainerNotesUpdatedAt: $trainerNotesUpdatedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    clientId,
    name,
    startTime,
    endTime,
    status,
    notes,
    restStartedAt,
    workoutTemplateId,
    plannedDate,
    clientPackageId,
    isTrainerLed,
    reminderTime,
    trainerReminderSent,
    trainerNotes,
    trainerNotesUpdatedAt,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutSessionEntity &&
          other.id == this.id &&
          other.clientId == this.clientId &&
          other.name == this.name &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.status == this.status &&
          other.notes == this.notes &&
          other.restStartedAt == this.restStartedAt &&
          other.workoutTemplateId == this.workoutTemplateId &&
          other.plannedDate == this.plannedDate &&
          other.clientPackageId == this.clientPackageId &&
          other.isTrainerLed == this.isTrainerLed &&
          other.reminderTime == this.reminderTime &&
          other.trainerReminderSent == this.trainerReminderSent &&
          other.trainerNotes == this.trainerNotes &&
          other.trainerNotesUpdatedAt == this.trainerNotesUpdatedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus);
}

class WorkoutSessionsTableCompanion
    extends UpdateCompanion<WorkoutSessionEntity> {
  final Value<String> id;
  final Value<String> clientId;
  final Value<String?> name;
  final Value<int> startTime;
  final Value<int?> endTime;
  final Value<String> status;
  final Value<String?> notes;
  final Value<int?> restStartedAt;
  final Value<String?> workoutTemplateId;
  final Value<int?> plannedDate;
  final Value<String?> clientPackageId;
  final Value<bool> isTrainerLed;
  final Value<int?> reminderTime;
  final Value<bool> trainerReminderSent;
  final Value<String?> trainerNotes;
  final Value<int?> trainerNotesUpdatedAt;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int?> deletedAt;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const WorkoutSessionsTableCompanion({
    this.id = const Value.absent(),
    this.clientId = const Value.absent(),
    this.name = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.restStartedAt = const Value.absent(),
    this.workoutTemplateId = const Value.absent(),
    this.plannedDate = const Value.absent(),
    this.clientPackageId = const Value.absent(),
    this.isTrainerLed = const Value.absent(),
    this.reminderTime = const Value.absent(),
    this.trainerReminderSent = const Value.absent(),
    this.trainerNotes = const Value.absent(),
    this.trainerNotesUpdatedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkoutSessionsTableCompanion.insert({
    this.id = const Value.absent(),
    required String clientId,
    this.name = const Value.absent(),
    required int startTime,
    this.endTime = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.restStartedAt = const Value.absent(),
    this.workoutTemplateId = const Value.absent(),
    this.plannedDate = const Value.absent(),
    this.clientPackageId = const Value.absent(),
    this.isTrainerLed = const Value.absent(),
    this.reminderTime = const Value.absent(),
    this.trainerReminderSent = const Value.absent(),
    this.trainerNotes = const Value.absent(),
    this.trainerNotesUpdatedAt = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : clientId = Value(clientId),
       startTime = Value(startTime),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<WorkoutSessionEntity> custom({
    Expression<String>? id,
    Expression<String>? clientId,
    Expression<String>? name,
    Expression<int>? startTime,
    Expression<int>? endTime,
    Expression<String>? status,
    Expression<String>? notes,
    Expression<int>? restStartedAt,
    Expression<String>? workoutTemplateId,
    Expression<int>? plannedDate,
    Expression<String>? clientPackageId,
    Expression<bool>? isTrainerLed,
    Expression<int>? reminderTime,
    Expression<bool>? trainerReminderSent,
    Expression<String>? trainerNotes,
    Expression<int>? trainerNotesUpdatedAt,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? deletedAt,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (clientId != null) 'client_id': clientId,
      if (name != null) 'name': name,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (status != null) 'status': status,
      if (notes != null) 'notes': notes,
      if (restStartedAt != null) 'rest_started_at': restStartedAt,
      if (workoutTemplateId != null) 'workout_template_id': workoutTemplateId,
      if (plannedDate != null) 'planned_date': plannedDate,
      if (clientPackageId != null) 'client_package_id': clientPackageId,
      if (isTrainerLed != null) 'is_trainer_led': isTrainerLed,
      if (reminderTime != null) 'reminder_time': reminderTime,
      if (trainerReminderSent != null)
        'trainer_reminder_sent': trainerReminderSent,
      if (trainerNotes != null) 'trainer_notes': trainerNotes,
      if (trainerNotesUpdatedAt != null)
        'trainer_notes_updated_at': trainerNotesUpdatedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkoutSessionsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? clientId,
    Value<String?>? name,
    Value<int>? startTime,
    Value<int?>? endTime,
    Value<String>? status,
    Value<String?>? notes,
    Value<int?>? restStartedAt,
    Value<String?>? workoutTemplateId,
    Value<int?>? plannedDate,
    Value<String?>? clientPackageId,
    Value<bool>? isTrainerLed,
    Value<int?>? reminderTime,
    Value<bool>? trainerReminderSent,
    Value<String?>? trainerNotes,
    Value<int?>? trainerNotesUpdatedAt,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int?>? deletedAt,
    Value<String>? syncStatus,
    Value<int>? rowid,
  }) {
    return WorkoutSessionsTableCompanion(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
      name: name ?? this.name,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      restStartedAt: restStartedAt ?? this.restStartedAt,
      workoutTemplateId: workoutTemplateId ?? this.workoutTemplateId,
      plannedDate: plannedDate ?? this.plannedDate,
      clientPackageId: clientPackageId ?? this.clientPackageId,
      isTrainerLed: isTrainerLed ?? this.isTrainerLed,
      reminderTime: reminderTime ?? this.reminderTime,
      trainerReminderSent: trainerReminderSent ?? this.trainerReminderSent,
      trainerNotes: trainerNotes ?? this.trainerNotes,
      trainerNotesUpdatedAt:
          trainerNotesUpdatedAt ?? this.trainerNotesUpdatedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<String>(clientId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<int>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<int>(endTime.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (restStartedAt.present) {
      map['rest_started_at'] = Variable<int>(restStartedAt.value);
    }
    if (workoutTemplateId.present) {
      map['workout_template_id'] = Variable<String>(workoutTemplateId.value);
    }
    if (plannedDate.present) {
      map['planned_date'] = Variable<int>(plannedDate.value);
    }
    if (clientPackageId.present) {
      map['client_package_id'] = Variable<String>(clientPackageId.value);
    }
    if (isTrainerLed.present) {
      map['is_trainer_led'] = Variable<bool>(isTrainerLed.value);
    }
    if (reminderTime.present) {
      map['reminder_time'] = Variable<int>(reminderTime.value);
    }
    if (trainerReminderSent.present) {
      map['trainer_reminder_sent'] = Variable<bool>(trainerReminderSent.value);
    }
    if (trainerNotes.present) {
      map['trainer_notes'] = Variable<String>(trainerNotes.value);
    }
    if (trainerNotesUpdatedAt.present) {
      map['trainer_notes_updated_at'] = Variable<int>(
        trainerNotesUpdatedAt.value,
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<int>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutSessionsTableCompanion(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('name: $name, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('restStartedAt: $restStartedAt, ')
          ..write('workoutTemplateId: $workoutTemplateId, ')
          ..write('plannedDate: $plannedDate, ')
          ..write('clientPackageId: $clientPackageId, ')
          ..write('isTrainerLed: $isTrainerLed, ')
          ..write('reminderTime: $reminderTime, ')
          ..write('trainerReminderSent: $trainerReminderSent, ')
          ..write('trainerNotes: $trainerNotes, ')
          ..write('trainerNotesUpdatedAt: $trainerNotesUpdatedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExercisesTableTable extends ExercisesTable
    with TableInfo<$ExercisesTableTable, ExerciseEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExercisesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _muscleGroupMeta = const VerificationMeta(
    'muscleGroup',
  );
  @override
  late final GeneratedColumn<String> muscleGroup = GeneratedColumn<String>(
    'muscle_group',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _equipmentMeta = const VerificationMeta(
    'equipment',
  );
  @override
  late final GeneratedColumn<String> equipment = GeneratedColumn<String>(
    'equipment',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _videoUrlMeta = const VerificationMeta(
    'videoUrl',
  );
  @override
  late final GeneratedColumn<String> videoUrl = GeneratedColumn<String>(
    'video_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdByIdMeta = const VerificationMeta(
    'createdById',
  );
  @override
  late final GeneratedColumn<String> createdById = GeneratedColumn<String>(
    'created_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _recommendedRestSecondsMeta =
      const VerificationMeta('recommendedRestSeconds');
  @override
  late final GeneratedColumn<int> recommendedRestSeconds = GeneratedColumn<int>(
    'recommended_rest_seconds',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isUnilateralMeta = const VerificationMeta(
    'isUnilateral',
  );
  @override
  late final GeneratedColumn<bool> isUnilateral = GeneratedColumn<bool>(
    'is_unilateral',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_unilateral" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<int> deletedAt = GeneratedColumn<int>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    muscleGroup,
    equipment,
    category,
    description,
    videoUrl,
    createdById,
    recommendedRestSeconds,
    isUnilateral,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercises_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExerciseEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('muscle_group')) {
      context.handle(
        _muscleGroupMeta,
        muscleGroup.isAcceptableOrUnknown(
          data['muscle_group']!,
          _muscleGroupMeta,
        ),
      );
    }
    if (data.containsKey('equipment')) {
      context.handle(
        _equipmentMeta,
        equipment.isAcceptableOrUnknown(data['equipment']!, _equipmentMeta),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('video_url')) {
      context.handle(
        _videoUrlMeta,
        videoUrl.isAcceptableOrUnknown(data['video_url']!, _videoUrlMeta),
      );
    }
    if (data.containsKey('created_by_id')) {
      context.handle(
        _createdByIdMeta,
        createdById.isAcceptableOrUnknown(
          data['created_by_id']!,
          _createdByIdMeta,
        ),
      );
    }
    if (data.containsKey('recommended_rest_seconds')) {
      context.handle(
        _recommendedRestSecondsMeta,
        recommendedRestSeconds.isAcceptableOrUnknown(
          data['recommended_rest_seconds']!,
          _recommendedRestSecondsMeta,
        ),
      );
    }
    if (data.containsKey('is_unilateral')) {
      context.handle(
        _isUnilateralMeta,
        isUnilateral.isAcceptableOrUnknown(
          data['is_unilateral']!,
          _isUnilateralMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExerciseEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExerciseEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      muscleGroup: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}muscle_group'],
      ),
      equipment: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}equipment'],
      ),
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      videoUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}video_url'],
      ),
      createdById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_id'],
      ),
      recommendedRestSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}recommended_rest_seconds'],
      ),
      isUnilateral: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_unilateral'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
    );
  }

  @override
  $ExercisesTableTable createAlias(String alias) {
    return $ExercisesTableTable(attachedDatabase, alias);
  }
}

class ExerciseEntity extends DataClass implements Insertable<ExerciseEntity> {
  final String id;
  final String name;
  final String? muscleGroup;
  final String? equipment;
  final String? category;
  final String? description;
  final String? videoUrl;
  final String? createdById;
  final int? recommendedRestSeconds;
  final bool isUnilateral;
  final int createdAt;
  final int updatedAt;
  final int? deletedAt;
  final String syncStatus;
  const ExerciseEntity({
    required this.id,
    required this.name,
    this.muscleGroup,
    this.equipment,
    this.category,
    this.description,
    this.videoUrl,
    this.createdById,
    this.recommendedRestSeconds,
    required this.isUnilateral,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || muscleGroup != null) {
      map['muscle_group'] = Variable<String>(muscleGroup);
    }
    if (!nullToAbsent || equipment != null) {
      map['equipment'] = Variable<String>(equipment);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || videoUrl != null) {
      map['video_url'] = Variable<String>(videoUrl);
    }
    if (!nullToAbsent || createdById != null) {
      map['created_by_id'] = Variable<String>(createdById);
    }
    if (!nullToAbsent || recommendedRestSeconds != null) {
      map['recommended_rest_seconds'] = Variable<int>(recommendedRestSeconds);
    }
    map['is_unilateral'] = Variable<bool>(isUnilateral);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<int>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  ExercisesTableCompanion toCompanion(bool nullToAbsent) {
    return ExercisesTableCompanion(
      id: Value(id),
      name: Value(name),
      muscleGroup: muscleGroup == null && nullToAbsent
          ? const Value.absent()
          : Value(muscleGroup),
      equipment: equipment == null && nullToAbsent
          ? const Value.absent()
          : Value(equipment),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      videoUrl: videoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(videoUrl),
      createdById: createdById == null && nullToAbsent
          ? const Value.absent()
          : Value(createdById),
      recommendedRestSeconds: recommendedRestSeconds == null && nullToAbsent
          ? const Value.absent()
          : Value(recommendedRestSeconds),
      isUnilateral: Value(isUnilateral),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory ExerciseEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseEntity(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      muscleGroup: serializer.fromJson<String?>(json['muscleGroup']),
      equipment: serializer.fromJson<String?>(json['equipment']),
      category: serializer.fromJson<String?>(json['category']),
      description: serializer.fromJson<String?>(json['description']),
      videoUrl: serializer.fromJson<String?>(json['videoUrl']),
      createdById: serializer.fromJson<String?>(json['createdById']),
      recommendedRestSeconds: serializer.fromJson<int?>(
        json['recommendedRestSeconds'],
      ),
      isUnilateral: serializer.fromJson<bool>(json['isUnilateral']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      deletedAt: serializer.fromJson<int?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'muscleGroup': serializer.toJson<String?>(muscleGroup),
      'equipment': serializer.toJson<String?>(equipment),
      'category': serializer.toJson<String?>(category),
      'description': serializer.toJson<String?>(description),
      'videoUrl': serializer.toJson<String?>(videoUrl),
      'createdById': serializer.toJson<String?>(createdById),
      'recommendedRestSeconds': serializer.toJson<int?>(recommendedRestSeconds),
      'isUnilateral': serializer.toJson<bool>(isUnilateral),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'deletedAt': serializer.toJson<int?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  ExerciseEntity copyWith({
    String? id,
    String? name,
    Value<String?> muscleGroup = const Value.absent(),
    Value<String?> equipment = const Value.absent(),
    Value<String?> category = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> videoUrl = const Value.absent(),
    Value<String?> createdById = const Value.absent(),
    Value<int?> recommendedRestSeconds = const Value.absent(),
    bool? isUnilateral,
    int? createdAt,
    int? updatedAt,
    Value<int?> deletedAt = const Value.absent(),
    String? syncStatus,
  }) => ExerciseEntity(
    id: id ?? this.id,
    name: name ?? this.name,
    muscleGroup: muscleGroup.present ? muscleGroup.value : this.muscleGroup,
    equipment: equipment.present ? equipment.value : this.equipment,
    category: category.present ? category.value : this.category,
    description: description.present ? description.value : this.description,
    videoUrl: videoUrl.present ? videoUrl.value : this.videoUrl,
    createdById: createdById.present ? createdById.value : this.createdById,
    recommendedRestSeconds: recommendedRestSeconds.present
        ? recommendedRestSeconds.value
        : this.recommendedRestSeconds,
    isUnilateral: isUnilateral ?? this.isUnilateral,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  ExerciseEntity copyWithCompanion(ExercisesTableCompanion data) {
    return ExerciseEntity(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      muscleGroup: data.muscleGroup.present
          ? data.muscleGroup.value
          : this.muscleGroup,
      equipment: data.equipment.present ? data.equipment.value : this.equipment,
      category: data.category.present ? data.category.value : this.category,
      description: data.description.present
          ? data.description.value
          : this.description,
      videoUrl: data.videoUrl.present ? data.videoUrl.value : this.videoUrl,
      createdById: data.createdById.present
          ? data.createdById.value
          : this.createdById,
      recommendedRestSeconds: data.recommendedRestSeconds.present
          ? data.recommendedRestSeconds.value
          : this.recommendedRestSeconds,
      isUnilateral: data.isUnilateral.present
          ? data.isUnilateral.value
          : this.isUnilateral,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseEntity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('muscleGroup: $muscleGroup, ')
          ..write('equipment: $equipment, ')
          ..write('category: $category, ')
          ..write('description: $description, ')
          ..write('videoUrl: $videoUrl, ')
          ..write('createdById: $createdById, ')
          ..write('recommendedRestSeconds: $recommendedRestSeconds, ')
          ..write('isUnilateral: $isUnilateral, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    muscleGroup,
    equipment,
    category,
    description,
    videoUrl,
    createdById,
    recommendedRestSeconds,
    isUnilateral,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExerciseEntity &&
          other.id == this.id &&
          other.name == this.name &&
          other.muscleGroup == this.muscleGroup &&
          other.equipment == this.equipment &&
          other.category == this.category &&
          other.description == this.description &&
          other.videoUrl == this.videoUrl &&
          other.createdById == this.createdById &&
          other.recommendedRestSeconds == this.recommendedRestSeconds &&
          other.isUnilateral == this.isUnilateral &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus);
}

class ExercisesTableCompanion extends UpdateCompanion<ExerciseEntity> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> muscleGroup;
  final Value<String?> equipment;
  final Value<String?> category;
  final Value<String?> description;
  final Value<String?> videoUrl;
  final Value<String?> createdById;
  final Value<int?> recommendedRestSeconds;
  final Value<bool> isUnilateral;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int?> deletedAt;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const ExercisesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.muscleGroup = const Value.absent(),
    this.equipment = const Value.absent(),
    this.category = const Value.absent(),
    this.description = const Value.absent(),
    this.videoUrl = const Value.absent(),
    this.createdById = const Value.absent(),
    this.recommendedRestSeconds = const Value.absent(),
    this.isUnilateral = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExercisesTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.muscleGroup = const Value.absent(),
    this.equipment = const Value.absent(),
    this.category = const Value.absent(),
    this.description = const Value.absent(),
    this.videoUrl = const Value.absent(),
    this.createdById = const Value.absent(),
    this.recommendedRestSeconds = const Value.absent(),
    this.isUnilateral = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ExerciseEntity> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? muscleGroup,
    Expression<String>? equipment,
    Expression<String>? category,
    Expression<String>? description,
    Expression<String>? videoUrl,
    Expression<String>? createdById,
    Expression<int>? recommendedRestSeconds,
    Expression<bool>? isUnilateral,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? deletedAt,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (muscleGroup != null) 'muscle_group': muscleGroup,
      if (equipment != null) 'equipment': equipment,
      if (category != null) 'category': category,
      if (description != null) 'description': description,
      if (videoUrl != null) 'video_url': videoUrl,
      if (createdById != null) 'created_by_id': createdById,
      if (recommendedRestSeconds != null)
        'recommended_rest_seconds': recommendedRestSeconds,
      if (isUnilateral != null) 'is_unilateral': isUnilateral,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExercisesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? muscleGroup,
    Value<String?>? equipment,
    Value<String?>? category,
    Value<String?>? description,
    Value<String?>? videoUrl,
    Value<String?>? createdById,
    Value<int?>? recommendedRestSeconds,
    Value<bool>? isUnilateral,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int?>? deletedAt,
    Value<String>? syncStatus,
    Value<int>? rowid,
  }) {
    return ExercisesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      muscleGroup: muscleGroup ?? this.muscleGroup,
      equipment: equipment ?? this.equipment,
      category: category ?? this.category,
      description: description ?? this.description,
      videoUrl: videoUrl ?? this.videoUrl,
      createdById: createdById ?? this.createdById,
      recommendedRestSeconds:
          recommendedRestSeconds ?? this.recommendedRestSeconds,
      isUnilateral: isUnilateral ?? this.isUnilateral,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (muscleGroup.present) {
      map['muscle_group'] = Variable<String>(muscleGroup.value);
    }
    if (equipment.present) {
      map['equipment'] = Variable<String>(equipment.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (videoUrl.present) {
      map['video_url'] = Variable<String>(videoUrl.value);
    }
    if (createdById.present) {
      map['created_by_id'] = Variable<String>(createdById.value);
    }
    if (recommendedRestSeconds.present) {
      map['recommended_rest_seconds'] = Variable<int>(
        recommendedRestSeconds.value,
      );
    }
    if (isUnilateral.present) {
      map['is_unilateral'] = Variable<bool>(isUnilateral.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<int>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExercisesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('muscleGroup: $muscleGroup, ')
          ..write('equipment: $equipment, ')
          ..write('category: $category, ')
          ..write('description: $description, ')
          ..write('videoUrl: $videoUrl, ')
          ..write('createdById: $createdById, ')
          ..write('recommendedRestSeconds: $recommendedRestSeconds, ')
          ..write('isUnilateral: $isUnilateral, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkoutTemplatesTable extends WorkoutTemplates
    with TableInfo<$WorkoutTemplatesTable, WorkoutTemplateEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutTemplatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _programIdMeta = const VerificationMeta(
    'programId',
  );
  @override
  late final GeneratedColumn<String> programId = GeneratedColumn<String>(
    'program_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
    'order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    clientDefault: () => 0,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<int> deletedAt = GeneratedColumn<int>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => 'pending',
  );
  static const VerificationMeta _exercisesJsonMeta = const VerificationMeta(
    'exercisesJson',
  );
  @override
  late final GeneratedColumn<String> exercisesJson = GeneratedColumn<String>(
    'exercises_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    programId,
    order,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    exercisesJson,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_templates';
  @override
  VerificationContext validateIntegrity(
    Insertable<WorkoutTemplateEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('program_id')) {
      context.handle(
        _programIdMeta,
        programId.isAcceptableOrUnknown(data['program_id']!, _programIdMeta),
      );
    } else if (isInserting) {
      context.missing(_programIdMeta);
    }
    if (data.containsKey('order')) {
      context.handle(
        _orderMeta,
        order.isAcceptableOrUnknown(data['order']!, _orderMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('exercises_json')) {
      context.handle(
        _exercisesJsonMeta,
        exercisesJson.isAcceptableOrUnknown(
          data['exercises_json']!,
          _exercisesJsonMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutTemplateEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutTemplateEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      programId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}program_id'],
      )!,
      order: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      exercisesJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercises_json'],
      ),
    );
  }

  @override
  $WorkoutTemplatesTable createAlias(String alias) {
    return $WorkoutTemplatesTable(attachedDatabase, alias);
  }
}

class WorkoutTemplateEntity extends DataClass
    implements Insertable<WorkoutTemplateEntity> {
  final String id;
  final String name;
  final String? description;
  final String programId;
  final int order;
  final int createdAt;
  final int updatedAt;
  final int? deletedAt;
  final String syncStatus;

  /// JSON-encoded list of template exercise objects.
  /// Stored as a JSON string to avoid a separate join table for local templates.
  final String? exercisesJson;
  const WorkoutTemplateEntity({
    required this.id,
    required this.name,
    this.description,
    required this.programId,
    required this.order,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
    this.exercisesJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['program_id'] = Variable<String>(programId);
    map['order'] = Variable<int>(order);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<int>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || exercisesJson != null) {
      map['exercises_json'] = Variable<String>(exercisesJson);
    }
    return map;
  }

  WorkoutTemplatesCompanion toCompanion(bool nullToAbsent) {
    return WorkoutTemplatesCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      programId: Value(programId),
      order: Value(order),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      exercisesJson: exercisesJson == null && nullToAbsent
          ? const Value.absent()
          : Value(exercisesJson),
    );
  }

  factory WorkoutTemplateEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutTemplateEntity(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      programId: serializer.fromJson<String>(json['programId']),
      order: serializer.fromJson<int>(json['order']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      deletedAt: serializer.fromJson<int?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      exercisesJson: serializer.fromJson<String?>(json['exercisesJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'programId': serializer.toJson<String>(programId),
      'order': serializer.toJson<int>(order),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'deletedAt': serializer.toJson<int?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'exercisesJson': serializer.toJson<String?>(exercisesJson),
    };
  }

  WorkoutTemplateEntity copyWith({
    String? id,
    String? name,
    Value<String?> description = const Value.absent(),
    String? programId,
    int? order,
    int? createdAt,
    int? updatedAt,
    Value<int?> deletedAt = const Value.absent(),
    String? syncStatus,
    Value<String?> exercisesJson = const Value.absent(),
  }) => WorkoutTemplateEntity(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    programId: programId ?? this.programId,
    order: order ?? this.order,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    exercisesJson: exercisesJson.present
        ? exercisesJson.value
        : this.exercisesJson,
  );
  WorkoutTemplateEntity copyWithCompanion(WorkoutTemplatesCompanion data) {
    return WorkoutTemplateEntity(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      programId: data.programId.present ? data.programId.value : this.programId,
      order: data.order.present ? data.order.value : this.order,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      exercisesJson: data.exercisesJson.present
          ? data.exercisesJson.value
          : this.exercisesJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutTemplateEntity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('programId: $programId, ')
          ..write('order: $order, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('exercisesJson: $exercisesJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    description,
    programId,
    order,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    exercisesJson,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutTemplateEntity &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.programId == this.programId &&
          other.order == this.order &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.exercisesJson == this.exercisesJson);
}

class WorkoutTemplatesCompanion extends UpdateCompanion<WorkoutTemplateEntity> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String> programId;
  final Value<int> order;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int?> deletedAt;
  final Value<String> syncStatus;
  final Value<String?> exercisesJson;
  final Value<int> rowid;
  const WorkoutTemplatesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.programId = const Value.absent(),
    this.order = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.exercisesJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkoutTemplatesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    required String programId,
    this.order = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.exercisesJson = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       programId = Value(programId),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<WorkoutTemplateEntity> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? programId,
    Expression<int>? order,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? deletedAt,
    Expression<String>? syncStatus,
    Expression<String>? exercisesJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (programId != null) 'program_id': programId,
      if (order != null) 'order': order,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (exercisesJson != null) 'exercises_json': exercisesJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkoutTemplatesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<String>? programId,
    Value<int>? order,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int?>? deletedAt,
    Value<String>? syncStatus,
    Value<String?>? exercisesJson,
    Value<int>? rowid,
  }) {
    return WorkoutTemplatesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      programId: programId ?? this.programId,
      order: order ?? this.order,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      exercisesJson: exercisesJson ?? this.exercisesJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (programId.present) {
      map['program_id'] = Variable<String>(programId.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<int>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (exercisesJson.present) {
      map['exercises_json'] = Variable<String>(exercisesJson.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutTemplatesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('programId: $programId, ')
          ..write('order: $order, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('exercisesJson: $exercisesJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ClientMeasurementsTable extends ClientMeasurements
    with TableInfo<$ClientMeasurementsTable, ClientMeasurementEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClientMeasurementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _clientIdMeta = const VerificationMeta(
    'clientId',
  );
  @override
  late final GeneratedColumn<String> clientId = GeneratedColumn<String>(
    'client_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _measurementDateMeta = const VerificationMeta(
    'measurementDate',
  );
  @override
  late final GeneratedColumn<int> measurementDate = GeneratedColumn<int>(
    'measurement_date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightKgMeta = const VerificationMeta(
    'weightKg',
  );
  @override
  late final GeneratedColumn<double> weightKg = GeneratedColumn<double>(
    'weight_kg',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bodyFatPercentageMeta = const VerificationMeta(
    'bodyFatPercentage',
  );
  @override
  late final GeneratedColumn<double> bodyFatPercentage =
      GeneratedColumn<double>(
        'body_fat_percentage',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _customMetricsMeta = const VerificationMeta(
    'customMetrics',
  );
  @override
  late final GeneratedColumn<String> customMetrics = GeneratedColumn<String>(
    'custom_metrics',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<int> deletedAt = GeneratedColumn<int>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => 'pending',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    clientId,
    measurementDate,
    weightKg,
    bodyFatPercentage,
    notes,
    customMetrics,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'client_measurements';
  @override
  VerificationContext validateIntegrity(
    Insertable<ClientMeasurementEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('client_id')) {
      context.handle(
        _clientIdMeta,
        clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta),
      );
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    if (data.containsKey('measurement_date')) {
      context.handle(
        _measurementDateMeta,
        measurementDate.isAcceptableOrUnknown(
          data['measurement_date']!,
          _measurementDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_measurementDateMeta);
    }
    if (data.containsKey('weight_kg')) {
      context.handle(
        _weightKgMeta,
        weightKg.isAcceptableOrUnknown(data['weight_kg']!, _weightKgMeta),
      );
    }
    if (data.containsKey('body_fat_percentage')) {
      context.handle(
        _bodyFatPercentageMeta,
        bodyFatPercentage.isAcceptableOrUnknown(
          data['body_fat_percentage']!,
          _bodyFatPercentageMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('custom_metrics')) {
      context.handle(
        _customMetricsMeta,
        customMetrics.isAcceptableOrUnknown(
          data['custom_metrics']!,
          _customMetricsMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ClientMeasurementEntity map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClientMeasurementEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      clientId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_id'],
      )!,
      measurementDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}measurement_date'],
      )!,
      weightKg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight_kg'],
      ),
      bodyFatPercentage: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}body_fat_percentage'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      customMetrics: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}custom_metrics'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
    );
  }

  @override
  $ClientMeasurementsTable createAlias(String alias) {
    return $ClientMeasurementsTable(attachedDatabase, alias);
  }
}

class ClientMeasurementEntity extends DataClass
    implements Insertable<ClientMeasurementEntity> {
  final String id;
  final String clientId;
  final int measurementDate;
  final double? weightKg;
  final double? bodyFatPercentage;
  final String? notes;
  final String? customMetrics;
  final int createdAt;
  final int updatedAt;
  final int? deletedAt;
  final String syncStatus;
  const ClientMeasurementEntity({
    required this.id,
    required this.clientId,
    required this.measurementDate,
    this.weightKg,
    this.bodyFatPercentage,
    this.notes,
    this.customMetrics,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['client_id'] = Variable<String>(clientId);
    map['measurement_date'] = Variable<int>(measurementDate);
    if (!nullToAbsent || weightKg != null) {
      map['weight_kg'] = Variable<double>(weightKg);
    }
    if (!nullToAbsent || bodyFatPercentage != null) {
      map['body_fat_percentage'] = Variable<double>(bodyFatPercentage);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || customMetrics != null) {
      map['custom_metrics'] = Variable<String>(customMetrics);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<int>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  ClientMeasurementsCompanion toCompanion(bool nullToAbsent) {
    return ClientMeasurementsCompanion(
      id: Value(id),
      clientId: Value(clientId),
      measurementDate: Value(measurementDate),
      weightKg: weightKg == null && nullToAbsent
          ? const Value.absent()
          : Value(weightKg),
      bodyFatPercentage: bodyFatPercentage == null && nullToAbsent
          ? const Value.absent()
          : Value(bodyFatPercentage),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      customMetrics: customMetrics == null && nullToAbsent
          ? const Value.absent()
          : Value(customMetrics),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory ClientMeasurementEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ClientMeasurementEntity(
      id: serializer.fromJson<String>(json['id']),
      clientId: serializer.fromJson<String>(json['clientId']),
      measurementDate: serializer.fromJson<int>(json['measurementDate']),
      weightKg: serializer.fromJson<double?>(json['weightKg']),
      bodyFatPercentage: serializer.fromJson<double?>(
        json['bodyFatPercentage'],
      ),
      notes: serializer.fromJson<String?>(json['notes']),
      customMetrics: serializer.fromJson<String?>(json['customMetrics']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      deletedAt: serializer.fromJson<int?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'clientId': serializer.toJson<String>(clientId),
      'measurementDate': serializer.toJson<int>(measurementDate),
      'weightKg': serializer.toJson<double?>(weightKg),
      'bodyFatPercentage': serializer.toJson<double?>(bodyFatPercentage),
      'notes': serializer.toJson<String?>(notes),
      'customMetrics': serializer.toJson<String?>(customMetrics),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'deletedAt': serializer.toJson<int?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  ClientMeasurementEntity copyWith({
    String? id,
    String? clientId,
    int? measurementDate,
    Value<double?> weightKg = const Value.absent(),
    Value<double?> bodyFatPercentage = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    Value<String?> customMetrics = const Value.absent(),
    int? createdAt,
    int? updatedAt,
    Value<int?> deletedAt = const Value.absent(),
    String? syncStatus,
  }) => ClientMeasurementEntity(
    id: id ?? this.id,
    clientId: clientId ?? this.clientId,
    measurementDate: measurementDate ?? this.measurementDate,
    weightKg: weightKg.present ? weightKg.value : this.weightKg,
    bodyFatPercentage: bodyFatPercentage.present
        ? bodyFatPercentage.value
        : this.bodyFatPercentage,
    notes: notes.present ? notes.value : this.notes,
    customMetrics: customMetrics.present
        ? customMetrics.value
        : this.customMetrics,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  ClientMeasurementEntity copyWithCompanion(ClientMeasurementsCompanion data) {
    return ClientMeasurementEntity(
      id: data.id.present ? data.id.value : this.id,
      clientId: data.clientId.present ? data.clientId.value : this.clientId,
      measurementDate: data.measurementDate.present
          ? data.measurementDate.value
          : this.measurementDate,
      weightKg: data.weightKg.present ? data.weightKg.value : this.weightKg,
      bodyFatPercentage: data.bodyFatPercentage.present
          ? data.bodyFatPercentage.value
          : this.bodyFatPercentage,
      notes: data.notes.present ? data.notes.value : this.notes,
      customMetrics: data.customMetrics.present
          ? data.customMetrics.value
          : this.customMetrics,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ClientMeasurementEntity(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('measurementDate: $measurementDate, ')
          ..write('weightKg: $weightKg, ')
          ..write('bodyFatPercentage: $bodyFatPercentage, ')
          ..write('notes: $notes, ')
          ..write('customMetrics: $customMetrics, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    clientId,
    measurementDate,
    weightKg,
    bodyFatPercentage,
    notes,
    customMetrics,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClientMeasurementEntity &&
          other.id == this.id &&
          other.clientId == this.clientId &&
          other.measurementDate == this.measurementDate &&
          other.weightKg == this.weightKg &&
          other.bodyFatPercentage == this.bodyFatPercentage &&
          other.notes == this.notes &&
          other.customMetrics == this.customMetrics &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus);
}

class ClientMeasurementsCompanion
    extends UpdateCompanion<ClientMeasurementEntity> {
  final Value<String> id;
  final Value<String> clientId;
  final Value<int> measurementDate;
  final Value<double?> weightKg;
  final Value<double?> bodyFatPercentage;
  final Value<String?> notes;
  final Value<String?> customMetrics;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int?> deletedAt;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const ClientMeasurementsCompanion({
    this.id = const Value.absent(),
    this.clientId = const Value.absent(),
    this.measurementDate = const Value.absent(),
    this.weightKg = const Value.absent(),
    this.bodyFatPercentage = const Value.absent(),
    this.notes = const Value.absent(),
    this.customMetrics = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ClientMeasurementsCompanion.insert({
    this.id = const Value.absent(),
    required String clientId,
    required int measurementDate,
    this.weightKg = const Value.absent(),
    this.bodyFatPercentage = const Value.absent(),
    this.notes = const Value.absent(),
    this.customMetrics = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : clientId = Value(clientId),
       measurementDate = Value(measurementDate),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ClientMeasurementEntity> custom({
    Expression<String>? id,
    Expression<String>? clientId,
    Expression<int>? measurementDate,
    Expression<double>? weightKg,
    Expression<double>? bodyFatPercentage,
    Expression<String>? notes,
    Expression<String>? customMetrics,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? deletedAt,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (clientId != null) 'client_id': clientId,
      if (measurementDate != null) 'measurement_date': measurementDate,
      if (weightKg != null) 'weight_kg': weightKg,
      if (bodyFatPercentage != null) 'body_fat_percentage': bodyFatPercentage,
      if (notes != null) 'notes': notes,
      if (customMetrics != null) 'custom_metrics': customMetrics,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ClientMeasurementsCompanion copyWith({
    Value<String>? id,
    Value<String>? clientId,
    Value<int>? measurementDate,
    Value<double?>? weightKg,
    Value<double?>? bodyFatPercentage,
    Value<String?>? notes,
    Value<String?>? customMetrics,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int?>? deletedAt,
    Value<String>? syncStatus,
    Value<int>? rowid,
  }) {
    return ClientMeasurementsCompanion(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
      measurementDate: measurementDate ?? this.measurementDate,
      weightKg: weightKg ?? this.weightKg,
      bodyFatPercentage: bodyFatPercentage ?? this.bodyFatPercentage,
      notes: notes ?? this.notes,
      customMetrics: customMetrics ?? this.customMetrics,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<String>(clientId.value);
    }
    if (measurementDate.present) {
      map['measurement_date'] = Variable<int>(measurementDate.value);
    }
    if (weightKg.present) {
      map['weight_kg'] = Variable<double>(weightKg.value);
    }
    if (bodyFatPercentage.present) {
      map['body_fat_percentage'] = Variable<double>(bodyFatPercentage.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (customMetrics.present) {
      map['custom_metrics'] = Variable<String>(customMetrics.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<int>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClientMeasurementsCompanion(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('measurementDate: $measurementDate, ')
          ..write('weightKg: $weightKg, ')
          ..write('bodyFatPercentage: $bodyFatPercentage, ')
          ..write('notes: $notes, ')
          ..write('customMetrics: $customMetrics, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ClientPhotosTable extends ClientPhotos
    with TableInfo<$ClientPhotosTable, ClientPhotoEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClientPhotosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _clientIdMeta = const VerificationMeta(
    'clientId',
  );
  @override
  late final GeneratedColumn<String> clientId = GeneratedColumn<String>(
    'client_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _photoDateMeta = const VerificationMeta(
    'photoDate',
  );
  @override
  late final GeneratedColumn<int> photoDate = GeneratedColumn<int>(
    'photo_date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _captionMeta = const VerificationMeta(
    'caption',
  );
  @override
  late final GeneratedColumn<String> caption = GeneratedColumn<String>(
    'caption',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _checkInIdMeta = const VerificationMeta(
    'checkInId',
  );
  @override
  late final GeneratedColumn<String> checkInId = GeneratedColumn<String>(
    'check_in_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<int> deletedAt = GeneratedColumn<int>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => 'pending',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    clientId,
    photoDate,
    imagePath,
    caption,
    checkInId,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'client_photos';
  @override
  VerificationContext validateIntegrity(
    Insertable<ClientPhotoEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('client_id')) {
      context.handle(
        _clientIdMeta,
        clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta),
      );
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    if (data.containsKey('photo_date')) {
      context.handle(
        _photoDateMeta,
        photoDate.isAcceptableOrUnknown(data['photo_date']!, _photoDateMeta),
      );
    } else if (isInserting) {
      context.missing(_photoDateMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    } else if (isInserting) {
      context.missing(_imagePathMeta);
    }
    if (data.containsKey('caption')) {
      context.handle(
        _captionMeta,
        caption.isAcceptableOrUnknown(data['caption']!, _captionMeta),
      );
    }
    if (data.containsKey('check_in_id')) {
      context.handle(
        _checkInIdMeta,
        checkInId.isAcceptableOrUnknown(data['check_in_id']!, _checkInIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ClientPhotoEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClientPhotoEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      clientId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_id'],
      )!,
      photoDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}photo_date'],
      )!,
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      )!,
      caption: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}caption'],
      ),
      checkInId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}check_in_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
    );
  }

  @override
  $ClientPhotosTable createAlias(String alias) {
    return $ClientPhotosTable(attachedDatabase, alias);
  }
}

class ClientPhotoEntity extends DataClass
    implements Insertable<ClientPhotoEntity> {
  final String id;
  final String clientId;
  final int photoDate;
  final String imagePath;
  final String? caption;
  final String? checkInId;
  final int createdAt;
  final int updatedAt;
  final int? deletedAt;
  final String syncStatus;
  const ClientPhotoEntity({
    required this.id,
    required this.clientId,
    required this.photoDate,
    required this.imagePath,
    this.caption,
    this.checkInId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['client_id'] = Variable<String>(clientId);
    map['photo_date'] = Variable<int>(photoDate);
    map['image_path'] = Variable<String>(imagePath);
    if (!nullToAbsent || caption != null) {
      map['caption'] = Variable<String>(caption);
    }
    if (!nullToAbsent || checkInId != null) {
      map['check_in_id'] = Variable<String>(checkInId);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<int>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  ClientPhotosCompanion toCompanion(bool nullToAbsent) {
    return ClientPhotosCompanion(
      id: Value(id),
      clientId: Value(clientId),
      photoDate: Value(photoDate),
      imagePath: Value(imagePath),
      caption: caption == null && nullToAbsent
          ? const Value.absent()
          : Value(caption),
      checkInId: checkInId == null && nullToAbsent
          ? const Value.absent()
          : Value(checkInId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory ClientPhotoEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ClientPhotoEntity(
      id: serializer.fromJson<String>(json['id']),
      clientId: serializer.fromJson<String>(json['clientId']),
      photoDate: serializer.fromJson<int>(json['photoDate']),
      imagePath: serializer.fromJson<String>(json['imagePath']),
      caption: serializer.fromJson<String?>(json['caption']),
      checkInId: serializer.fromJson<String?>(json['checkInId']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      deletedAt: serializer.fromJson<int?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'clientId': serializer.toJson<String>(clientId),
      'photoDate': serializer.toJson<int>(photoDate),
      'imagePath': serializer.toJson<String>(imagePath),
      'caption': serializer.toJson<String?>(caption),
      'checkInId': serializer.toJson<String?>(checkInId),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'deletedAt': serializer.toJson<int?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  ClientPhotoEntity copyWith({
    String? id,
    String? clientId,
    int? photoDate,
    String? imagePath,
    Value<String?> caption = const Value.absent(),
    Value<String?> checkInId = const Value.absent(),
    int? createdAt,
    int? updatedAt,
    Value<int?> deletedAt = const Value.absent(),
    String? syncStatus,
  }) => ClientPhotoEntity(
    id: id ?? this.id,
    clientId: clientId ?? this.clientId,
    photoDate: photoDate ?? this.photoDate,
    imagePath: imagePath ?? this.imagePath,
    caption: caption.present ? caption.value : this.caption,
    checkInId: checkInId.present ? checkInId.value : this.checkInId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  ClientPhotoEntity copyWithCompanion(ClientPhotosCompanion data) {
    return ClientPhotoEntity(
      id: data.id.present ? data.id.value : this.id,
      clientId: data.clientId.present ? data.clientId.value : this.clientId,
      photoDate: data.photoDate.present ? data.photoDate.value : this.photoDate,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      caption: data.caption.present ? data.caption.value : this.caption,
      checkInId: data.checkInId.present ? data.checkInId.value : this.checkInId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ClientPhotoEntity(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('photoDate: $photoDate, ')
          ..write('imagePath: $imagePath, ')
          ..write('caption: $caption, ')
          ..write('checkInId: $checkInId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    clientId,
    photoDate,
    imagePath,
    caption,
    checkInId,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClientPhotoEntity &&
          other.id == this.id &&
          other.clientId == this.clientId &&
          other.photoDate == this.photoDate &&
          other.imagePath == this.imagePath &&
          other.caption == this.caption &&
          other.checkInId == this.checkInId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus);
}

class ClientPhotosCompanion extends UpdateCompanion<ClientPhotoEntity> {
  final Value<String> id;
  final Value<String> clientId;
  final Value<int> photoDate;
  final Value<String> imagePath;
  final Value<String?> caption;
  final Value<String?> checkInId;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int?> deletedAt;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const ClientPhotosCompanion({
    this.id = const Value.absent(),
    this.clientId = const Value.absent(),
    this.photoDate = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.caption = const Value.absent(),
    this.checkInId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ClientPhotosCompanion.insert({
    this.id = const Value.absent(),
    required String clientId,
    required int photoDate,
    required String imagePath,
    this.caption = const Value.absent(),
    this.checkInId = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : clientId = Value(clientId),
       photoDate = Value(photoDate),
       imagePath = Value(imagePath),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ClientPhotoEntity> custom({
    Expression<String>? id,
    Expression<String>? clientId,
    Expression<int>? photoDate,
    Expression<String>? imagePath,
    Expression<String>? caption,
    Expression<String>? checkInId,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? deletedAt,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (clientId != null) 'client_id': clientId,
      if (photoDate != null) 'photo_date': photoDate,
      if (imagePath != null) 'image_path': imagePath,
      if (caption != null) 'caption': caption,
      if (checkInId != null) 'check_in_id': checkInId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ClientPhotosCompanion copyWith({
    Value<String>? id,
    Value<String>? clientId,
    Value<int>? photoDate,
    Value<String>? imagePath,
    Value<String?>? caption,
    Value<String?>? checkInId,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int?>? deletedAt,
    Value<String>? syncStatus,
    Value<int>? rowid,
  }) {
    return ClientPhotosCompanion(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
      photoDate: photoDate ?? this.photoDate,
      imagePath: imagePath ?? this.imagePath,
      caption: caption ?? this.caption,
      checkInId: checkInId ?? this.checkInId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<String>(clientId.value);
    }
    if (photoDate.present) {
      map['photo_date'] = Variable<int>(photoDate.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (caption.present) {
      map['caption'] = Variable<String>(caption.value);
    }
    if (checkInId.present) {
      map['check_in_id'] = Variable<String>(checkInId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<int>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClientPhotosCompanion(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('photoDate: $photoDate, ')
          ..write('imagePath: $imagePath, ')
          ..write('caption: $caption, ')
          ..write('checkInId: $checkInId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NotificationsTable extends Notifications
    with TableInfo<$NotificationsTable, NotificationEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotificationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messageMeta = const VerificationMeta(
    'message',
  );
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
    'message',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _readStatusMeta = const VerificationMeta(
    'readStatus',
  );
  @override
  late final GeneratedColumn<bool> readStatus = GeneratedColumn<bool>(
    'read_status',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("read_status" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _metadataMeta = const VerificationMeta(
    'metadata',
  );
  @override
  late final GeneratedColumn<String> metadata = GeneratedColumn<String>(
    'metadata',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<int> deletedAt = GeneratedColumn<int>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => 'pending',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    message,
    type,
    readStatus,
    metadata,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notifications';
  @override
  VerificationContext validateIntegrity(
    Insertable<NotificationEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('message')) {
      context.handle(
        _messageMeta,
        message.isAcceptableOrUnknown(data['message']!, _messageMeta),
      );
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('read_status')) {
      context.handle(
        _readStatusMeta,
        readStatus.isAcceptableOrUnknown(data['read_status']!, _readStatusMeta),
      );
    }
    if (data.containsKey('metadata')) {
      context.handle(
        _metadataMeta,
        metadata.isAcceptableOrUnknown(data['metadata']!, _metadataMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NotificationEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NotificationEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      message: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      readStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}read_status'],
      )!,
      metadata: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}metadata'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
    );
  }

  @override
  $NotificationsTable createAlias(String alias) {
    return $NotificationsTable(attachedDatabase, alias);
  }
}

class NotificationEntity extends DataClass
    implements Insertable<NotificationEntity> {
  final String id;
  final String userId;
  final String message;
  final String type;
  final bool readStatus;
  final String? metadata;
  final int createdAt;
  final int updatedAt;
  final int? deletedAt;
  final String syncStatus;
  const NotificationEntity({
    required this.id,
    required this.userId,
    required this.message,
    required this.type,
    required this.readStatus,
    this.metadata,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['message'] = Variable<String>(message);
    map['type'] = Variable<String>(type);
    map['read_status'] = Variable<bool>(readStatus);
    if (!nullToAbsent || metadata != null) {
      map['metadata'] = Variable<String>(metadata);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<int>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  NotificationsCompanion toCompanion(bool nullToAbsent) {
    return NotificationsCompanion(
      id: Value(id),
      userId: Value(userId),
      message: Value(message),
      type: Value(type),
      readStatus: Value(readStatus),
      metadata: metadata == null && nullToAbsent
          ? const Value.absent()
          : Value(metadata),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory NotificationEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NotificationEntity(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      message: serializer.fromJson<String>(json['message']),
      type: serializer.fromJson<String>(json['type']),
      readStatus: serializer.fromJson<bool>(json['readStatus']),
      metadata: serializer.fromJson<String?>(json['metadata']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      deletedAt: serializer.fromJson<int?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'message': serializer.toJson<String>(message),
      'type': serializer.toJson<String>(type),
      'readStatus': serializer.toJson<bool>(readStatus),
      'metadata': serializer.toJson<String?>(metadata),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'deletedAt': serializer.toJson<int?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  NotificationEntity copyWith({
    String? id,
    String? userId,
    String? message,
    String? type,
    bool? readStatus,
    Value<String?> metadata = const Value.absent(),
    int? createdAt,
    int? updatedAt,
    Value<int?> deletedAt = const Value.absent(),
    String? syncStatus,
  }) => NotificationEntity(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    message: message ?? this.message,
    type: type ?? this.type,
    readStatus: readStatus ?? this.readStatus,
    metadata: metadata.present ? metadata.value : this.metadata,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  NotificationEntity copyWithCompanion(NotificationsCompanion data) {
    return NotificationEntity(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      message: data.message.present ? data.message.value : this.message,
      type: data.type.present ? data.type.value : this.type,
      readStatus: data.readStatus.present
          ? data.readStatus.value
          : this.readStatus,
      metadata: data.metadata.present ? data.metadata.value : this.metadata,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NotificationEntity(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('message: $message, ')
          ..write('type: $type, ')
          ..write('readStatus: $readStatus, ')
          ..write('metadata: $metadata, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    message,
    type,
    readStatus,
    metadata,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotificationEntity &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.message == this.message &&
          other.type == this.type &&
          other.readStatus == this.readStatus &&
          other.metadata == this.metadata &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus);
}

class NotificationsCompanion extends UpdateCompanion<NotificationEntity> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> message;
  final Value<String> type;
  final Value<bool> readStatus;
  final Value<String?> metadata;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int?> deletedAt;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const NotificationsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.message = const Value.absent(),
    this.type = const Value.absent(),
    this.readStatus = const Value.absent(),
    this.metadata = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NotificationsCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required String message,
    required String type,
    this.readStatus = const Value.absent(),
    this.metadata = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : userId = Value(userId),
       message = Value(message),
       type = Value(type),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<NotificationEntity> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? message,
    Expression<String>? type,
    Expression<bool>? readStatus,
    Expression<String>? metadata,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? deletedAt,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (message != null) 'message': message,
      if (type != null) 'type': type,
      if (readStatus != null) 'read_status': readStatus,
      if (metadata != null) 'metadata': metadata,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NotificationsCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String>? message,
    Value<String>? type,
    Value<bool>? readStatus,
    Value<String?>? metadata,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int?>? deletedAt,
    Value<String>? syncStatus,
    Value<int>? rowid,
  }) {
    return NotificationsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      message: message ?? this.message,
      type: type ?? this.type,
      readStatus: readStatus ?? this.readStatus,
      metadata: metadata ?? this.metadata,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (readStatus.present) {
      map['read_status'] = Variable<bool>(readStatus.value);
    }
    if (metadata.present) {
      map['metadata'] = Variable<String>(metadata.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<int>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('message: $message, ')
          ..write('type: $type, ')
          ..write('readStatus: $readStatus, ')
          ..write('metadata: $metadata, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BookingTableTable extends BookingTable
    with TableInfo<$BookingTableTable, BookingEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BookingTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _startTimeMeta = const VerificationMeta(
    'startTime',
  );
  @override
  late final GeneratedColumn<int> startTime = GeneratedColumn<int>(
    'start_time',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endTimeMeta = const VerificationMeta(
    'endTime',
  );
  @override
  late final GeneratedColumn<int> endTime = GeneratedColumn<int>(
    'end_time',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('PENDING'),
  );
  static const VerificationMeta _dataSharingApprovedMeta =
      const VerificationMeta('dataSharingApproved');
  @override
  late final GeneratedColumn<bool> dataSharingApproved = GeneratedColumn<bool>(
    'data_sharing_approved',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("data_sharing_approved" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _dataSharingApprovedAtMeta =
      const VerificationMeta('dataSharingApprovedAt');
  @override
  late final GeneratedColumn<int> dataSharingApprovedAt = GeneratedColumn<int>(
    'data_sharing_approved_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _trainerIdMeta = const VerificationMeta(
    'trainerId',
  );
  @override
  late final GeneratedColumn<String> trainerId = GeneratedColumn<String>(
    'trainer_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _clientIdMeta = const VerificationMeta(
    'clientId',
  );
  @override
  late final GeneratedColumn<String> clientId = GeneratedColumn<String>(
    'client_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _clientNameMeta = const VerificationMeta(
    'clientName',
  );
  @override
  late final GeneratedColumn<String> clientName = GeneratedColumn<String>(
    'client_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _clientEmailMeta = const VerificationMeta(
    'clientEmail',
  );
  @override
  late final GeneratedColumn<String> clientEmail = GeneratedColumn<String>(
    'client_email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _clientNotesMeta = const VerificationMeta(
    'clientNotes',
  );
  @override
  late final GeneratedColumn<String> clientNotes = GeneratedColumn<String>(
    'client_notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<int> deletedAt = GeneratedColumn<int>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    startTime,
    endTime,
    status,
    dataSharingApproved,
    dataSharingApprovedAt,
    trainerId,
    clientId,
    clientName,
    clientEmail,
    clientNotes,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'booking_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<BookingEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('start_time')) {
      context.handle(
        _startTimeMeta,
        startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(
        _endTimeMeta,
        endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('data_sharing_approved')) {
      context.handle(
        _dataSharingApprovedMeta,
        dataSharingApproved.isAcceptableOrUnknown(
          data['data_sharing_approved']!,
          _dataSharingApprovedMeta,
        ),
      );
    }
    if (data.containsKey('data_sharing_approved_at')) {
      context.handle(
        _dataSharingApprovedAtMeta,
        dataSharingApprovedAt.isAcceptableOrUnknown(
          data['data_sharing_approved_at']!,
          _dataSharingApprovedAtMeta,
        ),
      );
    }
    if (data.containsKey('trainer_id')) {
      context.handle(
        _trainerIdMeta,
        trainerId.isAcceptableOrUnknown(data['trainer_id']!, _trainerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_trainerIdMeta);
    }
    if (data.containsKey('client_id')) {
      context.handle(
        _clientIdMeta,
        clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta),
      );
    }
    if (data.containsKey('client_name')) {
      context.handle(
        _clientNameMeta,
        clientName.isAcceptableOrUnknown(data['client_name']!, _clientNameMeta),
      );
    }
    if (data.containsKey('client_email')) {
      context.handle(
        _clientEmailMeta,
        clientEmail.isAcceptableOrUnknown(
          data['client_email']!,
          _clientEmailMeta,
        ),
      );
    }
    if (data.containsKey('client_notes')) {
      context.handle(
        _clientNotesMeta,
        clientNotes.isAcceptableOrUnknown(
          data['client_notes']!,
          _clientNotesMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BookingEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookingEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      startTime: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_time'],
      )!,
      endTime: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}end_time'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      dataSharingApproved: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}data_sharing_approved'],
      ),
      dataSharingApprovedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}data_sharing_approved_at'],
      ),
      trainerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}trainer_id'],
      )!,
      clientId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_id'],
      ),
      clientName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_name'],
      ),
      clientEmail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_email'],
      ),
      clientNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
    );
  }

  @override
  $BookingTableTable createAlias(String alias) {
    return $BookingTableTable(attachedDatabase, alias);
  }
}

class BookingEntity extends DataClass implements Insertable<BookingEntity> {
  final String id;
  final int startTime;
  final int endTime;
  final String status;
  final bool? dataSharingApproved;
  final int? dataSharingApprovedAt;
  final String trainerId;
  final String? clientId;
  final String? clientName;
  final String? clientEmail;
  final String? clientNotes;
  final int createdAt;
  final int updatedAt;
  final int? deletedAt;
  final String syncStatus;
  const BookingEntity({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.status,
    this.dataSharingApproved,
    this.dataSharingApprovedAt,
    required this.trainerId,
    this.clientId,
    this.clientName,
    this.clientEmail,
    this.clientNotes,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['start_time'] = Variable<int>(startTime);
    map['end_time'] = Variable<int>(endTime);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || dataSharingApproved != null) {
      map['data_sharing_approved'] = Variable<bool>(dataSharingApproved);
    }
    if (!nullToAbsent || dataSharingApprovedAt != null) {
      map['data_sharing_approved_at'] = Variable<int>(dataSharingApprovedAt);
    }
    map['trainer_id'] = Variable<String>(trainerId);
    if (!nullToAbsent || clientId != null) {
      map['client_id'] = Variable<String>(clientId);
    }
    if (!nullToAbsent || clientName != null) {
      map['client_name'] = Variable<String>(clientName);
    }
    if (!nullToAbsent || clientEmail != null) {
      map['client_email'] = Variable<String>(clientEmail);
    }
    if (!nullToAbsent || clientNotes != null) {
      map['client_notes'] = Variable<String>(clientNotes);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<int>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  BookingTableCompanion toCompanion(bool nullToAbsent) {
    return BookingTableCompanion(
      id: Value(id),
      startTime: Value(startTime),
      endTime: Value(endTime),
      status: Value(status),
      dataSharingApproved: dataSharingApproved == null && nullToAbsent
          ? const Value.absent()
          : Value(dataSharingApproved),
      dataSharingApprovedAt: dataSharingApprovedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(dataSharingApprovedAt),
      trainerId: Value(trainerId),
      clientId: clientId == null && nullToAbsent
          ? const Value.absent()
          : Value(clientId),
      clientName: clientName == null && nullToAbsent
          ? const Value.absent()
          : Value(clientName),
      clientEmail: clientEmail == null && nullToAbsent
          ? const Value.absent()
          : Value(clientEmail),
      clientNotes: clientNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(clientNotes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory BookingEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookingEntity(
      id: serializer.fromJson<String>(json['id']),
      startTime: serializer.fromJson<int>(json['startTime']),
      endTime: serializer.fromJson<int>(json['endTime']),
      status: serializer.fromJson<String>(json['status']),
      dataSharingApproved: serializer.fromJson<bool?>(
        json['dataSharingApproved'],
      ),
      dataSharingApprovedAt: serializer.fromJson<int?>(
        json['dataSharingApprovedAt'],
      ),
      trainerId: serializer.fromJson<String>(json['trainerId']),
      clientId: serializer.fromJson<String?>(json['clientId']),
      clientName: serializer.fromJson<String?>(json['clientName']),
      clientEmail: serializer.fromJson<String?>(json['clientEmail']),
      clientNotes: serializer.fromJson<String?>(json['clientNotes']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      deletedAt: serializer.fromJson<int?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'startTime': serializer.toJson<int>(startTime),
      'endTime': serializer.toJson<int>(endTime),
      'status': serializer.toJson<String>(status),
      'dataSharingApproved': serializer.toJson<bool?>(dataSharingApproved),
      'dataSharingApprovedAt': serializer.toJson<int?>(dataSharingApprovedAt),
      'trainerId': serializer.toJson<String>(trainerId),
      'clientId': serializer.toJson<String?>(clientId),
      'clientName': serializer.toJson<String?>(clientName),
      'clientEmail': serializer.toJson<String?>(clientEmail),
      'clientNotes': serializer.toJson<String?>(clientNotes),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'deletedAt': serializer.toJson<int?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  BookingEntity copyWith({
    String? id,
    int? startTime,
    int? endTime,
    String? status,
    Value<bool?> dataSharingApproved = const Value.absent(),
    Value<int?> dataSharingApprovedAt = const Value.absent(),
    String? trainerId,
    Value<String?> clientId = const Value.absent(),
    Value<String?> clientName = const Value.absent(),
    Value<String?> clientEmail = const Value.absent(),
    Value<String?> clientNotes = const Value.absent(),
    int? createdAt,
    int? updatedAt,
    Value<int?> deletedAt = const Value.absent(),
    String? syncStatus,
  }) => BookingEntity(
    id: id ?? this.id,
    startTime: startTime ?? this.startTime,
    endTime: endTime ?? this.endTime,
    status: status ?? this.status,
    dataSharingApproved: dataSharingApproved.present
        ? dataSharingApproved.value
        : this.dataSharingApproved,
    dataSharingApprovedAt: dataSharingApprovedAt.present
        ? dataSharingApprovedAt.value
        : this.dataSharingApprovedAt,
    trainerId: trainerId ?? this.trainerId,
    clientId: clientId.present ? clientId.value : this.clientId,
    clientName: clientName.present ? clientName.value : this.clientName,
    clientEmail: clientEmail.present ? clientEmail.value : this.clientEmail,
    clientNotes: clientNotes.present ? clientNotes.value : this.clientNotes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  BookingEntity copyWithCompanion(BookingTableCompanion data) {
    return BookingEntity(
      id: data.id.present ? data.id.value : this.id,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      status: data.status.present ? data.status.value : this.status,
      dataSharingApproved: data.dataSharingApproved.present
          ? data.dataSharingApproved.value
          : this.dataSharingApproved,
      dataSharingApprovedAt: data.dataSharingApprovedAt.present
          ? data.dataSharingApprovedAt.value
          : this.dataSharingApprovedAt,
      trainerId: data.trainerId.present ? data.trainerId.value : this.trainerId,
      clientId: data.clientId.present ? data.clientId.value : this.clientId,
      clientName: data.clientName.present
          ? data.clientName.value
          : this.clientName,
      clientEmail: data.clientEmail.present
          ? data.clientEmail.value
          : this.clientEmail,
      clientNotes: data.clientNotes.present
          ? data.clientNotes.value
          : this.clientNotes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BookingEntity(')
          ..write('id: $id, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('status: $status, ')
          ..write('dataSharingApproved: $dataSharingApproved, ')
          ..write('dataSharingApprovedAt: $dataSharingApprovedAt, ')
          ..write('trainerId: $trainerId, ')
          ..write('clientId: $clientId, ')
          ..write('clientName: $clientName, ')
          ..write('clientEmail: $clientEmail, ')
          ..write('clientNotes: $clientNotes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    startTime,
    endTime,
    status,
    dataSharingApproved,
    dataSharingApprovedAt,
    trainerId,
    clientId,
    clientName,
    clientEmail,
    clientNotes,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookingEntity &&
          other.id == this.id &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.status == this.status &&
          other.dataSharingApproved == this.dataSharingApproved &&
          other.dataSharingApprovedAt == this.dataSharingApprovedAt &&
          other.trainerId == this.trainerId &&
          other.clientId == this.clientId &&
          other.clientName == this.clientName &&
          other.clientEmail == this.clientEmail &&
          other.clientNotes == this.clientNotes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus);
}

class BookingTableCompanion extends UpdateCompanion<BookingEntity> {
  final Value<String> id;
  final Value<int> startTime;
  final Value<int> endTime;
  final Value<String> status;
  final Value<bool?> dataSharingApproved;
  final Value<int?> dataSharingApprovedAt;
  final Value<String> trainerId;
  final Value<String?> clientId;
  final Value<String?> clientName;
  final Value<String?> clientEmail;
  final Value<String?> clientNotes;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int?> deletedAt;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const BookingTableCompanion({
    this.id = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.status = const Value.absent(),
    this.dataSharingApproved = const Value.absent(),
    this.dataSharingApprovedAt = const Value.absent(),
    this.trainerId = const Value.absent(),
    this.clientId = const Value.absent(),
    this.clientName = const Value.absent(),
    this.clientEmail = const Value.absent(),
    this.clientNotes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BookingTableCompanion.insert({
    this.id = const Value.absent(),
    required int startTime,
    required int endTime,
    this.status = const Value.absent(),
    this.dataSharingApproved = const Value.absent(),
    this.dataSharingApprovedAt = const Value.absent(),
    required String trainerId,
    this.clientId = const Value.absent(),
    this.clientName = const Value.absent(),
    this.clientEmail = const Value.absent(),
    this.clientNotes = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : startTime = Value(startTime),
       endTime = Value(endTime),
       trainerId = Value(trainerId),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<BookingEntity> custom({
    Expression<String>? id,
    Expression<int>? startTime,
    Expression<int>? endTime,
    Expression<String>? status,
    Expression<bool>? dataSharingApproved,
    Expression<int>? dataSharingApprovedAt,
    Expression<String>? trainerId,
    Expression<String>? clientId,
    Expression<String>? clientName,
    Expression<String>? clientEmail,
    Expression<String>? clientNotes,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? deletedAt,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (status != null) 'status': status,
      if (dataSharingApproved != null)
        'data_sharing_approved': dataSharingApproved,
      if (dataSharingApprovedAt != null)
        'data_sharing_approved_at': dataSharingApprovedAt,
      if (trainerId != null) 'trainer_id': trainerId,
      if (clientId != null) 'client_id': clientId,
      if (clientName != null) 'client_name': clientName,
      if (clientEmail != null) 'client_email': clientEmail,
      if (clientNotes != null) 'client_notes': clientNotes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BookingTableCompanion copyWith({
    Value<String>? id,
    Value<int>? startTime,
    Value<int>? endTime,
    Value<String>? status,
    Value<bool?>? dataSharingApproved,
    Value<int?>? dataSharingApprovedAt,
    Value<String>? trainerId,
    Value<String?>? clientId,
    Value<String?>? clientName,
    Value<String?>? clientEmail,
    Value<String?>? clientNotes,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int?>? deletedAt,
    Value<String>? syncStatus,
    Value<int>? rowid,
  }) {
    return BookingTableCompanion(
      id: id ?? this.id,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      status: status ?? this.status,
      dataSharingApproved: dataSharingApproved ?? this.dataSharingApproved,
      dataSharingApprovedAt:
          dataSharingApprovedAt ?? this.dataSharingApprovedAt,
      trainerId: trainerId ?? this.trainerId,
      clientId: clientId ?? this.clientId,
      clientName: clientName ?? this.clientName,
      clientEmail: clientEmail ?? this.clientEmail,
      clientNotes: clientNotes ?? this.clientNotes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<int>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<int>(endTime.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (dataSharingApproved.present) {
      map['data_sharing_approved'] = Variable<bool>(dataSharingApproved.value);
    }
    if (dataSharingApprovedAt.present) {
      map['data_sharing_approved_at'] = Variable<int>(
        dataSharingApprovedAt.value,
      );
    }
    if (trainerId.present) {
      map['trainer_id'] = Variable<String>(trainerId.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<String>(clientId.value);
    }
    if (clientName.present) {
      map['client_name'] = Variable<String>(clientName.value);
    }
    if (clientEmail.present) {
      map['client_email'] = Variable<String>(clientEmail.value);
    }
    if (clientNotes.present) {
      map['client_notes'] = Variable<String>(clientNotes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<int>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookingTableCompanion(')
          ..write('id: $id, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('status: $status, ')
          ..write('dataSharingApproved: $dataSharingApproved, ')
          ..write('dataSharingApprovedAt: $dataSharingApprovedAt, ')
          ..write('trainerId: $trainerId, ')
          ..write('clientId: $clientId, ')
          ..write('clientName: $clientName, ')
          ..write('clientEmail: $clientEmail, ')
          ..write('clientNotes: $clientNotes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PackageTableTable extends PackageTable
    with TableInfo<$PackageTableTable, PackageEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PackageTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<String> price = GeneratedColumn<String>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _numberOfSessionsMeta = const VerificationMeta(
    'numberOfSessions',
  );
  @override
  late final GeneratedColumn<int> numberOfSessions = GeneratedColumn<int>(
    'number_of_sessions',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _stripeProductIdMeta = const VerificationMeta(
    'stripeProductId',
  );
  @override
  late final GeneratedColumn<String> stripeProductId = GeneratedColumn<String>(
    'stripe_product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stripePriceIdMeta = const VerificationMeta(
    'stripePriceId',
  );
  @override
  late final GeneratedColumn<String> stripePriceId = GeneratedColumn<String>(
    'stripe_price_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _trainerIdMeta = const VerificationMeta(
    'trainerId',
  );
  @override
  late final GeneratedColumn<String> trainerId = GeneratedColumn<String>(
    'trainer_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<int> deletedAt = GeneratedColumn<int>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    price,
    numberOfSessions,
    isActive,
    stripeProductId,
    stripePriceId,
    trainerId,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'package_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<PackageEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('number_of_sessions')) {
      context.handle(
        _numberOfSessionsMeta,
        numberOfSessions.isAcceptableOrUnknown(
          data['number_of_sessions']!,
          _numberOfSessionsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_numberOfSessionsMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('stripe_product_id')) {
      context.handle(
        _stripeProductIdMeta,
        stripeProductId.isAcceptableOrUnknown(
          data['stripe_product_id']!,
          _stripeProductIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_stripeProductIdMeta);
    }
    if (data.containsKey('stripe_price_id')) {
      context.handle(
        _stripePriceIdMeta,
        stripePriceId.isAcceptableOrUnknown(
          data['stripe_price_id']!,
          _stripePriceIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_stripePriceIdMeta);
    }
    if (data.containsKey('trainer_id')) {
      context.handle(
        _trainerIdMeta,
        trainerId.isAcceptableOrUnknown(data['trainer_id']!, _trainerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_trainerIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PackageEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PackageEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}price'],
      )!,
      numberOfSessions: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}number_of_sessions'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      stripeProductId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stripe_product_id'],
      )!,
      stripePriceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stripe_price_id'],
      )!,
      trainerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}trainer_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
    );
  }

  @override
  $PackageTableTable createAlias(String alias) {
    return $PackageTableTable(attachedDatabase, alias);
  }
}

class PackageEntity extends DataClass implements Insertable<PackageEntity> {
  final String id;
  final String name;
  final String? description;
  final String price;
  final int numberOfSessions;
  final bool isActive;
  final String stripeProductId;
  final String stripePriceId;
  final String trainerId;
  final int createdAt;
  final int updatedAt;
  final int? deletedAt;
  final String syncStatus;
  const PackageEntity({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    required this.numberOfSessions,
    required this.isActive,
    required this.stripeProductId,
    required this.stripePriceId,
    required this.trainerId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['price'] = Variable<String>(price);
    map['number_of_sessions'] = Variable<int>(numberOfSessions);
    map['is_active'] = Variable<bool>(isActive);
    map['stripe_product_id'] = Variable<String>(stripeProductId);
    map['stripe_price_id'] = Variable<String>(stripePriceId);
    map['trainer_id'] = Variable<String>(trainerId);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<int>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  PackageTableCompanion toCompanion(bool nullToAbsent) {
    return PackageTableCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      price: Value(price),
      numberOfSessions: Value(numberOfSessions),
      isActive: Value(isActive),
      stripeProductId: Value(stripeProductId),
      stripePriceId: Value(stripePriceId),
      trainerId: Value(trainerId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory PackageEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PackageEntity(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      price: serializer.fromJson<String>(json['price']),
      numberOfSessions: serializer.fromJson<int>(json['numberOfSessions']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      stripeProductId: serializer.fromJson<String>(json['stripeProductId']),
      stripePriceId: serializer.fromJson<String>(json['stripePriceId']),
      trainerId: serializer.fromJson<String>(json['trainerId']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      deletedAt: serializer.fromJson<int?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'price': serializer.toJson<String>(price),
      'numberOfSessions': serializer.toJson<int>(numberOfSessions),
      'isActive': serializer.toJson<bool>(isActive),
      'stripeProductId': serializer.toJson<String>(stripeProductId),
      'stripePriceId': serializer.toJson<String>(stripePriceId),
      'trainerId': serializer.toJson<String>(trainerId),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'deletedAt': serializer.toJson<int?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  PackageEntity copyWith({
    String? id,
    String? name,
    Value<String?> description = const Value.absent(),
    String? price,
    int? numberOfSessions,
    bool? isActive,
    String? stripeProductId,
    String? stripePriceId,
    String? trainerId,
    int? createdAt,
    int? updatedAt,
    Value<int?> deletedAt = const Value.absent(),
    String? syncStatus,
  }) => PackageEntity(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    price: price ?? this.price,
    numberOfSessions: numberOfSessions ?? this.numberOfSessions,
    isActive: isActive ?? this.isActive,
    stripeProductId: stripeProductId ?? this.stripeProductId,
    stripePriceId: stripePriceId ?? this.stripePriceId,
    trainerId: trainerId ?? this.trainerId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  PackageEntity copyWithCompanion(PackageTableCompanion data) {
    return PackageEntity(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      price: data.price.present ? data.price.value : this.price,
      numberOfSessions: data.numberOfSessions.present
          ? data.numberOfSessions.value
          : this.numberOfSessions,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      stripeProductId: data.stripeProductId.present
          ? data.stripeProductId.value
          : this.stripeProductId,
      stripePriceId: data.stripePriceId.present
          ? data.stripePriceId.value
          : this.stripePriceId,
      trainerId: data.trainerId.present ? data.trainerId.value : this.trainerId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PackageEntity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('price: $price, ')
          ..write('numberOfSessions: $numberOfSessions, ')
          ..write('isActive: $isActive, ')
          ..write('stripeProductId: $stripeProductId, ')
          ..write('stripePriceId: $stripePriceId, ')
          ..write('trainerId: $trainerId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    description,
    price,
    numberOfSessions,
    isActive,
    stripeProductId,
    stripePriceId,
    trainerId,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PackageEntity &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.price == this.price &&
          other.numberOfSessions == this.numberOfSessions &&
          other.isActive == this.isActive &&
          other.stripeProductId == this.stripeProductId &&
          other.stripePriceId == this.stripePriceId &&
          other.trainerId == this.trainerId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus);
}

class PackageTableCompanion extends UpdateCompanion<PackageEntity> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String> price;
  final Value<int> numberOfSessions;
  final Value<bool> isActive;
  final Value<String> stripeProductId;
  final Value<String> stripePriceId;
  final Value<String> trainerId;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int?> deletedAt;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const PackageTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.price = const Value.absent(),
    this.numberOfSessions = const Value.absent(),
    this.isActive = const Value.absent(),
    this.stripeProductId = const Value.absent(),
    this.stripePriceId = const Value.absent(),
    this.trainerId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PackageTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    required String price,
    required int numberOfSessions,
    this.isActive = const Value.absent(),
    required String stripeProductId,
    required String stripePriceId,
    required String trainerId,
    required int createdAt,
    required int updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       price = Value(price),
       numberOfSessions = Value(numberOfSessions),
       stripeProductId = Value(stripeProductId),
       stripePriceId = Value(stripePriceId),
       trainerId = Value(trainerId),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<PackageEntity> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? price,
    Expression<int>? numberOfSessions,
    Expression<bool>? isActive,
    Expression<String>? stripeProductId,
    Expression<String>? stripePriceId,
    Expression<String>? trainerId,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? deletedAt,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (price != null) 'price': price,
      if (numberOfSessions != null) 'number_of_sessions': numberOfSessions,
      if (isActive != null) 'is_active': isActive,
      if (stripeProductId != null) 'stripe_product_id': stripeProductId,
      if (stripePriceId != null) 'stripe_price_id': stripePriceId,
      if (trainerId != null) 'trainer_id': trainerId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PackageTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<String>? price,
    Value<int>? numberOfSessions,
    Value<bool>? isActive,
    Value<String>? stripeProductId,
    Value<String>? stripePriceId,
    Value<String>? trainerId,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int?>? deletedAt,
    Value<String>? syncStatus,
    Value<int>? rowid,
  }) {
    return PackageTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      numberOfSessions: numberOfSessions ?? this.numberOfSessions,
      isActive: isActive ?? this.isActive,
      stripeProductId: stripeProductId ?? this.stripeProductId,
      stripePriceId: stripePriceId ?? this.stripePriceId,
      trainerId: trainerId ?? this.trainerId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (price.present) {
      map['price'] = Variable<String>(price.value);
    }
    if (numberOfSessions.present) {
      map['number_of_sessions'] = Variable<int>(numberOfSessions.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (stripeProductId.present) {
      map['stripe_product_id'] = Variable<String>(stripeProductId.value);
    }
    if (stripePriceId.present) {
      map['stripe_price_id'] = Variable<String>(stripePriceId.value);
    }
    if (trainerId.present) {
      map['trainer_id'] = Variable<String>(trainerId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<int>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PackageTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('price: $price, ')
          ..write('numberOfSessions: $numberOfSessions, ')
          ..write('isActive: $isActive, ')
          ..write('stripeProductId: $stripeProductId, ')
          ..write('stripePriceId: $stripePriceId, ')
          ..write('trainerId: $trainerId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TestimonialTableTable extends TestimonialTable
    with TableInfo<$TestimonialTableTable, TestimonialEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TestimonialTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _profileIdMeta = const VerificationMeta(
    'profileId',
  );
  @override
  late final GeneratedColumn<String> profileId = GeneratedColumn<String>(
    'profile_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _clientNameMeta = const VerificationMeta(
    'clientName',
  );
  @override
  late final GeneratedColumn<String> clientName = GeneratedColumn<String>(
    'client_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _testimonialTextMeta = const VerificationMeta(
    'testimonialText',
  );
  @override
  late final GeneratedColumn<String> testimonialText = GeneratedColumn<String>(
    'testimonial_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<int> rating = GeneratedColumn<int>(
    'rating',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<int> deletedAt = GeneratedColumn<int>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    profileId,
    clientName,
    testimonialText,
    rating,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'testimonial_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<TestimonialEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('profile_id')) {
      context.handle(
        _profileIdMeta,
        profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('client_name')) {
      context.handle(
        _clientNameMeta,
        clientName.isAcceptableOrUnknown(data['client_name']!, _clientNameMeta),
      );
    } else if (isInserting) {
      context.missing(_clientNameMeta);
    }
    if (data.containsKey('testimonial_text')) {
      context.handle(
        _testimonialTextMeta,
        testimonialText.isAcceptableOrUnknown(
          data['testimonial_text']!,
          _testimonialTextMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_testimonialTextMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TestimonialEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TestimonialEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      profileId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}profile_id'],
      )!,
      clientName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_name'],
      )!,
      testimonialText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}testimonial_text'],
      )!,
      rating: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rating'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
    );
  }

  @override
  $TestimonialTableTable createAlias(String alias) {
    return $TestimonialTableTable(attachedDatabase, alias);
  }
}

class TestimonialEntity extends DataClass
    implements Insertable<TestimonialEntity> {
  final String id;
  final String profileId;
  final String clientName;
  final String testimonialText;
  final int? rating;
  final int createdAt;
  final int updatedAt;
  final int? deletedAt;
  final String syncStatus;
  const TestimonialEntity({
    required this.id,
    required this.profileId,
    required this.clientName,
    required this.testimonialText,
    this.rating,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['profile_id'] = Variable<String>(profileId);
    map['client_name'] = Variable<String>(clientName);
    map['testimonial_text'] = Variable<String>(testimonialText);
    if (!nullToAbsent || rating != null) {
      map['rating'] = Variable<int>(rating);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<int>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  TestimonialTableCompanion toCompanion(bool nullToAbsent) {
    return TestimonialTableCompanion(
      id: Value(id),
      profileId: Value(profileId),
      clientName: Value(clientName),
      testimonialText: Value(testimonialText),
      rating: rating == null && nullToAbsent
          ? const Value.absent()
          : Value(rating),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory TestimonialEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TestimonialEntity(
      id: serializer.fromJson<String>(json['id']),
      profileId: serializer.fromJson<String>(json['profileId']),
      clientName: serializer.fromJson<String>(json['clientName']),
      testimonialText: serializer.fromJson<String>(json['testimonialText']),
      rating: serializer.fromJson<int?>(json['rating']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      deletedAt: serializer.fromJson<int?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'profileId': serializer.toJson<String>(profileId),
      'clientName': serializer.toJson<String>(clientName),
      'testimonialText': serializer.toJson<String>(testimonialText),
      'rating': serializer.toJson<int?>(rating),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'deletedAt': serializer.toJson<int?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  TestimonialEntity copyWith({
    String? id,
    String? profileId,
    String? clientName,
    String? testimonialText,
    Value<int?> rating = const Value.absent(),
    int? createdAt,
    int? updatedAt,
    Value<int?> deletedAt = const Value.absent(),
    String? syncStatus,
  }) => TestimonialEntity(
    id: id ?? this.id,
    profileId: profileId ?? this.profileId,
    clientName: clientName ?? this.clientName,
    testimonialText: testimonialText ?? this.testimonialText,
    rating: rating.present ? rating.value : this.rating,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  TestimonialEntity copyWithCompanion(TestimonialTableCompanion data) {
    return TestimonialEntity(
      id: data.id.present ? data.id.value : this.id,
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      clientName: data.clientName.present
          ? data.clientName.value
          : this.clientName,
      testimonialText: data.testimonialText.present
          ? data.testimonialText.value
          : this.testimonialText,
      rating: data.rating.present ? data.rating.value : this.rating,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TestimonialEntity(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('clientName: $clientName, ')
          ..write('testimonialText: $testimonialText, ')
          ..write('rating: $rating, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    profileId,
    clientName,
    testimonialText,
    rating,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TestimonialEntity &&
          other.id == this.id &&
          other.profileId == this.profileId &&
          other.clientName == this.clientName &&
          other.testimonialText == this.testimonialText &&
          other.rating == this.rating &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus);
}

class TestimonialTableCompanion extends UpdateCompanion<TestimonialEntity> {
  final Value<String> id;
  final Value<String> profileId;
  final Value<String> clientName;
  final Value<String> testimonialText;
  final Value<int?> rating;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int?> deletedAt;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const TestimonialTableCompanion({
    this.id = const Value.absent(),
    this.profileId = const Value.absent(),
    this.clientName = const Value.absent(),
    this.testimonialText = const Value.absent(),
    this.rating = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TestimonialTableCompanion.insert({
    this.id = const Value.absent(),
    required String profileId,
    required String clientName,
    required String testimonialText,
    this.rating = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : profileId = Value(profileId),
       clientName = Value(clientName),
       testimonialText = Value(testimonialText),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<TestimonialEntity> custom({
    Expression<String>? id,
    Expression<String>? profileId,
    Expression<String>? clientName,
    Expression<String>? testimonialText,
    Expression<int>? rating,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? deletedAt,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (profileId != null) 'profile_id': profileId,
      if (clientName != null) 'client_name': clientName,
      if (testimonialText != null) 'testimonial_text': testimonialText,
      if (rating != null) 'rating': rating,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TestimonialTableCompanion copyWith({
    Value<String>? id,
    Value<String>? profileId,
    Value<String>? clientName,
    Value<String>? testimonialText,
    Value<int?>? rating,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int?>? deletedAt,
    Value<String>? syncStatus,
    Value<int>? rowid,
  }) {
    return TestimonialTableCompanion(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      clientName: clientName ?? this.clientName,
      testimonialText: testimonialText ?? this.testimonialText,
      rating: rating ?? this.rating,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (profileId.present) {
      map['profile_id'] = Variable<String>(profileId.value);
    }
    if (clientName.present) {
      map['client_name'] = Variable<String>(clientName.value);
    }
    if (testimonialText.present) {
      map['testimonial_text'] = Variable<String>(testimonialText.value);
    }
    if (rating.present) {
      map['rating'] = Variable<int>(rating.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<int>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TestimonialTableCompanion(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('clientName: $clientName, ')
          ..write('testimonialText: $testimonialText, ')
          ..write('rating: $rating, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ClientExerciseLogsTable extends ClientExerciseLogs
    with TableInfo<$ClientExerciseLogsTable, ClientExerciseLogEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClientExerciseLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _clientIdMeta = const VerificationMeta(
    'clientId',
  );
  @override
  late final GeneratedColumn<String> clientId = GeneratedColumn<String>(
    'client_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exerciseIdMeta = const VerificationMeta(
    'exerciseId',
  );
  @override
  late final GeneratedColumn<String> exerciseId = GeneratedColumn<String>(
    'exercise_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _repsMeta = const VerificationMeta('reps');
  @override
  late final GeneratedColumn<int> reps = GeneratedColumn<int>(
    'reps',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isCompletedMeta = const VerificationMeta(
    'isCompleted',
  );
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
    'is_completed',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_completed" IN (0, 1))',
    ),
  );
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
    'order',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tempoMeta = const VerificationMeta('tempo');
  @override
  late final GeneratedColumn<String> tempo = GeneratedColumn<String>(
    'tempo',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _videoUrlMeta = const VerificationMeta(
    'videoUrl',
  );
  @override
  late final GeneratedColumn<String> videoUrl = GeneratedColumn<String>(
    'video_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sideMeta = const VerificationMeta('side');
  @override
  late final GeneratedColumn<String> side = GeneratedColumn<String>(
    'side',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => 'BOTH',
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<int> deletedAt = GeneratedColumn<int>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _workoutSessionIdMeta = const VerificationMeta(
    'workoutSessionId',
  );
  @override
  late final GeneratedColumn<String> workoutSessionId = GeneratedColumn<String>(
    'workout_session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _supersetKeyMeta = const VerificationMeta(
    'supersetKey',
  );
  @override
  late final GeneratedColumn<String> supersetKey = GeneratedColumn<String>(
    'superset_key',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orderInSupersetMeta = const VerificationMeta(
    'orderInSuperset',
  );
  @override
  late final GeneratedColumn<int> orderInSuperset = GeneratedColumn<int>(
    'order_in_superset',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => 'pending',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    clientId,
    exerciseId,
    reps,
    weight,
    isCompleted,
    order,
    tempo,
    notes,
    videoUrl,
    side,
    createdAt,
    updatedAt,
    deletedAt,
    workoutSessionId,
    supersetKey,
    orderInSuperset,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'client_exercise_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<ClientExerciseLogEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('client_id')) {
      context.handle(
        _clientIdMeta,
        clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta),
      );
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
        _exerciseIdMeta,
        exerciseId.isAcceptableOrUnknown(data['exercise_id']!, _exerciseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('reps')) {
      context.handle(
        _repsMeta,
        reps.isAcceptableOrUnknown(data['reps']!, _repsMeta),
      );
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    }
    if (data.containsKey('is_completed')) {
      context.handle(
        _isCompletedMeta,
        isCompleted.isAcceptableOrUnknown(
          data['is_completed']!,
          _isCompletedMeta,
        ),
      );
    }
    if (data.containsKey('order')) {
      context.handle(
        _orderMeta,
        order.isAcceptableOrUnknown(data['order']!, _orderMeta),
      );
    }
    if (data.containsKey('tempo')) {
      context.handle(
        _tempoMeta,
        tempo.isAcceptableOrUnknown(data['tempo']!, _tempoMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('video_url')) {
      context.handle(
        _videoUrlMeta,
        videoUrl.isAcceptableOrUnknown(data['video_url']!, _videoUrlMeta),
      );
    }
    if (data.containsKey('side')) {
      context.handle(
        _sideMeta,
        side.isAcceptableOrUnknown(data['side']!, _sideMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('workout_session_id')) {
      context.handle(
        _workoutSessionIdMeta,
        workoutSessionId.isAcceptableOrUnknown(
          data['workout_session_id']!,
          _workoutSessionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_workoutSessionIdMeta);
    }
    if (data.containsKey('superset_key')) {
      context.handle(
        _supersetKeyMeta,
        supersetKey.isAcceptableOrUnknown(
          data['superset_key']!,
          _supersetKeyMeta,
        ),
      );
    }
    if (data.containsKey('order_in_superset')) {
      context.handle(
        _orderInSupersetMeta,
        orderInSuperset.isAcceptableOrUnknown(
          data['order_in_superset']!,
          _orderInSupersetMeta,
        ),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ClientExerciseLogEntity map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClientExerciseLogEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      clientId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_id'],
      )!,
      exerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercise_id'],
      )!,
      reps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reps'],
      ),
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight'],
      ),
      isCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_completed'],
      ),
      order: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order'],
      ),
      tempo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tempo'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      videoUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}video_url'],
      ),
      side: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}side'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}deleted_at'],
      ),
      workoutSessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}workout_session_id'],
      )!,
      supersetKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}superset_key'],
      ),
      orderInSuperset: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_in_superset'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
    );
  }

  @override
  $ClientExerciseLogsTable createAlias(String alias) {
    return $ClientExerciseLogsTable(attachedDatabase, alias);
  }
}

class ClientExerciseLogEntity extends DataClass
    implements Insertable<ClientExerciseLogEntity> {
  final String id;
  final String clientId;
  final String exerciseId;
  final int? reps;
  final double? weight;
  final bool? isCompleted;
  final int? order;
  final String? tempo;
  final String? notes;
  final String? videoUrl;
  final String side;
  final int createdAt;
  final int updatedAt;
  final int? deletedAt;
  final String workoutSessionId;
  final String? supersetKey;
  final int? orderInSuperset;
  final String syncStatus;
  const ClientExerciseLogEntity({
    required this.id,
    required this.clientId,
    required this.exerciseId,
    this.reps,
    this.weight,
    this.isCompleted,
    this.order,
    this.tempo,
    this.notes,
    this.videoUrl,
    required this.side,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.workoutSessionId,
    this.supersetKey,
    this.orderInSuperset,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['client_id'] = Variable<String>(clientId);
    map['exercise_id'] = Variable<String>(exerciseId);
    if (!nullToAbsent || reps != null) {
      map['reps'] = Variable<int>(reps);
    }
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<double>(weight);
    }
    if (!nullToAbsent || isCompleted != null) {
      map['is_completed'] = Variable<bool>(isCompleted);
    }
    if (!nullToAbsent || order != null) {
      map['order'] = Variable<int>(order);
    }
    if (!nullToAbsent || tempo != null) {
      map['tempo'] = Variable<String>(tempo);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || videoUrl != null) {
      map['video_url'] = Variable<String>(videoUrl);
    }
    map['side'] = Variable<String>(side);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<int>(deletedAt);
    }
    map['workout_session_id'] = Variable<String>(workoutSessionId);
    if (!nullToAbsent || supersetKey != null) {
      map['superset_key'] = Variable<String>(supersetKey);
    }
    if (!nullToAbsent || orderInSuperset != null) {
      map['order_in_superset'] = Variable<int>(orderInSuperset);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  ClientExerciseLogsCompanion toCompanion(bool nullToAbsent) {
    return ClientExerciseLogsCompanion(
      id: Value(id),
      clientId: Value(clientId),
      exerciseId: Value(exerciseId),
      reps: reps == null && nullToAbsent ? const Value.absent() : Value(reps),
      weight: weight == null && nullToAbsent
          ? const Value.absent()
          : Value(weight),
      isCompleted: isCompleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isCompleted),
      order: order == null && nullToAbsent
          ? const Value.absent()
          : Value(order),
      tempo: tempo == null && nullToAbsent
          ? const Value.absent()
          : Value(tempo),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      videoUrl: videoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(videoUrl),
      side: Value(side),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      workoutSessionId: Value(workoutSessionId),
      supersetKey: supersetKey == null && nullToAbsent
          ? const Value.absent()
          : Value(supersetKey),
      orderInSuperset: orderInSuperset == null && nullToAbsent
          ? const Value.absent()
          : Value(orderInSuperset),
      syncStatus: Value(syncStatus),
    );
  }

  factory ClientExerciseLogEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ClientExerciseLogEntity(
      id: serializer.fromJson<String>(json['id']),
      clientId: serializer.fromJson<String>(json['clientId']),
      exerciseId: serializer.fromJson<String>(json['exerciseId']),
      reps: serializer.fromJson<int?>(json['reps']),
      weight: serializer.fromJson<double?>(json['weight']),
      isCompleted: serializer.fromJson<bool?>(json['isCompleted']),
      order: serializer.fromJson<int?>(json['order']),
      tempo: serializer.fromJson<String?>(json['tempo']),
      notes: serializer.fromJson<String?>(json['notes']),
      videoUrl: serializer.fromJson<String?>(json['videoUrl']),
      side: serializer.fromJson<String>(json['side']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      deletedAt: serializer.fromJson<int?>(json['deletedAt']),
      workoutSessionId: serializer.fromJson<String>(json['workoutSessionId']),
      supersetKey: serializer.fromJson<String?>(json['supersetKey']),
      orderInSuperset: serializer.fromJson<int?>(json['orderInSuperset']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'clientId': serializer.toJson<String>(clientId),
      'exerciseId': serializer.toJson<String>(exerciseId),
      'reps': serializer.toJson<int?>(reps),
      'weight': serializer.toJson<double?>(weight),
      'isCompleted': serializer.toJson<bool?>(isCompleted),
      'order': serializer.toJson<int?>(order),
      'tempo': serializer.toJson<String?>(tempo),
      'notes': serializer.toJson<String?>(notes),
      'videoUrl': serializer.toJson<String?>(videoUrl),
      'side': serializer.toJson<String>(side),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'deletedAt': serializer.toJson<int?>(deletedAt),
      'workoutSessionId': serializer.toJson<String>(workoutSessionId),
      'supersetKey': serializer.toJson<String?>(supersetKey),
      'orderInSuperset': serializer.toJson<int?>(orderInSuperset),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  ClientExerciseLogEntity copyWith({
    String? id,
    String? clientId,
    String? exerciseId,
    Value<int?> reps = const Value.absent(),
    Value<double?> weight = const Value.absent(),
    Value<bool?> isCompleted = const Value.absent(),
    Value<int?> order = const Value.absent(),
    Value<String?> tempo = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    Value<String?> videoUrl = const Value.absent(),
    String? side,
    int? createdAt,
    int? updatedAt,
    Value<int?> deletedAt = const Value.absent(),
    String? workoutSessionId,
    Value<String?> supersetKey = const Value.absent(),
    Value<int?> orderInSuperset = const Value.absent(),
    String? syncStatus,
  }) => ClientExerciseLogEntity(
    id: id ?? this.id,
    clientId: clientId ?? this.clientId,
    exerciseId: exerciseId ?? this.exerciseId,
    reps: reps.present ? reps.value : this.reps,
    weight: weight.present ? weight.value : this.weight,
    isCompleted: isCompleted.present ? isCompleted.value : this.isCompleted,
    order: order.present ? order.value : this.order,
    tempo: tempo.present ? tempo.value : this.tempo,
    notes: notes.present ? notes.value : this.notes,
    videoUrl: videoUrl.present ? videoUrl.value : this.videoUrl,
    side: side ?? this.side,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    workoutSessionId: workoutSessionId ?? this.workoutSessionId,
    supersetKey: supersetKey.present ? supersetKey.value : this.supersetKey,
    orderInSuperset: orderInSuperset.present
        ? orderInSuperset.value
        : this.orderInSuperset,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  ClientExerciseLogEntity copyWithCompanion(ClientExerciseLogsCompanion data) {
    return ClientExerciseLogEntity(
      id: data.id.present ? data.id.value : this.id,
      clientId: data.clientId.present ? data.clientId.value : this.clientId,
      exerciseId: data.exerciseId.present
          ? data.exerciseId.value
          : this.exerciseId,
      reps: data.reps.present ? data.reps.value : this.reps,
      weight: data.weight.present ? data.weight.value : this.weight,
      isCompleted: data.isCompleted.present
          ? data.isCompleted.value
          : this.isCompleted,
      order: data.order.present ? data.order.value : this.order,
      tempo: data.tempo.present ? data.tempo.value : this.tempo,
      notes: data.notes.present ? data.notes.value : this.notes,
      videoUrl: data.videoUrl.present ? data.videoUrl.value : this.videoUrl,
      side: data.side.present ? data.side.value : this.side,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      workoutSessionId: data.workoutSessionId.present
          ? data.workoutSessionId.value
          : this.workoutSessionId,
      supersetKey: data.supersetKey.present
          ? data.supersetKey.value
          : this.supersetKey,
      orderInSuperset: data.orderInSuperset.present
          ? data.orderInSuperset.value
          : this.orderInSuperset,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ClientExerciseLogEntity(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('reps: $reps, ')
          ..write('weight: $weight, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('order: $order, ')
          ..write('tempo: $tempo, ')
          ..write('notes: $notes, ')
          ..write('videoUrl: $videoUrl, ')
          ..write('side: $side, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('workoutSessionId: $workoutSessionId, ')
          ..write('supersetKey: $supersetKey, ')
          ..write('orderInSuperset: $orderInSuperset, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    clientId,
    exerciseId,
    reps,
    weight,
    isCompleted,
    order,
    tempo,
    notes,
    videoUrl,
    side,
    createdAt,
    updatedAt,
    deletedAt,
    workoutSessionId,
    supersetKey,
    orderInSuperset,
    syncStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClientExerciseLogEntity &&
          other.id == this.id &&
          other.clientId == this.clientId &&
          other.exerciseId == this.exerciseId &&
          other.reps == this.reps &&
          other.weight == this.weight &&
          other.isCompleted == this.isCompleted &&
          other.order == this.order &&
          other.tempo == this.tempo &&
          other.notes == this.notes &&
          other.videoUrl == this.videoUrl &&
          other.side == this.side &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.workoutSessionId == this.workoutSessionId &&
          other.supersetKey == this.supersetKey &&
          other.orderInSuperset == this.orderInSuperset &&
          other.syncStatus == this.syncStatus);
}

class ClientExerciseLogsCompanion
    extends UpdateCompanion<ClientExerciseLogEntity> {
  final Value<String> id;
  final Value<String> clientId;
  final Value<String> exerciseId;
  final Value<int?> reps;
  final Value<double?> weight;
  final Value<bool?> isCompleted;
  final Value<int?> order;
  final Value<String?> tempo;
  final Value<String?> notes;
  final Value<String?> videoUrl;
  final Value<String> side;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int?> deletedAt;
  final Value<String> workoutSessionId;
  final Value<String?> supersetKey;
  final Value<int?> orderInSuperset;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const ClientExerciseLogsCompanion({
    this.id = const Value.absent(),
    this.clientId = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.reps = const Value.absent(),
    this.weight = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.order = const Value.absent(),
    this.tempo = const Value.absent(),
    this.notes = const Value.absent(),
    this.videoUrl = const Value.absent(),
    this.side = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.workoutSessionId = const Value.absent(),
    this.supersetKey = const Value.absent(),
    this.orderInSuperset = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ClientExerciseLogsCompanion.insert({
    this.id = const Value.absent(),
    required String clientId,
    required String exerciseId,
    this.reps = const Value.absent(),
    this.weight = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.order = const Value.absent(),
    this.tempo = const Value.absent(),
    this.notes = const Value.absent(),
    this.videoUrl = const Value.absent(),
    this.side = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.deletedAt = const Value.absent(),
    required String workoutSessionId,
    this.supersetKey = const Value.absent(),
    this.orderInSuperset = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : clientId = Value(clientId),
       exerciseId = Value(exerciseId),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       workoutSessionId = Value(workoutSessionId);
  static Insertable<ClientExerciseLogEntity> custom({
    Expression<String>? id,
    Expression<String>? clientId,
    Expression<String>? exerciseId,
    Expression<int>? reps,
    Expression<double>? weight,
    Expression<bool>? isCompleted,
    Expression<int>? order,
    Expression<String>? tempo,
    Expression<String>? notes,
    Expression<String>? videoUrl,
    Expression<String>? side,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? deletedAt,
    Expression<String>? workoutSessionId,
    Expression<String>? supersetKey,
    Expression<int>? orderInSuperset,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (clientId != null) 'client_id': clientId,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (reps != null) 'reps': reps,
      if (weight != null) 'weight': weight,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (order != null) 'order': order,
      if (tempo != null) 'tempo': tempo,
      if (notes != null) 'notes': notes,
      if (videoUrl != null) 'video_url': videoUrl,
      if (side != null) 'side': side,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (workoutSessionId != null) 'workout_session_id': workoutSessionId,
      if (supersetKey != null) 'superset_key': supersetKey,
      if (orderInSuperset != null) 'order_in_superset': orderInSuperset,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ClientExerciseLogsCompanion copyWith({
    Value<String>? id,
    Value<String>? clientId,
    Value<String>? exerciseId,
    Value<int?>? reps,
    Value<double?>? weight,
    Value<bool?>? isCompleted,
    Value<int?>? order,
    Value<String?>? tempo,
    Value<String?>? notes,
    Value<String?>? videoUrl,
    Value<String>? side,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int?>? deletedAt,
    Value<String>? workoutSessionId,
    Value<String?>? supersetKey,
    Value<int?>? orderInSuperset,
    Value<String>? syncStatus,
    Value<int>? rowid,
  }) {
    return ClientExerciseLogsCompanion(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
      exerciseId: exerciseId ?? this.exerciseId,
      reps: reps ?? this.reps,
      weight: weight ?? this.weight,
      isCompleted: isCompleted ?? this.isCompleted,
      order: order ?? this.order,
      tempo: tempo ?? this.tempo,
      notes: notes ?? this.notes,
      videoUrl: videoUrl ?? this.videoUrl,
      side: side ?? this.side,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      workoutSessionId: workoutSessionId ?? this.workoutSessionId,
      supersetKey: supersetKey ?? this.supersetKey,
      orderInSuperset: orderInSuperset ?? this.orderInSuperset,
      syncStatus: syncStatus ?? this.syncStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<String>(clientId.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<String>(exerciseId.value);
    }
    if (reps.present) {
      map['reps'] = Variable<int>(reps.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (tempo.present) {
      map['tempo'] = Variable<String>(tempo.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (videoUrl.present) {
      map['video_url'] = Variable<String>(videoUrl.value);
    }
    if (side.present) {
      map['side'] = Variable<String>(side.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<int>(deletedAt.value);
    }
    if (workoutSessionId.present) {
      map['workout_session_id'] = Variable<String>(workoutSessionId.value);
    }
    if (supersetKey.present) {
      map['superset_key'] = Variable<String>(supersetKey.value);
    }
    if (orderInSuperset.present) {
      map['order_in_superset'] = Variable<int>(orderInSuperset.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClientExerciseLogsCompanion(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('reps: $reps, ')
          ..write('weight: $weight, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('order: $order, ')
          ..write('tempo: $tempo, ')
          ..write('notes: $notes, ')
          ..write('videoUrl: $videoUrl, ')
          ..write('side: $side, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('workoutSessionId: $workoutSessionId, ')
          ..write('supersetKey: $supersetKey, ')
          ..write('orderInSuperset: $orderInSuperset, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ServicesTable extends Services
    with TableInfo<$ServicesTable, ServiceEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ServicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _profileIdMeta = const VerificationMeta(
    'profileId',
  );
  @override
  late final GeneratedColumn<String> profileId = GeneratedColumn<String>(
    'profile_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<String> price = GeneratedColumn<String>(
    'price',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _currencyMeta = const VerificationMeta(
    'currency',
  );
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
    'currency',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationMeta = const VerificationMeta(
    'duration',
  );
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
    'duration',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<int> deletedAt = GeneratedColumn<int>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => 'pending',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    profileId,
    title,
    description,
    price,
    currency,
    duration,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'services';
  @override
  VerificationContext validateIntegrity(
    Insertable<ServiceEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('profile_id')) {
      context.handle(
        _profileIdMeta,
        profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    }
    if (data.containsKey('currency')) {
      context.handle(
        _currencyMeta,
        currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta),
      );
    }
    if (data.containsKey('duration')) {
      context.handle(
        _durationMeta,
        duration.isAcceptableOrUnknown(data['duration']!, _durationMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ServiceEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ServiceEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      profileId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}profile_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}price'],
      ),
      currency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency'],
      ),
      duration: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
    );
  }

  @override
  $ServicesTable createAlias(String alias) {
    return $ServicesTable(attachedDatabase, alias);
  }
}

class ServiceEntity extends DataClass implements Insertable<ServiceEntity> {
  final String id;
  final String profileId;
  final String title;
  final String description;
  final String? price;
  final String? currency;
  final int? duration;
  final int createdAt;
  final int updatedAt;
  final int? deletedAt;
  final String syncStatus;
  const ServiceEntity({
    required this.id,
    required this.profileId,
    required this.title,
    required this.description,
    this.price,
    this.currency,
    this.duration,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['profile_id'] = Variable<String>(profileId);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<String>(price);
    }
    if (!nullToAbsent || currency != null) {
      map['currency'] = Variable<String>(currency);
    }
    if (!nullToAbsent || duration != null) {
      map['duration'] = Variable<int>(duration);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<int>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  ServicesCompanion toCompanion(bool nullToAbsent) {
    return ServicesCompanion(
      id: Value(id),
      profileId: Value(profileId),
      title: Value(title),
      description: Value(description),
      price: price == null && nullToAbsent
          ? const Value.absent()
          : Value(price),
      currency: currency == null && nullToAbsent
          ? const Value.absent()
          : Value(currency),
      duration: duration == null && nullToAbsent
          ? const Value.absent()
          : Value(duration),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory ServiceEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ServiceEntity(
      id: serializer.fromJson<String>(json['id']),
      profileId: serializer.fromJson<String>(json['profileId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      price: serializer.fromJson<String?>(json['price']),
      currency: serializer.fromJson<String?>(json['currency']),
      duration: serializer.fromJson<int?>(json['duration']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      deletedAt: serializer.fromJson<int?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'profileId': serializer.toJson<String>(profileId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'price': serializer.toJson<String?>(price),
      'currency': serializer.toJson<String?>(currency),
      'duration': serializer.toJson<int?>(duration),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'deletedAt': serializer.toJson<int?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  ServiceEntity copyWith({
    String? id,
    String? profileId,
    String? title,
    String? description,
    Value<String?> price = const Value.absent(),
    Value<String?> currency = const Value.absent(),
    Value<int?> duration = const Value.absent(),
    int? createdAt,
    int? updatedAt,
    Value<int?> deletedAt = const Value.absent(),
    String? syncStatus,
  }) => ServiceEntity(
    id: id ?? this.id,
    profileId: profileId ?? this.profileId,
    title: title ?? this.title,
    description: description ?? this.description,
    price: price.present ? price.value : this.price,
    currency: currency.present ? currency.value : this.currency,
    duration: duration.present ? duration.value : this.duration,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  ServiceEntity copyWithCompanion(ServicesCompanion data) {
    return ServiceEntity(
      id: data.id.present ? data.id.value : this.id,
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      price: data.price.present ? data.price.value : this.price,
      currency: data.currency.present ? data.currency.value : this.currency,
      duration: data.duration.present ? data.duration.value : this.duration,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ServiceEntity(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('price: $price, ')
          ..write('currency: $currency, ')
          ..write('duration: $duration, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    profileId,
    title,
    description,
    price,
    currency,
    duration,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ServiceEntity &&
          other.id == this.id &&
          other.profileId == this.profileId &&
          other.title == this.title &&
          other.description == this.description &&
          other.price == this.price &&
          other.currency == this.currency &&
          other.duration == this.duration &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus);
}

class ServicesCompanion extends UpdateCompanion<ServiceEntity> {
  final Value<String> id;
  final Value<String> profileId;
  final Value<String> title;
  final Value<String> description;
  final Value<String?> price;
  final Value<String?> currency;
  final Value<int?> duration;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int?> deletedAt;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const ServicesCompanion({
    this.id = const Value.absent(),
    this.profileId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.price = const Value.absent(),
    this.currency = const Value.absent(),
    this.duration = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ServicesCompanion.insert({
    this.id = const Value.absent(),
    required String profileId,
    required String title,
    required String description,
    this.price = const Value.absent(),
    this.currency = const Value.absent(),
    this.duration = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : profileId = Value(profileId),
       title = Value(title),
       description = Value(description),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ServiceEntity> custom({
    Expression<String>? id,
    Expression<String>? profileId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? price,
    Expression<String>? currency,
    Expression<int>? duration,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? deletedAt,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (profileId != null) 'profile_id': profileId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (price != null) 'price': price,
      if (currency != null) 'currency': currency,
      if (duration != null) 'duration': duration,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ServicesCompanion copyWith({
    Value<String>? id,
    Value<String>? profileId,
    Value<String>? title,
    Value<String>? description,
    Value<String?>? price,
    Value<String?>? currency,
    Value<int?>? duration,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int?>? deletedAt,
    Value<String>? syncStatus,
    Value<int>? rowid,
  }) {
    return ServicesCompanion(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      currency: currency ?? this.currency,
      duration: duration ?? this.duration,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (profileId.present) {
      map['profile_id'] = Variable<String>(profileId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (price.present) {
      map['price'] = Variable<String>(price.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<int>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ServicesCompanion(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('price: $price, ')
          ..write('currency: $currency, ')
          ..write('duration: $duration, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProgramsTable extends Programs
    with TableInfo<$ProgramsTable, ProgramEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProgramsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _trainerIdMeta = const VerificationMeta(
    'trainerId',
  );
  @override
  late final GeneratedColumn<String> trainerId = GeneratedColumn<String>(
    'trainer_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<int> deletedAt = GeneratedColumn<int>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => 'pending',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    trainerId,
    category,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'programs';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProgramEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('trainer_id')) {
      context.handle(
        _trainerIdMeta,
        trainerId.isAcceptableOrUnknown(data['trainer_id']!, _trainerIdMeta),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProgramEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProgramEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      trainerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}trainer_id'],
      ),
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
    );
  }

  @override
  $ProgramsTable createAlias(String alias) {
    return $ProgramsTable(attachedDatabase, alias);
  }
}

class ProgramEntity extends DataClass implements Insertable<ProgramEntity> {
  final String id;
  final String name;
  final String? description;
  final String? trainerId;
  final String? category;
  final int createdAt;
  final int updatedAt;
  final int? deletedAt;
  final String syncStatus;
  const ProgramEntity({
    required this.id,
    required this.name,
    this.description,
    this.trainerId,
    this.category,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || trainerId != null) {
      map['trainer_id'] = Variable<String>(trainerId);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<int>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  ProgramsCompanion toCompanion(bool nullToAbsent) {
    return ProgramsCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      trainerId: trainerId == null && nullToAbsent
          ? const Value.absent()
          : Value(trainerId),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory ProgramEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProgramEntity(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      trainerId: serializer.fromJson<String?>(json['trainerId']),
      category: serializer.fromJson<String?>(json['category']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      deletedAt: serializer.fromJson<int?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'trainerId': serializer.toJson<String?>(trainerId),
      'category': serializer.toJson<String?>(category),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'deletedAt': serializer.toJson<int?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  ProgramEntity copyWith({
    String? id,
    String? name,
    Value<String?> description = const Value.absent(),
    Value<String?> trainerId = const Value.absent(),
    Value<String?> category = const Value.absent(),
    int? createdAt,
    int? updatedAt,
    Value<int?> deletedAt = const Value.absent(),
    String? syncStatus,
  }) => ProgramEntity(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    trainerId: trainerId.present ? trainerId.value : this.trainerId,
    category: category.present ? category.value : this.category,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  ProgramEntity copyWithCompanion(ProgramsCompanion data) {
    return ProgramEntity(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      trainerId: data.trainerId.present ? data.trainerId.value : this.trainerId,
      category: data.category.present ? data.category.value : this.category,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProgramEntity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('trainerId: $trainerId, ')
          ..write('category: $category, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    description,
    trainerId,
    category,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProgramEntity &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.trainerId == this.trainerId &&
          other.category == this.category &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus);
}

class ProgramsCompanion extends UpdateCompanion<ProgramEntity> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> trainerId;
  final Value<String?> category;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int?> deletedAt;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const ProgramsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.trainerId = const Value.absent(),
    this.category = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProgramsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.trainerId = const Value.absent(),
    this.category = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ProgramEntity> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? trainerId,
    Expression<String>? category,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? deletedAt,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (trainerId != null) 'trainer_id': trainerId,
      if (category != null) 'category': category,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProgramsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<String?>? trainerId,
    Value<String?>? category,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int?>? deletedAt,
    Value<String>? syncStatus,
    Value<int>? rowid,
  }) {
    return ProgramsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      trainerId: trainerId ?? this.trainerId,
      category: category ?? this.category,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (trainerId.present) {
      map['trainer_id'] = Variable<String>(trainerId.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<int>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProgramsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('trainerId: $trainerId, ')
          ..write('category: $category, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CalendarEventsTable extends CalendarEvents
    with TableInfo<$CalendarEventsTable, CalendarEventEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CalendarEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _trainerIdMeta = const VerificationMeta(
    'trainerId',
  );
  @override
  late final GeneratedColumn<String> trainerId = GeneratedColumn<String>(
    'trainer_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startTimeMeta = const VerificationMeta(
    'startTime',
  );
  @override
  late final GeneratedColumn<int> startTime = GeneratedColumn<int>(
    'start_time',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endTimeMeta = const VerificationMeta(
    'endTime',
  );
  @override
  late final GeneratedColumn<int> endTime = GeneratedColumn<int>(
    'end_time',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _locationNameMeta = const VerificationMeta(
    'locationName',
  );
  @override
  late final GeneratedColumn<String> locationName = GeneratedColumn<String>(
    'location_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
    'city',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<String> price = GeneratedColumn<String>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currencyMeta = const VerificationMeta(
    'currency',
  );
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
    'currency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => 'PLN',
  );
  static const VerificationMeta _capacityMeta = const VerificationMeta(
    'capacity',
  );
  @override
  late final GeneratedColumn<int> capacity = GeneratedColumn<int>(
    'capacity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    clientDefault: () => 20,
  );
  static const VerificationMeta _enrolledCountMeta = const VerificationMeta(
    'enrolledCount',
  );
  @override
  late final GeneratedColumn<int> enrolledCount = GeneratedColumn<int>(
    'enrolled_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    clientDefault: () => 0,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isPromotedMeta = const VerificationMeta(
    'isPromoted',
  );
  @override
  late final GeneratedColumn<bool> isPromoted = GeneratedColumn<bool>(
    'is_promoted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_promoted" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => 'PENDING',
  );
  static const VerificationMeta _rejectionReasonMeta = const VerificationMeta(
    'rejectionReason',
  );
  @override
  late final GeneratedColumn<String> rejectionReason = GeneratedColumn<String>(
    'rejection_reason',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => 'pending',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    trainerId,
    title,
    description,
    startTime,
    endTime,
    locationName,
    address,
    city,
    latitude,
    longitude,
    price,
    currency,
    capacity,
    enrolledCount,
    category,
    imageUrl,
    isPromoted,
    status,
    rejectionReason,
    createdAt,
    updatedAt,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'calendar_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<CalendarEventEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('trainer_id')) {
      context.handle(
        _trainerIdMeta,
        trainerId.isAcceptableOrUnknown(data['trainer_id']!, _trainerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_trainerIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('start_time')) {
      context.handle(
        _startTimeMeta,
        startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(
        _endTimeMeta,
        endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    if (data.containsKey('location_name')) {
      context.handle(
        _locationNameMeta,
        locationName.isAcceptableOrUnknown(
          data['location_name']!,
          _locationNameMeta,
        ),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('city')) {
      context.handle(
        _cityMeta,
        city.isAcceptableOrUnknown(data['city']!, _cityMeta),
      );
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(
        _currencyMeta,
        currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta),
      );
    }
    if (data.containsKey('capacity')) {
      context.handle(
        _capacityMeta,
        capacity.isAcceptableOrUnknown(data['capacity']!, _capacityMeta),
      );
    }
    if (data.containsKey('enrolled_count')) {
      context.handle(
        _enrolledCountMeta,
        enrolledCount.isAcceptableOrUnknown(
          data['enrolled_count']!,
          _enrolledCountMeta,
        ),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    if (data.containsKey('is_promoted')) {
      context.handle(
        _isPromotedMeta,
        isPromoted.isAcceptableOrUnknown(data['is_promoted']!, _isPromotedMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('rejection_reason')) {
      context.handle(
        _rejectionReasonMeta,
        rejectionReason.isAcceptableOrUnknown(
          data['rejection_reason']!,
          _rejectionReasonMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CalendarEventEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CalendarEventEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      trainerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}trainer_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      startTime: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_time'],
      )!,
      endTime: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}end_time'],
      )!,
      locationName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location_name'],
      ),
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      city: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city'],
      ),
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      ),
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      ),
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}price'],
      )!,
      currency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency'],
      )!,
      capacity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}capacity'],
      )!,
      enrolledCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}enrolled_count'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      ),
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
      isPromoted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_promoted'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      rejectionReason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rejection_reason'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
    );
  }

  @override
  $CalendarEventsTable createAlias(String alias) {
    return $CalendarEventsTable(attachedDatabase, alias);
  }
}

class CalendarEventEntity extends DataClass
    implements Insertable<CalendarEventEntity> {
  final String id;
  final String trainerId;
  final String title;
  final String? description;
  final int startTime;
  final int endTime;
  final String? locationName;
  final String? address;
  final String? city;
  final double? latitude;
  final double? longitude;
  final String price;
  final String currency;
  final int capacity;
  final int enrolledCount;
  final String? category;
  final String? imageUrl;
  final bool isPromoted;
  final String status;
  final String? rejectionReason;
  final int createdAt;
  final int updatedAt;
  final String syncStatus;
  const CalendarEventEntity({
    required this.id,
    required this.trainerId,
    required this.title,
    this.description,
    required this.startTime,
    required this.endTime,
    this.locationName,
    this.address,
    this.city,
    this.latitude,
    this.longitude,
    required this.price,
    required this.currency,
    required this.capacity,
    required this.enrolledCount,
    this.category,
    this.imageUrl,
    required this.isPromoted,
    required this.status,
    this.rejectionReason,
    required this.createdAt,
    required this.updatedAt,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['trainer_id'] = Variable<String>(trainerId);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['start_time'] = Variable<int>(startTime);
    map['end_time'] = Variable<int>(endTime);
    if (!nullToAbsent || locationName != null) {
      map['location_name'] = Variable<String>(locationName);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<double>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<double>(longitude);
    }
    map['price'] = Variable<String>(price);
    map['currency'] = Variable<String>(currency);
    map['capacity'] = Variable<int>(capacity);
    map['enrolled_count'] = Variable<int>(enrolledCount);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    map['is_promoted'] = Variable<bool>(isPromoted);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || rejectionReason != null) {
      map['rejection_reason'] = Variable<String>(rejectionReason);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  CalendarEventsCompanion toCompanion(bool nullToAbsent) {
    return CalendarEventsCompanion(
      id: Value(id),
      trainerId: Value(trainerId),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      startTime: Value(startTime),
      endTime: Value(endTime),
      locationName: locationName == null && nullToAbsent
          ? const Value.absent()
          : Value(locationName),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      price: Value(price),
      currency: Value(currency),
      capacity: Value(capacity),
      enrolledCount: Value(enrolledCount),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      isPromoted: Value(isPromoted),
      status: Value(status),
      rejectionReason: rejectionReason == null && nullToAbsent
          ? const Value.absent()
          : Value(rejectionReason),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory CalendarEventEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CalendarEventEntity(
      id: serializer.fromJson<String>(json['id']),
      trainerId: serializer.fromJson<String>(json['trainerId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      startTime: serializer.fromJson<int>(json['startTime']),
      endTime: serializer.fromJson<int>(json['endTime']),
      locationName: serializer.fromJson<String?>(json['locationName']),
      address: serializer.fromJson<String?>(json['address']),
      city: serializer.fromJson<String?>(json['city']),
      latitude: serializer.fromJson<double?>(json['latitude']),
      longitude: serializer.fromJson<double?>(json['longitude']),
      price: serializer.fromJson<String>(json['price']),
      currency: serializer.fromJson<String>(json['currency']),
      capacity: serializer.fromJson<int>(json['capacity']),
      enrolledCount: serializer.fromJson<int>(json['enrolledCount']),
      category: serializer.fromJson<String?>(json['category']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      isPromoted: serializer.fromJson<bool>(json['isPromoted']),
      status: serializer.fromJson<String>(json['status']),
      rejectionReason: serializer.fromJson<String?>(json['rejectionReason']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'trainerId': serializer.toJson<String>(trainerId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'startTime': serializer.toJson<int>(startTime),
      'endTime': serializer.toJson<int>(endTime),
      'locationName': serializer.toJson<String?>(locationName),
      'address': serializer.toJson<String?>(address),
      'city': serializer.toJson<String?>(city),
      'latitude': serializer.toJson<double?>(latitude),
      'longitude': serializer.toJson<double?>(longitude),
      'price': serializer.toJson<String>(price),
      'currency': serializer.toJson<String>(currency),
      'capacity': serializer.toJson<int>(capacity),
      'enrolledCount': serializer.toJson<int>(enrolledCount),
      'category': serializer.toJson<String?>(category),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'isPromoted': serializer.toJson<bool>(isPromoted),
      'status': serializer.toJson<String>(status),
      'rejectionReason': serializer.toJson<String?>(rejectionReason),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  CalendarEventEntity copyWith({
    String? id,
    String? trainerId,
    String? title,
    Value<String?> description = const Value.absent(),
    int? startTime,
    int? endTime,
    Value<String?> locationName = const Value.absent(),
    Value<String?> address = const Value.absent(),
    Value<String?> city = const Value.absent(),
    Value<double?> latitude = const Value.absent(),
    Value<double?> longitude = const Value.absent(),
    String? price,
    String? currency,
    int? capacity,
    int? enrolledCount,
    Value<String?> category = const Value.absent(),
    Value<String?> imageUrl = const Value.absent(),
    bool? isPromoted,
    String? status,
    Value<String?> rejectionReason = const Value.absent(),
    int? createdAt,
    int? updatedAt,
    String? syncStatus,
  }) => CalendarEventEntity(
    id: id ?? this.id,
    trainerId: trainerId ?? this.trainerId,
    title: title ?? this.title,
    description: description.present ? description.value : this.description,
    startTime: startTime ?? this.startTime,
    endTime: endTime ?? this.endTime,
    locationName: locationName.present ? locationName.value : this.locationName,
    address: address.present ? address.value : this.address,
    city: city.present ? city.value : this.city,
    latitude: latitude.present ? latitude.value : this.latitude,
    longitude: longitude.present ? longitude.value : this.longitude,
    price: price ?? this.price,
    currency: currency ?? this.currency,
    capacity: capacity ?? this.capacity,
    enrolledCount: enrolledCount ?? this.enrolledCount,
    category: category.present ? category.value : this.category,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
    isPromoted: isPromoted ?? this.isPromoted,
    status: status ?? this.status,
    rejectionReason: rejectionReason.present
        ? rejectionReason.value
        : this.rejectionReason,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  CalendarEventEntity copyWithCompanion(CalendarEventsCompanion data) {
    return CalendarEventEntity(
      id: data.id.present ? data.id.value : this.id,
      trainerId: data.trainerId.present ? data.trainerId.value : this.trainerId,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      locationName: data.locationName.present
          ? data.locationName.value
          : this.locationName,
      address: data.address.present ? data.address.value : this.address,
      city: data.city.present ? data.city.value : this.city,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      price: data.price.present ? data.price.value : this.price,
      currency: data.currency.present ? data.currency.value : this.currency,
      capacity: data.capacity.present ? data.capacity.value : this.capacity,
      enrolledCount: data.enrolledCount.present
          ? data.enrolledCount.value
          : this.enrolledCount,
      category: data.category.present ? data.category.value : this.category,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      isPromoted: data.isPromoted.present
          ? data.isPromoted.value
          : this.isPromoted,
      status: data.status.present ? data.status.value : this.status,
      rejectionReason: data.rejectionReason.present
          ? data.rejectionReason.value
          : this.rejectionReason,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CalendarEventEntity(')
          ..write('id: $id, ')
          ..write('trainerId: $trainerId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('locationName: $locationName, ')
          ..write('address: $address, ')
          ..write('city: $city, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('price: $price, ')
          ..write('currency: $currency, ')
          ..write('capacity: $capacity, ')
          ..write('enrolledCount: $enrolledCount, ')
          ..write('category: $category, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('isPromoted: $isPromoted, ')
          ..write('status: $status, ')
          ..write('rejectionReason: $rejectionReason, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    trainerId,
    title,
    description,
    startTime,
    endTime,
    locationName,
    address,
    city,
    latitude,
    longitude,
    price,
    currency,
    capacity,
    enrolledCount,
    category,
    imageUrl,
    isPromoted,
    status,
    rejectionReason,
    createdAt,
    updatedAt,
    syncStatus,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CalendarEventEntity &&
          other.id == this.id &&
          other.trainerId == this.trainerId &&
          other.title == this.title &&
          other.description == this.description &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.locationName == this.locationName &&
          other.address == this.address &&
          other.city == this.city &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.price == this.price &&
          other.currency == this.currency &&
          other.capacity == this.capacity &&
          other.enrolledCount == this.enrolledCount &&
          other.category == this.category &&
          other.imageUrl == this.imageUrl &&
          other.isPromoted == this.isPromoted &&
          other.status == this.status &&
          other.rejectionReason == this.rejectionReason &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.syncStatus == this.syncStatus);
}

class CalendarEventsCompanion extends UpdateCompanion<CalendarEventEntity> {
  final Value<String> id;
  final Value<String> trainerId;
  final Value<String> title;
  final Value<String?> description;
  final Value<int> startTime;
  final Value<int> endTime;
  final Value<String?> locationName;
  final Value<String?> address;
  final Value<String?> city;
  final Value<double?> latitude;
  final Value<double?> longitude;
  final Value<String> price;
  final Value<String> currency;
  final Value<int> capacity;
  final Value<int> enrolledCount;
  final Value<String?> category;
  final Value<String?> imageUrl;
  final Value<bool> isPromoted;
  final Value<String> status;
  final Value<String?> rejectionReason;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const CalendarEventsCompanion({
    this.id = const Value.absent(),
    this.trainerId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.locationName = const Value.absent(),
    this.address = const Value.absent(),
    this.city = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.price = const Value.absent(),
    this.currency = const Value.absent(),
    this.capacity = const Value.absent(),
    this.enrolledCount = const Value.absent(),
    this.category = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.isPromoted = const Value.absent(),
    this.status = const Value.absent(),
    this.rejectionReason = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CalendarEventsCompanion.insert({
    this.id = const Value.absent(),
    required String trainerId,
    required String title,
    this.description = const Value.absent(),
    required int startTime,
    required int endTime,
    this.locationName = const Value.absent(),
    this.address = const Value.absent(),
    this.city = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    required String price,
    this.currency = const Value.absent(),
    this.capacity = const Value.absent(),
    this.enrolledCount = const Value.absent(),
    this.category = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.isPromoted = const Value.absent(),
    this.status = const Value.absent(),
    this.rejectionReason = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : trainerId = Value(trainerId),
       title = Value(title),
       startTime = Value(startTime),
       endTime = Value(endTime),
       price = Value(price),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<CalendarEventEntity> custom({
    Expression<String>? id,
    Expression<String>? trainerId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? startTime,
    Expression<int>? endTime,
    Expression<String>? locationName,
    Expression<String>? address,
    Expression<String>? city,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<String>? price,
    Expression<String>? currency,
    Expression<int>? capacity,
    Expression<int>? enrolledCount,
    Expression<String>? category,
    Expression<String>? imageUrl,
    Expression<bool>? isPromoted,
    Expression<String>? status,
    Expression<String>? rejectionReason,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (trainerId != null) 'trainer_id': trainerId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (locationName != null) 'location_name': locationName,
      if (address != null) 'address': address,
      if (city != null) 'city': city,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (price != null) 'price': price,
      if (currency != null) 'currency': currency,
      if (capacity != null) 'capacity': capacity,
      if (enrolledCount != null) 'enrolled_count': enrolledCount,
      if (category != null) 'category': category,
      if (imageUrl != null) 'image_url': imageUrl,
      if (isPromoted != null) 'is_promoted': isPromoted,
      if (status != null) 'status': status,
      if (rejectionReason != null) 'rejection_reason': rejectionReason,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CalendarEventsCompanion copyWith({
    Value<String>? id,
    Value<String>? trainerId,
    Value<String>? title,
    Value<String?>? description,
    Value<int>? startTime,
    Value<int>? endTime,
    Value<String?>? locationName,
    Value<String?>? address,
    Value<String?>? city,
    Value<double?>? latitude,
    Value<double?>? longitude,
    Value<String>? price,
    Value<String>? currency,
    Value<int>? capacity,
    Value<int>? enrolledCount,
    Value<String?>? category,
    Value<String?>? imageUrl,
    Value<bool>? isPromoted,
    Value<String>? status,
    Value<String?>? rejectionReason,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<String>? syncStatus,
    Value<int>? rowid,
  }) {
    return CalendarEventsCompanion(
      id: id ?? this.id,
      trainerId: trainerId ?? this.trainerId,
      title: title ?? this.title,
      description: description ?? this.description,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      locationName: locationName ?? this.locationName,
      address: address ?? this.address,
      city: city ?? this.city,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      price: price ?? this.price,
      currency: currency ?? this.currency,
      capacity: capacity ?? this.capacity,
      enrolledCount: enrolledCount ?? this.enrolledCount,
      category: category ?? this.category,
      imageUrl: imageUrl ?? this.imageUrl,
      isPromoted: isPromoted ?? this.isPromoted,
      status: status ?? this.status,
      rejectionReason: rejectionReason ?? this.rejectionReason,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (trainerId.present) {
      map['trainer_id'] = Variable<String>(trainerId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<int>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<int>(endTime.value);
    }
    if (locationName.present) {
      map['location_name'] = Variable<String>(locationName.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (price.present) {
      map['price'] = Variable<String>(price.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (capacity.present) {
      map['capacity'] = Variable<int>(capacity.value);
    }
    if (enrolledCount.present) {
      map['enrolled_count'] = Variable<int>(enrolledCount.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (isPromoted.present) {
      map['is_promoted'] = Variable<bool>(isPromoted.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rejectionReason.present) {
      map['rejection_reason'] = Variable<String>(rejectionReason.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CalendarEventsCompanion(')
          ..write('id: $id, ')
          ..write('trainerId: $trainerId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('locationName: $locationName, ')
          ..write('address: $address, ')
          ..write('city: $city, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('price: $price, ')
          ..write('currency: $currency, ')
          ..write('capacity: $capacity, ')
          ..write('enrolledCount: $enrolledCount, ')
          ..write('category: $category, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('isPromoted: $isPromoted, ')
          ..write('status: $status, ')
          ..write('rejectionReason: $rejectionReason, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ClientAssessmentsTable extends ClientAssessments
    with TableInfo<$ClientAssessmentsTable, ClientAssessmentEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClientAssessmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _assessmentIdMeta = const VerificationMeta(
    'assessmentId',
  );
  @override
  late final GeneratedColumn<String> assessmentId = GeneratedColumn<String>(
    'assessment_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _clientIdMeta = const VerificationMeta(
    'clientId',
  );
  @override
  late final GeneratedColumn<String> clientId = GeneratedColumn<String>(
    'client_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<double> value = GeneratedColumn<double>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<int> date = GeneratedColumn<int>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<int> deletedAt = GeneratedColumn<int>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => 'pending',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    assessmentId,
    clientId,
    value,
    date,
    notes,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'client_assessments';
  @override
  VerificationContext validateIntegrity(
    Insertable<ClientAssessmentEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('assessment_id')) {
      context.handle(
        _assessmentIdMeta,
        assessmentId.isAcceptableOrUnknown(
          data['assessment_id']!,
          _assessmentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_assessmentIdMeta);
    }
    if (data.containsKey('client_id')) {
      context.handle(
        _clientIdMeta,
        clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta),
      );
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ClientAssessmentEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClientAssessmentEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      assessmentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}assessment_id'],
      )!,
      clientId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_id'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}value'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}date'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
    );
  }

  @override
  $ClientAssessmentsTable createAlias(String alias) {
    return $ClientAssessmentsTable(attachedDatabase, alias);
  }
}

class ClientAssessmentEntity extends DataClass
    implements Insertable<ClientAssessmentEntity> {
  final String id;
  final String assessmentId;
  final String clientId;
  final double value;
  final int date;
  final String? notes;
  final int createdAt;
  final int updatedAt;
  final int? deletedAt;
  final String syncStatus;
  const ClientAssessmentEntity({
    required this.id,
    required this.assessmentId,
    required this.clientId,
    required this.value,
    required this.date,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['assessment_id'] = Variable<String>(assessmentId);
    map['client_id'] = Variable<String>(clientId);
    map['value'] = Variable<double>(value);
    map['date'] = Variable<int>(date);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<int>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  ClientAssessmentsCompanion toCompanion(bool nullToAbsent) {
    return ClientAssessmentsCompanion(
      id: Value(id),
      assessmentId: Value(assessmentId),
      clientId: Value(clientId),
      value: Value(value),
      date: Value(date),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory ClientAssessmentEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ClientAssessmentEntity(
      id: serializer.fromJson<String>(json['id']),
      assessmentId: serializer.fromJson<String>(json['assessmentId']),
      clientId: serializer.fromJson<String>(json['clientId']),
      value: serializer.fromJson<double>(json['value']),
      date: serializer.fromJson<int>(json['date']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      deletedAt: serializer.fromJson<int?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'assessmentId': serializer.toJson<String>(assessmentId),
      'clientId': serializer.toJson<String>(clientId),
      'value': serializer.toJson<double>(value),
      'date': serializer.toJson<int>(date),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'deletedAt': serializer.toJson<int?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  ClientAssessmentEntity copyWith({
    String? id,
    String? assessmentId,
    String? clientId,
    double? value,
    int? date,
    Value<String?> notes = const Value.absent(),
    int? createdAt,
    int? updatedAt,
    Value<int?> deletedAt = const Value.absent(),
    String? syncStatus,
  }) => ClientAssessmentEntity(
    id: id ?? this.id,
    assessmentId: assessmentId ?? this.assessmentId,
    clientId: clientId ?? this.clientId,
    value: value ?? this.value,
    date: date ?? this.date,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  ClientAssessmentEntity copyWithCompanion(ClientAssessmentsCompanion data) {
    return ClientAssessmentEntity(
      id: data.id.present ? data.id.value : this.id,
      assessmentId: data.assessmentId.present
          ? data.assessmentId.value
          : this.assessmentId,
      clientId: data.clientId.present ? data.clientId.value : this.clientId,
      value: data.value.present ? data.value.value : this.value,
      date: data.date.present ? data.date.value : this.date,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ClientAssessmentEntity(')
          ..write('id: $id, ')
          ..write('assessmentId: $assessmentId, ')
          ..write('clientId: $clientId, ')
          ..write('value: $value, ')
          ..write('date: $date, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    assessmentId,
    clientId,
    value,
    date,
    notes,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClientAssessmentEntity &&
          other.id == this.id &&
          other.assessmentId == this.assessmentId &&
          other.clientId == this.clientId &&
          other.value == this.value &&
          other.date == this.date &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus);
}

class ClientAssessmentsCompanion
    extends UpdateCompanion<ClientAssessmentEntity> {
  final Value<String> id;
  final Value<String> assessmentId;
  final Value<String> clientId;
  final Value<double> value;
  final Value<int> date;
  final Value<String?> notes;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int?> deletedAt;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const ClientAssessmentsCompanion({
    this.id = const Value.absent(),
    this.assessmentId = const Value.absent(),
    this.clientId = const Value.absent(),
    this.value = const Value.absent(),
    this.date = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ClientAssessmentsCompanion.insert({
    this.id = const Value.absent(),
    required String assessmentId,
    required String clientId,
    required double value,
    required int date,
    this.notes = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : assessmentId = Value(assessmentId),
       clientId = Value(clientId),
       value = Value(value),
       date = Value(date),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ClientAssessmentEntity> custom({
    Expression<String>? id,
    Expression<String>? assessmentId,
    Expression<String>? clientId,
    Expression<double>? value,
    Expression<int>? date,
    Expression<String>? notes,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? deletedAt,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (assessmentId != null) 'assessment_id': assessmentId,
      if (clientId != null) 'client_id': clientId,
      if (value != null) 'value': value,
      if (date != null) 'date': date,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ClientAssessmentsCompanion copyWith({
    Value<String>? id,
    Value<String>? assessmentId,
    Value<String>? clientId,
    Value<double>? value,
    Value<int>? date,
    Value<String?>? notes,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int?>? deletedAt,
    Value<String>? syncStatus,
    Value<int>? rowid,
  }) {
    return ClientAssessmentsCompanion(
      id: id ?? this.id,
      assessmentId: assessmentId ?? this.assessmentId,
      clientId: clientId ?? this.clientId,
      value: value ?? this.value,
      date: date ?? this.date,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (assessmentId.present) {
      map['assessment_id'] = Variable<String>(assessmentId.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<String>(clientId.value);
    }
    if (value.present) {
      map['value'] = Variable<double>(value.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<int>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClientAssessmentsCompanion(')
          ..write('id: $id, ')
          ..write('assessmentId: $assessmentId, ')
          ..write('clientId: $clientId, ')
          ..write('value: $value, ')
          ..write('date: $date, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TrainerProfilesTableTable extends TrainerProfilesTable
    with TableInfo<$TrainerProfilesTableTable, TrainerProfile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrainerProfilesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 64,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _trainerIdMeta = const VerificationMeta(
    'trainerId',
  );
  @override
  late final GeneratedColumn<String> trainerId = GeneratedColumn<String>(
    'trainer_id',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 64,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bioMeta = const VerificationMeta('bio');
  @override
  late final GeneratedColumn<String> bio = GeneratedColumn<String>(
    'bio',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _profilePhotoPathMeta = const VerificationMeta(
    'profilePhotoPath',
  );
  @override
  late final GeneratedColumn<String> profilePhotoPath = GeneratedColumn<String>(
    'profile_photo_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _averageRatingMeta = const VerificationMeta(
    'averageRating',
  );
  @override
  late final GeneratedColumn<double> averageRating = GeneratedColumn<double>(
    'average_rating',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _businessCurrencyMeta = const VerificationMeta(
    'businessCurrency',
  );
  @override
  late final GeneratedColumn<String> businessCurrency = GeneratedColumn<String>(
    'business_currency',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('synced'),
  );
  static const VerificationMeta _syncModifiedAtMeta = const VerificationMeta(
    'syncModifiedAt',
  );
  @override
  late final GeneratedColumn<int> syncModifiedAt = GeneratedColumn<int>(
    'sync_modified_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<int> deletedAt = GeneratedColumn<int>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    trainerId,
    name,
    bio,
    profilePhotoPath,
    location,
    latitude,
    longitude,
    averageRating,
    businessCurrency,
    createdAt,
    updatedAt,
    syncStatus,
    syncModifiedAt,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trainer_profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<TrainerProfile> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('trainer_id')) {
      context.handle(
        _trainerIdMeta,
        trainerId.isAcceptableOrUnknown(data['trainer_id']!, _trainerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_trainerIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('bio')) {
      context.handle(
        _bioMeta,
        bio.isAcceptableOrUnknown(data['bio']!, _bioMeta),
      );
    }
    if (data.containsKey('profile_photo_path')) {
      context.handle(
        _profilePhotoPathMeta,
        profilePhotoPath.isAcceptableOrUnknown(
          data['profile_photo_path']!,
          _profilePhotoPathMeta,
        ),
      );
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    }
    if (data.containsKey('average_rating')) {
      context.handle(
        _averageRatingMeta,
        averageRating.isAcceptableOrUnknown(
          data['average_rating']!,
          _averageRatingMeta,
        ),
      );
    }
    if (data.containsKey('business_currency')) {
      context.handle(
        _businessCurrencyMeta,
        businessCurrency.isAcceptableOrUnknown(
          data['business_currency']!,
          _businessCurrencyMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('sync_modified_at')) {
      context.handle(
        _syncModifiedAtMeta,
        syncModifiedAt.isAcceptableOrUnknown(
          data['sync_modified_at']!,
          _syncModifiedAtMeta,
        ),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TrainerProfile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrainerProfile(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      trainerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}trainer_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      bio: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bio'],
      ),
      profilePhotoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}profile_photo_path'],
      ),
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      ),
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      ),
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      ),
      averageRating: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}average_rating'],
      ),
      businessCurrency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}business_currency'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      syncModifiedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sync_modified_at'],
      ),
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $TrainerProfilesTableTable createAlias(String alias) {
    return $TrainerProfilesTableTable(attachedDatabase, alias);
  }
}

class TrainerProfile extends DataClass implements Insertable<TrainerProfile> {
  final String id;
  final String trainerId;
  final String? name;
  final String? bio;
  final String? profilePhotoPath;
  final String? location;
  final double? latitude;
  final double? longitude;
  final double? averageRating;
  final String? businessCurrency;
  final int createdAt;
  final int updatedAt;
  final String syncStatus;
  final int? syncModifiedAt;
  final int? deletedAt;
  const TrainerProfile({
    required this.id,
    required this.trainerId,
    this.name,
    this.bio,
    this.profilePhotoPath,
    this.location,
    this.latitude,
    this.longitude,
    this.averageRating,
    this.businessCurrency,
    required this.createdAt,
    required this.updatedAt,
    required this.syncStatus,
    this.syncModifiedAt,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['trainer_id'] = Variable<String>(trainerId);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || bio != null) {
      map['bio'] = Variable<String>(bio);
    }
    if (!nullToAbsent || profilePhotoPath != null) {
      map['profile_photo_path'] = Variable<String>(profilePhotoPath);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<double>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<double>(longitude);
    }
    if (!nullToAbsent || averageRating != null) {
      map['average_rating'] = Variable<double>(averageRating);
    }
    if (!nullToAbsent || businessCurrency != null) {
      map['business_currency'] = Variable<String>(businessCurrency);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || syncModifiedAt != null) {
      map['sync_modified_at'] = Variable<int>(syncModifiedAt);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<int>(deletedAt);
    }
    return map;
  }

  TrainerProfilesTableCompanion toCompanion(bool nullToAbsent) {
    return TrainerProfilesTableCompanion(
      id: Value(id),
      trainerId: Value(trainerId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      bio: bio == null && nullToAbsent ? const Value.absent() : Value(bio),
      profilePhotoPath: profilePhotoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(profilePhotoPath),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      averageRating: averageRating == null && nullToAbsent
          ? const Value.absent()
          : Value(averageRating),
      businessCurrency: businessCurrency == null && nullToAbsent
          ? const Value.absent()
          : Value(businessCurrency),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      syncStatus: Value(syncStatus),
      syncModifiedAt: syncModifiedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(syncModifiedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory TrainerProfile.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrainerProfile(
      id: serializer.fromJson<String>(json['id']),
      trainerId: serializer.fromJson<String>(json['trainerId']),
      name: serializer.fromJson<String?>(json['name']),
      bio: serializer.fromJson<String?>(json['bio']),
      profilePhotoPath: serializer.fromJson<String?>(json['profilePhotoPath']),
      location: serializer.fromJson<String?>(json['location']),
      latitude: serializer.fromJson<double?>(json['latitude']),
      longitude: serializer.fromJson<double?>(json['longitude']),
      averageRating: serializer.fromJson<double?>(json['averageRating']),
      businessCurrency: serializer.fromJson<String?>(json['businessCurrency']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      syncModifiedAt: serializer.fromJson<int?>(json['syncModifiedAt']),
      deletedAt: serializer.fromJson<int?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'trainerId': serializer.toJson<String>(trainerId),
      'name': serializer.toJson<String?>(name),
      'bio': serializer.toJson<String?>(bio),
      'profilePhotoPath': serializer.toJson<String?>(profilePhotoPath),
      'location': serializer.toJson<String?>(location),
      'latitude': serializer.toJson<double?>(latitude),
      'longitude': serializer.toJson<double?>(longitude),
      'averageRating': serializer.toJson<double?>(averageRating),
      'businessCurrency': serializer.toJson<String?>(businessCurrency),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'syncModifiedAt': serializer.toJson<int?>(syncModifiedAt),
      'deletedAt': serializer.toJson<int?>(deletedAt),
    };
  }

  TrainerProfile copyWith({
    String? id,
    String? trainerId,
    Value<String?> name = const Value.absent(),
    Value<String?> bio = const Value.absent(),
    Value<String?> profilePhotoPath = const Value.absent(),
    Value<String?> location = const Value.absent(),
    Value<double?> latitude = const Value.absent(),
    Value<double?> longitude = const Value.absent(),
    Value<double?> averageRating = const Value.absent(),
    Value<String?> businessCurrency = const Value.absent(),
    int? createdAt,
    int? updatedAt,
    String? syncStatus,
    Value<int?> syncModifiedAt = const Value.absent(),
    Value<int?> deletedAt = const Value.absent(),
  }) => TrainerProfile(
    id: id ?? this.id,
    trainerId: trainerId ?? this.trainerId,
    name: name.present ? name.value : this.name,
    bio: bio.present ? bio.value : this.bio,
    profilePhotoPath: profilePhotoPath.present
        ? profilePhotoPath.value
        : this.profilePhotoPath,
    location: location.present ? location.value : this.location,
    latitude: latitude.present ? latitude.value : this.latitude,
    longitude: longitude.present ? longitude.value : this.longitude,
    averageRating: averageRating.present
        ? averageRating.value
        : this.averageRating,
    businessCurrency: businessCurrency.present
        ? businessCurrency.value
        : this.businessCurrency,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    syncModifiedAt: syncModifiedAt.present
        ? syncModifiedAt.value
        : this.syncModifiedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  TrainerProfile copyWithCompanion(TrainerProfilesTableCompanion data) {
    return TrainerProfile(
      id: data.id.present ? data.id.value : this.id,
      trainerId: data.trainerId.present ? data.trainerId.value : this.trainerId,
      name: data.name.present ? data.name.value : this.name,
      bio: data.bio.present ? data.bio.value : this.bio,
      profilePhotoPath: data.profilePhotoPath.present
          ? data.profilePhotoPath.value
          : this.profilePhotoPath,
      location: data.location.present ? data.location.value : this.location,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      averageRating: data.averageRating.present
          ? data.averageRating.value
          : this.averageRating,
      businessCurrency: data.businessCurrency.present
          ? data.businessCurrency.value
          : this.businessCurrency,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      syncModifiedAt: data.syncModifiedAt.present
          ? data.syncModifiedAt.value
          : this.syncModifiedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TrainerProfile(')
          ..write('id: $id, ')
          ..write('trainerId: $trainerId, ')
          ..write('name: $name, ')
          ..write('bio: $bio, ')
          ..write('profilePhotoPath: $profilePhotoPath, ')
          ..write('location: $location, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('averageRating: $averageRating, ')
          ..write('businessCurrency: $businessCurrency, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('syncModifiedAt: $syncModifiedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    trainerId,
    name,
    bio,
    profilePhotoPath,
    location,
    latitude,
    longitude,
    averageRating,
    businessCurrency,
    createdAt,
    updatedAt,
    syncStatus,
    syncModifiedAt,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrainerProfile &&
          other.id == this.id &&
          other.trainerId == this.trainerId &&
          other.name == this.name &&
          other.bio == this.bio &&
          other.profilePhotoPath == this.profilePhotoPath &&
          other.location == this.location &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.averageRating == this.averageRating &&
          other.businessCurrency == this.businessCurrency &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.syncStatus == this.syncStatus &&
          other.syncModifiedAt == this.syncModifiedAt &&
          other.deletedAt == this.deletedAt);
}

class TrainerProfilesTableCompanion extends UpdateCompanion<TrainerProfile> {
  final Value<String> id;
  final Value<String> trainerId;
  final Value<String?> name;
  final Value<String?> bio;
  final Value<String?> profilePhotoPath;
  final Value<String?> location;
  final Value<double?> latitude;
  final Value<double?> longitude;
  final Value<double?> averageRating;
  final Value<String?> businessCurrency;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<String> syncStatus;
  final Value<int?> syncModifiedAt;
  final Value<int?> deletedAt;
  final Value<int> rowid;
  const TrainerProfilesTableCompanion({
    this.id = const Value.absent(),
    this.trainerId = const Value.absent(),
    this.name = const Value.absent(),
    this.bio = const Value.absent(),
    this.profilePhotoPath = const Value.absent(),
    this.location = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.averageRating = const Value.absent(),
    this.businessCurrency = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.syncModifiedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TrainerProfilesTableCompanion.insert({
    required String id,
    required String trainerId,
    this.name = const Value.absent(),
    this.bio = const Value.absent(),
    this.profilePhotoPath = const Value.absent(),
    this.location = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.averageRating = const Value.absent(),
    this.businessCurrency = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.syncStatus = const Value.absent(),
    this.syncModifiedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       trainerId = Value(trainerId),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<TrainerProfile> custom({
    Expression<String>? id,
    Expression<String>? trainerId,
    Expression<String>? name,
    Expression<String>? bio,
    Expression<String>? profilePhotoPath,
    Expression<String>? location,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<double>? averageRating,
    Expression<String>? businessCurrency,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<String>? syncStatus,
    Expression<int>? syncModifiedAt,
    Expression<int>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (trainerId != null) 'trainer_id': trainerId,
      if (name != null) 'name': name,
      if (bio != null) 'bio': bio,
      if (profilePhotoPath != null) 'profile_photo_path': profilePhotoPath,
      if (location != null) 'location': location,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (averageRating != null) 'average_rating': averageRating,
      if (businessCurrency != null) 'business_currency': businessCurrency,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (syncModifiedAt != null) 'sync_modified_at': syncModifiedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TrainerProfilesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? trainerId,
    Value<String?>? name,
    Value<String?>? bio,
    Value<String?>? profilePhotoPath,
    Value<String?>? location,
    Value<double?>? latitude,
    Value<double?>? longitude,
    Value<double?>? averageRating,
    Value<String?>? businessCurrency,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<String>? syncStatus,
    Value<int?>? syncModifiedAt,
    Value<int?>? deletedAt,
    Value<int>? rowid,
  }) {
    return TrainerProfilesTableCompanion(
      id: id ?? this.id,
      trainerId: trainerId ?? this.trainerId,
      name: name ?? this.name,
      bio: bio ?? this.bio,
      profilePhotoPath: profilePhotoPath ?? this.profilePhotoPath,
      location: location ?? this.location,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      averageRating: averageRating ?? this.averageRating,
      businessCurrency: businessCurrency ?? this.businessCurrency,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      syncModifiedAt: syncModifiedAt ?? this.syncModifiedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (trainerId.present) {
      map['trainer_id'] = Variable<String>(trainerId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (bio.present) {
      map['bio'] = Variable<String>(bio.value);
    }
    if (profilePhotoPath.present) {
      map['profile_photo_path'] = Variable<String>(profilePhotoPath.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (averageRating.present) {
      map['average_rating'] = Variable<double>(averageRating.value);
    }
    if (businessCurrency.present) {
      map['business_currency'] = Variable<String>(businessCurrency.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (syncModifiedAt.present) {
      map['sync_modified_at'] = Variable<int>(syncModifiedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<int>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrainerProfilesTableCompanion(')
          ..write('id: $id, ')
          ..write('trainerId: $trainerId, ')
          ..write('name: $name, ')
          ..write('bio: $bio, ')
          ..write('profilePhotoPath: $profilePhotoPath, ')
          ..write('location: $location, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('averageRating: $averageRating, ')
          ..write('businessCurrency: $businessCurrency, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('syncModifiedAt: $syncModifiedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AnalyticsCacheTable analyticsCache = $AnalyticsCacheTable(this);
  late final $SyncMetadataTable syncMetadata = $SyncMetadataTable(this);
  late final $ClientsTableTable clientsTable = $ClientsTableTable(this);
  late final $ProfilesTableTable profilesTable = $ProfilesTableTable(this);
  late final $WorkoutSessionsTableTable workoutSessionsTable =
      $WorkoutSessionsTableTable(this);
  late final $ExercisesTableTable exercisesTable = $ExercisesTableTable(this);
  late final $WorkoutTemplatesTable workoutTemplates = $WorkoutTemplatesTable(
    this,
  );
  late final $ClientMeasurementsTable clientMeasurements =
      $ClientMeasurementsTable(this);
  late final $ClientPhotosTable clientPhotos = $ClientPhotosTable(this);
  late final $NotificationsTable notifications = $NotificationsTable(this);
  late final $BookingTableTable bookingTable = $BookingTableTable(this);
  late final $PackageTableTable packageTable = $PackageTableTable(this);
  late final $TestimonialTableTable testimonialTable = $TestimonialTableTable(
    this,
  );
  late final $ClientExerciseLogsTable clientExerciseLogs =
      $ClientExerciseLogsTable(this);
  late final $ServicesTable services = $ServicesTable(this);
  late final $ProgramsTable programs = $ProgramsTable(this);
  late final $CalendarEventsTable calendarEvents = $CalendarEventsTable(this);
  late final $ClientAssessmentsTable clientAssessments =
      $ClientAssessmentsTable(this);
  late final $TrainerProfilesTableTable trainerProfilesTable =
      $TrainerProfilesTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    analyticsCache,
    syncMetadata,
    clientsTable,
    profilesTable,
    workoutSessionsTable,
    exercisesTable,
    workoutTemplates,
    clientMeasurements,
    clientPhotos,
    notifications,
    bookingTable,
    packageTable,
    testimonialTable,
    clientExerciseLogs,
    services,
    programs,
    calendarEvents,
    clientAssessments,
    trainerProfilesTable,
  ];
}

typedef $$AnalyticsCacheTableCreateCompanionBuilder =
    AnalyticsCacheCompanion Function({
      required String key,
      required String value,
      required int updatedAt,
      Value<int> rowid,
    });
typedef $$AnalyticsCacheTableUpdateCompanionBuilder =
    AnalyticsCacheCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<int> updatedAt,
      Value<int> rowid,
    });

class $$AnalyticsCacheTableFilterComposer
    extends Composer<_$AppDatabase, $AnalyticsCacheTable> {
  $$AnalyticsCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AnalyticsCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $AnalyticsCacheTable> {
  $$AnalyticsCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AnalyticsCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $AnalyticsCacheTable> {
  $$AnalyticsCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$AnalyticsCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AnalyticsCacheTable,
          AnalyticsCacheData,
          $$AnalyticsCacheTableFilterComposer,
          $$AnalyticsCacheTableOrderingComposer,
          $$AnalyticsCacheTableAnnotationComposer,
          $$AnalyticsCacheTableCreateCompanionBuilder,
          $$AnalyticsCacheTableUpdateCompanionBuilder,
          (
            AnalyticsCacheData,
            BaseReferences<
              _$AppDatabase,
              $AnalyticsCacheTable,
              AnalyticsCacheData
            >,
          ),
          AnalyticsCacheData,
          PrefetchHooks Function()
        > {
  $$AnalyticsCacheTableTableManager(
    _$AppDatabase db,
    $AnalyticsCacheTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AnalyticsCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AnalyticsCacheTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AnalyticsCacheTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AnalyticsCacheCompanion(
                key: key,
                value: value,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => AnalyticsCacheCompanion.insert(
                key: key,
                value: value,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AnalyticsCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AnalyticsCacheTable,
      AnalyticsCacheData,
      $$AnalyticsCacheTableFilterComposer,
      $$AnalyticsCacheTableOrderingComposer,
      $$AnalyticsCacheTableAnnotationComposer,
      $$AnalyticsCacheTableCreateCompanionBuilder,
      $$AnalyticsCacheTableUpdateCompanionBuilder,
      (
        AnalyticsCacheData,
        BaseReferences<_$AppDatabase, $AnalyticsCacheTable, AnalyticsCacheData>,
      ),
      AnalyticsCacheData,
      PrefetchHooks Function()
    >;
typedef $$SyncMetadataTableCreateCompanionBuilder =
    SyncMetadataCompanion Function({
      required String key,
      required String value,
      Value<int> rowid,
    });
typedef $$SyncMetadataTableUpdateCompanionBuilder =
    SyncMetadataCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<int> rowid,
    });

class $$SyncMetadataTableFilterComposer
    extends Composer<_$AppDatabase, $SyncMetadataTable> {
  $$SyncMetadataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncMetadataTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncMetadataTable> {
  $$SyncMetadataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncMetadataTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncMetadataTable> {
  $$SyncMetadataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$SyncMetadataTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncMetadataTable,
          SyncMetadataData,
          $$SyncMetadataTableFilterComposer,
          $$SyncMetadataTableOrderingComposer,
          $$SyncMetadataTableAnnotationComposer,
          $$SyncMetadataTableCreateCompanionBuilder,
          $$SyncMetadataTableUpdateCompanionBuilder,
          (
            SyncMetadataData,
            BaseReferences<_$AppDatabase, $SyncMetadataTable, SyncMetadataData>,
          ),
          SyncMetadataData,
          PrefetchHooks Function()
        > {
  $$SyncMetadataTableTableManager(_$AppDatabase db, $SyncMetadataTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncMetadataTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncMetadataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncMetadataTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncMetadataCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                Value<int> rowid = const Value.absent(),
              }) => SyncMetadataCompanion.insert(
                key: key,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncMetadataTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncMetadataTable,
      SyncMetadataData,
      $$SyncMetadataTableFilterComposer,
      $$SyncMetadataTableOrderingComposer,
      $$SyncMetadataTableAnnotationComposer,
      $$SyncMetadataTableCreateCompanionBuilder,
      $$SyncMetadataTableUpdateCompanionBuilder,
      (
        SyncMetadataData,
        BaseReferences<_$AppDatabase, $SyncMetadataTable, SyncMetadataData>,
      ),
      SyncMetadataData,
      PrefetchHooks Function()
    >;
typedef $$ClientsTableTableCreateCompanionBuilder =
    ClientsTableCompanion Function({
      Value<String> id,
      Value<String?> trainerId,
      Value<String?> userId,
      required String name,
      Value<String?> email,
      Value<String?> phone,
      Value<String?> avatarPath,
      Value<String> status,
      Value<DateTime?> dateOfBirth,
      Value<String?> goals,
      Value<String?> healthNotes,
      Value<String?> emergencyContactName,
      Value<String?> emergencyContactPhone,
      Value<int?> checkInDay,
      Value<int?> checkInHour,
      Value<DateTime?> dataSharingExpiresAt,
      Value<String?> sharingSettings,
      Value<String?> widgetConfig,
      required int createdAt,
      required int updatedAt,
      Value<int?> deletedAt,
      Value<String> syncStatus,
      Value<int> rowid,
    });
typedef $$ClientsTableTableUpdateCompanionBuilder =
    ClientsTableCompanion Function({
      Value<String> id,
      Value<String?> trainerId,
      Value<String?> userId,
      Value<String> name,
      Value<String?> email,
      Value<String?> phone,
      Value<String?> avatarPath,
      Value<String> status,
      Value<DateTime?> dateOfBirth,
      Value<String?> goals,
      Value<String?> healthNotes,
      Value<String?> emergencyContactName,
      Value<String?> emergencyContactPhone,
      Value<int?> checkInDay,
      Value<int?> checkInHour,
      Value<DateTime?> dataSharingExpiresAt,
      Value<String?> sharingSettings,
      Value<String?> widgetConfig,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int?> deletedAt,
      Value<String> syncStatus,
      Value<int> rowid,
    });

class $$ClientsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ClientsTableTable> {
  $$ClientsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get trainerId => $composableBuilder(
    column: $table.trainerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get avatarPath => $composableBuilder(
    column: $table.avatarPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get goals => $composableBuilder(
    column: $table.goals,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get healthNotes => $composableBuilder(
    column: $table.healthNotes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emergencyContactName => $composableBuilder(
    column: $table.emergencyContactName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emergencyContactPhone => $composableBuilder(
    column: $table.emergencyContactPhone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get checkInDay => $composableBuilder(
    column: $table.checkInDay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get checkInHour => $composableBuilder(
    column: $table.checkInHour,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dataSharingExpiresAt => $composableBuilder(
    column: $table.dataSharingExpiresAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sharingSettings => $composableBuilder(
    column: $table.sharingSettings,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get widgetConfig => $composableBuilder(
    column: $table.widgetConfig,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ClientsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ClientsTableTable> {
  $$ClientsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get trainerId => $composableBuilder(
    column: $table.trainerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get avatarPath => $composableBuilder(
    column: $table.avatarPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get goals => $composableBuilder(
    column: $table.goals,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get healthNotes => $composableBuilder(
    column: $table.healthNotes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emergencyContactName => $composableBuilder(
    column: $table.emergencyContactName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emergencyContactPhone => $composableBuilder(
    column: $table.emergencyContactPhone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get checkInDay => $composableBuilder(
    column: $table.checkInDay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get checkInHour => $composableBuilder(
    column: $table.checkInHour,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dataSharingExpiresAt => $composableBuilder(
    column: $table.dataSharingExpiresAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sharingSettings => $composableBuilder(
    column: $table.sharingSettings,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get widgetConfig => $composableBuilder(
    column: $table.widgetConfig,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ClientsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ClientsTableTable> {
  $$ClientsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get trainerId =>
      $composableBuilder(column: $table.trainerId, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get avatarPath => $composableBuilder(
    column: $table.avatarPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => column,
  );

  GeneratedColumn<String> get goals =>
      $composableBuilder(column: $table.goals, builder: (column) => column);

  GeneratedColumn<String> get healthNotes => $composableBuilder(
    column: $table.healthNotes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get emergencyContactName => $composableBuilder(
    column: $table.emergencyContactName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get emergencyContactPhone => $composableBuilder(
    column: $table.emergencyContactPhone,
    builder: (column) => column,
  );

  GeneratedColumn<int> get checkInDay => $composableBuilder(
    column: $table.checkInDay,
    builder: (column) => column,
  );

  GeneratedColumn<int> get checkInHour => $composableBuilder(
    column: $table.checkInHour,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dataSharingExpiresAt => $composableBuilder(
    column: $table.dataSharingExpiresAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sharingSettings => $composableBuilder(
    column: $table.sharingSettings,
    builder: (column) => column,
  );

  GeneratedColumn<String> get widgetConfig => $composableBuilder(
    column: $table.widgetConfig,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );
}

class $$ClientsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ClientsTableTable,
          ClientEntity,
          $$ClientsTableTableFilterComposer,
          $$ClientsTableTableOrderingComposer,
          $$ClientsTableTableAnnotationComposer,
          $$ClientsTableTableCreateCompanionBuilder,
          $$ClientsTableTableUpdateCompanionBuilder,
          (
            ClientEntity,
            BaseReferences<_$AppDatabase, $ClientsTableTable, ClientEntity>,
          ),
          ClientEntity,
          PrefetchHooks Function()
        > {
  $$ClientsTableTableTableManager(_$AppDatabase db, $ClientsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClientsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClientsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClientsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> trainerId = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> avatarPath = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime?> dateOfBirth = const Value.absent(),
                Value<String?> goals = const Value.absent(),
                Value<String?> healthNotes = const Value.absent(),
                Value<String?> emergencyContactName = const Value.absent(),
                Value<String?> emergencyContactPhone = const Value.absent(),
                Value<int?> checkInDay = const Value.absent(),
                Value<int?> checkInHour = const Value.absent(),
                Value<DateTime?> dataSharingExpiresAt = const Value.absent(),
                Value<String?> sharingSettings = const Value.absent(),
                Value<String?> widgetConfig = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ClientsTableCompanion(
                id: id,
                trainerId: trainerId,
                userId: userId,
                name: name,
                email: email,
                phone: phone,
                avatarPath: avatarPath,
                status: status,
                dateOfBirth: dateOfBirth,
                goals: goals,
                healthNotes: healthNotes,
                emergencyContactName: emergencyContactName,
                emergencyContactPhone: emergencyContactPhone,
                checkInDay: checkInDay,
                checkInHour: checkInHour,
                dataSharingExpiresAt: dataSharingExpiresAt,
                sharingSettings: sharingSettings,
                widgetConfig: widgetConfig,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> trainerId = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                required String name,
                Value<String?> email = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> avatarPath = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime?> dateOfBirth = const Value.absent(),
                Value<String?> goals = const Value.absent(),
                Value<String?> healthNotes = const Value.absent(),
                Value<String?> emergencyContactName = const Value.absent(),
                Value<String?> emergencyContactPhone = const Value.absent(),
                Value<int?> checkInDay = const Value.absent(),
                Value<int?> checkInHour = const Value.absent(),
                Value<DateTime?> dataSharingExpiresAt = const Value.absent(),
                Value<String?> sharingSettings = const Value.absent(),
                Value<String?> widgetConfig = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ClientsTableCompanion.insert(
                id: id,
                trainerId: trainerId,
                userId: userId,
                name: name,
                email: email,
                phone: phone,
                avatarPath: avatarPath,
                status: status,
                dateOfBirth: dateOfBirth,
                goals: goals,
                healthNotes: healthNotes,
                emergencyContactName: emergencyContactName,
                emergencyContactPhone: emergencyContactPhone,
                checkInDay: checkInDay,
                checkInHour: checkInHour,
                dataSharingExpiresAt: dataSharingExpiresAt,
                sharingSettings: sharingSettings,
                widgetConfig: widgetConfig,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ClientsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ClientsTableTable,
      ClientEntity,
      $$ClientsTableTableFilterComposer,
      $$ClientsTableTableOrderingComposer,
      $$ClientsTableTableAnnotationComposer,
      $$ClientsTableTableCreateCompanionBuilder,
      $$ClientsTableTableUpdateCompanionBuilder,
      (
        ClientEntity,
        BaseReferences<_$AppDatabase, $ClientsTableTable, ClientEntity>,
      ),
      ClientEntity,
      PrefetchHooks Function()
    >;
typedef $$ProfilesTableTableCreateCompanionBuilder =
    ProfilesTableCompanion Function({
      Value<String> id,
      required String userId,
      Value<String?> certifications,
      Value<String?> phone,
      Value<String?> aboutMe,
      Value<String?> philosophy,
      Value<String?> methodology,
      Value<String?> branding,
      Value<String?> bannerImagePath,
      Value<String?> customDomain,
      Value<bool> domainVerified,
      Value<String?> profilePhotoPath,
      Value<String> specialties,
      Value<String> trainingTypes,
      Value<String> businessCurrency,
      Value<double?> averageRating,
      Value<int> completionPercentage,
      Value<String?> missingFields,
      Value<bool> isVerified,
      Value<String?> availability,
      Value<double?> minServicePrice,
      required int createdAt,
      required int updatedAt,
      Value<int?> deletedAt,
      Value<String> syncStatus,
      Value<int> rowid,
    });
typedef $$ProfilesTableTableUpdateCompanionBuilder =
    ProfilesTableCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String?> certifications,
      Value<String?> phone,
      Value<String?> aboutMe,
      Value<String?> philosophy,
      Value<String?> methodology,
      Value<String?> branding,
      Value<String?> bannerImagePath,
      Value<String?> customDomain,
      Value<bool> domainVerified,
      Value<String?> profilePhotoPath,
      Value<String> specialties,
      Value<String> trainingTypes,
      Value<String> businessCurrency,
      Value<double?> averageRating,
      Value<int> completionPercentage,
      Value<String?> missingFields,
      Value<bool> isVerified,
      Value<String?> availability,
      Value<double?> minServicePrice,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int?> deletedAt,
      Value<String> syncStatus,
      Value<int> rowid,
    });

class $$ProfilesTableTableFilterComposer
    extends Composer<_$AppDatabase, $ProfilesTableTable> {
  $$ProfilesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get certifications => $composableBuilder(
    column: $table.certifications,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get aboutMe => $composableBuilder(
    column: $table.aboutMe,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get philosophy => $composableBuilder(
    column: $table.philosophy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get methodology => $composableBuilder(
    column: $table.methodology,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get branding => $composableBuilder(
    column: $table.branding,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bannerImagePath => $composableBuilder(
    column: $table.bannerImagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customDomain => $composableBuilder(
    column: $table.customDomain,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get domainVerified => $composableBuilder(
    column: $table.domainVerified,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get profilePhotoPath => $composableBuilder(
    column: $table.profilePhotoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get specialties => $composableBuilder(
    column: $table.specialties,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get trainingTypes => $composableBuilder(
    column: $table.trainingTypes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get businessCurrency => $composableBuilder(
    column: $table.businessCurrency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get averageRating => $composableBuilder(
    column: $table.averageRating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get completionPercentage => $composableBuilder(
    column: $table.completionPercentage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get missingFields => $composableBuilder(
    column: $table.missingFields,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isVerified => $composableBuilder(
    column: $table.isVerified,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get availability => $composableBuilder(
    column: $table.availability,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get minServicePrice => $composableBuilder(
    column: $table.minServicePrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProfilesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ProfilesTableTable> {
  $$ProfilesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get certifications => $composableBuilder(
    column: $table.certifications,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get aboutMe => $composableBuilder(
    column: $table.aboutMe,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get philosophy => $composableBuilder(
    column: $table.philosophy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get methodology => $composableBuilder(
    column: $table.methodology,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get branding => $composableBuilder(
    column: $table.branding,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bannerImagePath => $composableBuilder(
    column: $table.bannerImagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customDomain => $composableBuilder(
    column: $table.customDomain,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get domainVerified => $composableBuilder(
    column: $table.domainVerified,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get profilePhotoPath => $composableBuilder(
    column: $table.profilePhotoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get specialties => $composableBuilder(
    column: $table.specialties,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get trainingTypes => $composableBuilder(
    column: $table.trainingTypes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get businessCurrency => $composableBuilder(
    column: $table.businessCurrency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get averageRating => $composableBuilder(
    column: $table.averageRating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get completionPercentage => $composableBuilder(
    column: $table.completionPercentage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get missingFields => $composableBuilder(
    column: $table.missingFields,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isVerified => $composableBuilder(
    column: $table.isVerified,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get availability => $composableBuilder(
    column: $table.availability,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get minServicePrice => $composableBuilder(
    column: $table.minServicePrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProfilesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProfilesTableTable> {
  $$ProfilesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get certifications => $composableBuilder(
    column: $table.certifications,
    builder: (column) => column,
  );

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get aboutMe =>
      $composableBuilder(column: $table.aboutMe, builder: (column) => column);

  GeneratedColumn<String> get philosophy => $composableBuilder(
    column: $table.philosophy,
    builder: (column) => column,
  );

  GeneratedColumn<String> get methodology => $composableBuilder(
    column: $table.methodology,
    builder: (column) => column,
  );

  GeneratedColumn<String> get branding =>
      $composableBuilder(column: $table.branding, builder: (column) => column);

  GeneratedColumn<String> get bannerImagePath => $composableBuilder(
    column: $table.bannerImagePath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get customDomain => $composableBuilder(
    column: $table.customDomain,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get domainVerified => $composableBuilder(
    column: $table.domainVerified,
    builder: (column) => column,
  );

  GeneratedColumn<String> get profilePhotoPath => $composableBuilder(
    column: $table.profilePhotoPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get specialties => $composableBuilder(
    column: $table.specialties,
    builder: (column) => column,
  );

  GeneratedColumn<String> get trainingTypes => $composableBuilder(
    column: $table.trainingTypes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get businessCurrency => $composableBuilder(
    column: $table.businessCurrency,
    builder: (column) => column,
  );

  GeneratedColumn<double> get averageRating => $composableBuilder(
    column: $table.averageRating,
    builder: (column) => column,
  );

  GeneratedColumn<int> get completionPercentage => $composableBuilder(
    column: $table.completionPercentage,
    builder: (column) => column,
  );

  GeneratedColumn<String> get missingFields => $composableBuilder(
    column: $table.missingFields,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isVerified => $composableBuilder(
    column: $table.isVerified,
    builder: (column) => column,
  );

  GeneratedColumn<String> get availability => $composableBuilder(
    column: $table.availability,
    builder: (column) => column,
  );

  GeneratedColumn<double> get minServicePrice => $composableBuilder(
    column: $table.minServicePrice,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );
}

class $$ProfilesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProfilesTableTable,
          ProfileEntity,
          $$ProfilesTableTableFilterComposer,
          $$ProfilesTableTableOrderingComposer,
          $$ProfilesTableTableAnnotationComposer,
          $$ProfilesTableTableCreateCompanionBuilder,
          $$ProfilesTableTableUpdateCompanionBuilder,
          (
            ProfileEntity,
            BaseReferences<_$AppDatabase, $ProfilesTableTable, ProfileEntity>,
          ),
          ProfileEntity,
          PrefetchHooks Function()
        > {
  $$ProfilesTableTableTableManager(_$AppDatabase db, $ProfilesTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProfilesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProfilesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProfilesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String?> certifications = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> aboutMe = const Value.absent(),
                Value<String?> philosophy = const Value.absent(),
                Value<String?> methodology = const Value.absent(),
                Value<String?> branding = const Value.absent(),
                Value<String?> bannerImagePath = const Value.absent(),
                Value<String?> customDomain = const Value.absent(),
                Value<bool> domainVerified = const Value.absent(),
                Value<String?> profilePhotoPath = const Value.absent(),
                Value<String> specialties = const Value.absent(),
                Value<String> trainingTypes = const Value.absent(),
                Value<String> businessCurrency = const Value.absent(),
                Value<double?> averageRating = const Value.absent(),
                Value<int> completionPercentage = const Value.absent(),
                Value<String?> missingFields = const Value.absent(),
                Value<bool> isVerified = const Value.absent(),
                Value<String?> availability = const Value.absent(),
                Value<double?> minServicePrice = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProfilesTableCompanion(
                id: id,
                userId: userId,
                certifications: certifications,
                phone: phone,
                aboutMe: aboutMe,
                philosophy: philosophy,
                methodology: methodology,
                branding: branding,
                bannerImagePath: bannerImagePath,
                customDomain: customDomain,
                domainVerified: domainVerified,
                profilePhotoPath: profilePhotoPath,
                specialties: specialties,
                trainingTypes: trainingTypes,
                businessCurrency: businessCurrency,
                averageRating: averageRating,
                completionPercentage: completionPercentage,
                missingFields: missingFields,
                isVerified: isVerified,
                availability: availability,
                minServicePrice: minServicePrice,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String userId,
                Value<String?> certifications = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> aboutMe = const Value.absent(),
                Value<String?> philosophy = const Value.absent(),
                Value<String?> methodology = const Value.absent(),
                Value<String?> branding = const Value.absent(),
                Value<String?> bannerImagePath = const Value.absent(),
                Value<String?> customDomain = const Value.absent(),
                Value<bool> domainVerified = const Value.absent(),
                Value<String?> profilePhotoPath = const Value.absent(),
                Value<String> specialties = const Value.absent(),
                Value<String> trainingTypes = const Value.absent(),
                Value<String> businessCurrency = const Value.absent(),
                Value<double?> averageRating = const Value.absent(),
                Value<int> completionPercentage = const Value.absent(),
                Value<String?> missingFields = const Value.absent(),
                Value<bool> isVerified = const Value.absent(),
                Value<String?> availability = const Value.absent(),
                Value<double?> minServicePrice = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProfilesTableCompanion.insert(
                id: id,
                userId: userId,
                certifications: certifications,
                phone: phone,
                aboutMe: aboutMe,
                philosophy: philosophy,
                methodology: methodology,
                branding: branding,
                bannerImagePath: bannerImagePath,
                customDomain: customDomain,
                domainVerified: domainVerified,
                profilePhotoPath: profilePhotoPath,
                specialties: specialties,
                trainingTypes: trainingTypes,
                businessCurrency: businessCurrency,
                averageRating: averageRating,
                completionPercentage: completionPercentage,
                missingFields: missingFields,
                isVerified: isVerified,
                availability: availability,
                minServicePrice: minServicePrice,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProfilesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProfilesTableTable,
      ProfileEntity,
      $$ProfilesTableTableFilterComposer,
      $$ProfilesTableTableOrderingComposer,
      $$ProfilesTableTableAnnotationComposer,
      $$ProfilesTableTableCreateCompanionBuilder,
      $$ProfilesTableTableUpdateCompanionBuilder,
      (
        ProfileEntity,
        BaseReferences<_$AppDatabase, $ProfilesTableTable, ProfileEntity>,
      ),
      ProfileEntity,
      PrefetchHooks Function()
    >;
typedef $$WorkoutSessionsTableTableCreateCompanionBuilder =
    WorkoutSessionsTableCompanion Function({
      Value<String> id,
      required String clientId,
      Value<String?> name,
      required int startTime,
      Value<int?> endTime,
      Value<String> status,
      Value<String?> notes,
      Value<int?> restStartedAt,
      Value<String?> workoutTemplateId,
      Value<int?> plannedDate,
      Value<String?> clientPackageId,
      Value<bool> isTrainerLed,
      Value<int?> reminderTime,
      Value<bool> trainerReminderSent,
      Value<String?> trainerNotes,
      Value<int?> trainerNotesUpdatedAt,
      required int createdAt,
      required int updatedAt,
      Value<int?> deletedAt,
      Value<String> syncStatus,
      Value<int> rowid,
    });
typedef $$WorkoutSessionsTableTableUpdateCompanionBuilder =
    WorkoutSessionsTableCompanion Function({
      Value<String> id,
      Value<String> clientId,
      Value<String?> name,
      Value<int> startTime,
      Value<int?> endTime,
      Value<String> status,
      Value<String?> notes,
      Value<int?> restStartedAt,
      Value<String?> workoutTemplateId,
      Value<int?> plannedDate,
      Value<String?> clientPackageId,
      Value<bool> isTrainerLed,
      Value<int?> reminderTime,
      Value<bool> trainerReminderSent,
      Value<String?> trainerNotes,
      Value<int?> trainerNotesUpdatedAt,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int?> deletedAt,
      Value<String> syncStatus,
      Value<int> rowid,
    });

class $$WorkoutSessionsTableTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutSessionsTableTable> {
  $$WorkoutSessionsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientId => $composableBuilder(
    column: $table.clientId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get restStartedAt => $composableBuilder(
    column: $table.restStartedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get workoutTemplateId => $composableBuilder(
    column: $table.workoutTemplateId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get plannedDate => $composableBuilder(
    column: $table.plannedDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientPackageId => $composableBuilder(
    column: $table.clientPackageId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isTrainerLed => $composableBuilder(
    column: $table.isTrainerLed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reminderTime => $composableBuilder(
    column: $table.reminderTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get trainerReminderSent => $composableBuilder(
    column: $table.trainerReminderSent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get trainerNotes => $composableBuilder(
    column: $table.trainerNotes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get trainerNotesUpdatedAt => $composableBuilder(
    column: $table.trainerNotesUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WorkoutSessionsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutSessionsTableTable> {
  $$WorkoutSessionsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientId => $composableBuilder(
    column: $table.clientId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get restStartedAt => $composableBuilder(
    column: $table.restStartedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get workoutTemplateId => $composableBuilder(
    column: $table.workoutTemplateId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get plannedDate => $composableBuilder(
    column: $table.plannedDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientPackageId => $composableBuilder(
    column: $table.clientPackageId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isTrainerLed => $composableBuilder(
    column: $table.isTrainerLed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reminderTime => $composableBuilder(
    column: $table.reminderTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get trainerReminderSent => $composableBuilder(
    column: $table.trainerReminderSent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get trainerNotes => $composableBuilder(
    column: $table.trainerNotes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get trainerNotesUpdatedAt => $composableBuilder(
    column: $table.trainerNotesUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WorkoutSessionsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutSessionsTableTable> {
  $$WorkoutSessionsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get clientId =>
      $composableBuilder(column: $table.clientId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<int> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get restStartedAt => $composableBuilder(
    column: $table.restStartedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get workoutTemplateId => $composableBuilder(
    column: $table.workoutTemplateId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get plannedDate => $composableBuilder(
    column: $table.plannedDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get clientPackageId => $composableBuilder(
    column: $table.clientPackageId,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isTrainerLed => $composableBuilder(
    column: $table.isTrainerLed,
    builder: (column) => column,
  );

  GeneratedColumn<int> get reminderTime => $composableBuilder(
    column: $table.reminderTime,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get trainerReminderSent => $composableBuilder(
    column: $table.trainerReminderSent,
    builder: (column) => column,
  );

  GeneratedColumn<String> get trainerNotes => $composableBuilder(
    column: $table.trainerNotes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get trainerNotesUpdatedAt => $composableBuilder(
    column: $table.trainerNotesUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );
}

class $$WorkoutSessionsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkoutSessionsTableTable,
          WorkoutSessionEntity,
          $$WorkoutSessionsTableTableFilterComposer,
          $$WorkoutSessionsTableTableOrderingComposer,
          $$WorkoutSessionsTableTableAnnotationComposer,
          $$WorkoutSessionsTableTableCreateCompanionBuilder,
          $$WorkoutSessionsTableTableUpdateCompanionBuilder,
          (
            WorkoutSessionEntity,
            BaseReferences<
              _$AppDatabase,
              $WorkoutSessionsTableTable,
              WorkoutSessionEntity
            >,
          ),
          WorkoutSessionEntity,
          PrefetchHooks Function()
        > {
  $$WorkoutSessionsTableTableTableManager(
    _$AppDatabase db,
    $WorkoutSessionsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutSessionsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutSessionsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$WorkoutSessionsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> clientId = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<int> startTime = const Value.absent(),
                Value<int?> endTime = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int?> restStartedAt = const Value.absent(),
                Value<String?> workoutTemplateId = const Value.absent(),
                Value<int?> plannedDate = const Value.absent(),
                Value<String?> clientPackageId = const Value.absent(),
                Value<bool> isTrainerLed = const Value.absent(),
                Value<int?> reminderTime = const Value.absent(),
                Value<bool> trainerReminderSent = const Value.absent(),
                Value<String?> trainerNotes = const Value.absent(),
                Value<int?> trainerNotesUpdatedAt = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkoutSessionsTableCompanion(
                id: id,
                clientId: clientId,
                name: name,
                startTime: startTime,
                endTime: endTime,
                status: status,
                notes: notes,
                restStartedAt: restStartedAt,
                workoutTemplateId: workoutTemplateId,
                plannedDate: plannedDate,
                clientPackageId: clientPackageId,
                isTrainerLed: isTrainerLed,
                reminderTime: reminderTime,
                trainerReminderSent: trainerReminderSent,
                trainerNotes: trainerNotes,
                trainerNotesUpdatedAt: trainerNotesUpdatedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String clientId,
                Value<String?> name = const Value.absent(),
                required int startTime,
                Value<int?> endTime = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int?> restStartedAt = const Value.absent(),
                Value<String?> workoutTemplateId = const Value.absent(),
                Value<int?> plannedDate = const Value.absent(),
                Value<String?> clientPackageId = const Value.absent(),
                Value<bool> isTrainerLed = const Value.absent(),
                Value<int?> reminderTime = const Value.absent(),
                Value<bool> trainerReminderSent = const Value.absent(),
                Value<String?> trainerNotes = const Value.absent(),
                Value<int?> trainerNotesUpdatedAt = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkoutSessionsTableCompanion.insert(
                id: id,
                clientId: clientId,
                name: name,
                startTime: startTime,
                endTime: endTime,
                status: status,
                notes: notes,
                restStartedAt: restStartedAt,
                workoutTemplateId: workoutTemplateId,
                plannedDate: plannedDate,
                clientPackageId: clientPackageId,
                isTrainerLed: isTrainerLed,
                reminderTime: reminderTime,
                trainerReminderSent: trainerReminderSent,
                trainerNotes: trainerNotes,
                trainerNotesUpdatedAt: trainerNotesUpdatedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WorkoutSessionsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkoutSessionsTableTable,
      WorkoutSessionEntity,
      $$WorkoutSessionsTableTableFilterComposer,
      $$WorkoutSessionsTableTableOrderingComposer,
      $$WorkoutSessionsTableTableAnnotationComposer,
      $$WorkoutSessionsTableTableCreateCompanionBuilder,
      $$WorkoutSessionsTableTableUpdateCompanionBuilder,
      (
        WorkoutSessionEntity,
        BaseReferences<
          _$AppDatabase,
          $WorkoutSessionsTableTable,
          WorkoutSessionEntity
        >,
      ),
      WorkoutSessionEntity,
      PrefetchHooks Function()
    >;
typedef $$ExercisesTableTableCreateCompanionBuilder =
    ExercisesTableCompanion Function({
      Value<String> id,
      required String name,
      Value<String?> muscleGroup,
      Value<String?> equipment,
      Value<String?> category,
      Value<String?> description,
      Value<String?> videoUrl,
      Value<String?> createdById,
      Value<int?> recommendedRestSeconds,
      Value<bool> isUnilateral,
      required int createdAt,
      required int updatedAt,
      Value<int?> deletedAt,
      Value<String> syncStatus,
      Value<int> rowid,
    });
typedef $$ExercisesTableTableUpdateCompanionBuilder =
    ExercisesTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> muscleGroup,
      Value<String?> equipment,
      Value<String?> category,
      Value<String?> description,
      Value<String?> videoUrl,
      Value<String?> createdById,
      Value<int?> recommendedRestSeconds,
      Value<bool> isUnilateral,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int?> deletedAt,
      Value<String> syncStatus,
      Value<int> rowid,
    });

class $$ExercisesTableTableFilterComposer
    extends Composer<_$AppDatabase, $ExercisesTableTable> {
  $$ExercisesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get muscleGroup => $composableBuilder(
    column: $table.muscleGroup,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get equipment => $composableBuilder(
    column: $table.equipment,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get videoUrl => $composableBuilder(
    column: $table.videoUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get recommendedRestSeconds => $composableBuilder(
    column: $table.recommendedRestSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isUnilateral => $composableBuilder(
    column: $table.isUnilateral,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExercisesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ExercisesTableTable> {
  $$ExercisesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get muscleGroup => $composableBuilder(
    column: $table.muscleGroup,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get equipment => $composableBuilder(
    column: $table.equipment,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get videoUrl => $composableBuilder(
    column: $table.videoUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get recommendedRestSeconds => $composableBuilder(
    column: $table.recommendedRestSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isUnilateral => $composableBuilder(
    column: $table.isUnilateral,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExercisesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExercisesTableTable> {
  $$ExercisesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get muscleGroup => $composableBuilder(
    column: $table.muscleGroup,
    builder: (column) => column,
  );

  GeneratedColumn<String> get equipment =>
      $composableBuilder(column: $table.equipment, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get videoUrl =>
      $composableBuilder(column: $table.videoUrl, builder: (column) => column);

  GeneratedColumn<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => column,
  );

  GeneratedColumn<int> get recommendedRestSeconds => $composableBuilder(
    column: $table.recommendedRestSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isUnilateral => $composableBuilder(
    column: $table.isUnilateral,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );
}

class $$ExercisesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExercisesTableTable,
          ExerciseEntity,
          $$ExercisesTableTableFilterComposer,
          $$ExercisesTableTableOrderingComposer,
          $$ExercisesTableTableAnnotationComposer,
          $$ExercisesTableTableCreateCompanionBuilder,
          $$ExercisesTableTableUpdateCompanionBuilder,
          (
            ExerciseEntity,
            BaseReferences<_$AppDatabase, $ExercisesTableTable, ExerciseEntity>,
          ),
          ExerciseEntity,
          PrefetchHooks Function()
        > {
  $$ExercisesTableTableTableManager(
    _$AppDatabase db,
    $ExercisesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExercisesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExercisesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExercisesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> muscleGroup = const Value.absent(),
                Value<String?> equipment = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> videoUrl = const Value.absent(),
                Value<String?> createdById = const Value.absent(),
                Value<int?> recommendedRestSeconds = const Value.absent(),
                Value<bool> isUnilateral = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExercisesTableCompanion(
                id: id,
                name: name,
                muscleGroup: muscleGroup,
                equipment: equipment,
                category: category,
                description: description,
                videoUrl: videoUrl,
                createdById: createdById,
                recommendedRestSeconds: recommendedRestSeconds,
                isUnilateral: isUnilateral,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String name,
                Value<String?> muscleGroup = const Value.absent(),
                Value<String?> equipment = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> videoUrl = const Value.absent(),
                Value<String?> createdById = const Value.absent(),
                Value<int?> recommendedRestSeconds = const Value.absent(),
                Value<bool> isUnilateral = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExercisesTableCompanion.insert(
                id: id,
                name: name,
                muscleGroup: muscleGroup,
                equipment: equipment,
                category: category,
                description: description,
                videoUrl: videoUrl,
                createdById: createdById,
                recommendedRestSeconds: recommendedRestSeconds,
                isUnilateral: isUnilateral,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ExercisesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExercisesTableTable,
      ExerciseEntity,
      $$ExercisesTableTableFilterComposer,
      $$ExercisesTableTableOrderingComposer,
      $$ExercisesTableTableAnnotationComposer,
      $$ExercisesTableTableCreateCompanionBuilder,
      $$ExercisesTableTableUpdateCompanionBuilder,
      (
        ExerciseEntity,
        BaseReferences<_$AppDatabase, $ExercisesTableTable, ExerciseEntity>,
      ),
      ExerciseEntity,
      PrefetchHooks Function()
    >;
typedef $$WorkoutTemplatesTableCreateCompanionBuilder =
    WorkoutTemplatesCompanion Function({
      Value<String> id,
      required String name,
      Value<String?> description,
      required String programId,
      Value<int> order,
      required int createdAt,
      required int updatedAt,
      Value<int?> deletedAt,
      Value<String> syncStatus,
      Value<String?> exercisesJson,
      Value<int> rowid,
    });
typedef $$WorkoutTemplatesTableUpdateCompanionBuilder =
    WorkoutTemplatesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> description,
      Value<String> programId,
      Value<int> order,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int?> deletedAt,
      Value<String> syncStatus,
      Value<String?> exercisesJson,
      Value<int> rowid,
    });

class $$WorkoutTemplatesTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutTemplatesTable> {
  $$WorkoutTemplatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get programId => $composableBuilder(
    column: $table.programId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get order => $composableBuilder(
    column: $table.order,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exercisesJson => $composableBuilder(
    column: $table.exercisesJson,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WorkoutTemplatesTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutTemplatesTable> {
  $$WorkoutTemplatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get programId => $composableBuilder(
    column: $table.programId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get order => $composableBuilder(
    column: $table.order,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exercisesJson => $composableBuilder(
    column: $table.exercisesJson,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WorkoutTemplatesTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutTemplatesTable> {
  $$WorkoutTemplatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get programId =>
      $composableBuilder(column: $table.programId, builder: (column) => column);

  GeneratedColumn<int> get order =>
      $composableBuilder(column: $table.order, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get exercisesJson => $composableBuilder(
    column: $table.exercisesJson,
    builder: (column) => column,
  );
}

class $$WorkoutTemplatesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkoutTemplatesTable,
          WorkoutTemplateEntity,
          $$WorkoutTemplatesTableFilterComposer,
          $$WorkoutTemplatesTableOrderingComposer,
          $$WorkoutTemplatesTableAnnotationComposer,
          $$WorkoutTemplatesTableCreateCompanionBuilder,
          $$WorkoutTemplatesTableUpdateCompanionBuilder,
          (
            WorkoutTemplateEntity,
            BaseReferences<
              _$AppDatabase,
              $WorkoutTemplatesTable,
              WorkoutTemplateEntity
            >,
          ),
          WorkoutTemplateEntity,
          PrefetchHooks Function()
        > {
  $$WorkoutTemplatesTableTableManager(
    _$AppDatabase db,
    $WorkoutTemplatesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutTemplatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutTemplatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutTemplatesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> programId = const Value.absent(),
                Value<int> order = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> exercisesJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkoutTemplatesCompanion(
                id: id,
                name: name,
                description: description,
                programId: programId,
                order: order,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                exercisesJson: exercisesJson,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String name,
                Value<String?> description = const Value.absent(),
                required String programId,
                Value<int> order = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> exercisesJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkoutTemplatesCompanion.insert(
                id: id,
                name: name,
                description: description,
                programId: programId,
                order: order,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                exercisesJson: exercisesJson,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WorkoutTemplatesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkoutTemplatesTable,
      WorkoutTemplateEntity,
      $$WorkoutTemplatesTableFilterComposer,
      $$WorkoutTemplatesTableOrderingComposer,
      $$WorkoutTemplatesTableAnnotationComposer,
      $$WorkoutTemplatesTableCreateCompanionBuilder,
      $$WorkoutTemplatesTableUpdateCompanionBuilder,
      (
        WorkoutTemplateEntity,
        BaseReferences<
          _$AppDatabase,
          $WorkoutTemplatesTable,
          WorkoutTemplateEntity
        >,
      ),
      WorkoutTemplateEntity,
      PrefetchHooks Function()
    >;
typedef $$ClientMeasurementsTableCreateCompanionBuilder =
    ClientMeasurementsCompanion Function({
      Value<String> id,
      required String clientId,
      required int measurementDate,
      Value<double?> weightKg,
      Value<double?> bodyFatPercentage,
      Value<String?> notes,
      Value<String?> customMetrics,
      required int createdAt,
      required int updatedAt,
      Value<int?> deletedAt,
      Value<String> syncStatus,
      Value<int> rowid,
    });
typedef $$ClientMeasurementsTableUpdateCompanionBuilder =
    ClientMeasurementsCompanion Function({
      Value<String> id,
      Value<String> clientId,
      Value<int> measurementDate,
      Value<double?> weightKg,
      Value<double?> bodyFatPercentage,
      Value<String?> notes,
      Value<String?> customMetrics,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int?> deletedAt,
      Value<String> syncStatus,
      Value<int> rowid,
    });

class $$ClientMeasurementsTableFilterComposer
    extends Composer<_$AppDatabase, $ClientMeasurementsTable> {
  $$ClientMeasurementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientId => $composableBuilder(
    column: $table.clientId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get measurementDate => $composableBuilder(
    column: $table.measurementDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get bodyFatPercentage => $composableBuilder(
    column: $table.bodyFatPercentage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customMetrics => $composableBuilder(
    column: $table.customMetrics,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ClientMeasurementsTableOrderingComposer
    extends Composer<_$AppDatabase, $ClientMeasurementsTable> {
  $$ClientMeasurementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientId => $composableBuilder(
    column: $table.clientId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get measurementDate => $composableBuilder(
    column: $table.measurementDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get bodyFatPercentage => $composableBuilder(
    column: $table.bodyFatPercentage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customMetrics => $composableBuilder(
    column: $table.customMetrics,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ClientMeasurementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ClientMeasurementsTable> {
  $$ClientMeasurementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get clientId =>
      $composableBuilder(column: $table.clientId, builder: (column) => column);

  GeneratedColumn<int> get measurementDate => $composableBuilder(
    column: $table.measurementDate,
    builder: (column) => column,
  );

  GeneratedColumn<double> get weightKg =>
      $composableBuilder(column: $table.weightKg, builder: (column) => column);

  GeneratedColumn<double> get bodyFatPercentage => $composableBuilder(
    column: $table.bodyFatPercentage,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get customMetrics => $composableBuilder(
    column: $table.customMetrics,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );
}

class $$ClientMeasurementsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ClientMeasurementsTable,
          ClientMeasurementEntity,
          $$ClientMeasurementsTableFilterComposer,
          $$ClientMeasurementsTableOrderingComposer,
          $$ClientMeasurementsTableAnnotationComposer,
          $$ClientMeasurementsTableCreateCompanionBuilder,
          $$ClientMeasurementsTableUpdateCompanionBuilder,
          (
            ClientMeasurementEntity,
            BaseReferences<
              _$AppDatabase,
              $ClientMeasurementsTable,
              ClientMeasurementEntity
            >,
          ),
          ClientMeasurementEntity,
          PrefetchHooks Function()
        > {
  $$ClientMeasurementsTableTableManager(
    _$AppDatabase db,
    $ClientMeasurementsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClientMeasurementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClientMeasurementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClientMeasurementsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> clientId = const Value.absent(),
                Value<int> measurementDate = const Value.absent(),
                Value<double?> weightKg = const Value.absent(),
                Value<double?> bodyFatPercentage = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> customMetrics = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ClientMeasurementsCompanion(
                id: id,
                clientId: clientId,
                measurementDate: measurementDate,
                weightKg: weightKg,
                bodyFatPercentage: bodyFatPercentage,
                notes: notes,
                customMetrics: customMetrics,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String clientId,
                required int measurementDate,
                Value<double?> weightKg = const Value.absent(),
                Value<double?> bodyFatPercentage = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> customMetrics = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ClientMeasurementsCompanion.insert(
                id: id,
                clientId: clientId,
                measurementDate: measurementDate,
                weightKg: weightKg,
                bodyFatPercentage: bodyFatPercentage,
                notes: notes,
                customMetrics: customMetrics,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ClientMeasurementsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ClientMeasurementsTable,
      ClientMeasurementEntity,
      $$ClientMeasurementsTableFilterComposer,
      $$ClientMeasurementsTableOrderingComposer,
      $$ClientMeasurementsTableAnnotationComposer,
      $$ClientMeasurementsTableCreateCompanionBuilder,
      $$ClientMeasurementsTableUpdateCompanionBuilder,
      (
        ClientMeasurementEntity,
        BaseReferences<
          _$AppDatabase,
          $ClientMeasurementsTable,
          ClientMeasurementEntity
        >,
      ),
      ClientMeasurementEntity,
      PrefetchHooks Function()
    >;
typedef $$ClientPhotosTableCreateCompanionBuilder =
    ClientPhotosCompanion Function({
      Value<String> id,
      required String clientId,
      required int photoDate,
      required String imagePath,
      Value<String?> caption,
      Value<String?> checkInId,
      required int createdAt,
      required int updatedAt,
      Value<int?> deletedAt,
      Value<String> syncStatus,
      Value<int> rowid,
    });
typedef $$ClientPhotosTableUpdateCompanionBuilder =
    ClientPhotosCompanion Function({
      Value<String> id,
      Value<String> clientId,
      Value<int> photoDate,
      Value<String> imagePath,
      Value<String?> caption,
      Value<String?> checkInId,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int?> deletedAt,
      Value<String> syncStatus,
      Value<int> rowid,
    });

class $$ClientPhotosTableFilterComposer
    extends Composer<_$AppDatabase, $ClientPhotosTable> {
  $$ClientPhotosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientId => $composableBuilder(
    column: $table.clientId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get photoDate => $composableBuilder(
    column: $table.photoDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get caption => $composableBuilder(
    column: $table.caption,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get checkInId => $composableBuilder(
    column: $table.checkInId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ClientPhotosTableOrderingComposer
    extends Composer<_$AppDatabase, $ClientPhotosTable> {
  $$ClientPhotosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientId => $composableBuilder(
    column: $table.clientId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get photoDate => $composableBuilder(
    column: $table.photoDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get caption => $composableBuilder(
    column: $table.caption,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get checkInId => $composableBuilder(
    column: $table.checkInId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ClientPhotosTableAnnotationComposer
    extends Composer<_$AppDatabase, $ClientPhotosTable> {
  $$ClientPhotosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get clientId =>
      $composableBuilder(column: $table.clientId, builder: (column) => column);

  GeneratedColumn<int> get photoDate =>
      $composableBuilder(column: $table.photoDate, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<String> get caption =>
      $composableBuilder(column: $table.caption, builder: (column) => column);

  GeneratedColumn<String> get checkInId =>
      $composableBuilder(column: $table.checkInId, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );
}

class $$ClientPhotosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ClientPhotosTable,
          ClientPhotoEntity,
          $$ClientPhotosTableFilterComposer,
          $$ClientPhotosTableOrderingComposer,
          $$ClientPhotosTableAnnotationComposer,
          $$ClientPhotosTableCreateCompanionBuilder,
          $$ClientPhotosTableUpdateCompanionBuilder,
          (
            ClientPhotoEntity,
            BaseReferences<
              _$AppDatabase,
              $ClientPhotosTable,
              ClientPhotoEntity
            >,
          ),
          ClientPhotoEntity,
          PrefetchHooks Function()
        > {
  $$ClientPhotosTableTableManager(_$AppDatabase db, $ClientPhotosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClientPhotosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClientPhotosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClientPhotosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> clientId = const Value.absent(),
                Value<int> photoDate = const Value.absent(),
                Value<String> imagePath = const Value.absent(),
                Value<String?> caption = const Value.absent(),
                Value<String?> checkInId = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ClientPhotosCompanion(
                id: id,
                clientId: clientId,
                photoDate: photoDate,
                imagePath: imagePath,
                caption: caption,
                checkInId: checkInId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String clientId,
                required int photoDate,
                required String imagePath,
                Value<String?> caption = const Value.absent(),
                Value<String?> checkInId = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ClientPhotosCompanion.insert(
                id: id,
                clientId: clientId,
                photoDate: photoDate,
                imagePath: imagePath,
                caption: caption,
                checkInId: checkInId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ClientPhotosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ClientPhotosTable,
      ClientPhotoEntity,
      $$ClientPhotosTableFilterComposer,
      $$ClientPhotosTableOrderingComposer,
      $$ClientPhotosTableAnnotationComposer,
      $$ClientPhotosTableCreateCompanionBuilder,
      $$ClientPhotosTableUpdateCompanionBuilder,
      (
        ClientPhotoEntity,
        BaseReferences<_$AppDatabase, $ClientPhotosTable, ClientPhotoEntity>,
      ),
      ClientPhotoEntity,
      PrefetchHooks Function()
    >;
typedef $$NotificationsTableCreateCompanionBuilder =
    NotificationsCompanion Function({
      Value<String> id,
      required String userId,
      required String message,
      required String type,
      Value<bool> readStatus,
      Value<String?> metadata,
      required int createdAt,
      required int updatedAt,
      Value<int?> deletedAt,
      Value<String> syncStatus,
      Value<int> rowid,
    });
typedef $$NotificationsTableUpdateCompanionBuilder =
    NotificationsCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String> message,
      Value<String> type,
      Value<bool> readStatus,
      Value<String?> metadata,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int?> deletedAt,
      Value<String> syncStatus,
      Value<int> rowid,
    });

class $$NotificationsTableFilterComposer
    extends Composer<_$AppDatabase, $NotificationsTable> {
  $$NotificationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get readStatus => $composableBuilder(
    column: $table.readStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get metadata => $composableBuilder(
    column: $table.metadata,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NotificationsTableOrderingComposer
    extends Composer<_$AppDatabase, $NotificationsTable> {
  $$NotificationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get readStatus => $composableBuilder(
    column: $table.readStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get metadata => $composableBuilder(
    column: $table.metadata,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NotificationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotificationsTable> {
  $$NotificationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<bool> get readStatus => $composableBuilder(
    column: $table.readStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get metadata =>
      $composableBuilder(column: $table.metadata, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );
}

class $$NotificationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NotificationsTable,
          NotificationEntity,
          $$NotificationsTableFilterComposer,
          $$NotificationsTableOrderingComposer,
          $$NotificationsTableAnnotationComposer,
          $$NotificationsTableCreateCompanionBuilder,
          $$NotificationsTableUpdateCompanionBuilder,
          (
            NotificationEntity,
            BaseReferences<
              _$AppDatabase,
              $NotificationsTable,
              NotificationEntity
            >,
          ),
          NotificationEntity,
          PrefetchHooks Function()
        > {
  $$NotificationsTableTableManager(_$AppDatabase db, $NotificationsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotificationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NotificationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NotificationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> message = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<bool> readStatus = const Value.absent(),
                Value<String?> metadata = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NotificationsCompanion(
                id: id,
                userId: userId,
                message: message,
                type: type,
                readStatus: readStatus,
                metadata: metadata,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String userId,
                required String message,
                required String type,
                Value<bool> readStatus = const Value.absent(),
                Value<String?> metadata = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NotificationsCompanion.insert(
                id: id,
                userId: userId,
                message: message,
                type: type,
                readStatus: readStatus,
                metadata: metadata,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NotificationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NotificationsTable,
      NotificationEntity,
      $$NotificationsTableFilterComposer,
      $$NotificationsTableOrderingComposer,
      $$NotificationsTableAnnotationComposer,
      $$NotificationsTableCreateCompanionBuilder,
      $$NotificationsTableUpdateCompanionBuilder,
      (
        NotificationEntity,
        BaseReferences<_$AppDatabase, $NotificationsTable, NotificationEntity>,
      ),
      NotificationEntity,
      PrefetchHooks Function()
    >;
typedef $$BookingTableTableCreateCompanionBuilder =
    BookingTableCompanion Function({
      Value<String> id,
      required int startTime,
      required int endTime,
      Value<String> status,
      Value<bool?> dataSharingApproved,
      Value<int?> dataSharingApprovedAt,
      required String trainerId,
      Value<String?> clientId,
      Value<String?> clientName,
      Value<String?> clientEmail,
      Value<String?> clientNotes,
      required int createdAt,
      required int updatedAt,
      Value<int?> deletedAt,
      Value<String> syncStatus,
      Value<int> rowid,
    });
typedef $$BookingTableTableUpdateCompanionBuilder =
    BookingTableCompanion Function({
      Value<String> id,
      Value<int> startTime,
      Value<int> endTime,
      Value<String> status,
      Value<bool?> dataSharingApproved,
      Value<int?> dataSharingApprovedAt,
      Value<String> trainerId,
      Value<String?> clientId,
      Value<String?> clientName,
      Value<String?> clientEmail,
      Value<String?> clientNotes,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int?> deletedAt,
      Value<String> syncStatus,
      Value<int> rowid,
    });

class $$BookingTableTableFilterComposer
    extends Composer<_$AppDatabase, $BookingTableTable> {
  $$BookingTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get dataSharingApproved => $composableBuilder(
    column: $table.dataSharingApproved,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dataSharingApprovedAt => $composableBuilder(
    column: $table.dataSharingApprovedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get trainerId => $composableBuilder(
    column: $table.trainerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientId => $composableBuilder(
    column: $table.clientId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientName => $composableBuilder(
    column: $table.clientName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientEmail => $composableBuilder(
    column: $table.clientEmail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientNotes => $composableBuilder(
    column: $table.clientNotes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BookingTableTableOrderingComposer
    extends Composer<_$AppDatabase, $BookingTableTable> {
  $$BookingTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get dataSharingApproved => $composableBuilder(
    column: $table.dataSharingApproved,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dataSharingApprovedAt => $composableBuilder(
    column: $table.dataSharingApprovedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get trainerId => $composableBuilder(
    column: $table.trainerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientId => $composableBuilder(
    column: $table.clientId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientName => $composableBuilder(
    column: $table.clientName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientEmail => $composableBuilder(
    column: $table.clientEmail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientNotes => $composableBuilder(
    column: $table.clientNotes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BookingTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $BookingTableTable> {
  $$BookingTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<int> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<bool> get dataSharingApproved => $composableBuilder(
    column: $table.dataSharingApproved,
    builder: (column) => column,
  );

  GeneratedColumn<int> get dataSharingApprovedAt => $composableBuilder(
    column: $table.dataSharingApprovedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get trainerId =>
      $composableBuilder(column: $table.trainerId, builder: (column) => column);

  GeneratedColumn<String> get clientId =>
      $composableBuilder(column: $table.clientId, builder: (column) => column);

  GeneratedColumn<String> get clientName => $composableBuilder(
    column: $table.clientName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get clientEmail => $composableBuilder(
    column: $table.clientEmail,
    builder: (column) => column,
  );

  GeneratedColumn<String> get clientNotes => $composableBuilder(
    column: $table.clientNotes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );
}

class $$BookingTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BookingTableTable,
          BookingEntity,
          $$BookingTableTableFilterComposer,
          $$BookingTableTableOrderingComposer,
          $$BookingTableTableAnnotationComposer,
          $$BookingTableTableCreateCompanionBuilder,
          $$BookingTableTableUpdateCompanionBuilder,
          (
            BookingEntity,
            BaseReferences<_$AppDatabase, $BookingTableTable, BookingEntity>,
          ),
          BookingEntity,
          PrefetchHooks Function()
        > {
  $$BookingTableTableTableManager(_$AppDatabase db, $BookingTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BookingTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BookingTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BookingTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<int> startTime = const Value.absent(),
                Value<int> endTime = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<bool?> dataSharingApproved = const Value.absent(),
                Value<int?> dataSharingApprovedAt = const Value.absent(),
                Value<String> trainerId = const Value.absent(),
                Value<String?> clientId = const Value.absent(),
                Value<String?> clientName = const Value.absent(),
                Value<String?> clientEmail = const Value.absent(),
                Value<String?> clientNotes = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BookingTableCompanion(
                id: id,
                startTime: startTime,
                endTime: endTime,
                status: status,
                dataSharingApproved: dataSharingApproved,
                dataSharingApprovedAt: dataSharingApprovedAt,
                trainerId: trainerId,
                clientId: clientId,
                clientName: clientName,
                clientEmail: clientEmail,
                clientNotes: clientNotes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required int startTime,
                required int endTime,
                Value<String> status = const Value.absent(),
                Value<bool?> dataSharingApproved = const Value.absent(),
                Value<int?> dataSharingApprovedAt = const Value.absent(),
                required String trainerId,
                Value<String?> clientId = const Value.absent(),
                Value<String?> clientName = const Value.absent(),
                Value<String?> clientEmail = const Value.absent(),
                Value<String?> clientNotes = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BookingTableCompanion.insert(
                id: id,
                startTime: startTime,
                endTime: endTime,
                status: status,
                dataSharingApproved: dataSharingApproved,
                dataSharingApprovedAt: dataSharingApprovedAt,
                trainerId: trainerId,
                clientId: clientId,
                clientName: clientName,
                clientEmail: clientEmail,
                clientNotes: clientNotes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BookingTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BookingTableTable,
      BookingEntity,
      $$BookingTableTableFilterComposer,
      $$BookingTableTableOrderingComposer,
      $$BookingTableTableAnnotationComposer,
      $$BookingTableTableCreateCompanionBuilder,
      $$BookingTableTableUpdateCompanionBuilder,
      (
        BookingEntity,
        BaseReferences<_$AppDatabase, $BookingTableTable, BookingEntity>,
      ),
      BookingEntity,
      PrefetchHooks Function()
    >;
typedef $$PackageTableTableCreateCompanionBuilder =
    PackageTableCompanion Function({
      Value<String> id,
      required String name,
      Value<String?> description,
      required String price,
      required int numberOfSessions,
      Value<bool> isActive,
      required String stripeProductId,
      required String stripePriceId,
      required String trainerId,
      required int createdAt,
      required int updatedAt,
      Value<int?> deletedAt,
      Value<String> syncStatus,
      Value<int> rowid,
    });
typedef $$PackageTableTableUpdateCompanionBuilder =
    PackageTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> description,
      Value<String> price,
      Value<int> numberOfSessions,
      Value<bool> isActive,
      Value<String> stripeProductId,
      Value<String> stripePriceId,
      Value<String> trainerId,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int?> deletedAt,
      Value<String> syncStatus,
      Value<int> rowid,
    });

class $$PackageTableTableFilterComposer
    extends Composer<_$AppDatabase, $PackageTableTable> {
  $$PackageTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get numberOfSessions => $composableBuilder(
    column: $table.numberOfSessions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stripeProductId => $composableBuilder(
    column: $table.stripeProductId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stripePriceId => $composableBuilder(
    column: $table.stripePriceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get trainerId => $composableBuilder(
    column: $table.trainerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PackageTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PackageTableTable> {
  $$PackageTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get numberOfSessions => $composableBuilder(
    column: $table.numberOfSessions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stripeProductId => $composableBuilder(
    column: $table.stripeProductId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stripePriceId => $composableBuilder(
    column: $table.stripePriceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get trainerId => $composableBuilder(
    column: $table.trainerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PackageTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PackageTableTable> {
  $$PackageTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<int> get numberOfSessions => $composableBuilder(
    column: $table.numberOfSessions,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<String> get stripeProductId => $composableBuilder(
    column: $table.stripeProductId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get stripePriceId => $composableBuilder(
    column: $table.stripePriceId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get trainerId =>
      $composableBuilder(column: $table.trainerId, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );
}

class $$PackageTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PackageTableTable,
          PackageEntity,
          $$PackageTableTableFilterComposer,
          $$PackageTableTableOrderingComposer,
          $$PackageTableTableAnnotationComposer,
          $$PackageTableTableCreateCompanionBuilder,
          $$PackageTableTableUpdateCompanionBuilder,
          (
            PackageEntity,
            BaseReferences<_$AppDatabase, $PackageTableTable, PackageEntity>,
          ),
          PackageEntity,
          PrefetchHooks Function()
        > {
  $$PackageTableTableTableManager(_$AppDatabase db, $PackageTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PackageTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PackageTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PackageTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> price = const Value.absent(),
                Value<int> numberOfSessions = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<String> stripeProductId = const Value.absent(),
                Value<String> stripePriceId = const Value.absent(),
                Value<String> trainerId = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PackageTableCompanion(
                id: id,
                name: name,
                description: description,
                price: price,
                numberOfSessions: numberOfSessions,
                isActive: isActive,
                stripeProductId: stripeProductId,
                stripePriceId: stripePriceId,
                trainerId: trainerId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String name,
                Value<String?> description = const Value.absent(),
                required String price,
                required int numberOfSessions,
                Value<bool> isActive = const Value.absent(),
                required String stripeProductId,
                required String stripePriceId,
                required String trainerId,
                required int createdAt,
                required int updatedAt,
                Value<int?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PackageTableCompanion.insert(
                id: id,
                name: name,
                description: description,
                price: price,
                numberOfSessions: numberOfSessions,
                isActive: isActive,
                stripeProductId: stripeProductId,
                stripePriceId: stripePriceId,
                trainerId: trainerId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PackageTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PackageTableTable,
      PackageEntity,
      $$PackageTableTableFilterComposer,
      $$PackageTableTableOrderingComposer,
      $$PackageTableTableAnnotationComposer,
      $$PackageTableTableCreateCompanionBuilder,
      $$PackageTableTableUpdateCompanionBuilder,
      (
        PackageEntity,
        BaseReferences<_$AppDatabase, $PackageTableTable, PackageEntity>,
      ),
      PackageEntity,
      PrefetchHooks Function()
    >;
typedef $$TestimonialTableTableCreateCompanionBuilder =
    TestimonialTableCompanion Function({
      Value<String> id,
      required String profileId,
      required String clientName,
      required String testimonialText,
      Value<int?> rating,
      required int createdAt,
      required int updatedAt,
      Value<int?> deletedAt,
      Value<String> syncStatus,
      Value<int> rowid,
    });
typedef $$TestimonialTableTableUpdateCompanionBuilder =
    TestimonialTableCompanion Function({
      Value<String> id,
      Value<String> profileId,
      Value<String> clientName,
      Value<String> testimonialText,
      Value<int?> rating,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int?> deletedAt,
      Value<String> syncStatus,
      Value<int> rowid,
    });

class $$TestimonialTableTableFilterComposer
    extends Composer<_$AppDatabase, $TestimonialTableTable> {
  $$TestimonialTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientName => $composableBuilder(
    column: $table.clientName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get testimonialText => $composableBuilder(
    column: $table.testimonialText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TestimonialTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TestimonialTableTable> {
  $$TestimonialTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientName => $composableBuilder(
    column: $table.clientName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get testimonialText => $composableBuilder(
    column: $table.testimonialText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TestimonialTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TestimonialTableTable> {
  $$TestimonialTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get profileId =>
      $composableBuilder(column: $table.profileId, builder: (column) => column);

  GeneratedColumn<String> get clientName => $composableBuilder(
    column: $table.clientName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get testimonialText => $composableBuilder(
    column: $table.testimonialText,
    builder: (column) => column,
  );

  GeneratedColumn<int> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );
}

class $$TestimonialTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TestimonialTableTable,
          TestimonialEntity,
          $$TestimonialTableTableFilterComposer,
          $$TestimonialTableTableOrderingComposer,
          $$TestimonialTableTableAnnotationComposer,
          $$TestimonialTableTableCreateCompanionBuilder,
          $$TestimonialTableTableUpdateCompanionBuilder,
          (
            TestimonialEntity,
            BaseReferences<
              _$AppDatabase,
              $TestimonialTableTable,
              TestimonialEntity
            >,
          ),
          TestimonialEntity,
          PrefetchHooks Function()
        > {
  $$TestimonialTableTableTableManager(
    _$AppDatabase db,
    $TestimonialTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TestimonialTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TestimonialTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TestimonialTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> profileId = const Value.absent(),
                Value<String> clientName = const Value.absent(),
                Value<String> testimonialText = const Value.absent(),
                Value<int?> rating = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TestimonialTableCompanion(
                id: id,
                profileId: profileId,
                clientName: clientName,
                testimonialText: testimonialText,
                rating: rating,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String profileId,
                required String clientName,
                required String testimonialText,
                Value<int?> rating = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TestimonialTableCompanion.insert(
                id: id,
                profileId: profileId,
                clientName: clientName,
                testimonialText: testimonialText,
                rating: rating,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TestimonialTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TestimonialTableTable,
      TestimonialEntity,
      $$TestimonialTableTableFilterComposer,
      $$TestimonialTableTableOrderingComposer,
      $$TestimonialTableTableAnnotationComposer,
      $$TestimonialTableTableCreateCompanionBuilder,
      $$TestimonialTableTableUpdateCompanionBuilder,
      (
        TestimonialEntity,
        BaseReferences<
          _$AppDatabase,
          $TestimonialTableTable,
          TestimonialEntity
        >,
      ),
      TestimonialEntity,
      PrefetchHooks Function()
    >;
typedef $$ClientExerciseLogsTableCreateCompanionBuilder =
    ClientExerciseLogsCompanion Function({
      Value<String> id,
      required String clientId,
      required String exerciseId,
      Value<int?> reps,
      Value<double?> weight,
      Value<bool?> isCompleted,
      Value<int?> order,
      Value<String?> tempo,
      Value<String?> notes,
      Value<String?> videoUrl,
      Value<String> side,
      required int createdAt,
      required int updatedAt,
      Value<int?> deletedAt,
      required String workoutSessionId,
      Value<String?> supersetKey,
      Value<int?> orderInSuperset,
      Value<String> syncStatus,
      Value<int> rowid,
    });
typedef $$ClientExerciseLogsTableUpdateCompanionBuilder =
    ClientExerciseLogsCompanion Function({
      Value<String> id,
      Value<String> clientId,
      Value<String> exerciseId,
      Value<int?> reps,
      Value<double?> weight,
      Value<bool?> isCompleted,
      Value<int?> order,
      Value<String?> tempo,
      Value<String?> notes,
      Value<String?> videoUrl,
      Value<String> side,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int?> deletedAt,
      Value<String> workoutSessionId,
      Value<String?> supersetKey,
      Value<int?> orderInSuperset,
      Value<String> syncStatus,
      Value<int> rowid,
    });

class $$ClientExerciseLogsTableFilterComposer
    extends Composer<_$AppDatabase, $ClientExerciseLogsTable> {
  $$ClientExerciseLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientId => $composableBuilder(
    column: $table.clientId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reps => $composableBuilder(
    column: $table.reps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get order => $composableBuilder(
    column: $table.order,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tempo => $composableBuilder(
    column: $table.tempo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get videoUrl => $composableBuilder(
    column: $table.videoUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get side => $composableBuilder(
    column: $table.side,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get workoutSessionId => $composableBuilder(
    column: $table.workoutSessionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get supersetKey => $composableBuilder(
    column: $table.supersetKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderInSuperset => $composableBuilder(
    column: $table.orderInSuperset,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ClientExerciseLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $ClientExerciseLogsTable> {
  $$ClientExerciseLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientId => $composableBuilder(
    column: $table.clientId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reps => $composableBuilder(
    column: $table.reps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get order => $composableBuilder(
    column: $table.order,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tempo => $composableBuilder(
    column: $table.tempo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get videoUrl => $composableBuilder(
    column: $table.videoUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get side => $composableBuilder(
    column: $table.side,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get workoutSessionId => $composableBuilder(
    column: $table.workoutSessionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get supersetKey => $composableBuilder(
    column: $table.supersetKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderInSuperset => $composableBuilder(
    column: $table.orderInSuperset,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ClientExerciseLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ClientExerciseLogsTable> {
  $$ClientExerciseLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get clientId =>
      $composableBuilder(column: $table.clientId, builder: (column) => column);

  GeneratedColumn<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get reps =>
      $composableBuilder(column: $table.reps, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => column,
  );

  GeneratedColumn<int> get order =>
      $composableBuilder(column: $table.order, builder: (column) => column);

  GeneratedColumn<String> get tempo =>
      $composableBuilder(column: $table.tempo, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get videoUrl =>
      $composableBuilder(column: $table.videoUrl, builder: (column) => column);

  GeneratedColumn<String> get side =>
      $composableBuilder(column: $table.side, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get workoutSessionId => $composableBuilder(
    column: $table.workoutSessionId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get supersetKey => $composableBuilder(
    column: $table.supersetKey,
    builder: (column) => column,
  );

  GeneratedColumn<int> get orderInSuperset => $composableBuilder(
    column: $table.orderInSuperset,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );
}

class $$ClientExerciseLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ClientExerciseLogsTable,
          ClientExerciseLogEntity,
          $$ClientExerciseLogsTableFilterComposer,
          $$ClientExerciseLogsTableOrderingComposer,
          $$ClientExerciseLogsTableAnnotationComposer,
          $$ClientExerciseLogsTableCreateCompanionBuilder,
          $$ClientExerciseLogsTableUpdateCompanionBuilder,
          (
            ClientExerciseLogEntity,
            BaseReferences<
              _$AppDatabase,
              $ClientExerciseLogsTable,
              ClientExerciseLogEntity
            >,
          ),
          ClientExerciseLogEntity,
          PrefetchHooks Function()
        > {
  $$ClientExerciseLogsTableTableManager(
    _$AppDatabase db,
    $ClientExerciseLogsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClientExerciseLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClientExerciseLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClientExerciseLogsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> clientId = const Value.absent(),
                Value<String> exerciseId = const Value.absent(),
                Value<int?> reps = const Value.absent(),
                Value<double?> weight = const Value.absent(),
                Value<bool?> isCompleted = const Value.absent(),
                Value<int?> order = const Value.absent(),
                Value<String?> tempo = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> videoUrl = const Value.absent(),
                Value<String> side = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int?> deletedAt = const Value.absent(),
                Value<String> workoutSessionId = const Value.absent(),
                Value<String?> supersetKey = const Value.absent(),
                Value<int?> orderInSuperset = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ClientExerciseLogsCompanion(
                id: id,
                clientId: clientId,
                exerciseId: exerciseId,
                reps: reps,
                weight: weight,
                isCompleted: isCompleted,
                order: order,
                tempo: tempo,
                notes: notes,
                videoUrl: videoUrl,
                side: side,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                workoutSessionId: workoutSessionId,
                supersetKey: supersetKey,
                orderInSuperset: orderInSuperset,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String clientId,
                required String exerciseId,
                Value<int?> reps = const Value.absent(),
                Value<double?> weight = const Value.absent(),
                Value<bool?> isCompleted = const Value.absent(),
                Value<int?> order = const Value.absent(),
                Value<String?> tempo = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> videoUrl = const Value.absent(),
                Value<String> side = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int?> deletedAt = const Value.absent(),
                required String workoutSessionId,
                Value<String?> supersetKey = const Value.absent(),
                Value<int?> orderInSuperset = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ClientExerciseLogsCompanion.insert(
                id: id,
                clientId: clientId,
                exerciseId: exerciseId,
                reps: reps,
                weight: weight,
                isCompleted: isCompleted,
                order: order,
                tempo: tempo,
                notes: notes,
                videoUrl: videoUrl,
                side: side,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                workoutSessionId: workoutSessionId,
                supersetKey: supersetKey,
                orderInSuperset: orderInSuperset,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ClientExerciseLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ClientExerciseLogsTable,
      ClientExerciseLogEntity,
      $$ClientExerciseLogsTableFilterComposer,
      $$ClientExerciseLogsTableOrderingComposer,
      $$ClientExerciseLogsTableAnnotationComposer,
      $$ClientExerciseLogsTableCreateCompanionBuilder,
      $$ClientExerciseLogsTableUpdateCompanionBuilder,
      (
        ClientExerciseLogEntity,
        BaseReferences<
          _$AppDatabase,
          $ClientExerciseLogsTable,
          ClientExerciseLogEntity
        >,
      ),
      ClientExerciseLogEntity,
      PrefetchHooks Function()
    >;
typedef $$ServicesTableCreateCompanionBuilder =
    ServicesCompanion Function({
      Value<String> id,
      required String profileId,
      required String title,
      required String description,
      Value<String?> price,
      Value<String?> currency,
      Value<int?> duration,
      required int createdAt,
      required int updatedAt,
      Value<int?> deletedAt,
      Value<String> syncStatus,
      Value<int> rowid,
    });
typedef $$ServicesTableUpdateCompanionBuilder =
    ServicesCompanion Function({
      Value<String> id,
      Value<String> profileId,
      Value<String> title,
      Value<String> description,
      Value<String?> price,
      Value<String?> currency,
      Value<int?> duration,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int?> deletedAt,
      Value<String> syncStatus,
      Value<int> rowid,
    });

class $$ServicesTableFilterComposer
    extends Composer<_$AppDatabase, $ServicesTable> {
  $$ServicesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ServicesTableOrderingComposer
    extends Composer<_$AppDatabase, $ServicesTable> {
  $$ServicesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ServicesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ServicesTable> {
  $$ServicesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get profileId =>
      $composableBuilder(column: $table.profileId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<int> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );
}

class $$ServicesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ServicesTable,
          ServiceEntity,
          $$ServicesTableFilterComposer,
          $$ServicesTableOrderingComposer,
          $$ServicesTableAnnotationComposer,
          $$ServicesTableCreateCompanionBuilder,
          $$ServicesTableUpdateCompanionBuilder,
          (
            ServiceEntity,
            BaseReferences<_$AppDatabase, $ServicesTable, ServiceEntity>,
          ),
          ServiceEntity,
          PrefetchHooks Function()
        > {
  $$ServicesTableTableManager(_$AppDatabase db, $ServicesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ServicesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ServicesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ServicesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> profileId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String?> price = const Value.absent(),
                Value<String?> currency = const Value.absent(),
                Value<int?> duration = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ServicesCompanion(
                id: id,
                profileId: profileId,
                title: title,
                description: description,
                price: price,
                currency: currency,
                duration: duration,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String profileId,
                required String title,
                required String description,
                Value<String?> price = const Value.absent(),
                Value<String?> currency = const Value.absent(),
                Value<int?> duration = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ServicesCompanion.insert(
                id: id,
                profileId: profileId,
                title: title,
                description: description,
                price: price,
                currency: currency,
                duration: duration,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ServicesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ServicesTable,
      ServiceEntity,
      $$ServicesTableFilterComposer,
      $$ServicesTableOrderingComposer,
      $$ServicesTableAnnotationComposer,
      $$ServicesTableCreateCompanionBuilder,
      $$ServicesTableUpdateCompanionBuilder,
      (
        ServiceEntity,
        BaseReferences<_$AppDatabase, $ServicesTable, ServiceEntity>,
      ),
      ServiceEntity,
      PrefetchHooks Function()
    >;
typedef $$ProgramsTableCreateCompanionBuilder =
    ProgramsCompanion Function({
      Value<String> id,
      required String name,
      Value<String?> description,
      Value<String?> trainerId,
      Value<String?> category,
      required int createdAt,
      required int updatedAt,
      Value<int?> deletedAt,
      Value<String> syncStatus,
      Value<int> rowid,
    });
typedef $$ProgramsTableUpdateCompanionBuilder =
    ProgramsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> description,
      Value<String?> trainerId,
      Value<String?> category,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int?> deletedAt,
      Value<String> syncStatus,
      Value<int> rowid,
    });

class $$ProgramsTableFilterComposer
    extends Composer<_$AppDatabase, $ProgramsTable> {
  $$ProgramsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get trainerId => $composableBuilder(
    column: $table.trainerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProgramsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProgramsTable> {
  $$ProgramsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get trainerId => $composableBuilder(
    column: $table.trainerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProgramsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProgramsTable> {
  $$ProgramsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get trainerId =>
      $composableBuilder(column: $table.trainerId, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );
}

class $$ProgramsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProgramsTable,
          ProgramEntity,
          $$ProgramsTableFilterComposer,
          $$ProgramsTableOrderingComposer,
          $$ProgramsTableAnnotationComposer,
          $$ProgramsTableCreateCompanionBuilder,
          $$ProgramsTableUpdateCompanionBuilder,
          (
            ProgramEntity,
            BaseReferences<_$AppDatabase, $ProgramsTable, ProgramEntity>,
          ),
          ProgramEntity,
          PrefetchHooks Function()
        > {
  $$ProgramsTableTableManager(_$AppDatabase db, $ProgramsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProgramsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProgramsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProgramsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> trainerId = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProgramsCompanion(
                id: id,
                name: name,
                description: description,
                trainerId: trainerId,
                category: category,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String name,
                Value<String?> description = const Value.absent(),
                Value<String?> trainerId = const Value.absent(),
                Value<String?> category = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProgramsCompanion.insert(
                id: id,
                name: name,
                description: description,
                trainerId: trainerId,
                category: category,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProgramsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProgramsTable,
      ProgramEntity,
      $$ProgramsTableFilterComposer,
      $$ProgramsTableOrderingComposer,
      $$ProgramsTableAnnotationComposer,
      $$ProgramsTableCreateCompanionBuilder,
      $$ProgramsTableUpdateCompanionBuilder,
      (
        ProgramEntity,
        BaseReferences<_$AppDatabase, $ProgramsTable, ProgramEntity>,
      ),
      ProgramEntity,
      PrefetchHooks Function()
    >;
typedef $$CalendarEventsTableCreateCompanionBuilder =
    CalendarEventsCompanion Function({
      Value<String> id,
      required String trainerId,
      required String title,
      Value<String?> description,
      required int startTime,
      required int endTime,
      Value<String?> locationName,
      Value<String?> address,
      Value<String?> city,
      Value<double?> latitude,
      Value<double?> longitude,
      required String price,
      Value<String> currency,
      Value<int> capacity,
      Value<int> enrolledCount,
      Value<String?> category,
      Value<String?> imageUrl,
      Value<bool> isPromoted,
      Value<String> status,
      Value<String?> rejectionReason,
      required int createdAt,
      required int updatedAt,
      Value<String> syncStatus,
      Value<int> rowid,
    });
typedef $$CalendarEventsTableUpdateCompanionBuilder =
    CalendarEventsCompanion Function({
      Value<String> id,
      Value<String> trainerId,
      Value<String> title,
      Value<String?> description,
      Value<int> startTime,
      Value<int> endTime,
      Value<String?> locationName,
      Value<String?> address,
      Value<String?> city,
      Value<double?> latitude,
      Value<double?> longitude,
      Value<String> price,
      Value<String> currency,
      Value<int> capacity,
      Value<int> enrolledCount,
      Value<String?> category,
      Value<String?> imageUrl,
      Value<bool> isPromoted,
      Value<String> status,
      Value<String?> rejectionReason,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<String> syncStatus,
      Value<int> rowid,
    });

class $$CalendarEventsTableFilterComposer
    extends Composer<_$AppDatabase, $CalendarEventsTable> {
  $$CalendarEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get trainerId => $composableBuilder(
    column: $table.trainerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get locationName => $composableBuilder(
    column: $table.locationName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get capacity => $composableBuilder(
    column: $table.capacity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get enrolledCount => $composableBuilder(
    column: $table.enrolledCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPromoted => $composableBuilder(
    column: $table.isPromoted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rejectionReason => $composableBuilder(
    column: $table.rejectionReason,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CalendarEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $CalendarEventsTable> {
  $$CalendarEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get trainerId => $composableBuilder(
    column: $table.trainerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get locationName => $composableBuilder(
    column: $table.locationName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get capacity => $composableBuilder(
    column: $table.capacity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get enrolledCount => $composableBuilder(
    column: $table.enrolledCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPromoted => $composableBuilder(
    column: $table.isPromoted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rejectionReason => $composableBuilder(
    column: $table.rejectionReason,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CalendarEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CalendarEventsTable> {
  $$CalendarEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get trainerId =>
      $composableBuilder(column: $table.trainerId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<int> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<String> get locationName => $composableBuilder(
    column: $table.locationName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<String> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<int> get capacity =>
      $composableBuilder(column: $table.capacity, builder: (column) => column);

  GeneratedColumn<int> get enrolledCount => $composableBuilder(
    column: $table.enrolledCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<bool> get isPromoted => $composableBuilder(
    column: $table.isPromoted,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get rejectionReason => $composableBuilder(
    column: $table.rejectionReason,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );
}

class $$CalendarEventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CalendarEventsTable,
          CalendarEventEntity,
          $$CalendarEventsTableFilterComposer,
          $$CalendarEventsTableOrderingComposer,
          $$CalendarEventsTableAnnotationComposer,
          $$CalendarEventsTableCreateCompanionBuilder,
          $$CalendarEventsTableUpdateCompanionBuilder,
          (
            CalendarEventEntity,
            BaseReferences<
              _$AppDatabase,
              $CalendarEventsTable,
              CalendarEventEntity
            >,
          ),
          CalendarEventEntity,
          PrefetchHooks Function()
        > {
  $$CalendarEventsTableTableManager(
    _$AppDatabase db,
    $CalendarEventsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CalendarEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CalendarEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CalendarEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> trainerId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> startTime = const Value.absent(),
                Value<int> endTime = const Value.absent(),
                Value<String?> locationName = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<double?> latitude = const Value.absent(),
                Value<double?> longitude = const Value.absent(),
                Value<String> price = const Value.absent(),
                Value<String> currency = const Value.absent(),
                Value<int> capacity = const Value.absent(),
                Value<int> enrolledCount = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<bool> isPromoted = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> rejectionReason = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CalendarEventsCompanion(
                id: id,
                trainerId: trainerId,
                title: title,
                description: description,
                startTime: startTime,
                endTime: endTime,
                locationName: locationName,
                address: address,
                city: city,
                latitude: latitude,
                longitude: longitude,
                price: price,
                currency: currency,
                capacity: capacity,
                enrolledCount: enrolledCount,
                category: category,
                imageUrl: imageUrl,
                isPromoted: isPromoted,
                status: status,
                rejectionReason: rejectionReason,
                createdAt: createdAt,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String trainerId,
                required String title,
                Value<String?> description = const Value.absent(),
                required int startTime,
                required int endTime,
                Value<String?> locationName = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<double?> latitude = const Value.absent(),
                Value<double?> longitude = const Value.absent(),
                required String price,
                Value<String> currency = const Value.absent(),
                Value<int> capacity = const Value.absent(),
                Value<int> enrolledCount = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<bool> isPromoted = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> rejectionReason = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CalendarEventsCompanion.insert(
                id: id,
                trainerId: trainerId,
                title: title,
                description: description,
                startTime: startTime,
                endTime: endTime,
                locationName: locationName,
                address: address,
                city: city,
                latitude: latitude,
                longitude: longitude,
                price: price,
                currency: currency,
                capacity: capacity,
                enrolledCount: enrolledCount,
                category: category,
                imageUrl: imageUrl,
                isPromoted: isPromoted,
                status: status,
                rejectionReason: rejectionReason,
                createdAt: createdAt,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CalendarEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CalendarEventsTable,
      CalendarEventEntity,
      $$CalendarEventsTableFilterComposer,
      $$CalendarEventsTableOrderingComposer,
      $$CalendarEventsTableAnnotationComposer,
      $$CalendarEventsTableCreateCompanionBuilder,
      $$CalendarEventsTableUpdateCompanionBuilder,
      (
        CalendarEventEntity,
        BaseReferences<
          _$AppDatabase,
          $CalendarEventsTable,
          CalendarEventEntity
        >,
      ),
      CalendarEventEntity,
      PrefetchHooks Function()
    >;
typedef $$ClientAssessmentsTableCreateCompanionBuilder =
    ClientAssessmentsCompanion Function({
      Value<String> id,
      required String assessmentId,
      required String clientId,
      required double value,
      required int date,
      Value<String?> notes,
      required int createdAt,
      required int updatedAt,
      Value<int?> deletedAt,
      Value<String> syncStatus,
      Value<int> rowid,
    });
typedef $$ClientAssessmentsTableUpdateCompanionBuilder =
    ClientAssessmentsCompanion Function({
      Value<String> id,
      Value<String> assessmentId,
      Value<String> clientId,
      Value<double> value,
      Value<int> date,
      Value<String?> notes,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int?> deletedAt,
      Value<String> syncStatus,
      Value<int> rowid,
    });

class $$ClientAssessmentsTableFilterComposer
    extends Composer<_$AppDatabase, $ClientAssessmentsTable> {
  $$ClientAssessmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get assessmentId => $composableBuilder(
    column: $table.assessmentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientId => $composableBuilder(
    column: $table.clientId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ClientAssessmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $ClientAssessmentsTable> {
  $$ClientAssessmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get assessmentId => $composableBuilder(
    column: $table.assessmentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientId => $composableBuilder(
    column: $table.clientId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ClientAssessmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ClientAssessmentsTable> {
  $$ClientAssessmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get assessmentId => $composableBuilder(
    column: $table.assessmentId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get clientId =>
      $composableBuilder(column: $table.clientId, builder: (column) => column);

  GeneratedColumn<double> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<int> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );
}

class $$ClientAssessmentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ClientAssessmentsTable,
          ClientAssessmentEntity,
          $$ClientAssessmentsTableFilterComposer,
          $$ClientAssessmentsTableOrderingComposer,
          $$ClientAssessmentsTableAnnotationComposer,
          $$ClientAssessmentsTableCreateCompanionBuilder,
          $$ClientAssessmentsTableUpdateCompanionBuilder,
          (
            ClientAssessmentEntity,
            BaseReferences<
              _$AppDatabase,
              $ClientAssessmentsTable,
              ClientAssessmentEntity
            >,
          ),
          ClientAssessmentEntity,
          PrefetchHooks Function()
        > {
  $$ClientAssessmentsTableTableManager(
    _$AppDatabase db,
    $ClientAssessmentsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClientAssessmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClientAssessmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClientAssessmentsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> assessmentId = const Value.absent(),
                Value<String> clientId = const Value.absent(),
                Value<double> value = const Value.absent(),
                Value<int> date = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ClientAssessmentsCompanion(
                id: id,
                assessmentId: assessmentId,
                clientId: clientId,
                value: value,
                date: date,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String assessmentId,
                required String clientId,
                required double value,
                required int date,
                Value<String?> notes = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ClientAssessmentsCompanion.insert(
                id: id,
                assessmentId: assessmentId,
                clientId: clientId,
                value: value,
                date: date,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ClientAssessmentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ClientAssessmentsTable,
      ClientAssessmentEntity,
      $$ClientAssessmentsTableFilterComposer,
      $$ClientAssessmentsTableOrderingComposer,
      $$ClientAssessmentsTableAnnotationComposer,
      $$ClientAssessmentsTableCreateCompanionBuilder,
      $$ClientAssessmentsTableUpdateCompanionBuilder,
      (
        ClientAssessmentEntity,
        BaseReferences<
          _$AppDatabase,
          $ClientAssessmentsTable,
          ClientAssessmentEntity
        >,
      ),
      ClientAssessmentEntity,
      PrefetchHooks Function()
    >;
typedef $$TrainerProfilesTableTableCreateCompanionBuilder =
    TrainerProfilesTableCompanion Function({
      required String id,
      required String trainerId,
      Value<String?> name,
      Value<String?> bio,
      Value<String?> profilePhotoPath,
      Value<String?> location,
      Value<double?> latitude,
      Value<double?> longitude,
      Value<double?> averageRating,
      Value<String?> businessCurrency,
      required int createdAt,
      required int updatedAt,
      Value<String> syncStatus,
      Value<int?> syncModifiedAt,
      Value<int?> deletedAt,
      Value<int> rowid,
    });
typedef $$TrainerProfilesTableTableUpdateCompanionBuilder =
    TrainerProfilesTableCompanion Function({
      Value<String> id,
      Value<String> trainerId,
      Value<String?> name,
      Value<String?> bio,
      Value<String?> profilePhotoPath,
      Value<String?> location,
      Value<double?> latitude,
      Value<double?> longitude,
      Value<double?> averageRating,
      Value<String?> businessCurrency,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<String> syncStatus,
      Value<int?> syncModifiedAt,
      Value<int?> deletedAt,
      Value<int> rowid,
    });

class $$TrainerProfilesTableTableFilterComposer
    extends Composer<_$AppDatabase, $TrainerProfilesTableTable> {
  $$TrainerProfilesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get trainerId => $composableBuilder(
    column: $table.trainerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bio => $composableBuilder(
    column: $table.bio,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get profilePhotoPath => $composableBuilder(
    column: $table.profilePhotoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get averageRating => $composableBuilder(
    column: $table.averageRating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get businessCurrency => $composableBuilder(
    column: $table.businessCurrency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncModifiedAt => $composableBuilder(
    column: $table.syncModifiedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TrainerProfilesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TrainerProfilesTableTable> {
  $$TrainerProfilesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get trainerId => $composableBuilder(
    column: $table.trainerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bio => $composableBuilder(
    column: $table.bio,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get profilePhotoPath => $composableBuilder(
    column: $table.profilePhotoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get averageRating => $composableBuilder(
    column: $table.averageRating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get businessCurrency => $composableBuilder(
    column: $table.businessCurrency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncModifiedAt => $composableBuilder(
    column: $table.syncModifiedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TrainerProfilesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TrainerProfilesTableTable> {
  $$TrainerProfilesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get trainerId =>
      $composableBuilder(column: $table.trainerId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get bio =>
      $composableBuilder(column: $table.bio, builder: (column) => column);

  GeneratedColumn<String> get profilePhotoPath => $composableBuilder(
    column: $table.profilePhotoPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<double> get averageRating => $composableBuilder(
    column: $table.averageRating,
    builder: (column) => column,
  );

  GeneratedColumn<String> get businessCurrency => $composableBuilder(
    column: $table.businessCurrency,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get syncModifiedAt => $composableBuilder(
    column: $table.syncModifiedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$TrainerProfilesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TrainerProfilesTableTable,
          TrainerProfile,
          $$TrainerProfilesTableTableFilterComposer,
          $$TrainerProfilesTableTableOrderingComposer,
          $$TrainerProfilesTableTableAnnotationComposer,
          $$TrainerProfilesTableTableCreateCompanionBuilder,
          $$TrainerProfilesTableTableUpdateCompanionBuilder,
          (
            TrainerProfile,
            BaseReferences<
              _$AppDatabase,
              $TrainerProfilesTableTable,
              TrainerProfile
            >,
          ),
          TrainerProfile,
          PrefetchHooks Function()
        > {
  $$TrainerProfilesTableTableTableManager(
    _$AppDatabase db,
    $TrainerProfilesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TrainerProfilesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TrainerProfilesTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$TrainerProfilesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> trainerId = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String?> bio = const Value.absent(),
                Value<String?> profilePhotoPath = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<double?> latitude = const Value.absent(),
                Value<double?> longitude = const Value.absent(),
                Value<double?> averageRating = const Value.absent(),
                Value<String?> businessCurrency = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int?> syncModifiedAt = const Value.absent(),
                Value<int?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TrainerProfilesTableCompanion(
                id: id,
                trainerId: trainerId,
                name: name,
                bio: bio,
                profilePhotoPath: profilePhotoPath,
                location: location,
                latitude: latitude,
                longitude: longitude,
                averageRating: averageRating,
                businessCurrency: businessCurrency,
                createdAt: createdAt,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
                syncModifiedAt: syncModifiedAt,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String trainerId,
                Value<String?> name = const Value.absent(),
                Value<String?> bio = const Value.absent(),
                Value<String?> profilePhotoPath = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<double?> latitude = const Value.absent(),
                Value<double?> longitude = const Value.absent(),
                Value<double?> averageRating = const Value.absent(),
                Value<String?> businessCurrency = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<String> syncStatus = const Value.absent(),
                Value<int?> syncModifiedAt = const Value.absent(),
                Value<int?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TrainerProfilesTableCompanion.insert(
                id: id,
                trainerId: trainerId,
                name: name,
                bio: bio,
                profilePhotoPath: profilePhotoPath,
                location: location,
                latitude: latitude,
                longitude: longitude,
                averageRating: averageRating,
                businessCurrency: businessCurrency,
                createdAt: createdAt,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
                syncModifiedAt: syncModifiedAt,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TrainerProfilesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TrainerProfilesTableTable,
      TrainerProfile,
      $$TrainerProfilesTableTableFilterComposer,
      $$TrainerProfilesTableTableOrderingComposer,
      $$TrainerProfilesTableTableAnnotationComposer,
      $$TrainerProfilesTableTableCreateCompanionBuilder,
      $$TrainerProfilesTableTableUpdateCompanionBuilder,
      (
        TrainerProfile,
        BaseReferences<
          _$AppDatabase,
          $TrainerProfilesTableTable,
          TrainerProfile
        >,
      ),
      TrainerProfile,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AnalyticsCacheTableTableManager get analyticsCache =>
      $$AnalyticsCacheTableTableManager(_db, _db.analyticsCache);
  $$SyncMetadataTableTableManager get syncMetadata =>
      $$SyncMetadataTableTableManager(_db, _db.syncMetadata);
  $$ClientsTableTableTableManager get clientsTable =>
      $$ClientsTableTableTableManager(_db, _db.clientsTable);
  $$ProfilesTableTableTableManager get profilesTable =>
      $$ProfilesTableTableTableManager(_db, _db.profilesTable);
  $$WorkoutSessionsTableTableTableManager get workoutSessionsTable =>
      $$WorkoutSessionsTableTableTableManager(_db, _db.workoutSessionsTable);
  $$ExercisesTableTableTableManager get exercisesTable =>
      $$ExercisesTableTableTableManager(_db, _db.exercisesTable);
  $$WorkoutTemplatesTableTableManager get workoutTemplates =>
      $$WorkoutTemplatesTableTableManager(_db, _db.workoutTemplates);
  $$ClientMeasurementsTableTableManager get clientMeasurements =>
      $$ClientMeasurementsTableTableManager(_db, _db.clientMeasurements);
  $$ClientPhotosTableTableManager get clientPhotos =>
      $$ClientPhotosTableTableManager(_db, _db.clientPhotos);
  $$NotificationsTableTableManager get notifications =>
      $$NotificationsTableTableManager(_db, _db.notifications);
  $$BookingTableTableTableManager get bookingTable =>
      $$BookingTableTableTableManager(_db, _db.bookingTable);
  $$PackageTableTableTableManager get packageTable =>
      $$PackageTableTableTableManager(_db, _db.packageTable);
  $$TestimonialTableTableTableManager get testimonialTable =>
      $$TestimonialTableTableTableManager(_db, _db.testimonialTable);
  $$ClientExerciseLogsTableTableManager get clientExerciseLogs =>
      $$ClientExerciseLogsTableTableManager(_db, _db.clientExerciseLogs);
  $$ServicesTableTableManager get services =>
      $$ServicesTableTableManager(_db, _db.services);
  $$ProgramsTableTableManager get programs =>
      $$ProgramsTableTableManager(_db, _db.programs);
  $$CalendarEventsTableTableManager get calendarEvents =>
      $$CalendarEventsTableTableManager(_db, _db.calendarEvents);
  $$ClientAssessmentsTableTableManager get clientAssessments =>
      $$ClientAssessmentsTableTableManager(_db, _db.clientAssessments);
  $$TrainerProfilesTableTableTableManager get trainerProfilesTable =>
      $$TrainerProfilesTableTableTableManager(_db, _db.trainerProfilesTable);
}
