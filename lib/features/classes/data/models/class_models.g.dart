// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_models.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAcademicClassModelCollection on Isar {
  IsarCollection<AcademicClassModel> get academicClassModels =>
      this.collection();
}

const AcademicClassModelSchema = CollectionSchema(
  name: r'AcademicClassModel',
  id: 7613612497956859946,
  properties: {
    r'campus': PropertySchema(id: 0, name: r'campus', type: IsarType.string),
    r'classId': PropertySchema(id: 1, name: r'classId', type: IsarType.string),
    r'course': PropertySchema(id: 2, name: r'course', type: IsarType.string),
    r'name': PropertySchema(id: 3, name: r'name', type: IsarType.string),
    r'period': PropertySchema(id: 4, name: r'period', type: IsarType.long),
    r'updatedAt': PropertySchema(
      id: 5,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _academicClassModelEstimateSize,
  serialize: _academicClassModelSerialize,
  deserialize: _academicClassModelDeserialize,
  deserializeProp: _academicClassModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'classId': IndexSchema(
      id: 5352960816261817663,
      name: r'classId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'classId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _academicClassModelGetId,
  getLinks: _academicClassModelGetLinks,
  attach: _academicClassModelAttach,
  version: '3.3.2',
);

int _academicClassModelEstimateSize(
  AcademicClassModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.campus.length * 3;
  bytesCount += 3 + object.classId.length * 3;
  bytesCount += 3 + object.course.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _academicClassModelSerialize(
  AcademicClassModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.campus);
  writer.writeString(offsets[1], object.classId);
  writer.writeString(offsets[2], object.course);
  writer.writeString(offsets[3], object.name);
  writer.writeLong(offsets[4], object.period);
  writer.writeDateTime(offsets[5], object.updatedAt);
}

AcademicClassModel _academicClassModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AcademicClassModel();
  object.campus = reader.readString(offsets[0]);
  object.classId = reader.readString(offsets[1]);
  object.course = reader.readString(offsets[2]);
  object.id = id;
  object.name = reader.readString(offsets[3]);
  object.period = reader.readLong(offsets[4]);
  object.updatedAt = reader.readDateTime(offsets[5]);
  return object;
}

P _academicClassModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _academicClassModelGetId(AcademicClassModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _academicClassModelGetLinks(
  AcademicClassModel object,
) {
  return [];
}

void _academicClassModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  AcademicClassModel object,
) {
  object.id = id;
}

extension AcademicClassModelByIndex on IsarCollection<AcademicClassModel> {
  Future<AcademicClassModel?> getByClassId(String classId) {
    return getByIndex(r'classId', [classId]);
  }

  AcademicClassModel? getByClassIdSync(String classId) {
    return getByIndexSync(r'classId', [classId]);
  }

  Future<bool> deleteByClassId(String classId) {
    return deleteByIndex(r'classId', [classId]);
  }

  bool deleteByClassIdSync(String classId) {
    return deleteByIndexSync(r'classId', [classId]);
  }

  Future<List<AcademicClassModel?>> getAllByClassId(
    List<String> classIdValues,
  ) {
    final values = classIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'classId', values);
  }

  List<AcademicClassModel?> getAllByClassIdSync(List<String> classIdValues) {
    final values = classIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'classId', values);
  }

  Future<int> deleteAllByClassId(List<String> classIdValues) {
    final values = classIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'classId', values);
  }

  int deleteAllByClassIdSync(List<String> classIdValues) {
    final values = classIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'classId', values);
  }

  Future<Id> putByClassId(AcademicClassModel object) {
    return putByIndex(r'classId', object);
  }

  Id putByClassIdSync(AcademicClassModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'classId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByClassId(List<AcademicClassModel> objects) {
    return putAllByIndex(r'classId', objects);
  }

  List<Id> putAllByClassIdSync(
    List<AcademicClassModel> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'classId', objects, saveLinks: saveLinks);
  }
}

extension AcademicClassModelQueryWhereSort
    on QueryBuilder<AcademicClassModel, AcademicClassModel, QWhere> {
  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AcademicClassModelQueryWhere
    on QueryBuilder<AcademicClassModel, AcademicClassModel, QWhereClause> {
  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterWhereClause>
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterWhereClause>
  idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterWhereClause>
  classIdEqualTo(String classId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'classId', value: [classId]),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterWhereClause>
  classIdNotEqualTo(String classId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'classId',
                lower: [],
                upper: [classId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'classId',
                lower: [classId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'classId',
                lower: [classId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'classId',
                lower: [],
                upper: [classId],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension AcademicClassModelQueryFilter
    on QueryBuilder<AcademicClassModel, AcademicClassModel, QFilterCondition> {
  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  campusEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'campus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  campusGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'campus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  campusLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'campus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  campusBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'campus',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  campusStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'campus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  campusEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'campus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  campusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'campus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  campusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'campus',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  campusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'campus', value: ''),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  campusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'campus', value: ''),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  classIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'classId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  classIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'classId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  classIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'classId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  classIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'classId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  classIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'classId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  classIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'classId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  classIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'classId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  classIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'classId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  classIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'classId', value: ''),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  classIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'classId', value: ''),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  courseEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'course',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  courseGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'course',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  courseLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'course',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  courseBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'course',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  courseStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'course',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  courseEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'course',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  courseContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'course',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  courseMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'course',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  courseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'course', value: ''),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  courseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'course', value: ''),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  nameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'name',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  nameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  nameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'name',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  periodEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'period', value: value),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  periodGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'period',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  periodLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'period',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  periodBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'period',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  updatedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  updatedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterFilterCondition>
  updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'updatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension AcademicClassModelQueryObject
    on QueryBuilder<AcademicClassModel, AcademicClassModel, QFilterCondition> {}

extension AcademicClassModelQueryLinks
    on QueryBuilder<AcademicClassModel, AcademicClassModel, QFilterCondition> {}

extension AcademicClassModelQuerySortBy
    on QueryBuilder<AcademicClassModel, AcademicClassModel, QSortBy> {
  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterSortBy>
  sortByCampus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'campus', Sort.asc);
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterSortBy>
  sortByCampusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'campus', Sort.desc);
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterSortBy>
  sortByClassId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classId', Sort.asc);
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterSortBy>
  sortByClassIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classId', Sort.desc);
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterSortBy>
  sortByCourse() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'course', Sort.asc);
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterSortBy>
  sortByCourseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'course', Sort.desc);
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterSortBy>
  sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterSortBy>
  sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterSortBy>
  sortByPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'period', Sort.asc);
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterSortBy>
  sortByPeriodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'period', Sort.desc);
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterSortBy>
  sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension AcademicClassModelQuerySortThenBy
    on QueryBuilder<AcademicClassModel, AcademicClassModel, QSortThenBy> {
  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterSortBy>
  thenByCampus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'campus', Sort.asc);
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterSortBy>
  thenByCampusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'campus', Sort.desc);
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterSortBy>
  thenByClassId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classId', Sort.asc);
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterSortBy>
  thenByClassIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classId', Sort.desc);
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterSortBy>
  thenByCourse() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'course', Sort.asc);
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterSortBy>
  thenByCourseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'course', Sort.desc);
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterSortBy>
  thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterSortBy>
  thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterSortBy>
  thenByPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'period', Sort.asc);
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterSortBy>
  thenByPeriodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'period', Sort.desc);
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterSortBy>
  thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension AcademicClassModelQueryWhereDistinct
    on QueryBuilder<AcademicClassModel, AcademicClassModel, QDistinct> {
  QueryBuilder<AcademicClassModel, AcademicClassModel, QDistinct>
  distinctByCampus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'campus', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QDistinct>
  distinctByClassId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'classId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QDistinct>
  distinctByCourse({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'course', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QDistinct>
  distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QDistinct>
  distinctByPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'period');
    });
  }

  QueryBuilder<AcademicClassModel, AcademicClassModel, QDistinct>
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension AcademicClassModelQueryProperty
    on QueryBuilder<AcademicClassModel, AcademicClassModel, QQueryProperty> {
  QueryBuilder<AcademicClassModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AcademicClassModel, String, QQueryOperations> campusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'campus');
    });
  }

  QueryBuilder<AcademicClassModel, String, QQueryOperations> classIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'classId');
    });
  }

  QueryBuilder<AcademicClassModel, String, QQueryOperations> courseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'course');
    });
  }

  QueryBuilder<AcademicClassModel, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<AcademicClassModel, int, QQueryOperations> periodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'period');
    });
  }

  QueryBuilder<AcademicClassModel, DateTime, QQueryOperations>
  updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetStudentPublicProfileModelCollection on Isar {
  IsarCollection<StudentPublicProfileModel> get studentPublicProfileModels =>
      this.collection();
}

