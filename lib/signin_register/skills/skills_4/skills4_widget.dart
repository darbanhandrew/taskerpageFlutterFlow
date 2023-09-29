import '/backend/api_requests/api_calls.dart';
import '/components/drawer_content_widget.dart';
import '/components/emty_container_widget.dart';
import '/components/header_widget.dart';
import '/components/skill_level_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'skills4_model.dart';
export 'skills4_model.dart';

class Skills4Widget extends StatefulWidget {
  const Skills4Widget({
    Key? key,
    bool? addAnother,
  })  : this.addAnother = addAnother ?? false,
        super(key: key);

  final bool addAnother;

  @override
  _Skills4WidgetState createState() => _Skills4WidgetState();
}

class _Skills4WidgetState extends State<Skills4Widget> {
  late Skills4Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Skills4Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultuqp = await TaskerpageBackendGroup.serviceListCall.call(
        filters: '[[\"customer_profile\",\"=\",\"${getJsonField(
          FFAppState().userProfile,
          r'''$.data.name''',
        ).toString().toString()}\"]]',
        fields:
            '[\"skill_category_name\",\"skill_name\",\"name\",\"skill_level\"]',
        apiGlobalKey: FFAppState().apiKey,
      );
      if ((_model.apiResultuqp?.succeeded ?? true)) {
        setState(() {
          _model.userServices = TaskerpageBackendGroup.serviceListCall
              .myServices(
                (_model.apiResultuqp?.jsonBody ?? ''),
              )!
              .toList()
              .cast<dynamic>();
        });
        setState(() {
          FFAppState().ChhosenSkillCategory = FFAppState()
                      .ChhosenSkillCategory
                      .length >
                  0
              ? FFAppState().ChhosenSkillCategory
              : (TaskerpageBackendGroup.serviceListCall.myServicesCategories(
                  (_model.apiResultuqp?.jsonBody ?? ''),
                ) as List)
                  .map<String>((s) => s.toString())
                  .toList()!
                  .toList()
                  .cast<String>();
        });
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
          width: MediaQuery.sizeOf(context).width * 0.85,
          child: Drawer(
            elevation: 16.0,
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: Color(0xFFE8EAFF),
              ),
              child: wrapWithModel(
                model: _model.drawerContentModel,
                updateCallback: () => setState(() {}),
                child: DrawerContentWidget(),
              ),
            ),
          ),
        ),
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
                          child: HeaderWidget(
                            openDrawer: () async {
                              scaffoldKey.currentState!.openDrawer();
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 32.0, 15.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Click on each skill and add more info',
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(90.0, 25.0, 90.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final serviceCategoryIds =
                              FFAppState().ChhosenSkillCategory.toList();
                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: serviceCategoryIds.length,
                            separatorBuilder: (_, __) => SizedBox(height: 8.0),
                            itemBuilder: (context, serviceCategoryIdsIndex) {
                              final serviceCategoryIdsItem =
                                  serviceCategoryIds[serviceCategoryIdsIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setState(() {
                                    _model.selectedServiceCategory =
                                        serviceCategoryIdsItem;
                                  });
                                },
                                child: Container(
                                  width: 230.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: serviceCategoryIdsItem ==
                                            _model.selectedServiceCategory
                                        ? Color(0xFF5450E2)
                                        : Color(0x00FFFFFF),
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(
                                      color: serviceCategoryIdsItem ==
                                              _model.selectedServiceCategory
                                          ? Color(0xFF5450E2)
                                          : Color(0xFF5E5D5D),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        serviceCategoryIdsItem,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: serviceCategoryIdsItem ==
                                                      _model
                                                          .selectedServiceCategory
                                                  ? Color(0xFFF6F6F6)
                                                  : Color(0xFF5E5D5D),
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Divider(
                      height: 48.0,
                      thickness: 1.0,
                      indent: 32.0,
                      endIndent: 32.0,
                      color: Color(0xFFE3E3E3),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Skills',
                            textAlign: TextAlign.justify,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: Color(0xFF292929),
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
                          Expanded(
                            child: FutureBuilder<ApiCallResponse>(
                              future:
                                  TaskerpageBackendGroup.getServicesCall.call(
                                category:
                                    '[[\"skill_category_name\",\"=\",\"${_model.selectedServiceCategory}\"]]',
                                apiGlobalKey: FFAppState().apiKey,
                                fields: '[\"skill_name\",\"name\"]',
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitThreeBounce(
                                        color: Color(0xFF5450E2),
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                final gridViewGetServicesResponse =
                                    snapshot.data!;
                                return Builder(
                                  builder: (context) {
                                    final services =
                                        TaskerpageBackendGroup.getServicesCall
                                                .servicesList(
                                                  gridViewGetServicesResponse
                                                      .jsonBody,
                                                )
                                                ?.toList() ??
                                            [];
                                    if (services.isEmpty) {
                                      return EmtyContainerWidget(
                                        title: 'Choose a skill category !',
                                        goTo: () async {},
                                      );
                                    }
                                    return GridView.builder(
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
                                      itemCount: services.length,
                                      itemBuilder: (context, servicesIndex) {
                                        final servicesItem =
                                            services[servicesIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            var _shouldSetState = false;
                                            if (!FFAppState()
                                                .SelectServices
                                                .contains(getJsonField(
                                                  servicesItem,
                                                  r'''$.name''',
                                                ).toString())) {
                                              _model.createdUserService =
                                                  await TaskerpageBackendGroup
                                                      .createUserServiceCall
                                                      .call(
                                                serviceCategory: _model
                                                    .selectedServiceCategory,
                                                service: getJsonField(
                                                  servicesItem,
                                                  r'''$.name''',
                                                ).toString(),
                                                userProfile: getJsonField(
                                                  FFAppState().userProfile,
                                                  r'''$.data.name''',
                                                ).toString(),
                                                apiGlobalKey:
                                                    FFAppState().apiKey,
                                              );
                                              _shouldSetState = true;
                                              if ((_model.createdUserService
                                                      ?.succeeded ??
                                                  true)) {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            SkillLevelSheetWidget(
                                                          userService:
                                                              getJsonField(
                                                            (_model.createdUserService
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.data''',
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              } else {
                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }
                                            } else {
                                              _model.userServiceGet =
                                                  await TaskerpageBackendGroup
                                                      .getUserServicesCall
                                                      .call(
                                                filter:
                                                    '[[\"skill_category_name\",\"=\",\"${_model.selectedServiceCategory}\"],[\"skill_name\",\"=\",\"${getJsonField(
                                                  servicesItem,
                                                  r'''$.name''',
                                                ).toString()}\"],[\"customer_profile\",\"=\",\"${getJsonField(
                                                  FFAppState().userProfile,
                                                  r'''$.data.name''',
                                                ).toString()}\"]]',
                                                apiGlobalKey:
                                                    FFAppState().apiKey,
                                              );
                                              _shouldSetState = true;
                                              if ((_model.userServiceGet
                                                      ?.succeeded ??
                                                  true)) {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            SkillLevelSheetWidget(
                                                          userService:
                                                              getJsonField(
                                                            (_model.userServiceGet
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.data[0]''',
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              } else {
                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }
                                            }

                                            if (_shouldSetState)
                                              setState(() {});
                                          },
                                          child: Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color: FFAppState()
                                                          .SelectServices
                                                          .contains(
                                                              getJsonField(
                                                            servicesItem,
                                                            r'''$.name''',
                                                          ).toString()) ==
                                                      true
                                                  ? Color(0xFF5450E2)
                                                  : Color(0x00FFFFFF),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              border: Border.all(
                                                color: FFAppState()
                                                            .SelectServices
                                                            .contains(
                                                                getJsonField(
                                                              servicesItem,
                                                              r'''$.name''',
                                                            ).toString()) ==
                                                        true
                                                    ? Color(0xFF5450E2)
                                                    : Color(0xFF5E5D5D),
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 15.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      getJsonField(
                                                        servicesItem,
                                                        r'''$.skill_name''',
                                                      )
                                                          .toString()
                                                          .maybeHandleOverflow(
                                                            maxChars: 17,
                                                            replacement: '…',
                                                          ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Lato',
                                                            color: FFAppState()
                                                                        .SelectServices
                                                                        .contains(
                                                                            getJsonField(
                                                                          servicesItem,
                                                                          r'''$.name''',
                                                                        ).toString()) ==
                                                                    true
                                                                ? Color(0xFFF6F6F6)
                                                                : Color(0xFF5E5D5D),
                                                            fontSize: 12.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
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
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (!widget.addAnother)
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('Contactdata-1');
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
                            ],
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (!widget.addAnother) {
                                context.pushNamed(
                                  'Contactdata-1',
                                  queryParameters: {
                                    'taskCreation': serializeParam(
                                      false,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                );

                                setState(() {
                                  FFAppState().ChhosenSkillCategory = [];
                                });
                              } else {
                                context.pushNamed('Skills_List');

                                setState(() {
                                  FFAppState().ChhosenSkillCategory = [];
                                });
                              }
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
