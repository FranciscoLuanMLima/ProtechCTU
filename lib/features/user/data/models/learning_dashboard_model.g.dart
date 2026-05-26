// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_dashboard_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLearningTopicModelCollection on Isar {
  IsarCollection<LearningTopicModel> get learningTopicModels =>
      this.collection();
}

const LearningTopicModelSchema = CollectionSchema(
  name: r'LearningTopicModel',
  id: -1461566466131466440,
  properties: {
    r'coinReward': PropertySchema(
      id: 0,
      name: r'coinReward',
      type: IsarType.long,
    ),
    r'contentTypes': PropertySchema(
      id: 1,
      name: r'contentTypes',
      type: IsarType.stringList,
    ),
    r'description': PropertySchema(
      id: 2,
      name: r'description',
      type: IsarType.string,
    ),
    r'difficulty': PropertySchema(
      id: 3,
      name: r'difficulty',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(id: 4, name: r'isActive', type: IsarType.bool),
    r'name': PropertySchema(id: 5, name: r'name', type: IsarType.string),
    r'order': PropertySchema(id: 6, name: r'order', type: IsarType.long),
    r'parentTopicId': PropertySchema(
      id: 7,
      name: r'parentTopicId',
      type: IsarType.string,
    ),
    r'prerequisiteTopicIds': PropertySchema(
      id: 8,
      name: r'prerequisiteTopicIds',
      type: IsarType.stringList,
    ),
    r'topicId': PropertySchema(id: 9, name: r'topicId', type: IsarType.string),
    r'totalExercises': PropertySchema(
      id: 10,
      name: r'totalExercises',
      type: IsarType.long,
    ),
    r'xpReward': PropertySchema(id: 11, name: r'xpReward', type: IsarType.long),
  },

  estimateSize: _learningTopicModelEstimateSize,
  serialize: _learningTopicModelSerialize,
  deserialize: _learningTopicModelDeserialize,
  deserializeProp: _learningTopicModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'topicId': IndexSchema(
      id: 3718206658163357569,
      name: r'topicId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'topicId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.hash,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _learningTopicModelGetId,
  getLinks: _learningTopicModelGetLinks,
  attach: _learningTopicModelAttach,
  version: '3.3.2',
);

int _learningTopicModelEstimateSize(
  LearningTopicModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.contentTypes.length * 3;
  {
    for (var i = 0; i < object.contentTypes.length; i++) {
      final value = object.contentTypes[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.difficulty.length * 3;
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.parentTopicId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.prerequisiteTopicIds.length * 3;
  {
    for (var i = 0; i < object.prerequisiteTopicIds.length; i++) {
      final value = object.prerequisiteTopicIds[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.topicId.length * 3;
  return bytesCount;
}

void _learningTopicModelSerialize(
  LearningTopicModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.coinReward);
  writer.writeStringList(offsets[1], object.contentTypes);
  writer.writeString(offsets[2], object.description);
  writer.writeString(offsets[3], object.difficulty);
  writer.writeBool(offsets[4], object.isActive);
  writer.writeString(offsets[5], object.name);
  writer.writeLong(offsets[6], object.order);
  writer.writeString(offsets[7], object.parentTopicId);
  writer.writeStringList(offsets[8], object.prerequisiteTopicIds);
  writer.writeString(offsets[9], object.topicId);
  writer.writeLong(offsets[10], object.totalExercises);
  writer.writeLong(offsets[11], object.xpReward);
}

LearningTopicModel _learningTopicModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LearningTopicModel();
  object.coinReward = reader.readLong(offsets[0]);
  object.contentTypes = reader.readStringList(offsets[1]) ?? [];
  object.description = reader.readString(offsets[2]);
  object.difficulty = reader.readString(offsets[3]);
  object.id = id;
  object.isActive = reader.readBool(offsets[4]);
  object.name = reader.readString(offsets[5]);
  object.order = reader.readLong(offsets[6]);
  object.parentTopicId = reader.readStringOrNull(offsets[7]);
  object.prerequisiteTopicIds = reader.readStringList(offsets[8]) ?? [];
  object.topicId = reader.readString(offsets[9]);
  object.totalExercises = reader.readLong(offsets[10]);
  object.xpReward = reader.readLong(offsets[11]);
  return object;
}

P _learningTopicModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringList(offset) ?? []) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _learningTopicModelGetId(LearningTopicModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _learningTopicModelGetLinks(
  LearningTopicModel object,
) {
  return [];
}

void _learningTopicModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  LearningTopicModel object,
) {
  object.id = id;
}

extension LearningTopicModelByIndex on IsarCollection<LearningTopicModel> {
  Future<LearningTopicModel?> getByTopicId(String topicId) {
    return getByIndex(r'topicId', [topicId]);
  }

  LearningTopicModel? getByTopicIdSync(String topicId) {
    return getByIndexSync(r'topicId', [topicId]);
  }

  Future<bool> deleteByTopicId(String topicId) {
    return deleteByIndex(r'topicId', [topicId]);
  }

  bool deleteByTopicIdSync(String topicId) {
    return deleteByIndexSync(r'topicId', [topicId]);
  }

  Future<List<LearningTopicModel?>> getAllByTopicId(
    List<String> topicIdValues,
  ) {
    final values = topicIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'topicId', values);
  }

  List<LearningTopicModel?> getAllByTopicIdSync(List<String> topicIdValues) {
    final values = topicIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'topicId', values);
  }

  Future<int> deleteAllByTopicId(List<String> topicIdValues) {
    final values = topicIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'topicId', values);
  }

  int deleteAllByTopicIdSync(List<String> topicIdValues) {
    final values = topicIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'topicId', values);
  }

  Future<Id> putByTopicId(LearningTopicModel object) {
    return putByIndex(r'topicId', object);
  }

  Id putByTopicIdSync(LearningTopicModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'topicId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByTopicId(List<LearningTopicModel> objects) {
    return putAllByIndex(r'topicId', objects);
  }

  List<Id> putAllByTopicIdSync(
    List<LearningTopicModel> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'topicId', objects, saveLinks: saveLinks);
  }
}

extension LearningTopicModelQueryWhereSort
    on QueryBuilder<LearningTopicModel, LearningTopicModel, QWhere> {
  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LearningTopicModelQueryWhere
    on QueryBuilder<LearningTopicModel, LearningTopicModel, QWhereClause> {
  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterWhereClause>
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

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterWhereClause>
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

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterWhereClause>
  topicIdEqualTo(String topicId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'topicId', value: [topicId]),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterWhereClause>
  topicIdNotEqualTo(String topicId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'topicId',
                lower: [],
                upper: [topicId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'topicId',
                lower: [topicId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'topicId',
                lower: [topicId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'topicId',
                lower: [],
                upper: [topicId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterWhereClause>
  nameEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'name', value: [name]),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterWhereClause>
  nameNotEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'name',
                lower: [],
                upper: [name],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'name',
                lower: [name],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'name',
                lower: [name],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'name',
                lower: [],
                upper: [name],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension LearningTopicModelQueryFilter
    on QueryBuilder<LearningTopicModel, LearningTopicModel, QFilterCondition> {
  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  coinRewardEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'coinReward', value: value),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  coinRewardGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'coinReward',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  coinRewardLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'coinReward',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  coinRewardBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'coinReward',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  contentTypesElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'contentTypes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  contentTypesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'contentTypes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  contentTypesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'contentTypes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  contentTypesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'contentTypes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  contentTypesElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'contentTypes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  contentTypesElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'contentTypes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  contentTypesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'contentTypes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  contentTypesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'contentTypes',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  contentTypesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'contentTypes', value: ''),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  contentTypesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'contentTypes', value: ''),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  contentTypesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'contentTypes', length, true, length, true);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  contentTypesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'contentTypes', 0, true, 0, true);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  contentTypesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'contentTypes', 0, false, 999999, true);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  contentTypesLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'contentTypes', 0, true, length, include);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  contentTypesLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'contentTypes', length, include, 999999, true);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  contentTypesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'contentTypes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  descriptionEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'description',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  descriptionStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  descriptionEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'description',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  difficultyEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'difficulty',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  difficultyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'difficulty',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  difficultyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'difficulty',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  difficultyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'difficulty',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  difficultyStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'difficulty',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  difficultyEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'difficulty',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  difficultyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'difficulty',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  difficultyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'difficulty',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  difficultyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'difficulty', value: ''),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  difficultyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'difficulty', value: ''),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
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

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
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

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
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

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  isActiveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isActive', value: value),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
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

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
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

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
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

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
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

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
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

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
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

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
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

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
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

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  orderEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'order', value: value),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  orderGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'order',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  orderLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'order',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  orderBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'order',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  parentTopicIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'parentTopicId'),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  parentTopicIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'parentTopicId'),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  parentTopicIdEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'parentTopicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  parentTopicIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'parentTopicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  parentTopicIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'parentTopicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  parentTopicIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'parentTopicId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  parentTopicIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'parentTopicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  parentTopicIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'parentTopicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  parentTopicIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'parentTopicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  parentTopicIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'parentTopicId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  parentTopicIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'parentTopicId', value: ''),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  parentTopicIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'parentTopicId', value: ''),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  prerequisiteTopicIdsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'prerequisiteTopicIds',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  prerequisiteTopicIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'prerequisiteTopicIds',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  prerequisiteTopicIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'prerequisiteTopicIds',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  prerequisiteTopicIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'prerequisiteTopicIds',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  prerequisiteTopicIdsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'prerequisiteTopicIds',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  prerequisiteTopicIdsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'prerequisiteTopicIds',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  prerequisiteTopicIdsElementContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'prerequisiteTopicIds',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  prerequisiteTopicIdsElementMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'prerequisiteTopicIds',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  prerequisiteTopicIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'prerequisiteTopicIds', value: ''),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  prerequisiteTopicIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          property: r'prerequisiteTopicIds',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  prerequisiteTopicIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'prerequisiteTopicIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  prerequisiteTopicIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'prerequisiteTopicIds', 0, true, 0, true);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  prerequisiteTopicIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'prerequisiteTopicIds', 0, false, 999999, true);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  prerequisiteTopicIdsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'prerequisiteTopicIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  prerequisiteTopicIdsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'prerequisiteTopicIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  prerequisiteTopicIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'prerequisiteTopicIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  topicIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'topicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  topicIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'topicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  topicIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'topicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  topicIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'topicId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  topicIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'topicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  topicIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'topicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  topicIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'topicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  topicIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'topicId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  topicIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'topicId', value: ''),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  topicIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'topicId', value: ''),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  totalExercisesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'totalExercises', value: value),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  totalExercisesGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalExercises',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  totalExercisesLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalExercises',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  totalExercisesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalExercises',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  xpRewardEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'xpReward', value: value),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  xpRewardGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'xpReward',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  xpRewardLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'xpReward',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterFilterCondition>
  xpRewardBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'xpReward',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension LearningTopicModelQueryObject
    on QueryBuilder<LearningTopicModel, LearningTopicModel, QFilterCondition> {}