const StudentPublicProfileModelSchema = CollectionSchema(
  name: r'StudentPublicProfileModel',
  id: -9099864456029330979,
  properties: {
    r'accuracyRate': PropertySchema(
      id: 0,
      name: r'accuracyRate',
      type: IsarType.double,
    ),
    r'classId': PropertySchema(id: 1, name: r'classId', type: IsarType.string),
    r'completedExercises': PropertySchema(
      id: 2,
      name: r'completedExercises',
      type: IsarType.long,
    ),
    r'level': PropertySchema(id: 3, name: r'level', type: IsarType.long),
    r'masteryRate': PropertySchema(
      id: 4,
      name: r'masteryRate',
      type: IsarType.double,
    ),
    r'name': PropertySchema(id: 5, name: r'name', type: IsarType.string),
    r'overallProgress': PropertySchema(
      id: 6,
      name: r'overallProgress',
      type: IsarType.double,
    ),
    r'primaryBadgeIds': PropertySchema(
      id: 7,
      name: r'primaryBadgeIds',
      type: IsarType.stringList,
    ),
    r'streakDays': PropertySchema(
      id: 8,
      name: r'streakDays',
      type: IsarType.long,
    ),
    r'studentId': PropertySchema(
      id: 9,
      name: r'studentId',
      type: IsarType.string,
    ),
    r'topicMetricsJson': PropertySchema(
      id: 10,
      name: r'topicMetricsJson',
      type: IsarType.string,
    ),
    r'totalStudyTimeMilliseconds': PropertySchema(
      id: 11,
      name: r'totalStudyTimeMilliseconds',
      type: IsarType.long,
    ),
    r'totalXp': PropertySchema(id: 12, name: r'totalXp', type: IsarType.long),
    r'updatedAt': PropertySchema(
      id: 13,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _studentPublicProfileModelEstimateSize,
  serialize: _studentPublicProfileModelSerialize,
  deserialize: _studentPublicProfileModelDeserialize,
  deserializeProp: _studentPublicProfileModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'studentId': IndexSchema(
      id: -6791323312898281473,
      name: r'studentId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'studentId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'classId': IndexSchema(
      id: 5352960816261817663,
      name: r'classId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'classId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _studentPublicProfileModelGetId,
  getLinks: _studentPublicProfileModelGetLinks,
  attach: _studentPublicProfileModelAttach,
  version: '3.3.2',
);

int _studentPublicProfileModelEstimateSize(
  StudentPublicProfileModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.classId.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.primaryBadgeIds.length * 3;
  {
    for (var i = 0; i < object.primaryBadgeIds.length; i++) {
      final value = object.primaryBadgeIds[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.studentId.length * 3;
  bytesCount += 3 + object.topicMetricsJson.length * 3;
  return bytesCount;
}

void _studentPublicProfileModelSerialize(
  StudentPublicProfileModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.accuracyRate);
  writer.writeString(offsets[1], object.classId);
  writer.writeLong(offsets[2], object.completedExercises);
  writer.writeLong(offsets[3], object.level);
  writer.writeDouble(offsets[4], object.masteryRate);
  writer.writeString(offsets[5], object.name);
  writer.writeDouble(offsets[6], object.overallProgress);
  writer.writeStringList(offsets[7], object.primaryBadgeIds);
  writer.writeLong(offsets[8], object.streakDays);
  writer.writeString(offsets[9], object.studentId);
  writer.writeString(offsets[10], object.topicMetricsJson);
  writer.writeLong(offsets[11], object.totalStudyTimeMilliseconds);
  writer.writeLong(offsets[12], object.totalXp);
  writer.writeDateTime(offsets[13], object.updatedAt);
}

StudentPublicProfileModel _studentPublicProfileModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StudentPublicProfileModel();
  object.accuracyRate = reader.readDouble(offsets[0]);
  object.classId = reader.readString(offsets[1]);
  object.completedExercises = reader.readLong(offsets[2]);
  object.id = id;
  object.level = reader.readLong(offsets[3]);
  object.masteryRate = reader.readDouble(offsets[4]);
  object.name = reader.readString(offsets[5]);
  object.overallProgress = reader.readDouble(offsets[6]);
  object.primaryBadgeIds = reader.readStringList(offsets[7]) ?? [];
  object.streakDays = reader.readLong(offsets[8]);
  object.studentId = reader.readString(offsets[9]);
  object.topicMetricsJson = reader.readString(offsets[10]);
  object.totalStudyTimeMilliseconds = reader.readLong(offsets[11]);
  object.totalXp = reader.readLong(offsets[12]);
  object.updatedAt = reader.readDateTime(offsets[13]);
  return object;
}

P _studentPublicProfileModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readStringList(offset) ?? []) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _studentPublicProfileModelGetId(StudentPublicProfileModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _studentPublicProfileModelGetLinks(
  StudentPublicProfileModel object,
) {
  return [];
}

void _studentPublicProfileModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  StudentPublicProfileModel object,
) {
  object.id = id;
}

extension StudentPublicProfileModelByIndex
    on IsarCollection<StudentPublicProfileModel> {
  Future<StudentPublicProfileModel?> getByStudentId(String studentId) {
    return getByIndex(r'studentId', [studentId]);
  }

  StudentPublicProfileModel? getByStudentIdSync(String studentId) {
    return getByIndexSync(r'studentId', [studentId]);
  }

  Future<bool> deleteByStudentId(String studentId) {
    return deleteByIndex(r'studentId', [studentId]);
  }

  bool deleteByStudentIdSync(String studentId) {
    return deleteByIndexSync(r'studentId', [studentId]);
  }

  Future<List<StudentPublicProfileModel?>> getAllByStudentId(
    List<String> studentIdValues,
  ) {
    final values = studentIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'studentId', values);
  }

  List<StudentPublicProfileModel?> getAllByStudentIdSync(
    List<String> studentIdValues,
  ) {
    final values = studentIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'studentId', values);
  }

  Future<int> deleteAllByStudentId(List<String> studentIdValues) {
    final values = studentIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'studentId', values);
  }

  int deleteAllByStudentIdSync(List<String> studentIdValues) {
    final values = studentIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'studentId', values);
  }

  Future<Id> putByStudentId(StudentPublicProfileModel object) {
    return putByIndex(r'studentId', object);
  }

  Id putByStudentIdSync(
    StudentPublicProfileModel object, {
    bool saveLinks = true,
  }) {
    return putByIndexSync(r'studentId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByStudentId(List<StudentPublicProfileModel> objects) {
    return putAllByIndex(r'studentId', objects);
  }

  List<Id> putAllByStudentIdSync(
    List<StudentPublicProfileModel> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'studentId', objects, saveLinks: saveLinks);
  }
}

