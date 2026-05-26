// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_attempt_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetQuizAttemptModelCollection on Isar {
  IsarCollection<QuizAttemptModel> get quizAttemptModels => this.collection();
}

const QuizAttemptModelSchema = CollectionSchema(
  name: r'QuizAttemptModel',
  id: -4063829834006677212,
  properties: {
    r'attemptId': PropertySchema(
      id: 0,
      name: r'attemptId',
      type: IsarType.string,
    ),
    r'coinsEarned': PropertySchema(
      id: 1,
      name: r'coinsEarned',
      type: IsarType.long,
    ),
    r'completedAt': PropertySchema(
      id: 2,
      name: r'completedAt',
      type: IsarType.dateTime,
    ),
    r'correctAnswers': PropertySchema(
      id: 3,
      name: r'correctAnswers',
      type: IsarType.long,
    ),
    r'quizId': PropertySchema(id: 4, name: r'quizId', type: IsarType.string),
    r'selectedOptionIndexes': PropertySchema(
      id: 5,
      name: r'selectedOptionIndexes',
      type: IsarType.longList,
    ),
    r'startedAt': PropertySchema(
      id: 6,
      name: r'startedAt',
      type: IsarType.dateTime,
    ),
    r'topicId': PropertySchema(id: 7, name: r'topicId', type: IsarType.string),
    r'totalQuestions': PropertySchema(
      id: 8,
      name: r'totalQuestions',
      type: IsarType.long,
    ),
    r'userId': PropertySchema(id: 9, name: r'userId', type: IsarType.string),
    r'xpEarned': PropertySchema(id: 10, name: r'xpEarned', type: IsarType.long),
  },

  estimateSize: _quizAttemptModelEstimateSize,
  serialize: _quizAttemptModelSerialize,
  deserialize: _quizAttemptModelDeserialize,
  deserializeProp: _quizAttemptModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'attemptId': IndexSchema(
      id: 3768995775447394589,
      name: r'attemptId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'attemptId',
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
    r'quizId': IndexSchema(
      id: -3109243004246223161,
      name: r'quizId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'quizId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _quizAttemptModelGetId,
  getLinks: _quizAttemptModelGetLinks,
  attach: _quizAttemptModelAttach,
  version: '3.3.2',
);

int _quizAttemptModelEstimateSize(
  QuizAttemptModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.attemptId.length * 3;
  bytesCount += 3 + object.quizId.length * 3;
  bytesCount += 3 + object.selectedOptionIndexes.length * 8;
  bytesCount += 3 + object.topicId.length * 3;
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _quizAttemptModelSerialize(
  QuizAttemptModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.attemptId);
  writer.writeLong(offsets[1], object.coinsEarned);
  writer.writeDateTime(offsets[2], object.completedAt);
  writer.writeLong(offsets[3], object.correctAnswers);
  writer.writeString(offsets[4], object.quizId);
  writer.writeLongList(offsets[5], object.selectedOptionIndexes);
  writer.writeDateTime(offsets[6], object.startedAt);
  writer.writeString(offsets[7], object.topicId);
  writer.writeLong(offsets[8], object.totalQuestions);
  writer.writeString(offsets[9], object.userId);
  writer.writeLong(offsets[10], object.xpEarned);
}

QuizAttemptModel _quizAttemptModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = QuizAttemptModel();
  object.attemptId = reader.readString(offsets[0]);
  object.coinsEarned = reader.readLong(offsets[1]);
  object.completedAt = reader.readDateTime(offsets[2]);
  object.correctAnswers = reader.readLong(offsets[3]);
  object.id = id;
  object.quizId = reader.readString(offsets[4]);
  object.selectedOptionIndexes = reader.readLongList(offsets[5]) ?? [];
  object.startedAt = reader.readDateTime(offsets[6]);
  object.topicId = reader.readString(offsets[7]);
  object.totalQuestions = reader.readLong(offsets[8]);
  object.userId = reader.readString(offsets[9]);
  object.xpEarned = reader.readLong(offsets[10]);
  return object;
}

P _quizAttemptModelDeserializeProp<P>(
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
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLongList(offset) ?? []) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _quizAttemptModelGetId(QuizAttemptModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _quizAttemptModelGetLinks(QuizAttemptModel object) {
  return [];
}

void _quizAttemptModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  QuizAttemptModel object,
) {
  object.id = id;
}

extension QuizAttemptModelByIndex on IsarCollection<QuizAttemptModel> {
  Future<QuizAttemptModel?> getByAttemptId(String attemptId) {
    return getByIndex(r'attemptId', [attemptId]);
  }

  QuizAttemptModel? getByAttemptIdSync(String attemptId) {
    return getByIndexSync(r'attemptId', [attemptId]);
  }

  Future<bool> deleteByAttemptId(String attemptId) {
    return deleteByIndex(r'attemptId', [attemptId]);
  }

  bool deleteByAttemptIdSync(String attemptId) {
    return deleteByIndexSync(r'attemptId', [attemptId]);
  }

  Future<List<QuizAttemptModel?>> getAllByAttemptId(
    List<String> attemptIdValues,
  ) {
    final values = attemptIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'attemptId', values);
  }

  List<QuizAttemptModel?> getAllByAttemptIdSync(List<String> attemptIdValues) {
    final values = attemptIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'attemptId', values);
  }

  Future<int> deleteAllByAttemptId(List<String> attemptIdValues) {
    final values = attemptIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'attemptId', values);
  }

  int deleteAllByAttemptIdSync(List<String> attemptIdValues) {
    final values = attemptIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'attemptId', values);
  }

  Future<Id> putByAttemptId(QuizAttemptModel object) {
    return putByIndex(r'attemptId', object);
  }

  Id putByAttemptIdSync(QuizAttemptModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'attemptId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByAttemptId(List<QuizAttemptModel> objects) {
    return putAllByIndex(r'attemptId', objects);
  }

  List<Id> putAllByAttemptIdSync(
    List<QuizAttemptModel> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'attemptId', objects, saveLinks: saveLinks);
  }
}

