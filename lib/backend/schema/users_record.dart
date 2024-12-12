import 'dart:async';

import 'package:collection/collection.dart';

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

  // "PeriodLength" field.
  int? _periodLength;
  int get periodLength => _periodLength ?? 0;
  bool hasPeriodLength() => _periodLength != null;

  // "PeriodStartDate" field.
  DateTime? _periodStartDate;
  DateTime? get periodStartDate => _periodStartDate;
  bool hasPeriodStartDate() => _periodStartDate != null;

  // "CycleLength" field.
  int? _cycleLength;
  int get cycleLength => _cycleLength ?? 0;
  bool hasCycleLength() => _cycleLength != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "hieght" field.
  int? _hieght;
  int get hieght => _hieght ?? 0;
  bool hasHieght() => _hieght != null;

  // "wieght" field.
  int? _wieght;
  int get wieght => _wieght ?? 0;
  bool hasWieght() => _wieght != null;

  // "Health" field.
  String? _health;
  String get health => _health ?? '';
  bool hasHealth() => _health != null;

  // "Lifestyle" field.
  String? _lifestyle;
  String get lifestyle => _lifestyle ?? '';
  bool hasLifestyle() => _lifestyle != null;

  // "Goals" field.
  String? _goals;
  String get goals => _goals ?? '';
  bool hasGoals() => _goals != null;

  // "completed" field.
  bool? _completed;
  bool get completed => _completed ?? false;
  bool hasCompleted() => _completed != null;

  // "userAnalysis" field.
  DocumentReference? _userAnalysis;
  DocumentReference? get userAnalysis => _userAnalysis;
  bool hasUserAnalysis() => _userAnalysis != null;

  // "Flow" field.
  String? _flow;
  String get flow => _flow ?? '';
  bool hasFlow() => _flow != null;

  // "mod" field.
  String? _mod;
  String get mod => _mod ?? '';
  bool hasMod() => _mod != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _periodLength = castToType<int>(snapshotData['PeriodLength']);
    _periodStartDate = snapshotData['PeriodStartDate'] as DateTime?;
    _cycleLength = castToType<int>(snapshotData['CycleLength']);
    _age = castToType<int>(snapshotData['age']);
    _hieght = castToType<int>(snapshotData['hieght']);
    _wieght = castToType<int>(snapshotData['wieght']);
    _health = snapshotData['Health'] as String?;
    _lifestyle = snapshotData['Lifestyle'] as String?;
    _goals = snapshotData['Goals'] as String?;
    _completed = snapshotData['completed'] as bool?;
    _userAnalysis = snapshotData['userAnalysis'] as DocumentReference?;
    _flow = snapshotData['Flow'] as String?;
    _mod = snapshotData['mod'] as String?;
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
  int? periodLength,
  DateTime? periodStartDate,
  int? cycleLength,
  int? age,
  int? hieght,
  int? wieght,
  String? health,
  String? lifestyle,
  String? goals,
  bool? completed,
  DocumentReference? userAnalysis,
  String? flow,
  String? mod,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'PeriodLength': periodLength,
      'PeriodStartDate': periodStartDate,
      'CycleLength': cycleLength,
      'age': age,
      'hieght': hieght,
      'wieght': wieght,
      'Health': health,
      'Lifestyle': lifestyle,
      'Goals': goals,
      'completed': completed,
      'userAnalysis': userAnalysis,
      'Flow': flow,
      'mod': mod,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.periodLength == e2?.periodLength &&
        e1?.periodStartDate == e2?.periodStartDate &&
        e1?.cycleLength == e2?.cycleLength &&
        e1?.age == e2?.age &&
        e1?.hieght == e2?.hieght &&
        e1?.wieght == e2?.wieght &&
        e1?.health == e2?.health &&
        e1?.lifestyle == e2?.lifestyle &&
        e1?.goals == e2?.goals &&
        e1?.completed == e2?.completed &&
        e1?.userAnalysis == e2?.userAnalysis &&
        e1?.flow == e2?.flow &&
        e1?.mod == e2?.mod;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.periodLength,
        e?.periodStartDate,
        e?.cycleLength,
        e?.age,
        e?.hieght,
        e?.wieght,
        e?.health,
        e?.lifestyle,
        e?.goals,
        e?.completed,
        e?.userAnalysis,
        e?.flow,
        e?.mod
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
