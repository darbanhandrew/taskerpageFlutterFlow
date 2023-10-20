import '/backend/api_requests/api_calls.dart';
import '/components/aler_modal_massage_accept_appointment_widget.dart';
import '/components/aler_modal_massage_reject_appointment_widget.dart';
import '/components/set_appointment_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/request_manager.dart';

import 'chat_widget.dart' show ChatWidget;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatModel extends FlutterFlowModel<ChatWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Mark As Read)] action in chat widget.
  ApiCallResponse? apiResult39c;
  bool apiRequestCompleted = false;
  String? apiRequestLastUniqueKey;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (send message)] action in Icon widget.
  ApiCallResponse? apiResult55u;

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

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    /// Dispose query cache managers for this widget.

    clearChatMessagesCache();
  }

  /// Action blocks are added here.

  Future pushNewMessage(
    BuildContext context, {
    dynamic message,
  }) async {}

  /// Additional helper methods are added here.

  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
