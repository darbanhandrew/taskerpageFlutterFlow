import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
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
                  color: Color(0xFF5450E2),
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
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Stack(
                alignment: AlignmentDirectional(0.0, 0.0),
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
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
                      if (TaskerpageBackendGroup.userProfileMeCall
                              .userRole(
                                containerUserProfileMeResponse.jsonBody,
                              )
                              .toString() ==
                          'POSTER')
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 50.0,
                          icon: Icon(
                            Icons.person_search_sharp,
                            color: Color(0xFF5E5D5D),
                            size: 28.0,
                          ),
                          onPressed: () async {
                            context.pushNamed('TaskerList');
                          },
                        ),
                      if (TaskerpageBackendGroup.userProfileMeCall
                              .userRole(
                                containerUserProfileMeResponse.jsonBody,
                              )
                              .toString() ==
                          'TASKER')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.home,
                              color: Color(0xFF5E5D5D),
                              size: 21.0,
                            ),
                            onPressed: () async {
                              context.pushNamed('MainHomePage');
                            },
                          ),
                        ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 50.0,
                        icon: Icon(
                          Icons.chat_bubble_rounded,
                          color: Color(0xFF5E5D5D),
                          size: 24.0,
                        ),
                        onPressed: () async {
                          context.pushNamed('inbox');
                        },
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if (TaskerpageBackendGroup.userProfileMeCall
                                  .userRole(
                                    containerUserProfileMeResponse.jsonBody,
                                  )
                                  .toString() ==
                              'POSTER')
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
                                context.pushNamed(
                                  'Task-1',
                                  queryParameters: {
                                    'id': serializeParam(
                                      null,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                            ),
                          if (TaskerpageBackendGroup.userProfileMeCall
                                  .userRole(
                                    containerUserProfileMeResponse.jsonBody,
                                  )
                                  .toString() ==
                              'TASKER')
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 25.0,
                              borderWidth: 1.0,
                              buttonSize: 60.0,
                              fillColor: Color(0xFFF06543),
                              icon: Icon(
                                Icons.search_rounded,
                                color: Colors.white,
                                size: 30.0,
                              ),
                              onPressed: () async {
                                context.pushNamed('TaskList');
                              },
                            ),
                        ],
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 50.0,
                        icon: Icon(
                          Icons.chair_rounded,
                          color: Color(0xFF5E5D5D),
                          size: 25.0,
                        ),
                        onPressed: () async {
                          context.pushNamed('AppointmentList');
                        },
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 50.0,
                        icon: Icon(
                          Icons.pie_chart,
                          color: Color(0xFF5E5D5D),
                          size: 25.0,
                        ),
                        onPressed: () async {
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
