import '/backend/api_requests/api_calls.dart';
import '/components/header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'taskertype_model.dart';
export 'taskertype_model.dart';

class TaskertypeWidget extends StatefulWidget {
  const TaskertypeWidget({Key? key}) : super(key: key);

  @override
  _TaskertypeWidgetState createState() => _TaskertypeWidgetState();
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
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 32.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Tasker type',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 16.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Tasker gender',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 15.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                FFAppState().TaskerType = 'Male';
                              });
                            },
                            child: Container(
                              width: 155.0,
                              height: 41.0,
                              decoration: BoxDecoration(
                                color: FFAppState().TaskerType == 'Male'
                                    ? Color(0xFF5450E2)
                                    : Color(0x00000000),
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                  color: FFAppState().TaskerType == 'Male'
                                      ? Color(0xFF5450E2)
                                      : Color(0xFF5E5D5D),
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 15.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Male',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: FFAppState().TaskerType ==
                                                    'Male'
                                                ? Colors.white
                                                : Color(0xFF5E5D5D),
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                FFAppState().TaskerType = 'Female';
                              });
                            },
                            child: Container(
                              width: 155.0,
                              height: 41.0,
                              decoration: BoxDecoration(
                                color: FFAppState().TaskerType == 'Female'
                                    ? Color(0xFF5450E2)
                                    : Color(0x00000000),
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                  color: FFAppState().TaskerType == 'Female'
                                      ? Color(0xFF5450E2)
                                      : Color(0xFF5E5D5D),
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 15.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Female',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: FFAppState().TaskerType ==
                                                    'Female'
                                                ? Colors.white
                                                : Color(0xFF5E5D5D),
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w500,
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
                          EdgeInsetsDirectional.fromSTEB(32.0, 8.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                FFAppState().TaskerType = 'Doesn\'t matter';
                              });
                            },
                            child: Container(
                              width: 155.0,
                              height: 41.0,
                              decoration: BoxDecoration(
                                color:
                                    FFAppState().TaskerType == 'Doesn\'t matter'
                                        ? Color(0xFF5450E2)
                                        : Color(0x00000000),
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                  color: FFAppState().TaskerType ==
                                          'Doesn\'t matter'
                                      ? Color(0xFF5450E2)
                                      : Color(0xFF5E5D5D),
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 15.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Doesn\'t matter',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: FFAppState().TaskerType ==
                                                    'Doesn\'t matter'
                                                ? Colors.white
                                                : Color(0xFF5E5D5D),
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w500,
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
                          EdgeInsetsDirectional.fromSTEB(32.0, 16.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Tasker age',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 15.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                FFAppState().TaskerAge = '<20';
                              });
                            },
                            child: Container(
                              width: 155.0,
                              height: 41.0,
                              decoration: BoxDecoration(
                                color: FFAppState().TaskerAge == '<20'
                                    ? Color(0xFF5450E2)
                                    : Color(0x00000000),
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                  color: FFAppState().TaskerAge == '<20'
                                      ? Color(0xFF5450E2)
                                      : Color(0xFF5E5D5D),
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 15.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '<20',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color:
                                                FFAppState().TaskerAge == '<20'
                                                    ? Colors.white
                                                    : Color(0xFF5E5D5D),
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                FFAppState().TaskerAge = '20-40';
                              });
                            },
                            child: Container(
                              width: 155.0,
                              height: 41.0,
                              decoration: BoxDecoration(
                                color: FFAppState().TaskerAge == '20-40'
                                    ? Color(0xFF5450E2)
                                    : Color(0x00000000),
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                  color: FFAppState().TaskerAge == '20-40'
                                      ? Color(0xFF5450E2)
                                      : Color(0xFF5E5D5D),
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 15.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '20-40',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: FFAppState().TaskerAge ==
                                                    '20-40'
                                                ? Colors.white
                                                : Color(0xFF5E5D5D),
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w500,
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
                          EdgeInsetsDirectional.fromSTEB(32.0, 8.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                FFAppState().TaskerAge = '40>';
                              });
                            },
                            child: Container(
                              width: 155.0,
                              height: 41.0,
                              decoration: BoxDecoration(
                                color: FFAppState().TaskerAge == '40>'
                                    ? Color(0xFF5450E2)
                                    : Color(0x00000000),
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                  color: FFAppState().TaskerAge == '40>'
                                      ? Color(0xFF5450E2)
                                      : Color(0xFF5E5D5D),
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 15.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '40>',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color:
                                                FFAppState().TaskerAge == '40>'
                                                    ? Colors.white
                                                    : Color(0xFF5E5D5D),
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                FFAppState().TaskerAge = 'Doesn\'t matter';
                              });
                            },
                            child: Container(
                              width: 155.0,
                              height: 41.0,
                              decoration: BoxDecoration(
                                color:
                                    FFAppState().TaskerAge == 'Doesn\'t matter'
                                        ? Color(0xFF5450E2)
                                        : Color(0x00000000),
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                  color: FFAppState().TaskerAge ==
                                          'Doesn\'t matter'
                                      ? Color(0xFF5450E2)
                                      : Color(0xFF5E5D5D),
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 15.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Doesn\'t matter',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: FFAppState().TaskerAge ==
                                                    'Doesn\'t matter'
                                                ? Colors.white
                                                : Color(0xFF5E5D5D),
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w500,
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
                    Divider(
                      height: 32.0,
                      thickness: 1.0,
                      indent: 32.0,
                      endIndent: 32.0,
                      color: Color(0xFFDEDEDE),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Identified',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Switch.adaptive(
                              value: _model.switchValue ??= true,
                              onChanged: (newValue) async {
                                setState(() => _model.switchValue = newValue!);
                                if (newValue!) {
                                  setState(() {
                                    FFAppState().Identified = true;
                                  });
                                } else {
                                  setState(() {
                                    FFAppState().Identified = false;
                                  });
                                }
                              },
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor: Color(0xFFFAD1C6),
                              inactiveTrackColor: Color(0xFFECECEC),
                              inactiveThumbColor: Color(0xFF3D3D3D),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 32.0,
                      thickness: 1.0,
                      indent: 32.0,
                      endIndent: 32.0,
                      color: Color(0xFFDEDEDE),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5.0,
                          color: Color(0x33000000),
                          offset: Offset(5.0, 5.0),
                          spreadRadius: 10.0,
                        )
                      ],
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              var _shouldSetState = false;
                              _model.apiResultv2j = await TaskerpageBackendGroup
                                  .updatePostCall
                                  .call(
                                id: getJsonField(
                                  FFAppState().userProfile,
                                  r'''$.id''',
                                ),
                                apiGlobalKey: FFAppState().apiKey,
                                identified: FFAppState().Identified,
                              );
                              _shouldSetState = true;
                              if ((_model.apiResultv2j?.succeeded ?? true)) {
                                context.pushNamed('Select_Address');
                              } else {
                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              if (_shouldSetState) setState(() {});
                            },
                            child: Container(
                              width: 104.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF5450E2),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Next',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lato',
                                          color: Colors.white,
                                          fontSize: 14.0,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.white,
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
    );
  }
}
