// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IceServersStruct extends FFFirebaseStruct {
  IceServersStruct({
    String? urls,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _urls = urls,
        super(firestoreUtilData);

  // "urls" field.
  String? _urls;
  String get urls => _urls ?? '';
  set urls(String? val) => _urls = val;

  bool hasUrls() => _urls != null;

  static IceServersStruct fromMap(Map<String, dynamic> data) =>
      IceServersStruct(
        urls: data['urls'] as String?,
      );

  static IceServersStruct? maybeFromMap(dynamic data) => data is Map
      ? IceServersStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'urls': _urls,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'urls': serializeParam(
          _urls,
          ParamType.String,
        ),
      }.withoutNulls;

  static IceServersStruct fromSerializableMap(Map<String, dynamic> data) =>
      IceServersStruct(
        urls: deserializeParam(
          data['urls'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'IceServersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IceServersStruct && urls == other.urls;
  }

  @override
  int get hashCode => const ListEquality().hash([urls]);
}

IceServersStruct createIceServersStruct({
  String? urls,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    IceServersStruct(
      urls: urls,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

IceServersStruct? updateIceServersStruct(
  IceServersStruct? iceServers, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    iceServers
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addIceServersStructData(
  Map<String, dynamic> firestoreData,
  IceServersStruct? iceServers,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (iceServers == null) {
    return;
  }
  if (iceServers.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && iceServers.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final iceServersData = getIceServersFirestoreData(iceServers, forFieldValue);
  final nestedData = iceServersData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = iceServers.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getIceServersFirestoreData(
  IceServersStruct? iceServers, [
  bool forFieldValue = false,
]) {
  if (iceServers == null) {
    return {};
  }
  final firestoreData = mapToFirestore(iceServers.toMap());

  // Add any Firestore field values
  iceServers.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getIceServersListFirestoreData(
  List<IceServersStruct>? iceServerss,
) =>
    iceServerss?.map((e) => getIceServersFirestoreData(e, true)).toList() ?? [];