extension StudentPublicProfileModelQueryWhereSort
    on
        QueryBuilder<
          StudentPublicProfileModel,
          StudentPublicProfileModel,
          QWhere
        > {
  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterWhere
  >
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension StudentPublicProfileModelQueryWhere
    on
        QueryBuilder<
          StudentPublicProfileModel,
          StudentPublicProfileModel,
          QWhereClause
        > {
  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterWhereClause
  >
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterWhereClause
  >
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterWhereClause
  >
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterWhereClause
  >
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterWhereClause
  >
  idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterWhereClause
  >
  studentIdEqualTo(String studentId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'studentId', value: [studentId]),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterWhereClause
  >
  studentIdNotEqualTo(String studentId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'studentId',
                lower: [],
                upper: [studentId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'studentId',
                lower: [studentId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'studentId',
                lower: [studentId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'studentId',
                lower: [],
                upper: [studentId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterWhereClause
  >
  classIdEqualTo(String classId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'classId', value: [classId]),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterWhereClause
  >
  classIdNotEqualTo(String classId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'classId',
                lower: [],
                upper: [classId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'classId',
                lower: [classId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'classId',
                lower: [classId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'classId',
                lower: [],
                upper: [classId],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension StudentPublicProfileModelQueryFilter
    on
        QueryBuilder<
          StudentPublicProfileModel,
          StudentPublicProfileModel,
          QFilterCondition
        > {
  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  accuracyRateEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'accuracyRate',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  accuracyRateGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'accuracyRate',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  accuracyRateLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'accuracyRate',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  accuracyRateBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'accuracyRate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  classIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'classId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  classIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'classId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  classIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'classId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  classIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'classId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  classIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'classId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  classIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'classId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  classIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'classId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  classIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'classId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  classIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'classId', value: ''),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  classIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'classId', value: ''),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  completedExercisesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'completedExercises', value: value),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  completedExercisesGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'completedExercises',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  completedExercisesLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'completedExercises',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  completedExercisesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'completedExercises',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  levelEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'level', value: value),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  levelGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'level',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  levelLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'level',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  levelBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'level',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  masteryRateEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'masteryRate',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  masteryRateGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'masteryRate',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  masteryRateLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'masteryRate',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  masteryRateBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'masteryRate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  nameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'name',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  nameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  nameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'name',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  overallProgressEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'overallProgress',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  overallProgressGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'overallProgress',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  overallProgressLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'overallProgress',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  overallProgressBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'overallProgress',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  primaryBadgeIdsElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'primaryBadgeIds',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  primaryBadgeIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'primaryBadgeIds',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  primaryBadgeIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'primaryBadgeIds',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  primaryBadgeIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'primaryBadgeIds',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  primaryBadgeIdsElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'primaryBadgeIds',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  primaryBadgeIdsElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'primaryBadgeIds',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  primaryBadgeIdsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'primaryBadgeIds',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  primaryBadgeIdsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'primaryBadgeIds',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  primaryBadgeIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'primaryBadgeIds', value: ''),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  primaryBadgeIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'primaryBadgeIds', value: ''),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  primaryBadgeIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'primaryBadgeIds', length, true, length, true);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  primaryBadgeIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'primaryBadgeIds', 0, true, 0, true);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  primaryBadgeIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'primaryBadgeIds', 0, false, 999999, true);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  primaryBadgeIdsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'primaryBadgeIds', 0, true, length, include);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  primaryBadgeIdsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'primaryBadgeIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  primaryBadgeIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'primaryBadgeIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  streakDaysEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'streakDays', value: value),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  streakDaysGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'streakDays',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  streakDaysLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'streakDays',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  streakDaysBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'streakDays',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  studentIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'studentId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  studentIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'studentId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  studentIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'studentId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  studentIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'studentId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  studentIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'studentId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  studentIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'studentId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  studentIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'studentId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  studentIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'studentId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  studentIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'studentId', value: ''),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  studentIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'studentId', value: ''),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  topicMetricsJsonEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'topicMetricsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  topicMetricsJsonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'topicMetricsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  topicMetricsJsonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'topicMetricsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  topicMetricsJsonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'topicMetricsJson',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  topicMetricsJsonStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'topicMetricsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  topicMetricsJsonEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'topicMetricsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  topicMetricsJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'topicMetricsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  topicMetricsJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'topicMetricsJson',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  topicMetricsJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'topicMetricsJson', value: ''),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  topicMetricsJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'topicMetricsJson', value: ''),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  totalStudyTimeMillisecondsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'totalStudyTimeMilliseconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  totalStudyTimeMillisecondsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalStudyTimeMilliseconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  totalStudyTimeMillisecondsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalStudyTimeMilliseconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  totalStudyTimeMillisecondsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalStudyTimeMilliseconds',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  totalXpEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'totalXp', value: value),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  totalXpGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalXp',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  totalXpLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalXp',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  totalXpBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalXp',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  updatedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  updatedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterFilterCondition
  >
  updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'updatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension StudentPublicProfileModelQueryObject
    on
        QueryBuilder<
          StudentPublicProfileModel,
          StudentPublicProfileModel,
          QFilterCondition
        > {}

extension StudentPublicProfileModelQueryLinks
    on
        QueryBuilder<
          StudentPublicProfileModel,
          StudentPublicProfileModel,
          QFilterCondition
        > {}

extension StudentPublicProfileModelQuerySortBy
    on
        QueryBuilder<
          StudentPublicProfileModel,
          StudentPublicProfileModel,
          QSortBy
        > {
  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  sortByAccuracyRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracyRate', Sort.asc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  sortByAccuracyRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracyRate', Sort.desc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  sortByClassId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classId', Sort.asc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  sortByClassIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classId', Sort.desc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  sortByCompletedExercises() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedExercises', Sort.asc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  sortByCompletedExercisesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedExercises', Sort.desc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  sortByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  sortByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  sortByMasteryRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'masteryRate', Sort.asc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  sortByMasteryRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'masteryRate', Sort.desc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  sortByOverallProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallProgress', Sort.asc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  sortByOverallProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallProgress', Sort.desc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  sortByStreakDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streakDays', Sort.asc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  sortByStreakDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streakDays', Sort.desc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  sortByStudentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentId', Sort.asc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  sortByStudentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentId', Sort.desc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  sortByTopicMetricsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topicMetricsJson', Sort.asc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  sortByTopicMetricsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topicMetricsJson', Sort.desc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  sortByTotalStudyTimeMilliseconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStudyTimeMilliseconds', Sort.asc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  sortByTotalStudyTimeMillisecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStudyTimeMilliseconds', Sort.desc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  sortByTotalXp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalXp', Sort.asc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  sortByTotalXpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalXp', Sort.desc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension StudentPublicProfileModelQuerySortThenBy
    on
        QueryBuilder<
          StudentPublicProfileModel,
          StudentPublicProfileModel,
          QSortThenBy
        > {
  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  thenByAccuracyRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracyRate', Sort.asc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  thenByAccuracyRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracyRate', Sort.desc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  thenByClassId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classId', Sort.asc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  thenByClassIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classId', Sort.desc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  thenByCompletedExercises() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedExercises', Sort.asc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  thenByCompletedExercisesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedExercises', Sort.desc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  thenByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  thenByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  thenByMasteryRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'masteryRate', Sort.asc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  thenByMasteryRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'masteryRate', Sort.desc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  thenByOverallProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallProgress', Sort.asc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  thenByOverallProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallProgress', Sort.desc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  thenByStreakDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streakDays', Sort.asc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  thenByStreakDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streakDays', Sort.desc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  thenByStudentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentId', Sort.asc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  thenByStudentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentId', Sort.desc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  thenByTopicMetricsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topicMetricsJson', Sort.asc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  thenByTopicMetricsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topicMetricsJson', Sort.desc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  thenByTotalStudyTimeMilliseconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStudyTimeMilliseconds', Sort.asc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  thenByTotalStudyTimeMillisecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStudyTimeMilliseconds', Sort.desc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  thenByTotalXp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalXp', Sort.asc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  thenByTotalXpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalXp', Sort.desc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<
    StudentPublicProfileModel,
    StudentPublicProfileModel,
    QAfterSortBy
  >
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension StudentPublicProfileModelQueryWhereDistinct
    on
        QueryBuilder<
          StudentPublicProfileModel,
          StudentPublicProfileModel,
          QDistinct
        > {
  QueryBuilder<StudentPublicProfileModel, StudentPublicProfileModel, QDistinct>
  distinctByAccuracyRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accuracyRate');
    });
  }

  QueryBuilder<StudentPublicProfileModel, StudentPublicProfileModel, QDistinct>
  distinctByClassId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'classId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StudentPublicProfileModel, StudentPublicProfileModel, QDistinct>
  distinctByCompletedExercises() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedExercises');
    });
  }

  QueryBuilder<StudentPublicProfileModel, StudentPublicProfileModel, QDistinct>
  distinctByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'level');
    });
  }

  QueryBuilder<StudentPublicProfileModel, StudentPublicProfileModel, QDistinct>
  distinctByMasteryRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'masteryRate');
    });
  }

  QueryBuilder<StudentPublicProfileModel, StudentPublicProfileModel, QDistinct>
  distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StudentPublicProfileModel, StudentPublicProfileModel, QDistinct>
  distinctByOverallProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'overallProgress');
    });
  }

  QueryBuilder<StudentPublicProfileModel, StudentPublicProfileModel, QDistinct>
  distinctByPrimaryBadgeIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'primaryBadgeIds');
    });
  }

  QueryBuilder<StudentPublicProfileModel, StudentPublicProfileModel, QDistinct>
  distinctByStreakDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'streakDays');
    });
  }

  QueryBuilder<StudentPublicProfileModel, StudentPublicProfileModel, QDistinct>
  distinctByStudentId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'studentId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StudentPublicProfileModel, StudentPublicProfileModel, QDistinct>
  distinctByTopicMetricsJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'topicMetricsJson',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<StudentPublicProfileModel, StudentPublicProfileModel, QDistinct>
  distinctByTotalStudyTimeMilliseconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalStudyTimeMilliseconds');
    });
  }

  QueryBuilder<StudentPublicProfileModel, StudentPublicProfileModel, QDistinct>
  distinctByTotalXp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalXp');
    });
  }

  QueryBuilder<StudentPublicProfileModel, StudentPublicProfileModel, QDistinct>
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension StudentPublicProfileModelQueryProperty
    on
        QueryBuilder<
          StudentPublicProfileModel,
          StudentPublicProfileModel,
          QQueryProperty
        > {
  QueryBuilder<StudentPublicProfileModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<StudentPublicProfileModel, double, QQueryOperations>
  accuracyRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accuracyRate');
    });
  }

  QueryBuilder<StudentPublicProfileModel, String, QQueryOperations>
  classIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'classId');
    });
  }

  QueryBuilder<StudentPublicProfileModel, int, QQueryOperations>
  completedExercisesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedExercises');
    });
  }

  QueryBuilder<StudentPublicProfileModel, int, QQueryOperations>
  levelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'level');
    });
  }

  QueryBuilder<StudentPublicProfileModel, double, QQueryOperations>
  masteryRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'masteryRate');
    });
  }

  QueryBuilder<StudentPublicProfileModel, String, QQueryOperations>
  nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<StudentPublicProfileModel, double, QQueryOperations>
  overallProgressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'overallProgress');
    });
  }

  QueryBuilder<StudentPublicProfileModel, List<String>, QQueryOperations>
  primaryBadgeIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'primaryBadgeIds');
    });
  }

  QueryBuilder<StudentPublicProfileModel, int, QQueryOperations>
  streakDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'streakDays');
    });
  }

  QueryBuilder<StudentPublicProfileModel, String, QQueryOperations>
  studentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'studentId');
    });
  }

  QueryBuilder<StudentPublicProfileModel, String, QQueryOperations>
  topicMetricsJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'topicMetricsJson');
    });
  }

  QueryBuilder<StudentPublicProfileModel, int, QQueryOperations>
  totalStudyTimeMillisecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalStudyTimeMilliseconds');
    });
  }

  QueryBuilder<StudentPublicProfileModel, int, QQueryOperations>
  totalXpProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalXp');
    });
  }

  QueryBuilder<StudentPublicProfileModel, DateTime, QQueryOperations>
  updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetClassRankingModelCollection on Isar {
  IsarCollection<ClassRankingModel> get classRankingModels => this.collection();
}

