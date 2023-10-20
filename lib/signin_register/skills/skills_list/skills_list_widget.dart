import '/backend/api_requests/api_calls.dart';
import '/components/drawer_content_widget.dart';
import '/components/header_widget.dart';
import '/components/nav_bar_widget.dart';
import '/components/navigate_back_widget.dart';
import '/components/skill_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'skills_list_model.dart';
export 'skills_list_model.dart';

class SkillsListWidget extends StatefulWidget {
  const SkillsListWidget({Key? key}) : super(key: key);

  @override
  _SkillsListWidgetState createState() => _SkillsListWidgetState();
}

class _SkillsListWidgetState extends State<SkillsListWidget> {
  late SkillsListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SkillsListModel());

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
        backgroundColor: Color(0xFFF2F2F2),
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
              wrapWithModel(
                model: _model.headerModel,
                updateCallback: () => setState(() {}),
                child: HeaderWidget(
                  openDrawer: () async {
                    scaffoldKey.currentState!.openDrawer();
                  },
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.navigateBackModel,
                                      updateCallback: () => setState(() {}),
                                      child: NavigateBackWidget(
                                        text: 'Skills',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  32.0, 8.0, 32.0, 16.0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: (_model.apiRequestCompleter ??=
                                        Completer<ApiCallResponse>()
                                          ..complete(TaskerpageBackendGroup
                                              .customerProfileSkillsListCall
                                              .call(
                                            apiGlobalKey: FFAppState().apiKey,
                                            fields:
                                                '[\"skill_category_name\",\"skill_name\",\"name\",\"skill_level\"]',
                                            filters:
                                                '[[\"customer_profile\",\"=\",\"${getJsonField(
                                              FFAppState().userProfile,
                                              r'''$.data.name''',
                                            ).toString()}\"]]',
                                          )))
                                    .future,
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
                                  final listViewCustomerProfileSkillsListResponse =
                                      snapshot.data!;
                                  return Builder(
                                    builder: (context) {
                                      final myServices = getJsonField(
                                        listViewCustomerProfileSkillsListResponse
                                            .jsonBody,
                                        r'''$.data''',
                                      ).toList();
                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: myServices.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 16.0),
                                        itemBuilder:
                                            (context, myServicesIndex) {
                                          final myServicesItem =
                                              myServices[myServicesIndex];
                                          return Container(
                                            height: 285.0,
                                            decoration: BoxDecoration(),
                                            child: wrapWithModel(
                                              model: _model.skillCardModels
                                                  .getModel(
                                                myServicesIndex.toString(),
                                                myServicesIndex,
                                              ),
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: SkillCardWidget(
                                                key: Key(
                                                  'Key5mz_${myServicesIndex.toString()}',
                                                ),
                                                userService: myServicesItem,
                                                index: myServicesIndex,
                                                action: () async {
                                                  setState(() => _model
                                                          .apiRequestCompleter =
                                                      null);
                                                  await _model
                                                      .waitForApiRequestCompleted();
                                                },
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  32.0, 0.0, 32.0, 30.0),
                              child: Container(
                                width: double.infinity,
                                height: 180.0,
                                decoration: BoxDecoration(
                                  color: Color(0x00FFFFFF),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: Image.asset(
                                      'assets/images/Rectangle_1937.png',
                                    ).image,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      32.0, 24.0, 32.0, 20.0),
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
                                          context.pushNamed(
                                            'Skills-3',
                                            queryParameters: {
                                              'addAnother': serializeParam(
                                                true,
                                                ParamType.bool,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Container(
                                          width: 184.0,
                                          height: 36.0,
                                          decoration: BoxDecoration(
                                            color: Color(0x00FFFFFF),
                                            borderRadius:
                                                BorderRadius.circular(1.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '+ Add another Skills',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w500,
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
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        wrapWithModel(
                          model: _model.navBarModel,
                          updateCallback: () => setState(() {}),
                          child: NavBarWidget(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