extension LearningTopicModelQueryLinks
    on QueryBuilder<LearningTopicModel, LearningTopicModel, QFilterCondition> {}

extension LearningTopicModelQuerySortBy
    on QueryBuilder<LearningTopicModel, LearningTopicModel, QSortBy> {
  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  sortByCoinReward() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coinReward', Sort.asc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  sortByCoinRewardDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coinReward', Sort.desc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  sortByDifficulty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficulty', Sort.asc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  sortByDifficultyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficulty', Sort.desc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  sortByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  sortByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  sortByParentTopicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentTopicId', Sort.asc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  sortByParentTopicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentTopicId', Sort.desc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  sortByTopicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topicId', Sort.asc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  sortByTopicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topicId', Sort.desc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  sortByTotalExercises() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalExercises', Sort.asc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  sortByTotalExercisesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalExercises', Sort.desc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  sortByXpReward() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xpReward', Sort.asc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  sortByXpRewardDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xpReward', Sort.desc);
    });
  }
}

extension LearningTopicModelQuerySortThenBy
    on QueryBuilder<LearningTopicModel, LearningTopicModel, QSortThenBy> {
  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  thenByCoinReward() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coinReward', Sort.asc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  thenByCoinRewardDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coinReward', Sort.desc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  thenByDifficulty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficulty', Sort.asc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  thenByDifficultyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficulty', Sort.desc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  thenByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  thenByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  thenByParentTopicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentTopicId', Sort.asc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  thenByParentTopicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentTopicId', Sort.desc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  thenByTopicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topicId', Sort.asc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  thenByTopicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topicId', Sort.desc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  thenByTotalExercises() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalExercises', Sort.asc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  thenByTotalExercisesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalExercises', Sort.desc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  thenByXpReward() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xpReward', Sort.asc);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QAfterSortBy>
  thenByXpRewardDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xpReward', Sort.desc);
    });
  }
}

extension LearningTopicModelQueryWhereDistinct
    on QueryBuilder<LearningTopicModel, LearningTopicModel, QDistinct> {
  QueryBuilder<LearningTopicModel, LearningTopicModel, QDistinct>
  distinctByCoinReward() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coinReward');
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QDistinct>
  distinctByContentTypes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contentTypes');
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QDistinct>
  distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QDistinct>
  distinctByDifficulty({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'difficulty', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QDistinct>
  distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QDistinct>
  distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QDistinct>
  distinctByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'order');
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QDistinct>
  distinctByParentTopicId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'parentTopicId',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QDistinct>
  distinctByPrerequisiteTopicIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'prerequisiteTopicIds');
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QDistinct>
  distinctByTopicId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'topicId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QDistinct>
  distinctByTotalExercises() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalExercises');
    });
  }

  QueryBuilder<LearningTopicModel, LearningTopicModel, QDistinct>
  distinctByXpReward() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'xpReward');
    });
  }
}

extension LearningTopicModelQueryProperty
    on QueryBuilder<LearningTopicModel, LearningTopicModel, QQueryProperty> {
  QueryBuilder<LearningTopicModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LearningTopicModel, int, QQueryOperations> coinRewardProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coinReward');
    });
  }

  QueryBuilder<LearningTopicModel, List<String>, QQueryOperations>
  contentTypesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contentTypes');
    });
  }

  QueryBuilder<LearningTopicModel, String, QQueryOperations>
  descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<LearningTopicModel, String, QQueryOperations>
  difficultyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'difficulty');
    });
  }

  QueryBuilder<LearningTopicModel, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<LearningTopicModel, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<LearningTopicModel, int, QQueryOperations> orderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'order');
    });
  }

  QueryBuilder<LearningTopicModel, String?, QQueryOperations>
  parentTopicIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parentTopicId');
    });
  }

  QueryBuilder<LearningTopicModel, List<String>, QQueryOperations>
  prerequisiteTopicIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'prerequisiteTopicIds');
    });
  }

  QueryBuilder<LearningTopicModel, String, QQueryOperations> topicIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'topicId');
    });
  }

  QueryBuilder<LearningTopicModel, int, QQueryOperations>
  totalExercisesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalExercises');
    });
  }

  QueryBuilder<LearningTopicModel, int, QQueryOperations> xpRewardProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'xpReward');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserTopicProgressModelCollection on Isar {
  IsarCollection<UserTopicProgressModel> get userTopicProgressModels =>
      this.collection();
}