const ClassRankingModelSchema = CollectionSchema(
  name: r'ClassRankingModel',
  id: -960293369199988873,
  properties: {
    r'calculatedAt': PropertySchema(
      id: 0,
      name: r'calculatedAt',
      type: IsarType.dateTime,
    ),
    r'classId': PropertySchema(id: 1, name: r'classId', type: IsarType.string),
    r'entriesJson': PropertySchema(
      id: 2,
      name: r'entriesJson',
      type: IsarType.string,
    ),
  },

  estimateSize: _classRankingModelEstimateSize,
  serialize: _classRankingModelSerialize,
  deserialize: _classRankingModelDeserialize,
  deserializeProp: _classRankingModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'classId': IndexSchema(
      id: 5352960816261817663,
      name: r'classId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'classId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _classRankingModelGetId,
  getLinks: _classRankingModelGetLinks,
  attach: _classRankingModelAttach,
  version: '3.3.2',
);

int _classRankingModelEstimateSize(
  ClassRankingModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.classId.length * 3;
  bytesCount += 3 + object.entriesJson.length * 3;
  return bytesCount;
}

void _classRankingModelSerialize(
  ClassRankingModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.calculatedAt);
  writer.writeString(offsets[1], object.classId);
  writer.writeString(offsets[2], object.entriesJson);
}

ClassRankingModel _classRankingModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ClassRankingModel();
  object.calculatedAt = reader.readDateTime(offsets[0]);
  object.classId = reader.readString(offsets[1]);
  object.entriesJson = reader.readString(offsets[2]);
  object.id = id;
  return object;
}

P _classRankingModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _classRankingModelGetId(ClassRankingModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _classRankingModelGetLinks(
  ClassRankingModel object,
) {
  return [];
}

void _classRankingModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  ClassRankingModel object,
) {
  object.id = id;
}

extension ClassRankingModelByIndex on IsarCollection<ClassRankingModel> {
  Future<ClassRankingModel?> getByClassId(String classId) {
    return getByIndex(r'classId', [classId]);
  }

  ClassRankingModel? getByClassIdSync(String classId) {
    return getByIndexSync(r'classId', [classId]);
  }

  Future<bool> deleteByClassId(String classId) {
    return deleteByIndex(r'classId', [classId]);
  }

  bool deleteByClassIdSync(String classId) {
    return deleteByIndexSync(r'classId', [classId]);
  }

  Future<List<ClassRankingModel?>> getAllByClassId(List<String> classIdValues) {
    final values = classIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'classId', values);
  }

  List<ClassRankingModel?> getAllByClassIdSync(List<String> classIdValues) {
    final values = classIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'classId', values);
  }

  Future<int> deleteAllByClassId(List<String> classIdValues) {
    final values = classIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'classId', values);
  }

  int deleteAllByClassIdSync(List<String> classIdValues) {
    final values = classIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'classId', values);
  }

  Future<Id> putByClassId(ClassRankingModel object) {
    return putByIndex(r'classId', object);
  }

  Id putByClassIdSync(ClassRankingModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'classId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByClassId(List<ClassRankingModel> objects) {
    return putAllByIndex(r'classId', objects);
  }

  List<Id> putAllByClassIdSync(
    List<ClassRankingModel> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'classId', objects, saveLinks: saveLinks);
  }
}

extension ClassRankingModelQueryWhereSort
    on QueryBuilder<ClassRankingModel, ClassRankingModel, QWhere> {
  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ClassRankingModelQueryWhere
    on QueryBuilder<ClassRankingModel, ClassRankingModel, QWhereClause> {
  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterWhereClause>
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterWhereClause>
  idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterWhereClause>
  classIdEqualTo(String classId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'classId', value: [classId]),
      );
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterWhereClause>
  classIdNotEqualTo(String classId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'classId',
                lower: [],
                upper: [classId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'classId',
                lower: [classId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'classId',
                lower: [classId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'classId',
                lower: [],
                upper: [classId],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension ClassRankingModelQueryFilter
    on QueryBuilder<ClassRankingModel, ClassRankingModel, QFilterCondition> {
  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterFilterCondition>
  calculatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'calculatedAt', value: value),
      );
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterFilterCondition>
  calculatedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'calculatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterFilterCondition>
  calculatedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'calculatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterFilterCondition>
  calculatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'calculatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterFilterCondition>
  classIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'classId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterFilterCondition>
  classIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'classId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterFilterCondition>
  classIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'classId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterFilterCondition>
  classIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'classId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterFilterCondition>
  classIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'classId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterFilterCondition>
  classIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'classId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterFilterCondition>
  classIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'classId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterFilterCondition>
  classIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'classId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterFilterCondition>
  classIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'classId', value: ''),
      );
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterFilterCondition>
  classIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'classId', value: ''),
      );
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterFilterCondition>
  entriesJsonEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'entriesJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterFilterCondition>
  entriesJsonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'entriesJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterFilterCondition>
  entriesJsonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'entriesJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterFilterCondition>
  entriesJsonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'entriesJson',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterFilterCondition>
  entriesJsonStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'entriesJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterFilterCondition>
  entriesJsonEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'entriesJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterFilterCondition>
  entriesJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'entriesJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterFilterCondition>
  entriesJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'entriesJson',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterFilterCondition>
  entriesJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'entriesJson', value: ''),
      );
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterFilterCondition>
  entriesJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'entriesJson', value: ''),
      );
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterFilterCondition>
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension ClassRankingModelQueryObject
    on QueryBuilder<ClassRankingModel, ClassRankingModel, QFilterCondition> {}

extension ClassRankingModelQueryLinks
    on QueryBuilder<ClassRankingModel, ClassRankingModel, QFilterCondition> {}

extension ClassRankingModelQuerySortBy
    on QueryBuilder<ClassRankingModel, ClassRankingModel, QSortBy> {
  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterSortBy>
  sortByCalculatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculatedAt', Sort.asc);
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterSortBy>
  sortByCalculatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculatedAt', Sort.desc);
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterSortBy>
  sortByClassId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classId', Sort.asc);
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterSortBy>
  sortByClassIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classId', Sort.desc);
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterSortBy>
  sortByEntriesJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entriesJson', Sort.asc);
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterSortBy>
  sortByEntriesJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entriesJson', Sort.desc);
    });
  }
}

