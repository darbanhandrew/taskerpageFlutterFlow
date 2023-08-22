import '/backend/api_requests/api_calls.dart';
import '/components/header_widget.dart';
import '/components/navigate_back_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'on_site_appointment_deatels_model.dart';
export 'on_site_appointment_deatels_model.dart';

class OnSiteAppointmentDeatelsWidget extends StatefulWidget {
  const OnSiteAppointmentDeatelsWidget({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int? id;

  @override
  _OnSiteAppointmentDeatelsWidgetState createState() =>
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

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {});
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
        id: widget.id,
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
        final onSiteAppointmentDeatelsAppointmentReadResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
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
                              text: 'Appointment Details',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if ((functions.jsonToString(getJsonField(
                            onSiteAppointmentDeatelsAppointmentReadResponse
                                .jsonBody,
                            r'''$.is_interviewee_accepted''',
                          )) ==
                          'true') &&
                      (functions.jsonToString(getJsonField(
                            onSiteAppointmentDeatelsAppointmentReadResponse
                                .jsonBody,
                            r'''$.is_interviewer_accepted''',
                          )) ==
                          'true'))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 28.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BarcodeWidget(
                            data: 'Barcode',
                            barcode: Barcode.qrCode(),
                            width: 192.0,
                            height: 192.0,
                            color: FlutterFlowTheme.of(context).primaryText,
                            backgroundColor: Colors.transparent,
                            errorBuilder: (_context, _error) => SizedBox(
                              width: 192.0,
                              height: 192.0,
                            ),
                            drawText: false,
                          ),
                        ],
                      ),
                    ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(32.0, 28.0, 32.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
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
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (getJsonField(
                                                onSiteAppointmentDeatelsAppointmentReadResponse
                                                    .jsonBody,
                                                r'''$.interviewee.id''',
                                              ) ==
                                              getJsonField(
                                                FFAppState().userProfile,
                                                r'''$.id''',
                                              )) {
                                            context.pushNamed(
                                              'Tasker_Profile_view',
                                              queryParameters: {
                                                'id': serializeParam(
                                                  getJsonField(
                                                    onSiteAppointmentDeatelsAppointmentReadResponse
                                                        .jsonBody,
                                                    r'''$.interviewer.id''',
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
                                                    onSiteAppointmentDeatelsAppointmentReadResponse
                                                        .jsonBody,
                                                    r'''$.interviewee.id''',
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
                                            getJsonField(
                                                      onSiteAppointmentDeatelsAppointmentReadResponse
                                                          .jsonBody,
                                                      r'''$.interviewee.id''',
                                                    ) ==
                                                    getJsonField(
                                                      FFAppState().userProfile,
                                                      r'''$.id''',
                                                    )
                                                ? getJsonField(
                                                    onSiteAppointmentDeatelsAppointmentReadResponse
                                                        .jsonBody,
                                                    r'''$.interviewer.avatar''',
                                                  )
                                                : getJsonField(
                                                    onSiteAppointmentDeatelsAppointmentReadResponse
                                                        .jsonBody,
                                                    r'''$.interviewee.avatar''',
                                                  ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
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
                                                    if (getJsonField(
                                                          onSiteAppointmentDeatelsAppointmentReadResponse
                                                              .jsonBody,
                                                          r'''$.interviewee.id''',
                                                        ) ==
                                                        getJsonField(
                                                          FFAppState()
                                                              .userProfile,
                                                          r'''$.id''',
                                                        )) {
                                                      context.pushNamed(
                                                        'Tasker_Profile_view',
                                                        queryParameters: {
                                                          'id': serializeParam(
                                                            getJsonField(
                                                              onSiteAppointmentDeatelsAppointmentReadResponse
                                                                  .jsonBody,
                                                              r'''$.interviewer.id''',
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
                                                              onSiteAppointmentDeatelsAppointmentReadResponse
                                                                  .jsonBody,
                                                              r'''$.interviewee.id''',
                                                            ),
                                                            ParamType.int,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    }
                                                  },
                                                  child: Text(
                                                    getJsonField(
                                                              onSiteAppointmentDeatelsAppointmentReadResponse
                                                                  .jsonBody,
                                                              r'''$.interviewee.id''',
                                                            ) ==
                                                            getJsonField(
                                                              FFAppState()
                                                                  .userProfile,
                                                              r'''$.id''',
                                                            )
                                                        ? '${getJsonField(
                                                            onSiteAppointmentDeatelsAppointmentReadResponse
                                                                .jsonBody,
                                                            r'''$.interviewer.first_name''',
                                                          ).toString()} ${getJsonField(
                                                            onSiteAppointmentDeatelsAppointmentReadResponse
                                                                .jsonBody,
                                                            r'''$.interviewer.last_name''',
                                                          ).toString()}'
                                                        : '${getJsonField(
                                                            onSiteAppointmentDeatelsAppointmentReadResponse
                                                                .jsonBody,
                                                            r'''$.interviewee.first_name''',
                                                          ).toString()} ${getJsonField(
                                                            onSiteAppointmentDeatelsAppointmentReadResponse
                                                                .jsonBody,
                                                            r'''$.interviewee.last_name''',
                                                          ).toString()}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          color: Colors.black,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 6.0, 0.0, 6.0),
                                              child: Text(
                                                'On-Site',
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  getJsonField(
                                                    onSiteAppointmentDeatelsAppointmentReadResponse
                                                        .jsonBody,
                                                    r'''$.appointment_time''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color: Colors.black,
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          15.0, 0.0, 0.0, 0.0),
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
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(32.0, 24.0, 32.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Stack(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              children: [
                                Container(
                                  height: 200.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF6F6F6),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        17.0, 17.0, 17.0, 17.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: FlutterFlowGoogleMap(
                                            controller:
                                                _model.googleMapsController,
                                            onCameraIdle: (latLng) => _model
                                                .googleMapsCenter = latLng,
                                            initialLocation: _model
                                                    .googleMapsCenter ??=
                                                LatLng(13.106061, -59.613158),
                                            markerColor:
                                                GoogleMarkerColor.violet,
                                            mapType: MapType.normal,
                                            style: GoogleMapStyle.standard,
                                            initialZoom: 14.0,
                                            allowInteraction: true,
                                            allowZoom: false,
                                            showZoomControls: false,
                                            showLocation: true,
                                            showCompass: false,
                                            showMapToolbar: false,
                                            showTraffic: true,
                                            centerMapOnMarkerTap: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                if ((functions.jsonToString(getJsonField(
                                          onSiteAppointmentDeatelsAppointmentReadResponse
                                              .jsonBody,
                                          r'''$.is_interviewee_accepted''',
                                        )) ==
                                        'true') &&
                                    (functions.jsonToString(getJsonField(
                                          onSiteAppointmentDeatelsAppointmentReadResponse
                                              .jsonBody,
                                          r'''$.is_interviewer_accepted''',
                                        )) ==
                                        'true'))
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
                                              sigmaY: 2.0,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 15.0, 0.0, 15.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                if ((functions.jsonToString(getJsonField(
                                          onSiteAppointmentDeatelsAppointmentReadResponse
                                              .jsonBody,
                                          r'''$.is_interviewee_accepted''',
                                        )) ==
                                        'true') &&
                                    (functions.jsonToString(getJsonField(
                                          onSiteAppointmentDeatelsAppointmentReadResponse
                                              .jsonBody,
                                          r'''$.is_interviewer_accepted''',
                                        )) ==
                                        'true'))
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
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 80.0, 0.0, 80.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [],
                                              ),
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
              ),
            ),
          ),
        );
      },
    );
  }
}
