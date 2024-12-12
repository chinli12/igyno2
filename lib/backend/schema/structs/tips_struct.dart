// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TipsStruct extends FFFirebaseStruct {
  TipsStruct({
    String? text,
    bool? action,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _text = text,
        _action = action,
        super(firestoreUtilData);

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "action" field.
  bool? _action;
  bool get action => _action ?? false;
  set action(bool? val) => _action = val;

  bool hasAction() => _action != null;

  static TipsStruct fromMap(Map<String, dynamic> data) => TipsStruct(
        text: data['text'] as String?,
        action: data['action'] as bool?,
      );

  static TipsStruct? maybeFromMap(dynamic data) =>
      data is Map ? TipsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'text': _text,
        'action': _action,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'action': serializeParam(
          _action,
          ParamType.bool,
        ),
      }.withoutNulls;

  static TipsStruct fromSerializableMap(Map<String, dynamic> data) =>
      TipsStruct(
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        action: deserializeParam(
          data['action'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'TipsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TipsStruct && text == other.text && action == other.action;
  }

  @override
  int get hashCode => const ListEquality().hash([text, action]);
}

TipsStruct createTipsStruct({
  String? text,
  bool? action,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TipsStruct(
      text: text,
      action: action,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TipsStruct? updateTipsStruct(
  TipsStruct? tips, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    tips
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTipsStructData(
  Map<String, dynamic> firestoreData,
  TipsStruct? tips,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (tips == null) {
    return;
  }
  if (tips.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && tips.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final tipsData = getTipsFirestoreData(tips, forFieldValue);
  final nestedData = tipsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = tips.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTipsFirestoreData(
  TipsStruct? tips, [
  bool forFieldValue = false,
]) {
  if (tips == null) {
    return {};
  }
  final firestoreData = mapToFirestore(tips.toMap());

  // Add any Firestore field values
  tips.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTipsListFirestoreData(
  List<TipsStruct>? tipss,
) =>
    tipss?.map((e) => getTipsFirestoreData(e, true)).toList() ?? [];