extension ClassRankingModelQuerySortThenBy
    on QueryBuilder<ClassRankingModel, ClassRankingModel, QSortThenBy> {
  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterSortBy>
  thenByCalculatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculatedAt', Sort.asc);
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterSortBy>
  thenByCalculatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculatedAt', Sort.desc);
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterSortBy>
  thenByClassId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classId', Sort.asc);
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterSortBy>
  thenByClassIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classId', Sort.desc);
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterSortBy>
  thenByEntriesJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entriesJson', Sort.asc);
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterSortBy>
  thenByEntriesJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entriesJson', Sort.desc);
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension ClassRankingModelQueryWhereDistinct
    on QueryBuilder<ClassRankingModel, ClassRankingModel, QDistinct> {
  QueryBuilder<ClassRankingModel, ClassRankingModel, QDistinct>
  distinctByCalculatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'calculatedAt');
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QDistinct>
  distinctByClassId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'classId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClassRankingModel, ClassRankingModel, QDistinct>
  distinctByEntriesJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entriesJson', caseSensitive: caseSensitive);
    });
  }
}

extension ClassRankingModelQueryProperty
    on QueryBuilder<ClassRankingModel, ClassRankingModel, QQueryProperty> {
  QueryBuilder<ClassRankingModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ClassRankingModel, DateTime, QQueryOperations>
  calculatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'calculatedAt');
    });
  }

  QueryBuilder<ClassRankingModel, String, QQueryOperations> classIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'classId');
    });
  }

  QueryBuilder<ClassRankingModel, String, QQueryOperations>
  entriesJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entriesJson');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetClassStatisticsModelCollection on Isar {
  IsarCollection<ClassStatisticsModel> get classStatisticsModels =>
      this.collection();
}

const ClassStatisticsModelSchema = CollectionSchema(
  name: r'ClassStatisticsModel',
  id: 5451624496455169913,
  properties: {
    r'averageAccuracy': PropertySchema(
      id: 0,
      name: r'averageAccuracy',
      type: IsarType.double,
    ),
    r'averageProgress': PropertySchema(
      id: 1,
      name: r'averageProgress',
      type: IsarType.double,
    ),
    r'averageStreak': PropertySchema(
      id: 2,
      name: r'averageStreak',
      type: IsarType.double,
    ),
    r'averageStudyTimeMilliseconds': PropertySchema(
      id: 3,
      name: r'averageStudyTimeMilliseconds',
      type: IsarType.long,
    ),
    r'averageXp': PropertySchema(
      id: 4,
      name: r'averageXp',
      type: IsarType.double,
    ),
    r'calculatedAt': PropertySchema(
      id: 5,
      name: r'calculatedAt',
      type: IsarType.dateTime,
    ),
    r'classId': PropertySchema(id: 6, name: r'classId', type: IsarType.string),
    r'highlightStudentId': PropertySchema(
      id: 7,
      name: r'highlightStudentId',
      type: IsarType.string,
    ),
    r'mostDifficultTopicId': PropertySchema(
      id: 8,
      name: r'mostDifficultTopicId',
      type: IsarType.string,
    ),
    r'mostMasteredTopicId': PropertySchema(
      id: 9,
      name: r'mostMasteredTopicId',
      type: IsarType.string,
    ),
    r'totalCompletedExercises': PropertySchema(
      id: 10,
      name: r'totalCompletedExercises',
      type: IsarType.long,
    ),
    r'totalStudents': PropertySchema(
      id: 11,
      name: r'totalStudents',
      type: IsarType.long,
    ),
  },

  estimateSize: _classStatisticsModelEstimateSize,
  serialize: _classStatisticsModelSerialize,
  deserialize: _classStatisticsModelDeserialize,
  deserializeProp: _classStatisticsModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'classId': IndexSchema(
      id: 5352960816261817663,
      name: r'classId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'classId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _classStatisticsModelGetId,
  getLinks: _classStatisticsModelGetLinks,
  attach: _classStatisticsModelAttach,
  version: '3.3.2',
);

int _classStatisticsModelEstimateSize(
  ClassStatisticsModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.classId.length * 3;
  {
    final value = object.highlightStudentId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.mostDifficultTopicId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.mostMasteredTopicId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _classStatisticsModelSerialize(
  ClassStatisticsModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.averageAccuracy);
  writer.writeDouble(offsets[1], object.averageProgress);
  writer.writeDouble(offsets[2], object.averageStreak);
  writer.writeLong(offsets[3], object.averageStudyTimeMilliseconds);
  writer.writeDouble(offsets[4], object.averageXp);
  writer.writeDateTime(offsets[5], object.calculatedAt);
  writer.writeString(offsets[6], object.classId);
  writer.writeString(offsets[7], object.highlightStudentId);
  writer.writeString(offsets[8], object.mostDifficultTopicId);
  writer.writeString(offsets[9], object.mostMasteredTopicId);
  writer.writeLong(offsets[10], object.totalCompletedExercises);
  writer.writeLong(offsets[11], object.totalStudents);
}

ClassStatisticsModel _classStatisticsModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ClassStatisticsModel();
  object.averageAccuracy = reader.readDouble(offsets[0]);
  object.averageProgress = reader.readDouble(offsets[1]);
  object.averageStreak = reader.readDouble(offsets[2]);
  object.averageStudyTimeMilliseconds = reader.readLong(offsets[3]);
  object.averageXp = reader.readDouble(offsets[4]);
  object.calculatedAt = reader.readDateTime(offsets[5]);
  object.classId = reader.readString(offsets[6]);
  object.highlightStudentId = reader.readStringOrNull(offsets[7]);
  object.id = id;
  object.mostDifficultTopicId = reader.readStringOrNull(offsets[8]);
  object.mostMasteredTopicId = reader.readStringOrNull(offsets[9]);
  object.totalCompletedExercises = reader.readLong(offsets[10]);
  object.totalStudents = reader.readLong(offsets[11]);
  return object;
}

P _classStatisticsModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _classStatisticsModelGetId(ClassStatisticsModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _classStatisticsModelGetLinks(
  ClassStatisticsModel object,
) {
  return [];
}

void _classStatisticsModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  ClassStatisticsModel object,
) {
  object.id = id;
}

extension ClassStatisticsModelByIndex on IsarCollection<ClassStatisticsModel> {
  Future<ClassStatisticsModel?> getByClassId(String classId) {
    return getByIndex(r'classId', [classId]);
  }

  ClassStatisticsModel? getByClassIdSync(String classId) {
    return getByIndexSync(r'classId', [classId]);
  }

  Future<bool> deleteByClassId(String classId) {
    return deleteByIndex(r'classId', [classId]);
  }

  bool deleteByClassIdSync(String classId) {
    return deleteByIndexSync(r'classId', [classId]);
  }

  Future<List<ClassStatisticsModel?>> getAllByClassId(
    List<String> classIdValues,
  ) {
    final values = classIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'classId', values);
  }

  List<ClassStatisticsModel?> getAllByClassIdSync(List<String> classIdValues) {
    final values = classIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'classId', values);
  }

  Future<int> deleteAllByClassId(List<String> classIdValues) {
    final values = classIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'classId', values);
  }

  int deleteAllByClassIdSync(List<String> classIdValues) {
    final values = classIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'classId', values);
  }

  Future<Id> putByClassId(ClassStatisticsModel object) {
    return putByIndex(r'classId', object);
  }

  Id putByClassIdSync(ClassStatisticsModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'classId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByClassId(List<ClassStatisticsModel> objects) {
    return putAllByIndex(r'classId', objects);
  }

  List<Id> putAllByClassIdSync(
    List<ClassStatisticsModel> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'classId', objects, saveLinks: saveLinks);
  }
}

