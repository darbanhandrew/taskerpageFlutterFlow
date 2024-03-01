import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'side_bar_left_appointment_model.dart';
export 'side_bar_left_appointment_model.dart';

class SideBarLeftAppointmentWidget extends StatefulWidget {
  const SideBarLeftAppointmentWidget({super.key});

  @override
  State<SideBarLeftAppointmentWidget> createState() =>
      _SideBarLeftAppointmentWidgetState();
}

class _SideBarLeftAppointmentWidgetState
    extends State<SideBarLeftAppointmentWidget> {
  late SideBarLeftAppointmentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SideBarLeftAppointmentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(76.0, 5.0, 24.0, 0.0),
      child: Container(
        width: 216.0,
        height: 440.3,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 0.0),
              spreadRadius: 2.0,
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 19.0, 0.0, 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 8.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.safePop();
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.keyboard_arrow_left,
                        color: Color(0xFF222222),
                        size: 24.0,
                      ),
                      Text(
                        'Back to dashboard ',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Lato',
                              color: FlutterFlowTheme.of(context).alternate,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ].divide(SizedBox(width: 6.0)),
                  ),
                ),
              ),
              Divider(
                height: 23.0,
                thickness: 1.0,
                color: Color(0xFFD2D2D2),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      color: Color(0xFF222222),
                      size: 24.0,
                    ),
                    Text(
                      'Total events',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Lato',
                            color: Color(0xFF222222),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Expanded(
                      child: FutureBuilder<ApiCallResponse>(
                        future: TaskerpageBackendGroup.appointmentListCall.call(
                          filters: '[[\"${functions.jsonToString(getJsonField(
                                FFAppState().userProfile,
                                r'''$.data.role_profile_name''',
                              )) == 'Tasker' ? 'tasker' : 'poster'}\",\"=\",\"${getJsonField(
                            FFAppState().userProfile,
                            r'''$.data.name''',
                          ).toString()}\"],[\"is_${functions.jsonToString(getJsonField(
                                FFAppState().userProfile,
                                r'''$.data.role_profile_name''',
                              )) == 'Tasker' ? 'tasker' : 'poster'}_accepted\",\"=\",\"1\"],[\"is_${functions.jsonToString(getJsonField(
                                FFAppState().userProfile,
                                r'''$.data.role_profile_name''',
                              )) == 'Tasker' ? 'poster' : 'tasker'}_accepted\",\"=\",\"1\"]]',
                          fields:
                              '[\"appointment_type\",\"post\",\"appointment_time\",\"poster\",\"tasker\",\"is_tasker_accepted\",\"is_poster_accepted\",\"name\",\"creation\",\"appointment_start_time\",\"appointment_end_time\"]',
                          apiGlobalKey: FFAppState().apiKey,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 35.0,
                                height: 35.0,
                                child: SpinKitThreeBounce(
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 35.0,
                                ),
                              ),
                            );
                          }
                          final rowAppointmentListResponse = snapshot.data!;
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                functions
                                    .numberofListitems((getJsonField(
                                      rowAppointmentListResponse.jsonBody,
                                      r'''$.data''',
                                      true,
                                    ) as List)
                                        .map<String>((s) => s.toString())
                                        .toList())
                                    .toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ].divide(SizedBox(width: 8.0)),
                ),
              ),
              Divider(
                height: 29.0,
                thickness: 1.0,
                color: Color(0xFFD2D2D2),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Task Appointments ',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Lato',
                            color: FlutterFlowTheme.of(context).alternate,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '0',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: Color(0xFF494949),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ].divide(SizedBox(width: 8.0)),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 18.0, 24.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Task Bids',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Lato',
                            color: FlutterFlowTheme.of(context).alternate,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '0',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: Color(0xFF494949),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ].divide(SizedBox(width: 8.0)),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 18.0, 24.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Task Posts ',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Lato',
                            color: FlutterFlowTheme.of(context).alternate,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '0',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: Color(0xFF494949),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ].divide(SizedBox(width: 8.0)),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 18.0, 24.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Appointment \nrequests',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Lato',
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Expanded(
                      child: FutureBuilder<ApiCallResponse>(
                        future: TaskerpageBackendGroup.appointmentListCall.call(
                          filters: '[[\"${functions.jsonToString(getJsonField(
                                FFAppState().userProfile,
                                r'''$.data.role_profile_name''',
                              )) == 'Tasker' ? 'tasker' : 'poster'}\",\"=\",\"${getJsonField(
                            FFAppState().userProfile,
                            r'''$.data.name''',
                          ).toString()}\"],[\"is_${functions.jsonToString(getJsonField(
                                FFAppState().userProfile,
                                r'''$.data.role_profile_name''',
                              )) == 'Tasker' ? 'tasker' : 'poster'}_accepted\",\"=\",\"0\"],[\"is_${functions.jsonToString(getJsonField(
                                FFAppState().userProfile,
                                r'''$.data.role_profile_name''',
                              )) == 'Tasker' ? 'poster' : 'tasker'}_accepted\",\"=\",\"1\"]]',
                          fields:
                              '[\"appointment_type\",\"post\",\"appointment_time\",\"poster\",\"tasker\",\"is_tasker_accepted\",\"is_poster_accepted\",\"name\",\"creation\",\"appointment_start_time\",\"appointment_end_time\"]',
                          apiGlobalKey: FFAppState().apiKey,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 35.0,
                                height: 35.0,
                                child: SpinKitThreeBounce(
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 35.0,
                                ),
                              ),
                            );
                          }
                          final rowAppointmentListResponse = snapshot.data!;
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                functions
                                    .numberofListitems((getJsonField(
                                      rowAppointmentListResponse.jsonBody,
                                      r'''$.data''',
                                      true,
                                    ) as List)
                                        .map<String>((s) => s.toString())
                                        .toList())
                                    .toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ].divide(SizedBox(width: 8.0)),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 18.0, 24.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'My requests',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Lato',
                            color: FlutterFlowTheme.of(context).alternate,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '0',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: Color(0xFF494949),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ].divide(SizedBox(width: 8.0)),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 18.0, 24.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Other events ',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Lato',
                            color: FlutterFlowTheme.of(context).alternate,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '0',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: Color(0xFF494949),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ].divide(SizedBox(width: 8.0)),
                ),
              ),
              Divider(
                height: 29.0,
                thickness: 1.0,
                color: Color(0xFFD2D2D2),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 168.0,
                      height: 36.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(1.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '+ New appointment',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ].divide(SizedBox(width: 8.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
