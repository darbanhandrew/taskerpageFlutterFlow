import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filter_web_model.dart';
export 'filter_web_model.dart';

class FilterWebWidget extends StatefulWidget {
  const FilterWebWidget({Key? key}) : super(key: key);

  @override
  _FilterWebWidgetState createState() => _FilterWebWidgetState();
}

class _FilterWebWidgetState extends State<FilterWebWidget> {
  late FilterWebModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterWebModel());

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

    return Container(
      width: double.infinity,
      height: 75.8,
      decoration: BoxDecoration(
        color: Color(0xFFF9F9F9),
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(0.0, 2.0),
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(83.0, 0.0, 75.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 158.0,
              height: 36.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4.0,
                    color: Color(0x33000000),
                    offset: Offset(0.0, 0.0),
                  )
                ],
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(6.4, 0.0, 6.4, 0.0),
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
                        if (_model.taskORtasker == 'Task') {
                          return;
                        }

                        context.pushNamed('TaskList');
                      },
                      child: Container(
                        width: 72.4,
                        height: 25.0,
                        decoration: BoxDecoration(
                          color: _model.taskORtasker == 'Task'
                              ? FlutterFlowTheme.of(context).primary
                              : Colors.white,
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Task',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: _model.taskORtasker == 'Task'
                                        ? Colors.white
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (_model.taskORtasker == 'Tasker') {
                          return;
                        }

                        context.pushNamed('TaskerList');
                      },
                      child: Container(
                        width: 72.4,
                        height: 25.0,
                        decoration: BoxDecoration(
                          color: _model.taskORtasker == 'Tasker'
                              ? FlutterFlowTheme.of(context).primary
                              : Colors.white,
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Tasker',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: _model.taskORtasker == 'Tasker'
                                        ? Colors.white
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w500,
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
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x33000000),
                            offset: Offset(0.0, 0.0),
                            spreadRadius: 1.0,
                          )
                        ],
                      ),
                      child: FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController1 ??=
                            FormFieldController<String>(null),
                        options: ['Option 1'],
                        onChanged: (val) =>
                            setState(() => _model.dropDownValue1 = val),
                        width: 129.0,
                        height: 36.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Lato',
                                  color: FlutterFlowTheme.of(context).alternate,
                                  fontSize: 14.0,
                                ),
                        hintText: 'Location',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 0.0,
                        borderColor: Colors.white,
                        borderWidth: 0.0,
                        borderRadius: 1.0,
                        margin: EdgeInsetsDirectional.fromSTEB(
                            11.0, 4.0, 10.0, 4.0),
                        hidesUnderline: true,
                        isSearchable: false,
                        isMultiSelect: false,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x33000000),
                            offset: Offset(0.0, 0.0),
                            spreadRadius: 1.0,
                          )
                        ],
                      ),
                      child: FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController2 ??=
                            FormFieldController<String>(null),
                        options: ['Option 1'],
                        onChanged: (val) =>
                            setState(() => _model.dropDownValue2 = val),
                        width: 129.0,
                        height: 36.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Lato',
                                  color: FlutterFlowTheme.of(context).alternate,
                                  fontSize: 14.0,
                                ),
                        hintText: 'Location',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 0.0,
                        borderColor: Colors.white,
                        borderWidth: 0.0,
                        borderRadius: 1.0,
                        margin: EdgeInsetsDirectional.fromSTEB(
                            11.0, 4.0, 10.0, 4.0),
                        hidesUnderline: true,
                        isSearchable: false,
                        isMultiSelect: false,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x33000000),
                            offset: Offset(0.0, 0.0),
                            spreadRadius: 1.0,
                          )
                        ],
                      ),
                      child: FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController3 ??=
                            FormFieldController<String>(null),
                        options: ['Option 1'],
                        onChanged: (val) =>
                            setState(() => _model.dropDownValue3 = val),
                        width: 129.0,
                        height: 36.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Lato',
                                  color: FlutterFlowTheme.of(context).alternate,
                                  fontSize: 14.0,
                                ),
                        hintText: 'Location',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 0.0,
                        borderColor: Colors.white,
                        borderWidth: 0.0,
                        borderRadius: 1.0,
                        margin: EdgeInsetsDirectional.fromSTEB(
                            11.0, 4.0, 10.0, 4.0),
                        hidesUnderline: true,
                        isSearchable: false,
                        isMultiSelect: false,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x33000000),
                            offset: Offset(0.0, 0.0),
                            spreadRadius: 1.0,
                          )
                        ],
                      ),
                      child: FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController4 ??=
                            FormFieldController<String>(null),
                        options: ['Option 1'],
                        onChanged: (val) =>
                            setState(() => _model.dropDownValue4 = val),
                        width: 129.0,
                        height: 36.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Lato',
                                  color: FlutterFlowTheme.of(context).alternate,
                                  fontSize: 14.0,
                                ),
                        hintText: 'Location',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 0.0,
                        borderColor: Colors.white,
                        borderWidth: 0.0,
                        borderRadius: 1.0,
                        margin: EdgeInsetsDirectional.fromSTEB(
                            11.0, 4.0, 10.0, 4.0),
                        hidesUnderline: true,
                        isSearchable: false,
                        isMultiSelect: false,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x33000000),
                            offset: Offset(0.0, 0.0),
                            spreadRadius: 1.0,
                          )
                        ],
                      ),
                      child: FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController5 ??=
                            FormFieldController<String>(null),
                        options: ['Option 1'],
                        onChanged: (val) =>
                            setState(() => _model.dropDownValue5 = val),
                        width: 129.0,
                        height: 36.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Lato',
                                  color: FlutterFlowTheme.of(context).alternate,
                                  fontSize: 14.0,
                                ),
                        hintText: 'Location',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 0.0,
                        borderColor: Colors.white,
                        borderWidth: 0.0,
                        borderRadius: 1.0,
                        margin: EdgeInsetsDirectional.fromSTEB(
                            11.0, 4.0, 10.0, 4.0),
                        hidesUnderline: true,
                        isSearchable: false,
                        isMultiSelect: false,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x33000000),
                            offset: Offset(0.0, 0.0),
                            spreadRadius: 1.0,
                          )
                        ],
                      ),
                      child: FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController6 ??=
                            FormFieldController<String>(null),
                        options: ['Option 1'],
                        onChanged: (val) =>
                            setState(() => _model.dropDownValue6 = val),
                        width: 129.0,
                        height: 36.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Lato',
                                  color: FlutterFlowTheme.of(context).alternate,
                                  fontSize: 14.0,
                                ),
                        hintText: 'Location',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 0.0,
                        borderColor: Colors.white,
                        borderWidth: 0.0,
                        borderRadius: 1.0,
                        margin: EdgeInsetsDirectional.fromSTEB(
                            11.0, 4.0, 10.0, 4.0),
                        hidesUnderline: true,
                        isSearchable: false,
                        isMultiSelect: false,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Clear',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: Color(0xFF494949),
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ].divide(SizedBox(width: 24.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
