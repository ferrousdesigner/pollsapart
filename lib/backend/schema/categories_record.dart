import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriesRecord extends FirestoreRecord {
  CategoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "category_name" field.
  String? _categoryName;
  String get categoryName => _categoryName ?? '';
  bool hasCategoryName() => _categoryName != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "polls_count" field.
  int? _pollsCount;
  int get pollsCount => _pollsCount ?? 0;
  bool hasPollsCount() => _pollsCount != null;

  void _initializeFields() {
    _categoryName = snapshotData['category_name'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _pollsCount = castToType<int>(snapshotData['polls_count']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('categories');

  static Stream<CategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoriesRecord.fromSnapshot(s));

  static Future<CategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoriesRecord.fromSnapshot(s));

  static CategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoriesRecordData({
  String? categoryName,
  DateTime? createdAt,
  int? pollsCount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'category_name': categoryName,
      'created_at': createdAt,
      'polls_count': pollsCount,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoriesRecordDocumentEquality implements Equality<CategoriesRecord> {
  const CategoriesRecordDocumentEquality();

  @override
  bool equals(CategoriesRecord? e1, CategoriesRecord? e2) {
    return e1?.categoryName == e2?.categoryName &&
        e1?.createdAt == e2?.createdAt &&
        e1?.pollsCount == e2?.pollsCount;
  }

  @override
  int hash(CategoriesRecord? e) =>
      const ListEquality().hash([e?.categoryName, e?.createdAt, e?.pollsCount]);

  @override
  bool isValidKey(Object? o) => o is CategoriesRecord;
}
