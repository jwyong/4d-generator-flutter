// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_database.dart';

// ignore_for_file: type=lint
class $DmcEntityTable extends DmcEntity
    with TableInfo<$DmcEntityTable, DmcEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DmcEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _drawDateMeta =
      const VerificationMeta('drawDate');
  @override
  late final GeneratedColumn<DateTime> drawDate = GeneratedColumn<DateTime>(
      'draw_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _drawNoMeta = const VerificationMeta('drawNo');
  @override
  late final GeneratedColumn<String> drawNo = GeneratedColumn<String>(
      'draw_no', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _p1Meta = const VerificationMeta('p1');
  @override
  late final GeneratedColumn<String> p1 = GeneratedColumn<String>(
      'p1', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _p2Meta = const VerificationMeta('p2');
  @override
  late final GeneratedColumn<String> p2 = GeneratedColumn<String>(
      'p2', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _p3Meta = const VerificationMeta('p3');
  @override
  late final GeneratedColumn<String> p3 = GeneratedColumn<String>(
      'p3', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _starterListMeta =
      const VerificationMeta('starterList');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String>
      starterList = GeneratedColumn<String>('starter_list', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<String>?>($DmcEntityTable.$converterstarterListn);
  static const VerificationMeta _consolidateListMeta =
      const VerificationMeta('consolidateList');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String>
      consolidateList = GeneratedColumn<String>(
              'consolidate_list', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<String>?>(
              $DmcEntityTable.$converterconsolidateListn);
  static const VerificationMeta _zodiac3dp1Meta =
      const VerificationMeta('zodiac3dp1');
  @override
  late final GeneratedColumn<String> zodiac3dp1 = GeneratedColumn<String>(
      'zodiac3dp1', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _zodiac3dp2Meta =
      const VerificationMeta('zodiac3dp2');
  @override
  late final GeneratedColumn<String> zodiac3dp2 = GeneratedColumn<String>(
      'zodiac3dp2', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _zodiac3dp3Meta =
      const VerificationMeta('zodiac3dp3');
  @override
  late final GeneratedColumn<String> zodiac3dp3 = GeneratedColumn<String>(
      'zodiac3dp3', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _full4dListMeta =
      const VerificationMeta('full4dList');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String>
      full4dList = GeneratedColumn<String>('full4d_list', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<String>?>($DmcEntityTable.$converterfull4dListn);
  static const VerificationMeta _p13p3dMeta = const VerificationMeta('p13p3d');
  @override
  late final GeneratedColumn<String> p13p3d = GeneratedColumn<String>(
      'p13p3d', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _p23p3dMeta = const VerificationMeta('p23p3d');
  @override
  late final GeneratedColumn<String> p23p3d = GeneratedColumn<String>(
      'p23p3d', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _p33p3dMeta = const VerificationMeta('p33p3d');
  @override
  late final GeneratedColumn<String> p33p3d = GeneratedColumn<String>(
      'p33p3d', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _starterList3p3dMeta =
      const VerificationMeta('starterList3p3d');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String>
      starterList3p3d = GeneratedColumn<String>(
              'starter_list3p3d', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<String>?>(
              $DmcEntityTable.$converterstarterList3p3dn);
  static const VerificationMeta _consolidateList3p3dMeta =
      const VerificationMeta('consolidateList3p3d');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String>
      consolidateList3p3d = GeneratedColumn<String>(
              'consolidate_list3p3d', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<String>?>(
              $DmcEntityTable.$converterconsolidateList3p3dn);
  static const VerificationMeta _full6dListMeta =
      const VerificationMeta('full6dList');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String>
      full6dList = GeneratedColumn<String>('full6d_list', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<String>?>($DmcEntityTable.$converterfull6dListn);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        status,
        drawDate,
        drawNo,
        p1,
        p2,
        p3,
        starterList,
        consolidateList,
        zodiac3dp1,
        zodiac3dp2,
        zodiac3dp3,
        full4dList,
        p13p3d,
        p23p3d,
        p33p3d,
        starterList3p3d,
        consolidateList3p3d,
        full6dList
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dmc_entity';
  @override
  VerificationContext validateIntegrity(Insertable<DmcEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('draw_date')) {
      context.handle(_drawDateMeta,
          drawDate.isAcceptableOrUnknown(data['draw_date']!, _drawDateMeta));
    } else if (isInserting) {
      context.missing(_drawDateMeta);
    }
    if (data.containsKey('draw_no')) {
      context.handle(_drawNoMeta,
          drawNo.isAcceptableOrUnknown(data['draw_no']!, _drawNoMeta));
    }
    if (data.containsKey('p1')) {
      context.handle(_p1Meta, p1.isAcceptableOrUnknown(data['p1']!, _p1Meta));
    }
    if (data.containsKey('p2')) {
      context.handle(_p2Meta, p2.isAcceptableOrUnknown(data['p2']!, _p2Meta));
    }
    if (data.containsKey('p3')) {
      context.handle(_p3Meta, p3.isAcceptableOrUnknown(data['p3']!, _p3Meta));
    }
    context.handle(_starterListMeta, const VerificationResult.success());
    context.handle(_consolidateListMeta, const VerificationResult.success());
    if (data.containsKey('zodiac3dp1')) {
      context.handle(
          _zodiac3dp1Meta,
          zodiac3dp1.isAcceptableOrUnknown(
              data['zodiac3dp1']!, _zodiac3dp1Meta));
    }
    if (data.containsKey('zodiac3dp2')) {
      context.handle(
          _zodiac3dp2Meta,
          zodiac3dp2.isAcceptableOrUnknown(
              data['zodiac3dp2']!, _zodiac3dp2Meta));
    }
    if (data.containsKey('zodiac3dp3')) {
      context.handle(
          _zodiac3dp3Meta,
          zodiac3dp3.isAcceptableOrUnknown(
              data['zodiac3dp3']!, _zodiac3dp3Meta));
    }
    context.handle(_full4dListMeta, const VerificationResult.success());
    if (data.containsKey('p13p3d')) {
      context.handle(_p13p3dMeta,
          p13p3d.isAcceptableOrUnknown(data['p13p3d']!, _p13p3dMeta));
    }
    if (data.containsKey('p23p3d')) {
      context.handle(_p23p3dMeta,
          p23p3d.isAcceptableOrUnknown(data['p23p3d']!, _p23p3dMeta));
    }
    if (data.containsKey('p33p3d')) {
      context.handle(_p33p3dMeta,
          p33p3d.isAcceptableOrUnknown(data['p33p3d']!, _p33p3dMeta));
    }
    context.handle(_starterList3p3dMeta, const VerificationResult.success());
    context.handle(
        _consolidateList3p3dMeta, const VerificationResult.success());
    context.handle(_full6dListMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DmcEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DmcEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status']),
      drawDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}draw_date'])!,
      drawNo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}draw_no']),
      p1: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}p1']),
      p2: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}p2']),
      p3: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}p3']),
      starterList: $DmcEntityTable.$converterstarterListn.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}starter_list'])),
      consolidateList: $DmcEntityTable.$converterconsolidateListn.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}consolidate_list'])),
      zodiac3dp1: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}zodiac3dp1']),
      zodiac3dp2: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}zodiac3dp2']),
      zodiac3dp3: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}zodiac3dp3']),
      full4dList: $DmcEntityTable.$converterfull4dListn.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full4d_list'])),
      p13p3d: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}p13p3d']),
      p23p3d: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}p23p3d']),
      p33p3d: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}p33p3d']),
      starterList3p3d: $DmcEntityTable.$converterstarterList3p3dn.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}starter_list3p3d'])),
      consolidateList3p3d: $DmcEntityTable.$converterconsolidateList3p3dn
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}consolidate_list3p3d'])),
      full6dList: $DmcEntityTable.$converterfull6dListn.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full6d_list'])),
    );
  }

  @override
  $DmcEntityTable createAlias(String alias) {
    return $DmcEntityTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterstarterList =
      const StringListConverter();
  static TypeConverter<List<String>?, String?> $converterstarterListn =
      NullAwareTypeConverter.wrap($converterstarterList);
  static TypeConverter<List<String>, String> $converterconsolidateList =
      const StringListConverter();
  static TypeConverter<List<String>?, String?> $converterconsolidateListn =
      NullAwareTypeConverter.wrap($converterconsolidateList);
  static TypeConverter<List<String>, String> $converterfull4dList =
      const StringListConverter();
  static TypeConverter<List<String>?, String?> $converterfull4dListn =
      NullAwareTypeConverter.wrap($converterfull4dList);
  static TypeConverter<List<String>, String> $converterstarterList3p3d =
      const StringListConverter();
  static TypeConverter<List<String>?, String?> $converterstarterList3p3dn =
      NullAwareTypeConverter.wrap($converterstarterList3p3d);
  static TypeConverter<List<String>, String> $converterconsolidateList3p3d =
      const StringListConverter();
  static TypeConverter<List<String>?, String?> $converterconsolidateList3p3dn =
      NullAwareTypeConverter.wrap($converterconsolidateList3p3d);
  static TypeConverter<List<String>, String> $converterfull6dList =
      const StringListConverter();
  static TypeConverter<List<String>?, String?> $converterfull6dListn =
      NullAwareTypeConverter.wrap($converterfull6dList);
}

class DmcEntityData extends DataClass implements Insertable<DmcEntityData> {
  final int id;
  final String? status;
  final DateTime drawDate;
  final String? drawNo;

  /// 1+3d
  final String? p1;
  final String? p2;
  final String? p3;
  final List<String>? starterList;
  final List<String>? consolidateList;
  final String? zodiac3dp1;
  final String? zodiac3dp2;
  final String? zodiac3dp3;
  final List<String>? full4dList;

  /// 3+3d
  final String? p13p3d;
  final String? p23p3d;
  final String? p33p3d;
  final List<String>? starterList3p3d;
  final List<String>? consolidateList3p3d;
  final List<String>? full6dList;
  const DmcEntityData(
      {required this.id,
      this.status,
      required this.drawDate,
      this.drawNo,
      this.p1,
      this.p2,
      this.p3,
      this.starterList,
      this.consolidateList,
      this.zodiac3dp1,
      this.zodiac3dp2,
      this.zodiac3dp3,
      this.full4dList,
      this.p13p3d,
      this.p23p3d,
      this.p33p3d,
      this.starterList3p3d,
      this.consolidateList3p3d,
      this.full6dList});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    map['draw_date'] = Variable<DateTime>(drawDate);
    if (!nullToAbsent || drawNo != null) {
      map['draw_no'] = Variable<String>(drawNo);
    }
    if (!nullToAbsent || p1 != null) {
      map['p1'] = Variable<String>(p1);
    }
    if (!nullToAbsent || p2 != null) {
      map['p2'] = Variable<String>(p2);
    }
    if (!nullToAbsent || p3 != null) {
      map['p3'] = Variable<String>(p3);
    }
    if (!nullToAbsent || starterList != null) {
      final converter = $DmcEntityTable.$converterstarterListn;
      map['starter_list'] = Variable<String>(converter.toSql(starterList));
    }
    if (!nullToAbsent || consolidateList != null) {
      final converter = $DmcEntityTable.$converterconsolidateListn;
      map['consolidate_list'] =
          Variable<String>(converter.toSql(consolidateList));
    }
    if (!nullToAbsent || zodiac3dp1 != null) {
      map['zodiac3dp1'] = Variable<String>(zodiac3dp1);
    }
    if (!nullToAbsent || zodiac3dp2 != null) {
      map['zodiac3dp2'] = Variable<String>(zodiac3dp2);
    }
    if (!nullToAbsent || zodiac3dp3 != null) {
      map['zodiac3dp3'] = Variable<String>(zodiac3dp3);
    }
    if (!nullToAbsent || full4dList != null) {
      final converter = $DmcEntityTable.$converterfull4dListn;
      map['full4d_list'] = Variable<String>(converter.toSql(full4dList));
    }
    if (!nullToAbsent || p13p3d != null) {
      map['p13p3d'] = Variable<String>(p13p3d);
    }
    if (!nullToAbsent || p23p3d != null) {
      map['p23p3d'] = Variable<String>(p23p3d);
    }
    if (!nullToAbsent || p33p3d != null) {
      map['p33p3d'] = Variable<String>(p33p3d);
    }
    if (!nullToAbsent || starterList3p3d != null) {
      final converter = $DmcEntityTable.$converterstarterList3p3dn;
      map['starter_list3p3d'] =
          Variable<String>(converter.toSql(starterList3p3d));
    }
    if (!nullToAbsent || consolidateList3p3d != null) {
      final converter = $DmcEntityTable.$converterconsolidateList3p3dn;
      map['consolidate_list3p3d'] =
          Variable<String>(converter.toSql(consolidateList3p3d));
    }
    if (!nullToAbsent || full6dList != null) {
      final converter = $DmcEntityTable.$converterfull6dListn;
      map['full6d_list'] = Variable<String>(converter.toSql(full6dList));
    }
    return map;
  }

  DmcEntityCompanion toCompanion(bool nullToAbsent) {
    return DmcEntityCompanion(
      id: Value(id),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      drawDate: Value(drawDate),
      drawNo:
          drawNo == null && nullToAbsent ? const Value.absent() : Value(drawNo),
      p1: p1 == null && nullToAbsent ? const Value.absent() : Value(p1),
      p2: p2 == null && nullToAbsent ? const Value.absent() : Value(p2),
      p3: p3 == null && nullToAbsent ? const Value.absent() : Value(p3),
      starterList: starterList == null && nullToAbsent
          ? const Value.absent()
          : Value(starterList),
      consolidateList: consolidateList == null && nullToAbsent
          ? const Value.absent()
          : Value(consolidateList),
      zodiac3dp1: zodiac3dp1 == null && nullToAbsent
          ? const Value.absent()
          : Value(zodiac3dp1),
      zodiac3dp2: zodiac3dp2 == null && nullToAbsent
          ? const Value.absent()
          : Value(zodiac3dp2),
      zodiac3dp3: zodiac3dp3 == null && nullToAbsent
          ? const Value.absent()
          : Value(zodiac3dp3),
      full4dList: full4dList == null && nullToAbsent
          ? const Value.absent()
          : Value(full4dList),
      p13p3d:
          p13p3d == null && nullToAbsent ? const Value.absent() : Value(p13p3d),
      p23p3d:
          p23p3d == null && nullToAbsent ? const Value.absent() : Value(p23p3d),
      p33p3d:
          p33p3d == null && nullToAbsent ? const Value.absent() : Value(p33p3d),
      starterList3p3d: starterList3p3d == null && nullToAbsent
          ? const Value.absent()
          : Value(starterList3p3d),
      consolidateList3p3d: consolidateList3p3d == null && nullToAbsent
          ? const Value.absent()
          : Value(consolidateList3p3d),
      full6dList: full6dList == null && nullToAbsent
          ? const Value.absent()
          : Value(full6dList),
    );
  }

  factory DmcEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DmcEntityData(
      id: serializer.fromJson<int>(json['id']),
      status: serializer.fromJson<String?>(json['status']),
      drawDate: serializer.fromJson<DateTime>(json['drawDate']),
      drawNo: serializer.fromJson<String?>(json['drawNo']),
      p1: serializer.fromJson<String?>(json['p1']),
      p2: serializer.fromJson<String?>(json['p2']),
      p3: serializer.fromJson<String?>(json['p3']),
      starterList: serializer.fromJson<List<String>?>(json['starterList']),
      consolidateList:
          serializer.fromJson<List<String>?>(json['consolidateList']),
      zodiac3dp1: serializer.fromJson<String?>(json['zodiac3dp1']),
      zodiac3dp2: serializer.fromJson<String?>(json['zodiac3dp2']),
      zodiac3dp3: serializer.fromJson<String?>(json['zodiac3dp3']),
      full4dList: serializer.fromJson<List<String>?>(json['full4dList']),
      p13p3d: serializer.fromJson<String?>(json['p13p3d']),
      p23p3d: serializer.fromJson<String?>(json['p23p3d']),
      p33p3d: serializer.fromJson<String?>(json['p33p3d']),
      starterList3p3d:
          serializer.fromJson<List<String>?>(json['starterList3p3d']),
      consolidateList3p3d:
          serializer.fromJson<List<String>?>(json['consolidateList3p3d']),
      full6dList: serializer.fromJson<List<String>?>(json['full6dList']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'status': serializer.toJson<String?>(status),
      'drawDate': serializer.toJson<DateTime>(drawDate),
      'drawNo': serializer.toJson<String?>(drawNo),
      'p1': serializer.toJson<String?>(p1),
      'p2': serializer.toJson<String?>(p2),
      'p3': serializer.toJson<String?>(p3),
      'starterList': serializer.toJson<List<String>?>(starterList),
      'consolidateList': serializer.toJson<List<String>?>(consolidateList),
      'zodiac3dp1': serializer.toJson<String?>(zodiac3dp1),
      'zodiac3dp2': serializer.toJson<String?>(zodiac3dp2),
      'zodiac3dp3': serializer.toJson<String?>(zodiac3dp3),
      'full4dList': serializer.toJson<List<String>?>(full4dList),
      'p13p3d': serializer.toJson<String?>(p13p3d),
      'p23p3d': serializer.toJson<String?>(p23p3d),
      'p33p3d': serializer.toJson<String?>(p33p3d),
      'starterList3p3d': serializer.toJson<List<String>?>(starterList3p3d),
      'consolidateList3p3d':
          serializer.toJson<List<String>?>(consolidateList3p3d),
      'full6dList': serializer.toJson<List<String>?>(full6dList),
    };
  }

  DmcEntityData copyWith(
          {int? id,
          Value<String?> status = const Value.absent(),
          DateTime? drawDate,
          Value<String?> drawNo = const Value.absent(),
          Value<String?> p1 = const Value.absent(),
          Value<String?> p2 = const Value.absent(),
          Value<String?> p3 = const Value.absent(),
          Value<List<String>?> starterList = const Value.absent(),
          Value<List<String>?> consolidateList = const Value.absent(),
          Value<String?> zodiac3dp1 = const Value.absent(),
          Value<String?> zodiac3dp2 = const Value.absent(),
          Value<String?> zodiac3dp3 = const Value.absent(),
          Value<List<String>?> full4dList = const Value.absent(),
          Value<String?> p13p3d = const Value.absent(),
          Value<String?> p23p3d = const Value.absent(),
          Value<String?> p33p3d = const Value.absent(),
          Value<List<String>?> starterList3p3d = const Value.absent(),
          Value<List<String>?> consolidateList3p3d = const Value.absent(),
          Value<List<String>?> full6dList = const Value.absent()}) =>
      DmcEntityData(
        id: id ?? this.id,
        status: status.present ? status.value : this.status,
        drawDate: drawDate ?? this.drawDate,
        drawNo: drawNo.present ? drawNo.value : this.drawNo,
        p1: p1.present ? p1.value : this.p1,
        p2: p2.present ? p2.value : this.p2,
        p3: p3.present ? p3.value : this.p3,
        starterList: starterList.present ? starterList.value : this.starterList,
        consolidateList: consolidateList.present
            ? consolidateList.value
            : this.consolidateList,
        zodiac3dp1: zodiac3dp1.present ? zodiac3dp1.value : this.zodiac3dp1,
        zodiac3dp2: zodiac3dp2.present ? zodiac3dp2.value : this.zodiac3dp2,
        zodiac3dp3: zodiac3dp3.present ? zodiac3dp3.value : this.zodiac3dp3,
        full4dList: full4dList.present ? full4dList.value : this.full4dList,
        p13p3d: p13p3d.present ? p13p3d.value : this.p13p3d,
        p23p3d: p23p3d.present ? p23p3d.value : this.p23p3d,
        p33p3d: p33p3d.present ? p33p3d.value : this.p33p3d,
        starterList3p3d: starterList3p3d.present
            ? starterList3p3d.value
            : this.starterList3p3d,
        consolidateList3p3d: consolidateList3p3d.present
            ? consolidateList3p3d.value
            : this.consolidateList3p3d,
        full6dList: full6dList.present ? full6dList.value : this.full6dList,
      );
  @override
  String toString() {
    return (StringBuffer('DmcEntityData(')
          ..write('id: $id, ')
          ..write('status: $status, ')
          ..write('drawDate: $drawDate, ')
          ..write('drawNo: $drawNo, ')
          ..write('p1: $p1, ')
          ..write('p2: $p2, ')
          ..write('p3: $p3, ')
          ..write('starterList: $starterList, ')
          ..write('consolidateList: $consolidateList, ')
          ..write('zodiac3dp1: $zodiac3dp1, ')
          ..write('zodiac3dp2: $zodiac3dp2, ')
          ..write('zodiac3dp3: $zodiac3dp3, ')
          ..write('full4dList: $full4dList, ')
          ..write('p13p3d: $p13p3d, ')
          ..write('p23p3d: $p23p3d, ')
          ..write('p33p3d: $p33p3d, ')
          ..write('starterList3p3d: $starterList3p3d, ')
          ..write('consolidateList3p3d: $consolidateList3p3d, ')
          ..write('full6dList: $full6dList')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      status,
      drawDate,
      drawNo,
      p1,
      p2,
      p3,
      starterList,
      consolidateList,
      zodiac3dp1,
      zodiac3dp2,
      zodiac3dp3,
      full4dList,
      p13p3d,
      p23p3d,
      p33p3d,
      starterList3p3d,
      consolidateList3p3d,
      full6dList);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DmcEntityData &&
          other.id == this.id &&
          other.status == this.status &&
          other.drawDate == this.drawDate &&
          other.drawNo == this.drawNo &&
          other.p1 == this.p1 &&
          other.p2 == this.p2 &&
          other.p3 == this.p3 &&
          other.starterList == this.starterList &&
          other.consolidateList == this.consolidateList &&
          other.zodiac3dp1 == this.zodiac3dp1 &&
          other.zodiac3dp2 == this.zodiac3dp2 &&
          other.zodiac3dp3 == this.zodiac3dp3 &&
          other.full4dList == this.full4dList &&
          other.p13p3d == this.p13p3d &&
          other.p23p3d == this.p23p3d &&
          other.p33p3d == this.p33p3d &&
          other.starterList3p3d == this.starterList3p3d &&
          other.consolidateList3p3d == this.consolidateList3p3d &&
          other.full6dList == this.full6dList);
}