const UserTopicProgressModelSchema = CollectionSchema(
  name: r'UserTopicProgressModel',
  id: 2011346298285427985,
  properties: {
    r'completedAt': PropertySchema(
      id: 0,
      name: r'completedAt',
      type: IsarType.dateTime,
    ),
    r'completedExercises': PropertySchema(
      id: 1,
      name: r'completedExercises',
      type: IsarType.long,
    ),
    r'completionRate': PropertySchema(
      id: 2,
      name: r'completionRate',
      type: IsarType.double,
    ),
    r'correctAttempts': PropertySchema(
      id: 3,
      name: r'correctAttempts',
      type: IsarType.long,
    ),
    r'firstTryPerfect': PropertySchema(
      id: 4,
      name: r'firstTryPerfect',
      type: IsarType.bool,
    ),
    r'lastAccess': PropertySchema(
      id: 5,
      name: r'lastAccess',
      type: IsarType.dateTime,
    ),
    r'masteryRate': PropertySchema(
      id: 6,
      name: r'masteryRate',
      type: IsarType.double,
    ),
    r'previousMasteryRate': PropertySchema(
      id: 7,
      name: r'previousMasteryRate',
      type: IsarType.double,
    ),
    r'recordKey': PropertySchema(
      id: 8,
      name: r'recordKey',
      type: IsarType.string,
    ),
    r'status': PropertySchema(id: 9, name: r'status', type: IsarType.string),
    r'topicId': PropertySchema(id: 10, name: r'topicId', type: IsarType.string),
    r'totalAttempts': PropertySchema(
      id: 11,
      name: r'totalAttempts',
      type: IsarType.long,
    ),
    r'totalResponseTimeMilliseconds': PropertySchema(
      id: 12,
      name: r'totalResponseTimeMilliseconds',
      type: IsarType.long,
    ),
    r'totalStudyTimeMilliseconds': PropertySchema(
      id: 13,
      name: r'totalStudyTimeMilliseconds',
      type: IsarType.long,
    ),
    r'unlockedAt': PropertySchema(
      id: 14,
      name: r'unlockedAt',
      type: IsarType.dateTime,
    ),
    r'unlockedBadgeIds': PropertySchema(
      id: 15,
      name: r'unlockedBadgeIds',
      type: IsarType.stringList,
    ),
    r'updatedAt': PropertySchema(
      id: 16,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'userDifficulty': PropertySchema(
      id: 17,
      name: r'userDifficulty',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(id: 18, name: r'userId', type: IsarType.string),
  },

  estimateSize: _userTopicProgressModelEstimateSize,
  serialize: _userTopicProgressModelSerialize,
  deserialize: _userTopicProgressModelDeserialize,
  deserializeProp: _userTopicProgressModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'recordKey': IndexSchema(
      id: -1694304532238354687,
      name: r'recordKey',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'recordKey',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'userId': IndexSchema(
      id: -2005826577402374815,
      name: r'userId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'topicId': IndexSchema(
      id: 3718206658163357569,
      name: r'topicId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'topicId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _userTopicProgressModelGetId,
  getLinks: _userTopicProgressModelGetLinks,
  attach: _userTopicProgressModelAttach,
  version: '3.3.2',
);

int _userTopicProgressModelEstimateSize(
  UserTopicProgressModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.recordKey.length * 3;
  bytesCount += 3 + object.status.length * 3;
  bytesCount += 3 + object.topicId.length * 3;
  bytesCount += 3 + object.unlockedBadgeIds.length * 3;
  {
    for (var i = 0; i < object.unlockedBadgeIds.length; i++) {
      final value = object.unlockedBadgeIds[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.userDifficulty;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _userTopicProgressModelSerialize(
  UserTopicProgressModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.completedAt);
  writer.writeLong(offsets[1], object.completedExercises);
  writer.writeDouble(offsets[2], object.completionRate);
  writer.writeLong(offsets[3], object.correctAttempts);
  writer.writeBool(offsets[4], object.firstTryPerfect);
  writer.writeDateTime(offsets[5], object.lastAccess);
  writer.writeDouble(offsets[6], object.masteryRate);
  writer.writeDouble(offsets[7], object.previousMasteryRate);
  writer.writeString(offsets[8], object.recordKey);
  writer.writeString(offsets[9], object.status);
  writer.writeString(offsets[10], object.topicId);
  writer.writeLong(offsets[11], object.totalAttempts);
  writer.writeLong(offsets[12], object.totalResponseTimeMilliseconds);
  writer.writeLong(offsets[13], object.totalStudyTimeMilliseconds);
  writer.writeDateTime(offsets[14], object.unlockedAt);
  writer.writeStringList(offsets[15], object.unlockedBadgeIds);
  writer.writeDateTime(offsets[16], object.updatedAt);
  writer.writeString(offsets[17], object.userDifficulty);
  writer.writeString(offsets[18], object.userId);
}

UserTopicProgressModel _userTopicProgressModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserTopicProgressModel();
  object.completedAt = reader.readDateTimeOrNull(offsets[0]);
  object.completedExercises = reader.readLong(offsets[1]);
  object.completionRate = reader.readDouble(offsets[2]);
  object.correctAttempts = reader.readLong(offsets[3]);
  object.firstTryPerfect = reader.readBool(offsets[4]);
  object.id = id;
  object.lastAccess = reader.readDateTimeOrNull(offsets[5]);
  object.masteryRate = reader.readDouble(offsets[6]);
  object.previousMasteryRate = reader.readDouble(offsets[7]);
  object.recordKey = reader.readString(offsets[8]);
  object.status = reader.readString(offsets[9]);
  object.topicId = reader.readString(offsets[10]);
  object.totalAttempts = reader.readLong(offsets[11]);
  object.totalResponseTimeMilliseconds = reader.readLong(offsets[12]);
  object.totalStudyTimeMilliseconds = reader.readLong(offsets[13]);
  object.unlockedAt = reader.readDateTimeOrNull(offsets[14]);
  object.unlockedBadgeIds = reader.readStringList(offsets[15]) ?? [];
  object.updatedAt = reader.readDateTime(offsets[16]);
  object.userDifficulty = reader.readStringOrNull(offsets[17]);
  object.userId = reader.readString(offsets[18]);
  return object;
}

P _userTopicProgressModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readLong(offset)) as P;
    case 14:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 15:
      return (reader.readStringList(offset) ?? []) as P;
    case 16:
      return (reader.readDateTime(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userTopicProgressModelGetId(UserTopicProgressModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userTopicProgressModelGetLinks(
  UserTopicProgressModel object,
) {
  return [];
}

void _userTopicProgressModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  UserTopicProgressModel object,
) {
  object.id = id;
}

extension UserTopicProgressModelByIndex
    on IsarCollection<UserTopicProgressModel> {
  Future<UserTopicProgressModel?> getByRecordKey(String recordKey) {
    return getByIndex(r'recordKey', [recordKey]);
  }

  UserTopicProgressModel? getByRecordKeySync(String recordKey) {
    return getByIndexSync(r'recordKey', [recordKey]);
  }

  Future<bool> deleteByRecordKey(String recordKey) {
    return deleteByIndex(r'recordKey', [recordKey]);
  }

  bool deleteByRecordKeySync(String recordKey) {
    return deleteByIndexSync(r'recordKey', [recordKey]);
  }

  Future<List<UserTopicProgressModel?>> getAllByRecordKey(
    List<String> recordKeyValues,
  ) {
    final values = recordKeyValues.map((e) => [e]).toList();
    return getAllByIndex(r'recordKey', values);
  }

  List<UserTopicProgressModel?> getAllByRecordKeySync(
    List<String> recordKeyValues,
  ) {
    final values = recordKeyValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'recordKey', values);
  }

  Future<int> deleteAllByRecordKey(List<String> recordKeyValues) {
    final values = recordKeyValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'recordKey', values);
  }

  int deleteAllByRecordKeySync(List<String> recordKeyValues) {
    final values = recordKeyValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'recordKey', values);
  }

  Future<Id> putByRecordKey(UserTopicProgressModel object) {
    return putByIndex(r'recordKey', object);
  }

  Id putByRecordKeySync(
    UserTopicProgressModel object, {
    bool saveLinks = true,
  }) {
    return putByIndexSync(r'recordKey', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByRecordKey(List<UserTopicProgressModel> objects) {
    return putAllByIndex(r'recordKey', objects);
  }

  List<Id> putAllByRecordKeySync(
    List<UserTopicProgressModel> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'recordKey', objects, saveLinks: saveLinks);
  }
}

extension UserTopicProgressModelQueryWhereSort
    on QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QWhere> {
  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterWhere>
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserTopicProgressModelQueryWhere
    on
        QueryBuilder<
          UserTopicProgressModel,
          UserTopicProgressModel,
          QWhereClause
        > {
  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterWhereClause
  >
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
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
    UserTopicProgressModel,
    UserTopicProgressModel,
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
    UserTopicProgressModel,
    UserTopicProgressModel,
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
    UserTopicProgressModel,
    UserTopicProgressModel,
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
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterWhereClause
  >
  recordKeyEqualTo(String recordKey) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'recordKey', value: [recordKey]),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterWhereClause
  >
  recordKeyNotEqualTo(String recordKey) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'recordKey',
                lower: [],
                upper: [recordKey],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'recordKey',
                lower: [recordKey],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'recordKey',
                lower: [recordKey],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'recordKey',
                lower: [],
                upper: [recordKey],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterWhereClause
  >
  userIdEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'userId', value: [userId]),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterWhereClause
  >
  userIdNotEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userId',
                lower: [],
                upper: [userId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userId',
                lower: [userId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userId',
                lower: [userId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userId',
                lower: [],
                upper: [userId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterWhereClause
  >
  topicIdEqualTo(String topicId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'topicId', value: [topicId]),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterWhereClause
  >
  topicIdNotEqualTo(String topicId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'topicId',
                lower: [],
                upper: [topicId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'topicId',
                lower: [topicId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'topicId',
                lower: [topicId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'topicId',
                lower: [],
                upper: [topicId],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension UserTopicProgressModelQueryFilter
    on
        QueryBuilder<
          UserTopicProgressModel,
          UserTopicProgressModel,
          QFilterCondition
        > {
  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  completedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'completedAt'),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  completedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'completedAt'),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  completedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'completedAt', value: value),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  completedAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'completedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  completedAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'completedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  completedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'completedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
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
    UserTopicProgressModel,
    UserTopicProgressModel,
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
    UserTopicProgressModel,
    UserTopicProgressModel,
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
    UserTopicProgressModel,
    UserTopicProgressModel,
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
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  completionRateEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'completionRate',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  completionRateGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'completionRate',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  completionRateLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'completionRate',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  completionRateBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'completionRate',
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
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  correctAttemptsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'correctAttempts', value: value),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  correctAttemptsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'correctAttempts',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  correctAttemptsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'correctAttempts',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  correctAttemptsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'correctAttempts',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  firstTryPerfectEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'firstTryPerfect', value: value),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
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
    UserTopicProgressModel,
    UserTopicProgressModel,
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
    UserTopicProgressModel,
    UserTopicProgressModel,
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
    UserTopicProgressModel,
    UserTopicProgressModel,
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
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  lastAccessIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastAccess'),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  lastAccessIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastAccess'),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  lastAccessEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastAccess', value: value),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  lastAccessGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastAccess',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  lastAccessLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastAccess',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  lastAccessBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastAccess',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
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
    UserTopicProgressModel,
    UserTopicProgressModel,
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
    UserTopicProgressModel,
    UserTopicProgressModel,
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
    UserTopicProgressModel,
    UserTopicProgressModel,
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
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  previousMasteryRateEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'previousMasteryRate',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  previousMasteryRateGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'previousMasteryRate',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  previousMasteryRateLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'previousMasteryRate',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  previousMasteryRateBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'previousMasteryRate',
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
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  recordKeyEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'recordKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  recordKeyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'recordKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  recordKeyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'recordKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  recordKeyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'recordKey',
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
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  recordKeyStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'recordKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  recordKeyEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'recordKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  recordKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'recordKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  recordKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'recordKey',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  recordKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'recordKey', value: ''),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  recordKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'recordKey', value: ''),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  statusEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  statusGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  statusLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  statusBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'status',
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
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  statusStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  statusEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'status',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'status', value: ''),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'status', value: ''),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  topicIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'topicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  topicIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'topicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  topicIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'topicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  topicIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'topicId',
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
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  topicIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'topicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  topicIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'topicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  topicIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'topicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  topicIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'topicId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  topicIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'topicId', value: ''),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  topicIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'topicId', value: ''),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  totalAttemptsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'totalAttempts', value: value),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  totalAttemptsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalAttempts',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  totalAttemptsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalAttempts',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  totalAttemptsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalAttempts',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  totalResponseTimeMillisecondsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'totalResponseTimeMilliseconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  totalResponseTimeMillisecondsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalResponseTimeMilliseconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  totalResponseTimeMillisecondsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalResponseTimeMilliseconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  totalResponseTimeMillisecondsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalResponseTimeMilliseconds',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
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
    UserTopicProgressModel,
    UserTopicProgressModel,
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
    UserTopicProgressModel,
    UserTopicProgressModel,
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
    UserTopicProgressModel,
    UserTopicProgressModel,
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
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  unlockedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'unlockedAt'),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  unlockedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'unlockedAt'),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  unlockedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'unlockedAt', value: value),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  unlockedAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'unlockedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  unlockedAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'unlockedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  unlockedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'unlockedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  unlockedBadgeIdsElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'unlockedBadgeIds',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  unlockedBadgeIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'unlockedBadgeIds',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  unlockedBadgeIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'unlockedBadgeIds',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  unlockedBadgeIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'unlockedBadgeIds',
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
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  unlockedBadgeIdsElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'unlockedBadgeIds',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  unlockedBadgeIdsElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'unlockedBadgeIds',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  unlockedBadgeIdsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'unlockedBadgeIds',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  unlockedBadgeIdsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'unlockedBadgeIds',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  unlockedBadgeIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'unlockedBadgeIds', value: ''),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  unlockedBadgeIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'unlockedBadgeIds', value: ''),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  unlockedBadgeIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'unlockedBadgeIds', length, true, length, true);
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  unlockedBadgeIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'unlockedBadgeIds', 0, true, 0, true);
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  unlockedBadgeIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'unlockedBadgeIds', 0, false, 999999, true);
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  unlockedBadgeIdsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'unlockedBadgeIds', 0, true, length, include);
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  unlockedBadgeIdsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'unlockedBadgeIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  unlockedBadgeIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'unlockedBadgeIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
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
    UserTopicProgressModel,
    UserTopicProgressModel,
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
    UserTopicProgressModel,
    UserTopicProgressModel,
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
    UserTopicProgressModel,
    UserTopicProgressModel,
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

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  userDifficultyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'userDifficulty'),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  userDifficultyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'userDifficulty'),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  userDifficultyEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'userDifficulty',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  userDifficultyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'userDifficulty',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  userDifficultyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'userDifficulty',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  userDifficultyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'userDifficulty',
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
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  userDifficultyStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'userDifficulty',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  userDifficultyEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'userDifficulty',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  userDifficultyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'userDifficulty',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  userDifficultyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'userDifficulty',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  userDifficultyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'userDifficulty', value: ''),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  userDifficultyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'userDifficulty', value: ''),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  userIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  userIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  userIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  userIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'userId',
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
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  userIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  userIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'userId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'userId', value: ''),
      );
    });
  }

  QueryBuilder<
    UserTopicProgressModel,
    UserTopicProgressModel,
    QAfterFilterCondition
  >
  userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'userId', value: ''),
      );
    });
  }
}

