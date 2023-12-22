import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/side_bar_left_sign_up_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'education_list_web_register_model.dart';
export 'education_list_web_register_model.dart';

class EducationListWebRegisterWidget extends StatefulWidget {
  const EducationListWebRegisterWidget({
    Key? key,
    String? name,
  })  : this.name = name ?? 'new',
        super(key: key);

  final String name;

  @override
  _EducationListWebRegisterWidgetState createState() =>
      _EducationListWebRegisterWidgetState();
}

class _EducationListWebRegisterWidgetState
    extends State<EducationListWebRegisterWidget> {
  late EducationListWebRegisterModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EducationListWebRegisterModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.name == 'new') {
        setState(() {
          _model.userRate = UserRateStruct(
            name: '',
            customerProfile: getJsonField(
              FFAppState().userProfile,
              r'''$.data.name''',
            ).toString().toString(),
            customerProfileUser: getJsonField(
              FFAppState().userProfile,
              r'''$.data.user''',
            ).toString().toString(),
            isAll: 1,
          );
        });
      } else {
        _model.userRateDetails =
            await TaskerpageBackendGroup.getUserRateDetailsCall.call(
          name: widget.name,
          apiGlobalKey: FFAppState().apiKey,
        );
        if ((_model.userRateDetails?.succeeded ?? true)) {
          setState(() {
            _model.userRate = UserRateStruct.maybeFromMap(
                TaskerpageBackendGroup.getUserRateDetailsCall.userRateJson(
              (_model.userRateDetails?.jsonBody ?? ''),
            ));
          });
        }
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
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        endDrawer: Container(
          width: double.infinity,
          child: WebViewAware(
              child: Drawer(
            elevation: 16.0,
            child: wrapWithModel(
              model: _model.mainDrawerModel,
              updateCallback: () => setState(() {}),
              child: MainDrawerWidget(),
            ),
          )),
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
                      return FFAppConstants.mediumCardLR.toDouble();
                    } else {
                      return FFAppConstants.mediumCardLR.toDouble();
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
                      return FFAppConstants.mediumCardUD.toDouble();
                    } else {
                      return FFAppConstants.mediumCardUD.toDouble();
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
                      return FFAppConstants.mediumCardLR.toDouble();
                    } else {
                      return FFAppConstants.mediumCardLR.toDouble();
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
                      return FFAppConstants.mediumCardUD.toDouble();
                    } else {
                      return FFAppConstants.mediumCardUD.toDouble();
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
                          child: wrapWithModel(
                            model: _model.sideBarLeftSignUpModel,
                            updateCallback: () => setState(() {}),
                            child: SideBarLeftSignUpWidget(),
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
                                  child: Builder(
                                    builder: (context) {
                                      if (widget.name != null &&
                                          widget.name != '') {
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 12.0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(32.0, 32.0,
                                                          32.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Add trainings and education you participated',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Lato',
                                                              fontSize: 18.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(32.0, 30.0,
                                                          32.0, 24.0),
                                                  child: FutureBuilder<
                                                      ApiCallResponse>(
                                                    future:
                                                        TaskerpageBackendGroup
                                                            .myEducationsCall
                                                            .call(
                                                      apiGlobalKey:
                                                          FFAppState().apiKey,
                                                      filters:
                                                          '[[\"customer_profile\",\"=\",\"${getJsonField(
                                                        FFAppState()
                                                            .userProfile,
                                                        r'''$.data.name''',
                                                      ).toString()}\"]]',
                                                      fields:
                                                          '[\"title\",\"name\",\"school_title\",\"education_type\",\"certificate\"]',
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 35.0,
                                                            height: 35.0,
                                                            child:
                                                                SpinKitThreeBounce(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 35.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final listViewMyEducationsResponse =
                                                          snapshot.data!;
                                                      return Builder(
                                                        builder: (context) {
                                                          final myEducationList =
                                                              getJsonField(
                                                            listViewMyEducationsResponse
                                                                .jsonBody,
                                                            r'''$.data''',
                                                          ).toList();
                                                          return ListView
                                                              .separated(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                myEducationList
                                                                    .length,
                                                            separatorBuilder: (_,
                                                                    __) =>
                                                                SizedBox(
                                                                    height:
                                                                        16.0),
                                                            itemBuilder: (context,
                                                                myEducationListIndex) {
                                                              final myEducationListItem =
                                                                  myEducationList[
                                                                      myEducationListIndex];
                                                              return Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                          4.0,
                                                                      color: Color(
                                                                          0x33000000),
                                                                      offset: Offset(
                                                                          0.0,
                                                                          0.0),
                                                                      spreadRadius:
                                                                          2.0,
                                                                    )
                                                                  ],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0.0),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              17.0,
                                                                          height:
                                                                              50.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFF8A8A8A),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                functions.plus1(myEducationListIndex).toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Lato',
                                                                                      color: Colors.white,
                                                                                      fontSize: 12.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                16.0,
                                                                                16.0,
                                                                                16.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                      child: Text(
                                                                                        'Name: ',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Lato',
                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                              fontSize: 14.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      getJsonField(
                                                                                        myEducationListItem,
                                                                                        r'''$.title''',
                                                                                      ).toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Lato',
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                            fontSize: 14.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                    Expanded(
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
                                                                                              context.pushNamed(
                                                                                                'Add_another_education',
                                                                                                queryParameters: {
                                                                                                  'isSignUp': serializeParam(
                                                                                                    false,
                                                                                                    ParamType.bool,
                                                                                                  ),
                                                                                                  'education': serializeParam(
                                                                                                    myEducationListItem,
                                                                                                    ParamType.JSON,
                                                                                                  ),
                                                                                                  'addAnother': serializeParam(
                                                                                                    false,
                                                                                                    ParamType.bool,
                                                                                                  ),
                                                                                                }.withoutNulls,
                                                                                              );
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.edit,
                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                              size: 17.0,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                        child: Text(
                                                                                          'Name of Institute: ',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Lato',
                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                fontSize: 14.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        getJsonField(
                                                                                          myEducationListItem,
                                                                                          r'''$.school_title''',
                                                                                        ).toString(),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Lato',
                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                              fontSize: 14.0,
                                                                                              fontWeight: FontWeight.bold,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                      child: Text(
                                                                                        'Type: ',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Lato',
                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                              fontSize: 14.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      getJsonField(
                                                                                        myEducationListItem,
                                                                                        r'''$.education_type''',
                                                                                      ).toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Lato',
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                            fontSize: 14.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                                                    children: [
                                                                                      InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          if (functions.jsonToString(getJsonField(
                                                                                                    myEducationListItem,
                                                                                                    r'''$.certificate''',
                                                                                                  )) ==
                                                                                                  null ||
                                                                                              functions.jsonToString(getJsonField(
                                                                                                    myEducationListItem,
                                                                                                    r'''$.certificate''',
                                                                                                  )) ==
                                                                                                  '') {
                                                                                            context.pushNamed(
                                                                                              'Add_another_education',
                                                                                              queryParameters: {
                                                                                                'isSignUp': serializeParam(
                                                                                                  false,
                                                                                                  ParamType.bool,
                                                                                                ),
                                                                                                'education': serializeParam(
                                                                                                  myEducationListItem,
                                                                                                  ParamType.JSON,
                                                                                                ),
                                                                                              }.withoutNulls,
                                                                                            );
                                                                                          } else {
                                                                                            context.pushNamed(
                                                                                              'Add_another_education',
                                                                                              queryParameters: {
                                                                                                'isSignUp': serializeParam(
                                                                                                  false,
                                                                                                  ParamType.bool,
                                                                                                ),
                                                                                                'education': serializeParam(
                                                                                                  myEducationListItem,
                                                                                                  ParamType.JSON,
                                                                                                ),
                                                                                              }.withoutNulls,
                                                                                            );
                                                                                          }
                                                                                        },
                                                                                        child: Container(
                                                                                          width: 150.0,
                                                                                          height: 36.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Colors.white,
                                                                                            borderRadius: BorderRadius.circular(2.0),
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                            ),
                                                                                          ),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Text(
                                                                                                valueOrDefault<String>(
                                                                                                  functions.jsonToString(getJsonField(
                                                                                                            myEducationListItem,
                                                                                                            r'''$.certificate''',
                                                                                                          )) !=
                                                                                                          ''
                                                                                                      ? 'View Certificate'
                                                                                                      : '+ Add certificate',
                                                                                                  '+ Add certificate',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Lato',
                                                                                                      color: FlutterFlowTheme.of(context).primary,
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
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 30.0),
                                                  child: FutureBuilder<
                                                      ApiCallResponse>(
                                                    future:
                                                        TaskerpageBackendGroup
                                                            .myEducationsCall
                                                            .call(
                                                      apiGlobalKey:
                                                          FFAppState().apiKey,
                                                      filters:
                                                          '[[\"customer_profile\",\"=\",\"${getJsonField(
                                                        FFAppState()
                                                            .userProfile,
                                                        r'''$.data.name''',
                                                      ).toString()}\"]]',
                                                      fields:
                                                          '[\"title\",\"name\",\"school_title\",\"education_type\",\"certificate\"]',
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 35.0,
                                                            height: 35.0,
                                                            child:
                                                                SpinKitThreeBounce(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 35.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final rowMyEducationsResponse =
                                                          snapshot.data!;
                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          if (getJsonField(
                                                                rowMyEducationsResponse
                                                                    .jsonBody,
                                                                r'''$.data''',
                                                              ) !=
                                                              null)
                                                            Expanded(
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        32.0,
                                                                        0.0,
                                                                        32.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  height: 152.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0x00DAD3D3),
                                                                    image:
                                                                        DecorationImage(
                                                                      fit: BoxFit
                                                                          .fill,
                                                                      image: Image
                                                                          .asset(
                                                                        'assets/images/Rectangle_1937.png',
                                                                      ).image,
                                                                    ),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Color(
                                                                          0x00707070),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
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
                                                                              .center,
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
                                                                          onTap:
                                                                              () async {
                                                                            context.pushNamed(
                                                                              'Add_another_education',
                                                                              queryParameters: {
                                                                                'addAnother': serializeParam(
                                                                                  true,
                                                                                  ParamType.bool,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                252.0,
                                                                            height:
                                                                                36.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0x00FFFFFF),
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Text(
                                                                                  '+ Add another Training or Education',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Lato',
                                                                                        color: FlutterFlowTheme.of(context).primary,
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
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Lottie.network(
                                          'https://lottie.host/61b80ec4-ca70-4178-8d2a-ae3a92415e17/yY7knoVa5v.json',
                                          width: 279.0,
                                          height: 130.0,
                                          fit: BoxFit.none,
                                          animate: true,
                                        );
                                      }
                                    },
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
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'I\'ll do it later',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color:
                                                            Color(0xFF8A8A8A),
                                                        fontSize: 14.0,
                                                      ),
                                            ),
                                            Container(
                                              width: 104.0,
                                              height: 36.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderRadius:
                                                    BorderRadius.circular(1.0),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Save',
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
