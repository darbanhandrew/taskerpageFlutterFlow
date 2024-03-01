import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/address_task_creation_web_widget.dart';
import '/components/button_next_widget.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/navigation_bar_widget.dart';
import '/components/task2_task_creation_web_widget.dart';
import '/components/task_task_creation_web_widget.dart';
import '/components/taskcreation_menue_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'taskstime_model.dart';
export 'taskstime_model.dart';

class TaskstimeWidget extends StatefulWidget {
  const TaskstimeWidget({
    super.key,
    required this.id,
  });

  final String? id;

  @override
  State<TaskstimeWidget> createState() => _TaskstimeWidgetState();
}

class _TaskstimeWidgetState extends State<TaskstimeWidget> {
  late TaskstimeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskstimeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.id != null && widget.id != '') {
        _model.apiResult27899 = await TaskerpageBackendGroup.postReadCall.call(
          id: widget.id,
          apiGlobalKey: FFAppState().apiKey,
        );
        if ((_model.apiResult27899?.succeeded ?? true)) {
          setState(() {
            FFAppState().updateCreateTaskStruct(
              (e) => e
                ..updateTaskSchedule(
                  (e) => e
                    ..updateRepeatableTaskDetails(
                      (e) => e
                        ..repeatType = getJsonField(
                          (_model.apiResult27899?.jsonBody ?? ''),
                          r'''$.data.repeat_type''',
                        ).toString().toString(),
                    ),
                ),
            );
          });
        } else {
          return;
        }
      } else {
        context.pushNamed(
          'Task-1',
          queryParameters: {
            'id': serializeParam(
              widget.id,
              ParamType.String,
            ),
          }.withoutNulls,
        );
      }
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
                                currentPage: 'calender',
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
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
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
                                                'Select task\'s time',
                                                textAlign: TextAlign.center,
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
                                            0.0,
                                            valueOrDefault<double>(
                                              () {
                                                if (MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall) {
                                                  return 137.0;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointMedium) {
                                                  return 137.0;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointLarge) {
                                                  return 192.0;
                                                } else {
                                                  return 192.0;
                                                }
                                              }(),
                                              0.0,
                                            ),
                                            0.0,
                                            0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final tasksTime =
                                                FFAppState().tasksTime.toList();
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  tasksTime.length,
                                                  (tasksTimeIndex) {
                                                final tasksTimeItem =
                                                    tasksTime[tasksTimeIndex];
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
                                                    setState(() {
                                                      FFAppState()
                                                          .updateCreateTaskStruct(
                                                        (e) => e
                                                          ..updateTaskSchedule(
                                                            (e) => e
                                                              ..updateRepeatableTaskDetails(
                                                                (e) => e
                                                                  ..repeatType =
                                                                      tasksTimeItem,
                                                              ),
                                                          ),
                                                      );
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 217.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2.0),
                                                      border: Border.all(
                                                        color: tasksTimeItem ==
                                                                FFAppState()
                                                                    .createTask
                                                                    .taskSchedule
                                                                    .repeatableTaskDetails
                                                                    .repeatType
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primary
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                        width: 1.3,
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
                                                          tasksTimeItem,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lato',
                                                                color: tasksTimeItem ==
                                                                        FFAppState()
                                                                            .createTask
                                                                            .taskSchedule
                                                                            .repeatableTaskDetails
                                                                            .repeatType
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
                                                );
                                              }).divide(SizedBox(height: 6.0)),
                                            );
                                          },
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
                                                _model.updateTasksTime =
                                                    await TaskerpageBackendGroup
                                                        .updateTasksTimeCall
                                                        .call(
                                                  repeatType: FFAppState()
                                                      .createTask
                                                      .taskSchedule
                                                      .repeatableTaskDetails
                                                      .repeatType,
                                                  id: widget.id,
                                                  apiGlobalKey:
                                                      FFAppState().apiKey,
                                                );
                                                _shouldSetState = true;
                                                if ((_model.updateTasksTime
                                                        ?.succeeded ??
                                                    true)) {
                                                  context.pushNamed(
                                                    'Calendar',
                                                    queryParameters: {
                                                      'id': serializeParam(
                                                        getJsonField(
                                                          (_model.updateTasksTime
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.data.name''',
                                                        ).toString(),
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
                                              child: wrapWithModel(
                                                model: _model.buttonNextModel,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: ButtonNextWidget(
                                                  text: 'Next',
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
