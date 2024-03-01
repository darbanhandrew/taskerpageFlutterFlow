import '/backend/api_requests/api_calls.dart';
import '/components/address_card_widget.dart';
import '/components/drawer_content_widget.dart';
import '/components/header_widget.dart';
import '/components/navigate_back_widget.dart';
import '/components/side_bar_left_sign_up_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'contactdata2_widget.dart' show Contactdata2Widget;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class Contactdata2Model extends FlutterFlowModel<Contactdata2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  Completer<ApiCallResponse>? apiRequestCompleter2;
  // Model for drawerContent component.
  late DrawerContentModel drawerContentModel;
  // Model for side_bar_left_sign_up component.
  late SideBarLeftSignUpModel sideBarLeftSignUpModel;
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for NavigateBack component.
  late NavigateBackModel navigateBackModel;
  Completer<ApiCallResponse>? apiRequestCompleter1;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    drawerContentModel = createModel(context, () => DrawerContentModel());
    sideBarLeftSignUpModel =
        createModel(context, () => SideBarLeftSignUpModel());
    headerModel = createModel(context, () => HeaderModel());
    navigateBackModel = createModel(context, () => NavigateBackModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerContentModel.dispose();
    sideBarLeftSignUpModel.dispose();
    headerModel.dispose();
    navigateBackModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

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
}
