import '/backend/schema/structs/index.dart';
import '/components/button_next_widget.dart';
import '/components/header_widget.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'taskertype2_model.dart';
export 'taskertype2_model.dart';

class Taskertype2Widget extends StatefulWidget {
  const Taskertype2Widget({Key? key}) : super(key: key);

  @override
  _Taskertype2WidgetState createState() => _Taskertype2WidgetState();
}

class _Taskertype2WidgetState extends State<Taskertype2Widget> {
  late Taskertype2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Taskertype2Model());

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
                                  color: Color(0xFF292929),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          32.0, 35.0, 32.0, 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: Text(
                              'Years of Experience',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          Container(
                            width: 60.0,
                            height: 41.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(5.0),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: Color(0xFF5E5D5D),
                                width: 1.0,
                              ),
                            ),
                            child: FlutterFlowCountController(
                              decrementIconBuilder: (enabled) => Icon(
                                Icons.keyboard_arrow_up_rounded,
                                color: enabled
                                    ? Color(0xFFF06543)
                                    : FlutterFlowTheme.of(context).alternate,
                                size: 15.0,
                              ),
                              incrementIconBuilder: (enabled) => Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: enabled
                                    ? Color(0xFFF06543)
                                    : FlutterFlowTheme.of(context).alternate,
                                size: 15.0,
                              ),
                              countBuilder: (count) => Text(
                                count.toString(),
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Lato',
                                      fontSize: 13.0,
                                    ),
                              ),
                              count: _model.countControllerValue ??= 2,
                              updateCount: (count) async {
                                setState(
                                    () => _model.countControllerValue = count);
                                setState(() {
                                  FFAppState().updateTaskCreationStruct(
                                    (e) => e
                                      ..yearsofExperience =
                                          _model.countControllerValue,
                                  );
                                });
                              },
                              stepSize: 1,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 5.0, 0.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Insurance',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: Colors.black,
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
                                    FFAppState().updateTaskCreationStruct(
                                      (e) => e..insurance = true,
                                    );
                                  });
                                } else {
                                  setState(() {
                                    FFAppState().updateTaskCreationStruct(
                                      (e) => e..insurance = false,
                                    );
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Driver‘s license',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: Colors.black,
                                  fontSize: 15.0,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: GridView(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16.0,
                                mainAxisSpacing: 8.0,
                                childAspectRatio: 4.0,
                              ),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      FFAppState().updateTaskCreationStruct(
                                        (e) => e..driverslicense = 'CAR',
                                      );
                                    });
                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FFAppState()
                                                  .TaskCreation
                                                  .driverslicense ==
                                              'CAR'
                                          ? Color(0xFF5450E2)
                                          : Color(0x00000000),
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(
                                        color: FFAppState()
                                                    .TaskCreation
                                                    .driverslicense ==
                                                'CAR'
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Car',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lato',
                                                  color: FFAppState()
                                                              .TaskCreation
                                                              .driverslicense ==
                                                          'CAR'
                                                      ? Color(0xFFF6F6F6)
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
                                      FFAppState().updateTaskCreationStruct(
                                        (e) => e..driverslicense = 'TRUCK',
                                      );
                                    });
                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FFAppState()
                                                  .TaskCreation
                                                  .driverslicense ==
                                              'TRUCK'
                                          ? Color(0xFF5450E2)
                                          : Color(0x00000000),
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(
                                        color: FFAppState()
                                                    .TaskCreation
                                                    .driverslicense ==
                                                'TRUCK'
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Truck',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lato',
                                                  color: FFAppState()
                                                              .TaskCreation
                                                              .driverslicense ==
                                                          'TRUCK'
                                                      ? Color(0xFFF6F6F6)
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.safePop();
                            },
                            child: Container(
                              width: 96.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: Color(0x005450E2),
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                  color: Color(0xFF5450E2),
                                  width: 1.0,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 5.0, 0.0),
                                    child: Icon(
                                      Icons.arrow_back_ios_rounded,
                                      color: Color(0xFF5450E2),
                                      size: 10.0,
                                    ),
                                  ),
                                  Text(
                                    'Back',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lato',
                                          color: Color(0xFF5450E2),
                                          fontSize: 14.0,
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
                              context.pushNamed('Taskertype3');
                            },
                            child: wrapWithModel(
                              model: _model.buttonNextModel,
                              updateCallback: () => setState(() {}),
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
    );
  }
}
