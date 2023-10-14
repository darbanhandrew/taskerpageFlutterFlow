import '/backend/api_requests/api_calls.dart';
import '/components/notification_icon_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'header_widget.dart' show HeaderWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HeaderModel extends FlutterFlowModel<HeaderWidget> {
  ///  Local state fields for this component.

  bool hasNotification = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (notification log)] action in Header widget.
  ApiCallResponse? notificationRead;
  // Model for notificationIcon component.
  late NotificationIconModel notificationIconModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    notificationIconModel = createModel(context, () => NotificationIconModel());
  }

  void dispose() {
    notificationIconModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