extension QuizAttemptModelQueryWhereSort
    on QueryBuilder<QuizAttemptModel, QuizAttemptModel, QWhere> {
  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension QuizAttemptModelQueryWhere
    on QueryBuilder<QuizAttemptModel, QuizAttemptModel, QWhereClause> {
  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterWhereClause>
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

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterWhereClause>
  attemptIdEqualTo(String attemptId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'attemptId', value: [attemptId]),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterWhereClause>
  attemptIdNotEqualTo(String attemptId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'attemptId',
                lower: [],
                upper: [attemptId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'attemptId',
                lower: [attemptId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'attemptId',
                lower: [attemptId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'attemptId',
                lower: [],
                upper: [attemptId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterWhereClause>
  userIdEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'userId', value: [userId]),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterWhereClause>
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

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterWhereClause>
  quizIdEqualTo(String quizId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'quizId', value: [quizId]),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterWhereClause>
  quizIdNotEqualTo(String quizId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'quizId',
                lower: [],
                upper: [quizId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'quizId',
                lower: [quizId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'quizId',
                lower: [quizId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'quizId',
                lower: [],
                upper: [quizId],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension QuizAttemptModelQueryFilter
    on QueryBuilder<QuizAttemptModel, QuizAttemptModel, QFilterCondition> {
  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  attemptIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'attemptId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  attemptIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'attemptId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  attemptIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'attemptId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  attemptIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'attemptId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  attemptIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'attemptId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  attemptIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'attemptId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  attemptIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'attemptId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  attemptIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'attemptId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  attemptIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'attemptId', value: ''),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  attemptIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'attemptId', value: ''),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  coinsEarnedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'coinsEarned', value: value),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  coinsEarnedGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'coinsEarned',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  coinsEarnedLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'coinsEarned',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  coinsEarnedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'coinsEarned',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  completedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'completedAt', value: value),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  completedAtGreaterThan(DateTime value, {bool include = false}) {
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

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  completedAtLessThan(DateTime value, {bool include = false}) {
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

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  completedAtBetween(
    DateTime lower,
    DateTime upper, {
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

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  correctAnswersEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'correctAnswers', value: value),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  correctAnswersGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'correctAnswers',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  correctAnswersLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'correctAnswers',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  correctAnswersBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'correctAnswers',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
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

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
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

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
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

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  quizIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'quizId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  quizIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'quizId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  quizIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'quizId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  quizIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'quizId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  quizIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'quizId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  quizIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'quizId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  quizIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'quizId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  quizIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'quizId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  quizIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'quizId', value: ''),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  quizIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'quizId', value: ''),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  selectedOptionIndexesElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'selectedOptionIndexes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  selectedOptionIndexesElementGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'selectedOptionIndexes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  selectedOptionIndexesElementLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'selectedOptionIndexes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  selectedOptionIndexesElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'selectedOptionIndexes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  selectedOptionIndexesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'selectedOptionIndexes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  selectedOptionIndexesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'selectedOptionIndexes', 0, true, 0, true);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  selectedOptionIndexesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'selectedOptionIndexes', 0, false, 999999, true);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  selectedOptionIndexesLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'selectedOptionIndexes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  selectedOptionIndexesLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'selectedOptionIndexes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  selectedOptionIndexesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'selectedOptionIndexes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  startedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'startedAt', value: value),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  startedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'startedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  startedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'startedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  startedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'startedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
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

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
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

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
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

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
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

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
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

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
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

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
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

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
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

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  topicIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'topicId', value: ''),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  topicIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'topicId', value: ''),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  totalQuestionsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'totalQuestions', value: value),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  totalQuestionsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalQuestions',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  totalQuestionsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalQuestions',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  totalQuestionsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalQuestions',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
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

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
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

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
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

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
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

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
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

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
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

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
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

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
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

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'userId', value: ''),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'userId', value: ''),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  xpEarnedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'xpEarned', value: value),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  xpEarnedGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'xpEarned',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  xpEarnedLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'xpEarned',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterFilterCondition>
  xpEarnedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'xpEarned',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension QuizAttemptModelQueryObject
    on QueryBuilder<QuizAttemptModel, QuizAttemptModel, QFilterCondition> {}

extension QuizAttemptModelQueryLinks
    on QueryBuilder<QuizAttemptModel, QuizAttemptModel, QFilterCondition> {}

extension QuizAttemptModelQuerySortBy
    on QueryBuilder<QuizAttemptModel, QuizAttemptModel, QSortBy> {
  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  sortByAttemptId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attemptId', Sort.asc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  sortByAttemptIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attemptId', Sort.desc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  sortByCoinsEarned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coinsEarned', Sort.asc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  sortByCoinsEarnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coinsEarned', Sort.desc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  sortByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  sortByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  sortByCorrectAnswers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswers', Sort.asc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  sortByCorrectAnswersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswers', Sort.desc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  sortByQuizId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quizId', Sort.asc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  sortByQuizIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quizId', Sort.desc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  sortByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  sortByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  sortByTopicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topicId', Sort.asc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  sortByTopicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topicId', Sort.desc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  sortByTotalQuestions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuestions', Sort.asc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  sortByTotalQuestionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuestions', Sort.desc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  sortByXpEarned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xpEarned', Sort.asc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  sortByXpEarnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xpEarned', Sort.desc);
    });
  }
}

