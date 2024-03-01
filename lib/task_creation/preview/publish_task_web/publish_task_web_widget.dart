import '/backend/api_requests/api_calls.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/navigation_bar_widget.dart';
import '/components/termof_service_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'publish_task_web_model.dart';
export 'publish_task_web_model.dart';

class PublishTaskWebWidget extends StatefulWidget {
  const PublishTaskWebWidget({
    super.key,
    required this.id,
  });

  final String? id;

  @override
  State<PublishTaskWebWidget> createState() => _PublishTaskWebWidgetState();
}

class _PublishTaskWebWidgetState extends State<PublishTaskWebWidget> {
  late PublishTaskWebModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PublishTaskWebModel());

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
      future: TaskerpageBackendGroup.postReadCall.call(
        id: widget.id,
        apiGlobalKey: FFAppState().apiKey,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFFF6F6F6),
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
        final publishTaskWebPostReadResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
            backgroundColor: Color(0xFFF6F6F6),
            drawer: Container(
              width: MediaQuery.sizeOf(context).width * 0.6,
              child: Drawer(
                elevation: 16.0,
                child: WebViewAware(
                  child: wrapWithModel(
                    model: _model.navigationBarModel,
                    updateCallback: () => setState(() {}),
                    child: NavigationBarWidget(
                      currentPage: 'task',
                      postId: widget.id,
                      closeDrawer: () async {
                        if (scaffoldKey.currentState!.isDrawerOpen ||
                            scaffoldKey.currentState!.isEndDrawerOpen) {
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
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
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    valueOrDefault<double>(
                      () {
                        if (MediaQuery.sizeOf(context).width <
                            kBreakpointSmall) {
                          return 0.0;
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointMedium) {
                          return 0.0;
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointLarge) {
                          return FFAppConstants.veryLargCardLR.toDouble();
                        } else {
                          return FFAppConstants.veryLargCardLR.toDouble();
                        }
                      }(),
                      0.0,
                    ),
                    valueOrDefault<double>(
                      () {
                        if (MediaQuery.sizeOf(context).width <
                            kBreakpointSmall) {
                          return 0.0;
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointMedium) {
                          return 0.0;
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointLarge) {
                          return FFAppConstants.veryLargCardUD.toDouble();
                        } else {
                          return FFAppConstants.veryLargCardUD.toDouble();
                        }
                      }(),
                      0.0,
                    ),
                    valueOrDefault<double>(
                      () {
                        if (MediaQuery.sizeOf(context).width <
                            kBreakpointSmall) {
                          return 0.0;
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointMedium) {
                          return 0.0;
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointLarge) {
                          return FFAppConstants.veryLargCardLR.toDouble();
                        } else {
                          return FFAppConstants.veryLargCardLR.toDouble();
                        }
                      }(),
                      0.0,
                    ),
                    valueOrDefault<double>(
                      () {
                        if (MediaQuery.sizeOf(context).width <
                            kBreakpointSmall) {
                          return 0.0;
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointMedium) {
                          return 0.0;
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointLarge) {
                          return FFAppConstants.veryLargCardUD.toDouble();
                        } else {
                          return FFAppConstants.veryLargCardUD.toDouble();
                        }
                      }(),
                      0.0,
                    )),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
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
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            37.0, 37.0, 37.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.chevron_left_rounded,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  size: 20.0,
                                ),
                                Text(
                                  'Back',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                            Text(
                              'This how your task will be shown to public',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Icon(
                              Icons.close_rounded,
                              color: FlutterFlowTheme.of(context).alternate,
                              size: 20.0,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x00FFFFFF),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            32.0, 0.0, 20.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                if (responsiveVisibility(
                                                  context: context,
                                                  desktop: false,
                                                ))
                                                  wrapWithModel(
                                                    model: _model.headerModel,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: HeaderWidget(
                                                      openDrawer: () async {
                                                        scaffoldKey
                                                            .currentState!
                                                            .openEndDrawer();
                                                      },
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Expanded(
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (responsiveVisibility(
                                                      context: context,
                                                      desktop: false,
                                                    ))
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    16.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                          4.0,
                                                                      color: Color(
                                                                          0x33000000),
                                                                      offset: Offset(
                                                                          0.0,
                                                                          2.0),
                                                                      spreadRadius:
                                                                          4.0,
                                                                    )
                                                                  ],
                                                                ),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          32.0,
                                                                          30.0,
                                                                          32.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          FutureBuilder<
                                                                              ApiCallResponse>(
                                                                            future:
                                                                                TaskerpageBackendGroup.userProfileReadCall.call(
                                                                              id: getJsonField(
                                                                                publishTaskWebPostReadResponse.jsonBody,
                                                                                r'''$.data.poster''',
                                                                              ).toString(),
                                                                              apiGlobalKey: FFAppState().apiKey,
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
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
                                                                              final columnUserProfileReadResponse = snapshot.data!;
                                                                              return Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                                                                                    child: Container(
                                                                                      width: 50.0,
                                                                                      height: 50.0,
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Image.network(
                                                                                        '${FFAppState().baseUrl}${getJsonField(
                                                                                          columnUserProfileReadResponse.jsonBody,
                                                                                          r'''$.data.avatar''',
                                                                                        ).toString()}',
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    getJsonField(
                                                                                      columnUserProfileReadResponse.jsonBody,
                                                                                      r'''$.data.first_name''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Lato',
                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                          fontSize: 13.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    getJsonField(
                                                                                      columnUserProfileReadResponse.jsonBody,
                                                                                      r'''$.data.last_name''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Lato',
                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                          fontSize: 13.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      getJsonField(
                                                                                        publishTaskWebPostReadResponse.jsonBody,
                                                                                        r'''$.data.skill_category_name''',
                                                                                      ).toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Lato',
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                            fontSize: 18.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                      child: Icon(
                                                                                        Icons.verified_rounded,
                                                                                        color: Color(0xFF49A1FF),
                                                                                        size: 19.0,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      getJsonField(
                                                                                        publishTaskWebPostReadResponse.jsonBody,
                                                                                        r'''$.data.skill_name''',
                                                                                      ).toString().maybeHandleOverflow(
                                                                                            maxChars: 29,
                                                                                            replacement: '…',
                                                                                          ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Lato',
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                            fontSize: 14.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                    if (functions
                                                                                            .jsonToInt(getJsonField(
                                                                                              publishTaskWebPostReadResponse.jsonBody,
                                                                                              r'''$.data.is_online''',
                                                                                            ))
                                                                                            .toString() ==
                                                                                        '1')
                                                                                      Text(
                                                                                        'Online Task',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Lato',
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              fontSize: 12.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Container(
                                                                                        width: 100.0,
                                                                                        height: 40.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Color(0xFFF2F2F2),
                                                                                          borderRadius: BorderRadius.circular(2.0),
                                                                                        ),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Text(
                                                                                              '${getJsonField(
                                                                                                publishTaskWebPostReadResponse.jsonBody,
                                                                                                r'''$.data.rate''',
                                                                                              ).toString()} ${getJsonField(
                                                                                                publishTaskWebPostReadResponse.jsonBody,
                                                                                                r'''$.data.rate_currency''',
                                                                                              ).toString()}',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Lato',
                                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                                    fontSize: 18.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ].divide(SizedBox(height: 5.5)),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 24.0)),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          32.0,
                                                                          29.0,
                                                                          32.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            'Task discription',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Lato',
                                                                                  color: Color(0xFF222222),
                                                                                  fontSize: 14.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          32.0,
                                                                          17.5,
                                                                          32.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Flexible(
                                                                            child:
                                                                                Text(
                                                                              getJsonField(
                                                                                publishTaskWebPostReadResponse.jsonBody,
                                                                                r'''$.data.description''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Lato',
                                                                                    color: Color(0xFF222222),
                                                                                    fontSize: 14.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    if (getJsonField(
                                                                          publishTaskWebPostReadResponse
                                                                              .jsonBody,
                                                                          r'''$.data.file''',
                                                                        ) !=
                                                                        null)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            32.0,
                                                                            16.0,
                                                                            32.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                              child: Icon(
                                                                                Icons.file_copy,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 20.0,
                                                                              ),
                                                                            ),
                                                                            Flexible(
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  await launchURL('${FFAppState().baseUrl}${getJsonField(
                                                                                    publishTaskWebPostReadResponse.jsonBody,
                                                                                    r'''$.data.file''',
                                                                                  ).toString()}');
                                                                                },
                                                                                child: Text(
                                                                                  'https://taskerpage.com${getJsonField(
                                                                                    publishTaskWebPostReadResponse.jsonBody,
                                                                                    r'''$.data.file''',
                                                                                  ).toString()}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Lato',
                                                                                        color: Color(0xFF494949),
                                                                                        fontSize: 12.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          32.0,
                                                                          22.0,
                                                                          32.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            'Conditions',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Lato',
                                                                                  color: Color(0xFF222222),
                                                                                  fontSize: 14.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          32.0,
                                                                          12.0,
                                                                          32.0,
                                                                          30.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                195.0,
                                                                            height:
                                                                                22.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFDEDEDE),
                                                                              borderRadius: BorderRadius.circular(3.0),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Text(
                                                                                  'Trimming, Hedging, Lawn',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Lato',
                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                        fontSize: 13.0,
                                                                                        fontWeight: FontWeight.w500,
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
                                                          ],
                                                        ),
                                                      ),
                                                    if (responsiveVisibility(
                                                      context: context,
                                                      phone: false,
                                                      tablet: false,
                                                      tabletLandscape: false,
                                                    ))
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    29.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          5.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          1.0,
                                                                      height:
                                                                          506.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                4.0,
                                                                            color:
                                                                                Color(0x33000000),
                                                                            offset:
                                                                                Offset(0.0, 2.0),
                                                                            spreadRadius:
                                                                                2.0,
                                                                          )
                                                                        ],
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                32.0,
                                                                                30.0,
                                                                                32.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                FutureBuilder<ApiCallResponse>(
                                                                                  future: TaskerpageBackendGroup.userProfileReadCall.call(
                                                                                    id: getJsonField(
                                                                                      publishTaskWebPostReadResponse.jsonBody,
                                                                                      r'''$.data.poster''',
                                                                                    ).toString(),
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
                                                                                    final columnUserProfileReadResponse = snapshot.data!;
                                                                                    return Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                                                                                          child: Container(
                                                                                            width: 65.0,
                                                                                            height: 65.0,
                                                                                            clipBehavior: Clip.antiAlias,
                                                                                            decoration: BoxDecoration(
                                                                                              shape: BoxShape.circle,
                                                                                            ),
                                                                                            child: Image.network(
                                                                                              '${FFAppState().baseUrl}${getJsonField(
                                                                                                columnUserProfileReadResponse.jsonBody,
                                                                                                r'''$.data.avatar''',
                                                                                              ).toString()}',
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                          getJsonField(
                                                                                            columnUserProfileReadResponse.jsonBody,
                                                                                            r'''$.data.first_name''',
                                                                                          ).toString(),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Lato',
                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                fontSize: 13.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          getJsonField(
                                                                                            columnUserProfileReadResponse.jsonBody,
                                                                                            r'''$.data.last_name''',
                                                                                          ).toString(),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Lato',
                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                fontSize: 13.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                ),
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            getJsonField(
                                                                                              publishTaskWebPostReadResponse.jsonBody,
                                                                                              r'''$.data.skill_category_name''',
                                                                                            ).toString(),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Lato',
                                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                                  fontSize: 18.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                            child: Icon(
                                                                                              Icons.verified_rounded,
                                                                                              color: Color(0xFF49A1FF),
                                                                                              size: 19.0,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Text(
                                                                                            getJsonField(
                                                                                              publishTaskWebPostReadResponse.jsonBody,
                                                                                              r'''$.data.skill_name''',
                                                                                            ).toString().maybeHandleOverflow(
                                                                                                  maxChars: 29,
                                                                                                  replacement: '…',
                                                                                                ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Lato',
                                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                                  fontSize: 14.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                          if (functions
                                                                                                  .jsonToInt(getJsonField(
                                                                                                    publishTaskWebPostReadResponse.jsonBody,
                                                                                                    r'''$.data.is_online''',
                                                                                                  ))
                                                                                                  .toString() ==
                                                                                              '1')
                                                                                            Text(
                                                                                              'Online Task',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Lato',
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    fontSize: 12.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                  ),
                                                                                            ),
                                                                                        ],
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: Container(
                                                                                              width: 100.0,
                                                                                              height: 40.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: Color(0xFFF2F2F2),
                                                                                                borderRadius: BorderRadius.circular(2.0),
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    '${getJsonField(
                                                                                                      publishTaskWebPostReadResponse.jsonBody,
                                                                                                      r'''$.data.rate''',
                                                                                                    ).toString()} ${getJsonField(
                                                                                                      publishTaskWebPostReadResponse.jsonBody,
                                                                                                      r'''$.data.rate_currency''',
                                                                                                    ).toString()}',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Lato',
                                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                                          fontSize: 18.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ].divide(SizedBox(height: 5.5)),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 24.0)),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                32.0,
                                                                                29.0,
                                                                                32.0,
                                                                                2.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Text(
                                                                                  'Task discription',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Lato',
                                                                                        color: Color(0xFF222222),
                                                                                        fontSize: 14.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Divider(
                                                                            thickness:
                                                                                1.0,
                                                                            indent:
                                                                                32.0,
                                                                            endIndent:
                                                                                32.0,
                                                                            color:
                                                                                Color(0xFFDEDEDE),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                32.0,
                                                                                17.5,
                                                                                32.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Flexible(
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      publishTaskWebPostReadResponse.jsonBody,
                                                                                      r'''$.data.description''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Lato',
                                                                                          color: Color(0xFF222222),
                                                                                          fontSize: 14.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          if (getJsonField(
                                                                                publishTaskWebPostReadResponse.jsonBody,
                                                                                r'''$.data.file''',
                                                                              ) !=
                                                                              null)
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(32.0, 16.0, 32.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                    child: Icon(
                                                                                      Icons.file_copy,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      size: 20.0,
                                                                                    ),
                                                                                  ),
                                                                                  Flexible(
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        await launchURL('${FFAppState().baseUrl}${getJsonField(
                                                                                          publishTaskWebPostReadResponse.jsonBody,
                                                                                          r'''$.data.file''',
                                                                                        ).toString()}');
                                                                                      },
                                                                                      child: Text(
                                                                                        'https://taskerpage.com${getJsonField(
                                                                                          publishTaskWebPostReadResponse.jsonBody,
                                                                                          r'''$.data.file''',
                                                                                        ).toString()}',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Lato',
                                                                                              color: Color(0xFF494949),
                                                                                              fontSize: 12.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                32.0,
                                                                                22.0,
                                                                                32.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Text(
                                                                                  'Conditions',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Lato',
                                                                                        color: Color(0xFF222222),
                                                                                        fontSize: 14.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                32.0,
                                                                                12.0,
                                                                                32.0,
                                                                                30.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: 195.0,
                                                                                  height: 22.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFFDEDEDE),
                                                                                    borderRadius: BorderRadius.circular(3.0),
                                                                                  ),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Text(
                                                                                        'Trimming, Hedging, Lawn',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Lato',
                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                              fontSize: 13.0,
                                                                                              fontWeight: FontWeight.w500,
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
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    if (responsiveVisibility(
                                                      context: context,
                                                      desktop: false,
                                                    ))
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    15.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                width: 100.0,
                                                                height: 290.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFF9F9F9),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                          4.0,
                                                                      color: Color(
                                                                          0x33000000),
                                                                      offset: Offset(
                                                                          0.0,
                                                                          2.0),
                                                                      spreadRadius:
                                                                          4.0,
                                                                    )
                                                                  ],
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          32.0,
                                                                          24.0,
                                                                          32.0,
                                                                          24.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children:
                                                                            [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 101.0,
                                                                              height: 65.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                border: Border.all(
                                                                                  color: Color(0xFFDEDEDE),
                                                                                ),
                                                                              ),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    '${getJsonField(
                                                                                      publishTaskWebPostReadResponse.jsonBody,
                                                                                      r'''$.data.rate''',
                                                                                    ).toString()} ${getJsonField(
                                                                                      publishTaskWebPostReadResponse.jsonBody,
                                                                                      r'''$.data.rate_currency''',
                                                                                    ).toString()}',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Lato',
                                                                                          color: Color(0xFF222222),
                                                                                          fontSize: 16.0,
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    functions.jsonToString(getJsonField(
                                                                                              publishTaskWebPostReadResponse.jsonBody,
                                                                                              r'''$.data.rate_type''',
                                                                                            )) ==
                                                                                            'Offer a rate'
                                                                                        ? 'Hourly Rate'
                                                                                        : 'Total Rate',
                                                                                    textAlign: TextAlign.center,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Lato',
                                                                                          color: Color(0xFF222222),
                                                                                          fontSize: 14.0,
                                                                                        ),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 4.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 101.0,
                                                                              height: 65.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                border: Border.all(
                                                                                  color: Color(0xFFDEDEDE),
                                                                                ),
                                                                              ),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    functions.jsonToString(getJsonField(
                                                                                              publishTaskWebPostReadResponse.jsonBody,
                                                                                              r'''$.data.repeat_type''',
                                                                                            )) ==
                                                                                            'Exact Dates'
                                                                                        ? '${getJsonField(
                                                                                            publishTaskWebPostReadResponse.jsonBody,
                                                                                            r'''$.data.number_of_hours_per_session''',
                                                                                          ).toString()} hr'
                                                                                        : '${functions.multiplication(getJsonField(
                                                                                              publishTaskWebPostReadResponse.jsonBody,
                                                                                              r'''$.data.number_of_hours_per_session''',
                                                                                            ), getJsonField(
                                                                                              publishTaskWebPostReadResponse.jsonBody,
                                                                                              r'''$.data.days_per_week''',
                                                                                            )).toString()} hr',
                                                                                    textAlign: TextAlign.center,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Lato',
                                                                                          color: Color(0xFF222222),
                                                                                          fontSize: 16.0,
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    'Total time',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Lato',
                                                                                          color: Color(0xFF222222),
                                                                                          fontSize: 14.0,
                                                                                        ),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 4.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 101.0,
                                                                              height: 65.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                border: Border.all(
                                                                                  color: Color(0xFFDEDEDE),
                                                                                ),
                                                                              ),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    getJsonField(
                                                                                      publishTaskWebPostReadResponse.jsonBody,
                                                                                      r'''$.data.repeat_type''',
                                                                                    ).toString(),
                                                                                    textAlign: TextAlign.center,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Lato',
                                                                                          color: Color(0xFF222222),
                                                                                          fontSize: 14.0,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 8.0)),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100.0,
                                                                              height: 168.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                border: Border.all(
                                                                                  color: Color(0xFFDEDEDE),
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(18.0, 16.0, 18.0, 20.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                          child: Icon(
                                                                                            Icons.calendar_month,
                                                                                            color: Color(0xFF222222),
                                                                                            size: 20.0,
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                          '${getJsonField(
                                                                                            publishTaskWebPostReadResponse.jsonBody,
                                                                                            r'''$.data.start_date''',
                                                                                          ).toString()}${getJsonField(
                                                                                                publishTaskWebPostReadResponse.jsonBody,
                                                                                                r'''$.data.end_on''',
                                                                                              ) != null ? '   to   ' : ''}${getJsonField(
                                                                                                publishTaskWebPostReadResponse.jsonBody,
                                                                                                r'''$.data.end_on''',
                                                                                              ) != null ? getJsonField(
                                                                                              publishTaskWebPostReadResponse.jsonBody,
                                                                                              r'''$.data.end_on''',
                                                                                            ).toString() : ''}',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Lato',
                                                                                                color: Color(0xFF222222),
                                                                                                fontSize: 14.0,
                                                                                                fontWeight: FontWeight.bold,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                          child: Icon(
                                                                                            Icons.access_time_rounded,
                                                                                            color: Color(0xFF222222),
                                                                                            size: 20.0,
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                          getJsonField(
                                                                                                    publishTaskWebPostReadResponse.jsonBody,
                                                                                                    r'''$.data.start_range_time''',
                                                                                                  ) !=
                                                                                                  null
                                                                                              ? getJsonField(
                                                                                                  publishTaskWebPostReadResponse.jsonBody,
                                                                                                  r'''$.data.start_range_time''',
                                                                                                ).toString()
                                                                                              : getJsonField(
                                                                                                  publishTaskWebPostReadResponse.jsonBody,
                                                                                                  r'''$.data.start_time''',
                                                                                                ).toString(),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Lato',
                                                                                                color: Color(0xFF222222),
                                                                                                fontSize: 14.0,
                                                                                                fontWeight: FontWeight.bold,
                                                                                              ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                          child: ClipRRect(
                                                                                            borderRadius: BorderRadius.circular(0.0),
                                                                                            child: Image.asset(
                                                                                              'assets/images/Group_2234.png',
                                                                                              width: 16.0,
                                                                                              height: 16.0,
                                                                                              fit: BoxFit.none,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                          child: Icon(
                                                                                            Icons.hourglass_bottom_rounded,
                                                                                            color: Color(0xFF222222),
                                                                                            size: 20.0,
                                                                                          ),
                                                                                        ),
                                                                                        Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            if (functions.jsonToString(getJsonField(
                                                                                                  publishTaskWebPostReadResponse.jsonBody,
                                                                                                  r'''$.data.repeat_type''',
                                                                                                )) !=
                                                                                                'Exact Dates')
                                                                                              Text(
                                                                                                '${getJsonField(
                                                                                                  publishTaskWebPostReadResponse.jsonBody,
                                                                                                  r'''$.data.days_per_week''',
                                                                                                ).toString()} ${functions.jsonToString(getJsonField(
                                                                                                      publishTaskWebPostReadResponse.jsonBody,
                                                                                                      r'''$.data.repeat_type''',
                                                                                                    )) == 'Weekly' ? 'days per week ' : 'days per mounth '}',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Lato',
                                                                                                      color: Color(0xFF222222),
                                                                                                      fontSize: 14.0,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                    ),
                                                                                              ),
                                                                                            Text(
                                                                                              '${getJsonField(
                                                                                                publishTaskWebPostReadResponse.jsonBody,
                                                                                                r'''$.data.number_of_hours_per_session''',
                                                                                              ).toString()} hours each session',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Lato',
                                                                                                    color: Color(0xFF222222),
                                                                                                    fontSize: 14.0,
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Preferred day:',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Lato',
                                                                                                color: Color(0xFF222222),
                                                                                                fontSize: 14.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                              ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Text(
                                                                                                getJsonField(
                                                                                                          publishTaskWebPostReadResponse.jsonBody,
                                                                                                          r'''$.data.preferred_days''',
                                                                                                        ) !=
                                                                                                        null
                                                                                                    ? getJsonField(
                                                                                                        publishTaskWebPostReadResponse.jsonBody,
                                                                                                        r'''$.data.preferred_days''',
                                                                                                      ).toString()
                                                                                                    : '-',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Lato',
                                                                                                      color: Color(0xFF222222),
                                                                                                      fontSize: 14.0,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                    ),
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
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            8.4)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    if (responsiveVisibility(
                                                      context: context,
                                                      desktop: false,
                                                    ))
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    15.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                width: 100.0,
                                                                height: 100.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                          4.0,
                                                                      color: Color(
                                                                          0x33000000),
                                                                      offset: Offset(
                                                                          0.0,
                                                                          2.0),
                                                                      spreadRadius:
                                                                          4.0,
                                                                    )
                                                                  ],
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          32.0,
                                                                          0.0,
                                                                          32.0,
                                                                          0.0),
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
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                10.0,
                                                                                0.0),
                                                                            child:
                                                                                Icon(
                                                                              Icons.place_outlined,
                                                                              color: Color(0xFF222222),
                                                                              size: 20.0,
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            '${getJsonField(
                                                                              publishTaskWebPostReadResponse.jsonBody,
                                                                              r'''$.data.city''',
                                                                            ).toString()} | ${getJsonField(
                                                                              publishTaskWebPostReadResponse.jsonBody,
                                                                              r'''$.data.language''',
                                                                            ).toString()}',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Lato',
                                                                                  color: Color(0xFF222222),
                                                                                  fontSize: 14.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              80.0,
                                                                          height:
                                                                              80.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Builder(builder: (context) {
                                                                            final _googleMapMarker = functions.fulllatLong(
                                                                                getJsonField(
                                                                                  publishTaskWebPostReadResponse.jsonBody,
                                                                                  r'''$.data.latitude''',
                                                                                ).toString(),
                                                                                getJsonField(
                                                                                  publishTaskWebPostReadResponse.jsonBody,
                                                                                  r'''$.data.longitude''',
                                                                                ).toString());
                                                                            return FlutterFlowGoogleMap(
                                                                              controller: _model.googleMapsController1,
                                                                              onCameraIdle: (latLng) => _model.googleMapsCenter1 = latLng,
                                                                              initialLocation: _model.googleMapsCenter1 ??= functions.fulllatLong(
                                                                                  getJsonField(
                                                                                    publishTaskWebPostReadResponse.jsonBody,
                                                                                    r'''$.data.latitude''',
                                                                                  ).toString(),
                                                                                  getJsonField(
                                                                                    publishTaskWebPostReadResponse.jsonBody,
                                                                                    r'''$.data.longitude''',
                                                                                  ).toString()),
                                                                              markers: [
                                                                                FlutterFlowMarker(
                                                                                  _googleMapMarker.serialize(),
                                                                                  _googleMapMarker,
                                                                                ),
                                                                              ],
                                                                              markerColor: GoogleMarkerColor.violet,
                                                                              mapType: MapType.normal,
                                                                              style: GoogleMapStyle.standard,
                                                                              initialZoom: 15.0,
                                                                              allowInteraction: true,
                                                                              allowZoom: false,
                                                                              showZoomControls: false,
                                                                              showLocation: true,
                                                                              showCompass: false,
                                                                              showMapToolbar: false,
                                                                              showTraffic: false,
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
                                                ),
                                              ),
                                            ),
                                            if (responsiveVisibility(
                                              context: context,
                                              desktop: false,
                                            ))
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 5.0,
                                                          color:
                                                              Color(0x33000000),
                                                          offset:
                                                              Offset(5.0, 1.0),
                                                          spreadRadius: 2.0,
                                                        )
                                                      ],
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  32.0,
                                                                  0.0,
                                                                  32.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              context.safePop();
                                                            },
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .keyboard_arrow_left,
                                                                  color: Color(
                                                                      0xFF292929),
                                                                  size: 17.0,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          6.0,
                                                                          0.0,
                                                                          0.0,
                                                                          2.0),
                                                                  child: Text(
                                                                    'Back',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lato',
                                                                          color:
                                                                              Color(0xFF292929),
                                                                          fontSize:
                                                                              13.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Flexible(
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                var _shouldSetState =
                                                                    false;
                                                                if (getJsonField(
                                                                      publishTaskWebPostReadResponse
                                                                          .jsonBody,
                                                                      r'''$.data.poster''',
                                                                    ) ==
                                                                    getJsonField(
                                                                      FFAppState()
                                                                          .userProfile,
                                                                      r'''$.data.name''',
                                                                    )) {
                                                                  if (functions
                                                                          .jsonToInt(
                                                                              getJsonField(
                                                                            publishTaskWebPostReadResponse.jsonBody,
                                                                            r'''$.data.docstatus''',
                                                                          ))
                                                                          .toString() ==
                                                                      '0') {
                                                                    _model.updateStatusPost2 =
                                                                        await TaskerpageBackendGroup
                                                                            .updateStatusPostCall
                                                                            .call(
                                                                      id: widget
                                                                          .id,
                                                                      apiGlobalKey:
                                                                          FFAppState()
                                                                              .apiKey,
                                                                      draft: 1,
                                                                    );
                                                                    _shouldSetState =
                                                                        true;
                                                                    if ((_model
                                                                            .updateStatusPost2
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      context.pushNamed(
                                                                          'MyPosts');
                                                                    } else {
                                                                      if (_shouldSetState)
                                                                        setState(
                                                                            () {});
                                                                      return;
                                                                    }
                                                                  } else {
                                                                    context
                                                                        .pushNamed(
                                                                      'Task-1',
                                                                      queryParameters:
                                                                          {
                                                                        'id':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            publishTaskWebPostReadResponse.jsonBody,
                                                                            r'''$.data.name''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  }
                                                                } else {
                                                                  _model.userRead1 =
                                                                      await TaskerpageBackendGroup
                                                                          .userProfileReadCall
                                                                          .call(
                                                                    id: getJsonField(
                                                                      publishTaskWebPostReadResponse
                                                                          .jsonBody,
                                                                      r'''$.data.poster''',
                                                                    ).toString(),
                                                                    apiGlobalKey:
                                                                        FFAppState()
                                                                            .apiKey,
                                                                  );
                                                                  _shouldSetState =
                                                                      true;
                                                                  _model.startChat229 =
                                                                      await TaskerpageBackendGroup
                                                                          .createChatCall
                                                                          .call(
                                                                    roomName:
                                                                        'G - (${getJsonField(
                                                                      FFAppState()
                                                                          .userProfile,
                                                                      r'''$.data.name''',
                                                                    ).toString()}-${getJsonField(
                                                                      publishTaskWebPostReadResponse
                                                                          .jsonBody,
                                                                      r'''$.data.poster''',
                                                                    ).toString()}) T - (${getJsonField(
                                                                      publishTaskWebPostReadResponse
                                                                          .jsonBody,
                                                                      r'''$.data.name''',
                                                                    ).toString()})',
                                                                    users:
                                                                        '[\'${getJsonField(
                                                                      (_model.userRead1
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.data.user''',
                                                                    ).toString()}\']',
                                                                    type:
                                                                        'Group',
                                                                    task:
                                                                        getJsonField(
                                                                      publishTaskWebPostReadResponse
                                                                          .jsonBody,
                                                                      r'''$.data.name''',
                                                                    ).toString(),
                                                                    apiGlobalKey:
                                                                        FFAppState()
                                                                            .apiKey,
                                                                  );
                                                                  _shouldSetState =
                                                                      true;
                                                                  if ((_model
                                                                          .startChat229
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    context
                                                                        .pushNamed(
                                                                      'chat',
                                                                      pathParameters:
                                                                          {
                                                                        'room':
                                                                            serializeParam(
                                                                          TaskerpageBackendGroup
                                                                              .createChatCall
                                                                              .room(
                                                                                (_model.startChat229?.jsonBody ?? ''),
                                                                              )
                                                                              .toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  } else {
                                                                    if (_shouldSetState)
                                                                      setState(
                                                                          () {});
                                                                    return;
                                                                  }
                                                                }

                                                                if (_shouldSetState)
                                                                  setState(
                                                                      () {});
                                                              },
                                                              child: Container(
                                                                width: 200.0,
                                                                height: 36.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0.0),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      getJsonField(
                                                                                publishTaskWebPostReadResponse.jsonBody,
                                                                                r'''$.data.poster''',
                                                                              ) ==
                                                                              getJsonField(
                                                                                FFAppState().userProfile,
                                                                                r'''$.data.name''',
                                                                              )
                                                                          ? (functions
                                                                                      .jsonToInt(getJsonField(
                                                                                        publishTaskWebPostReadResponse.jsonBody,
                                                                                        r'''$.data.docstatus''',
                                                                                      ))
                                                                                      .toString() ==
                                                                                  '0'
                                                                              ? 'PUBLISH TASK'
                                                                              : 'EDIT TASK')
                                                                          : 'Start Chat',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lato',
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                14.0,
                                                                          ),
                                                                    ),
                                                                    if (getJsonField(
                                                                          publishTaskWebPostReadResponse
                                                                              .jsonBody,
                                                                          r'''$.data.poster''',
                                                                        ) !=
                                                                        getJsonField(
                                                                          FFAppState()
                                                                              .userProfile,
                                                                          r'''$.data.name''',
                                                                        ))
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            6.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .chat,
                                                                          color:
                                                                              Colors.white,
                                                                          size:
                                                                              20.0,
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
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 432.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 32.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (responsiveVisibility(
                                            context: context,
                                            phone: false,
                                            tablet: false,
                                            tabletLandscape: false,
                                          ))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 34.0, 10.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 290.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFF9F9F9),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 4.0,
                                                            color: Color(
                                                                0x33000000),
                                                            offset: Offset(
                                                                0.0, 2.0),
                                                            spreadRadius: 2.0,
                                                          )
                                                        ],
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    32.0,
                                                                    24.0,
                                                                    32.0,
                                                                    24.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        101.0,
                                                                    height:
                                                                        65.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Color(
                                                                            0xFFDEDEDE),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children:
                                                                          [
                                                                        Text(
                                                                          '${getJsonField(
                                                                            publishTaskWebPostReadResponse.jsonBody,
                                                                            r'''$.data.rate''',
                                                                          ).toString()} ${getJsonField(
                                                                            publishTaskWebPostReadResponse.jsonBody,
                                                                            r'''$.data.rate_currency''',
                                                                          ).toString()}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Lato',
                                                                                color: Color(0xFF222222),
                                                                                fontSize: 16.0,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          functions.jsonToString(getJsonField(
                                                                                    publishTaskWebPostReadResponse.jsonBody,
                                                                                    r'''$.data.rate_type''',
                                                                                  )) ==
                                                                                  'Offer a rate'
                                                                              ? 'Hourly Rate'
                                                                              : 'Total Rate',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Lato',
                                                                                color: Color(0xFF222222),
                                                                                fontSize: 14.0,
                                                                              ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 4.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        101.0,
                                                                    height:
                                                                        65.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Color(
                                                                            0xFFDEDEDE),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children:
                                                                          [
                                                                        Text(
                                                                          functions.jsonToString(getJsonField(
                                                                                    publishTaskWebPostReadResponse.jsonBody,
                                                                                    r'''$.data.repeat_type''',
                                                                                  )) ==
                                                                                  'Exact Dates'
                                                                              ? '${getJsonField(
                                                                                  publishTaskWebPostReadResponse.jsonBody,
                                                                                  r'''$.data.number_of_hours_per_session''',
                                                                                ).toString()} hr'
                                                                              : '${functions.multiplication(getJsonField(
                                                                                    publishTaskWebPostReadResponse.jsonBody,
                                                                                    r'''$.data.number_of_hours_per_session''',
                                                                                  ), getJsonField(
                                                                                    publishTaskWebPostReadResponse.jsonBody,
                                                                                    r'''$.data.days_per_week''',
                                                                                  )).toString()} hr',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Lato',
                                                                                color: Color(0xFF222222),
                                                                                fontSize: 16.0,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          'Total time',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Lato',
                                                                                color: Color(0xFF222222),
                                                                                fontSize: 14.0,
                                                                              ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 4.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        101.0,
                                                                    height:
                                                                        65.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Color(
                                                                            0xFFDEDEDE),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                          getJsonField(
                                                                            publishTaskWebPostReadResponse.jsonBody,
                                                                            r'''$.data.repeat_type''',
                                                                          ).toString(),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Lato',
                                                                                color: Color(0xFF222222),
                                                                                fontSize: 14.0,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        100.0,
                                                                    height:
                                                                        168.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Color(
                                                                            0xFFDEDEDE),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          18.0,
                                                                          16.0,
                                                                          18.0,
                                                                          20.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                child: Icon(
                                                                                  Icons.calendar_month,
                                                                                  color: Color(0xFF222222),
                                                                                  size: 20.0,
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                '${getJsonField(
                                                                                  publishTaskWebPostReadResponse.jsonBody,
                                                                                  r'''$.data.start_date''',
                                                                                ).toString()}${getJsonField(
                                                                                      publishTaskWebPostReadResponse.jsonBody,
                                                                                      r'''$.data.end_on''',
                                                                                    ) != null ? '   to   ' : ''}${getJsonField(
                                                                                      publishTaskWebPostReadResponse.jsonBody,
                                                                                      r'''$.data.end_on''',
                                                                                    ) != null ? getJsonField(
                                                                                    publishTaskWebPostReadResponse.jsonBody,
                                                                                    r'''$.data.end_on''',
                                                                                  ).toString() : ''}',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Lato',
                                                                                      color: Color(0xFF222222),
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                child: Icon(
                                                                                  Icons.access_time_rounded,
                                                                                  color: Color(0xFF222222),
                                                                                  size: 20.0,
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                getJsonField(
                                                                                          publishTaskWebPostReadResponse.jsonBody,
                                                                                          r'''$.data.start_range_time''',
                                                                                        ) !=
                                                                                        null
                                                                                    ? getJsonField(
                                                                                        publishTaskWebPostReadResponse.jsonBody,
                                                                                        r'''$.data.start_range_time''',
                                                                                      ).toString()
                                                                                    : getJsonField(
                                                                                        publishTaskWebPostReadResponse.jsonBody,
                                                                                        r'''$.data.start_time''',
                                                                                      ).toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Lato',
                                                                                      color: Color(0xFF222222),
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(0.0),
                                                                                  child: Image.asset(
                                                                                    'assets/images/Group_2234.png',
                                                                                    width: 16.0,
                                                                                    height: 16.0,
                                                                                    fit: BoxFit.none,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                child: Icon(
                                                                                  Icons.hourglass_bottom_rounded,
                                                                                  color: Color(0xFF222222),
                                                                                  size: 20.0,
                                                                                ),
                                                                              ),
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  if (functions.jsonToString(getJsonField(
                                                                                        publishTaskWebPostReadResponse.jsonBody,
                                                                                        r'''$.data.repeat_type''',
                                                                                      )) !=
                                                                                      'Exact Dates')
                                                                                    Text(
                                                                                      '${getJsonField(
                                                                                        publishTaskWebPostReadResponse.jsonBody,
                                                                                        r'''$.data.days_per_week''',
                                                                                      ).toString()} ${functions.jsonToString(getJsonField(
                                                                                            publishTaskWebPostReadResponse.jsonBody,
                                                                                            r'''$.data.repeat_type''',
                                                                                          )) == 'Weekly' ? 'days per week ' : 'days per mounth '}',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Lato',
                                                                                            color: Color(0xFF222222),
                                                                                            fontSize: 14.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                  Text(
                                                                                    '${getJsonField(
                                                                                      publishTaskWebPostReadResponse.jsonBody,
                                                                                      r'''$.data.number_of_hours_per_session''',
                                                                                    ).toString()} hours each session',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Lato',
                                                                                          color: Color(0xFF222222),
                                                                                          fontSize: 14.0,
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                'Preferred day:',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Lato',
                                                                                      color: Color(0xFF222222),
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      getJsonField(
                                                                                                publishTaskWebPostReadResponse.jsonBody,
                                                                                                r'''$.data.preferred_days''',
                                                                                              ) !=
                                                                                              null
                                                                                          ? getJsonField(
                                                                                              publishTaskWebPostReadResponse.jsonBody,
                                                                                              r'''$.data.preferred_days''',
                                                                                            ).toString()
                                                                                          : '-',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Lato',
                                                                                            color: Color(0xFF222222),
                                                                                            fontSize: 14.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
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
                                                          ].divide(SizedBox(
                                                              height: 8.4)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          if (responsiveVisibility(
                                            context: context,
                                            phone: false,
                                            tablet: false,
                                            tabletLandscape: false,
                                          ))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 15.0, 10.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 4.0,
                                                            color: Color(
                                                                0x33000000),
                                                            offset: Offset(
                                                                0.0, 2.0),
                                                            spreadRadius: 2.0,
                                                          )
                                                        ],
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    32.0,
                                                                    0.0,
                                                                    32.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .place_outlined,
                                                                    color: Color(
                                                                        0xFF222222),
                                                                    size: 20.0,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  '${getJsonField(
                                                                    publishTaskWebPostReadResponse
                                                                        .jsonBody,
                                                                    r'''$.data.city''',
                                                                  ).toString()} | ${getJsonField(
                                                                    publishTaskWebPostReadResponse
                                                                        .jsonBody,
                                                                    r'''$.data.language''',
                                                                  ).toString()}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Lato',
                                                                        color: Color(
                                                                            0xFF222222),
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                            Flexible(
                                                              child: Container(
                                                                width: 80.0,
                                                                height: 80.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Builder(
                                                                    builder:
                                                                        (context) {
                                                                  final _googleMapMarker = functions.fulllatLong(
                                                                      getJsonField(
                                                                        publishTaskWebPostReadResponse
                                                                            .jsonBody,
                                                                        r'''$.data.latitude''',
                                                                      ).toString(),
                                                                      getJsonField(
                                                                        publishTaskWebPostReadResponse
                                                                            .jsonBody,
                                                                        r'''$.data.longitude''',
                                                                      ).toString());
                                                                  return FlutterFlowGoogleMap(
                                                                    controller:
                                                                        _model
                                                                            .googleMapsController2,
                                                                    onCameraIdle:
                                                                        (latLng) =>
                                                                            _model.googleMapsCenter2 =
                                                                                latLng,
                                                                    initialLocation: _model.googleMapsCenter2 ??= functions.fulllatLong(
                                                                        getJsonField(
                                                                          publishTaskWebPostReadResponse
                                                                              .jsonBody,
                                                                          r'''$.data.latitude''',
                                                                        ).toString(),
                                                                        getJsonField(
                                                                          publishTaskWebPostReadResponse
                                                                              .jsonBody,
                                                                          r'''$.data.longitude''',
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
                                                                    mapType: MapType
                                                                        .normal,
                                                                    style: GoogleMapStyle
                                                                        .standard,
                                                                    initialZoom:
                                                                        15.0,
                                                                    allowInteraction:
                                                                        true,
                                                                    allowZoom:
                                                                        false,
                                                                    showZoomControls:
                                                                        false,
                                                                    showLocation:
                                                                        true,
                                                                    showCompass:
                                                                        false,
                                                                    showMapToolbar:
                                                                        false,
                                                                    showTraffic:
                                                                        false,
                                                                    centerMapOnMarkerTap:
                                                                        true,
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
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 24.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
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
                                                    var _shouldSetState = false;
                                                    if (getJsonField(
                                                          publishTaskWebPostReadResponse
                                                              .jsonBody,
                                                          r'''$.data.poster''',
                                                        ) ==
                                                        getJsonField(
                                                          FFAppState()
                                                              .userProfile,
                                                          r'''$.data.name''',
                                                        )) {
                                                      if (functions
                                                              .jsonToInt(
                                                                  getJsonField(
                                                                publishTaskWebPostReadResponse
                                                                    .jsonBody,
                                                                r'''$.data.docstatus''',
                                                              ))
                                                              .toString() ==
                                                          '0') {
                                                        _model.updateStatusPost =
                                                            await TaskerpageBackendGroup
                                                                .updateStatusPostCall
                                                                .call(
                                                          id: widget.id,
                                                          apiGlobalKey:
                                                              FFAppState()
                                                                  .apiKey,
                                                          draft: 1,
                                                        );
                                                        _shouldSetState = true;
                                                        if ((_model
                                                                .updateStatusPost
                                                                ?.succeeded ??
                                                            true)) {
                                                          context.pushNamed(
                                                              'MyPosts');
                                                        } else {
                                                          if (_shouldSetState)
                                                            setState(() {});
                                                          return;
                                                        }
                                                      } else {
                                                        context.pushNamed(
                                                          'Task-1',
                                                          queryParameters: {
                                                            'id':
                                                                serializeParam(
                                                              getJsonField(
                                                                publishTaskWebPostReadResponse
                                                                    .jsonBody,
                                                                r'''$.data.name''',
                                                              ).toString(),
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      }
                                                    } else {
                                                      _model.userRead =
                                                          await TaskerpageBackendGroup
                                                              .userProfileReadCall
                                                              .call(
                                                        id: getJsonField(
                                                          publishTaskWebPostReadResponse
                                                              .jsonBody,
                                                          r'''$.data.poster''',
                                                        ).toString(),
                                                        apiGlobalKey:
                                                            FFAppState().apiKey,
                                                      );
                                                      _shouldSetState = true;
                                                      _model.startChat22 =
                                                          await TaskerpageBackendGroup
                                                              .createChatCall
                                                              .call(
                                                        users:
                                                            '[\'${getJsonField(
                                                          (_model.userRead
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.data.user''',
                                                        ).toString()}\']',
                                                        type: 'Group',
                                                        task:
                                                            TaskerpageBackendGroup
                                                                .postReadCall
                                                                .id(
                                                                  publishTaskWebPostReadResponse
                                                                      .jsonBody,
                                                                )
                                                                ?.toString(),
                                                        apiGlobalKey:
                                                            FFAppState().apiKey,
                                                        roomName:
                                                            'G-(${getJsonField(
                                                          FFAppState()
                                                              .userProfile,
                                                          r'''$.data.name''',
                                                        ).toString()}-${getJsonField(
                                                          publishTaskWebPostReadResponse
                                                              .jsonBody,
                                                          r'''$.data.poster''',
                                                        ).toString()}) T (${getJsonField(
                                                          publishTaskWebPostReadResponse
                                                              .jsonBody,
                                                          r'''$.data.name''',
                                                        ).toString()})',
                                                      );
                                                      _shouldSetState = true;
                                                      if ((_model.startChat22
                                                              ?.succeeded ??
                                                          true)) {
                                                        context.pushNamed(
                                                          'chat',
                                                          pathParameters: {
                                                            'room':
                                                                serializeParam(
                                                              TaskerpageBackendGroup
                                                                  .createChatCall
                                                                  .room(
                                                                    (_model.startChat22
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )
                                                                  .toString(),
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      } else {
                                                        if (_shouldSetState)
                                                          setState(() {});
                                                        return;
                                                      }
                                                    }

                                                    if (_shouldSetState)
                                                      setState(() {});
                                                  },
                                                  child: Container(
                                                    width: 244.0,
                                                    height: 45.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'PUBLISH TASK',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lato',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16.0,
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
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'by clicking \"Publish task\", you agree to  ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color:
                                                            Color(0xFF494949),
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    32.0, 3.0, 32.0, 20.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
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
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return WebViewAware(
                                                          child:
                                                              GestureDetector(
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
                                                                  TermofServiceWidget(),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                  child: Text(
                                                    'Terms of Service',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          3.0, 0.0, 3.0, 0.0),
                                                  child: Text(
                                                    'and',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          color:
                                                              Color(0xFF3D3D3D),
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {},
                                                  child: Text(
                                                    'Privacy Policy',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
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
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
