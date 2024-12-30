// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StreamStruct extends FFFirebaseStruct {
  StreamStruct({
    String? id,
    OfferStruct? offer,
    List<IceServersStruct>? iceServers,
    String? sessionId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _offer = offer,
        _iceServers = iceServers,
        _sessionId = sessionId,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "offer" field.
  OfferStruct? _offer;
  OfferStruct get offer => _offer ?? OfferStruct();
  set offer(OfferStruct? val) => _offer = val;

  void updateOffer(Function(OfferStruct) updateFn) {
    updateFn(_offer ??= OfferStruct());
  }

  bool hasOffer() => _offer != null;

  // "ice_servers" field.
  List<IceServersStruct>? _iceServers;
  List<IceServersStruct> get iceServers => _iceServers ?? const [];
  set iceServers(List<IceServersStruct>? val) => _iceServers = val;

  void updateIceServers(Function(List<IceServersStruct>) updateFn) {
    updateFn(_iceServers ??= []);
  }

  bool hasIceServers() => _iceServers != null;

  // "session_id" field.
  String? _sessionId;
  String get sessionId => _sessionId ?? '';
  set sessionId(String? val) => _sessionId = val;

  bool hasSessionId() => _sessionId != null;

  static StreamStruct fromMap(Map<String, dynamic> data) => StreamStruct(
        id: data['id'] as String?,
        offer: data['offer'] is OfferStruct
            ? data['offer']
            : OfferStruct.maybeFromMap(data['offer']),
        iceServers: getStructList(
          data['ice_servers'],
          IceServersStruct.fromMap,
        ),
        sessionId: data['session_id'] as String?,
      );

  static StreamStruct? maybeFromMap(dynamic data) =>
      data is Map ? StreamStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'offer': _offer?.toMap(),
        'ice_servers': _iceServers?.map((e) => e.toMap()).toList(),
        'session_id': _sessionId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'offer': serializeParam(
          _offer,
          ParamType.DataStruct,
        ),
        'ice_servers': serializeParam(
          _iceServers,
          ParamType.DataStruct,
          isList: true,
        ),
        'session_id': serializeParam(
          _sessionId,
          ParamType.String,
        ),
      }.withoutNulls;

  static StreamStruct fromSerializableMap(Map<String, dynamic> data) =>
      StreamStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        offer: deserializeStructParam(
          data['offer'],
          ParamType.DataStruct,
          false,
          structBuilder: OfferStruct.fromSerializableMap,
        ),
        iceServers: deserializeStructParam<IceServersStruct>(
          data['ice_servers'],
          ParamType.DataStruct,
          true,
          structBuilder: IceServersStruct.fromSerializableMap,
        ),
        sessionId: deserializeParam(
          data['session_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'StreamStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is StreamStruct &&
        id == other.id &&
        offer == other.offer &&
        listEquality.equals(iceServers, other.iceServers) &&
        sessionId == other.sessionId;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, offer, iceServers, sessionId]);
}

StreamStruct createStreamStruct({
  String? id,
  OfferStruct? offer,
  String? sessionId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StreamStruct(
      id: id,
      offer: offer ?? (clearUnsetFields ? OfferStruct() : null),
      sessionId: sessionId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StreamStruct? updateStreamStruct(
  StreamStruct? stream, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    stream
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStreamStructData(
  Map<String, dynamic> firestoreData,
  StreamStruct? stream,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (stream == null) {
    return;
  }
  if (stream.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && stream.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final streamData = getStreamFirestoreData(stream, forFieldValue);
  final nestedData = streamData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = stream.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStreamFirestoreData(
  StreamStruct? stream, [
  bool forFieldValue = false,
]) {
  if (stream == null) {
    return {};
  }
  final firestoreData = mapToFirestore(stream.toMap());

  // Handle nested data for "offer" field.
  addOfferStructData(
    firestoreData,
    stream.hasOffer() ? stream.offer : null,
    'offer',
    forFieldValue,
  );

  // Add any Firestore field values
  stream.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStreamListFirestoreData(
  List<StreamStruct>? streams,
) =>
    streams?.map((e) => getStreamFirestoreData(e, true)).toList() ?? [];
