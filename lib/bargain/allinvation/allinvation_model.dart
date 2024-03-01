import '/backend/api_requests/api_calls.dart';
import '/components/header_web_widget.dart';
import '/components/nav_bar_widget.dart';
import '/components/side_bar_left_network_widget.dart';
import '/components/side_bar_right_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'allinvation_widget.dart' show AllinvationWidget;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AllinvationModel extends FlutterFlowModel<AllinvationWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Header_web component.
  late HeaderWebModel headerWebModel;
  // Model for sideBar_left_Network component.
  late SideBarLeftNetworkModel sideBarLeftNetworkModel;
  // Stores action output result for [Backend Call - API (answer to follow req)] action in Text widget.
  ApiCallResponse? apiResult1wo;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Stores action output result for [Backend Call - API (answer to follow req)] action in Container widget.
  ApiCallResponse? apiResult1woCopy;
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // Model for sideBar_Right component.
  late SideBarRightModel sideBarRightModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    headerWebModel = createModel(context, () => HeaderWebModel());
    sideBarLeftNetworkModel =
        createModel(context, () => SideBarLeftNetworkModel());
    navBarModel = createModel(context, () => NavBarModel());
    sideBarRightModel = createModel(context, () => SideBarRightModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headerWebModel.dispose();
    sideBarLeftNetworkModel.dispose();
    navBarModel.dispose();
    sideBarRightModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