extension ClassStatisticsModelQueryWhereSort
    on QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QWhere> {
  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterWhere>
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ClassStatisticsModelQueryWhere
    on QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QWhereClause> {
  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterWhereClause>
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterWhereClause>
  idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterWhereClause>
  classIdEqualTo(String classId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'classId', value: [classId]),
      );
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterWhereClause>
  classIdNotEqualTo(String classId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'classId',
                lower: [],
                upper: [classId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'classId',
                lower: [classId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'classId',
                lower: [classId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'classId',
                lower: [],
                upper: [classId],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension ClassStatisticsModelQueryFilter
    on
        QueryBuilder<
          ClassStatisticsModel,
          ClassStatisticsModel,
          QFilterCondition
        > {
  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  averageAccuracyEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'averageAccuracy',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  averageAccuracyGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'averageAccuracy',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  averageAccuracyLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'averageAccuracy',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  averageAccuracyBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'averageAccuracy',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  averageProgressEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'averageProgress',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  averageProgressGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'averageProgress',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  averageProgressLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'averageProgress',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  averageProgressBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'averageProgress',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  averageStreakEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'averageStreak',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  averageStreakGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'averageStreak',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  averageStreakLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'averageStreak',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  averageStreakBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'averageStreak',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  averageStudyTimeMillisecondsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'averageStudyTimeMilliseconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  averageStudyTimeMillisecondsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'averageStudyTimeMilliseconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  averageStudyTimeMillisecondsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'averageStudyTimeMilliseconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  averageStudyTimeMillisecondsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'averageStudyTimeMilliseconds',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  averageXpEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'averageXp',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  averageXpGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'averageXp',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  averageXpLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'averageXp',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  averageXpBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'averageXp',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  calculatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'calculatedAt', value: value),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  calculatedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'calculatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  calculatedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'calculatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  calculatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'calculatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  classIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'classId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  classIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'classId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  classIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'classId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  classIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'classId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  classIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'classId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  classIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'classId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  classIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'classId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  classIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'classId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  classIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'classId', value: ''),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  classIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'classId', value: ''),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  highlightStudentIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'highlightStudentId'),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  highlightStudentIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'highlightStudentId'),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  highlightStudentIdEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'highlightStudentId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  highlightStudentIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'highlightStudentId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  highlightStudentIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'highlightStudentId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  highlightStudentIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'highlightStudentId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  highlightStudentIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'highlightStudentId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  highlightStudentIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'highlightStudentId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  highlightStudentIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'highlightStudentId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  highlightStudentIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'highlightStudentId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  highlightStudentIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'highlightStudentId', value: ''),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  highlightStudentIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'highlightStudentId', value: ''),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  mostDifficultTopicIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'mostDifficultTopicId'),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  mostDifficultTopicIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'mostDifficultTopicId'),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  mostDifficultTopicIdEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'mostDifficultTopicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  mostDifficultTopicIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'mostDifficultTopicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  mostDifficultTopicIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'mostDifficultTopicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  mostDifficultTopicIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'mostDifficultTopicId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  mostDifficultTopicIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'mostDifficultTopicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  mostDifficultTopicIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'mostDifficultTopicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  mostDifficultTopicIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'mostDifficultTopicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  mostDifficultTopicIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'mostDifficultTopicId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  mostDifficultTopicIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'mostDifficultTopicId', value: ''),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  mostDifficultTopicIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          property: r'mostDifficultTopicId',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  mostMasteredTopicIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'mostMasteredTopicId'),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  mostMasteredTopicIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'mostMasteredTopicId'),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  mostMasteredTopicIdEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'mostMasteredTopicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  mostMasteredTopicIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'mostMasteredTopicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  mostMasteredTopicIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'mostMasteredTopicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  mostMasteredTopicIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'mostMasteredTopicId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  mostMasteredTopicIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'mostMasteredTopicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  mostMasteredTopicIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'mostMasteredTopicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  mostMasteredTopicIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'mostMasteredTopicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  mostMasteredTopicIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'mostMasteredTopicId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  mostMasteredTopicIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'mostMasteredTopicId', value: ''),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  mostMasteredTopicIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          property: r'mostMasteredTopicId',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  totalCompletedExercisesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'totalCompletedExercises',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  totalCompletedExercisesGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalCompletedExercises',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  totalCompletedExercisesLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalCompletedExercises',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  totalCompletedExercisesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalCompletedExercises',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  totalStudentsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'totalStudents', value: value),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  totalStudentsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalStudents',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  totalStudentsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalStudents',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    ClassStatisticsModel,
    ClassStatisticsModel,
    QAfterFilterCondition
  >
  totalStudentsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalStudents',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension ClassStatisticsModelQueryObject
    on
        QueryBuilder<
          ClassStatisticsModel,
          ClassStatisticsModel,
          QFilterCondition
        > {}

extension ClassStatisticsModelQueryLinks
    on
        QueryBuilder<
          ClassStatisticsModel,
          ClassStatisticsModel,
          QFilterCondition
        > {}

extension ClassStatisticsModelQuerySortBy
    on QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QSortBy> {
  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  sortByAverageAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageAccuracy', Sort.asc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  sortByAverageAccuracyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageAccuracy', Sort.desc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  sortByAverageProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageProgress', Sort.asc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  sortByAverageProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageProgress', Sort.desc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  sortByAverageStreak() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageStreak', Sort.asc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  sortByAverageStreakDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageStreak', Sort.desc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  sortByAverageStudyTimeMilliseconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageStudyTimeMilliseconds', Sort.asc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  sortByAverageStudyTimeMillisecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageStudyTimeMilliseconds', Sort.desc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  sortByAverageXp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageXp', Sort.asc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  sortByAverageXpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageXp', Sort.desc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  sortByCalculatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculatedAt', Sort.asc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  sortByCalculatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculatedAt', Sort.desc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  sortByClassId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classId', Sort.asc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  sortByClassIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classId', Sort.desc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  sortByHighlightStudentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'highlightStudentId', Sort.asc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  sortByHighlightStudentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'highlightStudentId', Sort.desc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  sortByMostDifficultTopicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mostDifficultTopicId', Sort.asc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  sortByMostDifficultTopicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mostDifficultTopicId', Sort.desc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  sortByMostMasteredTopicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mostMasteredTopicId', Sort.asc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  sortByMostMasteredTopicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mostMasteredTopicId', Sort.desc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  sortByTotalCompletedExercises() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCompletedExercises', Sort.asc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  sortByTotalCompletedExercisesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCompletedExercises', Sort.desc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  sortByTotalStudents() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStudents', Sort.asc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  sortByTotalStudentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStudents', Sort.desc);
    });
  }
}

extension ClassStatisticsModelQuerySortThenBy
    on QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QSortThenBy> {
  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  thenByAverageAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageAccuracy', Sort.asc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  thenByAverageAccuracyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageAccuracy', Sort.desc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  thenByAverageProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageProgress', Sort.asc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  thenByAverageProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageProgress', Sort.desc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  thenByAverageStreak() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageStreak', Sort.asc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  thenByAverageStreakDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageStreak', Sort.desc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  thenByAverageStudyTimeMilliseconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageStudyTimeMilliseconds', Sort.asc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  thenByAverageStudyTimeMillisecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageStudyTimeMilliseconds', Sort.desc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  thenByAverageXp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageXp', Sort.asc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  thenByAverageXpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageXp', Sort.desc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  thenByCalculatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculatedAt', Sort.asc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  thenByCalculatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculatedAt', Sort.desc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  thenByClassId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classId', Sort.asc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  thenByClassIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classId', Sort.desc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  thenByHighlightStudentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'highlightStudentId', Sort.asc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  thenByHighlightStudentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'highlightStudentId', Sort.desc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  thenByMostDifficultTopicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mostDifficultTopicId', Sort.asc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  thenByMostDifficultTopicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mostDifficultTopicId', Sort.desc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  thenByMostMasteredTopicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mostMasteredTopicId', Sort.asc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  thenByMostMasteredTopicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mostMasteredTopicId', Sort.desc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  thenByTotalCompletedExercises() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCompletedExercises', Sort.asc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  thenByTotalCompletedExercisesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCompletedExercises', Sort.desc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  thenByTotalStudents() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStudents', Sort.asc);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QAfterSortBy>
  thenByTotalStudentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStudents', Sort.desc);
    });
  }
}

extension ClassStatisticsModelQueryWhereDistinct
    on QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QDistinct> {
  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QDistinct>
  distinctByAverageAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'averageAccuracy');
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QDistinct>
  distinctByAverageProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'averageProgress');
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QDistinct>
  distinctByAverageStreak() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'averageStreak');
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QDistinct>
  distinctByAverageStudyTimeMilliseconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'averageStudyTimeMilliseconds');
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QDistinct>
  distinctByAverageXp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'averageXp');
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QDistinct>
  distinctByCalculatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'calculatedAt');
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QDistinct>
  distinctByClassId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'classId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QDistinct>
  distinctByHighlightStudentId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'highlightStudentId',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QDistinct>
  distinctByMostDifficultTopicId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'mostDifficultTopicId',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QDistinct>
  distinctByMostMasteredTopicId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'mostMasteredTopicId',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QDistinct>
  distinctByTotalCompletedExercises() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalCompletedExercises');
    });
  }

  QueryBuilder<ClassStatisticsModel, ClassStatisticsModel, QDistinct>
  distinctByTotalStudents() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalStudents');
    });
  }
}

