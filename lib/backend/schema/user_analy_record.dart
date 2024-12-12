import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserAnalyRecord extends FirestoreRecord {
  UserAnalyRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "symptom" field.
  List<String>? _symptom;
  List<String> get symptom => _symptom ?? const [];
  bool hasSymptom() => _symptom != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "Feelings" field.
  List<String>? _feelings;
  List<String> get feelings => _feelings ?? const [];
  bool hasFeelings() => _feelings != null;

  // "Spotting" field.
  List<String>? _spotting;
  List<String> get spotting => _spotting ?? const [];
  bool hasSpotting() => _spotting != null;

  // "PeriodFlow" field.
  List<String>? _periodFlow;
  List<String> get periodFlow => _periodFlow ?? const [];
  bool hasPeriodFlow() => _periodFlow != null;

  // "Sexlife" field.
  List<String>? _sexlife;
  List<String> get sexlife => _sexlife ?? const [];
  bool hasSexlife() => _sexlife != null;

  // "Collectionmethod" field.
  List<String>? _collectionmethod;
  List<String> get collectionmethod => _collectionmethod ?? const [];
  bool hasCollectionmethod() => _collectionmethod != null;

  // "EnergyLevel" field.
  List<String>? _energyLevel;
  List<String> get energyLevel => _energyLevel ?? const [];
  bool hasEnergyLevel() => _energyLevel != null;

  // "SleepQuality" field.
  List<String>? _sleepQuality;
  List<String> get sleepQuality => _sleepQuality ?? const [];
  bool hasSleepQuality() => _sleepQuality != null;

  // "Activities" field.
  List<String>? _activities;
  List<String> get activities => _activities ?? const [];
  bool hasActivities() => _activities != null;

  // "MedicationsSupplements" field.
  List<String>? _medicationsSupplements;
  List<String> get medicationsSupplements =>
      _medicationsSupplements ?? const [];
  bool hasMedicationsSupplements() => _medicationsSupplements != null;

  // "Notes" field.
  List<String>? _notes;
  List<String> get notes => _notes ?? const [];
  bool hasNotes() => _notes != null;

  void _initializeFields() {
    _symptom = getDataList(snapshotData['symptom']);
    _owner = snapshotData['owner'] as DocumentReference?;
    _feelings = getDataList(snapshotData['Feelings']);
    _spotting = getDataList(snapshotData['Spotting']);
    _periodFlow = getDataList(snapshotData['PeriodFlow']);
    _sexlife = getDataList(snapshotData['Sexlife']);
    _collectionmethod = getDataList(snapshotData['Collectionmethod']);
    _energyLevel = getDataList(snapshotData['EnergyLevel']);
    _sleepQuality = getDataList(snapshotData['SleepQuality']);
    _activities = getDataList(snapshotData['Activities']);
    _medicationsSupplements =
        getDataList(snapshotData['MedicationsSupplements']);
    _notes = getDataList(snapshotData['Notes']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userAnaly');

  static Stream<UserAnalyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserAnalyRecord.fromSnapshot(s));

  static Future<UserAnalyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserAnalyRecord.fromSnapshot(s));

  static UserAnalyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserAnalyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserAnalyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserAnalyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserAnalyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserAnalyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserAnalyRecordData({
  DocumentReference? owner,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'owner': owner,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserAnalyRecordDocumentEquality implements Equality<UserAnalyRecord> {
  const UserAnalyRecordDocumentEquality();

  @override
  bool equals(UserAnalyRecord? e1, UserAnalyRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.symptom, e2?.symptom) &&
        e1?.owner == e2?.owner &&
        listEquality.equals(e1?.feelings, e2?.feelings) &&
        listEquality.equals(e1?.spotting, e2?.spotting) &&
        listEquality.equals(e1?.periodFlow, e2?.periodFlow) &&
        listEquality.equals(e1?.sexlife, e2?.sexlife) &&
        listEquality.equals(e1?.collectionmethod, e2?.collectionmethod) &&
        listEquality.equals(e1?.energyLevel, e2?.energyLevel) &&
        listEquality.equals(e1?.sleepQuality, e2?.sleepQuality) &&
        listEquality.equals(e1?.activities, e2?.activities) &&
        listEquality.equals(
            e1?.medicationsSupplements, e2?.medicationsSupplements) &&
        listEquality.equals(e1?.notes, e2?.notes);
  }

  @override
  int hash(UserAnalyRecord? e) => const ListEquality().hash([
        e?.symptom,
        e?.owner,
        e?.feelings,
        e?.spotting,
        e?.periodFlow,
        e?.sexlife,
        e?.collectionmethod,
        e?.energyLevel,
        e?.sleepQuality,
        e?.activities,
        e?.medicationsSupplements,
        e?.notes
      ]);

  @override
  bool isValidKey(Object? o) => o is UserAnalyRecord;
}
