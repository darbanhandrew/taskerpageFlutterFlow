import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/drawer_content_widget.dart';
import '/components/header_widget.dart';
import '/components/selectable_skill_details_widget.dart';
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
      _model.userProfile = await TaskerpageBackendGroup.userProfileMeCall.call(
        apiGlobalKey: FFAppState().apiKey,
      );
      if ((_model.userProfile?.succeeded ?? true)) {
        setState(() {
          _model.customerProfileSkills = TaskerpageBackendGroup
              .userProfileMeCall
              .customerSkills(
                (_model.userProfile?.jsonBody ?? ''),
              )!
              .map((e) =>
                  e != null && e != '' ? UserServiceStruct.fromMap(e) : null)
              .withoutNulls
              .toList()
              .toList()
              .cast<UserServiceStruct>();
        });
        setState(() {});
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              wrapWithModel(
                model: _model.headerModel,
                updateCallback: () => setState(() {}),
                child: Hero(
                  tag: 'header',
                  transitionOnUserGestures: true,
                  child: Material(
                    color: Colors.transparent,
                    child: HeaderWidget(
                      openDrawer: () async {
                        scaffoldKey.currentState!.openDrawer();
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 32.0, 15.0, 0.0),
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
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    90.0, 30.0, 90.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final serviceCategoryIds = _model
                                        .customerProfileSkills
                                        .map((e) => e.skillCategoryName)
                                        .toList();
                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: serviceCategoryIds.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 8.0),
                                      itemBuilder:
                                          (context, serviceCategoryIdsIndex) {
                                        final serviceCategoryIdsItem =
                                            serviceCategoryIds[
                                                serviceCategoryIdsIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            setState(() {
                                              _model.selectedServiceCategory =
                                                  serviceCategoryIdsItem;
                                              _model.selectedCategoryIndex =
                                                  serviceCategoryIdsIndex;
                                            });
                                          },
                                          child: Container(
                                            width: 160.0,
                                            height: 36.0,
                                            decoration: BoxDecoration(
                                              color: serviceCategoryIdsItem ==
                                                      _model
                                                          .selectedServiceCategory
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(0.0, 2.0),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                              border: Border.all(
                                                color: serviceCategoryIdsItem ==
                                                        _model
                                                            .selectedServiceCategory
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : Colors.white,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  serviceCategoryIdsItem,
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Lato',
                                                            color: serviceCategoryIdsItem ==
                                                                    _model
                                                                        .selectedServiceCategory
                                                                ? Colors.white
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight.w500,
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
                              FutureBuilder<ApiCallResponse>(
                                future:
                                    TaskerpageBackendGroup.getServicesCall.call(
                                  category: '[]',
                                  fields:
                                      '[\"name\",\"skill_category_name\",\"skills\",\"skill_options\",\"name\"]',
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: SpinKitThreeBounce(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 50.0,
                                        ),
                                      ),
                                    );
                                  }
                                  final listViewGetServicesResponse =
                                      snapshot.data!;
                                  return ListView(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      if (_model.selectedServiceCategory ==
                                          getJsonField(
                                            listViewGetServicesResponse
                                                .jsonBody,
                                            r'''$.data.name''',
                                          ))
                                        FutureBuilder<ApiCallResponse>(
                                          future: TaskerpageBackendGroup
                                              .getSkillCategoryDetailsCall
                                              .call(
                                            name:
                                                _model.selectedServiceCategory,
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 50.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            final selectableSkillDetailsGetSkillCategoryDetailsResponse =
                                                snapshot.data!;
                                            return wrapWithModel(
                                              model: _model
                                                  .selectableSkillDetailsModel,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child:
                                                  SelectableSkillDetailsWidget(
                                                selectedCategoryIndex: _model
                                                    .selectedCategoryIndex,
                                                customerProfileSkills: _model
                                                    .customerProfileSkills,
                                                skillCategory:
                                                    SkillCategoryStruct.fromMap(
                                                        getJsonField(
                                                  selectableSkillDetailsGetSkillCategoryDetailsResponse
                                                      .jsonBody,
                                                  r'''$.data''',
                                                )),
                                                selectedCustomerProfileSkill: _model
                                                        .customerProfileSkills[
                                                    _model
                                                        .selectedCategoryIndex!],
                                              ),
                                            );
                                          },
                                        ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
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
                              _model.selectedCategoryIndex = 0;
                              while (_model.customerProfileSkills.length >
                                  _model.selectedCategoryIndex!) {
                                _model.skillCategoryDetails =
                                    await TaskerpageBackendGroup
                                        .getSkillCategoryDetailsCall
                                        .call(
                                  name: _model
                                      .customerProfileSkills[
                                          _model.selectedCategoryIndex!]
                                      .skillCategoryName,
                                  apiGlobalKey: FFAppState().apiKey,
                                );
                                if ((_model.skillCategoryDetails?.succeeded ??
                                    true)) {
                                  _model.selectedSkills = TaskerpageBackendGroup
                                      .getSkillCategoryDetailsCall
                                      .skills(
                                        (_model.skillCategoryDetails
                                                ?.jsonBody ??
                                            ''),
                                      )!
                                      .map((e) => e != null && e != ''
                                          ? SkillStruct.fromMap(e)
                                          : null)
                                      .withoutNulls
                                      .toList()
                                      .cast<SkillStruct>();
                                  while (_model.selectedSkills.length >
                                      _model.innerLoopIndex!) {
                                    if (!_model
                                        .selectableSkillDetailsModel
                                        .selectableSkillsListModel
                                        .selectableBoxModels
                                        .getValueForKey(
                                      _model
                                          .selectedSkills[
                                              _model.innerLoopIndex!]
                                          .skill,
                                      (m) => m.checkboxValue,
                                    )!) {
                                      _model.removeAtIndexFromSelectedSkills(
                                          _model.innerLoopIndex!);
                                    }
                                    _model.innerLoopIndex =
                                        _model.innerLoopIndex! + 1;
                                  }
                                }
                                _model.updateCustomerProfileSkillsAtIndex(
                                  _model.selectedCategoryIndex!,
                                  (e) => e
                                    ..skills = _model.selectedSkills.toList(),
                                );
                                _model.updateCustomerProfileSkillsAtIndex(
                                  _model.selectedCategoryIndex!,
                                  (e) => e
                                    ..skillLevel = _model
                                        .selectableSkillDetailsModel
                                        .selectSkillLevelModel
                                        .choiceChipsValue,
                                );
                                _model.innerLoopIndex = 0;
                                while (SkillCategoryStruct.fromMap((_model
                                                .skillCategoryDetails
                                                ?.jsonBody ??
                                            ''))
                                        .skillOptions
                                        .length >
                                    _model.innerLoopIndex!) {
                                  _model.updateCustomerProfileSkillsAtIndex(
                                    _model.selectedCategoryIndex!,
                                    (e) => e
                                      ..updateCustomerSkillOptions(
                                        (e) => e[_model.innerLoopIndex!]
                                          ..values = (((_model.skillCategoryDetails?.jsonBody ??
                                                                              '') !=
                                                                          null &&
                                                                      (_model.skillCategoryDetails?.jsonBody ??
                                                                              '') !=
                                                                          ''
                                                                  ? SkillCategoryStruct.fromMap((_model
                                                                          .skillCategoryDetails
                                                                          ?.jsonBody ??
                                                                      ''))
                                                                  : null)
                                                              ?.skillOptions?[
                                                          _model
                                                              .innerLoopIndex!])
                                                      ?.type ==
                                                  'Select'
                                              ? functions.convertListOfStringToString(_model
                                                  .selectableSkillDetailsModel
                                                  .skillOptionsChipsComponentModels
                                                  .getValueForKey(
                                                    SkillCategoryStruct.fromMap(
                                                            (_model.skillCategoryDetails
                                                                    ?.jsonBody ??
                                                                ''))
                                                        .skillOptions[_model
                                                            .innerLoopIndex!]
                                                        .optionName,
                                                    (m) => m.choiceChipsValues,
                                                  )
                                                  ?.toList())
                                              : _model
                                                  .selectableSkillDetailsModel
                                                  .skillOptionsCheckComponentModels
                                                  .getValueForKey(
                                                    SkillCategoryStruct.fromMap(
                                                            (_model.skillCategoryDetails
                                                                    ?.jsonBody ??
                                                                ''))
                                                        .skillOptions[_model
                                                            .innerLoopIndex!]
                                                        .optionName,
                                                    (m) => m.switchValue,
                                                  )
                                                  ?.toString(),
                                      ),
                                  );
                                  _model.innerLoopIndex =
                                      _model.innerLoopIndex! + 1;
                                }
                                _model.selectedCategoryIndex =
                                    _model.selectedCategoryIndex! + 1;
                              }
                              FFAppState().updateUserStruct(
                                (e) => e
                                  ..customerSkills =
                                      _model.customerProfileSkills.toList(),
                              );
                              _model.apiResulteko = await TaskerpageBackendGroup
                                  .updateCustomerProfileCall
                                  .call(
                                customerSkillsJson: _model.customerProfileSkills
                                    .map((e) => e.toMap())
                                    .toList(),
                                apiGlobalKey: FFAppState().apiKey,
                              );
                              if ((_model.apiResulteko?.succeeded ?? true)) {
                                context.pushNamed('Skills_List');
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'there was a problem updating your skills',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                              }

                              setState(() {});
                            },
                            child: Container(
                              width: 104.0,
                              height: 36.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                borderRadius: BorderRadius.circular(1.0),
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
            ].divide(SizedBox(height: 0.0)),
          ),
        ),
      ),
    );
  }
}