extension ClassStatisticsModelQueryProperty
    on
        QueryBuilder<
          ClassStatisticsModel,
          ClassStatisticsModel,
          QQueryProperty
        > {
  QueryBuilder<ClassStatisticsModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ClassStatisticsModel, double, QQueryOperations>
  averageAccuracyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'averageAccuracy');
    });
  }

  QueryBuilder<ClassStatisticsModel, double, QQueryOperations>
  averageProgressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'averageProgress');
    });
  }

  QueryBuilder<ClassStatisticsModel, double, QQueryOperations>
  averageStreakProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'averageStreak');
    });
  }

  QueryBuilder<ClassStatisticsModel, int, QQueryOperations>
  averageStudyTimeMillisecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'averageStudyTimeMilliseconds');
    });
  }

  QueryBuilder<ClassStatisticsModel, double, QQueryOperations>
  averageXpProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'averageXp');
    });
  }

  QueryBuilder<ClassStatisticsModel, DateTime, QQueryOperations>
  calculatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'calculatedAt');
    });
  }

  QueryBuilder<ClassStatisticsModel, String, QQueryOperations>
  classIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'classId');
    });
  }

  QueryBuilder<ClassStatisticsModel, String?, QQueryOperations>
  highlightStudentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'highlightStudentId');
    });
  }

  QueryBuilder<ClassStatisticsModel, String?, QQueryOperations>
  mostDifficultTopicIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mostDifficultTopicId');
    });
  }

  QueryBuilder<ClassStatisticsModel, String?, QQueryOperations>
  mostMasteredTopicIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mostMasteredTopicId');
    });
  }

  QueryBuilder<ClassStatisticsModel, int, QQueryOperations>
  totalCompletedExercisesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalCompletedExercises');
    });
  }

  QueryBuilder<ClassStatisticsModel, int, QQueryOperations>
  totalStudentsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalStudents');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetStudentComparisonModelCollection on Isar {
  IsarCollection<StudentComparisonModel> get studentComparisonModels =>
      this.collection();
}

const StudentComparisonModelSchema = CollectionSchema(
  name: r'StudentComparisonModel',
  id: 3074979515388203734,
  properties: {
    r'calculatedAt': PropertySchema(
      id: 0,
      name: r'calculatedAt',
      type: IsarType.dateTime,
    ),
    r'classId': PropertySchema(id: 1, name: r'classId', type: IsarType.string),
    r'comparedStudentId': PropertySchema(
      id: 2,
      name: r'comparedStudentId',
      type: IsarType.string,
    ),
    r'comparisonKey': PropertySchema(
      id: 3,
      name: r'comparisonKey',
      type: IsarType.string,
    ),
    r'masteryDifference': PropertySchema(
      id: 4,
      name: r'masteryDifference',
      type: IsarType.double,
    ),
    r'progressDifference': PropertySchema(
      id: 5,
      name: r'progressDifference',
      type: IsarType.double,
    ),
    r'requesterId': PropertySchema(
      id: 6,
      name: r'requesterId',
      type: IsarType.string,
    ),
    r'streakDifference': PropertySchema(
      id: 7,
      name: r'streakDifference',
      type: IsarType.long,
    ),
    r'xpDifference': PropertySchema(
      id: 8,
      name: r'xpDifference',
      type: IsarType.long,
    ),
  },

  estimateSize: _studentComparisonModelEstimateSize,
  serialize: _studentComparisonModelSerialize,
  deserialize: _studentComparisonModelDeserialize,
  deserializeProp: _studentComparisonModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'comparisonKey': IndexSchema(
      id: -8421179093316858740,
      name: r'comparisonKey',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'comparisonKey',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'classId': IndexSchema(
      id: 5352960816261817663,
      name: r'classId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'classId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _studentComparisonModelGetId,
  getLinks: _studentComparisonModelGetLinks,
  attach: _studentComparisonModelAttach,
  version: '3.3.2',
);

int _studentComparisonModelEstimateSize(
  StudentComparisonModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.classId.length * 3;
  bytesCount += 3 + object.comparedStudentId.length * 3;
  bytesCount += 3 + object.comparisonKey.length * 3;
  bytesCount += 3 + object.requesterId.length * 3;
  return bytesCount;
}

void _studentComparisonModelSerialize(
  StudentComparisonModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.calculatedAt);
  writer.writeString(offsets[1], object.classId);
  writer.writeString(offsets[2], object.comparedStudentId);
  writer.writeString(offsets[3], object.comparisonKey);
  writer.writeDouble(offsets[4], object.masteryDifference);
  writer.writeDouble(offsets[5], object.progressDifference);
  writer.writeString(offsets[6], object.requesterId);
  writer.writeLong(offsets[7], object.streakDifference);
  writer.writeLong(offsets[8], object.xpDifference);
}

StudentComparisonModel _studentComparisonModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StudentComparisonModel();
  object.calculatedAt = reader.readDateTime(offsets[0]);
  object.classId = reader.readString(offsets[1]);
  object.comparedStudentId = reader.readString(offsets[2]);
  object.comparisonKey = reader.readString(offsets[3]);
  object.id = id;
  object.masteryDifference = reader.readDouble(offsets[4]);
  object.progressDifference = reader.readDouble(offsets[5]);
  object.requesterId = reader.readString(offsets[6]);
  object.streakDifference = reader.readLong(offsets[7]);
  object.xpDifference = reader.readLong(offsets[8]);
  return object;
}

P _studentComparisonModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _studentComparisonModelGetId(StudentComparisonModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _studentComparisonModelGetLinks(
  StudentComparisonModel object,
) {
  return [];
}

void _studentComparisonModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  StudentComparisonModel object,
) {
  object.id = id;
}

extension StudentComparisonModelByIndex
    on IsarCollection<StudentComparisonModel> {
  Future<StudentComparisonModel?> getByComparisonKey(String comparisonKey) {
    return getByIndex(r'comparisonKey', [comparisonKey]);
  }

  StudentComparisonModel? getByComparisonKeySync(String comparisonKey) {
    return getByIndexSync(r'comparisonKey', [comparisonKey]);
  }

  Future<bool> deleteByComparisonKey(String comparisonKey) {
    return deleteByIndex(r'comparisonKey', [comparisonKey]);
  }

  bool deleteByComparisonKeySync(String comparisonKey) {
    return deleteByIndexSync(r'comparisonKey', [comparisonKey]);
  }

  Future<List<StudentComparisonModel?>> getAllByComparisonKey(
    List<String> comparisonKeyValues,
  ) {
    final values = comparisonKeyValues.map((e) => [e]).toList();
    return getAllByIndex(r'comparisonKey', values);
  }

  List<StudentComparisonModel?> getAllByComparisonKeySync(
    List<String> comparisonKeyValues,
  ) {
    final values = comparisonKeyValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'comparisonKey', values);
  }

  Future<int> deleteAllByComparisonKey(List<String> comparisonKeyValues) {
    final values = comparisonKeyValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'comparisonKey', values);
  }

  int deleteAllByComparisonKeySync(List<String> comparisonKeyValues) {
    final values = comparisonKeyValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'comparisonKey', values);
  }

  Future<Id> putByComparisonKey(StudentComparisonModel object) {
    return putByIndex(r'comparisonKey', object);
  }

  Id putByComparisonKeySync(
    StudentComparisonModel object, {
    bool saveLinks = true,
  }) {
    return putByIndexSync(r'comparisonKey', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByComparisonKey(List<StudentComparisonModel> objects) {
    return putAllByIndex(r'comparisonKey', objects);
  }

  List<Id> putAllByComparisonKeySync(
    List<StudentComparisonModel> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'comparisonKey', objects, saveLinks: saveLinks);
  }
}

