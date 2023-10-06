import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_bar_model.dart';
export 'nav_bar_model.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({Key? key}) : super(key: key);

  @override
  _NavBarWidgetState createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  late NavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 6.5),
      child: FutureBuilder<ApiCallResponse>(
        future: TaskerpageBackendGroup.userProfileMeCall.call(
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
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            );
          }
          final containerUserProfileMeResponse = snapshot.data!;
          return Container(
            width: double.infinity,
            height: 70.0,
            decoration: BoxDecoration(
              color: Color(0x00FFFFFF),
            ),
            child: Align(
              alignment: AlignmentDirectional(0.00, 0.00),
              child: Stack(
                alignment: AlignmentDirectional(0.0, 0.0),
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Material(
                        color: Colors.transparent,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 70.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFE7E7E7),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (functions.jsonToString(getJsonField(
                            FFAppState().userProfile,
                            r'''$.data.role''',
                          )) ==
                          'Poster')
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 50.0,
                          icon: Icon(
                            Icons.search_off,
                            color: FFAppState().checkNavbarState == 5
                                ? Color(0xFF5450E2)
                                : Color(0xFF5E5D5D),
                            size: 28.0,
                          ),
                          onPressed: () async {
                            setState(() {
                              FFAppState().checkNavbarState = 5;
                            });

                            context.pushNamed('TaskerList');
                          },
                        ),
                      if (functions.jsonToString(getJsonField(
                            FFAppState().userProfile,
                            r'''$.data.role''',
                          )) ==
                          'Tasker')
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            setState(() {
                              FFAppState().checkNavbarState = 1;
                            });
                            if (functions.jsonToString(getJsonField(
                                  FFAppState().userProfile,
                                  r'''$.data.role''',
                                )) ==
                                'Poster') {
                              context.pushNamed('Poster_Profile');
                            } else {
                              context.pushNamed('Tasker_Profile');
                            }
                          },
                          child: Container(
                            width: FFAppState().checkNavbarState == 1
                                ? 40.0
                                : 37.0,
                            height: 37.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              getJsonField(
                                        FFAppState().userProfile,
                                        r'''$.data.avatar''',
                                      ) !=
                                      null
                                  ? 'https://taskerpage.com${getJsonField(
                                      FFAppState().userProfile,
                                      r'''$.data.avatar''',
                                    ).toString()}'
                                  : 'https://upload.wikimedia.org/wikipedia/commons/b/b5/Windows_10_Default_Profile_Picture.svg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 50.0,
                        icon: Icon(
                          Icons.group_rounded,
                          color: FFAppState().checkNavbarState == 2
                              ? Color(0xFF5450E2)
                              : Color(0xFF5E5D5D),
                          size: 25.0,
                        ),
                        onPressed: () async {
                          if (functions.jsonToString(getJsonField(
                                containerUserProfileMeResponse.jsonBody,
                                r'''$.data.role''',
                              )) ==
                              'Tasker') {
                            setState(() {
                              FFAppState().checkNavbarState = 2;
                            });

                            context.pushNamed('MyInbox');
                          } else {
                            setState(() {
                              FFAppState().checkNavbarState = 2;
                            });

                            context.pushNamed('MyPosts');
                          }
                        },
                      ),
                      Flexible(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (functions.jsonToString(getJsonField(
                                  FFAppState().userProfile,
                                  r'''$.data.role''',
                                )) ==
                                'Poster')
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 25.0,
                                borderWidth: 1.0,
                                buttonSize: 60.0,
                                fillColor: Color(0xFFF06543),
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                                onPressed: () async {
                                  setState(() {
                                    FFAppState().checkNavbarState = 6;
                                  });

                                  context.pushNamed(
                                    'Task-1',
                                    queryParameters: {
                                      'id': serializeParam(
                                        null,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                              ),
                            if (functions.jsonToString(getJsonField(
                                  FFAppState().userProfile,
                                  r'''$.data.role''',
                                )) ==
                                'Tasker')
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 25.0,
                                borderWidth: 1.0,
                                buttonSize: 60.0,
                                fillColor: Color(0xFFF06543),
                                icon: Icon(
                                  Icons.search_off,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                                onPressed: () async {
                                  context.pushNamed('TaskList');
                                },
                              ),
                          ],
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 50.0,
                        icon: Icon(
                          Icons.chair_rounded,
                          color: FFAppState().checkNavbarState == 3
                              ? Color(0xFF5450E2)
                              : Color(0xFF5E5D5D),
                          size: 25.0,
                        ),
                        onPressed: () async {
                          setState(() {
                            FFAppState().checkNavbarState = 3;
                          });

                          context.pushNamed('AppointmentList');
                        },
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 50.0,
                        icon: Icon(
                          Icons.space_dashboard,
                          color: FFAppState().checkNavbarState == 4
                              ? Color(0xFF5450E2)
                              : Color(0xFF5E5D5D),
                          size: 25.0,
                        ),
                        onPressed: () async {
                          setState(() {
                            FFAppState().checkNavbarState = 4;
                          });

                          context.pushNamed('TaskersDashboard');
                        },
                      ),
                    ].divide(SizedBox(width: 15.0)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
