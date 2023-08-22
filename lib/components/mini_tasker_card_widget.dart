import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mini_tasker_card_model.dart';
export 'mini_tasker_card_model.dart';

class MiniTaskerCardWidget extends StatefulWidget {
  const MiniTaskerCardWidget({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int? id;

  @override
  _MiniTaskerCardWidgetState createState() => _MiniTaskerCardWidgetState();
}

class _MiniTaskerCardWidgetState extends State<MiniTaskerCardWidget> {
  late MiniTaskerCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MiniTaskerCardModel());

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

    return Align(
      alignment: AlignmentDirectional(-1.0, 0.0),
      child: FutureBuilder<ApiCallResponse>(
        future: TaskerpageBackendGroup.userProfileReadCall.call(
          id: widget.id,
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
          final flippableCardUserProfileReadResponse = snapshot.data!;
          return FlipCard(
            fill: Fill.fillBack,
            direction: FlipDirection.HORIZONTAL,
            speed: 400,
            front: Container(
              width: 160.0,
              height: 150.0,
              decoration: BoxDecoration(
                color: Color(0xFFF6F6F6),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4.0,
                    color: Color(0x33000000),
                    offset: Offset(0.0, 2.0),
                  )
                ],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: 100.0,
                          height: 32.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF5450E2),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                TaskerpageBackendGroup.userProfileReadCall
                                    .createdAt(
                                      flippableCardUserProfileReadResponse
                                          .jsonBody,
                                    )
                                    .toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Color(0xFFF6F6F6),
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              Text(
                                TaskerpageBackendGroup.userProfileReadCall
                                    .dateOfBirth(
                                      flippableCardUserProfileReadResponse
                                          .jsonBody,
                                    )
                                    .toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Color(0xFFF6F6F6),
                                      fontSize: 9.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ].divide(SizedBox(height: 3.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 10.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/08hcy_d.png',
                                        width: 15.0,
                                        height: 15.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/emad.png',
                                        width: 15.0,
                                        height: 15.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 3.5)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 6.0, 0.0, 6.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: Text(
                                        TaskerpageBackendGroup
                                            .userProfileReadCall
                                            .reviewCount(
                                              flippableCardUserProfileReadResponse
                                                  .jsonBody,
                                            )
                                            .toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: Colors.black,
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                    Container(
                                      width: 54.0,
                                      height: 14.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF03CA17),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 5.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              TaskerpageBackendGroup
                                                  .userProfileReadCall
                                                  .reviewAverage(
                                                    flippableCardUserProfileReadResponse
                                                        .jsonBody,
                                                  )
                                                  .toString(),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Lato',
                                                    color: Color(0xFFF6F6F6),
                                                    fontSize: 9.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                            RatingBarIndicator(
                                              itemBuilder: (context, index) =>
                                                  Icon(
                                                Icons.star_rounded,
                                                color: Colors.white,
                                              ),
                                              direction: Axis.horizontal,
                                              rating: TaskerpageBackendGroup
                                                  .userProfileReadCall
                                                  .reviewAverage(
                                                flippableCardUserProfileReadResponse
                                                    .jsonBody,
                                              ),
                                              unratedColor: Color(0x4D676767),
                                              itemCount: 5,
                                              itemSize: 7.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/gb.png',
                                        width: 10.0,
                                        height: 10.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/hg.png',
                                        width: 10.0,
                                        height: 10.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/gw.png',
                                        width: 10.0,
                                        height: 10.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 3.5)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 15.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Stack(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.asset(
                                      'assets/images/ssq.png',
                                      width: 43.5,
                                      height: 43.5,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: Text(
                                      '61 €',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: Color(0xFFF6F6F6),
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Text(
                                      'per hour',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: Color(0xFFF6F6F6),
                                            fontSize: 8.0,
                                            fontWeight: FontWeight.w500,
                                          ),
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              '${TaskerpageBackendGroup.userProfileReadCall.name(
                                    flippableCardUserProfileReadResponse
                                        .jsonBody,
                                  ).toString()} ${TaskerpageBackendGroup.userProfileReadCall.family(
                                    flippableCardUserProfileReadResponse
                                        .jsonBody,
                                  ).toString()}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Color(0xFF222222),
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 1.0, 0.0, 0.0),
                              child: Text(
                                '${(TaskerpageBackendGroup.userProfileReadCall.addresses(
                                  flippableCardUserProfileReadResponse.jsonBody,
                                ) as List).map<String>((s) => s.toString()).toList().where((e) => getJsonField(
                                      e,
                                      r'''$.city''',
                                    )).toList().first.toString()}| ${(TaskerpageBackendGroup.userProfileReadCall.userlanguages(
                                  flippableCardUserProfileReadResponse.jsonBody,
                                ) as List).map<String>((s) => s.toString()).toList().first.toString()}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Color(0xFF222222),
                                      fontSize: 9.0,
                                      fontWeight: FontWeight.w500,
                                    ),
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
            back: Container(
              width: 160.0,
              height: 150.0,
              decoration: BoxDecoration(
                color: Color(0xFF5450E2),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4.0,
                    color: Color(0x33000000),
                    offset: Offset(0.0, 2.0),
                  )
                ],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
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
                        'Tasker_Profile_view',
                        queryParameters: {
                          'id': serializeParam(
                            widget.id,
                            ParamType.int,
                          ),
                        }.withoutNulls,
                      );
                    },
                    child: Container(
                      width: 80.0,
                      height: 36.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'View',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: Color(0xFF5450E2),
                                  fontSize: 12.0,
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
          );
        },
      ),
    );
  }
}