extension StudentComparisonModelQueryWhereSort
    on QueryBuilder<StudentComparisonModel, StudentComparisonModel, QWhere> {
  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterWhere>
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension StudentComparisonModelQueryWhere
    on
        QueryBuilder<
          StudentComparisonModel,
          StudentComparisonModel,
          QWhereClause
        > {
  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterWhereClause
  >
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterWhereClause
  >
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterWhereClause
  >
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterWhereClause
  >
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterWhereClause
  >
  idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterWhereClause
  >
  comparisonKeyEqualTo(String comparisonKey) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'comparisonKey',
          value: [comparisonKey],
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterWhereClause
  >
  comparisonKeyNotEqualTo(String comparisonKey) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'comparisonKey',
                lower: [],
                upper: [comparisonKey],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'comparisonKey',
                lower: [comparisonKey],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'comparisonKey',
                lower: [comparisonKey],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'comparisonKey',
                lower: [],
                upper: [comparisonKey],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterWhereClause
  >
  classIdEqualTo(String classId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'classId', value: [classId]),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterWhereClause
  >
  classIdNotEqualTo(String classId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'classId',
                lower: [],
                upper: [classId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'classId',
                lower: [classId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'classId',
                lower: [classId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'classId',
                lower: [],
                upper: [classId],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension StudentComparisonModelQueryFilter
    on
        QueryBuilder<
          StudentComparisonModel,
          StudentComparisonModel,
          QFilterCondition
        > {
  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  calculatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'calculatedAt', value: value),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  calculatedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'calculatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  calculatedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'calculatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  calculatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'calculatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  classIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'classId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  classIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'classId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  classIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'classId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  classIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'classId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  classIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'classId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  classIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'classId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  classIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'classId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  classIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'classId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  classIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'classId', value: ''),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  classIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'classId', value: ''),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  comparedStudentIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'comparedStudentId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  comparedStudentIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'comparedStudentId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  comparedStudentIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'comparedStudentId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  comparedStudentIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'comparedStudentId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  comparedStudentIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'comparedStudentId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  comparedStudentIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'comparedStudentId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  comparedStudentIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'comparedStudentId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  comparedStudentIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'comparedStudentId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  comparedStudentIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'comparedStudentId', value: ''),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  comparedStudentIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'comparedStudentId', value: ''),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  comparisonKeyEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'comparisonKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  comparisonKeyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'comparisonKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  comparisonKeyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'comparisonKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  comparisonKeyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'comparisonKey',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  comparisonKeyStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'comparisonKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  comparisonKeyEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'comparisonKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  comparisonKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'comparisonKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  comparisonKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'comparisonKey',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  comparisonKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'comparisonKey', value: ''),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  comparisonKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'comparisonKey', value: ''),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  masteryDifferenceEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'masteryDifference',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  masteryDifferenceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'masteryDifference',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  masteryDifferenceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'masteryDifference',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  masteryDifferenceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'masteryDifference',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  progressDifferenceEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'progressDifference',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  progressDifferenceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'progressDifference',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  progressDifferenceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'progressDifference',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  progressDifferenceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'progressDifference',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  requesterIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'requesterId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  requesterIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'requesterId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  requesterIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'requesterId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  requesterIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'requesterId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  requesterIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'requesterId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  requesterIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'requesterId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  requesterIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'requesterId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  requesterIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'requesterId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  requesterIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'requesterId', value: ''),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  requesterIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'requesterId', value: ''),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  streakDifferenceEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'streakDifference', value: value),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  streakDifferenceGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'streakDifference',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  streakDifferenceLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'streakDifference',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  streakDifferenceBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'streakDifference',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  xpDifferenceEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'xpDifference', value: value),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  xpDifferenceGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'xpDifference',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  xpDifferenceLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'xpDifference',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    StudentComparisonModel,
    StudentComparisonModel,
    QAfterFilterCondition
  >
  xpDifferenceBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'xpDifference',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension StudentComparisonModelQueryObject
    on
        QueryBuilder<
          StudentComparisonModel,
          StudentComparisonModel,
          QFilterCondition
        > {}

extension StudentComparisonModelQueryLinks
    on
        QueryBuilder<
          StudentComparisonModel,
          StudentComparisonModel,
          QFilterCondition
        > {}

extension StudentComparisonModelQuerySortBy
    on QueryBuilder<StudentComparisonModel, StudentComparisonModel, QSortBy> {
  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  sortByCalculatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculatedAt', Sort.asc);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  sortByCalculatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculatedAt', Sort.desc);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  sortByClassId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classId', Sort.asc);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  sortByClassIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classId', Sort.desc);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  sortByComparedStudentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comparedStudentId', Sort.asc);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  sortByComparedStudentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comparedStudentId', Sort.desc);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  sortByComparisonKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comparisonKey', Sort.asc);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  sortByComparisonKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comparisonKey', Sort.desc);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  sortByMasteryDifference() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'masteryDifference', Sort.asc);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  sortByMasteryDifferenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'masteryDifference', Sort.desc);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  sortByProgressDifference() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progressDifference', Sort.asc);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  sortByProgressDifferenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progressDifference', Sort.desc);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  sortByRequesterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requesterId', Sort.asc);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  sortByRequesterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requesterId', Sort.desc);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  sortByStreakDifference() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streakDifference', Sort.asc);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  sortByStreakDifferenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streakDifference', Sort.desc);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  sortByXpDifference() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xpDifference', Sort.asc);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  sortByXpDifferenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xpDifference', Sort.desc);
    });
  }
}

extension StudentComparisonModelQuerySortThenBy
    on
        QueryBuilder<
          StudentComparisonModel,
          StudentComparisonModel,
          QSortThenBy
        > {
  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  thenByCalculatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculatedAt', Sort.asc);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  thenByCalculatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculatedAt', Sort.desc);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  thenByClassId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classId', Sort.asc);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  thenByClassIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classId', Sort.desc);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  thenByComparedStudentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comparedStudentId', Sort.asc);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  thenByComparedStudentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comparedStudentId', Sort.desc);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  thenByComparisonKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comparisonKey', Sort.asc);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  thenByComparisonKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comparisonKey', Sort.desc);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  thenByMasteryDifference() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'masteryDifference', Sort.asc);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  thenByMasteryDifferenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'masteryDifference', Sort.desc);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  thenByProgressDifference() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progressDifference', Sort.asc);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  thenByProgressDifferenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progressDifference', Sort.desc);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  thenByRequesterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requesterId', Sort.asc);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  thenByRequesterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requesterId', Sort.desc);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  thenByStreakDifference() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streakDifference', Sort.asc);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  thenByStreakDifferenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streakDifference', Sort.desc);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  thenByXpDifference() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xpDifference', Sort.asc);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QAfterSortBy>
  thenByXpDifferenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xpDifference', Sort.desc);
    });
  }
}

extension StudentComparisonModelQueryWhereDistinct
    on QueryBuilder<StudentComparisonModel, StudentComparisonModel, QDistinct> {
  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QDistinct>
  distinctByCalculatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'calculatedAt');
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QDistinct>
  distinctByClassId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'classId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QDistinct>
  distinctByComparedStudentId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'comparedStudentId',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QDistinct>
  distinctByComparisonKey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'comparisonKey',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QDistinct>
  distinctByMasteryDifference() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'masteryDifference');
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QDistinct>
  distinctByProgressDifference() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'progressDifference');
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QDistinct>
  distinctByRequesterId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'requesterId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QDistinct>
  distinctByStreakDifference() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'streakDifference');
    });
  }

  QueryBuilder<StudentComparisonModel, StudentComparisonModel, QDistinct>
  distinctByXpDifference() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'xpDifference');
    });
  }
}

extension StudentComparisonModelQueryProperty
    on
        QueryBuilder<
          StudentComparisonModel,
          StudentComparisonModel,
          QQueryProperty
        > {
  QueryBuilder<StudentComparisonModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<StudentComparisonModel, DateTime, QQueryOperations>
  calculatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'calculatedAt');
    });
  }

  QueryBuilder<StudentComparisonModel, String, QQueryOperations>
  classIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'classId');
    });
  }

  QueryBuilder<StudentComparisonModel, String, QQueryOperations>
  comparedStudentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'comparedStudentId');
    });
  }

  QueryBuilder<StudentComparisonModel, String, QQueryOperations>
  comparisonKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'comparisonKey');
    });
  }

  QueryBuilder<StudentComparisonModel, double, QQueryOperations>
  masteryDifferenceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'masteryDifference');
    });
  }

  QueryBuilder<StudentComparisonModel, double, QQueryOperations>
  progressDifferenceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'progressDifference');
    });
  }

  QueryBuilder<StudentComparisonModel, String, QQueryOperations>
  requesterIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'requesterId');
    });
  }

  QueryBuilder<StudentComparisonModel, int, QQueryOperations>
  streakDifferenceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'streakDifference');
    });
  }

  QueryBuilder<StudentComparisonModel, int, QQueryOperations>
  xpDifferenceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'xpDifference');
    });
  }
}
