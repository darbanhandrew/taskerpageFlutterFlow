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
import '/flutter_flow/request_manager.dart';

import 'chat_widget.dart' show ChatWidget;
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ChatModel extends FlutterFlowModel<ChatWidget> {
  ///  Local state fields for this page.

  List<CheapsChatStruct> chatPageChips = [];
  void addToChatPageChips(CheapsChatStruct item) => chatPageChips.add(item);
  void removeFromChatPageChips(CheapsChatStruct item) =>
      chatPageChips.remove(item);
  void removeAtIndexFromChatPageChips(int index) =>
      chatPageChips.removeAt(index);
  void insertAtIndexInChatPageChips(int index, CheapsChatStruct item) =>
      chatPageChips.insert(index, item);
  void updateChatPageChipsAtIndex(
          int index, Function(CheapsChatStruct) updateFn) =>
      chatPageChips[index] = updateFn(chatPageChips[index]);

  ChatRoomStruct? chatRoom;
  void updateChatRoomStruct(Function(ChatRoomStruct) updateFn) =>
      updateFn(chatRoom ??= ChatRoomStruct());

  int? taskID;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Get Chat Room Details)] action in chat widget.
  ApiCallResponse? chatRoomDetails;
  // Stores action output result for [Backend Call - API (Mark As Read)] action in chat widget.
  ApiCallResponse? apiResult39c;
  bool apiRequestCompleted3 = false;
  String? apiRequestLastUniqueKey3;
  // Model for Header_web component.
  late HeaderWebModel headerWebModel;
  Completer<ApiCallResponse>? apiRequestCompleter1;
  Completer<ApiCallResponse>? apiRequestCompleter5;
  Completer<ApiCallResponse>? apiRequestCompleter2;
  Completer<ApiCallResponse>? apiRequestCompleter4;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Models for ChatMessage dynamic component.
  late FlutterFlowDynamicModels<ChatMessageModel> chatMessageModels;
  // Model for chatMessageActions component.
  late ChatMessageActionsModel chatMessageActionsModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Backend Call - API (send message)] action in Icon widget.
  ApiCallResponse? apiResult55u;
  // Model for sideBar_Right component.
  late SideBarRightModel sideBarRightModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  /// Query cache managers for this widget.

  final _chatMessagesManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> chatMessages({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _chatMessagesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearChatMessagesCache() => _chatMessagesManager.clear();
  void clearChatMessagesCacheKey(String? uniqueKey) =>
      _chatMessagesManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerWebModel = createModel(context, () => HeaderWebModel());
    chatMessageModels = FlutterFlowDynamicModels(() => ChatMessageModel());
    chatMessageActionsModel =
        createModel(context, () => ChatMessageActionsModel());
    sideBarRightModel = createModel(context, () => SideBarRightModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerWebModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    chatMessageModels.dispose();
    chatMessageActionsModel.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    sideBarRightModel.dispose();
    navBarModel.dispose();

    /// Dispose query cache managers for this widget.

    clearChatMessagesCache();
  }

  /// Action blocks are added here.

  Future pushNewMessage(
    BuildContext context, {
    dynamic message,
  }) async {}

  /// Additional helper methods are added here.

  Future waitForApiRequestCompleted3({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleted3;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted5({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter5?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted4({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter4?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
