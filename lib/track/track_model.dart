import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'track_widget.dart' show TrackWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TrackModel extends FlutterFlowModel<TrackWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PeriodFlow widget.
  FormFieldController<List<String>>? periodFlowValueController;
  String? get periodFlowValue => periodFlowValueController?.value?.firstOrNull;
  set periodFlowValue(String? val) =>
      periodFlowValueController?.value = val != null ? [val] : [];
  // State field(s) for Spotting widget.
  FormFieldController<List<String>>? spottingValueController;
  String? get spottingValue => spottingValueController?.value?.firstOrNull;
  set spottingValue(String? val) =>
      spottingValueController?.value = val != null ? [val] : [];
  // State field(s) for Feelings widget.
  FormFieldController<List<String>>? feelingsValueController;
  String? get feelingsValue => feelingsValueController?.value?.firstOrNull;
  set feelingsValue(String? val) =>
      feelingsValueController?.value = val != null ? [val] : [];
  // State field(s) for Symptoms widget.
  FormFieldController<List<String>>? symptomsValueController;
  String? get symptomsValue => symptomsValueController?.value?.firstOrNull;
  set symptomsValue(String? val) =>
      symptomsValueController?.value = val != null ? [val] : [];
  // State field(s) for Sexlife widget.
  FormFieldController<List<String>>? sexlifeValueController;
  String? get sexlifeValue => sexlifeValueController?.value?.firstOrNull;
  set sexlifeValue(String? val) =>
      sexlifeValueController?.value = val != null ? [val] : [];
  // State field(s) for Collectionmethod widget.
  FormFieldController<List<String>>? collectionmethodValueController;
  String? get collectionmethodValue =>
      collectionmethodValueController?.value?.firstOrNull;
  set collectionmethodValue(String? val) =>
      collectionmethodValueController?.value = val != null ? [val] : [];
  // State field(s) for EnergyLevel widget.
  double? energyLevelValue;
  // State field(s) for SleepQuality widget.
  FormFieldController<List<String>>? sleepQualityValueController;
  String? get sleepQualityValue =>
      sleepQualityValueController?.value?.firstOrNull;
  set sleepQualityValue(String? val) =>
      sleepQualityValueController?.value = val != null ? [val] : [];
  // State field(s) for Activities widget.
  FormFieldController<List<String>>? activitiesValueController;
  String? get activitiesValue => activitiesValueController?.value?.firstOrNull;
  set activitiesValue(String? val) =>
      activitiesValueController?.value = val != null ? [val] : [];
  // State field(s) for MedicationsSupplements widget.
  FormFieldController<List<String>>? medicationsSupplementsValueController;
  String? get medicationsSupplementsValue =>
      medicationsSupplementsValueController?.value?.firstOrNull;
  set medicationsSupplementsValue(String? val) =>
      medicationsSupplementsValueController?.value = val != null ? [val] : [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UserAnalyRecord? useranaly;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
