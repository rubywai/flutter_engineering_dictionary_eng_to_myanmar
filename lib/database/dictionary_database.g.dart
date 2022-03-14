// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dictionary_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class DictionaryTableData extends DataClass
    implements Insertable<DictionaryTableData> {
  final int id;
  final String eng;
  final String myan;
  final String type;
  final bool? favourite;
  DictionaryTableData(
      {required this.id,
      required this.eng,
      required this.myan,
      required this.type,
      this.favourite});
  factory DictionaryTableData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DictionaryTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      eng: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}eng'])!,
      myan: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}myan'])!,
      type: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type'])!,
      favourite: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}favourite']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['eng'] = Variable<String>(eng);
    map['myan'] = Variable<String>(myan);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || favourite != null) {
      map['favourite'] = Variable<bool?>(favourite);
    }
    return map;
  }

  DictionaryTableCompanion toCompanion(bool nullToAbsent) {
    return DictionaryTableCompanion(
      id: Value(id),
      eng: Value(eng),
      myan: Value(myan),
      type: Value(type),
      favourite: favourite == null && nullToAbsent
          ? const Value.absent()
          : Value(favourite),
    );
  }

  factory DictionaryTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DictionaryTableData(
      id: serializer.fromJson<int>(json['id']),
      eng: serializer.fromJson<String>(json['eng']),
      myan: serializer.fromJson<String>(json['myan']),
      type: serializer.fromJson<String>(json['type']),
      favourite: serializer.fromJson<bool?>(json['favourite']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'eng': serializer.toJson<String>(eng),
      'myan': serializer.toJson<String>(myan),
      'type': serializer.toJson<String>(type),
      'favourite': serializer.toJson<bool?>(favourite),
    };
  }

  DictionaryTableData copyWith(
          {int? id,
          String? eng,
          String? myan,
          String? type,
          bool? favourite}) =>
      DictionaryTableData(
        id: id ?? this.id,
        eng: eng ?? this.eng,
        myan: myan ?? this.myan,
        type: type ?? this.type,
        favourite: favourite ?? this.favourite,
      );
  @override
  String toString() {
    return (StringBuffer('DictionaryTableData(')
          ..write('id: $id, ')
          ..write('eng: $eng, ')
          ..write('myan: $myan, ')
          ..write('type: $type, ')
          ..write('favourite: $favourite')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, eng, myan, type, favourite);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DictionaryTableData &&
          other.id == this.id &&
          other.eng == this.eng &&
          other.myan == this.myan &&
          other.type == this.type &&
          other.favourite == this.favourite);
}

class DictionaryTableCompanion extends UpdateCompanion<DictionaryTableData> {
  final Value<int> id;
  final Value<String> eng;
  final Value<String> myan;
  final Value<String> type;
  final Value<bool?> favourite;
  const DictionaryTableCompanion({
    this.id = const Value.absent(),
    this.eng = const Value.absent(),
    this.myan = const Value.absent(),
    this.type = const Value.absent(),
    this.favourite = const Value.absent(),
  });
  DictionaryTableCompanion.insert({
    this.id = const Value.absent(),
    required String eng,
    required String myan,
    required String type,
    this.favourite = const Value.absent(),
  })  : eng = Value(eng),
        myan = Value(myan),
        type = Value(type);
  static Insertable<DictionaryTableData> custom({
    Expression<int>? id,
    Expression<String>? eng,
    Expression<String>? myan,
    Expression<String>? type,
    Expression<bool?>? favourite,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (eng != null) 'eng': eng,
      if (myan != null) 'myan': myan,
      if (type != null) 'type': type,
      if (favourite != null) 'favourite': favourite,
    });
  }

  DictionaryTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? eng,
      Value<String>? myan,
      Value<String>? type,
      Value<bool?>? favourite}) {
    return DictionaryTableCompanion(
      id: id ?? this.id,
      eng: eng ?? this.eng,
      myan: myan ?? this.myan,
      type: type ?? this.type,
      favourite: favourite ?? this.favourite,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (eng.present) {
      map['eng'] = Variable<String>(eng.value);
    }
    if (myan.present) {
      map['myan'] = Variable<String>(myan.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (favourite.present) {
      map['favourite'] = Variable<bool?>(favourite.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DictionaryTableCompanion(')
          ..write('id: $id, ')
          ..write('eng: $eng, ')
          ..write('myan: $myan, ')
          ..write('type: $type, ')
          ..write('favourite: $favourite')
          ..write(')'))
        .toString();
  }
}

class $DictionaryTableTable extends DictionaryTable
    with TableInfo<$DictionaryTableTable, DictionaryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DictionaryTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _engMeta = const VerificationMeta('eng');
  @override
  late final GeneratedColumn<String?> eng = GeneratedColumn<String?>(
      'eng', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _myanMeta = const VerificationMeta('myan');
  @override
  late final GeneratedColumn<String?> myan = GeneratedColumn<String?>(
      'myan', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String?> type = GeneratedColumn<String?>(
      'type', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _favouriteMeta = const VerificationMeta('favourite');
  @override
  late final GeneratedColumn<bool?> favourite = GeneratedColumn<bool?>(
      'favourite', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (favourite IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns => [id, eng, myan, type, favourite];
  @override
  String get aliasedName => _alias ?? 'engineers';
  @override
  String get actualTableName => 'engineers';
  @override
  VerificationContext validateIntegrity(
      Insertable<DictionaryTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('eng')) {
      context.handle(
          _engMeta, eng.isAcceptableOrUnknown(data['eng']!, _engMeta));
    } else if (isInserting) {
      context.missing(_engMeta);
    }
    if (data.containsKey('myan')) {
      context.handle(
          _myanMeta, myan.isAcceptableOrUnknown(data['myan']!, _myanMeta));
    } else if (isInserting) {
      context.missing(_myanMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('favourite')) {
      context.handle(_favouriteMeta,
          favourite.isAcceptableOrUnknown(data['favourite']!, _favouriteMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DictionaryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DictionaryTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DictionaryTableTable createAlias(String alias) {
    return $DictionaryTableTable(attachedDatabase, alias);
  }
}

abstract class _$DictionaryDatabase extends GeneratedDatabase {
  _$DictionaryDatabase(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  late final $DictionaryTableTable dictionaryTable =
      $DictionaryTableTable(this);
  late final DictionaryDao dictionaryDao =
      DictionaryDao(this as DictionaryDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [dictionaryTable];
}
