import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  Local state fields for this page.

  List<dynamic> tips = [];
  void addToTips(dynamic item) => tips.add(item);
  void removeFromTips(dynamic item) => tips.remove(item);
  void removeAtIndexFromTips(int index) => tips.removeAt(index);
  void insertAtIndexInTips(int index, dynamic item) => tips.insert(index, item);
  void updateTipsAtIndex(int index, Function(dynamic) updateFn) =>
      tips[index] = updateFn(tips[index]);

  double? nextslider;

  String? ovelationwindow;

  String? fertalitywindow;

  String? currenPhase;

  String? nextperiod;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - netWork] action in Dashboard widget.
  bool? network;
  // State field(s) for Slider widget.
  double? sliderValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
