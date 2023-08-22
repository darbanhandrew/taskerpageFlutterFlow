import '/backend/api_requests/api_calls.dart';
import '/components/header_widget.dart';
import '/components/skill_level_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'skills4_model.dart';
export 'skills4_model.dart';

class Skills4Widget extends StatefulWidget {
  const Skills4Widget({Key? key}) : super(key: key);

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
      _model.apiResultmry =
          await TaskerpageBackendGroup.serviceCategoryListCall.call(
        isActive: true,
        apiGlobalKey: FFAppState().apiKey,
      );
      if ((_model.apiResultmry?.succeeded ?? true)) {
        setState(() {
          _model.serviceCategoriesJson = (_model.apiResultmry?.jsonBody ?? '');
          _model.selectedServiceCategory =
              FFAppState().chosenServiceCategories.first;
        });
      } else {
        return;
      }

      _model.apiResultekd = await TaskerpageBackendGroup.userProfileMeCall.call(
        apiGlobalKey: FFAppState().apiKey,
      );
      if ((_model.apiResultekd?.succeeded ?? true)) {
        setState(() {
          _model.userServices = getJsonField(
            (_model.apiResultekd?.jsonBody ?? ''),
            r'''$.user_services''',
          )!
              .toList()
              .cast<dynamic>();
        });
        return;
      } else {
        return;
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
                          child: HeaderWidget(
                            openDrawer: () async {},
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
                          final serviceCategoryIds = functions
                              .getSelectedServiceCategoriesJson(
                                  FFAppState().chosenServiceCategories.toList(),
                                  _model.serviceCategoriesJson!)
                              .toList();
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
                                        getJsonField(
                                      serviceCategoryIdsItem,
                                      r'''$.id''',
                                    );
                                  });
                                },
                                child: Container(
                                  width: 230.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: getJsonField(
                                              serviceCategoryIdsItem,
                                              r'''$.id''',
                                            ) ==
                                            _model.selectedServiceCategory
                                        ? Color(0xFF5450E2)
                                        : Color(0x00FFFFFF),
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(
                                      color: getJsonField(
                                                serviceCategoryIdsItem,
                                                r'''$.id''',
                                              ) ==
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
                                        valueOrDefault<String>(
                                          functions.getTranslatableItemString(
                                              getJsonField(
                                                serviceCategoryIdsItem,
                                                r'''$.name''',
                                              ),
                                              'en'),
                                          'selectedCategory',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: getJsonField(
                                                        serviceCategoryIdsItem,
                                                        r'''$.id''',
                                                      ) ==
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
                                    _model.selectedServiceCategory.toString(),
                                apiGlobalKey: FFAppState().apiKey,
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
                                            _model.createdUserService =
                                                await TaskerpageBackendGroup
                                                    .createUserServiceCall
                                                    .call(
                                              serviceCategory: _model
                                                  .selectedServiceCategory,
                                              service: getJsonField(
                                                servicesItem,
                                                r'''$.id''',
                                              ),
                                              serviceSkillLevel: 'SELF_TRAINED',
                                              userProfile: getJsonField(
                                                FFAppState().userProfile,
                                                r'''$.id''',
                                              ),
                                              apiGlobalKey: FFAppState().apiKey,
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
                                                    onTap: () => FocusScope.of(
                                                            context)
                                                        .requestFocus(
                                                            _model.unfocusNode),
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          SkillLevelSheetWidget(
                                                        id: getJsonField(
                                                          (_model.createdUserService
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.id''',
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            } else {
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }

                                            if (_shouldSetState)
                                              setState(() {});
                                          },
                                          child: Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color: _model.userServices
                                                          .where((e) =>
                                                              getJsonField(
                                                                e,
                                                                r'''$.service.id''',
                                                              ) ==
                                                              getJsonField(
                                                                servicesItem,
                                                                r'''$.id''',
                                                              ))
                                                          .toList()
                                                          .length >
                                                      0
                                                  ? Color(0xFF5450E2)
                                                  : Color(0x00FFFFFF),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              border: Border.all(
                                                color: _model.userServices
                                                            .where((e) =>
                                                                getJsonField(
                                                                  e,
                                                                  r'''$.service.id''',
                                                                ) ==
                                                                getJsonField(
                                                                  servicesItem,
                                                                  r'''$.id''',
                                                                ))
                                                            .toList()
                                                            .length >
                                                        0
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
                                                  Text(
                                                    valueOrDefault<String>(
                                                      functions
                                                          .getTranslatableItemString(
                                                              getJsonField(
                                                                servicesItem,
                                                                r'''$.name''',
                                                              ),
                                                              'en'),
                                                      'selectedService',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          color: functions
                                                                  .checkIfServiceExists(
                                                                      FFAppState()
                                                                          .userServices
                                                                          .toList(),
                                                                      getJsonField(
                                                                        servicesItem,
                                                                        r'''$.id''',
                                                                      ),
                                                                      _model
                                                                          .selectedServiceCategory!)
                                                              ? Color(
                                                                  0xFFF6F6F6)
                                                              : Color(
                                                                  0xFF5E5D5D),
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w500,
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
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('Contactdata-1');
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
