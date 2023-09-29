import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/button_next_widget.dart';
import '/components/drawer_content_widget.dart';
import '/components/header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_intersted_model.dart';
export 'profile_intersted_model.dart';

class ProfileInterstedWidget extends StatefulWidget {
  const ProfileInterstedWidget({Key? key}) : super(key: key);

  @override
  _ProfileInterstedWidgetState createState() => _ProfileInterstedWidgetState();
}

class _ProfileInterstedWidgetState extends State<ProfileInterstedWidget> {
  late ProfileInterstedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileInterstedModel());

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
                          EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'What are you intersted in!',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          32.0, 100.0, 32.0, 0.0),
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
                              setState(() {
                                FFAppState().updateUserInformationStruct(
                                  (e) => e..role = 'Tasker',
                                );
                              });
                              _model.apiResult786 = await TaskerpageBackendGroup
                                  .changeMyRoleCall
                                  .call(
                                userRole: FFAppState().UserInformation.role,
                                id: getJsonField(
                                  FFAppState().userProfile,
                                  r'''$.data.name''',
                                ).toString(),
                                roleProfileName:
                                    FFAppState().UserInformation.role,
                                apiGlobalKey: FFAppState().apiKey,
                              );

                              setState(() {});
                            },
                            child: Container(
                              width: 230.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: FFAppState().UserInformation.role ==
                                        'Tasker'
                                    ? Color(0xFF5450E2)
                                    : Color(0x00000000),
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                  color: FFAppState().UserInformation.role ==
                                          'Tasker'
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
                                    ' I want to find work',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lato',
                                          color: FFAppState()
                                                      .UserInformation
                                                      .role ==
                                                  'Tasker'
                                              ? Color(0xFFF6F6F6)
                                              : Color(0xFF5E5D5D),
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 8.0, 32.0, 0.0),
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
                              setState(() {
                                FFAppState().updateUserInformationStruct(
                                  (e) => e..role = 'Poster',
                                );
                              });
                              _model.apiResult785 = await TaskerpageBackendGroup
                                  .changeMyRoleCall
                                  .call(
                                userRole: FFAppState().UserInformation.role,
                                id: getJsonField(
                                  FFAppState().userProfile,
                                  r'''$.data.name''',
                                ).toString(),
                                roleProfileName:
                                    FFAppState().UserInformation.role,
                                apiGlobalKey: FFAppState().apiKey,
                              );

                              setState(() {});
                            },
                            child: Container(
                              width: 230.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: FFAppState().UserInformation.role ==
                                        'Poster'
                                    ? Color(0xFF5450E2)
                                    : Color(0x00000000),
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                  color: FFAppState().UserInformation.role ==
                                          'Poster'
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
                                    'I want to get things done',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lato',
                                          color: FFAppState()
                                                      .UserInformation
                                                      .role ==
                                                  'Poster'
                                              ? Color(0xFFF6F6F6)
                                              : Color(0xFF5E5D5D),
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
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().UserInformation.role ==
                                  'POSTER') {
                                context.pushNamed('Skills-1');
                              } else {
                                context.pushNamed('Skills-3');
                              }

                              _model.apiResults8k = await TaskerpageBackendGroup
                                  .userProfileMeCall
                                  .call(
                                apiGlobalKey: FFAppState().apiKey,
                              );
                              setState(() {
                                FFAppState().userProfile =
                                    (_model.apiResults8k?.jsonBody ?? '');
                              });

                              setState(() {});
                            },
                            child: wrapWithModel(
                              model: _model.buttonNextModel,
                              updateCallback: () => setState(() {}),
                              child: ButtonNextWidget(
                                text: 'Next',
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
