import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/address_task_creation_web_widget.dart';
import '/components/calender_task_creation_web_widget.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/navigation_bar_widget.dart';
import '/components/rate_task_creation_web_widget.dart';
import '/components/task2_task_creation_web_widget.dart';
import '/components/task_task_creation_web_widget.dart';
import '/components/taskcreation_menue_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'taskertype_model.dart';
export 'taskertype_model.dart';

class TaskertypeWidget extends StatefulWidget {
  const TaskertypeWidget({
    super.key,
    required this.id,
  });

  final String? id;

  @override
  State<TaskertypeWidget> createState() => _TaskertypeWidgetState();
}

class _TaskertypeWidgetState extends State<TaskertypeWidget> {
  late TaskertypeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskertypeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.id != null && widget.id != '') {
        _model.apiResultl1j = await TaskerpageBackendGroup.postReadCall.call(
          id: widget.id,
          apiGlobalKey: FFAppState().apiKey,
        );
        if ((_model.apiResultl1j?.succeeded ?? true)) {
          setState(() {
            FFAppState().updateCreateTaskStruct(
              (e) => e
                ..updateTaskerType(
                  (e) => e
                    ..taskerGender = getJsonField(
                      (_model.apiResultl1j?.jsonBody ?? ''),
                      r'''$.data.tasker_gender''',
                    ).toString().toString()
                    ..taskerAgeRange = getJsonField(
                      (_model.apiResultl1j?.jsonBody ?? ''),
                      r'''$.data.tasker_age_range''',
                    ).toString().toString()
                    ..identified = functions.jsonIntToBoolean(getJsonField(
                      (_model.apiResultl1j?.jsonBody ?? ''),
                      r'''$.data.identified''',
                    )),
                ),
            );
          });
        }
      } else {
        context.pushNamed('Task-1');
      }

      setState(() {
        FFAppState().TaskerAge = '';
        FFAppState().TaskerType = '';
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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        drawer: Container(
          width: MediaQuery.sizeOf(context).width * 0.6,
          child: Drawer(
            elevation: 16.0,
            child: WebViewAware(
              child: wrapWithModel(
                model: _model.navigationBarModel1,
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
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
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
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
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
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
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
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
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
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                    tabletLandscape: false,
                  ))
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: 200.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: wrapWithModel(
                              model: _model.navigationBarModel2,
                              updateCallback: () => setState(() {}),
                              child: NavigationBarWidget(
                                currentPage: 'tasker_type1',
                                postId: widget.id,
                                closeDrawer: () async {
                                  if (scaffoldKey.currentState!.isDrawerOpen ||
                                      scaffoldKey
                                          .currentState!.isEndDrawerOpen) {
                                    Navigator.pop(context);
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                    tabletLandscape: false,
                  ))
                    VerticalDivider(
                      width: 1.0,
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).tertiary,
                    ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (responsiveVisibility(
                                        context: context,
                                        desktop: false,
                                      ))
                                        wrapWithModel(
                                          model: _model.headerModel,
                                          updateCallback: () => setState(() {}),
                                          child: HeaderWidget(
                                            openDrawer: () async {
                                              scaffoldKey.currentState!
                                                  .openEndDrawer();
                                            },
                                          ),
                                        ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            32.0, 20.0, 32.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            if (responsiveVisibility(
                                              context: context,
                                              desktop: false,
                                            ))
                                              wrapWithModel(
                                                model: _model
                                                    .taskcreationMenueModel,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: TaskcreationMenueWidget(
                                                  openDrawer: () async {
                                                    scaffoldKey.currentState!
                                                        .openDrawer();
                                                  },
                                                ),
                                              ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: Text(
                                                'Tasker type',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                            if (responsiveVisibility(
                                              context: context,
                                              desktop: false,
                                            ))
                                              Container(
                                                width: 45.0,
                                                height: 45.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            32.0, 38.0, 32.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Tasker gender',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            32.0, 15.0, 32.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  setState(() {
                                                    FFAppState()
                                                        .updateCreateTaskStruct(
                                                      (e) => e
                                                        ..updateTaskerType(
                                                          (e) => e
                                                            ..taskerGender =
                                                                'Male',
                                                        ),
                                                    );
                                                  });
                                                },
                                                child: Container(
                                                  width: 155.0,
                                                  height: 36.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.0),
                                                    border: Border.all(
                                                      color: FFAppState()
                                                                  .createTask
                                                                  .taskerType
                                                                  .taskerGender ==
                                                              'Male'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      width: 1.3,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(15.0, 0.0,
                                                                15.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Male',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lato',
                                                                color: FFAppState()
                                                                            .createTask
                                                                            .taskerType
                                                                            .taskerGender ==
                                                                        'Male'
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  setState(() {
                                                    FFAppState()
                                                        .updateCreateTaskStruct(
                                                      (e) => e
                                                        ..updateTaskerType(
                                                          (e) => e
                                                            ..taskerGender =
                                                                'Female',
                                                        ),
                                                    );
                                                  });
                                                },
                                                child: Container(
                                                  width: 155.0,
                                                  height: 36.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.0),
                                                    border: Border.all(
                                                      color: FFAppState()
                                                                  .createTask
                                                                  .taskerType
                                                                  .taskerGender ==
                                                              'Female'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      width: 1.3,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(15.0, 0.0,
                                                                15.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Female',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lato',
                                                                color: FFAppState()
                                                                            .createTask
                                                                            .taskerType
                                                                            .taskerGender ==
                                                                        'Female'
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 12.0)),
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
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  setState(() {
                                                    FFAppState()
                                                        .updateCreateTaskStruct(
                                                      (e) => e
                                                        ..updateTaskerType(
                                                          (e) => e
                                                            ..taskerGender =
                                                                'Doesn\'t matter',
                                                        ),
                                                    );
                                                  });
                                                },
                                                child: Container(
                                                  width: 155.0,
                                                  height: 36.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.0),
                                                    border: Border.all(
                                                      color: FFAppState()
                                                                  .createTask
                                                                  .taskerType
                                                                  .taskerGender ==
                                                              'Dosn\'t  matter'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      width: 1.3,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(15.0, 0.0,
                                                                15.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Doesn\'t matter',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lato',
                                                                color: FFAppState()
                                                                            .createTask
                                                                            .taskerType
                                                                            .taskerGender ==
                                                                        'Dosn\'t  matter'
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: 155.0,
                                                height: 36.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.0),
                                                  border: Border.all(
                                                    color: Colors.white,
                                                    width: 1.3,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 12.0)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            32.0, 16.0, 32.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Tasker age',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            32.0, 15.0, 32.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  setState(() {
                                                    FFAppState()
                                                        .updateCreateTaskStruct(
                                                      (e) => e
                                                        ..updateTaskerType(
                                                          (e) => e
                                                            ..taskerAgeRange =
                                                                '<20',
                                                        ),
                                                    );
                                                  });
                                                },
                                                child: Container(
                                                  width: 155.0,
                                                  height: 36.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.0),
                                                    border: Border.all(
                                                      color: FFAppState()
                                                                  .createTask
                                                                  .taskerType
                                                                  .taskerAgeRange ==
                                                              '<20'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      width: 1.3,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(15.0, 0.0,
                                                                15.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          '<20',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lato',
                                                                color: FFAppState()
                                                                            .createTask
                                                                            .taskerType
                                                                            .taskerAgeRange ==
                                                                        '<20'
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  setState(() {
                                                    FFAppState()
                                                        .updateCreateTaskStruct(
                                                      (e) => e
                                                        ..updateTaskerType(
                                                          (e) => e
                                                            ..taskerAgeRange =
                                                                '20-40',
                                                        ),
                                                    );
                                                  });
                                                },
                                                child: Container(
                                                  width: 155.0,
                                                  height: 36.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.0),
                                                    border: Border.all(
                                                      color: FFAppState()
                                                                  .createTask
                                                                  .taskerType
                                                                  .taskerAgeRange ==
                                                              '20-40'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      width: 1.3,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(15.0, 0.0,
                                                                15.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          '20-40',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lato',
                                                                color: FFAppState()
                                                                            .createTask
                                                                            .taskerType
                                                                            .taskerAgeRange ==
                                                                        '20-40'
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 12.0)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            32.0, 8.0, 32.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  setState(() {
                                                    FFAppState()
                                                        .updateCreateTaskStruct(
                                                      (e) => e
                                                        ..updateTaskerType(
                                                          (e) => e
                                                            ..taskerAgeRange =
                                                                '40>',
                                                        ),
                                                    );
                                                  });
                                                },
                                                child: Container(
                                                  width: 155.0,
                                                  height: 36.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.0),
                                                    border: Border.all(
                                                      color: FFAppState()
                                                                  .createTask
                                                                  .taskerType
                                                                  .taskerAgeRange ==
                                                              '40>'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      width: 1.3,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(15.0, 0.0,
                                                                15.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          '40>',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lato',
                                                                color: FFAppState()
                                                                            .createTask
                                                                            .taskerType
                                                                            .taskerAgeRange ==
                                                                        '40>'
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  setState(() {
                                                    FFAppState()
                                                        .updateCreateTaskStruct(
                                                      (e) => e
                                                        ..updateTaskerType(
                                                          (e) => e
                                                            ..taskerAgeRange =
                                                                'Doesn\'t matter',
                                                        ),
                                                    );
                                                  });
                                                },
                                                child: Container(
                                                  width: 155.0,
                                                  height: 36.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.0),
                                                    border: Border.all(
                                                      color: FFAppState()
                                                                  .createTask
                                                                  .taskerType
                                                                  .taskerAgeRange ==
                                                              'Doesn\'t matter'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      width: 1.3,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(15.0, 0.0,
                                                                15.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Doesn\'t matter',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lato',
                                                                color: FFAppState()
                                                                            .createTask
                                                                            .taskerType
                                                                            .taskerAgeRange ==
                                                                        'Doesn\'t matter'
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 12.0)),
                                        ),
                                      ),
                                      Divider(
                                        height: 32.0,
                                        thickness: 1.0,
                                        indent: 32.0,
                                        endIndent: 32.0,
                                        color: Color(0xFFDEDEDE),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            32.0, 0.0, 32.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Identified',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Lato',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Switch.adaptive(
                                                value: _model.switchValue ??=
                                                    FFAppState()
                                                        .createTask
                                                        .taskerType
                                                        .identified,
                                                onChanged: (newValue) async {
                                                  setState(() => _model
                                                      .switchValue = newValue!);
                                                  if (newValue!) {
                                                    setState(() {
                                                      FFAppState()
                                                          .updateCreateTaskStruct(
                                                        (e) => e
                                                          ..updateTaskerType(
                                                            (e) => e
                                                              ..identified =
                                                                  true,
                                                          ),
                                                      );
                                                    });
                                                  } else {
                                                    setState(() {
                                                      FFAppState()
                                                          .updateCreateTaskStruct(
                                                        (e) => e
                                                          ..updateTaskerType(
                                                            (e) => e
                                                              ..identified =
                                                                  false,
                                                          ),
                                                      );
                                                    });
                                                  }
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                activeTrackColor:
                                                    Color(0xFFFAD1C6),
                                                inactiveTrackColor:
                                                    Color(0xFFECECEC),
                                                inactiveThumbColor:
                                                    Color(0xFF3D3D3D),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 5.0,
                                            color: () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  kBreakpointSmall) {
                                                return Color(0x33000000);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointMedium) {
                                                return Color(0x33000000);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointLarge) {
                                                return Colors.transparent;
                                              } else {
                                                return Colors.transparent;
                                              }
                                            }(),
                                            offset: Offset(5.0, 5.0),
                                            spreadRadius: 10.0,
                                          )
                                        ],
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            32.0, 0.0, 32.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                var _shouldSetState = false;
                                                _model.updateTAskerType =
                                                    await TaskerpageBackendGroup
                                                        .updateTaskerTypeCall
                                                        .call(
                                                  id: widget.id,
                                                  taskerGender: FFAppState()
                                                      .createTask
                                                      .taskerType
                                                      .taskerGender,
                                                  taskerAgeRange: FFAppState()
                                                      .createTask
                                                      .taskerType
                                                      .taskerAgeRange,
                                                  identified: functions
                                                      .booltoInt(FFAppState()
                                                          .createTask
                                                          .taskerType
                                                          .identified),
                                                  apiGlobalKey:
                                                      FFAppState().apiKey,
                                                );
                                                _shouldSetState = true;
                                                if ((_model.updateTAskerType
                                                        ?.succeeded ??
                                                    true)) {
                                                  context.pushNamed(
                                                    'Taskertype2',
                                                    queryParameters: {
                                                      'id': serializeParam(
                                                        widget.id,
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                } else {
                                                  if (_shouldSetState)
                                                    setState(() {});
                                                  return;
                                                }

                                                if (_shouldSetState)
                                                  setState(() {});
                                              },
                                              child: Container(
                                                width: 104.0,
                                                height: 36.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          1.5),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Next',
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
                                                                fontSize: 14.0,
                                                              ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Icon(
                                                        Icons
                                                            .arrow_forward_ios_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 10.0,
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
                                  ],
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
                    VerticalDivider(
                      width: 1.0,
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).tertiary,
                    ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                    tabletLandscape: false,
                  ))
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFF9F9F9),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    32.0, 30.0, 32.0, 30.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      wrapWithModel(
                                        model: _model.taskTaskCreationWebModel,
                                        updateCallback: () => setState(() {}),
                                        child: TaskTaskCreationWebWidget(),
                                      ),
                                      wrapWithModel(
                                        model: _model.task2TaskCreationWebModel,
                                        updateCallback: () => setState(() {}),
                                        child: Task2TaskCreationWebWidget(),
                                      ),
                                      wrapWithModel(
                                        model:
                                            _model.addressTaskCreationWebModel,
                                        updateCallback: () => setState(() {}),
                                        child: AddressTaskCreationWebWidget(),
                                      ),
                                      wrapWithModel(
                                        model:
                                            _model.calenderTaskCreationWebModel,
                                        updateCallback: () => setState(() {}),
                                        child: CalenderTaskCreationWebWidget(
                                          parameter1: getJsonField(
                                            (_model.apiResultl1j?.jsonBody ??
                                                ''),
                                            r'''$.data.repeat_type''',
                                          ),
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.rateTaskCreationWebModel,
                                        updateCallback: () => setState(() {}),
                                        child: RateTaskCreationWebWidget(),
                                      ),
                                    ].divide(SizedBox(height: 8.0)),
                                  ),
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
        ),
      ),
    );
  }
}
