// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OfferStruct extends FFFirebaseStruct {
  OfferStruct({
    String? type,
    String? sdp,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        _sdp = sdp,
        super(firestoreUtilData);

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "sdp" field.
  String? _sdp;
  String get sdp => _sdp ?? '';
  set sdp(String? val) => _sdp = val;

  bool hasSdp() => _sdp != null;

  static OfferStruct fromMap(Map<String, dynamic> data) => OfferStruct(
        type: data['type'] as String?,
        sdp: data['sdp'] as String?,
      );

  static OfferStruct? maybeFromMap(dynamic data) =>
      data is Map ? OfferStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'sdp': _sdp,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'sdp': serializeParam(
          _sdp,
          ParamType.String,
        ),
      }.withoutNulls;

  static OfferStruct fromSerializableMap(Map<String, dynamic> data) =>
      OfferStruct(
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        sdp: deserializeParam(
          data['sdp'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'OfferStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OfferStruct && type == other.type && sdp == other.sdp;
  }

  @override
  int get hashCode => const ListEquality().hash([type, sdp]);
}

OfferStruct createOfferStruct({
  String? type,
  String? sdp,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OfferStruct(
      type: type,
      sdp: sdp,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OfferStruct? updateOfferStruct(
  OfferStruct? offer, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    offer
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOfferStructData(
  Map<String, dynamic> firestoreData,
  OfferStruct? offer,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (offer == null) {
    return;
  }
  if (offer.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && offer.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final offerData = getOfferFirestoreData(offer, forFieldValue);
  final nestedData = offerData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = offer.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOfferFirestoreData(
  OfferStruct? offer, [
  bool forFieldValue = false,
]) {
  if (offer == null) {
    return {};
  }
  final firestoreData = mapToFirestore(offer.toMap());

  // Add any Firestore field values
  offer.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOfferListFirestoreData(
  List<OfferStruct>? offers,
) =>
    offers?.map((e) => getOfferFirestoreData(e, true)).toList() ?? [];
