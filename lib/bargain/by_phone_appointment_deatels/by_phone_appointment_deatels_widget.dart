import '/backend/api_requests/api_calls.dart';
import '/components/drawer_content_widget.dart';
import '/components/header_widget.dart';
import '/components/navigate_back_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'by_phone_appointment_deatels_model.dart';
export 'by_phone_appointment_deatels_model.dart';

class ByPhoneAppointmentDeatelsWidget extends StatefulWidget {
  const ByPhoneAppointmentDeatelsWidget({
    Key? key,
    required this.appointmentId,
  }) : super(key: key);

  final String? appointmentId;

  @override
  _ByPhoneAppointmentDeatelsWidgetState createState() =>
      _ByPhoneAppointmentDeatelsWidgetState();
}

class _ByPhoneAppointmentDeatelsWidgetState
    extends State<ByPhoneAppointmentDeatelsWidget> {
  late ByPhoneAppointmentDeatelsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ByPhoneAppointmentDeatelsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().CopyText = false;
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: TaskerpageBackendGroup.appointmentReadCall.call(
        id: widget.appointmentId,
        apiGlobalKey: FFAppState().apiKey,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitThreeBounce(
                  color: Color(0xFF5450E2),
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        final byPhoneAppointmentDeatelsAppointmentReadResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            drawer: Container(
              width: MediaQuery.sizeOf(context).width * 0.85,
              child: Drawer(
                elevation: 16.0,
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFE8EAFF),
                  ),
                  child: wrapWithModel(
                    model: _model.drawerContentModel,
                    updateCallback: () => setState(() {}),
                    child: DrawerContentWidget(),
                  ),
                ),
              ),
            ),
            body: SafeArea(
              top: true,
              child: FutureBuilder<ApiCallResponse>(
                future: TaskerpageBackendGroup.userProfileReadCall.call(
                  id: functions.jsonToString(getJsonField(
                            FFAppState().userProfile,
                            r'''$.data.role_profile_name''',
                          )) ==
                          'Tasker'
                      ? functions.jsonToString(getJsonField(
                          byPhoneAppointmentDeatelsAppointmentReadResponse
                              .jsonBody,
                          r'''$.data.poster''',
                        ))
                      : functions.jsonToString(getJsonField(
                          byPhoneAppointmentDeatelsAppointmentReadResponse
                              .jsonBody,
                          r'''$.data.poster''',
                        )),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: SpinKitThreeBounce(
                          color: Color(0xFF5450E2),
                          size: 50.0,
                        ),
                      ),
                    );
                  }
                  final columnUserProfileReadResponse = snapshot.data!;
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.headerModel,
                        updateCallback: () => setState(() {}),
                        child: HeaderWidget(
                          openDrawer: () async {
                            scaffoldKey.currentState!.openDrawer();
                          },
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.navigateBackModel,
                                updateCallback: () => setState(() {}),
                                child: NavigateBackWidget(
                                  text: 'Appointment Details',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 28.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (functions.jsonToString(getJsonField(
                                        columnUserProfileReadResponse.jsonBody,
                                        r'''$.data.role''',
                                      )) ==
                                      'Tasker') {
                                    context.pushNamed(
                                      'Tasker_Profile_view',
                                      queryParameters: {
                                        'id': serializeParam(
                                          getJsonField(
                                            columnUserProfileReadResponse
                                                .jsonBody,
                                            r'''$.data.name''',
                                          ),
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                    );
                                  } else {
                                    context.pushNamed(
                                      'Poster_Profile_view',
                                      queryParameters: {
                                        'id': serializeParam(
                                          getJsonField(
                                            columnUserProfileReadResponse
                                                .jsonBody,
                                            r'''$.data.name''',
                                          ),
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                    );
                                  }
                                },
                                child: Container(
                                  width: 100.0,
                                  height: 105.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF6F6F6),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 16.0, 13.0, 20.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (functions.jsonToString(
                                                        getJsonField(
                                                      columnUserProfileReadResponse
                                                          .jsonBody,
                                                      r'''$.data.role''',
                                                    )) ==
                                                    'Tasker') {
                                                  context.pushNamed(
                                                    'Tasker_Profile_view',
                                                    queryParameters: {
                                                      'id': serializeParam(
                                                        getJsonField(
                                                          columnUserProfileReadResponse
                                                              .jsonBody,
                                                          r'''$.data.name''',
                                                        ),
                                                        ParamType.int,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                } else {
                                                  context.pushNamed(
                                                    'Poster_Profile_view',
                                                    queryParameters: {
                                                      'id': serializeParam(
                                                        getJsonField(
                                                          columnUserProfileReadResponse
                                                              .jsonBody,
                                                          r'''$.data.name''',
                                                        ),
                                                        ParamType.int,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                }
                                              },
                                              child: Container(
                                                width: 60.0,
                                                height: 60.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  '${FFAppState().baseUrl}${getJsonField(
                                                    columnUserProfileReadResponse
                                                        .jsonBody,
                                                    r'''$.data.avatar''',
                                                  ).toString()}',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          if (functions
                                                                  .jsonToString(
                                                                      getJsonField(
                                                                columnUserProfileReadResponse
                                                                    .jsonBody,
                                                                r'''$.data.role''',
                                                              )) ==
                                                              'Tasker') {
                                                            context.pushNamed(
                                                              'Tasker_Profile_view',
                                                              queryParameters: {
                                                                'id':
                                                                    serializeParam(
                                                                  getJsonField(
                                                                    columnUserProfileReadResponse
                                                                        .jsonBody,
                                                                    r'''$.data.name''',
                                                                  ),
                                                                  ParamType.int,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          } else {
                                                            context.pushNamed(
                                                              'Poster_Profile_view',
                                                              queryParameters: {
                                                                'id':
                                                                    serializeParam(
                                                                  getJsonField(
                                                                    columnUserProfileReadResponse
                                                                        .jsonBody,
                                                                    r'''$.data.name''',
                                                                  ),
                                                                  ParamType.int,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          }
                                                        },
                                                        child: Text(
                                                          '${getJsonField(
                                                            columnUserProfileReadResponse
                                                                .jsonBody,
                                                            r'''$.data.first_name''',
                                                          ).toString()} ${getJsonField(
                                                            columnUserProfileReadResponse
                                                                .jsonBody,
                                                            r'''$.data.last_name''',
                                                          ).toString()}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lato',
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 6.0,
                                                                0.0, 6.0),
                                                    child: Text(
                                                      'By Phone',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Lato',
                                                            color: Colors.black,
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        getJsonField(
                                                          byPhoneAppointmentDeatelsAppointmentReadResponse
                                                              .jsonBody,
                                                          r'''$.data.appointment_time''',
                                                        ).toString(),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Lato',
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons
                                                              .info_outline_rounded,
                                                          color:
                                                              Color(0xFF212121),
                                                          size: 18.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 24.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0.00, 0.00),
                                child: Stack(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  children: [
                                    Container(
                                      height: 52.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF6F6F6),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        border: Border.all(
                                          color: FFAppState().CopyText == true
                                              ? Color(0xFF00C853)
                                              : Color(0x00000000),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            17.0, 0.0, 17.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Icon(
                                                      Icons.local_phone_rounded,
                                                      color: Color(0xFF3D3D3D),
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      getJsonField(
                                                        columnUserProfileReadResponse
                                                            .jsonBody,
                                                        r'''$.data.phone_number''',
                                                      ).toString(),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Lato',
                                                            color: Color(
                                                                0xFF212121),
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await Clipboard.setData(
                                                    ClipboardData(
                                                        text: getJsonField(
                                                  columnUserProfileReadResponse
                                                      .jsonBody,
                                                  r'''$.data.phone_number''',
                                                ).toString()));
                                                setState(() {
                                                  FFAppState().CopyText = true;
                                                });
                                                _model.instantTimer =
                                                    InstantTimer.periodic(
                                                  duration: Duration(
                                                      milliseconds: 2000),
                                                  callback: (timer) async {
                                                    setState(() {
                                                      FFAppState().CopyText =
                                                          false;
                                                    });
                                                    _model.instantTimer
                                                        ?.cancel();
                                                  },
                                                  startImmediately: false,
                                                );
                                              },
                                              child: Icon(
                                                Icons.content_copy_rounded,
                                                color: Color(0xFF3D3D3D),
                                                size: 20.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    if (!((functions.jsonToString(getJsonField(
                                              byPhoneAppointmentDeatelsAppointmentReadResponse
                                                  .jsonBody,
                                              r'''$.data.is_tasker_accepted''',
                                            )) ==
                                            '1') &&
                                        (functions.jsonToString(getJsonField(
                                              byPhoneAppointmentDeatelsAppointmentReadResponse
                                                  .jsonBody,
                                              r'''$.data.is_poster_accepted''',
                                            )) ==
                                            '1')))
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                  sigmaX: 3.0,
                                                  sigmaY: 3.0,
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
