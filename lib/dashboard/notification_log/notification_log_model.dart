import '/backend/api_requests/api_calls.dart';
import '/components/drawer_content_widget.dart';
import '/components/header_widget.dart';
import '/components/navigate_back_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'notification_log_widget.dart' show NotificationLogWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificationLogModel extends FlutterFlowModel<NotificationLogWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for NavigateBack component.
  late NavigateBackModel navigateBackModel;
  // Stores action output result for [Backend Call - API (notification read)] action in Container widget.
  ApiCallResponse? apiResultj0l;
  // Model for drawerContent component.
  late DrawerContentModel drawerContentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    navigateBackModel = createModel(context, () => NavigateBackModel());
    drawerContentModel = createModel(context, () => DrawerContentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    navigateBackModel.dispose();
    drawerContentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
