import '/backend/api_requests/api_calls.dart';
import '/components/aler_modal_massage_accept_appointment_widget.dart';
import '/components/aler_modal_massage_reject_appointment_widget.dart';
import '/components/drawer_content_widget.dart';
import '/components/header_widget.dart';
import '/components/nav_bar_widget.dart';
import '/components/navigate_back_widget.dart';
import '/components/user_rate_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'appointment_list_model.dart';
export 'appointment_list_model.dart';

class AppointmentListWidget extends StatefulWidget {
  const AppointmentListWidget({Key? key}) : super(key: key);

  @override
  _AppointmentListWidgetState createState() => _AppointmentListWidgetState();
}

class _AppointmentListWidgetState extends State<AppointmentListWidget>
    with TickerProviderStateMixin {
  late AppointmentListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppointmentListModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 5,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
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
          child: Column(
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: wrapWithModel(
                        model: _model.navigateBackModel,
                        updateCallback: () => setState(() {}),
                        child: NavigateBackWidget(
                          text: 'Appointments',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Flexible(
                child: Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(32.0, 10.0, 32.0, 0.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment(0.0, 0),
                          child: TabBar(
                            isScrollable: true,
                            labelColor: Color(0xFF211DAF),
                            unselectedLabelColor: Color(0xFF0C0A3E),
                            labelPadding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            labelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Lato',
                                  fontSize: 12.8,
                                  fontWeight: FontWeight.bold,
                                ),
                            unselectedLabelStyle: TextStyle(),
                            indicatorColor: Color(0xFF211DAF),
                            tabs: [
                              Tab(
                                text: 'Invitation',
                              ),
                              Tab(
                                text: 'Pending',
                              ),
                              Tab(
                                text: 'Accepted',
                              ),
                              Tab(
                                text: 'Rejected',
                              ),
                              Tab(
                                text: 'Done',
                              ),
                            ],
                            controller: _model.tabBarController,
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _model.tabBarController,
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 24.0, 0.0, 24.0),
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: TaskerpageBackendGroup
                                            .appointmentListCall
                                            .call(
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
                                              '[\"appointment_type\",\"appointment_time\",\"poster\",\"tasker\",\"is_tasker_accepted\",\"is_poster_accepted\",\"name\",\"creation\",\"appointment_start_time\",\"appointment_end_time\"]',
                                          apiGlobalKey: FFAppState().apiKey,
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
                                          final listViewAppointmentListResponse =
                                              snapshot.data!;
                                          return Builder(
                                            builder: (context) {
                                              final invationAppointment =
                                                  getJsonField(
                                                listViewAppointmentListResponse
                                                    .jsonBody,
                                                r'''$.data''',
                                              ).toList();
                                              return ListView.separated(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    invationAppointment.length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(height: 20.0),
                                                itemBuilder: (context,
                                                    invationAppointmentIndex) {
                                                  final invationAppointmentItem =
                                                      invationAppointment[
                                                          invationAppointmentIndex];
                                                  return FutureBuilder<
                                                      ApiCallResponse>(
                                                    future: TaskerpageBackendGroup
                                                        .customerProfileDetailsCall
                                                        .call(
                                                      name: functions.jsonToString(
                                                                  getJsonField(
                                                                FFAppState()
                                                                    .userProfile,
                                                                r'''$.data.role_profile_name''',
                                                              )) ==
                                                              'Tasker'
                                                          ? functions
                                                              .jsonToString(
                                                                  getJsonField(
                                                              invationAppointmentItem,
                                                              r'''$.poster''',
                                                            ))
                                                          : functions
                                                              .jsonToString(
                                                                  getJsonField(
                                                              invationAppointmentItem,
                                                              r'''$.tasker''',
                                                            )),
                                                      apiGlobalKey:
                                                          FFAppState().apiKey,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                SpinKitThreeBounce(
                                                              color: Color(
                                                                  0xFF5450E2),
                                                              size: 50.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final containerCustomerProfileDetailsResponse =
                                                          snapshot.data!;
                                                      return InkWell(
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
                                                                invationAppointmentItem,
                                                                r'''$.appointment_type''',
                                                              )) ==
                                                              'Online') {
                                                            context.pushNamed(
                                                              'Online_AppointmentDeatels',
                                                              queryParameters: {
                                                                'appointmentId':
                                                                    serializeParam(
                                                                  getJsonField(
                                                                    invationAppointmentItem,
                                                                    r'''$.name''',
                                                                  ).toString(),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          } else {
                                                            if (functions
                                                                    .jsonToString(
                                                                        getJsonField(
                                                                  invationAppointmentItem,
                                                                  r'''$.appointment_type''',
                                                                )) ==
                                                                'By Phone') {
                                                              context.pushNamed(
                                                                'By_Phone_AppointmentDeatels',
                                                                queryParameters:
                                                                    {
                                                                  'appointmentId':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      invationAppointmentItem,
                                                                      r'''$.name''',
                                                                    ).toString(),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            } else {
                                                              context.pushNamed(
                                                                'On_site_AppointmentDeatels',
                                                                queryParameters:
                                                                    {
                                                                  'appointmentId':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      invationAppointmentItem,
                                                                      r'''$.name''',
                                                                    ).toString(),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            }
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 148.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFF6F6F6),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        16.0,
                                                                        13.0,
                                                                        16.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              60.0,
                                                                          height:
                                                                              60.0,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Image.network(
                                                                            '${FFAppState().baseUrl}${getJsonField(
                                                                              containerCustomerProfileDetailsResponse.jsonBody,
                                                                              r'''$.data.avatar''',
                                                                            ).toString()}',
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                    child: Text(
                                                                                      '${getJsonField(
                                                                                        containerCustomerProfileDetailsResponse.jsonBody,
                                                                                        r'''$.data.first_name''',
                                                                                      ).toString()} ${getJsonField(
                                                                                        containerCustomerProfileDetailsResponse.jsonBody,
                                                                                        r'''$.data.last_name''',
                                                                                      ).toString()}',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Lato',
                                                                                            color: Colors.black,
                                                                                            fontSize: 14.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 6.0),
                                                                                child: Text(
                                                                                  getJsonField(
                                                                                    invationAppointmentItem,
                                                                                    r'''$.appointment_type''',
                                                                                  ).toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Lato',
                                                                                        color: Colors.black,
                                                                                        fontSize: 14.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Text(
                                                                                    getJsonField(
                                                                                      invationAppointmentItem,
                                                                                      r'''$.appointment_time''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Lato',
                                                                                          color: Colors.black,
                                                                                          fontSize: 12.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                    child: Icon(
                                                                                      Icons.info_outline_rounded,
                                                                                      color: Color(0xFF212121),
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
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        enableDrag:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return GestureDetector(
                                                                            onTap: () => _model.unfocusNode.canRequestFocus
                                                                                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                                : FocusScope.of(context).unfocus(),
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: AlerModalMassageRejectAppointmentWidget(
                                                                                id: getJsonField(
                                                                                  invationAppointmentItem,
                                                                                  r'''$.name''',
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          92.0,
                                                                      height:
                                                                          39.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0x00FFFFFF),
                                                                        borderRadius:
                                                                            BorderRadius.circular(5.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              Color(0xFFE8083F),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            'Reject',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Lato',
                                                                                  color: Color(0xFFE8083F),
                                                                                  fontSize: 14.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        enableDrag:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return GestureDetector(
                                                                            onTap: () => _model.unfocusNode.canRequestFocus
                                                                                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                                : FocusScope.of(context).unfocus(),
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: AlerModalMassageAcceptAppointmentWidget(
                                                                                id: getJsonField(
                                                                                  invationAppointmentItem,
                                                                                  r'''$.name''',
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          92.0,
                                                                      height:
                                                                          39.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFF00C661),
                                                                        borderRadius:
                                                                            BorderRadius.circular(5.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              Color(0xFF00C661),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            'Accept',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Lato',
                                                                                  color: Colors.white,
                                                                                  fontSize: 14.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  if (false)
                                                                    InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {},
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            92.0,
                                                                        height:
                                                                            39.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0xFFEF0EB0),
                                                                          borderRadius:
                                                                              BorderRadius.circular(5.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Color(0xFFEF0EB0),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              'Edit',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Lato',
                                                                                    color: Colors.white,
                                                                                    fontSize: 14.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        10.0)),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 24.0, 0.0, 24.0),
                                        child: FutureBuilder<ApiCallResponse>(
                                          future: TaskerpageBackendGroup
                                              .appointmentListCall
                                              .call(
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
                                                )) == 'Tasker' ? 'poster' : 'tasker'}_accepted\",\"=\",\"0\"]]',
                                            fields:
                                                '[\"appointment_type\",\"appointment_time\",\"poster\",\"tasker\",\"is_tasker_accepted\",\"is_poster_accepted\",\"name\",\"creation\",\"appointment_start_time\",\"appointment_end_time\"]',
                                            apiGlobalKey: FFAppState().apiKey,
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
                                            final listViewAppointmentListResponse =
                                                snapshot.data!;
                                            return Builder(
                                              builder: (context) {
                                                final pendingAppointment =
                                                    getJsonField(
                                                  listViewAppointmentListResponse
                                                      .jsonBody,
                                                  r'''$.data''',
                                                ).toList();
                                                return ListView.separated(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      pendingAppointment.length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(height: 20.0),
                                                  itemBuilder: (context,
                                                      pendingAppointmentIndex) {
                                                    final pendingAppointmentItem =
                                                        pendingAppointment[
                                                            pendingAppointmentIndex];
                                                    return FutureBuilder<
                                                        ApiCallResponse>(
                                                      future: TaskerpageBackendGroup
                                                          .customerProfileDetailsCall
                                                          .call(
                                                        name: functions.jsonToString(
                                                                    getJsonField(
                                                                  FFAppState()
                                                                      .userProfile,
                                                                  r'''$.data.role_profile_name''',
                                                                )) ==
                                                                'Tasker'
                                                            ? functions
                                                                .jsonToString(
                                                                    getJsonField(
                                                                pendingAppointmentItem,
                                                                r'''$.poster''',
                                                              ))
                                                            : functions
                                                                .jsonToString(
                                                                    getJsonField(
                                                                pendingAppointmentItem,
                                                                r'''$.tasker''',
                                                              )),
                                                        apiGlobalKey:
                                                            FFAppState().apiKey,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  SpinKitThreeBounce(
                                                                color: Color(
                                                                    0xFF5450E2),
                                                                size: 50.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final containerCustomerProfileDetailsResponse =
                                                            snapshot.data!;
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            if (functions
                                                                    .jsonToString(
                                                                        getJsonField(
                                                                  pendingAppointmentItem,
                                                                  r'''$.appointment_type''',
                                                                )) ==
                                                                'Online') {
                                                              context.pushNamed(
                                                                'Online_AppointmentDeatels',
                                                                queryParameters:
                                                                    {
                                                                  'appointmentId':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      pendingAppointmentItem,
                                                                      r'''$.name''',
                                                                    ).toString(),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            } else {
                                                              if (functions
                                                                      .jsonToString(
                                                                          getJsonField(
                                                                    pendingAppointmentItem,
                                                                    r'''$.appointment_type''',
                                                                  )) ==
                                                                  'By Phone') {
                                                                context
                                                                    .pushNamed(
                                                                  'By_Phone_AppointmentDeatels',
                                                                  queryParameters:
                                                                      {
                                                                    'appointmentId':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        pendingAppointmentItem,
                                                                        r'''$.name''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              } else {
                                                                context
                                                                    .pushNamed(
                                                                  'On_site_AppointmentDeatels',
                                                                  queryParameters:
                                                                      {
                                                                    'appointmentId':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        pendingAppointmentItem,
                                                                        r'''$.name''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              }
                                                            }
                                                          },
                                                          child: Container(
                                                            width: 100.0,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFF6F6F6),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          16.0,
                                                                          13.0,
                                                                          20.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            60.0,
                                                                        height:
                                                                            60.0,
                                                                        clipBehavior:
                                                                            Clip.antiAlias,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child: Image
                                                                            .network(
                                                                          '${FFAppState().baseUrl}${getJsonField(
                                                                            containerCustomerProfileDetailsResponse.jsonBody,
                                                                            r'''$.data.avatar''',
                                                                          ).toString()}',
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                  child: Text(
                                                                                    '${getJsonField(
                                                                                      containerCustomerProfileDetailsResponse.jsonBody,
                                                                                      r'''$.data.first_name''',
                                                                                    ).toString()} ${getJsonField(
                                                                                      containerCustomerProfileDetailsResponse.jsonBody,
                                                                                      r'''$.data.last_name''',
                                                                                    ).toString()}',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Lato',
                                                                                          color: Colors.black,
                                                                                          fontSize: 14.0,
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 6.0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  pendingAppointmentItem,
                                                                                  r'''$.appointment_type''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Lato',
                                                                                      color: Colors.black,
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Text(
                                                                                  getJsonField(
                                                                                    pendingAppointmentItem,
                                                                                    r'''$.appointment_time''',
                                                                                  ).toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Lato',
                                                                                        color: Colors.black,
                                                                                        fontSize: 12.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                  child: Icon(
                                                                                    Icons.info_outline_rounded,
                                                                                    color: Color(0xFF212121),
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
                                                        );
                                                      },
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 24.0, 0.0, 0.0),
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: TaskerpageBackendGroup
                                            .appointmentListCall
                                            .call(
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
                                              '[\"appointment_type\",\"appointment_time\",\"poster\",\"tasker\",\"is_tasker_accepted\",\"is_poster_accepted\",\"name\",\"creation\",\"appointment_start_time\"]',
                                          apiGlobalKey: FFAppState().apiKey,
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
                                          final listViewAppointmentListResponse =
                                              snapshot.data!;
                                          return Builder(
                                            builder: (context) {
                                              final acceptedAppointment =
                                                  getJsonField(
                                                listViewAppointmentListResponse
                                                    .jsonBody,
                                                r'''$.data''',
                                              ).toList();
                                              return ListView.separated(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    acceptedAppointment.length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(height: 20.0),
                                                itemBuilder: (context,
                                                    acceptedAppointmentIndex) {
                                                  final acceptedAppointmentItem =
                                                      acceptedAppointment[
                                                          acceptedAppointmentIndex];
                                                  return FutureBuilder<
                                                      ApiCallResponse>(
                                                    future: TaskerpageBackendGroup
                                                        .customerProfileDetailsCall
                                                        .call(
                                                      name: functions.jsonToString(
                                                                  getJsonField(
                                                                FFAppState()
                                                                    .userProfile,
                                                                r'''$.data.role_profile_name''',
                                                              )) ==
                                                              'Tasker'
                                                          ? functions
                                                              .jsonToString(
                                                                  getJsonField(
                                                              acceptedAppointmentItem,
                                                              r'''$.poster''',
                                                            ))
                                                          : functions
                                                              .jsonToString(
                                                                  getJsonField(
                                                              acceptedAppointmentItem,
                                                              r'''$.tasker''',
                                                            )),
                                                      apiGlobalKey:
                                                          FFAppState().apiKey,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                SpinKitThreeBounce(
                                                              color: Color(
                                                                  0xFF5450E2),
                                                              size: 50.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final containerCustomerProfileDetailsResponse =
                                                          snapshot.data!;
                                                      return InkWell(
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
                                                                acceptedAppointmentItem,
                                                                r'''$.appointment_type''',
                                                              )) ==
                                                              'Online') {
                                                            context.pushNamed(
                                                              'Online_AppointmentDeatels',
                                                              queryParameters: {
                                                                'appointmentId':
                                                                    serializeParam(
                                                                  getJsonField(
                                                                    acceptedAppointmentItem,
                                                                    r'''$.name''',
                                                                  ).toString(),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          } else {
                                                            if (functions
                                                                    .jsonToString(
                                                                        getJsonField(
                                                                  acceptedAppointmentItem,
                                                                  r'''$.appointment_type''',
                                                                )) ==
                                                                'By Phone') {
                                                              context.pushNamed(
                                                                'By_Phone_AppointmentDeatels',
                                                                queryParameters:
                                                                    {
                                                                  'appointmentId':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      acceptedAppointmentItem,
                                                                      r'''$.name''',
                                                                    ).toString(),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            } else {
                                                              context.pushNamed(
                                                                'On_site_AppointmentDeatels',
                                                                queryParameters:
                                                                    {
                                                                  'appointmentId':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      acceptedAppointmentItem,
                                                                      r'''$.name''',
                                                                    ).toString(),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            }
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFF6F6F6),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        16.0,
                                                                        13.0,
                                                                        20.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          60.0,
                                                                      height:
                                                                          60.0,
                                                                      clipBehavior:
                                                                          Clip.antiAlias,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child: Image
                                                                          .network(
                                                                        '${FFAppState().baseUrl}${getJsonField(
                                                                          containerCustomerProfileDetailsResponse
                                                                              .jsonBody,
                                                                          r'''$.data.avatar''',
                                                                        ).toString()}',
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                child: Text(
                                                                                  '${getJsonField(
                                                                                    containerCustomerProfileDetailsResponse.jsonBody,
                                                                                    r'''$.data.first_name''',
                                                                                  ).toString()} ${getJsonField(
                                                                                    containerCustomerProfileDetailsResponse.jsonBody,
                                                                                    r'''$.data.last_name''',
                                                                                  ).toString()}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Lato',
                                                                                        color: Colors.black,
                                                                                        fontSize: 14.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                6.0,
                                                                                0.0,
                                                                                6.0),
                                                                            child:
                                                                                Text(
                                                                              getJsonField(
                                                                                acceptedAppointmentItem,
                                                                                r'''$.appointment_type''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Lato',
                                                                                    color: Colors.black,
                                                                                    fontSize: 14.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                getJsonField(
                                                                                  acceptedAppointmentItem,
                                                                                  r'''$.appointment_time''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Lato',
                                                                                      color: Colors.black,
                                                                                      fontSize: 12.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                child: Icon(
                                                                                  Icons.info_outline_rounded,
                                                                                  color: Color(0xFF212121),
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
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          30.0,
                                                                      height:
                                                                          30.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFF00C661),
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .done_rounded,
                                                                        color: Colors
                                                                            .white,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 24.0, 0.0, 0.0),
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: TaskerpageBackendGroup
                                            .appointmentListCall
                                            .call(
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
                                              )) == 'Tasker' ? 'poster' : 'tasker'}_accepted\",\"=\",\"0\"]]',
                                          fields:
                                              '[\"appointment_type\",\"appointment_time\",\"poster\",\"tasker\",\"is_tasker_accepted\",\"is_poster_accepted\",\"name\",\"creation\",\"appointment_start_time\",\"appointment_end_time\"]',
                                          apiGlobalKey: FFAppState().apiKey,
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
                                          final listViewAppointmentListResponse =
                                              snapshot.data!;
                                          return Builder(
                                            builder: (context) {
                                              final rejectedAppointment =
                                                  getJsonField(
                                                listViewAppointmentListResponse
                                                    .jsonBody,
                                                r'''$.data''',
                                              ).toList();
                                              return ListView.separated(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    rejectedAppointment.length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(height: 20.0),
                                                itemBuilder: (context,
                                                    rejectedAppointmentIndex) {
                                                  final rejectedAppointmentItem =
                                                      rejectedAppointment[
                                                          rejectedAppointmentIndex];
                                                  return FutureBuilder<
                                                      ApiCallResponse>(
                                                    future: TaskerpageBackendGroup
                                                        .customerProfileDetailsCall
                                                        .call(
                                                      name: functions.jsonToString(
                                                                  getJsonField(
                                                                FFAppState()
                                                                    .userProfile,
                                                                r'''$.data.role_profile_name''',
                                                              )) ==
                                                              'Tasker'
                                                          ? functions
                                                              .jsonToString(
                                                                  getJsonField(
                                                              rejectedAppointmentItem,
                                                              r'''$.poster''',
                                                            ))
                                                          : functions
                                                              .jsonToString(
                                                                  getJsonField(
                                                              rejectedAppointmentItem,
                                                              r'''$.tasker''',
                                                            )),
                                                      apiGlobalKey:
                                                          FFAppState().apiKey,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                SpinKitThreeBounce(
                                                              color: Color(
                                                                  0xFF5450E2),
                                                              size: 50.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final containerCustomerProfileDetailsResponse =
                                                          snapshot.data!;
                                                      return InkWell(
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
                                                                rejectedAppointmentItem,
                                                                r'''$.appointment_type''',
                                                              )) ==
                                                              'Online') {
                                                            context.pushNamed(
                                                              'Online_AppointmentDeatels',
                                                              queryParameters: {
                                                                'appointmentId':
                                                                    serializeParam(
                                                                  getJsonField(
                                                                    rejectedAppointmentItem,
                                                                    r'''$.name''',
                                                                  ).toString(),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          } else {
                                                            if (functions
                                                                    .jsonToString(
                                                                        getJsonField(
                                                                  rejectedAppointmentItem,
                                                                  r'''$.appointment_type''',
                                                                )) ==
                                                                'By Phone') {
                                                              context.pushNamed(
                                                                'By_Phone_AppointmentDeatels',
                                                                queryParameters:
                                                                    {
                                                                  'appointmentId':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      rejectedAppointmentItem,
                                                                      r'''$.name''',
                                                                    ).toString(),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            } else {
                                                              context.pushNamed(
                                                                'On_site_AppointmentDeatels',
                                                                queryParameters:
                                                                    {
                                                                  'appointmentId':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      rejectedAppointmentItem,
                                                                      r'''$.name''',
                                                                    ).toString(),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            }
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFF6F6F6),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        16.0,
                                                                        13.0,
                                                                        20.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          60.0,
                                                                      height:
                                                                          60.0,
                                                                      clipBehavior:
                                                                          Clip.antiAlias,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child: Image
                                                                          .network(
                                                                        '${FFAppState().baseUrl}${getJsonField(
                                                                          containerCustomerProfileDetailsResponse
                                                                              .jsonBody,
                                                                          r'''$.data.avatar''',
                                                                        ).toString()}',
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                child: Text(
                                                                                  '${getJsonField(
                                                                                    containerCustomerProfileDetailsResponse.jsonBody,
                                                                                    r'''$.data.first_name''',
                                                                                  ).toString()} ${getJsonField(
                                                                                    containerCustomerProfileDetailsResponse.jsonBody,
                                                                                    r'''$.data.last_name''',
                                                                                  ).toString()}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Lato',
                                                                                        color: Colors.black,
                                                                                        fontSize: 14.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                6.0,
                                                                                0.0,
                                                                                6.0),
                                                                            child:
                                                                                Text(
                                                                              getJsonField(
                                                                                rejectedAppointmentItem,
                                                                                r'''$.appointment_type''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Lato',
                                                                                    color: Colors.black,
                                                                                    fontSize: 14.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                getJsonField(
                                                                                  rejectedAppointmentItem,
                                                                                  r'''$.appointment_time''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Lato',
                                                                                      color: Colors.black,
                                                                                      fontSize: 12.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                child: Icon(
                                                                                  Icons.info_outline_rounded,
                                                                                  color: Color(0xFF212121),
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
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          30.0,
                                                                      height:
                                                                          30.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFFE50808),
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .close_rounded,
                                                                        color: Colors
                                                                            .white,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 24.0, 0.0, 0.0),
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: TaskerpageBackendGroup
                                            .appointmentListCall
                                            .call(
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
                                              )) == 'Tasker' ? 'poster' : 'tasker'}_accepted\",\"=\",\"1\"],[\"docstatus\",\"=\",\"1\"]]',
                                          fields:
                                              '[\"appointment_type\",\"appointment_time\",\"poster\",\"tasker\",\"is_tasker_accepted\",\"is_poster_accepted\",\"name\",\"docstatus\",\"creation\",\"appointment_start_time\",\"appointment_end_time\"]',
                                          apiGlobalKey: FFAppState().apiKey,
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
                                          final listViewAppointmentListResponse =
                                              snapshot.data!;
                                          return Builder(
                                            builder: (context) {
                                              final acceptedAppointment =
                                                  getJsonField(
                                                listViewAppointmentListResponse
                                                    .jsonBody,
                                                r'''$.data''',
                                              ).toList();
                                              return ListView.separated(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    acceptedAppointment.length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(height: 20.0),
                                                itemBuilder: (context,
                                                    acceptedAppointmentIndex) {
                                                  final acceptedAppointmentItem =
                                                      acceptedAppointment[
                                                          acceptedAppointmentIndex];
                                                  return FutureBuilder<
                                                      ApiCallResponse>(
                                                    future: TaskerpageBackendGroup
                                                        .customerProfileDetailsCall
                                                        .call(
                                                      name: functions.jsonToString(
                                                                  getJsonField(
                                                                FFAppState()
                                                                    .userProfile,
                                                                r'''$.data.role_profile_name''',
                                                              )) ==
                                                              'Tasker'
                                                          ? functions
                                                              .jsonToString(
                                                                  getJsonField(
                                                              acceptedAppointmentItem,
                                                              r'''$.poster''',
                                                            ))
                                                          : functions
                                                              .jsonToString(
                                                                  getJsonField(
                                                              acceptedAppointmentItem,
                                                              r'''$.tasker''',
                                                            )),
                                                      apiGlobalKey:
                                                          FFAppState().apiKey,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                SpinKitThreeBounce(
                                                              color: Color(
                                                                  0xFF5450E2),
                                                              size: 50.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final containerCustomerProfileDetailsResponse =
                                                          snapshot.data!;
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          _model.review =
                                                              await TaskerpageBackendGroup
                                                                  .reviewReadByIdCall
                                                                  .call(
                                                            apiGlobalKey:
                                                                FFAppState()
                                                                    .apiKey,
                                                            filters:
                                                                '[[\"appointment\",\"=\",\"${getJsonField(
                                                              acceptedAppointmentItem,
                                                              r'''$.name''',
                                                            ).toString()}\"],[\"reviewed_by\",\"=\",\"${getJsonField(
                                                              FFAppState()
                                                                  .userProfile,
                                                              r'''$.data.name''',
                                                            ).toString()}\"]]',
                                                            fields:
                                                                '[\"appointment\",\"name\",\"reviewed_by\",\"review_rate\",\"comment\"]',
                                                          );
                                                          if (functions
                                                                  .checkLenghtlist(
                                                                      getJsonField(
                                                                (_model.review
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.data''',
                                                              )) ==
                                                              false) {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return GestureDetector(
                                                                  onTap: () => _model
                                                                          .unfocusNode
                                                                          .canRequestFocus
                                                                      ? FocusScope.of(
                                                                              context)
                                                                          .requestFocus(_model
                                                                              .unfocusNode)
                                                                      : FocusScope.of(
                                                                              context)
                                                                          .unfocus(),
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        UserRateWidget(
                                                                      appointmentId:
                                                                          getJsonField(
                                                                        acceptedAppointmentItem,
                                                                        r'''$.name''',
                                                                      ).toString(),
                                                                      action:
                                                                          () async {
                                                                        setState(() =>
                                                                            _model.apiRequestCompleter =
                                                                                null);
                                                                        await _model
                                                                            .waitForApiRequestCompleted();
                                                                      },
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));
                                                          } else {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'Review'),
                                                                  content: Text(
                                                                      'You have already commented on this appointment !'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          }

                                                          setState(() {});
                                                        },
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFF6F6F6),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        16.0,
                                                                        13.0,
                                                                        20.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          60.0,
                                                                      height:
                                                                          60.0,
                                                                      clipBehavior:
                                                                          Clip.antiAlias,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child: Image
                                                                          .network(
                                                                        '${FFAppState().baseUrl}${getJsonField(
                                                                          containerCustomerProfileDetailsResponse
                                                                              .jsonBody,
                                                                          r'''$.data.avatar''',
                                                                        ).toString()}',
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                child: Text(
                                                                                  '${getJsonField(
                                                                                    containerCustomerProfileDetailsResponse.jsonBody,
                                                                                    r'''$.data.first_name''',
                                                                                  ).toString()} ${getJsonField(
                                                                                    containerCustomerProfileDetailsResponse.jsonBody,
                                                                                    r'''$.data.last_name''',
                                                                                  ).toString()}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Lato',
                                                                                        color: Colors.black,
                                                                                        fontSize: 14.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                6.0,
                                                                                0.0,
                                                                                6.0),
                                                                            child:
                                                                                Text(
                                                                              getJsonField(
                                                                                acceptedAppointmentItem,
                                                                                r'''$.appointment_type''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Lato',
                                                                                    color: Colors.black,
                                                                                    fontSize: 14.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                getJsonField(
                                                                                  acceptedAppointmentItem,
                                                                                  r'''$.appointment_time''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Lato',
                                                                                      color: Colors.black,
                                                                                      fontSize: 12.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                child: Icon(
                                                                                  Icons.info_outline_rounded,
                                                                                  color: Color(0xFF212121),
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
                                                                FutureBuilder<
                                                                    ApiCallResponse>(
                                                                  future: (_model.apiRequestCompleter ??= Completer<
                                                                          ApiCallResponse>()
                                                                        ..complete(TaskerpageBackendGroup
                                                                            .reviewReadByIdCall
                                                                            .call(
                                                                          filters:
                                                                              '[[\"appointment\",\"=\",\"${getJsonField(
                                                                            acceptedAppointmentItem,
                                                                            r'''$.name''',
                                                                          ).toString()}\"],[\"reviewed_by\",\"=\",\"${getJsonField(
                                                                            FFAppState().userProfile,
                                                                            r'''$.data.name''',
                                                                          ).toString()}\"]]',
                                                                          apiGlobalKey:
                                                                              FFAppState().apiKey,
                                                                          fields:
                                                                              '[\"appointment\",\"name\",\"reviewed_by\",\"review_rate\",\"comment\"]',
                                                                        )))
                                                                      .future,
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              SpinKitThreeBounce(
                                                                            color:
                                                                                Color(0xFF5450E2),
                                                                            size:
                                                                                50.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    final commentedReviewReadByIdResponse =
                                                                        snapshot
                                                                            .data!;
                                                                    return Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children:
                                                                          [
                                                                        if (getJsonField(
                                                                              commentedReviewReadByIdResponse.jsonBody,
                                                                              r'''$.data''',
                                                                            ) !=
                                                                            null)
                                                                          Container(
                                                                            height:
                                                                                25.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFFD8F40),
                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                              shape: BoxShape.rectangle,
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Text(
                                                                                    ' commented',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Lato',
                                                                                          color: Colors.white,
                                                                                          fontSize: 12.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        Container(
                                                                          height:
                                                                              25.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFF00C661),
                                                                            borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                            shape:
                                                                                BoxShape.rectangle,
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                6.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Text(
                                                                                  'Done',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Lato',
                                                                                        color: Colors.white,
                                                                                        fontSize: 12.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 8.0)),
                                                                    );
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.navBarModel,
                    updateCallback: () => setState(() {}),
                    child: NavBarWidget(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
