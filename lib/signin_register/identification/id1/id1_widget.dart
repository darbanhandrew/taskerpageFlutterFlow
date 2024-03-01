import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/date_of_birth_pick_widget.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/side_bar_left_sign_up_widget.dart';
import '/components/text_field_and_title_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'id1_model.dart';
export 'id1_model.dart';

class Id1Widget extends StatefulWidget {
  const Id1Widget({
    super.key,
    String? name,
  }) : this.name = name ?? 'create';

  final String name;

  @override
  State<Id1Widget> createState() => _Id1WidgetState();
}

class _Id1WidgetState extends State<Id1Widget> {
  late Id1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Id1Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((widget.name == 'create') ||
          (widget.name == null || widget.name == '')) {
        setState(() {
          _model.updateIdentificationStruct(
            (e) => e
              ..name = 'new'
              ..customerProfile = getJsonField(
                FFAppState().userProfile,
                r'''$.data.name''',
              ).toString().toString(),
          );
        });
      } else {
        _model.apiResultd0a =
            await TaskerpageBackendGroup.getIdentificationDetailsCall.call(
          name: widget.name,
          apiGlobalKey: FFAppState().apiKey,
        );
        if ((_model.apiResultd0a?.succeeded ?? true)) {
          setState(() {
            _model.identification = functions.jsonToIdentificationStruct(
                TaskerpageBackendGroup.getIdentificationDetailsCall
                    .identificationJson(
              (_model.apiResultd0a?.jsonBody ?? ''),
            ));
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Identification doesn\'t exist,create a new one',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).secondary,
            ),
          );
          setState(() {
            _model.updateIdentificationStruct(
              (e) => e..name = 'new',
            );
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
                      return FFAppConstants.veryLargCardLR.toDouble();
                    } else {
                      return FFAppConstants.veryLargCardLR.toDouble();
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
                      return FFAppConstants.veryLargCardUD.toDouble();
                    } else {
                      return FFAppConstants.veryLargCardUD.toDouble();
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
                      return FFAppConstants.veryLargCardLR.toDouble();
                    } else {
                      return FFAppConstants.veryLargCardLR.toDouble();
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
                      return FFAppConstants.veryLargCardUD.toDouble();
                    } else {
                      return FFAppConstants.veryLargCardUD.toDouble();
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
                              selectedColor: 5,
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
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                  ],
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        32.0,
                                        valueOrDefault<double>(
                                          () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointSmall) {
                                              return 32.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointMedium) {
                                              return 32.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointLarge) {
                                              return 85.0;
                                            } else {
                                              return 85.0;
                                            }
                                          }(),
                                          0.0,
                                        ),
                                        32.0,
                                        0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Add full details according to your \nID document. \nThis will not be shown publicly!',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 30.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Title',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          color:
                                                              Color(0xFF292929),
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 6.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Builder(
                                                  builder: (context) {
                                                    final gender = FFAppState()
                                                        .gender
                                                        .toList();
                                                    return GridView.builder(
                                                      padding: EdgeInsets.zero,
                                                      gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 2,
                                                        crossAxisSpacing: 12.0,
                                                        mainAxisSpacing: 6.0,
                                                        childAspectRatio: 4.2,
                                                      ),
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount: gender.length,
                                                      itemBuilder: (context,
                                                          genderIndex) {
                                                        final genderItem =
                                                            gender[genderIndex];
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            setState(() {
                                                              _model
                                                                  .updateIdentificationStruct(
                                                                (e) => e
                                                                  ..title =
                                                                      genderItem,
                                                              );
                                                            });
                                                          },
                                                          child: Container(
                                                            width: 100.0,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2.0),
                                                              border:
                                                                  Border.all(
                                                                color: genderItem ==
                                                                        _model
                                                                            .identification
                                                                            ?.title
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  genderItem,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Lato',
                                                                        color: genderItem ==
                                                                                _model.identification?.title
                                                                            ? FlutterFlowTheme.of(context).primary
                                                                            : FlutterFlowTheme.of(context).secondary,
                                                                        fontSize:
                                                                            13.0,
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
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          height: 40.0,
                                          thickness: 1.0,
                                          color: Color(0xFFD4D4D4),
                                        ),
                                        wrapWithModel(
                                          model: _model.textFieldAndTitleModel1,
                                          updateCallback: () => setState(() {}),
                                          child: TextFieldAndTitleWidget(
                                            label: 'First name (Exactly as Id)',
                                            defaultValue: _model.identification!
                                                    .hasFirstName()
                                                ? _model
                                                    .identification!.firstName
                                                : '',
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 15.0, 0.0, 0.0),
                                          child: wrapWithModel(
                                            model:
                                                _model.textFieldAndTitleModel2,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: TextFieldAndTitleWidget(
                                              label:
                                                  'Last Name (Exactly as Id)',
                                              defaultValue: _model
                                                      .identification!
                                                      .hasLastName()
                                                  ? _model
                                                      .identification!.lastName
                                                  : '',
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 15.0, 0.0, 0.0),
                                          child: wrapWithModel(
                                            model: _model.dateOfBirthPickModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: DateOfBirthPickWidget(
                                              label: 'Date of birth',
                                              defaultValue: _model
                                                      .identification!
                                                      .hasDateOfBirth()
                                                  ? functions.jsonToDateTime(
                                                      _model.identification
                                                          ?.dateOfBirth)
                                                  : null,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
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
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                var _shouldSetState = false;
                                                setState(() {
                                                  _model
                                                      .updateIdentificationStruct(
                                                    (e) => e
                                                      ..firstName = _model
                                                          .textFieldAndTitleModel1
                                                          .stateController
                                                          .text
                                                      ..lastName = _model
                                                          .textFieldAndTitleModel2
                                                          .stateController
                                                          .text
                                                      ..dateOfBirth =
                                                          dateTimeFormat(
                                                              'yyyy/MM/dd',
                                                              _model
                                                                  .dateOfBirthPickModel
                                                                  .datePicked),
                                                  );
                                                });
                                                if (_model
                                                        .identification?.name ==
                                                    'new') {
                                                  setState(() {
                                                    _model
                                                        .updateIdentificationStruct(
                                                      (e) => e
                                                        ..name = ''
                                                        ..customerProfile =
                                                            getJsonField(
                                                          FFAppState()
                                                              .userProfile,
                                                          r'''$.data.name''',
                                                        ).toString(),
                                                    );
                                                  });
                                                  _model.createdIdentification =
                                                      await TaskerpageBackendGroup
                                                          .createIdentificationCall
                                                          .call(
                                                    bodyJson: functions
                                                        .identificationStructToJson(
                                                            _model
                                                                .identification!,
                                                            true),
                                                    apiGlobalKey:
                                                        FFAppState().apiKey,
                                                  );
                                                  _shouldSetState = true;
                                                  if ((_model
                                                          .createdIdentification
                                                          ?.succeeded ??
                                                      true)) {
                                                    setState(() {
                                                      _model.identification =
                                                          IdentificationStruct.maybeFromMap(
                                                              TaskerpageBackendGroup
                                                                  .createIdentificationCall
                                                                  .identificationJson(
                                                        (_model.createdIdentification
                                                                ?.jsonBody ??
                                                            ''),
                                                      ));
                                                    });
                                                  } else {
                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
                                                  }
                                                } else {
                                                  _model.apiResultemi =
                                                      await TaskerpageBackendGroup
                                                          .updateIdentificationDetailsCall
                                                          .call(
                                                    name: _model
                                                        .identification?.name,
                                                    bodyJson: functions
                                                        .identificationStructToJson(
                                                            _model
                                                                .identification!,
                                                            true),
                                                    apiGlobalKey:
                                                        FFAppState().apiKey,
                                                  );
                                                  _shouldSetState = true;
                                                  if ((_model.apiResultemi
                                                          ?.succeeded ??
                                                      true)) {
                                                    setState(() {
                                                      _model.identification =
                                                          IdentificationStruct.maybeFromMap(
                                                              TaskerpageBackendGroup
                                                                  .updateIdentificationDetailsCall
                                                                  .identificationJson(
                                                        (_model.apiResultemi
                                                                ?.jsonBody ??
                                                            ''),
                                                      ));
                                                    });
                                                  } else {
                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
                                                  }
                                                }

                                                context.pushNamed(
                                                  'ID2',
                                                  queryParameters: {
                                                    'name': serializeParam(
                                                      _model
                                                          .identification?.name,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                if (_shouldSetState)
                                                  setState(() {});
                                              },
                                              child: Container(
                                                width: 104.0,
                                                height: 36.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          1.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Save',
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                      ],
                    ),
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
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                    tabletLandscape: false,
                  ))
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 121.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'For many',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: Color(0xFF494949),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 0.0, 4.0, 0.0),
                                  child: Text(
                                    'tasks identification',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lato',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                Text(
                                  'is most',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: Color(0xFF494949),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: Text(
                              'Important for people',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Color(0xFF494949),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/Group_1235.png',
                                        width: 418.0,
                                        height: 364.0,
                                        fit: BoxFit.none,
                                      ),
                                    ),
                                  ],
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
          ),
        ),
      ),
    );
  }
}
