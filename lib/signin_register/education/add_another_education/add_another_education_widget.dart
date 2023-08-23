import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/header_widget.dart';
import '/components/view_certificate_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_another_education_model.dart';
export 'add_another_education_model.dart';

class AddAnotherEducationWidget extends StatefulWidget {
  const AddAnotherEducationWidget({
    Key? key,
    bool? isSignUp,
    this.education,
  })  : this.isSignUp = isSignUp ?? false,
        super(key: key);

  final bool isSignUp;
  final dynamic education;

  @override
  _AddAnotherEducationWidgetState createState() =>
      _AddAnotherEducationWidgetState();
}

class _AddAnotherEducationWidgetState extends State<AddAnotherEducationWidget> {
  late AddAnotherEducationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddAnotherEducationModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().AddCertificateForEducation = false;
        FFAppState().updateUserInformationStruct(
          (e) => e..educationType = null,
        );
      });
      if (widget.education != null) {
        setState(() {
          _model.certificateUrl = getJsonField(
            widget.education,
            r'''$.certificate_url''',
          ).toString().toString();
        });
      } else {
        return;
      }
    });

    _model.textController1 ??= TextEditingController(
        text: functions.jsonToString(getJsonField(
      widget.education,
      r'''$.title''',
    )));
    _model.textController2 ??= TextEditingController(
        text: functions.jsonToString(getJsonField(
      widget.education,
      r'''$.school_title''',
    )));
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
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            wrapWithModel(
                              model: _model.headerModel,
                              updateCallback: () => setState(() {}),
                              child: HeaderWidget(
                                openDrawer: () async {},
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 32.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.education != null
                                    ? 'Edit your education'
                                    : 'Add trainings and education you participated',
                                textAlign: TextAlign.center,
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 25.0, 32.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
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
                                          FFAppState()
                                              .updateUserInformationStruct(
                                            (e) => e..educationType = 'Degree',
                                          );
                                        });
                                      },
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: (FFAppState()
                                                          .UserInformation
                                                          .educationType ==
                                                      'Degree') ||
                                                  ((FFAppState()
                                                                  .UserInformation
                                                                  .educationType ==
                                                              null ||
                                                          FFAppState()
                                                                  .UserInformation
                                                                  .educationType ==
                                                              '') &&
                                                      (functions.jsonToString(
                                                              getJsonField(
                                                            widget.education,
                                                            r'''$.education_level''',
                                                          )) ==
                                                          'Degree'))
                                              ? Color(0xFF5450E2)
                                              : Color(0x00000000),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            color: (FFAppState()
                                                            .UserInformation
                                                            .educationType ==
                                                        'Degree') ||
                                                    ((FFAppState()
                                                                    .UserInformation
                                                                    .educationType ==
                                                                null ||
                                                            FFAppState()
                                                                    .UserInformation
                                                                    .educationType ==
                                                                '') &&
                                                        (functions.jsonToString(
                                                                getJsonField(
                                                              widget.education,
                                                              r'''$.education_level''',
                                                            )) ==
                                                            'Degree'))
                                                ? Color(0xFF5450E2)
                                                : Color(0xFF5E5D5D),
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 15.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Degree',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Lato',
                                                      color: FFAppState()
                                                                  .UserInformation
                                                                  .educationType ==
                                                              'Degree'
                                                          ? Colors.white
                                                          : Color(0xFF5E5D5D),
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                          FFAppState()
                                              .updateUserInformationStruct(
                                            (e) =>
                                                e..educationType = 'Training',
                                          );
                                        });
                                      },
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: (FFAppState()
                                                          .UserInformation
                                                          .educationType ==
                                                      'Training') ||
                                                  ((FFAppState()
                                                                  .UserInformation
                                                                  .educationType ==
                                                              null ||
                                                          FFAppState()
                                                                  .UserInformation
                                                                  .educationType ==
                                                              '') &&
                                                      (functions.jsonToString(
                                                              getJsonField(
                                                            widget.education,
                                                            r'''$.education_level''',
                                                          )) ==
                                                          'Training'))
                                              ? Color(0xFF5450E2)
                                              : Color(0x00000000),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            color: (FFAppState()
                                                            .UserInformation
                                                            .educationType ==
                                                        'Training') ||
                                                    ((FFAppState()
                                                                    .UserInformation
                                                                    .educationType ==
                                                                null ||
                                                            FFAppState()
                                                                    .UserInformation
                                                                    .educationType ==
                                                                '') &&
                                                        (functions.jsonToString(
                                                                getJsonField(
                                                              widget.education,
                                                              r'''$.education_level''',
                                                            )) ==
                                                            'Training'))
                                                ? Color(0xFF5450E2)
                                                : Color(0xFF5E5D5D),
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 15.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Training ',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Lato',
                                                      color: FFAppState()
                                                                  .UserInformation
                                                                  .educationType ==
                                                              'Training'
                                                          ? Colors.white
                                                          : Color(0xFF5E5D5D),
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                          FFAppState()
                                              .updateUserInformationStruct(
                                            (e) => e..educationType = 'Student',
                                          );
                                        });
                                      },
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: (FFAppState()
                                                          .UserInformation
                                                          .educationType ==
                                                      'Student') ||
                                                  ((FFAppState()
                                                                  .UserInformation
                                                                  .educationType ==
                                                              null ||
                                                          FFAppState()
                                                                  .UserInformation
                                                                  .educationType ==
                                                              '') &&
                                                      (functions.jsonToString(
                                                              getJsonField(
                                                            widget.education,
                                                            r'''$.education_level''',
                                                          )) ==
                                                          'Student'))
                                              ? Color(0xFF5450E2)
                                              : Color(0x00000000),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            color: (FFAppState()
                                                            .UserInformation
                                                            .educationType ==
                                                        'Student') ||
                                                    ((FFAppState()
                                                                    .UserInformation
                                                                    .educationType ==
                                                                null ||
                                                            FFAppState()
                                                                    .UserInformation
                                                                    .educationType ==
                                                                '') &&
                                                        (functions.jsonToString(
                                                                getJsonField(
                                                              widget.education,
                                                              r'''$.education_level''',
                                                            )) ==
                                                            'Student'))
                                                ? Color(0xFF5450E2)
                                                : Color(0xFF5E5D5D),
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 15.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Student',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Lato',
                                                      color: FFAppState()
                                                                  .UserInformation
                                                                  .educationType ==
                                                              'Student'
                                                          ? Colors.white
                                                          : Color(0xFF5E5D5D),
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                          FFAppState()
                                              .updateUserInformationStruct(
                                            (e) => e
                                              ..educationType = 'Participation',
                                          );
                                        });
                                      },
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: (FFAppState()
                                                          .UserInformation
                                                          .educationType ==
                                                      'Participation') ||
                                                  ((FFAppState()
                                                                  .UserInformation
                                                                  .educationType ==
                                                              null ||
                                                          FFAppState()
                                                                  .UserInformation
                                                                  .educationType ==
                                                              '') &&
                                                      (functions.jsonToString(
                                                              getJsonField(
                                                            widget.education,
                                                            r'''$.education_level''',
                                                          )) ==
                                                          'Participation'))
                                              ? Color(0xFF5450E2)
                                              : Color(0x00000000),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            color: (FFAppState()
                                                            .UserInformation
                                                            .educationType ==
                                                        'Participation') ||
                                                    ((FFAppState()
                                                                    .UserInformation
                                                                    .educationType ==
                                                                null ||
                                                            FFAppState()
                                                                    .UserInformation
                                                                    .educationType ==
                                                                '') &&
                                                        (functions.jsonToString(
                                                                getJsonField(
                                                              widget.education,
                                                              r'''$.education_level''',
                                                            )) ==
                                                            'Participation'))
                                                ? Color(0xFF5450E2)
                                                : Color(0xFF5E5D5D),
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 15.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Participation',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Lato',
                                                      color: FFAppState()
                                                                  .UserInformation
                                                                  .educationType ==
                                                              'Participation'
                                                          ? Colors.white
                                                          : Color(0xFF5E5D5D),
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.w500,
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
                        Divider(
                          height: 32.0,
                          thickness: 1.0,
                          indent: 32.0,
                          endIndent: 32.0,
                          color: Color(0xFFD4D4D4),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 0.0, 32.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    3.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Education / Training Name',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: Color(0xFF3D3D3D),
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 10.0, 32.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _model.textController1,
                                  onFieldSubmitted: (_) async {
                                    setState(() {
                                      FFAppState().updateUserInformationStruct(
                                        (e) => e
                                          ..educationTrainingName =
                                              _model.textController1.text,
                                      );
                                    });
                                  },
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    hintText: 'Gardening Master',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Lato',
                                          color: Color(0xFFACABAB),
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF5E5D5D),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFE8083F),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFE8083F),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 16.0, 16.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: Color(0xFF212121),
                                        fontSize: 14.0,
                                      ),
                                  validator: _model.textController1Validator
                                      .asValidator(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 20.0, 32.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    3.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Name of Institute / Company',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: Color(0xFF3D3D3D),
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 10.0, 32.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _model.textController2,
                                  onFieldSubmitted: (_) async {
                                    setState(() {
                                      FFAppState().updateUserInformationStruct(
                                        (e) => e
                                          ..nameofInstituteCompany =
                                              _model.textController2.text,
                                      );
                                    });
                                  },
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    hintText: 'Gardening School of Durt',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Lato',
                                          color: Color(0xFFACABAB),
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF5E5D5D),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFE8083F),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFE8083F),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 16.0, 16.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: Color(0xFF212121),
                                        fontSize: 14.0,
                                      ),
                                  validator: _model.textController2Validator
                                      .asValidator(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 20.0, 32.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (_model.certificateUrl != null &&
                                      _model.certificateUrl != '') {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () => FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: ViewCertificateWidget(
                                              certificateUrl:
                                                  _model.certificateUrl!,
                                              updateCertificateUrl: () async {
                                                setState(() {
                                                  _model.certificateUrl = '';
                                                });
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => setState(() {}));
                                  } else {
                                    setState(() {
                                      FFAppState().AddCertificateForEducation =
                                          true;
                                    });
                                  }
                                },
                                child: Container(
                                  width: 147.0,
                                  height: 44.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF5450E2),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          _model.certificateUrl != null &&
                                                  _model.certificateUrl != ''
                                              ? 'View Certificate'
                                              : '+ Add certificate',
                                          '+ Add certificate',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: Color(0xFFF6F6F6),
                                              fontSize: 14.0,
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
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 0.0, 32.0, 0.0),
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
                                  if (!widget.isSignUp) {
                                    context.safePop();
                                  } else {
                                    context.pushNamed('Profiledetails');
                                  }
                                },
                                child: Container(
                                  width: 104.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(
                                      color: widget.isSignUp
                                          ? Colors.transparent
                                          : Color(0xFF5450E2),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        () {
                                          if (widget.isSignUp) {
                                            return 'i\'ll do it later';
                                          } else if (widget.education != null) {
                                            return 'Discard';
                                          } else {
                                            return 'Cancel';
                                          }
                                        }(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: widget.isSignUp
                                                  ? Color(0xFF8A8A8A)
                                                  : Color(0xFF5450E2),
                                              fontSize: 14.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (!(!widget.isSignUp &&
                                  (widget.education != null)))
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    var _shouldSetState = false;
                                    _model.educationRequest =
                                        await TaskerpageBackendGroup
                                            .userEducationAddCall
                                            .call(
                                      title: _model.textController1.text,
                                      schoolTitle: _model.textController2.text,
                                      educationLevel: FFAppState()
                                          .UserInformation
                                          .educationType,
                                      certificateUrl: _model.certificateUrl,
                                      relatedUserProfile: getJsonField(
                                        FFAppState().userProfile,
                                        r'''$.id''',
                                      ),
                                      apiGlobalKey: FFAppState().apiKey,
                                    );
                                    _shouldSetState = true;
                                    if ((_model.educationRequest?.succeeded ??
                                            true) !=
                                        true) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Not Done',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor: Color(0xFFE8083F),
                                          action: SnackBarAction(
                                            label: 'close',
                                            textColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            onPressed: () async {
                                              ScaffoldMessenger.of(context)
                                                  .hideCurrentSnackBar();
                                            },
                                          ),
                                        ),
                                      );
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }

                                    context.pushNamed('Education-2');

                                    setState(() {
                                      FFAppState().updateUserInformationStruct(
                                        (e) => e..educationType = '',
                                      );
                                    });
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 5.0, 0.0),
                                          child: Icon(
                                            Icons.add_rounded,
                                            color: Colors.white,
                                            size: 10.0,
                                          ),
                                        ),
                                        Text(
                                          'Add',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lato',
                                                color: Colors.white,
                                                fontSize: 14.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              if (widget.isSignUp && (widget.education != null))
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    var _shouldSetState = false;
                                    _model.educationRequest2 =
                                        await TaskerpageBackendGroup
                                            .userEducationAddCall
                                            .call(
                                      title: _model.textController1.text,
                                      schoolTitle: _model.textController2.text,
                                      educationLevel: FFAppState()
                                          .UserInformation
                                          .educationType,
                                      certificateUrl: _model.certificateUrl,
                                      relatedUserProfile: getJsonField(
                                        FFAppState().userProfile,
                                        r'''$.id''',
                                      ),
                                      apiGlobalKey: FFAppState().apiKey,
                                    );
                                    _shouldSetState = true;
                                    if (!(_model.educationRequest2?.succeeded ??
                                        true)) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Not Done',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor: Color(0xFFE8083F),
                                          action: SnackBarAction(
                                            label: 'close',
                                            textColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            onPressed: () async {
                                              ScaffoldMessenger.of(context)
                                                  .hideCurrentSnackBar();
                                            },
                                          ),
                                        ),
                                      );
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }

                                    context.pushNamed('Profiledetails');

                                    setState(() {
                                      FFAppState().updateUserInformationStruct(
                                        (e) => e..educationType = '',
                                      );
                                    });
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                              if (widget.education != null)
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    var _shouldSetState = false;
                                    _model.educationRequest23 =
                                        await TaskerpageBackendGroup
                                            .educationPartialUpdateCall
                                            .call(
                                      id: getJsonField(
                                        widget.education,
                                        r'''$.id''',
                                      ),
                                      schoolTitle: _model.textController2.text,
                                      title: _model.textController1.text,
                                      certificateUrl: _model.certificateUrl,
                                      apiGlobalKey: FFAppState().apiKey,
                                      educationLevel: FFAppState()
                                          .UserInformation
                                          .educationType,
                                    );
                                    _shouldSetState = true;
                                    if (!(_model
                                            .educationRequest23?.succeeded ??
                                        true)) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Not Done',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor: Color(0xFFE8083F),
                                          action: SnackBarAction(
                                            label: 'close',
                                            textColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            onPressed: () async {
                                              ScaffoldMessenger.of(context)
                                                  .hideCurrentSnackBar();
                                            },
                                          ),
                                        ),
                                      );
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }
                                    context.safePop();
                                    setState(() {
                                      FFAppState().updateUserInformationStruct(
                                        (e) => e..educationType = '',
                                      );
                                    });
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Save',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lato',
                                                color: Colors.white,
                                                fontSize: 14.0,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
              if (FFAppState().AddCertificateForEducation == true)
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(
                    color: Color(0x00FFFFFF),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 2.0,
                        sigmaY: 2.0,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: 269.0,
                          height: 149.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFF6F6F6),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 15.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    final selectedMedia = await selectMedia(
                                      mediaSource: MediaSource.photoGallery,
                                      multiImage: false,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      setState(
                                          () => _model.isDataUploading1 = true);
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];

                                      try {
                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                  blurHash: m.blurHash,
                                                ))
                                            .toList();
                                      } finally {
                                        _model.isDataUploading1 = false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                          selectedMedia.length) {
                                        setState(() {
                                          _model.uploadedLocalFile1 =
                                              selectedUploadedFiles.first;
                                        });
                                      } else {
                                        setState(() {});
                                        return;
                                      }
                                    }

                                    _model.uploadedFromGallery =
                                        await TaskerpageBackendGroup.uploadCall
                                            .call(
                                      file: _model.uploadedLocalFile1,
                                      apiGlobalKey: FFAppState().apiKey,
                                    );
                                    if ((_model.uploadedFromGallery
                                                ?.succeeded ??
                                            true) ==
                                        true) {
                                      setState(() {
                                        _model.certificateUrl = getJsonField(
                                          (_model.uploadedFromGallery
                                                  ?.jsonBody ??
                                              ''),
                                          r'''$.url''',
                                        ).toString();
                                      });
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Not Done'),
                                            content: Text('Not Done'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }

                                    setState(() {
                                      FFAppState().AddCertificateForEducation =
                                          false;
                                    });

                                    setState(() {});
                                  },
                                  child: Container(
                                    width: 209.0,
                                    height: 44.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF5450E2),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'From Gallery',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lato',
                                                color: Colors.white,
                                                fontSize: 14.0,
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
                                  final selectedMedia = await selectMedia(
                                    multiImage: false,
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    setState(
                                        () => _model.isDataUploading2 = true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];

                                    try {
                                      selectedUploadedFiles = selectedMedia
                                          .map((m) => FFUploadedFile(
                                                name: m.storagePath
                                                    .split('/')
                                                    .last,
                                                bytes: m.bytes,
                                                height: m.dimensions?.height,
                                                width: m.dimensions?.width,
                                                blurHash: m.blurHash,
                                              ))
                                          .toList();
                                    } finally {
                                      _model.isDataUploading2 = false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                        selectedMedia.length) {
                                      setState(() {
                                        _model.uploadedLocalFile2 =
                                            selectedUploadedFiles.first;
                                      });
                                    } else {
                                      setState(() {});
                                      return;
                                    }
                                  }

                                  await _model.upload(
                                    context,
                                    uploadedFile: _model.uploadedLocalFile2,
                                  );
                                  setState(() {});
                                },
                                child: Container(
                                  width: 209.0,
                                  height: 44.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF5450E2),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Take Photo',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: Colors.white,
                                              fontSize: 14.0,
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
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