extension QuizAttemptModelQuerySortThenBy
    on QueryBuilder<QuizAttemptModel, QuizAttemptModel, QSortThenBy> {
  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  thenByAttemptId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attemptId', Sort.asc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  thenByAttemptIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attemptId', Sort.desc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  thenByCoinsEarned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coinsEarned', Sort.asc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  thenByCoinsEarnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coinsEarned', Sort.desc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  thenByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  thenByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  thenByCorrectAnswers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswers', Sort.asc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  thenByCorrectAnswersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswers', Sort.desc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  thenByQuizId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quizId', Sort.asc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  thenByQuizIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quizId', Sort.desc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  thenByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  thenByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  thenByTopicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topicId', Sort.asc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  thenByTopicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topicId', Sort.desc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  thenByTotalQuestions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuestions', Sort.asc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  thenByTotalQuestionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuestions', Sort.desc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  thenByXpEarned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xpEarned', Sort.asc);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QAfterSortBy>
  thenByXpEarnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xpEarned', Sort.desc);
    });
  }
}

extension QuizAttemptModelQueryWhereDistinct
    on QueryBuilder<QuizAttemptModel, QuizAttemptModel, QDistinct> {
  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QDistinct>
  distinctByAttemptId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attemptId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QDistinct>
  distinctByCoinsEarned() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coinsEarned');
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QDistinct>
  distinctByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedAt');
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QDistinct>
  distinctByCorrectAnswers() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'correctAnswers');
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QDistinct> distinctByQuizId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quizId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QDistinct>
  distinctBySelectedOptionIndexes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'selectedOptionIndexes');
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QDistinct>
  distinctByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startedAt');
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QDistinct>
  distinctByTopicId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'topicId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QDistinct>
  distinctByTotalQuestions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalQuestions');
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QDistinct> distinctByUserId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuizAttemptModel, QuizAttemptModel, QDistinct>
  distinctByXpEarned() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'xpEarned');
    });
  }
}

extension QuizAttemptModelQueryProperty
    on QueryBuilder<QuizAttemptModel, QuizAttemptModel, QQueryProperty> {
  QueryBuilder<QuizAttemptModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<QuizAttemptModel, String, QQueryOperations> attemptIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attemptId');
    });
  }

  QueryBuilder<QuizAttemptModel, int, QQueryOperations> coinsEarnedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coinsEarned');
    });
  }

  QueryBuilder<QuizAttemptModel, DateTime, QQueryOperations>
  completedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedAt');
    });
  }

  QueryBuilder<QuizAttemptModel, int, QQueryOperations>
  correctAnswersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'correctAnswers');
    });
  }

  QueryBuilder<QuizAttemptModel, String, QQueryOperations> quizIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quizId');
    });
  }

  QueryBuilder<QuizAttemptModel, List<int>, QQueryOperations>
  selectedOptionIndexesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'selectedOptionIndexes');
    });
  }

  QueryBuilder<QuizAttemptModel, DateTime, QQueryOperations>
  startedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startedAt');
    });
  }

  QueryBuilder<QuizAttemptModel, String, QQueryOperations> topicIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'topicId');
    });
  }

  QueryBuilder<QuizAttemptModel, int, QQueryOperations>
  totalQuestionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalQuestions');
    });
  }

  QueryBuilder<QuizAttemptModel, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<QuizAttemptModel, int, QQueryOperations> xpEarnedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'xpEarned');
    });
  }
}
