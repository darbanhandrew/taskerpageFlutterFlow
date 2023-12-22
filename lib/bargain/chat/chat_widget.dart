import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/bargain/chat_message/chat_message_widget.dart';
import '/components/chat_message_actions_widget.dart';
import '/components/header_web_widget.dart';
import '/components/my_post_card_widget.dart';
import '/components/nav_bar_widget.dart';
import '/components/side_bar_right_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'chat_model.dart';
export 'chat_model.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({
    Key? key,
    required this.room,
  }) : super(key: key);

  final String? room;

  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  late ChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.chatRoomDetails =
          await TaskerpageBackendGroup.getChatRoomDetailsCall.call(
        roomName: widget.room,
        email: getJsonField(
          FFAppState().userProfile,
          r'''$.data.user''',
        ).toString().toString(),
        apiGlobalKey: FFAppState().apiKey,
      );
      if ((_model.chatRoomDetails?.succeeded ?? true)) {
        setState(() {
          _model.chatRoom = ChatRoomStruct.maybeFromMap(
              TaskerpageBackendGroup.getChatRoomDetailsCall.chatRoomJson(
            (_model.chatRoomDetails?.jsonBody ?? ''),
          ));
        });
        _model.apiResult39c = await TaskerpageBackendGroup.markAsReadCall.call(
          room: widget.room,
          apiGlobalKey: FFAppState().apiKey,
        );
        await actions.listenSocketEvent(
          widget.room!,
          () async {
            setState(() {
              _model.clearChatMessagesCacheKey(_model.apiRequestLastUniqueKey3);
              _model.apiRequestCompleted3 = false;
            });
          },
        );
      } else {
        context.pushNamed(
          'chat_list',
          queryParameters: {
            'task': serializeParam(
              0,
              ParamType.int,
            ),
          }.withoutNulls,
        );
      }
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

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
        backgroundColor: () {
          if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
            return true;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
            return true;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
            return false;
          } else {
            return true;
          }
        }()
            ? Colors.white
            : Color(0xFFF2F2F2),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
                tabletLandscape: false,
              ))
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: wrapWithModel(
                        model: _model.headerWebModel,
                        updateCallback: () => setState(() {}),
                        child: HeaderWebWidget(),
                      ),
                    ),
                  ],
                ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                    ))
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            76.0, 5.0, 24.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                width: 312.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(0.0, 0.0),
                                      spreadRadius: 2.0,
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
                                          child: Container(
                                            width: 100.0,
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(27.0, 0.0,
                                                                32.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                                'User_profile');
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .keyboard_arrow_left,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                  'User_profile');
                                                            },
                                                            child: Text(
                                                              'Back to dashboard ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lato',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Divider(
                                                      height: 0.0,
                                                      thickness: 1.0,
                                                      color: Color(0xFFD2D2D2),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (false)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            27.0, 32.0, 0.0, 20.0),
                                        child: FutureBuilder<ApiCallResponse>(
                                          future: TaskerpageBackendGroup
                                              .myPostsCall
                                              .call(
                                            filters:
                                                '[[\"poster\",\"=\",\"${getJsonField(
                                              FFAppState().userProfile,
                                              r'''$.data.name''',
                                            ).toString()}\"]]',
                                            fields: '[\"name\"]',
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 35.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            final postRowMyPostsResponse =
                                                snapshot.data!;
                                            return Builder(
                                              builder: (context) {
                                                final myPosts = getJsonField(
                                                  postRowMyPostsResponse
                                                      .jsonBody,
                                                  r'''$.data''',
                                                ).toList();
                                                return SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: List.generate(
                                                        myPosts.length,
                                                        (myPostsIndex) {
                                                      final myPostsItem =
                                                          myPosts[myPostsIndex];
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
                                                          setState(() {});
                                                          setState(() => _model
                                                                  .apiRequestCompleter1 =
                                                              null);
                                                          await _model
                                                              .waitForApiRequestCompleted1();
                                                          setState(() => _model
                                                                  .apiRequestCompleter5 =
                                                              null);
                                                          await _model
                                                              .waitForApiRequestCompleted5();
                                                          setState(() => _model
                                                                  .apiRequestCompleter2 =
                                                              null);
                                                          await _model
                                                              .waitForApiRequestCompleted2();
                                                          setState(() => _model
                                                                  .apiRequestCompleter4 =
                                                              null);
                                                          await _model
                                                              .waitForApiRequestCompleted4();
                                                        },
                                                        child: Container(
                                                          width: 320.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x00FFFFFF),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x00F36121),
                                                            ),
                                                          ),
                                                          child: FutureBuilder<
                                                              ApiCallResponse>(
                                                            future:
                                                                TaskerpageBackendGroup
                                                                    .postReadCall
                                                                    .call(
                                                              id: getJsonField(
                                                                myPostsItem,
                                                                r'''$.name''',
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
                                                                  child:
                                                                      SizedBox(
                                                                    width: 35.0,
                                                                    height:
                                                                        35.0,
                                                                    child:
                                                                        SpinKitThreeBounce(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          35.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              final columnPostReadResponse =
                                                                  snapshot
                                                                      .data!;
                                                              return Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Stack(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              5.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              MyPostCardWidget(
                                                                            key:
                                                                                Key('Keyrao_${myPostsIndex}_of_${myPosts.length}'),
                                                                            postData:
                                                                                myPostsItem,
                                                                          ),
                                                                        ),
                                                                        if (_model.taskID !=
                                                                            getJsonField(
                                                                              myPostsItem,
                                                                              r'''$.name''',
                                                                            ))
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                0.0,
                                                                                5.0,
                                                                                5.0),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              height: 175.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x298A8A8A),
                                                                              ),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Container(
                                                                                    width: 130.0,
                                                                                    height: 36.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0x83F36121),
                                                                                      borderRadius: BorderRadius.circular(2.0),
                                                                                    ),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        Text(
                                                                                          'view related chats',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Lato',
                                                                                                color: Colors.white,
                                                                                                fontSize: 13.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                              ),
                                                                                        ),
                                                                                      ],
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
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    }).divide(
                                                        SizedBox(width: 15.0)),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    if (false)
                                      Divider(
                                        height: 0.0,
                                        thickness: 1.0,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                      ),
                                    Expanded(
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (false)
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Users related to this post',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: FutureBuilder<
                                                        ApiCallResponse>(
                                                      future: (_model
                                                                  .apiRequestCompleter1 ??=
                                                              Completer<
                                                                  ApiCallResponse>()
                                                                ..complete(
                                                                    TaskerpageBackendGroup
                                                                        .getMyTasksGroupByCall
                                                                        .call(
                                                                  filters:
                                                                      '[[\"customer_task\",\"=\",\"${_model.taskID?.toString()}\"]]',
                                                                  fields:
                                                                      '[\"customer_task\",\"user\"]',
                                                                  orderBy:
                                                                      'creation desc',
                                                                  limitStart: 0,
                                                                  limit: 100,
                                                                  apiGlobalKey:
                                                                      FFAppState()
                                                                          .apiKey,
                                                                )))
                                                          .future,
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 35.0,
                                                              height: 35.0,
                                                              child:
                                                                  SpinKitThreeBounce(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 35.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final containerGetMyTasksGroupByResponse =
                                                            snapshot.data!;
                                                        return Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x33000000),
                                                                offset: Offset(
                                                                    0.0, 2.0),
                                                              )
                                                            ],
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  functions
                                                                      .numberofListitems((TaskerpageBackendGroup
                                                                              .getMyTasksGroupByCall
                                                                              .users(
                                                                        containerGetMyTasksGroupByResponse
                                                                            .jsonBody,
                                                                      ) as List)
                                                                          .map<String>((s) => s
                                                                              .toString())
                                                                          .toList()
                                                                          ?.map((e) =>
                                                                              e.toString())
                                                                          .toList()
                                                                          ?.toList())
                                                                      .toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Lato',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        fontSize:
                                                                            10.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Visibility(
                                                visible: false,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 15.0, 0.0, 0.0),
                                                  child: FutureBuilder<
                                                      ApiCallResponse>(
                                                    future: (_model
                                                                .apiRequestCompleter5 ??=
                                                            Completer<
                                                                ApiCallResponse>()
                                                              ..complete(
                                                                  TaskerpageBackendGroup
                                                                      .getMyTasksGroupByCall
                                                                      .call(
                                                                filters:
                                                                    '[[\"customer_task\",\"=\",\"${_model.taskID?.toString()}\"]]',
                                                                fields:
                                                                    '[\"customer_task\",\"user\"]',
                                                                orderBy:
                                                                    'creation desc',
                                                                limitStart: 0,
                                                                limit: 100,
                                                                apiGlobalKey:
                                                                    FFAppState()
                                                                        .apiKey,
                                                              )))
                                                        .future,
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 35.0,
                                                            height: 35.0,
                                                            child:
                                                                SpinKitThreeBounce(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 35.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final rowGetMyTasksGroupByResponse =
                                                          snapshot.data!;
                                                      return Builder(
                                                        builder: (context) {
                                                          final usersThisPost =
                                                              getJsonField(
                                                            rowGetMyTasksGroupByResponse
                                                                .jsonBody,
                                                            r'''$.data''',
                                                          ).toList();
                                                          return SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: List.generate(
                                                                  usersThisPost
                                                                      .length,
                                                                  (usersThisPostIndex) {
                                                                final usersThisPostItem =
                                                                    usersThisPost[
                                                                        usersThisPostIndex];
                                                                return Stack(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          1.0),
                                                                  children: [
                                                                    FutureBuilder<
                                                                        ApiCallResponse>(
                                                                      future: TaskerpageBackendGroup
                                                                          .readByEmailCall
                                                                          .call(
                                                                        filters:
                                                                            '[[\"user\",\"=\",\"${getJsonField(
                                                                          usersThisPostItem,
                                                                          r'''$.user''',
                                                                        ).toString()}\"]]',
                                                                        fields:
                                                                            '[\"avatar\"]',
                                                                        apiGlobalKey:
                                                                            FFAppState().apiKey,
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 35.0,
                                                                              height: 35.0,
                                                                              child: SpinKitThreeBounce(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 35.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        final circleImageReadByEmailResponse =
                                                                            snapshot.data!;
                                                                        return Container(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Image.network(
                                                                            '${FFAppState().baseUrl}${TaskerpageBackendGroup.readByEmailCall.avatar(
                                                                                  circleImageReadByEmailResponse.jsonBody,
                                                                                ).toString()}',
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          13.0,
                                                                      height:
                                                                          13.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFF71DD3A),
                                                                        shape: BoxShape
                                                                            .circle,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              }).divide(SizedBox(
                                                                  width: 13.0)),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      32.0, 8.0, 32.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Messaning',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: FutureBuilder<
                                                        ApiCallResponse>(
                                                      future: (_model
                                                                  .apiRequestCompleter2 ??=
                                                              Completer<
                                                                  ApiCallResponse>()
                                                                ..complete(
                                                                    TaskerpageBackendGroup
                                                                        .chatListCall
                                                                        .call(
                                                                  user:
                                                                      getJsonField(
                                                                    FFAppState()
                                                                        .userProfile,
                                                                    r'''$.data.user''',
                                                                  ).toString(),
                                                                  apiGlobalKey:
                                                                      FFAppState()
                                                                          .apiKey,
                                                                  task: _model
                                                                      .taskID,
                                                                )))
                                                          .future,
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 35.0,
                                                              height: 35.0,
                                                              child:
                                                                  SpinKitThreeBounce(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 35.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final containerChatListResponse =
                                                            snapshot.data!;
                                                        return Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x33000000),
                                                                offset: Offset(
                                                                    0.0, 2.0),
                                                              )
                                                            ],
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  functions
                                                                      .numberofListitems((TaskerpageBackendGroup
                                                                              .chatListCall
                                                                              .name(
                                                                        containerChatListResponse
                                                                            .jsonBody,
                                                                      ) as List)
                                                                          .map<String>((s) =>
                                                                              s.toString())
                                                                          .toList()
                                                                          ?.toList())
                                                                      .toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Lato',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        fontSize:
                                                                            10.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child: Image.asset(
                                                            'assets/images/Mask_Group_571.png',
                                                            width: 20.0,
                                                            height: 20.0,
                                                            fit: BoxFit.none,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 14.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 50.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFF9F9F9),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Divider(
                                                            height: 0.0,
                                                            thickness: 1.0,
                                                            color: Color(
                                                                0xFFDEDEDE),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        32.0,
                                                                        0.0,
                                                                        32.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: 169.0,
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .textController1,
                                                                    focusNode:
                                                                        _model
                                                                            .textFieldFocusNode1,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      isDense:
                                                                          true,
                                                                      labelStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMedium,
                                                                      hintText:
                                                                          'Search messages',
                                                                      hintStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lato',
                                                                            color:
                                                                                Color(0xFFD2D2D2),
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                      enabledBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0xFFDEDEDE),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                      ),
                                                                      errorBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                      ),
                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lato',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    cursorColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                    validator: _model
                                                                        .textController1Validator
                                                                        .asValidator(
                                                                            context),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Text(
                                                                        'All',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Lato',
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              fontSize: 14.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                      Icon(
                                                                        Icons
                                                                            .filter_list,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            11.0)),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(
                                                            height: 0.0,
                                                            thickness: 1.0,
                                                            color: Color(
                                                                0xFFDEDEDE),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: FutureBuilder<
                                                  ApiCallResponse>(
                                                future: (_model
                                                            .apiRequestCompleter4 ??=
                                                        Completer<
                                                            ApiCallResponse>()
                                                          ..complete(
                                                              TaskerpageBackendGroup
                                                                  .chatListCall
                                                                  .call(
                                                            user: getJsonField(
                                                              FFAppState()
                                                                  .userProfile,
                                                              r'''$.data.user''',
                                                            ).toString(),
                                                            apiGlobalKey:
                                                                FFAppState()
                                                                    .apiKey,
                                                            task: _model.taskID,
                                                          )))
                                                    .future,
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 35.0,
                                                        height: 35.0,
                                                        child:
                                                            SpinKitThreeBounce(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 35.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final listViewChatListResponse =
                                                      snapshot.data!;
                                                  return Builder(
                                                    builder: (context) {
                                                      final myChats = functions
                                                          .convertMap(
                                                              TaskerpageBackendGroup
                                                                  .chatListCall
                                                                  .chatListJson(
                                                                    listViewChatListResponse
                                                                        .jsonBody,
                                                                  )!
                                                                  .toList())
                                                          .map((e) =>
                                                              ChatRoomStruct
                                                                  .maybeFromMap(
                                                                      e))
                                                          .withoutNulls
                                                          .toList();
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            myChats.length,
                                                        itemBuilder: (context,
                                                            myChatsIndex) {
                                                          final myChatsItem =
                                                              myChats[
                                                                  myChatsIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        15.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          32.0,
                                                                          0.0,
                                                                          32.0,
                                                                          20.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        'chat',
                                                                        pathParameters:
                                                                            {
                                                                          'room':
                                                                              serializeParam(
                                                                            myChatsItem.room,
                                                                            ParamType.String,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    },
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.end,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    Builder(
                                                                                      builder: (context) {
                                                                                        if (myChatsItem.hasOppositePersonAvatar()) {
                                                                                          return Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                            child: Container(
                                                                                              width: 47.0,
                                                                                              height: 47.0,
                                                                                              clipBehavior: Clip.antiAlias,
                                                                                              decoration: BoxDecoration(
                                                                                                shape: BoxShape.circle,
                                                                                              ),
                                                                                              child: CachedNetworkImage(
                                                                                                fadeInDuration: Duration(milliseconds: 500),
                                                                                                fadeOutDuration: Duration(milliseconds: 500),
                                                                                                imageUrl: '${FFAppState().baseUrl}${myChatsItem.oppositePersonAvatar}',
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        } else {
                                                                                          return Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                            child: Container(
                                                                                              width: 45.0,
                                                                                              height: 45.0,
                                                                                              clipBehavior: Clip.antiAlias,
                                                                                              decoration: BoxDecoration(
                                                                                                shape: BoxShape.circle,
                                                                                              ),
                                                                                              child: Image.asset(
                                                                                                'assets/images/Group_2176.png',
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        }
                                                                                      },
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Text(
                                                                                                  myChatsItem.roomName,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Lato',
                                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                                        fontSize: 14.0,
                                                                                                        fontWeight: FontWeight.bold,
                                                                                                      ),
                                                                                                ),
                                                                                                Text(
                                                                                                  dateTimeFormat('MMMEd', functions.jsonToDateTime(myChatsItem.modified)),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Lato',
                                                                                                        color: Color(0x74292929),
                                                                                                        fontSize: 13.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                      ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    myChatsItem.lastMessage.maybeHandleOverflow(
                                                                                                      maxChars: 15,
                                                                                                      replacement: '…',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Lato',
                                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                                          fontSize: 13.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  if (myChatsItem.isRead == 0)
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                      child: Container(
                                                                                                        width: 7.0,
                                                                                                        height: 7.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          shape: BoxShape.circle,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  Icon(
                                                                                                    Icons.keyboard_arrow_right,
                                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                                    size: 21.0,
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 4.0)),
                                                                                      ),
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
                                                                Divider(
                                                                  height: 0.0,
                                                                  thickness:
                                                                      1.0,
                                                                  color: Color(
                                                                      0xFFDEDEDE),
                                                                ),
                                                              ],
                                                            ),
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
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
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
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(0.0, 0.0),
                                      spreadRadius: 2.0,
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
                                          child: Container(
                                            height: 70.0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(13.0, 0.0,
                                                                17.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            if (responsiveVisibility(
                                                              context: context,
                                                              desktop: false,
                                                            ))
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      'chat_list',
                                                                      queryParameters:
                                                                          {
                                                                        'task':
                                                                            serializeParam(
                                                                          0,
                                                                          ParamType
                                                                              .int,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .chevron_left,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    size: 25.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            Builder(
                                                              builder:
                                                                  (context) {
                                                                if (_model
                                                                        .chatRoom
                                                                        ?.hasOppositePersonAvatar() ??
                                                                    false) {
                                                                  return Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        context
                                                                            .pushNamed(
                                                                          'User_profile',
                                                                          queryParameters:
                                                                              {
                                                                            'id':
                                                                                serializeParam(
                                                                              _model.chatRoom?.oppositePersonCustomerProfile,
                                                                              ParamType.String,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            45.0,
                                                                        height:
                                                                            45.0,
                                                                        clipBehavior:
                                                                            Clip.antiAlias,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child: Image
                                                                            .network(
                                                                          '${FFAppState().baseUrl}${_model.chatRoom?.oppositePersonAvatar}',
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                } else {
                                                                  return Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        context
                                                                            .pushNamed(
                                                                          'User_profile',
                                                                          queryParameters:
                                                                              {
                                                                            'id':
                                                                                serializeParam(
                                                                              _model.chatRoom?.oppositePersonCustomerProfile,
                                                                              ParamType.String,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        clipBehavior:
                                                                            Clip.antiAlias,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/Group_2176.png',
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                              },
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                context
                                                                    .pushNamed(
                                                                  'User_profile',
                                                                  queryParameters:
                                                                      {
                                                                    'id':
                                                                        serializeParam(
                                                                      _model
                                                                          .chatRoom
                                                                          ?.oppositePersonCustomerProfile,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      _model
                                                                          .chatRoom
                                                                          ?.room,
                                                                      'Chat Room',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lato',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    'Post ${_model.chatRoom?.customerTask}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lato',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          fontSize:
                                                                              12.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        4.0)),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .keyboard_control,
                                                              color: Color(
                                                                  0xFF8A8A8A),
                                                              size: 25.0,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Divider(
                                                      height: 0.0,
                                                      thickness: 0.5,
                                                      color: Color(0xFFD2D2D2),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                20.0, 8.0),
                                                    child: FutureBuilder<
                                                        ApiCallResponse>(
                                                      future: _model
                                                          .chatMessages(
                                                        uniqueQueryKey:
                                                            widget.room,
                                                        requestFn: () =>
                                                            TaskerpageBackendGroup
                                                                .chatRoomMessagesCall
                                                                .call(
                                                          room: widget.room,
                                                          email: getJsonField(
                                                            FFAppState()
                                                                .userProfile,
                                                            r'''$.data.user''',
                                                          ).toString(),
                                                          apiGlobalKey:
                                                              FFAppState()
                                                                  .apiKey,
                                                          orderBy:
                                                              'creation desc',
                                                          start: 0,
                                                          pageLength: 100,
                                                        ),
                                                      )
                                                          .then((result) {
                                                        try {
                                                          _model.apiRequestCompleted3 =
                                                              true;
                                                          _model.apiRequestLastUniqueKey3 =
                                                              widget.room;
                                                        } finally {}
                                                        return result;
                                                      }),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 35.0,
                                                              height: 35.0,
                                                              child:
                                                                  SpinKitThreeBounce(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 35.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final listViewChatRoomMessagesResponse =
                                                            snapshot.data!;
                                                        return Builder(
                                                          builder: (context) {
                                                            final chats =
                                                                functions
                                                                    .convertMap(TaskerpageBackendGroup
                                                                        .chatRoomMessagesCall
                                                                        .chatMessagesJson(
                                                                          listViewChatRoomMessagesResponse
                                                                              .jsonBody,
                                                                        )!
                                                                        .toList())
                                                                    .map((e) =>
                                                                        ChatMessageStruct
                                                                            .maybeFromMap(e))
                                                                    .withoutNulls
                                                                    .toList();
                                                            return ListView
                                                                .separated(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              reverse: true,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  chats.length,
                                                              separatorBuilder: (_,
                                                                      __) =>
                                                                  SizedBox(
                                                                      height:
                                                                          20.0),
                                                              itemBuilder:
                                                                  (context,
                                                                      chatsIndex) {
                                                                final chatsItem =
                                                                    chats[
                                                                        chatsIndex];
                                                                return wrapWithModel(
                                                                  model: _model
                                                                      .chatMessageModels
                                                                      .getModel(
                                                                    chatsItem
                                                                        .name,
                                                                    chatsIndex,
                                                                  ),
                                                                  updateCallback:
                                                                      () => setState(
                                                                          () {}),
                                                                  child:
                                                                      ChatMessageWidget(
                                                                    key: Key(
                                                                      'Keyony_${chatsItem.name}',
                                                                    ),
                                                                    chatMessage:
                                                                        chatsItem,
                                                                    chatRoom: _model
                                                                        .chatRoom!,
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        );
                                                      },
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
                                          32.0, 0.0, 32.0, 29.2),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: FutureBuilder<
                                                    ApiCallResponse>(
                                                  future: TaskerpageBackendGroup
                                                      .getPossibleTransitionsCall
                                                      .call(
                                                    currentState:
                                                        valueOrDefault<String>(
                                                      _model.chatRoom
                                                          ?.workflowState,
                                                      'Initial',
                                                    ),
                                                    doctype: 'Chat Room',
                                                    apiGlobalKey:
                                                        FFAppState().apiKey,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 35.0,
                                                          height: 35.0,
                                                          child:
                                                              SpinKitThreeBounce(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 35.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final chatMessageActionsGetPossibleTransitionsResponse =
                                                        snapshot.data!;
                                                    return wrapWithModel(
                                                      model: _model
                                                          .chatMessageActionsModel,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child:
                                                          ChatMessageActionsWidget(
                                                        parameter1: widget.room,
                                                        parameter2: functions
                                                            .convertMap(
                                                                TaskerpageBackendGroup
                                                                    .getPossibleTransitionsCall
                                                                    .actionsJson(
                                                                      chatMessageActionsGetPossibleTransitionsResponse
                                                                          .jsonBody,
                                                                    )!
                                                                    .toList())
                                                            .map((e) =>
                                                                TransitionsStruct
                                                                    .maybeFromMap(
                                                                        e))
                                                            .withoutNulls
                                                            .toList(),
                                                        doctype: 'Chat Room',
                                                        chatRoom:
                                                            _model.chatRoom!,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 15.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(1.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Icon(
                                                              Icons.more_vert,
                                                              color: Color(
                                                                  0xFF8A8A8A),
                                                              size: 25.0,
                                                            ),
                                                            SizedBox(
                                                              height: 100.0,
                                                              child:
                                                                  VerticalDivider(
                                                                thickness: 1.0,
                                                                indent: 6.0,
                                                                endIndent: 6.0,
                                                                color: Color(
                                                                    0xFFC9C9C9),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .textController2,
                                                                focusNode: _model
                                                                    .textFieldFocusNode2,
                                                                textInputAction:
                                                                    TextInputAction
                                                                        .send,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Lato',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        fontSize:
                                                                            13.0,
                                                                      ),
                                                                  hintText:
                                                                      'Write a message...',
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Lato',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                        fontSize:
                                                                            14.0,
                                                                      ),
                                                                  enabledBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  focusedBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  errorBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  focusedErrorBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  contentPadding:
                                                                      EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lato',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      fontSize:
                                                                          13.0,
                                                                    ),
                                                                minLines: 1,
                                                                validator: _model
                                                                    .textController2Validator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    _model.apiResult55u =
                                                        await TaskerpageBackendGroup
                                                            .sendMessageCall
                                                            .call(
                                                      email: getJsonField(
                                                        FFAppState()
                                                            .userProfile,
                                                        r'''$.data.user''',
                                                      ).toString(),
                                                      user: getJsonField(
                                                        FFAppState()
                                                            .userProfile,
                                                        r'''$.data.user''',
                                                      ).toString(),
                                                      room: widget.room,
                                                      content: _model
                                                          .textController2.text,
                                                      apiGlobalKey:
                                                          FFAppState().apiKey,
                                                    );
                                                    if ((_model.apiResult55u
                                                            ?.succeeded ??
                                                        true)) {
                                                      setState(() {
                                                        _model.textController2
                                                            ?.text = '';
                                                      });
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                            title:
                                                                Text('error'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          ));
                                                        },
                                                      );
                                                    }

                                                    setState(() {});
                                                  },
                                                  child: Icon(
                                                    Icons.send_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                          ),
                                        ],
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
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                    ))
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            wrapWithModel(
                              model: _model.sideBarRightModel,
                              updateCallback: () => setState(() {}),
                              child: SideBarRightWidget(),
                            ),
                          ],
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [],
                ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (responsiveVisibility(
                    context: context,
                    desktop: false,
                  ))
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
  }
}
