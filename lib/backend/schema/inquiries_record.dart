import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InquiriesRecord extends FirestoreRecord {
  InquiriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _comment = snapshotData['comment'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('inquiries');

  static Stream<InquiriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InquiriesRecord.fromSnapshot(s));

  static Future<InquiriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InquiriesRecord.fromSnapshot(s));

  static InquiriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InquiriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InquiriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InquiriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InquiriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InquiriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInquiriesRecordData({
  String? email,
  String? comment,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'comment': comment,
      'userRef': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}
