import '/backend/api_requests/api_calls.dart';
import '/components/my_post_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_list_model.dart';
export 'chat_list_model.dart';

class ChatListWidget extends StatefulWidget {
  const ChatListWidget({
    Key? key,
    required this.task,
    required this.myPost,
  }) : super(key: key);

  final int? task;
  final dynamic myPost;

  @override
  _ChatListWidgetState createState() => _ChatListWidgetState();
}

class _ChatListWidgetState extends State<ChatListWidget> {
  late ChatListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatListModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.listenSocketEvent(
        'private_room_creation',
        () async {
          setState(() => _model.apiRequestCompleter = null);
          await _model.waitForApiRequestCompleted();
        },
      );
      await actions.listenSocketEvent(
        'latest_chat_updates',
        () async {
          setState(() => _model.apiRequestCompleter = null);
          await _model.waitForApiRequestCompleted();
        },
      );
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
        backgroundColor: Color(0xFFF2F2F2),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(32.0, 20.0, 32.0, 20.0),
              child: FutureBuilder<ApiCallResponse>(
                future: TaskerpageBackendGroup.postReadCall.call(
                  id: widget.task?.toString(),
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
                  final rowPostReadResponse = snapshot.data!;
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 5.0, 0.0),
                              child: wrapWithModel(
                                model: _model.myPostCardModel,
                                updateCallback: () => setState(() {}),
                                child: MyPostCardWidget(
                                  postData: widget.myPost!,
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
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4.0,
                      color: Color(0x33000000),
                      spreadRadius: 4.0,
                    )
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(32.0, 20.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Users related to this post',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: FutureBuilder<ApiCallResponse>(
                              future: TaskerpageBackendGroup
                                  .getMyTasksGroupByCall
                                  .call(
                                filters:
                                    '[[\"customer_task\",\"=\",\"${widget.task?.toString()}\"]]',
                                fields: '[\"customer_task\",\"user\"]',
                                orderBy: 'creation desc',
                                limitStart: 0,
                                limit: 100,
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
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                final containerGetMyTasksGroupByResponse =
                                    snapshot.data!;
                                return Container(
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 8.0, 8.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          functions
                                              .numberofListitems(
                                                  (TaskerpageBackendGroup
                                                          .getMyTasksGroupByCall
                                                          .users(
                                                containerGetMyTasksGroupByResponse
                                                    .jsonBody,
                                              ) as List)
                                                      .map<String>(
                                                          (s) => s.toString())
                                                      .toList()
                                                      ?.map((e) => e.toString())
                                                      .toList()
                                                      ?.toList())
                                              .toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lato',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                fontSize: 10.0,
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
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: FutureBuilder<ApiCallResponse>(
                            future: TaskerpageBackendGroup.getMyTasksGroupByCall
                                .call(
                              filters:
                                  '[[\"customer_task\",\"=\",\"${widget.task?.toString()}\"]]',
                              fields: '[\"customer_task\",\"user\"]',
                              orderBy: 'creation desc',
                              limitStart: 0,
                              limit: 100,
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              final rowGetMyTasksGroupByResponse =
                                  snapshot.data!;
                              return Builder(
                                builder: (context) {
                                  final usersThisPost = getJsonField(
                                    rowGetMyTasksGroupByResponse.jsonBody,
                                    r'''$.data''',
                                  ).toList();
                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children:
                                          List.generate(usersThisPost.length,
                                              (usersThisPostIndex) {
                                        final usersThisPostItem =
                                            usersThisPost[usersThisPostIndex];
                                        return Stack(
                                          alignment:
                                              AlignmentDirectional(1.0, 1.0),
                                          children: [
                                            FutureBuilder<ApiCallResponse>(
                                              future: TaskerpageBackendGroup
                                                  .readByEmailCall
                                                  .call(
                                                user:
                                                    '[[\"user\",\"=\",\"${getJsonField(
                                                  usersThisPostItem,
                                                  r'''$.user''',
                                                ).toString()}\"]]',
                                                fields: '[\"avatar\"]',
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
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final circleImageReadByEmailResponse =
                                                    snapshot.data!;
                                                return Container(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    '${FFAppState().baseUrl}${TaskerpageBackendGroup.readByEmailCall.avatar(
                                                          circleImageReadByEmailResponse
                                                              .jsonBody,
                                                        ).toString()}',
                                                    fit: BoxFit.cover,
                                                  ),
                                                );
                                              },
                                            ),
                                            Container(
                                              width: 13.0,
                                              height: 13.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF71DD3A),
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      }).divide(SizedBox(width: 13.0)),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Chats related ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 0.0, 0.0),
                              child: FutureBuilder<ApiCallResponse>(
                                future:
                                    TaskerpageBackendGroup.chatListCall.call(
                                  user: getJsonField(
                                    FFAppState().userProfile,
                                    r'''$.data.user''',
                                  ).toString(),
                                  apiGlobalKey:
                                      'token 93c031f5d19f49e:9b69a0c2d98e87e',
                                  task: widget.task,
                                ),
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
                                  final containerChatListResponse =
                                      snapshot.data!;
                                  return Container(
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x33000000),
                                          offset: Offset(0.0, 2.0),
                                        )
                                      ],
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            functions
                                                .numberofListitems(
                                                    (TaskerpageBackendGroup
                                                            .chatListCall
                                                            .name(
                                                  containerChatListResponse
                                                      .jsonBody,
                                                ) as List)
                                                        .map<String>(
                                                            (s) => s.toString())
                                                        .toList()
                                                        ?.toList())
                                                .toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lato',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  fontSize: 10.0,
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
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 32.0, 20.0),
                          child: FutureBuilder<ApiCallResponse>(
                            future: (_model.apiRequestCompleter ??= Completer<
                                    ApiCallResponse>()
                                  ..complete(
                                      TaskerpageBackendGroup.chatListCall.call(
                                    user: getJsonField(
                                      FFAppState().userProfile,
                                      r'''$.data.user''',
                                    ).toString(),
                                    apiGlobalKey:
                                        'token 93c031f5d19f49e:9b69a0c2d98e87e',
                                    task: widget.task,
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              final listViewChatListResponse = snapshot.data!;
                              return Builder(
                                builder: (context) {
                                  final myChats = getJsonField(
                                    listViewChatListResponse.jsonBody,
                                    r'''$.message''',
                                  ).toList();
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: myChats.length,
                                    itemBuilder: (context, myChatsIndex) {
                                      final myChatsItem = myChats[myChatsIndex];
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          FutureBuilder<ApiCallResponse>(
                                            future: TaskerpageBackendGroup
                                                .readByEmailCall
                                                .call(
                                              user:
                                                  '[[\"user\",\"=\",\"${getJsonField(
                                                myChatsItem,
                                                r'''$.opposite_person_email''',
                                              ).toString()}\"]]',
                                              fields:
                                                  '[\"name\",\"first_name\",\"last_name\",\"avatar\"]',
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              final rowReadByEmailResponse =
                                                  snapshot.data!;
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'chat',
                                                    pathParameters: {
                                                      'room': serializeParam(
                                                        getJsonField(
                                                          myChatsItem,
                                                          r'''$.name''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                    queryParameters: {
                                                      'curentUser':
                                                          serializeParam(
                                                        getJsonField(
                                                          FFAppState()
                                                              .userProfile,
                                                          r'''$.data.user''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                      'startChat':
                                                          serializeParam(
                                                        dateTimeFormat(
                                                            'MMMEd',
                                                            functions
                                                                .jsonToDateTime(
                                                                    getJsonField(
                                                              myChatsItem,
                                                              r'''$.modified''',
                                                            ).toString())),
                                                        ParamType.String,
                                                      ),
                                                      'nameFamily':
                                                          serializeParam(
                                                        '${TaskerpageBackendGroup.readByEmailCall.name(
                                                              rowReadByEmailResponse
                                                                  .jsonBody,
                                                            ).toString()} ${TaskerpageBackendGroup.readByEmailCall.family(
                                                              rowReadByEmailResponse
                                                                  .jsonBody,
                                                            ).toString()}',
                                                        ParamType.String,
                                                      ),
                                                      'avatar': serializeParam(
                                                        TaskerpageBackendGroup
                                                            .readByEmailCall
                                                            .avatar(
                                                              rowReadByEmailResponse
                                                                  .jsonBody,
                                                            )
                                                            .toString(),
                                                        ParamType.String,
                                                      ),
                                                      'postID': serializeParam(
                                                        widget.task,
                                                        ParamType.int,
                                                      ),
                                                      'taskerID':
                                                          serializeParam(
                                                        TaskerpageBackendGroup
                                                            .readByEmailCall
                                                            .id(
                                                          rowReadByEmailResponse
                                                              .jsonBody,
                                                        ),
                                                        ParamType.int,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Flexible(
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: 47.0,
                                                                    height:
                                                                        47.0,
                                                                    clipBehavior:
                                                                        Clip.antiAlias,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child: Image
                                                                        .network(
                                                                      '${FFAppState().baseUrl}${TaskerpageBackendGroup.readByEmailCall.avatar(
                                                                            rowReadByEmailResponse.jsonBody,
                                                                          ).toString()}',
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
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
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            15.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              '${TaskerpageBackendGroup.readByEmailCall.name(
                                                                                    rowReadByEmailResponse.jsonBody,
                                                                                  ).toString()} ${TaskerpageBackendGroup.readByEmailCall.family(
                                                                                    rowReadByEmailResponse.jsonBody,
                                                                                  ).toString()}',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Lato',
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    fontSize: 14.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              dateTimeFormat(
                                                                                  'MMMEd',
                                                                                  functions.jsonToDateTime(getJsonField(
                                                                                    myChatsItem,
                                                                                    r'''$.modified''',
                                                                                  ).toString())),
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
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                getJsonField(
                                                                                  myChatsItem,
                                                                                  r'''$.last_message''',
                                                                                ).toString().maybeHandleOverflow(
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
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              if (functions
                                                                                      .jsonToInt(getJsonField(
                                                                                        myChatsItem,
                                                                                        r'''$.is_read''',
                                                                                      ))
                                                                                      .toString() ==
                                                                                  '0')
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 10.0,
                                                                                    height: 10.0,
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
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            4.0)),
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
                                              );
                                            },
                                          ),
                                          Divider(
                                            height: 26.0,
                                            thickness: 1.0,
                                            color: Color(0xFFDEDEDE),
                                          ),
                                        ],
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
