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
  late final GeneratedColumn<String> drawDate = GeneratedColumn<String>(
      'draw_date', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
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
  String get aliasedName => _alias ?? 'dmc_entity';
  @override
  String get actualTableName => 'dmc_entity';
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
          .read(DriftSqlType.string, data['${effectivePrefix}draw_date']),
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
  final String? drawDate;
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
      this.drawDate,
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
    if (!nullToAbsent || drawDate != null) {
      map['draw_date'] = Variable<String>(drawDate);
    }
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
      drawDate: drawDate == null && nullToAbsent
          ? const Value.absent()
          : Value(drawDate),
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
      drawDate: serializer.fromJson<String?>(json['drawDate']),
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
      'drawDate': serializer.toJson<String?>(drawDate),
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
          Value<String?> drawDate = const Value.absent(),
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
        drawDate: drawDate.present ? drawDate.value : this.drawDate,
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
  final Value<String?> drawDate;
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
  static Insertable<DmcEntityData> custom({
    Expression<int>? id,
    Expression<String>? status,
    Expression<String>? drawDate,
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
      Value<String?>? drawDate,
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
      map['draw_date'] = Variable<String>(drawDate.value);
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

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $DmcEntityTable dmcEntity = $DmcEntityTable(this);
  late final DmcDao dmcDao = DmcDao(this as MyDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [dmcEntity];
}
