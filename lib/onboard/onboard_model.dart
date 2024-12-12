import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'onboard_widget.dart' show OnboardWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OnboardModel extends FlutterFlowModel<OnboardWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Age widget.
  FocusNode? ageFocusNode;
  TextEditingController? ageTextController;
  String? Function(BuildContext, String?)? ageTextControllerValidator;
  // State field(s) for height widget.
  FocusNode? heightFocusNode;
  TextEditingController? heightTextController;
  String? Function(BuildContext, String?)? heightTextControllerValidator;
  // State field(s) for weight widget.
  FocusNode? weightFocusNode;
  TextEditingController? weightTextController;
  String? Function(BuildContext, String?)? weightTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for cyclelenght widget.
  FocusNode? cyclelenghtFocusNode;
  TextEditingController? cyclelenghtTextController;
  String? Function(BuildContext, String?)? cyclelenghtTextControllerValidator;
  // State field(s) for periodduration widget.
  FocusNode? perioddurationFocusNode;
  TextEditingController? perioddurationTextController;
  String? Function(BuildContext, String?)?
      perioddurationTextControllerValidator;
  // State field(s) for HealthInformation widget.
  FormFieldController<List<String>>? healthInformationValueController;
  String? get healthInformationValue =>
      healthInformationValueController?.value?.firstOrNull;
  set healthInformationValue(String? val) =>
      healthInformationValueController?.value = val != null ? [val] : [];
  // State field(s) for Lifestyle widget.
  FormFieldController<List<String>>? lifestyleValueController;
  String? get lifestyleValue => lifestyleValueController?.value?.firstOrNull;
  set lifestyleValue(String? val) =>
      lifestyleValueController?.value = val != null ? [val] : [];
  // State field(s) for Goals widget.
  FormFieldController<List<String>>? goalsValueController;
  String? get goalsValue => goalsValueController?.value?.firstOrNull;
  set goalsValue(String? val) =>
      goalsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  UserAnalyRecord? analy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    ageFocusNode?.dispose();
    ageTextController?.dispose();

    heightFocusNode?.dispose();
    heightTextController?.dispose();

    weightFocusNode?.dispose();
    weightTextController?.dispose();

    cyclelenghtFocusNode?.dispose();
    cyclelenghtTextController?.dispose();

    perioddurationFocusNode?.dispose();
    perioddurationTextController?.dispose();
  }
}
