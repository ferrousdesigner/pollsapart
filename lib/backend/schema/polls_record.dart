import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PollsRecord extends FirestoreRecord {
  PollsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "modified_at" field.
  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _modifiedAt;
  bool hasModifiedAt() => _modifiedAt != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "option_one" field.
  String? _optionOne;
  String get optionOne => _optionOne ?? '';
  bool hasOptionOne() => _optionOne != null;

  // "option_two" field.
  String? _optionTwo;
  String get optionTwo => _optionTwo ?? '';
  bool hasOptionTwo() => _optionTwo != null;

  // "option_one_count" field.
  int? _optionOneCount;
  int get optionOneCount => _optionOneCount ?? 0;
  bool hasOptionOneCount() => _optionOneCount != null;

  // "option_two_count" field.
  int? _optionTwoCount;
  int get optionTwoCount => _optionTwoCount ?? 0;
  bool hasOptionTwoCount() => _optionTwoCount != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "is_anonymous" field.
  bool? _isAnonymous;
  bool get isAnonymous => _isAnonymous ?? false;
  bool hasIsAnonymous() => _isAnonymous != null;

  // "up_votes" field.
  int? _upVotes;
  int get upVotes => _upVotes ?? 0;
  bool hasUpVotes() => _upVotes != null;

  // "is_banned" field.
  bool? _isBanned;
  bool get isBanned => _isBanned ?? false;
  bool hasIsBanned() => _isBanned != null;

  // "report_abuses_count" field.
  int? _reportAbusesCount;
  int get reportAbusesCount => _reportAbusesCount ?? 0;
  bool hasReportAbusesCount() => _reportAbusesCount != null;

  // "is_nsfw" field.
  bool? _isNsfw;
  bool get isNsfw => _isNsfw ?? false;
  bool hasIsNsfw() => _isNsfw != null;

  // "is_deleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _modifiedAt = snapshotData['modified_at'] as DateTime?;
    _question = snapshotData['question'] as String?;
    _optionOne = snapshotData['option_one'] as String?;
    _optionTwo = snapshotData['option_two'] as String?;
    _optionOneCount = castToType<int>(snapshotData['option_one_count']);
    _optionTwoCount = castToType<int>(snapshotData['option_two_count']);
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _isAnonymous = snapshotData['is_anonymous'] as bool?;
    _upVotes = castToType<int>(snapshotData['up_votes']);
    _isBanned = snapshotData['is_banned'] as bool?;
    _reportAbusesCount = castToType<int>(snapshotData['report_abuses_count']);
    _isNsfw = snapshotData['is_nsfw'] as bool?;
    _isDeleted = snapshotData['is_deleted'] as bool?;
    _category = snapshotData['category'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('polls');

  static Stream<PollsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PollsRecord.fromSnapshot(s));

  static Future<PollsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PollsRecord.fromSnapshot(s));

  static PollsRecord fromSnapshot(DocumentSnapshot snapshot) => PollsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PollsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PollsRecord._(reference, mapFromFirestore(data));

  static PollsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      PollsRecord.getDocumentFromData(
        {
          'created_at': safeGet(
            () => DateTime.fromMillisecondsSinceEpoch(
                snapshot.data['created_at']),
          ),
          'modified_at': safeGet(
            () => DateTime.fromMillisecondsSinceEpoch(
                snapshot.data['modified_at']),
          ),
          'question': snapshot.data['question'],
          'option_one': snapshot.data['option_one'],
          'option_two': snapshot.data['option_two'],
          'option_one_count': snapshot.data['option_one_count']?.round(),
          'option_two_count': snapshot.data['option_two_count']?.round(),
          'created_by': safeGet(
            () => toRef(snapshot.data['created_by']),
          ),
          'is_anonymous': snapshot.data['is_anonymous'],
          'up_votes': snapshot.data['up_votes']?.round(),
          'is_banned': snapshot.data['is_banned'],
          'report_abuses_count': snapshot.data['report_abuses_count']?.round(),
          'is_nsfw': snapshot.data['is_nsfw'],
          'is_deleted': snapshot.data['is_deleted'],
          'category': snapshot.data['category'],
        },
        PollsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<PollsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'polls',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'PollsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PollsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPollsRecordData({
  DateTime? createdAt,
  DateTime? modifiedAt,
  String? question,
  String? optionOne,
  String? optionTwo,
  int? optionOneCount,
  int? optionTwoCount,
  DocumentReference? createdBy,
  bool? isAnonymous,
  int? upVotes,
  bool? isBanned,
  int? reportAbusesCount,
  bool? isNsfw,
  bool? isDeleted,
  String? category,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'modified_at': modifiedAt,
      'question': question,
      'option_one': optionOne,
      'option_two': optionTwo,
      'option_one_count': optionOneCount,
      'option_two_count': optionTwoCount,
      'created_by': createdBy,
      'is_anonymous': isAnonymous,
      'up_votes': upVotes,
      'is_banned': isBanned,
      'report_abuses_count': reportAbusesCount,
      'is_nsfw': isNsfw,
      'is_deleted': isDeleted,
      'category': category,
    }.withoutNulls,
  );

  return firestoreData;
}

class PollsRecordDocumentEquality implements Equality<PollsRecord> {
  const PollsRecordDocumentEquality();

  @override
  bool equals(PollsRecord? e1, PollsRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.modifiedAt == e2?.modifiedAt &&
        e1?.question == e2?.question &&
        e1?.optionOne == e2?.optionOne &&
        e1?.optionTwo == e2?.optionTwo &&
        e1?.optionOneCount == e2?.optionOneCount &&
        e1?.optionTwoCount == e2?.optionTwoCount &&
        e1?.createdBy == e2?.createdBy &&
        e1?.isAnonymous == e2?.isAnonymous &&
        e1?.upVotes == e2?.upVotes &&
        e1?.isBanned == e2?.isBanned &&
        e1?.reportAbusesCount == e2?.reportAbusesCount &&
        e1?.isNsfw == e2?.isNsfw &&
        e1?.isDeleted == e2?.isDeleted &&
        e1?.category == e2?.category;
  }

  @override
  int hash(PollsRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.modifiedAt,
        e?.question,
        e?.optionOne,
        e?.optionTwo,
        e?.optionOneCount,
        e?.optionTwoCount,
        e?.createdBy,
        e?.isAnonymous,
        e?.upVotes,
        e?.isBanned,
        e?.reportAbusesCount,
        e?.isNsfw,
        e?.isDeleted,
        e?.category
      ]);

  @override
  bool isValidKey(Object? o) => o is PollsRecord;
}
