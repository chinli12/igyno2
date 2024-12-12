import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PeriodTrackRecord extends FirestoreRecord {
  PeriodTrackRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

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

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "timeStamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  void _initializeFields() {
    _periodLength = castToType<int>(snapshotData['PeriodLength']);
    _periodStartDate = snapshotData['PeriodStartDate'] as DateTime?;
    _cycleLength = castToType<int>(snapshotData['CycleLength']);
    _owner = snapshotData['owner'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
    _timeStamp = snapshotData['timeStamp'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('periodTrack');

  static Stream<PeriodTrackRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PeriodTrackRecord.fromSnapshot(s));

  static Future<PeriodTrackRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PeriodTrackRecord.fromSnapshot(s));

  static PeriodTrackRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PeriodTrackRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PeriodTrackRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PeriodTrackRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PeriodTrackRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PeriodTrackRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPeriodTrackRecordData({
  int? periodLength,
  DateTime? periodStartDate,
  int? cycleLength,
  DocumentReference? owner,
  DateTime? date,
  DateTime? timeStamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'PeriodLength': periodLength,
      'PeriodStartDate': periodStartDate,
      'CycleLength': cycleLength,
      'owner': owner,
      'date': date,
      'timeStamp': timeStamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class PeriodTrackRecordDocumentEquality implements Equality<PeriodTrackRecord> {
  const PeriodTrackRecordDocumentEquality();

  @override
  bool equals(PeriodTrackRecord? e1, PeriodTrackRecord? e2) {
    return e1?.periodLength == e2?.periodLength &&
        e1?.periodStartDate == e2?.periodStartDate &&
        e1?.cycleLength == e2?.cycleLength &&
        e1?.owner == e2?.owner &&
        e1?.date == e2?.date &&
        e1?.timeStamp == e2?.timeStamp;
  }

  @override
  int hash(PeriodTrackRecord? e) => const ListEquality().hash([
        e?.periodLength,
        e?.periodStartDate,
        e?.cycleLength,
        e?.owner,
        e?.date,
        e?.timeStamp
      ]);

  @override
  bool isValidKey(Object? o) => o is PeriodTrackRecord;
}
