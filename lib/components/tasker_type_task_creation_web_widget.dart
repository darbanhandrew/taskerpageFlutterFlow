import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tasker_type_task_creation_web_model.dart';
export 'tasker_type_task_creation_web_model.dart';

class TaskerTypeTaskCreationWebWidget extends StatefulWidget {
  const TaskerTypeTaskCreationWebWidget({super.key});

  @override
  State<TaskerTypeTaskCreationWebWidget> createState() =>
      _TaskerTypeTaskCreationWebWidgetState();
}

class _TaskerTypeTaskCreationWebWidgetState
    extends State<TaskerTypeTaskCreationWebWidget> {
  late TaskerTypeTaskCreationWebModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskerTypeTaskCreationWebModel());

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
            height: 172.0,
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
                        'Tasker gender:',
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
                        'Tasker age:',
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
                                'Identified',
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
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
