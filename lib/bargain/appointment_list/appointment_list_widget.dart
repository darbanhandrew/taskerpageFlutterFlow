import '/backend/api_requests/api_calls.dart';
import '/components/aler_modal_massage_accept_appointment_widget.dart';
import '/components/aler_modal_massage_reject_appointment_widget.dart';
import '/components/header_widget.dart';
import '/components/nav_bar_widget.dart';
import '/components/navigate_back_widget.dart';
import '/components/set_appointment_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
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
      length: 4,
      initialIndex: 0,
    );
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
      future: TaskerpageBackendGroup.userProfileMeCall.call(
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
        final appointmentListUserProfileMeResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.headerModel,
                    updateCallback: () => setState(() {}),
                    child: HeaderWidget(
                      openDrawer: () async {},
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
                              text: 'Appointments',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 0.0, 32.0, 0.0),
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
                                      fontSize: 14.0,
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
                                ],
                                controller: _model.tabBarController,
                                onTap: (value) => setState(() {}),
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 24.0, 0.0, 24.0),
                                          child: FutureBuilder<ApiCallResponse>(
                                            future: TaskerpageBackendGroup
                                                .myAppointmentCall
                                                .call(
                                              apiGlobalKey: FFAppState().apiKey,
                                              isInterviewerAccepted:
                                                  !(FFAppState()
                                                              .UserInformation
                                                              .role ==
                                                          'POSTER'
                                                      ? true
                                                      : false),
                                              isIntervieweeAccepted:
                                                  FFAppState()
                                                              .UserInformation
                                                              .role ==
                                                          'POSTER'
                                                      ? true
                                                      : false,
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
                                              final listViewMyAppointmentResponse =
                                                  snapshot.data!;
                                              return Builder(
                                                builder: (context) {
                                                  final invationAppointment =
                                                      getJsonField(
                                                    listViewMyAppointmentResponse
                                                        .jsonBody,
                                                    r'''$''',
                                                  ).toList();
                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        invationAppointment
                                                            .length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 20.0),
                                                    itemBuilder: (context,
                                                        invationAppointmentIndex) {
                                                      final invationAppointmentItem =
                                                          invationAppointment[
                                                              invationAppointmentIndex];
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
                                                              'ONLINE ') {
                                                            context.pushNamed(
                                                              'Online_AppointmentDeatels',
                                                              queryParameters: {
                                                                'id':
                                                                    serializeParam(
                                                                  getJsonField(
                                                                    invationAppointmentItem,
                                                                    r'''$.id''',
                                                                  ),
                                                                  ParamType.int,
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
                                                                'BYPHONE') {
                                                              context.pushNamed(
                                                                'By_Phone_AppointmentDeatels',
                                                                queryParameters:
                                                                    {
                                                                  'id':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      invationAppointmentItem,
                                                                      r'''$.id''',
                                                                    ),
                                                                    ParamType
                                                                        .int,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            } else {
                                                              context.pushNamed(
                                                                'On_site_AppointmentDeatels',
                                                                queryParameters:
                                                                    {
                                                                  'id':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      invationAppointmentItem,
                                                                      r'''$.id''',
                                                                    ),
                                                                    ParamType
                                                                        .int,
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
                                                                            getJsonField(
                                                                              invationAppointmentItem,
                                                                              r'''$.interviewer.avatar''',
                                                                            ),
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
                                                                                        invationAppointmentItem,
                                                                                        r'''$.interviewer.first_name''',
                                                                                      ).toString()} ${getJsonField(
                                                                                        invationAppointmentItem,
                                                                                        r'''$.interviewer.last_name''',
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
                                                                            onTap: () =>
                                                                                FocusScope.of(context).requestFocus(_model.unfocusNode),
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: AlerModalMassageRejectAppointmentWidget(
                                                                                id: getJsonField(
                                                                                  invationAppointmentItem,
                                                                                  r'''$.id''',
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
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
                                                                            onTap: () =>
                                                                                FocusScope.of(context).requestFocus(_model.unfocusNode),
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: AlerModalMassageAcceptAppointmentWidget(
                                                                                id: getJsonField(
                                                                                  invationAppointmentItem,
                                                                                  r'''$.id''',
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
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
                                                                            onTap: () =>
                                                                                FocusScope.of(context).requestFocus(_model.unfocusNode),
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: SetAppointmentWidget(
                                                                                setOredit: true,
                                                                                id: getJsonField(
                                                                                  invationAppointmentItem,
                                                                                  r'''$.id''',
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
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
                                                                            0xFFEF0EB0),
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 24.0, 0.0, 24.0),
                                            child:
                                                FutureBuilder<ApiCallResponse>(
                                              future: TaskerpageBackendGroup
                                                  .myAppointmentCall
                                                  .call(
                                                apiGlobalKey:
                                                    FFAppState().apiKey,
                                                isInterviewerAccepted:
                                                    FFAppState()
                                                                .UserInformation
                                                                .role ==
                                                            'POSTER'
                                                        ? true
                                                        : false,
                                                isIntervieweeAccepted:
                                                    !(FFAppState()
                                                                .UserInformation
                                                                .role ==
                                                            'POSTER'
                                                        ? true
                                                        : false),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child: SpinKitThreeBounce(
                                                        color:
                                                            Color(0xFF5450E2),
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final listViewMyAppointmentResponse =
                                                    snapshot.data!;
                                                return Builder(
                                                  builder: (context) {
                                                    final pendingAppointment =
                                                        getJsonField(
                                                      listViewMyAppointmentResponse
                                                          .jsonBody,
                                                      r'''$''',
                                                    ).toList();
                                                    return ListView.separated(
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          pendingAppointment
                                                              .length,
                                                      separatorBuilder:
                                                          (_, __) => SizedBox(
                                                              height: 20.0),
                                                      itemBuilder: (context,
                                                          pendingAppointmentIndex) {
                                                        final pendingAppointmentItem =
                                                            pendingAppointment[
                                                                pendingAppointmentIndex];
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
                                                                'ONLINE ') {
                                                              context.pushNamed(
                                                                'Online_AppointmentDeatels',
                                                                queryParameters:
                                                                    {
                                                                  'id':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      pendingAppointmentItem,
                                                                      r'''$.id''',
                                                                    ),
                                                                    ParamType
                                                                        .int,
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
                                                                  'BYPHONE') {
                                                                context
                                                                    .pushNamed(
                                                                  'By_Phone_AppointmentDeatels',
                                                                  queryParameters:
                                                                      {
                                                                    'id':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        pendingAppointmentItem,
                                                                        r'''$.id''',
                                                                      ),
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              } else {
                                                                context
                                                                    .pushNamed(
                                                                  'On_site_AppointmentDeatels',
                                                                  queryParameters:
                                                                      {
                                                                    'id':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        pendingAppointmentItem,
                                                                        r'''$.id''',
                                                                      ),
                                                                      ParamType
                                                                          .int,
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
                                                                          getJsonField(
                                                                            pendingAppointmentItem,
                                                                            r'''$.interviewee.avatar''',
                                                                          ),
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
                                                                                      pendingAppointmentItem,
                                                                                      r'''$.interviewee.first_name''',
                                                                                    ).toString()} ${getJsonField(
                                                                                      pendingAppointmentItem,
                                                                                      r'''$.interviewee.last_name''',
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 24.0, 0.0, 0.0),
                                          child: FutureBuilder<ApiCallResponse>(
                                            future: TaskerpageBackendGroup
                                                .myAppointmentCall
                                                .call(
                                              apiGlobalKey: FFAppState().apiKey,
                                              isIntervieweeAccepted: true,
                                              isInterviewerAccepted: true,
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
                                              final listViewMyAppointmentResponse =
                                                  snapshot.data!;
                                              return Builder(
                                                builder: (context) {
                                                  final acceptedAppointment =
                                                      getJsonField(
                                                    listViewMyAppointmentResponse
                                                        .jsonBody,
                                                    r'''$''',
                                                  ).toList();
                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        acceptedAppointment
                                                            .length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 20.0),
                                                    itemBuilder: (context,
                                                        acceptedAppointmentIndex) {
                                                      final acceptedAppointmentItem =
                                                          acceptedAppointment[
                                                              acceptedAppointmentIndex];
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
                                                              'ONLINE ') {
                                                            context.pushNamed(
                                                              'Online_AppointmentDeatels',
                                                              queryParameters: {
                                                                'id':
                                                                    serializeParam(
                                                                  getJsonField(
                                                                    acceptedAppointmentItem,
                                                                    r'''$.id''',
                                                                  ),
                                                                  ParamType.int,
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
                                                                'BYPHONE') {
                                                              context.pushNamed(
                                                                'By_Phone_AppointmentDeatels',
                                                                queryParameters:
                                                                    {
                                                                  'id':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      acceptedAppointmentItem,
                                                                      r'''$.id''',
                                                                    ),
                                                                    ParamType
                                                                        .int,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            } else {
                                                              context.pushNamed(
                                                                'On_site_AppointmentDeatels',
                                                                queryParameters:
                                                                    {
                                                                  'id':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      acceptedAppointmentItem,
                                                                      r'''$.id''',
                                                                    ),
                                                                    ParamType
                                                                        .int,
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
                                                                        getJsonField(
                                                                                  acceptedAppointmentItem,
                                                                                  r'''$.interviewee.id''',
                                                                                ) ==
                                                                                getJsonField(
                                                                                  FFAppState().userProfile,
                                                                                  r'''$.id''',
                                                                                )
                                                                            ? getJsonField(
                                                                                acceptedAppointmentItem,
                                                                                r'''$.interviewer.avatar''',
                                                                              )
                                                                            : getJsonField(
                                                                                acceptedAppointmentItem,
                                                                                r'''$.interviewee.avatar''',
                                                                              ),
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
                                                                                  getJsonField(
                                                                                            acceptedAppointmentItem,
                                                                                            r'''$.interviewee.id''',
                                                                                          ) ==
                                                                                          getJsonField(
                                                                                            FFAppState().userProfile,
                                                                                            r'''$.id''',
                                                                                          )
                                                                                      ? '${valueOrDefault<String>(
                                                                                          acceptedAppointmentItem.toString(),
                                                                                          '\$.interviewer.first_name',
                                                                                        )} ${getJsonField(
                                                                                          acceptedAppointmentItem,
                                                                                          r'''$.interviewer.last_name''',
                                                                                        ).toString()}'
                                                                                      : '${getJsonField(
                                                                                          acceptedAppointmentItem,
                                                                                          r'''$.interviewee.first_name''',
                                                                                        ).toString()} ${getJsonField(
                                                                                          acceptedAppointmentItem,
                                                                                          r'''$.interviewee.last_name''',
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 24.0, 0.0, 0.0),
                                          child: FutureBuilder<ApiCallResponse>(
                                            future: TaskerpageBackendGroup
                                                .myAppointmentCall
                                                .call(
                                              apiGlobalKey: FFAppState().apiKey,
                                              isIntervieweeAccepted: false,
                                              isInterviewerAccepted: false,
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
                                              final listViewMyAppointmentResponse =
                                                  snapshot.data!;
                                              return Builder(
                                                builder: (context) {
                                                  final rejectedAppointment =
                                                      getJsonField(
                                                    listViewMyAppointmentResponse
                                                        .jsonBody,
                                                    r'''$''',
                                                  ).toList();
                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        rejectedAppointment
                                                            .length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 20.0),
                                                    itemBuilder: (context,
                                                        rejectedAppointmentIndex) {
                                                      final rejectedAppointmentItem =
                                                          rejectedAppointment[
                                                              rejectedAppointmentIndex];
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
                                                              'ONLINE ') {
                                                            context.pushNamed(
                                                              'Online_AppointmentDeatels',
                                                              queryParameters: {
                                                                'id':
                                                                    serializeParam(
                                                                  getJsonField(
                                                                    rejectedAppointmentItem,
                                                                    r'''$.id''',
                                                                  ),
                                                                  ParamType.int,
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
                                                                'BYPHONE') {
                                                              context.pushNamed(
                                                                'By_Phone_AppointmentDeatels',
                                                                queryParameters:
                                                                    {
                                                                  'id':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      rejectedAppointmentItem,
                                                                      r'''$.id''',
                                                                    ),
                                                                    ParamType
                                                                        .int,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            } else {
                                                              context.pushNamed(
                                                                'On_site_AppointmentDeatels',
                                                                queryParameters:
                                                                    {
                                                                  'id':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      rejectedAppointmentItem,
                                                                      r'''$.id''',
                                                                    ),
                                                                    ParamType
                                                                        .int,
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
                                                                        getJsonField(
                                                                                  rejectedAppointmentItem,
                                                                                  r'''$.interviewee.id''',
                                                                                ) ==
                                                                                getJsonField(
                                                                                  FFAppState().userProfile,
                                                                                  r'''$.id''',
                                                                                )
                                                                            ? getJsonField(
                                                                                rejectedAppointmentItem,
                                                                                r'''$.interviewer.avatar''',
                                                                              )
                                                                            : getJsonField(
                                                                                rejectedAppointmentItem,
                                                                                r'''$.interviewee.avatar''',
                                                                              ),
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
                                                                                  getJsonField(
                                                                                            rejectedAppointmentItem,
                                                                                            r'''$.interviewee.id''',
                                                                                          ) ==
                                                                                          getJsonField(
                                                                                            FFAppState().userProfile,
                                                                                            r'''$.id''',
                                                                                          )
                                                                                      ? '${getJsonField(
                                                                                          rejectedAppointmentItem,
                                                                                          r'''$.interviewer.first_name''',
                                                                                        ).toString()} ${getJsonField(
                                                                                          rejectedAppointmentItem,
                                                                                          r'''$.interviewer.last_name''',
                                                                                        ).toString()}'
                                                                                      : '${getJsonField(
                                                                                          rejectedAppointmentItem,
                                                                                          r'''$.interviewee.first_name''',
                                                                                        ).toString()} ${getJsonField(
                                                                                          rejectedAppointmentItem,
                                                                                          r'''$.interviewee.last_name''',
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
      },
    );
  }
}
