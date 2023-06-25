import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "polls_created" field.
  List<DocumentReference>? _pollsCreated;
  List<DocumentReference> get pollsCreated => _pollsCreated ?? const [];
  bool hasPollsCreated() => _pollsCreated != null;

  // "polls_saved" field.
  List<DocumentReference>? _pollsSaved;
  List<DocumentReference> get pollsSaved => _pollsSaved ?? const [];
  bool hasPollsSaved() => _pollsSaved != null;

  // "polls_answered" field.
  List<DocumentReference>? _pollsAnswered;
  List<DocumentReference> get pollsAnswered => _pollsAnswered ?? const [];
  bool hasPollsAnswered() => _pollsAnswered != null;

  // "polls_upvoted" field.
  List<DocumentReference>? _pollsUpvoted;
  List<DocumentReference> get pollsUpvoted => _pollsUpvoted ?? const [];
  bool hasPollsUpvoted() => _pollsUpvoted != null;

  // "polls_downvoted" field.
  List<DocumentReference>? _pollsDownvoted;
  List<DocumentReference> get pollsDownvoted => _pollsDownvoted ?? const [];
  bool hasPollsDownvoted() => _pollsDownvoted != null;

  // "polls_banned" field.
  List<DocumentReference>? _pollsBanned;
  List<DocumentReference> get pollsBanned => _pollsBanned ?? const [];
  bool hasPollsBanned() => _pollsBanned != null;

  // "allow_nsfw" field.
  bool? _allowNsfw;
  bool get allowNsfw => _allowNsfw ?? false;
  bool hasAllowNsfw() => _allowNsfw != null;

  // "is_deleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "account_deletion_comment" field.
  String? _accountDeletionComment;
  String get accountDeletionComment => _accountDeletionComment ?? '';
  bool hasAccountDeletionComment() => _accountDeletionComment != null;

  // "account_deletion_reason" field.
  String? _accountDeletionReason;
  String get accountDeletionReason => _accountDeletionReason ?? '';
  bool hasAccountDeletionReason() => _accountDeletionReason != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _bio = snapshotData['bio'] as String?;
    _pollsCreated = getDataList(snapshotData['polls_created']);
    _pollsSaved = getDataList(snapshotData['polls_saved']);
    _pollsAnswered = getDataList(snapshotData['polls_answered']);
    _pollsUpvoted = getDataList(snapshotData['polls_upvoted']);
    _pollsDownvoted = getDataList(snapshotData['polls_downvoted']);
    _pollsBanned = getDataList(snapshotData['polls_banned']);
    _allowNsfw = snapshotData['allow_nsfw'] as bool?;
    _isDeleted = snapshotData['is_deleted'] as bool?;
    _accountDeletionComment =
        snapshotData['account_deletion_comment'] as String?;
    _accountDeletionReason = snapshotData['account_deletion_reason'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? bio,
  bool? allowNsfw,
  bool? isDeleted,
  String? accountDeletionComment,
  String? accountDeletionReason,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'bio': bio,
      'allow_nsfw': allowNsfw,
      'is_deleted': isDeleted,
      'account_deletion_comment': accountDeletionComment,
      'account_deletion_reason': accountDeletionReason,
    }.withoutNulls,
  );

  return firestoreData;
}