extension UserTopicProgressModelQueryObject
    on
        QueryBuilder<
          UserTopicProgressModel,
          UserTopicProgressModel,
          QFilterCondition
        > {}

extension UserTopicProgressModelQueryLinks
    on
        QueryBuilder<
          UserTopicProgressModel,
          UserTopicProgressModel,
          QFilterCondition
        > {}

extension UserTopicProgressModelQuerySortBy
    on QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QSortBy> {
  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  sortByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  sortByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  sortByCompletedExercises() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedExercises', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  sortByCompletedExercisesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedExercises', Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  sortByCompletionRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completionRate', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  sortByCompletionRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completionRate', Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  sortByCorrectAttempts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAttempts', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  sortByCorrectAttemptsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAttempts', Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  sortByFirstTryPerfect() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstTryPerfect', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  sortByFirstTryPerfectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstTryPerfect', Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  sortByLastAccess() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAccess', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  sortByLastAccessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAccess', Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  sortByMasteryRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'masteryRate', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  sortByMasteryRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'masteryRate', Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  sortByPreviousMasteryRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'previousMasteryRate', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  sortByPreviousMasteryRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'previousMasteryRate', Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  sortByRecordKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordKey', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  sortByRecordKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordKey', Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  sortByTopicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topicId', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  sortByTopicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topicId', Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  sortByTotalAttempts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAttempts', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  sortByTotalAttemptsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAttempts', Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  sortByTotalResponseTimeMilliseconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalResponseTimeMilliseconds', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  sortByTotalResponseTimeMillisecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalResponseTimeMilliseconds', Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  sortByTotalStudyTimeMilliseconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStudyTimeMilliseconds', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  sortByTotalStudyTimeMillisecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStudyTimeMilliseconds', Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  sortByUnlockedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedAt', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  sortByUnlockedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedAt', Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  sortByUserDifficulty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userDifficulty', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  sortByUserDifficultyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userDifficulty', Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension UserTopicProgressModelQuerySortThenBy
    on
        QueryBuilder<
          UserTopicProgressModel,
          UserTopicProgressModel,
          QSortThenBy
        > {
  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByCompletedExercises() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedExercises', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByCompletedExercisesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedExercises', Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByCompletionRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completionRate', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByCompletionRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completionRate', Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByCorrectAttempts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAttempts', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByCorrectAttemptsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAttempts', Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByFirstTryPerfect() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstTryPerfect', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByFirstTryPerfectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstTryPerfect', Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByLastAccess() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAccess', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByLastAccessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAccess', Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByMasteryRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'masteryRate', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByMasteryRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'masteryRate', Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByPreviousMasteryRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'previousMasteryRate', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByPreviousMasteryRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'previousMasteryRate', Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByRecordKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordKey', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByRecordKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordKey', Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByTopicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topicId', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByTopicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topicId', Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByTotalAttempts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAttempts', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByTotalAttemptsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAttempts', Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByTotalResponseTimeMilliseconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalResponseTimeMilliseconds', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByTotalResponseTimeMillisecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalResponseTimeMilliseconds', Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByTotalStudyTimeMilliseconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStudyTimeMilliseconds', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByTotalStudyTimeMillisecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStudyTimeMilliseconds', Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByUnlockedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedAt', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByUnlockedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedAt', Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByUserDifficulty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userDifficulty', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByUserDifficultyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userDifficulty', Sort.desc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QAfterSortBy>
  thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension UserTopicProgressModelQueryWhereDistinct
    on QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QDistinct> {
  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QDistinct>
  distinctByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedAt');
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QDistinct>
  distinctByCompletedExercises() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedExercises');
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QDistinct>
  distinctByCompletionRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completionRate');
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QDistinct>
  distinctByCorrectAttempts() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'correctAttempts');
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QDistinct>
  distinctByFirstTryPerfect() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firstTryPerfect');
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QDistinct>
  distinctByLastAccess() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastAccess');
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QDistinct>
  distinctByMasteryRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'masteryRate');
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QDistinct>
  distinctByPreviousMasteryRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'previousMasteryRate');
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QDistinct>
  distinctByRecordKey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recordKey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QDistinct>
  distinctByStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QDistinct>
  distinctByTopicId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'topicId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QDistinct>
  distinctByTotalAttempts() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalAttempts');
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QDistinct>
  distinctByTotalResponseTimeMilliseconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalResponseTimeMilliseconds');
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QDistinct>
  distinctByTotalStudyTimeMilliseconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalStudyTimeMilliseconds');
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QDistinct>
  distinctByUnlockedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unlockedAt');
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QDistinct>
  distinctByUnlockedBadgeIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unlockedBadgeIds');
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QDistinct>
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QDistinct>
  distinctByUserDifficulty({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'userDifficulty',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<UserTopicProgressModel, UserTopicProgressModel, QDistinct>
  distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension UserTopicProgressModelQueryProperty
    on
        QueryBuilder<
          UserTopicProgressModel,
          UserTopicProgressModel,
          QQueryProperty
        > {
  QueryBuilder<UserTopicProgressModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserTopicProgressModel, DateTime?, QQueryOperations>
  completedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedAt');
    });
  }

  QueryBuilder<UserTopicProgressModel, int, QQueryOperations>
  completedExercisesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedExercises');
    });
  }

  QueryBuilder<UserTopicProgressModel, double, QQueryOperations>
  completionRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completionRate');
    });
  }

  QueryBuilder<UserTopicProgressModel, int, QQueryOperations>
  correctAttemptsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'correctAttempts');
    });
  }

  QueryBuilder<UserTopicProgressModel, bool, QQueryOperations>
  firstTryPerfectProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firstTryPerfect');
    });
  }

  QueryBuilder<UserTopicProgressModel, DateTime?, QQueryOperations>
  lastAccessProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastAccess');
    });
  }

  QueryBuilder<UserTopicProgressModel, double, QQueryOperations>
  masteryRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'masteryRate');
    });
  }

  QueryBuilder<UserTopicProgressModel, double, QQueryOperations>
  previousMasteryRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'previousMasteryRate');
    });
  }

  QueryBuilder<UserTopicProgressModel, String, QQueryOperations>
  recordKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recordKey');
    });
  }

  QueryBuilder<UserTopicProgressModel, String, QQueryOperations>
  statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<UserTopicProgressModel, String, QQueryOperations>
  topicIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'topicId');
    });
  }

  QueryBuilder<UserTopicProgressModel, int, QQueryOperations>
  totalAttemptsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalAttempts');
    });
  }

  QueryBuilder<UserTopicProgressModel, int, QQueryOperations>
  totalResponseTimeMillisecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalResponseTimeMilliseconds');
    });
  }

  QueryBuilder<UserTopicProgressModel, int, QQueryOperations>
  totalStudyTimeMillisecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalStudyTimeMilliseconds');
    });
  }

  QueryBuilder<UserTopicProgressModel, DateTime?, QQueryOperations>
  unlockedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unlockedAt');
    });
  }

  QueryBuilder<UserTopicProgressModel, List<String>, QQueryOperations>
  unlockedBadgeIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unlockedBadgeIds');
    });
  }

  QueryBuilder<UserTopicProgressModel, DateTime, QQueryOperations>
  updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<UserTopicProgressModel, String?, QQueryOperations>
  userDifficultyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userDifficulty');
    });
  }

  QueryBuilder<UserTopicProgressModel, String, QQueryOperations>
  userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetStudyActivityModelCollection on Isar {
  IsarCollection<StudyActivityModel> get studyActivityModels =>
      this.collection();
}

