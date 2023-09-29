import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/drawer_content_widget.dart';
import '/components/header_widget.dart';
import '/components/navigation_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'taskertype_widget.dart' show TaskertypeWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TaskertypeModel extends FlutterFlowModel<TaskertypeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (postRead)] action in Taskertype widget.
  ApiCallResponse? apiResultl1j;
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for navigationBar component.
  late NavigationBarModel navigationBarModel;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - API (update tasker type)] action in Container widget.
  ApiCallResponse? updateTAskerType;
  // Model for drawerContent component.
  late DrawerContentModel drawerContentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    navigationBarModel = createModel(context, () => NavigationBarModel());
    drawerContentModel = createModel(context, () => DrawerContentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    navigationBarModel.dispose();
    drawerContentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