class DmcEntityCompanion extends UpdateCompanion<DmcEntityData> {
  final Value<int> id;
  final Value<String?> status;
  final Value<DateTime> drawDate;
  final Value<String?> drawNo;
  final Value<String?> p1;
  final Value<String?> p2;
  final Value<String?> p3;
  final Value<List<String>?> starterList;
  final Value<List<String>?> consolidateList;
  final Value<String?> zodiac3dp1;
  final Value<String?> zodiac3dp2;
  final Value<String?> zodiac3dp3;
  final Value<List<String>?> full4dList;
  final Value<String?> p13p3d;
  final Value<String?> p23p3d;
  final Value<String?> p33p3d;
  final Value<List<String>?> starterList3p3d;
  final Value<List<String>?> consolidateList3p3d;
  final Value<List<String>?> full6dList;
  const DmcEntityCompanion({
    this.id = const Value.absent(),
    this.status = const Value.absent(),
    this.drawDate = const Value.absent(),
    this.drawNo = const Value.absent(),
    this.p1 = const Value.absent(),
    this.p2 = const Value.absent(),
    this.p3 = const Value.absent(),
    this.starterList = const Value.absent(),
    this.consolidateList = const Value.absent(),
    this.zodiac3dp1 = const Value.absent(),
    this.zodiac3dp2 = const Value.absent(),
    this.zodiac3dp3 = const Value.absent(),
    this.full4dList = const Value.absent(),
    this.p13p3d = const Value.absent(),
    this.p23p3d = const Value.absent(),
    this.p33p3d = const Value.absent(),
    this.starterList3p3d = const Value.absent(),
    this.consolidateList3p3d = const Value.absent(),
    this.full6dList = const Value.absent(),
  });
  DmcEntityCompanion.insert({
    this.id = const Value.absent(),
    this.status = const Value.absent(),
    required DateTime drawDate,
    this.drawNo = const Value.absent(),
    this.p1 = const Value.absent(),
    this.p2 = const Value.absent(),
    this.p3 = const Value.absent(),
    this.starterList = const Value.absent(),
    this.consolidateList = const Value.absent(),
    this.zodiac3dp1 = const Value.absent(),
    this.zodiac3dp2 = const Value.absent(),
    this.zodiac3dp3 = const Value.absent(),
    this.full4dList = const Value.absent(),
    this.p13p3d = const Value.absent(),
    this.p23p3d = const Value.absent(),
    this.p33p3d = const Value.absent(),
    this.starterList3p3d = const Value.absent(),
    this.consolidateList3p3d = const Value.absent(),
    this.full6dList = const Value.absent(),
  }) : drawDate = Value(drawDate);
  static Insertable<DmcEntityData> custom({
    Expression<int>? id,
    Expression<String>? status,
    Expression<DateTime>? drawDate,
    Expression<String>? drawNo,
    Expression<String>? p1,
    Expression<String>? p2,
    Expression<String>? p3,
    Expression<String>? starterList,
    Expression<String>? consolidateList,
    Expression<String>? zodiac3dp1,
    Expression<String>? zodiac3dp2,
    Expression<String>? zodiac3dp3,
    Expression<String>? full4dList,
    Expression<String>? p13p3d,
    Expression<String>? p23p3d,
    Expression<String>? p33p3d,
    Expression<String>? starterList3p3d,
    Expression<String>? consolidateList3p3d,
    Expression<String>? full6dList,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (status != null) 'status': status,
      if (drawDate != null) 'draw_date': drawDate,
      if (drawNo != null) 'draw_no': drawNo,
      if (p1 != null) 'p1': p1,
      if (p2 != null) 'p2': p2,
      if (p3 != null) 'p3': p3,
      if (starterList != null) 'starter_list': starterList,
      if (consolidateList != null) 'consolidate_list': consolidateList,
      if (zodiac3dp1 != null) 'zodiac3dp1': zodiac3dp1,
      if (zodiac3dp2 != null) 'zodiac3dp2': zodiac3dp2,
      if (zodiac3dp3 != null) 'zodiac3dp3': zodiac3dp3,
      if (full4dList != null) 'full4d_list': full4dList,
      if (p13p3d != null) 'p13p3d': p13p3d,
      if (p23p3d != null) 'p23p3d': p23p3d,
      if (p33p3d != null) 'p33p3d': p33p3d,
      if (starterList3p3d != null) 'starter_list3p3d': starterList3p3d,
      if (consolidateList3p3d != null)
        'consolidate_list3p3d': consolidateList3p3d,
      if (full6dList != null) 'full6d_list': full6dList,
    });
  }

  DmcEntityCompanion copyWith(
      {Value<int>? id,
      Value<String?>? status,
      Value<DateTime>? drawDate,
      Value<String?>? drawNo,
      Value<String?>? p1,
      Value<String?>? p2,
      Value<String?>? p3,
      Value<List<String>?>? starterList,
      Value<List<String>?>? consolidateList,
      Value<String?>? zodiac3dp1,
      Value<String?>? zodiac3dp2,
      Value<String?>? zodiac3dp3,
      Value<List<String>?>? full4dList,
      Value<String?>? p13p3d,
      Value<String?>? p23p3d,
      Value<String?>? p33p3d,
      Value<List<String>?>? starterList3p3d,
      Value<List<String>?>? consolidateList3p3d,
      Value<List<String>?>? full6dList}) {
    return DmcEntityCompanion(
      id: id ?? this.id,
      status: status ?? this.status,
      drawDate: drawDate ?? this.drawDate,
      drawNo: drawNo ?? this.drawNo,
      p1: p1 ?? this.p1,
      p2: p2 ?? this.p2,
      p3: p3 ?? this.p3,
      starterList: starterList ?? this.starterList,
      consolidateList: consolidateList ?? this.consolidateList,
      zodiac3dp1: zodiac3dp1 ?? this.zodiac3dp1,
      zodiac3dp2: zodiac3dp2 ?? this.zodiac3dp2,
      zodiac3dp3: zodiac3dp3 ?? this.zodiac3dp3,
      full4dList: full4dList ?? this.full4dList,
      p13p3d: p13p3d ?? this.p13p3d,
      p23p3d: p23p3d ?? this.p23p3d,
      p33p3d: p33p3d ?? this.p33p3d,
      starterList3p3d: starterList3p3d ?? this.starterList3p3d,
      consolidateList3p3d: consolidateList3p3d ?? this.consolidateList3p3d,
      full6dList: full6dList ?? this.full6dList,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (drawDate.present) {
      map['draw_date'] = Variable<DateTime>(drawDate.value);
    }
    if (drawNo.present) {
      map['draw_no'] = Variable<String>(drawNo.value);
    }
    if (p1.present) {
      map['p1'] = Variable<String>(p1.value);
    }
    if (p2.present) {
      map['p2'] = Variable<String>(p2.value);
    }
    if (p3.present) {
      map['p3'] = Variable<String>(p3.value);
    }
    if (starterList.present) {
      final converter = $DmcEntityTable.$converterstarterListn;

      map['starter_list'] =
          Variable<String>(converter.toSql(starterList.value));
    }
    if (consolidateList.present) {
      final converter = $DmcEntityTable.$converterconsolidateListn;

      map['consolidate_list'] =
          Variable<String>(converter.toSql(consolidateList.value));
    }
    if (zodiac3dp1.present) {
      map['zodiac3dp1'] = Variable<String>(zodiac3dp1.value);
    }
    if (zodiac3dp2.present) {
      map['zodiac3dp2'] = Variable<String>(zodiac3dp2.value);
    }
    if (zodiac3dp3.present) {
      map['zodiac3dp3'] = Variable<String>(zodiac3dp3.value);
    }
    if (full4dList.present) {
      final converter = $DmcEntityTable.$converterfull4dListn;

      map['full4d_list'] = Variable<String>(converter.toSql(full4dList.value));
    }
    if (p13p3d.present) {
      map['p13p3d'] = Variable<String>(p13p3d.value);
    }
    if (p23p3d.present) {
      map['p23p3d'] = Variable<String>(p23p3d.value);
    }
    if (p33p3d.present) {
      map['p33p3d'] = Variable<String>(p33p3d.value);
    }
    if (starterList3p3d.present) {
      final converter = $DmcEntityTable.$converterstarterList3p3dn;

      map['starter_list3p3d'] =
          Variable<String>(converter.toSql(starterList3p3d.value));
    }
    if (consolidateList3p3d.present) {
      final converter = $DmcEntityTable.$converterconsolidateList3p3dn;

      map['consolidate_list3p3d'] =
          Variable<String>(converter.toSql(consolidateList3p3d.value));
    }
    if (full6dList.present) {
      final converter = $DmcEntityTable.$converterfull6dListn;

      map['full6d_list'] = Variable<String>(converter.toSql(full6dList.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DmcEntityCompanion(')
          ..write('id: $id, ')
          ..write('status: $status, ')
          ..write('drawDate: $drawDate, ')
          ..write('drawNo: $drawNo, ')
          ..write('p1: $p1, ')
          ..write('p2: $p2, ')
          ..write('p3: $p3, ')
          ..write('starterList: $starterList, ')
          ..write('consolidateList: $consolidateList, ')
          ..write('zodiac3dp1: $zodiac3dp1, ')
          ..write('zodiac3dp2: $zodiac3dp2, ')
          ..write('zodiac3dp3: $zodiac3dp3, ')
          ..write('full4dList: $full4dList, ')
          ..write('p13p3d: $p13p3d, ')
          ..write('p23p3d: $p23p3d, ')
          ..write('p33p3d: $p33p3d, ')
          ..write('starterList3p3d: $starterList3p3d, ')
          ..write('consolidateList3p3d: $consolidateList3p3d, ')
          ..write('full6dList: $full6dList')
          ..write(')'))
        .toString();
  }
}

class $DmcHotEntityTable extends DmcHotEntity
    with TableInfo<$DmcHotEntityTable, DmcHotEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DmcHotEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _parentNumberMeta =
      const VerificationMeta('parentNumber');
  @override
  late final GeneratedColumn<String> parentNumber = GeneratedColumn<String>(
      'parent_number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<String> number = GeneratedColumn<String>(
      'number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _occurrencesMeta =
      const VerificationMeta('occurrences');
  @override
  late final GeneratedColumn<int> occurrences = GeneratedColumn<int>(
      'occurrences', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _drawDateMeta =
      const VerificationMeta('drawDate');
  @override
  late final GeneratedColumn<DateTime> drawDate = GeneratedColumn<DateTime>(
      'draw_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _hotNumberTypeIndexMeta =
      const VerificationMeta('hotNumberTypeIndex');
  @override
  late final GeneratedColumn<int> hotNumberTypeIndex = GeneratedColumn<int>(
      'hot_number_type_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _timePeriodIndexMeta =
      const VerificationMeta('timePeriodIndex');
  @override
  late final GeneratedColumn<int> timePeriodIndex = GeneratedColumn<int>(
      'time_period_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        parentNumber,
        number,
        occurrences,
        drawDate,
        hotNumberTypeIndex,
        timePeriodIndex
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dmc_hot_entity';
  @override
  VerificationContext validateIntegrity(Insertable<DmcHotEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('parent_number')) {
      context.handle(
          _parentNumberMeta,
          parentNumber.isAcceptableOrUnknown(
              data['parent_number']!, _parentNumberMeta));
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('occurrences')) {
      context.handle(
          _occurrencesMeta,
          occurrences.isAcceptableOrUnknown(
              data['occurrences']!, _occurrencesMeta));
    } else if (isInserting) {
      context.missing(_occurrencesMeta);
    }
    if (data.containsKey('draw_date')) {
      context.handle(_drawDateMeta,
          drawDate.isAcceptableOrUnknown(data['draw_date']!, _drawDateMeta));
    }
    if (data.containsKey('hot_number_type_index')) {
      context.handle(
          _hotNumberTypeIndexMeta,
          hotNumberTypeIndex.isAcceptableOrUnknown(
              data['hot_number_type_index']!, _hotNumberTypeIndexMeta));
    } else if (isInserting) {
      context.missing(_hotNumberTypeIndexMeta);
    }
    if (data.containsKey('time_period_index')) {
      context.handle(
          _timePeriodIndexMeta,
          timePeriodIndex.isAcceptableOrUnknown(
              data['time_period_index']!, _timePeriodIndexMeta));
    } else if (isInserting) {
      context.missing(_timePeriodIndexMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DmcHotEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DmcHotEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      parentNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parent_number']),
      number: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}number'])!,
      occurrences: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}occurrences'])!,
      drawDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}draw_date']),
      hotNumberTypeIndex: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}hot_number_type_index'])!,
      timePeriodIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}time_period_index'])!,
    );
  }

  @override
  $DmcHotEntityTable createAlias(String alias) {
    return $DmcHotEntityTable(attachedDatabase, alias);
  }
}

class DmcHotEntityData extends DataClass
    implements Insertable<DmcHotEntityData> {
  final int id;
  final String? parentNumber;
  final String number;
  final int occurrences;
  final DateTime? drawDate;
  final int hotNumberTypeIndex;
  final int timePeriodIndex;
  const DmcHotEntityData(
      {required this.id,
      this.parentNumber,
      required this.number,
      required this.occurrences,
      this.drawDate,
      required this.hotNumberTypeIndex,
      required this.timePeriodIndex});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || parentNumber != null) {
      map['parent_number'] = Variable<String>(parentNumber);
    }
    map['number'] = Variable<String>(number);
    map['occurrences'] = Variable<int>(occurrences);
    if (!nullToAbsent || drawDate != null) {
      map['draw_date'] = Variable<DateTime>(drawDate);
    }
    map['hot_number_type_index'] = Variable<int>(hotNumberTypeIndex);
    map['time_period_index'] = Variable<int>(timePeriodIndex);
    return map;
  }

  DmcHotEntityCompanion toCompanion(bool nullToAbsent) {
    return DmcHotEntityCompanion(
      id: Value(id),
      parentNumber: parentNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(parentNumber),
      number: Value(number),
      occurrences: Value(occurrences),
      drawDate: drawDate == null && nullToAbsent
          ? const Value.absent()
          : Value(drawDate),
      hotNumberTypeIndex: Value(hotNumberTypeIndex),
      timePeriodIndex: Value(timePeriodIndex),
    );
  }

  factory DmcHotEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DmcHotEntityData(
      id: serializer.fromJson<int>(json['id']),
      parentNumber: serializer.fromJson<String?>(json['parentNumber']),
      number: serializer.fromJson<String>(json['number']),
      occurrences: serializer.fromJson<int>(json['occurrences']),
      drawDate: serializer.fromJson<DateTime?>(json['drawDate']),
      hotNumberTypeIndex: serializer.fromJson<int>(json['hotNumberTypeIndex']),
      timePeriodIndex: serializer.fromJson<int>(json['timePeriodIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'parentNumber': serializer.toJson<String?>(parentNumber),
      'number': serializer.toJson<String>(number),
      'occurrences': serializer.toJson<int>(occurrences),
      'drawDate': serializer.toJson<DateTime?>(drawDate),
      'hotNumberTypeIndex': serializer.toJson<int>(hotNumberTypeIndex),
      'timePeriodIndex': serializer.toJson<int>(timePeriodIndex),
    };
  }

  DmcHotEntityData copyWith(
          {int? id,
          Value<String?> parentNumber = const Value.absent(),
          String? number,
          int? occurrences,
          Value<DateTime?> drawDate = const Value.absent(),
          int? hotNumberTypeIndex,
          int? timePeriodIndex}) =>
      DmcHotEntityData(
        id: id ?? this.id,
        parentNumber:
            parentNumber.present ? parentNumber.value : this.parentNumber,
        number: number ?? this.number,
        occurrences: occurrences ?? this.occurrences,
        drawDate: drawDate.present ? drawDate.value : this.drawDate,
        hotNumberTypeIndex: hotNumberTypeIndex ?? this.hotNumberTypeIndex,
        timePeriodIndex: timePeriodIndex ?? this.timePeriodIndex,
      );
  @override
  String toString() {
    return (StringBuffer('DmcHotEntityData(')
          ..write('id: $id, ')
          ..write('parentNumber: $parentNumber, ')
          ..write('number: $number, ')
          ..write('occurrences: $occurrences, ')
          ..write('drawDate: $drawDate, ')
          ..write('hotNumberTypeIndex: $hotNumberTypeIndex, ')
          ..write('timePeriodIndex: $timePeriodIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, parentNumber, number, occurrences,
      drawDate, hotNumberTypeIndex, timePeriodIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DmcHotEntityData &&
          other.id == this.id &&
          other.parentNumber == this.parentNumber &&
          other.number == this.number &&
          other.occurrences == this.occurrences &&
          other.drawDate == this.drawDate &&
          other.hotNumberTypeIndex == this.hotNumberTypeIndex &&
          other.timePeriodIndex == this.timePeriodIndex);
}

class DmcHotEntityCompanion extends UpdateCompanion<DmcHotEntityData> {
  final Value<int> id;
  final Value<String?> parentNumber;
  final Value<String> number;
  final Value<int> occurrences;
  final Value<DateTime?> drawDate;
  final Value<int> hotNumberTypeIndex;
  final Value<int> timePeriodIndex;
  const DmcHotEntityCompanion({
    this.id = const Value.absent(),
    this.parentNumber = const Value.absent(),
    this.number = const Value.absent(),
    this.occurrences = const Value.absent(),
    this.drawDate = const Value.absent(),
    this.hotNumberTypeIndex = const Value.absent(),
    this.timePeriodIndex = const Value.absent(),
  });
  DmcHotEntityCompanion.insert({
    this.id = const Value.absent(),
    this.parentNumber = const Value.absent(),
    required String number,
    required int occurrences,
    this.drawDate = const Value.absent(),
    required int hotNumberTypeIndex,
    required int timePeriodIndex,
  })  : number = Value(number),
        occurrences = Value(occurrences),
        hotNumberTypeIndex = Value(hotNumberTypeIndex),
        timePeriodIndex = Value(timePeriodIndex);
  static Insertable<DmcHotEntityData> custom({
    Expression<int>? id,
    Expression<String>? parentNumber,
    Expression<String>? number,
    Expression<int>? occurrences,
    Expression<DateTime>? drawDate,
    Expression<int>? hotNumberTypeIndex,
    Expression<int>? timePeriodIndex,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (parentNumber != null) 'parent_number': parentNumber,
      if (number != null) 'number': number,
      if (occurrences != null) 'occurrences': occurrences,
      if (drawDate != null) 'draw_date': drawDate,
      if (hotNumberTypeIndex != null)
        'hot_number_type_index': hotNumberTypeIndex,
      if (timePeriodIndex != null) 'time_period_index': timePeriodIndex,
    });
  }

  DmcHotEntityCompanion copyWith(
      {Value<int>? id,
      Value<String?>? parentNumber,
      Value<String>? number,
      Value<int>? occurrences,
      Value<DateTime?>? drawDate,
      Value<int>? hotNumberTypeIndex,
      Value<int>? timePeriodIndex}) {
    return DmcHotEntityCompanion(
      id: id ?? this.id,
      parentNumber: parentNumber ?? this.parentNumber,
      number: number ?? this.number,
      occurrences: occurrences ?? this.occurrences,
      drawDate: drawDate ?? this.drawDate,
      hotNumberTypeIndex: hotNumberTypeIndex ?? this.hotNumberTypeIndex,
      timePeriodIndex: timePeriodIndex ?? this.timePeriodIndex,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (parentNumber.present) {
      map['parent_number'] = Variable<String>(parentNumber.value);
    }
    if (number.present) {
      map['number'] = Variable<String>(number.value);
    }
    if (occurrences.present) {
      map['occurrences'] = Variable<int>(occurrences.value);
    }
    if (drawDate.present) {
      map['draw_date'] = Variable<DateTime>(drawDate.value);
    }
    if (hotNumberTypeIndex.present) {
      map['hot_number_type_index'] = Variable<int>(hotNumberTypeIndex.value);
    }
    if (timePeriodIndex.present) {
      map['time_period_index'] = Variable<int>(timePeriodIndex.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DmcHotEntityCompanion(')
          ..write('id: $id, ')
          ..write('parentNumber: $parentNumber, ')
          ..write('number: $number, ')
          ..write('occurrences: $occurrences, ')
          ..write('drawDate: $drawDate, ')
          ..write('hotNumberTypeIndex: $hotNumberTypeIndex, ')
          ..write('timePeriodIndex: $timePeriodIndex')
          ..write(')'))
        .toString();
  }
}

class $MyHistoryEntityTable extends MyHistoryEntity
    with TableInfo<$MyHistoryEntityTable, MyHistoryEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MyHistoryEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _moduleTypeIdMeta =
      const VerificationMeta('moduleTypeId');
  @override
  late final GeneratedColumn<int> moduleTypeId = GeneratedColumn<int>(
      'module_type_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateGeneratedMeta =
      const VerificationMeta('dateGenerated');
  @override
  late final GeneratedColumn<DateTime> dateGenerated =
      GeneratedColumn<DateTime>('date_generated', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<String> number = GeneratedColumn<String>(
      'number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _drawNoMeta = const VerificationMeta('drawNo');
  @override
  late final GeneratedColumn<String> drawNo = GeneratedColumn<String>(
      'draw_no', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _winStatusIdMeta =
      const VerificationMeta('winStatusId');
  @override
  late final GeneratedColumn<int> winStatusId = GeneratedColumn<int>(
      'win_status_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, moduleTypeId, dateGenerated, number, drawNo, winStatusId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'my_history_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<MyHistoryEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('module_type_id')) {
      context.handle(
          _moduleTypeIdMeta,
          moduleTypeId.isAcceptableOrUnknown(
              data['module_type_id']!, _moduleTypeIdMeta));
    } else if (isInserting) {
      context.missing(_moduleTypeIdMeta);
    }
    if (data.containsKey('date_generated')) {
      context.handle(
          _dateGeneratedMeta,
          dateGenerated.isAcceptableOrUnknown(
              data['date_generated']!, _dateGeneratedMeta));
    } else if (isInserting) {
      context.missing(_dateGeneratedMeta);
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('draw_no')) {
      context.handle(_drawNoMeta,
          drawNo.isAcceptableOrUnknown(data['draw_no']!, _drawNoMeta));
    }
    if (data.containsKey('win_status_id')) {
      context.handle(
          _winStatusIdMeta,
          winStatusId.isAcceptableOrUnknown(
              data['win_status_id']!, _winStatusIdMeta));
    } else if (isInserting) {
      context.missing(_winStatusIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MyHistoryEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MyHistoryEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      moduleTypeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}module_type_id'])!,
      dateGenerated: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}date_generated'])!,
      number: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}number'])!,
      drawNo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}draw_no']),
      winStatusId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}win_status_id'])!,
    );
  }

  @override
  $MyHistoryEntityTable createAlias(String alias) {
    return $MyHistoryEntityTable(attachedDatabase, alias);
  }
}

class MyHistoryEntityData extends DataClass
    implements Insertable<MyHistoryEntityData> {
  final int id;
  final int moduleTypeId;
  final DateTime dateGenerated;
  final String number;
  final String? drawNo;
  final int winStatusId;
  const MyHistoryEntityData(
      {required this.id,
      required this.moduleTypeId,
      required this.dateGenerated,
      required this.number,
      this.drawNo,
      required this.winStatusId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['module_type_id'] = Variable<int>(moduleTypeId);
    map['date_generated'] = Variable<DateTime>(dateGenerated);
    map['number'] = Variable<String>(number);
    if (!nullToAbsent || drawNo != null) {
      map['draw_no'] = Variable<String>(drawNo);
    }
    map['win_status_id'] = Variable<int>(winStatusId);
    return map;
  }

  MyHistoryEntityCompanion toCompanion(bool nullToAbsent) {
    return MyHistoryEntityCompanion(
      id: Value(id),
      moduleTypeId: Value(moduleTypeId),
      dateGenerated: Value(dateGenerated),
      number: Value(number),
      drawNo:
          drawNo == null && nullToAbsent ? const Value.absent() : Value(drawNo),
      winStatusId: Value(winStatusId),
    );
  }

  factory MyHistoryEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MyHistoryEntityData(
      id: serializer.fromJson<int>(json['id']),
      moduleTypeId: serializer.fromJson<int>(json['moduleTypeId']),
      dateGenerated: serializer.fromJson<DateTime>(json['dateGenerated']),
      number: serializer.fromJson<String>(json['number']),
      drawNo: serializer.fromJson<String?>(json['drawNo']),
      winStatusId: serializer.fromJson<int>(json['winStatusId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'moduleTypeId': serializer.toJson<int>(moduleTypeId),
      'dateGenerated': serializer.toJson<DateTime>(dateGenerated),
      'number': serializer.toJson<String>(number),
      'drawNo': serializer.toJson<String?>(drawNo),
      'winStatusId': serializer.toJson<int>(winStatusId),
    };
  }

  MyHistoryEntityData copyWith(
          {int? id,
          int? moduleTypeId,
          DateTime? dateGenerated,
          String? number,
          Value<String?> drawNo = const Value.absent(),
          int? winStatusId}) =>
      MyHistoryEntityData(
        id: id ?? this.id,
        moduleTypeId: moduleTypeId ?? this.moduleTypeId,
        dateGenerated: dateGenerated ?? this.dateGenerated,
        number: number ?? this.number,
        drawNo: drawNo.present ? drawNo.value : this.drawNo,
        winStatusId: winStatusId ?? this.winStatusId,
      );
  @override
  String toString() {
    return (StringBuffer('MyHistoryEntityData(')
          ..write('id: $id, ')
          ..write('moduleTypeId: $moduleTypeId, ')
          ..write('dateGenerated: $dateGenerated, ')
          ..write('number: $number, ')
          ..write('drawNo: $drawNo, ')
          ..write('winStatusId: $winStatusId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, moduleTypeId, dateGenerated, number, drawNo, winStatusId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MyHistoryEntityData &&
          other.id == this.id &&
          other.moduleTypeId == this.moduleTypeId &&
          other.dateGenerated == this.dateGenerated &&
          other.number == this.number &&
          other.drawNo == this.drawNo &&
          other.winStatusId == this.winStatusId);
}

class MyHistoryEntityCompanion extends UpdateCompanion<MyHistoryEntityData> {
  final Value<int> id;
  final Value<int> moduleTypeId;
  final Value<DateTime> dateGenerated;
  final Value<String> number;
  final Value<String?> drawNo;
  final Value<int> winStatusId;
  const MyHistoryEntityCompanion({
    this.id = const Value.absent(),
    this.moduleTypeId = const Value.absent(),
    this.dateGenerated = const Value.absent(),
    this.number = const Value.absent(),
    this.drawNo = const Value.absent(),
    this.winStatusId = const Value.absent(),
  });
  MyHistoryEntityCompanion.insert({
    this.id = const Value.absent(),
    required int moduleTypeId,
    required DateTime dateGenerated,
    required String number,
    this.drawNo = const Value.absent(),
    required int winStatusId,
  })  : moduleTypeId = Value(moduleTypeId),
        dateGenerated = Value(dateGenerated),
        number = Value(number),
        winStatusId = Value(winStatusId);
  static Insertable<MyHistoryEntityData> custom({
    Expression<int>? id,
    Expression<int>? moduleTypeId,
    Expression<DateTime>? dateGenerated,
    Expression<String>? number,
    Expression<String>? drawNo,
    Expression<int>? winStatusId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (moduleTypeId != null) 'module_type_id': moduleTypeId,
      if (dateGenerated != null) 'date_generated': dateGenerated,
      if (number != null) 'number': number,
      if (drawNo != null) 'draw_no': drawNo,
      if (winStatusId != null) 'win_status_id': winStatusId,
    });
  }

  MyHistoryEntityCompanion copyWith(
      {Value<int>? id,
      Value<int>? moduleTypeId,
      Value<DateTime>? dateGenerated,
      Value<String>? number,
      Value<String?>? drawNo,
      Value<int>? winStatusId}) {
    return MyHistoryEntityCompanion(
      id: id ?? this.id,
      moduleTypeId: moduleTypeId ?? this.moduleTypeId,
      dateGenerated: dateGenerated ?? this.dateGenerated,
      number: number ?? this.number,
      drawNo: drawNo ?? this.drawNo,
      winStatusId: winStatusId ?? this.winStatusId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (moduleTypeId.present) {
      map['module_type_id'] = Variable<int>(moduleTypeId.value);
    }
    if (dateGenerated.present) {
      map['date_generated'] = Variable<DateTime>(dateGenerated.value);
    }
    if (number.present) {
      map['number'] = Variable<String>(number.value);
    }
    if (drawNo.present) {
      map['draw_no'] = Variable<String>(drawNo.value);
    }
    if (winStatusId.present) {
      map['win_status_id'] = Variable<int>(winStatusId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MyHistoryEntityCompanion(')
          ..write('id: $id, ')
          ..write('moduleTypeId: $moduleTypeId, ')
          ..write('dateGenerated: $dateGenerated, ')
          ..write('number: $number, ')
          ..write('drawNo: $drawNo, ')
          ..write('winStatusId: $winStatusId')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $DmcEntityTable dmcEntity = $DmcEntityTable(this);
  late final $DmcHotEntityTable dmcHotEntity = $DmcHotEntityTable(this);
  late final $MyHistoryEntityTable myHistoryEntity =
      $MyHistoryEntityTable(this);
  late final DmcDao dmcDao = DmcDao(this as MyDatabase);
  late final DmcHotDao dmcHotDao = DmcHotDao(this as MyDatabase);
  late final MyHistoryDao myHistoryDao = MyHistoryDao(this as MyDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [dmcEntity, dmcHotEntity, myHistoryEntity];
}