const StudyActivityModelSchema = CollectionSchema(
  name: r'StudyActivityModel',
  id: 7609541629824164448,
  properties: {
    r'activityId': PropertySchema(
      id: 0,
      name: r'activityId',
      type: IsarType.string,
    ),
    r'durationMilliseconds': PropertySchema(
      id: 1,
      name: r'durationMilliseconds',
      type: IsarType.long,
    ),
    r'masteryAfterEvent': PropertySchema(
      id: 2,
      name: r'masteryAfterEvent',
      type: IsarType.double,
    ),
    r'occurredAt': PropertySchema(
      id: 3,
      name: r'occurredAt',
      type: IsarType.dateTime,
    ),
    r'responseTimeMilliseconds': PropertySchema(
      id: 4,
      name: r'responseTimeMilliseconds',
      type: IsarType.long,
    ),
    r'topicId': PropertySchema(id: 5, name: r'topicId', type: IsarType.string),
    r'type': PropertySchema(id: 6, name: r'type', type: IsarType.string),
    r'userId': PropertySchema(id: 7, name: r'userId', type: IsarType.string),
    r'wasCorrect': PropertySchema(
      id: 8,
      name: r'wasCorrect',
      type: IsarType.bool,
    ),
    r'wasFirstAttempt': PropertySchema(
      id: 9,
      name: r'wasFirstAttempt',
      type: IsarType.bool,
    ),
  },

  estimateSize: _studyActivityModelEstimateSize,
  serialize: _studyActivityModelSerialize,
  deserialize: _studyActivityModelDeserialize,
  deserializeProp: _studyActivityModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'activityId': IndexSchema(
      id: 8968520805042838249,
      name: r'activityId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'activityId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'userId': IndexSchema(
      id: -2005826577402374815,
      name: r'userId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'topicId': IndexSchema(
      id: 3718206658163357569,
      name: r'topicId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'topicId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _studyActivityModelGetId,
  getLinks: _studyActivityModelGetLinks,
  attach: _studyActivityModelAttach,
  version: '3.3.2',
);

int _studyActivityModelEstimateSize(
  StudyActivityModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.activityId.length * 3;
  bytesCount += 3 + object.topicId.length * 3;
  bytesCount += 3 + object.type.length * 3;
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _studyActivityModelSerialize(
  StudyActivityModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.activityId);
  writer.writeLong(offsets[1], object.durationMilliseconds);
  writer.writeDouble(offsets[2], object.masteryAfterEvent);
  writer.writeDateTime(offsets[3], object.occurredAt);
  writer.writeLong(offsets[4], object.responseTimeMilliseconds);
  writer.writeString(offsets[5], object.topicId);
  writer.writeString(offsets[6], object.type);
  writer.writeString(offsets[7], object.userId);
  writer.writeBool(offsets[8], object.wasCorrect);
  writer.writeBool(offsets[9], object.wasFirstAttempt);
}

StudyActivityModel _studyActivityModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StudyActivityModel();
  object.activityId = reader.readString(offsets[0]);
  object.durationMilliseconds = reader.readLong(offsets[1]);
  object.id = id;
  object.masteryAfterEvent = reader.readDouble(offsets[2]);
  object.occurredAt = reader.readDateTime(offsets[3]);
  object.responseTimeMilliseconds = reader.readLongOrNull(offsets[4]);
  object.topicId = reader.readString(offsets[5]);
  object.type = reader.readString(offsets[6]);
  object.userId = reader.readString(offsets[7]);
  object.wasCorrect = reader.readBoolOrNull(offsets[8]);
  object.wasFirstAttempt = reader.readBool(offsets[9]);
  return object;
}

P _studyActivityModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readBoolOrNull(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _studyActivityModelGetId(StudyActivityModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _studyActivityModelGetLinks(
  StudyActivityModel object,
) {
  return [];
}

void _studyActivityModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  StudyActivityModel object,
) {
  object.id = id;
}

extension StudyActivityModelByIndex on IsarCollection<StudyActivityModel> {
  Future<StudyActivityModel?> getByActivityId(String activityId) {
    return getByIndex(r'activityId', [activityId]);
  }

  StudyActivityModel? getByActivityIdSync(String activityId) {
    return getByIndexSync(r'activityId', [activityId]);
  }

  Future<bool> deleteByActivityId(String activityId) {
    return deleteByIndex(r'activityId', [activityId]);
  }

  bool deleteByActivityIdSync(String activityId) {
    return deleteByIndexSync(r'activityId', [activityId]);
  }

  Future<List<StudyActivityModel?>> getAllByActivityId(
    List<String> activityIdValues,
  ) {
    final values = activityIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'activityId', values);
  }

  List<StudyActivityModel?> getAllByActivityIdSync(
    List<String> activityIdValues,
  ) {
    final values = activityIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'activityId', values);
  }

  Future<int> deleteAllByActivityId(List<String> activityIdValues) {
    final values = activityIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'activityId', values);
  }

  int deleteAllByActivityIdSync(List<String> activityIdValues) {
    final values = activityIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'activityId', values);
  }

  Future<Id> putByActivityId(StudyActivityModel object) {
    return putByIndex(r'activityId', object);
  }

  Id putByActivityIdSync(StudyActivityModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'activityId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByActivityId(List<StudyActivityModel> objects) {
    return putAllByIndex(r'activityId', objects);
  }

  List<Id> putAllByActivityIdSync(
    List<StudyActivityModel> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'activityId', objects, saveLinks: saveLinks);
  }
}

extension StudyActivityModelQueryWhereSort
    on QueryBuilder<StudyActivityModel, StudyActivityModel, QWhere> {
  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension StudyActivityModelQueryWhere
    on QueryBuilder<StudyActivityModel, StudyActivityModel, QWhereClause> {
  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterWhereClause>
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

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterWhereClause>
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

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterWhereClause>
  activityIdEqualTo(String activityId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'activityId', value: [activityId]),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterWhereClause>
  activityIdNotEqualTo(String activityId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'activityId',
                lower: [],
                upper: [activityId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'activityId',
                lower: [activityId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'activityId',
                lower: [activityId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'activityId',
                lower: [],
                upper: [activityId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterWhereClause>
  userIdEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'userId', value: [userId]),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterWhereClause>
  userIdNotEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userId',
                lower: [],
                upper: [userId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userId',
                lower: [userId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userId',
                lower: [userId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userId',
                lower: [],
                upper: [userId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterWhereClause>
  topicIdEqualTo(String topicId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'topicId', value: [topicId]),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterWhereClause>
  topicIdNotEqualTo(String topicId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'topicId',
                lower: [],
                upper: [topicId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'topicId',
                lower: [topicId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'topicId',
                lower: [topicId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'topicId',
                lower: [],
                upper: [topicId],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension StudyActivityModelQueryFilter
    on QueryBuilder<StudyActivityModel, StudyActivityModel, QFilterCondition> {
  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  activityIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'activityId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  activityIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'activityId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  activityIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'activityId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  activityIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'activityId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  activityIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'activityId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  activityIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'activityId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  activityIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'activityId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  activityIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'activityId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  activityIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'activityId', value: ''),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  activityIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'activityId', value: ''),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  durationMillisecondsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'durationMilliseconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  durationMillisecondsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'durationMilliseconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  durationMillisecondsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'durationMilliseconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  durationMillisecondsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'durationMilliseconds',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
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

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
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

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
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

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  masteryAfterEventEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'masteryAfterEvent',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  masteryAfterEventGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'masteryAfterEvent',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  masteryAfterEventLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'masteryAfterEvent',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  masteryAfterEventBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'masteryAfterEvent',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  occurredAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'occurredAt', value: value),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  occurredAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'occurredAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  occurredAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'occurredAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  occurredAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'occurredAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  responseTimeMillisecondsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'responseTimeMilliseconds'),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  responseTimeMillisecondsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'responseTimeMilliseconds'),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  responseTimeMillisecondsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'responseTimeMilliseconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  responseTimeMillisecondsGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'responseTimeMilliseconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  responseTimeMillisecondsLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'responseTimeMilliseconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  responseTimeMillisecondsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'responseTimeMilliseconds',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  topicIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'topicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  topicIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'topicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  topicIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'topicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  topicIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'topicId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  topicIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'topicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  topicIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'topicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  topicIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'topicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  topicIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'topicId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  topicIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'topicId', value: ''),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  topicIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'topicId', value: ''),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  typeEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  typeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  typeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  typeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'type',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  typeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  typeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'type',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'type', value: ''),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'type', value: ''),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  userIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  userIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  userIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  userIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'userId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  userIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  userIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'userId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'userId', value: ''),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'userId', value: ''),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  wasCorrectIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'wasCorrect'),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  wasCorrectIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'wasCorrect'),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  wasCorrectEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'wasCorrect', value: value),
      );
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterFilterCondition>
  wasFirstAttemptEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'wasFirstAttempt', value: value),
      );
    });
  }
}

extension StudyActivityModelQueryObject
    on QueryBuilder<StudyActivityModel, StudyActivityModel, QFilterCondition> {}

extension StudyActivityModelQueryLinks
    on QueryBuilder<StudyActivityModel, StudyActivityModel, QFilterCondition> {}

extension StudyActivityModelQuerySortBy
    on QueryBuilder<StudyActivityModel, StudyActivityModel, QSortBy> {
  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  sortByActivityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityId', Sort.asc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  sortByActivityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityId', Sort.desc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  sortByDurationMilliseconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationMilliseconds', Sort.asc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  sortByDurationMillisecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationMilliseconds', Sort.desc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  sortByMasteryAfterEvent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'masteryAfterEvent', Sort.asc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  sortByMasteryAfterEventDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'masteryAfterEvent', Sort.desc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  sortByOccurredAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occurredAt', Sort.asc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  sortByOccurredAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occurredAt', Sort.desc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  sortByResponseTimeMilliseconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseTimeMilliseconds', Sort.asc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  sortByResponseTimeMillisecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseTimeMilliseconds', Sort.desc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  sortByTopicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topicId', Sort.asc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  sortByTopicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topicId', Sort.desc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  sortByWasCorrect() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasCorrect', Sort.asc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  sortByWasCorrectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasCorrect', Sort.desc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  sortByWasFirstAttempt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasFirstAttempt', Sort.asc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  sortByWasFirstAttemptDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasFirstAttempt', Sort.desc);
    });
  }
}

