import '/backend/api_requests/api_calls.dart';
import '/components/bottom_sheetfor_pay_widget.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'show_plans_widget.dart' show ShowPlansWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ShowPlansModel extends FlutterFlowModel<ShowPlansWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Header component.
  late HeaderModel headerModel;
  // Stores action output result for [Backend Call - API (init sub)] action in Container widget.
  ApiCallResponse? subscription;
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // Model for Main_Drawer component.
  late MainDrawerModel mainDrawerModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    navBarModel = createModel(context, () => NavBarModel());
    mainDrawerModel = createModel(context, () => MainDrawerModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    navBarModel.dispose();
    mainDrawerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
