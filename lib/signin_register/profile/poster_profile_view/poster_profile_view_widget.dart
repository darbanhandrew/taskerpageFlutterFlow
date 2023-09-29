import '/backend/api_requests/api_calls.dart';
import '/components/comit_to_post_sheet_widget.dart';
import '/components/drawer_content_widget.dart';
import '/components/header_widget.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'poster_profile_view_model.dart';
export 'poster_profile_view_model.dart';

class PosterProfileViewWidget extends StatefulWidget {
  const PosterProfileViewWidget({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int? id;

  @override
  _PosterProfileViewWidgetState createState() =>
      _PosterProfileViewWidgetState();
}

class _PosterProfileViewWidgetState extends State<PosterProfileViewWidget>
    with TickerProviderStateMixin {
  late PosterProfileViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'dividerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(18.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'dividerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-18.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PosterProfileViewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().PostsReviews = 'Post';
      });
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

    return FutureBuilder<ApiCallResponse>(
      future: TaskerpageBackendGroup.userProfileReadCall.call(
        id: widget.id?.toString(),
        apiGlobalKey: FFAppState().apiKey,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFFF6F6F6),
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitThreeBounce(
                  color: Color(0xFF5450E2),
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        final posterProfileViewUserProfileReadResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFFF6F6F6),
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
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 183.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.network(
                                          getJsonField(
                                                    posterProfileViewUserProfileReadResponse
                                                        .jsonBody,
                                                    r'''$.data.banner''',
                                                  ) !=
                                                  null
                                              ? '${FFAppState().baseUrl}${getJsonField(
                                                  posterProfileViewUserProfileReadResponse
                                                      .jsonBody,
                                                  r'''$.data.banner''',
                                                ).toString()}'
                                              : '${FFAppState().baseUrl}/files/Group 213.png',
                                        ).image,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          35.0, 100.0, 0.0, 0.0),
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF6F6F6),
                                          shape: BoxShape.circle,
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                      ),
                                    ),
                                  ),
                                  Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            40.0, 105.0, 0.0, 0.0),
                                        child: Container(
                                          width: 90.0,
                                          height: 90.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            getJsonField(
                                                      posterProfileViewUserProfileReadResponse
                                                          .jsonBody,
                                                      r'''$.data.avatar''',
                                                    ) !=
                                                    null
                                                ? 'https://taskerpage.com${getJsonField(
                                                    posterProfileViewUserProfileReadResponse
                                                        .jsonBody,
                                                    r'''$.data.avatar''',
                                                  ).toString()}'
                                                : 'https://upload.wikimedia.org/wikipedia/commons/b/b5/Windows_10_Default_Profile_Picture.svg',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                32.0, 8.0, 32.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      '${getJsonField(
                                        posterProfileViewUserProfileReadResponse
                                            .jsonBody,
                                        r'''$.data.first_name''',
                                      ).toString()} ${getJsonField(
                                        posterProfileViewUserProfileReadResponse
                                            .jsonBody,
                                        r'''$.data.last_name''',
                                      ).toString()}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    if (functions
                                            .jsonToInt(getJsonField(
                                              posterProfileViewUserProfileReadResponse
                                                  .jsonBody,
                                              r'''$.data.identified''',
                                            ))
                                            .toString() ==
                                        '1')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.asset(
                                            'assets/images/Identification.png',
                                            width: 18.0,
                                            height: 18.0,
                                            fit: BoxFit.none,
                                          ),
                                        ),
                                      ),
                                    if (functions
                                            .jsonToInt(getJsonField(
                                              posterProfileViewUserProfileReadResponse
                                                  .jsonBody,
                                              r'''$.data.identified''',
                                            ))
                                            .toString() ==
                                        '0')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.asset(
                                            'assets/images/Identifiscation.png',
                                            width: 18.0,
                                            height: 18.0,
                                            fit: BoxFit.none,
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
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () => _model
                                                  .unfocusNode.canRequestFocus
                                              ? FocusScope.of(context)
                                                  .requestFocus(
                                                      _model.unfocusNode)
                                              : FocusScope.of(context)
                                                  .unfocus(),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: ComitToPostSheetWidget(
                                              id: widget.id!,
                                              name: getJsonField(
                                                posterProfileViewUserProfileReadResponse
                                                    .jsonBody,
                                                r'''$.data.first_name''',
                                              ).toString(),
                                              family: getJsonField(
                                                posterProfileViewUserProfileReadResponse
                                                    .jsonBody,
                                                r'''$.data.last_name''',
                                              ).toString(),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: Container(
                                    width: 113.0,
                                    height: 36.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF5450E2),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 15.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 5.0, 0.0),
                                            child: Icon(
                                              Icons.add_rounded,
                                              color: Color(0xFFF6F6F6),
                                              size: 18.0,
                                            ),
                                          ),
                                          Text(
                                            'Commit',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lato',
                                                  color: Color(0xFFF6F6F6),
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.bold,
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                32.0, 8.0, 32.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 54.0,
                                  height: 26.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFB505D2),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Poster',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: Color(0xFFF6F6F6),
                                              fontSize: 11.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    width: 104.0,
                                    height: 26.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF01880E),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              getJsonField(
                                                posterProfileViewUserProfileReadResponse
                                                    .jsonBody,
                                                r'''$.data.review_average''',
                                              ).toString(),
                                              '0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lato',
                                                  color: Color(0xFFF6F6F6),
                                                  fontSize: 11.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                          RatingBarIndicator(
                                            itemBuilder: (context, index) =>
                                                Icon(
                                              Icons.star_rounded,
                                              color: Colors.white,
                                            ),
                                            direction: Axis.horizontal,
                                            rating: getJsonField(
                                              posterProfileViewUserProfileReadResponse
                                                  .jsonBody,
                                              r'''$.data.review_average''',
                                            ),
                                            unratedColor: Color(0xFFC3C3C3),
                                            itemCount: 5,
                                            itemSize: 12.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 5.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.asset(
                                            'assets/images/Bacdge.png',
                                            width: 18.0,
                                            height: 18.0,
                                            fit: BoxFit.none,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 5.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.asset(
                                            'assets/images/Badge.png',
                                            width: 18.0,
                                            height: 18.0,
                                            fit: BoxFit.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                32.0, 8.0, 32.0, 17.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Lives in ${getJsonField(
                                    posterProfileViewUserProfileReadResponse
                                        .jsonBody,
                                    r'''$.data.city''',
                                  ).toString()}, ${getJsonField(
                                    posterProfileViewUserProfileReadResponse
                                        .jsonBody,
                                    r'''$.data.country''',
                                  ).toString()}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.share_outlined,
                                      color: Color(0xFF5450E2),
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  32.0, 25.0, 32.0, 25.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Activities',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 16.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              setState(() {
                                                FFAppState().PostsReviews =
                                                    'Post';
                                              });
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Posts',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color: FFAppState()
                                                                    .PostsReviews ==
                                                                'Post'
                                                            ? Color(0xFF211DAF)
                                                            : Color(0xFF0C0A3E),
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                SizedBox(
                                                  width: 37.0,
                                                  child: Divider(
                                                    thickness: 2.0,
                                                    color: FFAppState()
                                                                .PostsReviews ==
                                                            'Post'
                                                        ? Color(0xFF211DAF)
                                                        : Colors.white,
                                                  ),
                                                ).animateOnPageLoad(animationsMap[
                                                    'dividerOnPageLoadAnimation1']!),
                                              ],
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            setState(() {
                                              FFAppState().PostsReviews =
                                                  'Reviews';
                                            });
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Reviews by user',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Lato',
                                                      color: FFAppState()
                                                                  .PostsReviews ==
                                                              'Reviews'
                                                          ? Color(0xFF211DAF)
                                                          : Color(0xFF0C0A3E),
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                              SizedBox(
                                                width: 102.0,
                                                child: Divider(
                                                  thickness: 2.0,
                                                  color: FFAppState()
                                                              .PostsReviews ==
                                                          'Reviews'
                                                      ? Color(0xFF211DAF)
                                                      : Colors.white,
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'dividerOnPageLoadAnimation2']!),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (FFAppState().PostsReviews == 'Post')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 10.0),
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: TaskerpageBackendGroup
                                            .myPostsCall
                                            .call(
                                          apiGlobalKey: FFAppState().apiKey,
                                          filters:
                                              '[[\"poster\",\"=\",\"${getJsonField(
                                            posterProfileViewUserProfileReadResponse
                                                .jsonBody,
                                            r'''$.data.name''',
                                          ).toString()}\"]]',
                                          fields:
                                              '[\"name\",\"creation\",\"skill_name\"]',
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
                                          final listViewMyPostsResponse =
                                              snapshot.data!;
                                          return Builder(
                                            builder: (context) {
                                              final userPosts = getJsonField(
                                                listViewMyPostsResponse
                                                    .jsonBody,
                                                r'''$.data''',
                                              ).toList().take(3).toList();
                                              return ListView.separated(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: userPosts.length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(height: 8.0),
                                                itemBuilder:
                                                    (context, userPostsIndex) {
                                                  final userPostsItem =
                                                      userPosts[userPostsIndex];
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'TaskView',
                                                        queryParameters: {
                                                          'id': serializeParam(
                                                            getJsonField(
                                                              userPostsItem,
                                                              r'''$.name''',
                                                            ).toString(),
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFF6F6F6),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    8.0,
                                                                    15.0,
                                                                    8.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: Text(
                                                                getJsonField(
                                                                  userPostsItem,
                                                                  r'''$.skill_name''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lato',
                                                                      fontSize:
                                                                          14.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      decoration:
                                                                          TextDecoration
                                                                              .underline,
                                                                    ),
                                                              ),
                                                            ),
                                                            Text(
                                                              dateTimeFormat(
                                                                  'yMd',
                                                                  functions
                                                                      .jsonToDateTime(
                                                                          getJsonField(
                                                                    userPostsItem,
                                                                    r'''$.creation''',
                                                                  ).toString())),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lato',
                                                                    color: Color(
                                                                        0xFF616161),
                                                                    fontSize:
                                                                        12.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
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
                                  if (FFAppState().PostsReviews == 'Post')
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 26.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            border: Border.all(
                                              color: Color(0xFF5450E2),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 5.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'See more',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color:
                                                            Color(0xFF5450E2),
                                                        fontSize: 11.0,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: Icon(
                                                    Icons.keyboard_control,
                                                    color: Color(0xFF5450E2),
                                                    size: 13.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  if (FFAppState().PostsReviews == 'Reviews')
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 10.0),
                                          child: FutureBuilder<ApiCallResponse>(
                                            future: TaskerpageBackendGroup
                                                .myReviewsCall
                                                .call(
                                              filters:
                                                  '[[\"reviewed_by\",\"=\",\"${getJsonField(
                                                posterProfileViewUserProfileReadResponse
                                                    .jsonBody,
                                                r'''$.data.name''',
                                              ).toString()}\"]]',
                                              fields:
                                                  '[\"reviewed_on\",\"creation\",\"appointment\",\"reviewed_by\",\"review_rate\",\"comment\"]',
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
                                              final listViewMyReviewsResponse =
                                                  snapshot.data!;
                                              return Builder(
                                                builder: (context) {
                                                  final myReviews =
                                                      getJsonField(
                                                    listViewMyReviewsResponse
                                                        .jsonBody,
                                                    r'''$.data''',
                                                  ).toList().take(3).toList();
                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: myReviews.length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 8.0),
                                                    itemBuilder: (context,
                                                        myReviewsIndex) {
                                                      final myReviewsItem =
                                                          myReviews[
                                                              myReviewsIndex];
                                                      return FutureBuilder<
                                                          ApiCallResponse>(
                                                        future: TaskerpageBackendGroup
                                                            .userProfileReadCall
                                                            .call(
                                                          id: getJsonField(
                                                            myReviewsItem,
                                                            r'''$.reviewed_on''',
                                                          ).toString(),
                                                          apiGlobalKey:
                                                              FFAppState()
                                                                  .apiKey,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    SpinKitThreeBounce(
                                                                  color: Color(
                                                                      0xFF5450E2),
                                                                  size: 50.0,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final containerUserProfileReadResponse =
                                                              snapshot.data!;
                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFF6F6F6),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          8.0,
                                                                          15.0,
                                                                          8.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    clipBehavior:
                                                                        Clip.antiAlias,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child: Image
                                                                        .network(
                                                                      '${FFAppState().baseUrl}${getJsonField(
                                                                        containerUserProfileReadResponse
                                                                            .jsonBody,
                                                                        r'''$.data.avatar''',
                                                                      ).toString()}',
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          15.0,
                                                                          10.0,
                                                                          8.0,
                                                                          10.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                '${getJsonField(
                                                                                  containerUserProfileReadResponse.jsonBody,
                                                                                  r'''$.data.first_name''',
                                                                                ).toString()} ${getJsonField(
                                                                                  containerUserProfileReadResponse.jsonBody,
                                                                                  r'''$.data.last_name''',
                                                                                ).toString()}',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Lato',
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      decoration: TextDecoration.underline,
                                                                                    ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  dateTimeFormat(
                                                                                      'yMMMd',
                                                                                      functions.jsonToDateTime(getJsonField(
                                                                                        myReviewsItem,
                                                                                        r'''$.creation''',
                                                                                      ).toString())),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Lato',
                                                                                        color: Color(0xFF616161),
                                                                                        fontSize: 12.0,
                                                                                        fontWeight: FontWeight.w300,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                5.0,
                                                                                0.0,
                                                                                10.0),
                                                                            child:
                                                                                RatingBarIndicator(
                                                                              itemBuilder: (context, index) => Icon(
                                                                                Icons.star_rounded,
                                                                                color: Color(0xFFFBD927),
                                                                              ),
                                                                              direction: Axis.horizontal,
                                                                              rating: getJsonField(
                                                                                myReviewsItem,
                                                                                r'''$.review_rate''',
                                                                              ),
                                                                              unratedColor: FlutterFlowTheme.of(context).accent3,
                                                                              itemCount: 5,
                                                                              itemSize: 12.0,
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Flexible(
                                                                                child: Text(
                                                                                  getJsonField(
                                                                                    myReviewsItem,
                                                                                    r'''$.comment''',
                                                                                  ).toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Lato',
                                                                                        color: Color(0xFF5E5D5D),
                                                                                        fontSize: 14.0,
                                                                                        fontWeight: FontWeight.w300,
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
                                                          );
                                                        },
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
                                  if (FFAppState().PostsReviews == 'Reviews')
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 26.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            border: Border.all(
                                              color: Color(0xFF5450E2),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 5.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'See more',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color:
                                                            Color(0xFF5450E2),
                                                        fontSize: 11.0,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: Icon(
                                                    Icons.keyboard_control,
                                                    color: Color(0xFF5450E2),
                                                    size: 13.0,
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                32.0, 27.0, 32.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Reviews on user',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    32.0, 20.0, 32.0, 10.0),
                                child: FutureBuilder<ApiCallResponse>(
                                  future:
                                      TaskerpageBackendGroup.myReviewsCall.call(
                                    filters:
                                        '[[\"reviewed_on\",\"=\",\"${getJsonField(
                                      posterProfileViewUserProfileReadResponse
                                          .jsonBody,
                                      r'''$.data.name''',
                                    ).toString()}\"]]',
                                    fields:
                                        '[\"reviewed_on\",\"creation\",\"appointment\",\"reviewed_by\",\"review_rate\",\"comment\"]',
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
                                    final listViewMyReviewsResponse =
                                        snapshot.data!;
                                    return Builder(
                                      builder: (context) {
                                        final myReviews = getJsonField(
                                          listViewMyReviewsResponse.jsonBody,
                                          r'''$.data''',
                                        ).toList().take(3).toList();
                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: myReviews.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 8.0),
                                          itemBuilder:
                                              (context, myReviewsIndex) {
                                            final myReviewsItem =
                                                myReviews[myReviewsIndex];
                                            return FutureBuilder<
                                                ApiCallResponse>(
                                              future: TaskerpageBackendGroup
                                                  .userProfileReadCall
                                                  .call(
                                                id: getJsonField(
                                                  myReviewsItem,
                                                  r'''$.reviewed_by''',
                                                ).toString(),
                                                apiGlobalKey:
                                                    FFAppState().apiKey,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child: SpinKitThreeBounce(
                                                        color:
                                                            Color(0xFF5450E2),
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final containerUserProfileReadResponse =
                                                    snapshot.data!;
                                                return Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(15.0, 8.0,
                                                                15.0, 8.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            '${FFAppState().baseUrl}${getJsonField(
                                                              containerUserProfileReadResponse
                                                                  .jsonBody,
                                                              r'''$.data.avatar''',
                                                            ).toString()}',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        10.0,
                                                                        8.0,
                                                                        10.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      '${getJsonField(
                                                                        containerUserProfileReadResponse
                                                                            .jsonBody,
                                                                        r'''$.data.first_name''',
                                                                      ).toString()} ${getJsonField(
                                                                        containerUserProfileReadResponse
                                                                            .jsonBody,
                                                                        r'''$.data.last_name''',
                                                                      ).toString()}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lato',
                                                                            fontSize:
                                                                                14.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            decoration:
                                                                                TextDecoration.underline,
                                                                          ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        dateTimeFormat(
                                                                            'yMMMd',
                                                                            functions.jsonToDateTime(getJsonField(
                                                                              myReviewsItem,
                                                                              r'''$.creation''',
                                                                            ).toString())),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Lato',
                                                                              color: Color(0xFF616161),
                                                                              fontSize: 12.0,
                                                                              fontWeight: FontWeight.w300,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          10.0),
                                                                  child:
                                                                      RatingBarIndicator(
                                                                    itemBuilder:
                                                                        (context,
                                                                                index) =>
                                                                            Icon(
                                                                      Icons
                                                                          .star_rounded,
                                                                      color: Color(
                                                                          0xFFFBD927),
                                                                    ),
                                                                    direction: Axis
                                                                        .horizontal,
                                                                    rating:
                                                                        getJsonField(
                                                                      myReviewsItem,
                                                                      r'''$.review_rate''',
                                                                    ),
                                                                    unratedColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .accent3,
                                                                    itemCount:
                                                                        5,
                                                                    itemSize:
                                                                        12.0,
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Flexible(
                                                                      child:
                                                                          Text(
                                                                        getJsonField(
                                                                          myReviewsItem,
                                                                          r'''$.comment''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Lato',
                                                                              color: Color(0xFF5E5D5D),
                                                                              fontSize: 14.0,
                                                                              fontWeight: FontWeight.w300,
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
                                                );
                                              },
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                32.0, 0.0, 32.0, 16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 26.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x00FFFFFF),
                                    borderRadius: BorderRadius.circular(15.0),
                                    border: Border.all(
                                      color: Color(0xFF5450E2),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'See more',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lato',
                                                color: Color(0xFF5450E2),
                                                fontSize: 11.0,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: Icon(
                                            Icons.keyboard_control,
                                            color: Color(0xFF5450E2),
                                            size: 13.0,
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
          ),
        );
      },
    );
  }
}
