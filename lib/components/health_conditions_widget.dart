import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'health_conditions_model.dart';
export 'health_conditions_model.dart';

class HealthConditionsWidget extends StatefulWidget {
  const HealthConditionsWidget({super.key});

  @override
  State<HealthConditionsWidget> createState() => _HealthConditionsWidgetState();
}

class _HealthConditionsWidgetState extends State<HealthConditionsWidget> {
  late HealthConditionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HealthConditionsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Health Information',
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Inter Tight',
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                'Do you experience any of these conditions?',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                    ),
              ),
              FlutterFlowChoiceChips(
                options: [
                  ChipData('PCOS'),
                  ChipData('Endometriosis'),
                  ChipData('Thyroid Issues'),
                  ChipData('Irregular Cycles'),
                  ChipData('No health issue')
                ],
                onChanged: (val) => safeSetState(
                    () => _model.healthInformationValue = val?.firstOrNull),
                selectedChipStyle: ChipStyle(
                  backgroundColor: Color(0xFFFF69B4),
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  iconColor: FlutterFlowTheme.of(context).primaryText,
                  iconSize: 18.0,
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                unselectedChipStyle: ChipStyle(
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Inter',
                        color: Color(0xFFFF69B4),
                        letterSpacing: 0.0,
                      ),
                  iconColor: FlutterFlowTheme.of(context).primaryText,
                  iconSize: 18.0,
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                chipSpacing: 8.0,
                rowSpacing: 8.0,
                multiselect: false,
                alignment: WrapAlignment.start,
                controller: _model.healthInformationValueController ??=
                    FormFieldController<List<String>>(
                  [],
                ),
                wrapped: true,
              ),
              FFButtonWidget(
                onPressed: () async {
                  await currentUserReference!.update(createUsersRecordData(
                    health: _model.healthInformationValue,
                  ));
                  Navigator.pop(context);
                },
                text: 'save',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Inter Tight',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ].divide(SizedBox(height: 20.0)),
          ),
        ),
      ),
    );
  }
}
