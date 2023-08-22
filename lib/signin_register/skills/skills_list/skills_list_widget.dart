import '/backend/api_requests/api_calls.dart';
import '/components/header_widget.dart';
import '/components/nav_bar_widget.dart';
import '/components/navigate_back_widget.dart';
import '/components/skill_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
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
              wrapWithModel(
                model: _model.headerModel,
                updateCallback: () => setState(() {}),
                child: HeaderWidget(
                  openDrawer: () async {},
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
                                  32.0, 8.0, 32.0, 0.0),
                              child: FutureBuilder<ApiCallResponse>(
                                future:
                                    TaskerpageBackendGroup.myServicesCall.call(
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
                                  final listViewMyServicesResponse =
                                      snapshot.data!;
                                  return Builder(
                                    builder: (context) {
                                      final myServices =
                                          TaskerpageBackendGroup.myServicesCall
                                                  .myServices(
                                                    listViewMyServicesResponse
                                                        .jsonBody,
                                                  )
                                                  ?.toList() ??
                                              [];
                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: myServices.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 24.0),
                                        itemBuilder:
                                            (context, myServicesIndex) {
                                          final myServicesItem =
                                              myServices[myServicesIndex];
                                          return Container(
                                            height: 200.0,
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
                                                  'Keyq1g_${myServicesIndex.toString()}',
                                                ),
                                                userService: getJsonField(
                                                  myServicesItem,
                                                  r'''$''',
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  32.0, 24.0, 32.0, 0.0),
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
                                      context.pushNamed('add_another_skill');
                                    },
                                    child: Container(
                                      width: 180.0,
                                      height: 44.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF5450E2),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '+ Add another Skills',
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
