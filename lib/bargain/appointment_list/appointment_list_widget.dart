import '/backend/api_requests/api_calls.dart';
import '/components/aler_modal_massage_accept_appointment_widget.dart';
import '/components/aler_modal_massage_reject_appointment_widget.dart';
import '/components/appointment_card_widget.dart';
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
import 'package:flutter/services.dart';
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
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

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
                            labelColor: FlutterFlowTheme.of(context).primary,
                            unselectedLabelColor:
                                FlutterFlowTheme.of(context).secondary,
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
                            indicatorColor:
                                FlutterFlowTheme.of(context).primary,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
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
                                                    SizedBox(height: 16.0),
                                                itemBuilder: (context,
                                                    invationAppointmentIndex) {
                                                  final invationAppointmentItem =
                                                      invationAppointment[
                                                          invationAppointmentIndex];
                                                  return AppointmentCardWidget(
                                                    key: Key(
                                                        'Keyppv_${invationAppointmentIndex}_of_${invationAppointment.length}'),
                                                    json: getJsonField(
                                                      invationAppointmentItem,
                                                      r'''$.data''',
                                                    ),
                                                    accepted: true,
                                                    state: 'invation',
                                                    accept: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  AlerModalMassageAcceptAppointmentWidget(
                                                                id: getJsonField(
                                                                  invationAppointmentItem,
                                                                  r'''$.name''',
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                    reject: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  AlerModalMassageRejectAppointmentWidget(
                                                                id: getJsonField(
                                                                  invationAppointmentItem,
                                                                  r'''$.name''',
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                    view: () async {
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
                                                              ParamType.String,
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
                                                          context.pushNamed(
                                                            'On_site_AppointmentDeatels',
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
                                                        }
                                                      }
                                                    },
                                                    edit: () async {},
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
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
                                                      SizedBox(height: 8.0),
                                                  itemBuilder: (context,
                                                      pendingAppointmentIndex) {
                                                    final pendingAppointmentItem =
                                                        pendingAppointment[
                                                            pendingAppointmentIndex];
                                                    return AppointmentCardWidget(
                                                      key: Key(
                                                          'Keypcy_${pendingAppointmentIndex}_of_${pendingAppointment.length}'),
                                                      json: getJsonField(
                                                        pendingAppointmentItem,
                                                        r'''$.data''',
                                                      ),
                                                      accepted: false,
                                                      state: 'pending',
                                                      accept: () async {},
                                                      reject: () async {},
                                                      view: () async {
                                                        if (functions
                                                                .jsonToString(
                                                                    getJsonField(
                                                              pendingAppointmentItem,
                                                              r'''$.appointment_type''',
                                                            )) ==
                                                            'Online') {
                                                          context.pushNamed(
                                                            'Online_AppointmentDeatels',
                                                            queryParameters: {
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
                                                            context.pushNamed(
                                                              'By_Phone_AppointmentDeatels',
                                                              queryParameters: {
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
                                                            context.pushNamed(
                                                              'On_site_AppointmentDeatels',
                                                              queryParameters: {
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
                                                      edit: () async {},
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
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
                                                    SizedBox(height: 8.0),
                                                itemBuilder: (context,
                                                    acceptedAppointmentIndex) {
                                                  final acceptedAppointmentItem =
                                                      acceptedAppointment[
                                                          acceptedAppointmentIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 5.0,
                                                                5.0, 0.0),
                                                    child: FutureBuilder<
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
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
                                                                  acceptedAppointmentItem,
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
                                                                context
                                                                    .pushNamed(
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
                                                                context
                                                                    .pushNamed(
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
                                                            height: 227.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      4.0,
                                                                  color: Color(
                                                                      0x33000000),
                                                                  offset:
                                                                      Offset(
                                                                          0.0,
                                                                          0.0),
                                                                  spreadRadius:
                                                                      2.0,
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          1.0),
                                                            ),
                                                            child: Visibility(
                                                              visible: false,
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
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
                                                                                mainAxisSize: MainAxisSize.max,
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
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Icon(
                                                                            Icons.done_rounded,
                                                                            color:
                                                                                Colors.white,
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
                                                          ),
                                                        );
                                                      },
                                                    ),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
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
                                                    SizedBox(height: 8.0),
                                                itemBuilder: (context,
                                                    rejectedAppointmentIndex) {
                                                  final rejectedAppointmentItem =
                                                      rejectedAppointment[
                                                          rejectedAppointmentIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 5.0,
                                                                5.0, 0.0),
                                                    child: FutureBuilder<
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
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
                                                                  rejectedAppointmentItem,
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
                                                                context
                                                                    .pushNamed(
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
                                                                context
                                                                    .pushNamed(
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
                                                              color:
                                                                  Colors.white,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      4.0,
                                                                  color: Color(
                                                                      0x33000000),
                                                                  offset:
                                                                      Offset(
                                                                          0.0,
                                                                          0.0),
                                                                  spreadRadius:
                                                                      2.0,
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          1.0),
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
                                                                              mainAxisSize: MainAxisSize.max,
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .close_rounded,
                                                                          color:
                                                                              Colors.white,
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
                                                    ),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
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
                                                    SizedBox(height: 8.0),
                                                itemBuilder: (context,
                                                    acceptedAppointmentIndex) {
                                                  final acceptedAppointmentItem =
                                                      acceptedAppointment[
                                                          acceptedAppointmentIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 5.0,
                                                                5.0, 0.0),
                                                    child: FutureBuilder<
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
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
                                                                enableDrag:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return GestureDetector(
                                                                    onTap: () => _model
                                                                            .unfocusNode
                                                                            .canRequestFocus
                                                                        ? FocusScope.of(context).requestFocus(_model
                                                                            .unfocusNode)
                                                                        : FocusScope.of(context)
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
                                                                              _model.apiRequestCompleter = null);
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
                                                                context:
                                                                    context,
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
                                                              color:
                                                                  Colors.white,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      4.0,
                                                                  color: Color(
                                                                      0x33000000),
                                                                  offset:
                                                                      Offset(
                                                                          0.0,
                                                                          0.0),
                                                                  spreadRadius:
                                                                      2.0,
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          1.0),
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
                                                                              mainAxisSize: MainAxisSize.max,
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
                                                                    builder:
                                                                        (context,
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
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 50.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      final commentedReviewReadByIdResponse =
                                                                          snapshot
                                                                              .data!;
                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.end,
                                                                        children:
                                                                            [
                                                                          if (getJsonField(
                                                                                commentedReviewReadByIdResponse.jsonBody,
                                                                                r'''$.data''',
                                                                              ) !=
                                                                              null)
                                                                            Container(
                                                                              height: 25.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                borderRadius: BorderRadius.circular(2.0),
                                                                                shape: BoxShape.rectangle,
                                                                              ),
                                                                              child: Padding(
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
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              borderRadius: BorderRadius.circular(2.0),
                                                                              shape: BoxShape.rectangle,
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                                                                              child: Row(
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
                                                                        ].divide(SizedBox(height: 8.0)),
                                                                      );
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
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
