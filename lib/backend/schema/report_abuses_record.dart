import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReportAbusesRecord extends FirestoreRecord {
  ReportAbusesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "reason" field.
  String? _reason;
  String get reason => _reason ?? '';
  bool hasReason() => _reason != null;

  // "comments" field.
  String? _comments;
  String get comments => _comments ?? '';
  bool hasComments() => _comments != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _reason = snapshotData['reason'] as String?;
    _comments = snapshotData['comments'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('report_abuses')
          : FirebaseFirestore.instance.collectionGroup('report_abuses');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('report_abuses').doc();

  static Stream<ReportAbusesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReportAbusesRecord.fromSnapshot(s));

  static Future<ReportAbusesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReportAbusesRecord.fromSnapshot(s));

  static ReportAbusesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReportAbusesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReportAbusesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReportAbusesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReportAbusesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReportAbusesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReportAbusesRecordData({
  DocumentReference? createdBy,
  String? reason,
  String? comments,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_by': createdBy,
      'reason': reason,
      'comments': comments,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReportAbusesRecordDocumentEquality
    implements Equality<ReportAbusesRecord> {
  const ReportAbusesRecordDocumentEquality();

  @override
  bool equals(ReportAbusesRecord? e1, ReportAbusesRecord? e2) {
    return e1?.createdBy == e2?.createdBy &&
        e1?.reason == e2?.reason &&
        e1?.comments == e2?.comments;
  }

  @override
  int hash(ReportAbusesRecord? e) =>
      const ListEquality().hash([e?.createdBy, e?.reason, e?.comments]);

  @override
  bool isValidKey(Object? o) => o is ReportAbusesRecord;
}
