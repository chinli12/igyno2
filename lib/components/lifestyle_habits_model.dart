import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'lifestyle_habits_widget.dart' show LifestyleHabitsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LifestyleHabitsModel extends FlutterFlowModel<LifestyleHabitsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Lifestyle widget.
  FormFieldController<List<String>>? lifestyleValueController;
  String? get lifestyleValue => lifestyleValueController?.value?.firstOrNull;
  set lifestyleValue(String? val) =>
      lifestyleValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
