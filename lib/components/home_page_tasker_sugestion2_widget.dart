import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_tasker_sugestion2_model.dart';
export 'home_page_tasker_sugestion2_model.dart';

class HomePageTaskerSugestion2Widget extends StatefulWidget {
  const HomePageTaskerSugestion2Widget({
    super.key,
    required this.taskerSugestion2,
  });

  final HomePageTaskerSugestion2InputStruct? taskerSugestion2;

  @override
  State<HomePageTaskerSugestion2Widget> createState() =>
      _HomePageTaskerSugestion2WidgetState();
}

class _HomePageTaskerSugestion2WidgetState
    extends State<HomePageTaskerSugestion2Widget> {
  late HomePageTaskerSugestion2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageTaskerSugestion2Model());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 38.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                valueOrDefault<String>(
                  widget.taskerSugestion2?.title,
                  'Meet some Taskers!',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Lato',
                      color: Color(0xFF222222),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 11.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                valueOrDefault<String>(
                  widget.taskerSugestion2?.subTitle,
                  'Discover the story behind the people that  are making the tasker.page community great',
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Lato',
                      color: FlutterFlowTheme.of(context).alternate,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(27.0, 23.0, 0.0, 45.0),
          child: Builder(
            builder: (context) {
              final taskerSugestion2Items =
                  widget.taskerSugestion2?.taskerList2?.toList() ?? [];
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(taskerSugestion2Items.length,
                      (taskerSugestion2ItemsIndex) {
                    final taskerSugestion2ItemsItem =
                        taskerSugestion2Items[taskerSugestion2ItemsIndex];
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 5.0),
                      child: FutureBuilder<ApiCallResponse>(
                        future: TaskerpageBackendGroup.userProfileReadCall.call(
                          id: taskerSugestion2ItemsItem,
                          apiGlobalKey: FFAppState().apiKey,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 35.0,
                                height: 35.0,
                                child: SpinKitThreeBounce(
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 35.0,
                                ),
                              ),
                            );
                          }
                          final containerUserProfileReadResponse =
                              snapshot.data!;
                          return Container(
                            width: 317.0,
                            height: 367.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x33000000),
                                  offset: Offset(0.0, 0.0),
                                )
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.network(
                                          '${FFAppState().baseUrl}${getJsonField(
                                            containerUserProfileReadResponse
                                                .jsonBody,
                                            r'''$.data.avatar''',
                                          ).toString()}',
                                          width: 300.0,
                                          height: 140.47,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.3, 24.4, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'I’m ${getJsonField(
                                          containerUserProfileReadResponse
                                              .jsonBody,
                                          r'''$.data.first_name''',
                                        ).toString()} ${getJsonField(
                                          containerUserProfileReadResponse
                                              .jsonBody,
                                          r'''$.data.last_name''',
                                        ).toString()} ! a ${getJsonField(
                                          containerUserProfileReadResponse
                                              .jsonBody,
                                          r'''$.data.role''',
                                        ).toString()} !',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: Color(0xFF222222),
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.3, 12.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        getJsonField(
                                          containerUserProfileReadResponse
                                              .jsonBody,
                                          r'''$.data.describtion''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: Color(0xFF222222),
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.3, 25.5, 20.9, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: Image.asset(
                                                'assets/images/Mask_Group_391.png',
                                                width: 19.7,
                                                height: 19.7,
                                                fit: BoxFit.none,
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 11.5)),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          RatingBarIndicator(
                                            itemBuilder: (context, index) =>
                                                Icon(
                                              Icons.star_rounded,
                                              color: Color(0xFFEEC249),
                                            ),
                                            direction: Axis.horizontal,
                                            rating: getJsonField(
                                              containerUserProfileReadResponse
                                                  .jsonBody,
                                              r'''$.data.review_average''',
                                            ),
                                            unratedColor: Color(0xFFDCDCDC),
                                            itemCount: 5,
                                            itemSize: 15.0,
                                          ),
                                          Text(
                                            getJsonField(
                                              containerUserProfileReadResponse
                                                  .jsonBody,
                                              r'''$.data.review_count''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lato',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ].divide(SizedBox(height: 5.0)),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 33.6, 0.0, 0.0),
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
                                            'User_profile',
                                            queryParameters: {
                                              'id': serializeParam(
                                                getJsonField(
                                                  containerUserProfileReadResponse
                                                      .jsonBody,
                                                  r'''$.data.name''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Container(
                                          width: 152.0,
                                          height: 35.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.5,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'See more',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: Icon(
                                                  Icons
                                                      .keyboard_arrow_right_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 17.0,
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
                          );
                        },
                      ),
                    );
                  }).divide(SizedBox(width: 7.0)),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
