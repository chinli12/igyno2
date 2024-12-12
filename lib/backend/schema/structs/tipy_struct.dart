// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TipyStruct extends FFFirebaseStruct {
  TipyStruct({
    List<TipsStruct>? tips,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _tips = tips,
        super(firestoreUtilData);

  // "tips" field.
  List<TipsStruct>? _tips;
  List<TipsStruct> get tips => _tips ?? const [];
  set tips(List<TipsStruct>? val) => _tips = val;

  void updateTips(Function(List<TipsStruct>) updateFn) {
    updateFn(_tips ??= []);
  }

  bool hasTips() => _tips != null;

  static TipyStruct fromMap(Map<String, dynamic> data) => TipyStruct(
        tips: getStructList(
          data['tips'],
          TipsStruct.fromMap,
        ),
      );

  static TipyStruct? maybeFromMap(dynamic data) =>
      data is Map ? TipyStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'tips': _tips?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'tips': serializeParam(
          _tips,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static TipyStruct fromSerializableMap(Map<String, dynamic> data) =>
      TipyStruct(
        tips: deserializeStructParam<TipsStruct>(
          data['tips'],
          ParamType.DataStruct,
          true,
          structBuilder: TipsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TipyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TipyStruct && listEquality.equals(tips, other.tips);
  }

  @override
  int get hashCode => const ListEquality().hash([tips]);
}

TipyStruct createTipyStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TipyStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TipyStruct? updateTipyStruct(
  TipyStruct? tipy, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    tipy
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTipyStructData(
  Map<String, dynamic> firestoreData,
  TipyStruct? tipy,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (tipy == null) {
    return;
  }
  if (tipy.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && tipy.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final tipyData = getTipyFirestoreData(tipy, forFieldValue);
  final nestedData = tipyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = tipy.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTipyFirestoreData(
  TipyStruct? tipy, [
  bool forFieldValue = false,
]) {
  if (tipy == null) {
    return {};
  }
  final firestoreData = mapToFirestore(tipy.toMap());

  // Add any Firestore field values
  tipy.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTipyListFirestoreData(
  List<TipyStruct>? tipys,
) =>
    tipys?.map((e) => getTipyFirestoreData(e, true)).toList() ?? [];
