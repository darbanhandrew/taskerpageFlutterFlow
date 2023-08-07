import '/backend/schema/structs/index.dart';
import '/components/drope_down_languages_widget.dart';
import '/components/header_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profiledetails_model.dart';
export 'profiledetails_model.dart';

class ProfiledetailsWidget extends StatefulWidget {
  const ProfiledetailsWidget({Key? key}) : super(key: key);

  @override
  _ProfiledetailsWidgetState createState() => _ProfiledetailsWidgetState();
}

class _ProfiledetailsWidgetState extends State<ProfiledetailsWidget>
    with TickerProviderStateMixin {
  late ProfiledetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 15.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfiledetailsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().SelectLanguageDropDown = false;
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
                          child: HeaderWidget(),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 32.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Years of experience',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: Color(0xFF3D3D3D),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 10.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 135.0,
                            height: 36.0,
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
                              decrementIconBuilder: (enabled) => FaIcon(
                                FontAwesomeIcons.minus,
                                color: enabled
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context).alternate,
                                size: 15.0,
                              ),
                              incrementIconBuilder: (enabled) => FaIcon(
                                FontAwesomeIcons.plus,
                                color: enabled
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context).alternate,
                                size: 15.0,
                              ),
                              countBuilder: (count) => Text(
                                count.toString(),
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Color(0xFF212121),
                                      fontSize: 14.0,
                                    ),
                              ),
                              count: _model.countControllerValue ??= 8,
                              updateCount: (count) async {
                                setState(
                                    () => _model.countControllerValue = count);
                                setState(() {
                                  FFAppState().updateUserInformationStruct(
                                    (e) => e
                                      ..yearsofexperience = _model
                                          .countControllerValue
                                          ?.toString(),
                                  );
                                });
                              },
                              stepSize: 1,
                              minimum: 0,
                              maximum: 100,
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Languages',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: Color(0xFF3D3D3D),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 10.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: wrapWithModel(
                              model: _model.dropeDownLanguagesModel,
                              updateCallback: () => setState(() {}),
                              child: DropeDownLanguagesWidget(),
                            ),
                          ),
                        ],
                      ).animateOnPageLoad(
                          animationsMap['rowOnPageLoadAnimation']!),
                    ),
                    Divider(
                      height: 32.0,
                      thickness: 1.0,
                      indent: 32.0,
                      endIndent: 32.0,
                      color: Color(0xFFD4D4D4),
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
                                  color: Color(0xFF3D3D3D),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
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
                                    FFAppState().updateUserInformationStruct(
                                      (e) => e..insuranceProfileDeatels = true,
                                    );
                                  });
                                } else {
                                  setState(() {
                                    FFAppState().updateUserInformationStruct(
                                      (e) => e..insuranceProfileDeatels = false,
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
                      color: Color(0xFFD4D4D4),
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
                                  color: Color(0xFF3D3D3D),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
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
                                      FFAppState().updateUserInformationStruct(
                                        (e) => e..driverLicense = 'Car',
                                      );
                                    });
                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FFAppState()
                                                  .UserInformation
                                                  .driverLicense ==
                                              'Car'
                                          ? Color(0xFF5450E2)
                                          : Color(0x00000000),
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(
                                        color: FFAppState()
                                                    .UserInformation
                                                    .driverLicense ==
                                                'Car'
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
                                                              .UserInformation
                                                              .driverLicense ==
                                                          'Car'
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
                                      FFAppState().updateUserInformationStruct(
                                        (e) => e..driverLicense = 'Truck',
                                      );
                                    });
                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FFAppState()
                                                  .UserInformation
                                                  .driverLicense ==
                                              'Truck'
                                          ? Color(0xFF5450E2)
                                          : Color(0x00000000),
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(
                                        color: FFAppState()
                                                    .UserInformation
                                                    .driverLicense ==
                                                'Truck'
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
                                                              .UserInformation
                                                              .driverLicense ==
                                                          'Truck'
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
                              context.pushNamed('Profiledetails2');
                            },
                            child: Text(
                              'I\'ll do it later',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Color(0xFF8A8A8A),
                                    fontSize: 14.0,
                                  ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('Profiledetails2');
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
                                    'Save',
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