extension StudyActivityModelQuerySortThenBy
    on QueryBuilder<StudyActivityModel, StudyActivityModel, QSortThenBy> {
  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  thenByActivityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityId', Sort.asc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  thenByActivityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityId', Sort.desc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  thenByDurationMilliseconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationMilliseconds', Sort.asc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  thenByDurationMillisecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationMilliseconds', Sort.desc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  thenByMasteryAfterEvent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'masteryAfterEvent', Sort.asc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  thenByMasteryAfterEventDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'masteryAfterEvent', Sort.desc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  thenByOccurredAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occurredAt', Sort.asc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  thenByOccurredAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occurredAt', Sort.desc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  thenByResponseTimeMilliseconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseTimeMilliseconds', Sort.asc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  thenByResponseTimeMillisecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseTimeMilliseconds', Sort.desc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  thenByTopicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topicId', Sort.asc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  thenByTopicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topicId', Sort.desc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  thenByWasCorrect() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasCorrect', Sort.asc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  thenByWasCorrectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasCorrect', Sort.desc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  thenByWasFirstAttempt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasFirstAttempt', Sort.asc);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QAfterSortBy>
  thenByWasFirstAttemptDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasFirstAttempt', Sort.desc);
    });
  }
}

extension StudyActivityModelQueryWhereDistinct
    on QueryBuilder<StudyActivityModel, StudyActivityModel, QDistinct> {
  QueryBuilder<StudyActivityModel, StudyActivityModel, QDistinct>
  distinctByActivityId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activityId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QDistinct>
  distinctByDurationMilliseconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'durationMilliseconds');
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QDistinct>
  distinctByMasteryAfterEvent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'masteryAfterEvent');
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QDistinct>
  distinctByOccurredAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'occurredAt');
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QDistinct>
  distinctByResponseTimeMilliseconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'responseTimeMilliseconds');
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QDistinct>
  distinctByTopicId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'topicId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QDistinct>
  distinctByType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QDistinct>
  distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QDistinct>
  distinctByWasCorrect() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wasCorrect');
    });
  }

  QueryBuilder<StudyActivityModel, StudyActivityModel, QDistinct>
  distinctByWasFirstAttempt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wasFirstAttempt');
    });
  }
}

extension StudyActivityModelQueryProperty
    on QueryBuilder<StudyActivityModel, StudyActivityModel, QQueryProperty> {
  QueryBuilder<StudyActivityModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<StudyActivityModel, String, QQueryOperations>
  activityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activityId');
    });
  }

  QueryBuilder<StudyActivityModel, int, QQueryOperations>
  durationMillisecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'durationMilliseconds');
    });
  }

  QueryBuilder<StudyActivityModel, double, QQueryOperations>
  masteryAfterEventProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'masteryAfterEvent');
    });
  }

  QueryBuilder<StudyActivityModel, DateTime, QQueryOperations>
  occurredAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'occurredAt');
    });
  }

  QueryBuilder<StudyActivityModel, int?, QQueryOperations>
  responseTimeMillisecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'responseTimeMilliseconds');
    });
  }

  QueryBuilder<StudyActivityModel, String, QQueryOperations> topicIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'topicId');
    });
  }

  QueryBuilder<StudyActivityModel, String, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<StudyActivityModel, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<StudyActivityModel, bool?, QQueryOperations>
  wasCorrectProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wasCorrect');
    });
  }

  QueryBuilder<StudyActivityModel, bool, QQueryOperations>
  wasFirstAttemptProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wasFirstAttempt');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetReviewScheduleModelCollection on Isar {
  IsarCollection<ReviewScheduleModel> get reviewScheduleModels =>
      this.collection();
}

const ReviewScheduleModelSchema = CollectionSchema(
  name: r'ReviewScheduleModel',
  id: -6914563460042181626,
  properties: {
    r'dueAt': PropertySchema(id: 0, name: r'dueAt', type: IsarType.dateTime),
    r'easeFactor': PropertySchema(
      id: 1,
      name: r'easeFactor',
      type: IsarType.double,
    ),
    r'intervalDays': PropertySchema(
      id: 2,
      name: r'intervalDays',
      type: IsarType.long,
    ),
    r'lapses': PropertySchema(id: 3, name: r'lapses', type: IsarType.long),
    r'lastReviewedAt': PropertySchema(
      id: 4,
      name: r'lastReviewedAt',
      type: IsarType.dateTime,
    ),
    r'recordKey': PropertySchema(
      id: 5,
      name: r'recordKey',
      type: IsarType.string,
    ),
    r'repetitions': PropertySchema(
      id: 6,
      name: r'repetitions',
      type: IsarType.long,
    ),
    r'topicId': PropertySchema(id: 7, name: r'topicId', type: IsarType.string),
    r'urgency': PropertySchema(id: 8, name: r'urgency', type: IsarType.string),
    r'userId': PropertySchema(id: 9, name: r'userId', type: IsarType.string),
  },

  estimateSize: _reviewScheduleModelEstimateSize,
  serialize: _reviewScheduleModelSerialize,
  deserialize: _reviewScheduleModelDeserialize,
  deserializeProp: _reviewScheduleModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'recordKey': IndexSchema(
      id: -1694304532238354687,
      name: r'recordKey',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'recordKey',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'userId': IndexSchema(
      id: -2005826577402374815,
      name: r'userId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'topicId': IndexSchema(
      id: 3718206658163357569,
      name: r'topicId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'topicId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'dueAt': IndexSchema(
      id: 3701044435752459706,
      name: r'dueAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'dueAt',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _reviewScheduleModelGetId,
  getLinks: _reviewScheduleModelGetLinks,
  attach: _reviewScheduleModelAttach,
  version: '3.3.2',
);

int _reviewScheduleModelEstimateSize(
  ReviewScheduleModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.recordKey.length * 3;
  bytesCount += 3 + object.topicId.length * 3;
  bytesCount += 3 + object.urgency.length * 3;
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _reviewScheduleModelSerialize(
  ReviewScheduleModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.dueAt);
  writer.writeDouble(offsets[1], object.easeFactor);
  writer.writeLong(offsets[2], object.intervalDays);
  writer.writeLong(offsets[3], object.lapses);
  writer.writeDateTime(offsets[4], object.lastReviewedAt);
  writer.writeString(offsets[5], object.recordKey);
  writer.writeLong(offsets[6], object.repetitions);
  writer.writeString(offsets[7], object.topicId);
  writer.writeString(offsets[8], object.urgency);
  writer.writeString(offsets[9], object.userId);
}

ReviewScheduleModel _reviewScheduleModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ReviewScheduleModel();
  object.dueAt = reader.readDateTime(offsets[0]);
  object.easeFactor = reader.readDouble(offsets[1]);
  object.id = id;
  object.intervalDays = reader.readLong(offsets[2]);
  object.lapses = reader.readLong(offsets[3]);
  object.lastReviewedAt = reader.readDateTimeOrNull(offsets[4]);
  object.recordKey = reader.readString(offsets[5]);
  object.repetitions = reader.readLong(offsets[6]);
  object.topicId = reader.readString(offsets[7]);
  object.urgency = reader.readString(offsets[8]);
  object.userId = reader.readString(offsets[9]);
  return object;
}

P _reviewScheduleModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _reviewScheduleModelGetId(ReviewScheduleModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _reviewScheduleModelGetLinks(
  ReviewScheduleModel object,
) {
  return [];
}

void _reviewScheduleModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  ReviewScheduleModel object,
) {
  object.id = id;
}

extension ReviewScheduleModelByIndex on IsarCollection<ReviewScheduleModel> {
  Future<ReviewScheduleModel?> getByRecordKey(String recordKey) {
    return getByIndex(r'recordKey', [recordKey]);
  }

  ReviewScheduleModel? getByRecordKeySync(String recordKey) {
    return getByIndexSync(r'recordKey', [recordKey]);
  }

  Future<bool> deleteByRecordKey(String recordKey) {
    return deleteByIndex(r'recordKey', [recordKey]);
  }

  bool deleteByRecordKeySync(String recordKey) {
    return deleteByIndexSync(r'recordKey', [recordKey]);
  }

  Future<List<ReviewScheduleModel?>> getAllByRecordKey(
    List<String> recordKeyValues,
  ) {
    final values = recordKeyValues.map((e) => [e]).toList();
    return getAllByIndex(r'recordKey', values);
  }

  List<ReviewScheduleModel?> getAllByRecordKeySync(
    List<String> recordKeyValues,
  ) {
    final values = recordKeyValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'recordKey', values);
  }

  Future<int> deleteAllByRecordKey(List<String> recordKeyValues) {
    final values = recordKeyValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'recordKey', values);
  }

  int deleteAllByRecordKeySync(List<String> recordKeyValues) {
    final values = recordKeyValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'recordKey', values);
  }

  Future<Id> putByRecordKey(ReviewScheduleModel object) {
    return putByIndex(r'recordKey', object);
  }

  Id putByRecordKeySync(ReviewScheduleModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'recordKey', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByRecordKey(List<ReviewScheduleModel> objects) {
    return putAllByIndex(r'recordKey', objects);
  }

  List<Id> putAllByRecordKeySync(
    List<ReviewScheduleModel> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'recordKey', objects, saveLinks: saveLinks);
  }
}

