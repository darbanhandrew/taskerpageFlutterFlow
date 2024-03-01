import '/backend/api_requests/api_calls.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:styled_divider/styled_divider.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'on_site_appointment_deatels_model.dart';
export 'on_site_appointment_deatels_model.dart';

class OnSiteAppointmentDeatelsWidget extends StatefulWidget {
  const OnSiteAppointmentDeatelsWidget({
    super.key,
    required this.appointmentId,
  });

  final String? appointmentId;

  @override
  State<OnSiteAppointmentDeatelsWidget> createState() =>
      _OnSiteAppointmentDeatelsWidgetState();
}

class _OnSiteAppointmentDeatelsWidgetState
    extends State<OnSiteAppointmentDeatelsWidget> {
  late OnSiteAppointmentDeatelsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnSiteAppointmentDeatelsModel());

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
            backgroundColor: Color(0xFFF2F2F2),
            body: Center(
              child: SizedBox(
                width: 35.0,
                height: 35.0,
                child: SpinKitThreeBounce(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 35.0,
                ),
              ),
            ),
          );
        }
        final onSiteAppointmentDeatelsAppointmentReadResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
            backgroundColor: Color(0xFFF2F2F2),
            endDrawer: Container(
              width: double.infinity,
              child: Drawer(
                elevation: 16.0,
                child: WebViewAware(
                  child: wrapWithModel(
                    model: _model.mainDrawerModel,
                    updateCallback: () => setState(() {}),
                    child: MainDrawerWidget(),
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
                        scaffoldKey.currentState!.openEndDrawer();
                      },
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder<ApiCallResponse>(
                      future: TaskerpageBackendGroup.customerProfileDetailsCall
                          .call(
                        name: functions.jsonToString(getJsonField(
                                  FFAppState().userProfile,
                                  r'''$.data.role_profile_name''',
                                )) ==
                                'Tasker'
                            ? functions.jsonToString(getJsonField(
                                onSiteAppointmentDeatelsAppointmentReadResponse
                                    .jsonBody,
                                r'''$.data.poster''',
                              ))
                            : functions.jsonToString(getJsonField(
                                onSiteAppointmentDeatelsAppointmentReadResponse
                                    .jsonBody,
                                r'''$.data.tasker''',
                              )),
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
                        final columnCustomerProfileDetailsResponse =
                            snapshot.data!;
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 4.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 100.0,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      27.0, 0.0, 32.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
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
                                                      context.safePop();
                                                    },
                                                    child: Icon(
                                                      Icons.keyboard_arrow_left,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 0.0,
                                                                0.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.safePop();
                                                      },
                                                      child: Text(
                                                        'Back to calender',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Lato',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Divider(
                                                height: 0.0,
                                                thickness: 1.0,
                                                color: Color(0xFFD2D2D2),
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
                            if ((functions.jsonToString(getJsonField(
                                      onSiteAppointmentDeatelsAppointmentReadResponse
                                          .jsonBody,
                                      r'''$.data.is_tasker_accepted''',
                                    )) ==
                                    '1') &&
                                (functions.jsonToString(getJsonField(
                                      onSiteAppointmentDeatelsAppointmentReadResponse
                                          .jsonBody,
                                      r'''$.data.is_poster_accepted''',
                                    )) ==
                                    '1') &&
                                (functions.jsonToString(getJsonField(
                                      FFAppState().userProfile,
                                      r'''$.data.role''',
                                    )) ==
                                    'Tasker'))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    32.0, 8.0, 32.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(1.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  17.0, 0.0, 17.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 20.0, 0.0, 20.0),
                                                child: BarcodeWidget(
                                                  data:
                                                      '${FFAppState().appUrl}/scanedQRCODE?appointmentID=${widget.appointmentId}',
                                                  barcode: Barcode.qrCode(),
                                                  width: 90.0,
                                                  height: 90.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  errorBuilder:
                                                      (_context, _error) =>
                                                          SizedBox(
                                                    width: 90.0,
                                                    height: 90.0,
                                                  ),
                                                  drawText: false,
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.appointmentUrl =
                                                      await FlutterBarcodeScanner
                                                          .scanBarcode(
                                                    '#C62828', // scanning line color
                                                    'Cancel', // cancel button text
                                                    true, // whether to show the flash icon
                                                    ScanMode.QR,
                                                  );

                                                  context.pushNamed(
                                                    'scaned_QRCODE',
                                                    queryParameters: {
                                                      'appointmentID':
                                                          serializeParam(
                                                        0,
                                                        ParamType.int,
                                                      ),
                                                    }.withoutNulls,
                                                  );

                                                  setState(() {});
                                                },
                                                child: Container(
                                                  width: 180.0,
                                                  height: 36.0,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Scan QR CODE',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Lato',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  32.0, 8.0, 32.0, 0.0),
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
                                              columnCustomerProfileDetailsResponse
                                                  .jsonBody,
                                              r'''$.data.role''',
                                            )) ==
                                            'Tasker') {
                                          context.pushNamed(
                                            'User_profile',
                                            queryParameters: {
                                              'id': serializeParam(
                                                getJsonField(
                                                  columnCustomerProfileDetailsResponse
                                                      .jsonBody,
                                                  r'''$.data.name''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        } else {
                                          context.pushNamed(
                                            'User_profile',
                                            queryParameters: {
                                              'id': serializeParam(
                                                getJsonField(
                                                  columnCustomerProfileDetailsResponse
                                                      .jsonBody,
                                                  r'''$.data.name''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        }
                                      },
                                      child: Container(
                                        width: 100.0,
                                        height: 105.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(1.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 16.0, 13.0, 20.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 60.0,
                                                    height: 60.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      '${FFAppState().baseUrl}${getJsonField(
                                                        columnCustomerProfileDetailsResponse
                                                            .jsonBody,
                                                        r'''$.data.avatar''',
                                                      ).toString()}',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              '${getJsonField(
                                                                columnCustomerProfileDetailsResponse
                                                                    .jsonBody,
                                                                r'''$.data.first_name''',
                                                              ).toString()} ${getJsonField(
                                                                columnCustomerProfileDetailsResponse
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
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      6.0,
                                                                      0.0,
                                                                      6.0),
                                                          child: Text(
                                                            'On-Site',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Lato',
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              getJsonField(
                                                                onSiteAppointmentDeatelsAppointmentReadResponse
                                                                    .jsonBody,
                                                                r'''$.data.appointment_time''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lato',
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        12.0,
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
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
                                  32.0, 8.0, 32.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 300.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x33000000),
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(1.0),
                                        border: Border.all(
                                          color: FFAppState().CopyText == true
                                              ? Color(0xFF00C853)
                                              : Color(0x00000000),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      17.0, 0.0, 17.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 80.0,
                                                        height: 30.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x00FFFFFF),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      2.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'start time',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lato',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          dateTimeFormat(
                                                              'jm',
                                                              functions
                                                                  .jsonToDateTime(
                                                                      getJsonField(
                                                                onSiteAppointmentDeatelsAppointmentReadResponse
                                                                    .jsonBody,
                                                                r'''$.data.appointment_start_time''',
                                                              ).toString())),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lato',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 12.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  5.0,
                                                                  15.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          StyledDivider(
                                                            thickness: 1.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            lineStyle:
                                                                DividerLineStyle
                                                                    .dashed,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 80.0,
                                                        height: 30.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x00FFFFFF),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      2.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'end time',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lato',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          dateTimeFormat(
                                                              'jm',
                                                              functions
                                                                  .jsonToDateTime(
                                                                      getJsonField(
                                                                onSiteAppointmentDeatelsAppointmentReadResponse
                                                                    .jsonBody,
                                                                r'''$.data.appointment_end_time''',
                                                              ).toString())),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lato',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 12.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              height: 35.0,
                                              thickness: 1.0,
                                              indent: 17.0,
                                              endIndent: 17.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        17.0, 0.0, 17.0, 16.0),
                                                child:
                                                    Builder(builder: (context) {
                                                  final _googleMapMarker =
                                                      functions.fulllatLong(
                                                          getJsonField(
                                                            onSiteAppointmentDeatelsAppointmentReadResponse
                                                                .jsonBody,
                                                            r'''$.data.appointment_location_lat''',
                                                          ).toString(),
                                                          getJsonField(
                                                            onSiteAppointmentDeatelsAppointmentReadResponse
                                                                .jsonBody,
                                                            r'''$.data.appointment_location_lng''',
                                                          ).toString());
                                                  return FlutterFlowGoogleMap(
                                                    controller: _model
                                                        .googleMapsController,
                                                    onCameraIdle: (latLng) =>
                                                        _model.googleMapsCenter =
                                                            latLng,
                                                    initialLocation: _model
                                                            .googleMapsCenter ??=
                                                        functions.fulllatLong(
                                                            getJsonField(
                                                              onSiteAppointmentDeatelsAppointmentReadResponse
                                                                  .jsonBody,
                                                              r'''$.data.appointment_location_lat''',
                                                            ).toString(),
                                                            getJsonField(
                                                              onSiteAppointmentDeatelsAppointmentReadResponse
                                                                  .jsonBody,
                                                              r'''$.data.appointment_location_lng''',
                                                            ).toString()),
                                                    markers: [
                                                      FlutterFlowMarker(
                                                        _googleMapMarker
                                                            .serialize(),
                                                        _googleMapMarker,
                                                      ),
                                                    ],
                                                    markerColor:
                                                        GoogleMarkerColor
                                                            .violet,
                                                    mapType: MapType.normal,
                                                    style:
                                                        GoogleMapStyle.standard,
                                                    initialZoom: 15.0,
                                                    allowInteraction: true,
                                                    allowZoom: false,
                                                    showZoomControls: false,
                                                    showLocation: true,
                                                    showCompass: false,
                                                    showMapToolbar: false,
                                                    showTraffic: true,
                                                    centerMapOnMarkerTap: true,
                                                  );
                                                }),
                                              ),
                                            ),
                                          ],
                                        ),
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
