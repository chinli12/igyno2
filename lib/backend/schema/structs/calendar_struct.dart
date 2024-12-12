// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CalendarStruct extends FFFirebaseStruct {
  CalendarStruct({
    DateTime? calendarDay,
    bool? isPreviousDay,
    bool? isNextMonth,
    bool? isInFertileWindow,
    bool? isInOvulation,
    bool? isInPeriod,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _calendarDay = calendarDay,
        _isPreviousDay = isPreviousDay,
        _isNextMonth = isNextMonth,
        _isInFertileWindow = isInFertileWindow,
        _isInOvulation = isInOvulation,
        _isInPeriod = isInPeriod,
        super(firestoreUtilData);

  // "calendarDay" field.
  DateTime? _calendarDay;
  DateTime? get calendarDay => _calendarDay;
  set calendarDay(DateTime? val) => _calendarDay = val;

  bool hasCalendarDay() => _calendarDay != null;

  // "isPreviousDay" field.
  bool? _isPreviousDay;
  bool get isPreviousDay => _isPreviousDay ?? false;
  set isPreviousDay(bool? val) => _isPreviousDay = val;

  bool hasIsPreviousDay() => _isPreviousDay != null;

  // "isNextMonth" field.
  bool? _isNextMonth;
  bool get isNextMonth => _isNextMonth ?? false;
  set isNextMonth(bool? val) => _isNextMonth = val;

  bool hasIsNextMonth() => _isNextMonth != null;

  // "isInFertileWindow" field.
  bool? _isInFertileWindow;
  bool get isInFertileWindow => _isInFertileWindow ?? false;
  set isInFertileWindow(bool? val) => _isInFertileWindow = val;

  bool hasIsInFertileWindow() => _isInFertileWindow != null;

  // "isInOvulation" field.
  bool? _isInOvulation;
  bool get isInOvulation => _isInOvulation ?? false;
  set isInOvulation(bool? val) => _isInOvulation = val;

  bool hasIsInOvulation() => _isInOvulation != null;

  // "isInPeriod" field.
  bool? _isInPeriod;
  bool get isInPeriod => _isInPeriod ?? false;
  set isInPeriod(bool? val) => _isInPeriod = val;

  bool hasIsInPeriod() => _isInPeriod != null;

  static CalendarStruct fromMap(Map<String, dynamic> data) => CalendarStruct(
        calendarDay: data['calendarDay'] as DateTime?,
        isPreviousDay: data['isPreviousDay'] as bool?,
        isNextMonth: data['isNextMonth'] as bool?,
        isInFertileWindow: data['isInFertileWindow'] as bool?,
        isInOvulation: data['isInOvulation'] as bool?,
        isInPeriod: data['isInPeriod'] as bool?,
      );

  static CalendarStruct? maybeFromMap(dynamic data) =>
      data is Map ? CalendarStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'calendarDay': _calendarDay,
        'isPreviousDay': _isPreviousDay,
        'isNextMonth': _isNextMonth,
        'isInFertileWindow': _isInFertileWindow,
        'isInOvulation': _isInOvulation,
        'isInPeriod': _isInPeriod,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'calendarDay': serializeParam(
          _calendarDay,
          ParamType.DateTime,
        ),
        'isPreviousDay': serializeParam(
          _isPreviousDay,
          ParamType.bool,
        ),
        'isNextMonth': serializeParam(
          _isNextMonth,
          ParamType.bool,
        ),
        'isInFertileWindow': serializeParam(
          _isInFertileWindow,
          ParamType.bool,
        ),
        'isInOvulation': serializeParam(
          _isInOvulation,
          ParamType.bool,
        ),
        'isInPeriod': serializeParam(
          _isInPeriod,
          ParamType.bool,
        ),
      }.withoutNulls;

  static CalendarStruct fromSerializableMap(Map<String, dynamic> data) =>
      CalendarStruct(
        calendarDay: deserializeParam(
          data['calendarDay'],
          ParamType.DateTime,
          false,
        ),
        isPreviousDay: deserializeParam(
          data['isPreviousDay'],
          ParamType.bool,
          false,
        ),
        isNextMonth: deserializeParam(
          data['isNextMonth'],
          ParamType.bool,
          false,
        ),
        isInFertileWindow: deserializeParam(
          data['isInFertileWindow'],
          ParamType.bool,
          false,
        ),
        isInOvulation: deserializeParam(
          data['isInOvulation'],
          ParamType.bool,
          false,
        ),
        isInPeriod: deserializeParam(
          data['isInPeriod'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'CalendarStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CalendarStruct &&
        calendarDay == other.calendarDay &&
        isPreviousDay == other.isPreviousDay &&
        isNextMonth == other.isNextMonth &&
        isInFertileWindow == other.isInFertileWindow &&
        isInOvulation == other.isInOvulation &&
        isInPeriod == other.isInPeriod;
  }

  @override
  int get hashCode => const ListEquality().hash([
        calendarDay,
        isPreviousDay,
        isNextMonth,
        isInFertileWindow,
        isInOvulation,
        isInPeriod
      ]);
}

CalendarStruct createCalendarStruct({
  DateTime? calendarDay,
  bool? isPreviousDay,
  bool? isNextMonth,
  bool? isInFertileWindow,
  bool? isInOvulation,
  bool? isInPeriod,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CalendarStruct(
      calendarDay: calendarDay,
      isPreviousDay: isPreviousDay,
      isNextMonth: isNextMonth,
      isInFertileWindow: isInFertileWindow,
      isInOvulation: isInOvulation,
      isInPeriod: isInPeriod,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CalendarStruct? updateCalendarStruct(
  CalendarStruct? calendar, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    calendar
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCalendarStructData(
  Map<String, dynamic> firestoreData,
  CalendarStruct? calendar,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (calendar == null) {
    return;
  }
  if (calendar.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && calendar.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final calendarData = getCalendarFirestoreData(calendar, forFieldValue);
  final nestedData = calendarData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = calendar.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCalendarFirestoreData(
  CalendarStruct? calendar, [
  bool forFieldValue = false,
]) {
  if (calendar == null) {
    return {};
  }
  final firestoreData = mapToFirestore(calendar.toMap());

  // Add any Firestore field values
  calendar.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCalendarListFirestoreData(
  List<CalendarStruct>? calendars,
) =>
    calendars?.map((e) => getCalendarFirestoreData(e, true)).toList() ?? [];