extension ReviewScheduleModelQueryWhereSort
    on QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QWhere> {
  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterWhere>
  anyDueAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'dueAt'),
      );
    });
  }
}

extension ReviewScheduleModelQueryWhere
    on QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QWhereClause> {
  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterWhereClause>
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

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterWhereClause>
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

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterWhereClause>
  recordKeyEqualTo(String recordKey) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'recordKey', value: [recordKey]),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterWhereClause>
  recordKeyNotEqualTo(String recordKey) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'recordKey',
                lower: [],
                upper: [recordKey],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'recordKey',
                lower: [recordKey],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'recordKey',
                lower: [recordKey],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'recordKey',
                lower: [],
                upper: [recordKey],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterWhereClause>
  userIdEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'userId', value: [userId]),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterWhereClause>
  userIdNotEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userId',
                lower: [],
                upper: [userId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userId',
                lower: [userId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userId',
                lower: [userId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userId',
                lower: [],
                upper: [userId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterWhereClause>
  topicIdEqualTo(String topicId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'topicId', value: [topicId]),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterWhereClause>
  topicIdNotEqualTo(String topicId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'topicId',
                lower: [],
                upper: [topicId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'topicId',
                lower: [topicId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'topicId',
                lower: [topicId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'topicId',
                lower: [],
                upper: [topicId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterWhereClause>
  dueAtEqualTo(DateTime dueAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'dueAt', value: [dueAt]),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterWhereClause>
  dueAtNotEqualTo(DateTime dueAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'dueAt',
                lower: [],
                upper: [dueAt],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'dueAt',
                lower: [dueAt],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'dueAt',
                lower: [dueAt],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'dueAt',
                lower: [],
                upper: [dueAt],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterWhereClause>
  dueAtGreaterThan(DateTime dueAt, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'dueAt',
          lower: [dueAt],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterWhereClause>
  dueAtLessThan(DateTime dueAt, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'dueAt',
          lower: [],
          upper: [dueAt],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterWhereClause>
  dueAtBetween(
    DateTime lowerDueAt,
    DateTime upperDueAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'dueAt',
          lower: [lowerDueAt],
          includeLower: includeLower,
          upper: [upperDueAt],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension ReviewScheduleModelQueryFilter
    on
        QueryBuilder<
          ReviewScheduleModel,
          ReviewScheduleModel,
          QFilterCondition
        > {
  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  dueAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dueAt', value: value),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  dueAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dueAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  dueAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dueAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  dueAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dueAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  easeFactorEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'easeFactor',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  easeFactorGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'easeFactor',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  easeFactorLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'easeFactor',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  easeFactorBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'easeFactor',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  intervalDaysEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'intervalDays', value: value),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  intervalDaysGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'intervalDays',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  intervalDaysLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'intervalDays',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  intervalDaysBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'intervalDays',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  lapsesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lapses', value: value),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  lapsesGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lapses',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  lapsesLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lapses',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  lapsesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lapses',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  lastReviewedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastReviewedAt'),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  lastReviewedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastReviewedAt'),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  lastReviewedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastReviewedAt', value: value),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  lastReviewedAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastReviewedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  lastReviewedAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastReviewedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  lastReviewedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastReviewedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  recordKeyEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'recordKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  recordKeyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'recordKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  recordKeyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'recordKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  recordKeyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'recordKey',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  recordKeyStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'recordKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  recordKeyEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'recordKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  recordKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'recordKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  recordKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'recordKey',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  recordKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'recordKey', value: ''),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  recordKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'recordKey', value: ''),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  repetitionsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'repetitions', value: value),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  repetitionsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'repetitions',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  repetitionsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'repetitions',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  repetitionsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'repetitions',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  topicIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'topicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  topicIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'topicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  topicIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'topicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  topicIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'topicId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  topicIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'topicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  topicIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'topicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  topicIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'topicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  topicIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'topicId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  topicIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'topicId', value: ''),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  topicIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'topicId', value: ''),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  urgencyEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'urgency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  urgencyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'urgency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  urgencyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'urgency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  urgencyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'urgency',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  urgencyStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'urgency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  urgencyEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'urgency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  urgencyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'urgency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  urgencyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'urgency',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  urgencyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'urgency', value: ''),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  urgencyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'urgency', value: ''),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  userIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  userIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  userIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  userIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'userId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  userIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  userIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'userId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'userId', value: ''),
      );
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterFilterCondition>
  userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'userId', value: ''),
      );
    });
  }
}

extension ReviewScheduleModelQueryObject
    on
        QueryBuilder<
          ReviewScheduleModel,
          ReviewScheduleModel,
          QFilterCondition
        > {}

extension ReviewScheduleModelQueryLinks
    on
        QueryBuilder<
          ReviewScheduleModel,
          ReviewScheduleModel,
          QFilterCondition
        > {}

extension ReviewScheduleModelQuerySortBy
    on QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QSortBy> {
  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  sortByDueAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueAt', Sort.asc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  sortByDueAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueAt', Sort.desc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  sortByEaseFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'easeFactor', Sort.asc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  sortByEaseFactorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'easeFactor', Sort.desc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  sortByIntervalDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intervalDays', Sort.asc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  sortByIntervalDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intervalDays', Sort.desc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  sortByLapses() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lapses', Sort.asc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  sortByLapsesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lapses', Sort.desc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  sortByLastReviewedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReviewedAt', Sort.asc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  sortByLastReviewedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReviewedAt', Sort.desc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  sortByRecordKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordKey', Sort.asc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  sortByRecordKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordKey', Sort.desc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  sortByRepetitions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repetitions', Sort.asc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  sortByRepetitionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repetitions', Sort.desc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  sortByTopicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topicId', Sort.asc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  sortByTopicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topicId', Sort.desc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  sortByUrgency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'urgency', Sort.asc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  sortByUrgencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'urgency', Sort.desc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension ReviewScheduleModelQuerySortThenBy
    on QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QSortThenBy> {
  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  thenByDueAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueAt', Sort.asc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  thenByDueAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueAt', Sort.desc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  thenByEaseFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'easeFactor', Sort.asc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  thenByEaseFactorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'easeFactor', Sort.desc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  thenByIntervalDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intervalDays', Sort.asc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  thenByIntervalDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intervalDays', Sort.desc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  thenByLapses() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lapses', Sort.asc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  thenByLapsesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lapses', Sort.desc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  thenByLastReviewedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReviewedAt', Sort.asc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  thenByLastReviewedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReviewedAt', Sort.desc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  thenByRecordKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordKey', Sort.asc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  thenByRecordKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordKey', Sort.desc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  thenByRepetitions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repetitions', Sort.asc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  thenByRepetitionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repetitions', Sort.desc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  thenByTopicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topicId', Sort.asc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  thenByTopicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topicId', Sort.desc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  thenByUrgency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'urgency', Sort.asc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  thenByUrgencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'urgency', Sort.desc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QAfterSortBy>
  thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension ReviewScheduleModelQueryWhereDistinct
    on QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QDistinct> {
  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QDistinct>
  distinctByDueAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dueAt');
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QDistinct>
  distinctByEaseFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'easeFactor');
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QDistinct>
  distinctByIntervalDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'intervalDays');
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QDistinct>
  distinctByLapses() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lapses');
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QDistinct>
  distinctByLastReviewedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastReviewedAt');
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QDistinct>
  distinctByRecordKey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recordKey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QDistinct>
  distinctByRepetitions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'repetitions');
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QDistinct>
  distinctByTopicId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'topicId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QDistinct>
  distinctByUrgency({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'urgency', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QDistinct>
  distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension ReviewScheduleModelQueryProperty
    on QueryBuilder<ReviewScheduleModel, ReviewScheduleModel, QQueryProperty> {
  QueryBuilder<ReviewScheduleModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ReviewScheduleModel, DateTime, QQueryOperations>
  dueAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dueAt');
    });
  }

  QueryBuilder<ReviewScheduleModel, double, QQueryOperations>
  easeFactorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'easeFactor');
    });
  }

  QueryBuilder<ReviewScheduleModel, int, QQueryOperations>
  intervalDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'intervalDays');
    });
  }

  QueryBuilder<ReviewScheduleModel, int, QQueryOperations> lapsesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lapses');
    });
  }

  QueryBuilder<ReviewScheduleModel, DateTime?, QQueryOperations>
  lastReviewedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastReviewedAt');
    });
  }

  QueryBuilder<ReviewScheduleModel, String, QQueryOperations>
  recordKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recordKey');
    });
  }

  QueryBuilder<ReviewScheduleModel, int, QQueryOperations>
  repetitionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'repetitions');
    });
  }

  QueryBuilder<ReviewScheduleModel, String, QQueryOperations>
  topicIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'topicId');
    });
  }

  QueryBuilder<ReviewScheduleModel, String, QQueryOperations>
  urgencyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'urgency');
    });
  }

  QueryBuilder<ReviewScheduleModel, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLearningGoalModelCollection on Isar {
  IsarCollection<LearningGoalModel> get learningGoalModels => this.collection();
}

