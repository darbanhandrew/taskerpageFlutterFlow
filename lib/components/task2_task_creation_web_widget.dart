import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'task2_task_creation_web_model.dart';
export 'task2_task_creation_web_model.dart';

class Task2TaskCreationWebWidget extends StatefulWidget {
  const Task2TaskCreationWebWidget({super.key});

  @override
  State<Task2TaskCreationWebWidget> createState() =>
      _Task2TaskCreationWebWidgetState();
}

class _Task2TaskCreationWebWidgetState
    extends State<Task2TaskCreationWebWidget> {
  late Task2TaskCreationWebModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Task2TaskCreationWebModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            width: 100.0,
            height: 223.0,
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
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Skills: ',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Lato',
                              color: Color(0xFF292929),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Container(
                        height: 22.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFDEDEDE),
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              13.0, 0.0, 23.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Languages',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ].divide(SizedBox(width: 15.0)),
                  ),
                  Divider(
                    height: 32.0,
                    thickness: 1.0,
                    color: Color(0xFFDEDEDE),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Skill level:',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Lato',
                              color: Color(0xFF292929),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Container(
                        height: 22.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFDEDEDE),
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              13.0, 0.0, 23.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Languages',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ].divide(SizedBox(width: 15.0)),
                  ),
                  Divider(
                    height: 32.0,
                    thickness: 1.0,
                    color: Color(0xFFDEDEDE),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Languages:',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Lato',
                              color: Color(0xFF292929),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Container(
                        height: 22.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFDEDEDE),
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              13.0, 0.0, 23.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Languages',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ].divide(SizedBox(width: 15.0)),
                  ),
                  Divider(
                    height: 32.0,
                    thickness: 1.0,
                    color: Color(0xFFDEDEDE),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Description:',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Lato',
                              color: Color(0xFF292929),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Text(
                        'Description:',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Lato',
                              color: Color(0xFF292929),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ].divide(SizedBox(width: 15.0)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
