import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/components/perioddate_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'calenda_widget.dart' show CalendaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CalendaModel extends FlutterFlowModel<CalendaWidget> {
  ///  Local state fields for this page.

  DateTime? inputedate;

  List<dynamic> calendar = [];
  void addToCalendar(dynamic item) => calendar.add(item);
  void removeFromCalendar(dynamic item) => calendar.remove(item);
  void removeAtIndexFromCalendar(int index) => calendar.removeAt(index);
  void insertAtIndexInCalendar(int index, dynamic item) =>
      calendar.insert(index, item);
  void updateCalendarAtIndex(int index, Function(dynamic) updateFn) =>
      calendar[index] = updateFn(calendar[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