const LearningGoalModelSchema = CollectionSchema(
  name: r'LearningGoalModel',
  id: 4112806384026218449,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'deadline': PropertySchema(
      id: 1,
      name: r'deadline',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 2,
      name: r'description',
      type: IsarType.string,
    ),
    r'goalId': PropertySchema(id: 3, name: r'goalId', type: IsarType.string),
    r'status': PropertySchema(id: 4, name: r'status', type: IsarType.string),
    r'targetCompletionRate': PropertySchema(
      id: 5,
      name: r'targetCompletionRate',
      type: IsarType.double,
    ),
    r'topicId': PropertySchema(id: 6, name: r'topicId', type: IsarType.string),
    r'userId': PropertySchema(id: 7, name: r'userId', type: IsarType.string),
  },

  estimateSize: _learningGoalModelEstimateSize,
  serialize: _learningGoalModelSerialize,
  deserialize: _learningGoalModelDeserialize,
  deserializeProp: _learningGoalModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'goalId': IndexSchema(
      id: 2738626632585230611,
      name: r'goalId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'goalId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'userId': IndexSchema(
      id: -2005826577402374815,
      name: r'userId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _learningGoalModelGetId,
  getLinks: _learningGoalModelGetLinks,
  attach: _learningGoalModelAttach,
  version: '3.3.2',
);

int _learningGoalModelEstimateSize(
  LearningGoalModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.goalId.length * 3;
  bytesCount += 3 + object.status.length * 3;
  {
    final value = object.topicId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _learningGoalModelSerialize(
  LearningGoalModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeDateTime(offsets[1], object.deadline);
  writer.writeString(offsets[2], object.description);
  writer.writeString(offsets[3], object.goalId);
  writer.writeString(offsets[4], object.status);
  writer.writeDouble(offsets[5], object.targetCompletionRate);
  writer.writeString(offsets[6], object.topicId);
  writer.writeString(offsets[7], object.userId);
}

LearningGoalModel _learningGoalModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LearningGoalModel();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.deadline = reader.readDateTime(offsets[1]);
  object.description = reader.readString(offsets[2]);
  object.goalId = reader.readString(offsets[3]);
  object.id = id;
  object.status = reader.readString(offsets[4]);
  object.targetCompletionRate = reader.readDouble(offsets[5]);
  object.topicId = reader.readStringOrNull(offsets[6]);
  object.userId = reader.readString(offsets[7]);
  return object;
}

P _learningGoalModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _learningGoalModelGetId(LearningGoalModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _learningGoalModelGetLinks(
  LearningGoalModel object,
) {
  return [];
}

void _learningGoalModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  LearningGoalModel object,
) {
  object.id = id;
}

extension LearningGoalModelByIndex on IsarCollection<LearningGoalModel> {
  Future<LearningGoalModel?> getByGoalId(String goalId) {
    return getByIndex(r'goalId', [goalId]);
  }

  LearningGoalModel? getByGoalIdSync(String goalId) {
    return getByIndexSync(r'goalId', [goalId]);
  }

  Future<bool> deleteByGoalId(String goalId) {
    return deleteByIndex(r'goalId', [goalId]);
  }

  bool deleteByGoalIdSync(String goalId) {
    return deleteByIndexSync(r'goalId', [goalId]);
  }

  Future<List<LearningGoalModel?>> getAllByGoalId(List<String> goalIdValues) {
    final values = goalIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'goalId', values);
  }

  List<LearningGoalModel?> getAllByGoalIdSync(List<String> goalIdValues) {
    final values = goalIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'goalId', values);
  }

  Future<int> deleteAllByGoalId(List<String> goalIdValues) {
    final values = goalIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'goalId', values);
  }

  int deleteAllByGoalIdSync(List<String> goalIdValues) {
    final values = goalIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'goalId', values);
  }

  Future<Id> putByGoalId(LearningGoalModel object) {
    return putByIndex(r'goalId', object);
  }

  Id putByGoalIdSync(LearningGoalModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'goalId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByGoalId(List<LearningGoalModel> objects) {
    return putAllByIndex(r'goalId', objects);
  }

  List<Id> putAllByGoalIdSync(
    List<LearningGoalModel> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'goalId', objects, saveLinks: saveLinks);
  }
}

extension LearningGoalModelQueryWhereSort
    on QueryBuilder<LearningGoalModel, LearningGoalModel, QWhere> {
  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LearningGoalModelQueryWhere
    on QueryBuilder<LearningGoalModel, LearningGoalModel, QWhereClause> {
  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterWhereClause>
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

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterWhereClause>
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

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterWhereClause>
  goalIdEqualTo(String goalId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'goalId', value: [goalId]),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterWhereClause>
  goalIdNotEqualTo(String goalId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'goalId',
                lower: [],
                upper: [goalId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'goalId',
                lower: [goalId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'goalId',
                lower: [goalId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'goalId',
                lower: [],
                upper: [goalId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterWhereClause>
  userIdEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'userId', value: [userId]),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterWhereClause>
  userIdNotEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userId',
                lower: [],
                upper: [userId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userId',
                lower: [userId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userId',
                lower: [userId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userId',
                lower: [],
                upper: [userId],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension LearningGoalModelQueryFilter
    on QueryBuilder<LearningGoalModel, LearningGoalModel, QFilterCondition> {
  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  createdAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  createdAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  deadlineEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'deadline', value: value),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  deadlineGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'deadline',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  deadlineLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'deadline',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  deadlineBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'deadline',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  descriptionEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'description',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  descriptionStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  descriptionEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'description',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  goalIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'goalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  goalIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'goalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  goalIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'goalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  goalIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'goalId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  goalIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'goalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  goalIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'goalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  goalIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'goalId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  goalIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'goalId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  goalIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'goalId', value: ''),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  goalIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'goalId', value: ''),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
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

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
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

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
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

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  statusEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  statusGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  statusLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  statusBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'status',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  statusStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  statusEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'status',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'status', value: ''),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'status', value: ''),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  targetCompletionRateEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'targetCompletionRate',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  targetCompletionRateGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'targetCompletionRate',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  targetCompletionRateLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'targetCompletionRate',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  targetCompletionRateBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'targetCompletionRate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  topicIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'topicId'),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  topicIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'topicId'),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  topicIdEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'topicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  topicIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'topicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  topicIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'topicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  topicIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'topicId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  topicIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'topicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  topicIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'topicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  topicIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'topicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  topicIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'topicId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  topicIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'topicId', value: ''),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  topicIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'topicId', value: ''),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  userIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  userIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  userIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  userIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'userId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  userIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  userIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'userId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'userId', value: ''),
      );
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterFilterCondition>
  userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'userId', value: ''),
      );
    });
  }
}

extension LearningGoalModelQueryObject
    on QueryBuilder<LearningGoalModel, LearningGoalModel, QFilterCondition> {}

extension LearningGoalModelQueryLinks
    on QueryBuilder<LearningGoalModel, LearningGoalModel, QFilterCondition> {}

extension LearningGoalModelQuerySortBy
    on QueryBuilder<LearningGoalModel, LearningGoalModel, QSortBy> {
  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterSortBy>
  sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterSortBy>
  sortByDeadline() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deadline', Sort.asc);
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterSortBy>
  sortByDeadlineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deadline', Sort.desc);
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterSortBy>
  sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterSortBy>
  sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterSortBy>
  sortByGoalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'goalId', Sort.asc);
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterSortBy>
  sortByGoalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'goalId', Sort.desc);
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterSortBy>
  sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterSortBy>
  sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterSortBy>
  sortByTargetCompletionRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCompletionRate', Sort.asc);
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterSortBy>
  sortByTargetCompletionRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCompletionRate', Sort.desc);
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterSortBy>
  sortByTopicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topicId', Sort.asc);
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterSortBy>
  sortByTopicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topicId', Sort.desc);
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterSortBy>
  sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterSortBy>
  sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension LearningGoalModelQuerySortThenBy
    on QueryBuilder<LearningGoalModel, LearningGoalModel, QSortThenBy> {
  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterSortBy>
  thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterSortBy>
  thenByDeadline() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deadline', Sort.asc);
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterSortBy>
  thenByDeadlineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deadline', Sort.desc);
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterSortBy>
  thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterSortBy>
  thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterSortBy>
  thenByGoalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'goalId', Sort.asc);
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterSortBy>
  thenByGoalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'goalId', Sort.desc);
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterSortBy>
  thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterSortBy>
  thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterSortBy>
  thenByTargetCompletionRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCompletionRate', Sort.asc);
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterSortBy>
  thenByTargetCompletionRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCompletionRate', Sort.desc);
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterSortBy>
  thenByTopicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topicId', Sort.asc);
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterSortBy>
  thenByTopicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topicId', Sort.desc);
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterSortBy>
  thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QAfterSortBy>
  thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension LearningGoalModelQueryWhereDistinct
    on QueryBuilder<LearningGoalModel, LearningGoalModel, QDistinct> {
  QueryBuilder<LearningGoalModel, LearningGoalModel, QDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QDistinct>
  distinctByDeadline() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deadline');
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QDistinct>
  distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QDistinct>
  distinctByGoalId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'goalId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QDistinct>
  distinctByStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QDistinct>
  distinctByTargetCompletionRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetCompletionRate');
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QDistinct>
  distinctByTopicId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'topicId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LearningGoalModel, LearningGoalModel, QDistinct>
  distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension LearningGoalModelQueryProperty
    on QueryBuilder<LearningGoalModel, LearningGoalModel, QQueryProperty> {
  QueryBuilder<LearningGoalModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LearningGoalModel, DateTime, QQueryOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<LearningGoalModel, DateTime, QQueryOperations>
  deadlineProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deadline');
    });
  }

  QueryBuilder<LearningGoalModel, String, QQueryOperations>
  descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<LearningGoalModel, String, QQueryOperations> goalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'goalId');
    });
  }

  QueryBuilder<LearningGoalModel, String, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<LearningGoalModel, double, QQueryOperations>
  targetCompletionRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetCompletionRate');
    });
  }

  QueryBuilder<LearningGoalModel, String?, QQueryOperations> topicIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'topicId');
    });
  }

  QueryBuilder<LearningGoalModel, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
