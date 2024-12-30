import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'videocal_widget.dart' show VideocalWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VideocalModel extends FlutterFlowModel<VideocalWidget> {
  ///  Local state fields for this page.

  bool? yes;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (chat)] action in IconButton widget.
  ApiCallResponse? chat;
  // Stores action output result for [Backend Call - API (vide)] action in IconButton widget.
  ApiCallResponse? video;
  // Stores action output result for [Backend Call - API (getvideo)] action in IconButton widget.
  ApiCallResponse? getvide;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
