import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/side_bar_left_sign_up_widget.dart';
import '/components/skill_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'skill_list_web_register_model.dart';
export 'skill_list_web_register_model.dart';

class SkillListWebRegisterWidget extends StatefulWidget {
  const SkillListWebRegisterWidget({
    super.key,
    String? name,
  }) : this.name = name ?? 'new';

  final String name;

  @override
  State<SkillListWebRegisterWidget> createState() =>
      _SkillListWebRegisterWidgetState();
}

class _SkillListWebRegisterWidgetState
    extends State<SkillListWebRegisterWidget> {
  late SkillListWebRegisterModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SkillListWebRegisterModel());

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
                            child: SideBarLeftSignUpWidget(
                              selectedColor: 3,
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
                                  child: Builder(
                                    builder: (context) {
                                      if (widget.name != null &&
                                          widget.name != '') {
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 12.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        32.0, 32.0, 32.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'View and edit your skills',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Lato',
                                                            fontSize: 18.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        32.0, 22.0, 32.0, 16.0),
                                                child: FutureBuilder<
                                                    ApiCallResponse>(
                                                  future: (_model
                                                              .apiRequestCompleter ??=
                                                          Completer<
                                                              ApiCallResponse>()
                                                            ..complete(
                                                                TaskerpageBackendGroup
                                                                    .customerProfileSkillsListCall
                                                                    .call(
                                                              filters:
                                                                  '[[\"customer_profile\",\"=\",\"${getJsonField(
                                                                FFAppState()
                                                                    .userProfile,
                                                                r'''$.data.name''',
                                                              ).toString()}\"]]',
                                                              fields: '[\"*\"]',
                                                              orderBy:
                                                                  'creation desc',
                                                              apiGlobalKey:
                                                                  FFAppState()
                                                                      .apiKey,
                                                            )))
                                                      .future,
                                                  builder: (context, snapshot) {
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
                                                    final listViewCustomerProfileSkillsListResponse =
                                                        snapshot.data!;
                                                    return Builder(
                                                      builder: (context) {
                                                        final myServices =
                                                            TaskerpageBackendGroup
                                                                    .customerProfileSkillsListCall
                                                                    .myServices(
                                                                      listViewCustomerProfileSkillsListResponse
                                                                          .jsonBody,
                                                                    )
                                                                    ?.toList() ??
                                                                [];
                                                        return ListView
                                                            .separated(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              myServices.length,
                                                          separatorBuilder: (_,
                                                                  __) =>
                                                              SizedBox(
                                                                  height: 16.0),
                                                          itemBuilder: (context,
                                                              myServicesIndex) {
                                                            final myServicesItem =
                                                                myServices[
                                                                    myServicesIndex];
                                                            return Container(
                                                              height: 285.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: FutureBuilder<
                                                                  ApiCallResponse>(
                                                                future: TaskerpageBackendGroup
                                                                    .getCustomerProfileSkillsDetailsCall
                                                                    .call(
                                                                  name:
                                                                      getJsonField(
                                                                    myServicesItem,
                                                                    r'''$.name''',
                                                                  ).toString(),
                                                                  apiGlobalKey:
                                                                      FFAppState()
                                                                          .apiKey,
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            35.0,
                                                                        height:
                                                                            35.0,
                                                                        child:
                                                                            SpinKitThreeBounce(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              35.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  final skillCardGetCustomerProfileSkillsDetailsResponse =
                                                                      snapshot
                                                                          .data!;
                                                                  return wrapWithModel(
                                                                    model: _model
                                                                        .skillCardModels
                                                                        .getModel(
                                                                      myServicesIndex
                                                                          .toString(),
                                                                      myServicesIndex,
                                                                    ),
                                                                    updateCallback: () =>
                                                                        setState(
                                                                            () {}),
                                                                    child:
                                                                        SkillCardWidget(
                                                                      key: Key(
                                                                        'Keyys5_${myServicesIndex.toString()}',
                                                                      ),
                                                                      userService:
                                                                          UserServiceStruct.maybeFromMap(
                                                                              getJsonField(
                                                                        skillCardGetCustomerProfileSkillsDetailsResponse
                                                                            .jsonBody,
                                                                        r'''$.data''',
                                                                      ))!,
                                                                      index:
                                                                          myServicesIndex,
                                                                      action:
                                                                          () async {
                                                                        setState(() =>
                                                                            _model.apiRequestCompleter =
                                                                                null);
                                                                        await _model
                                                                            .waitForApiRequestCompleted();
                                                                      },
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
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
