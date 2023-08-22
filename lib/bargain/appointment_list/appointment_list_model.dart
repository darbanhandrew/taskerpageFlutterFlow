import '/backend/api_requests/api_calls.dart';
import '/components/aler_modal_massage_accept_appointment_widget.dart';
import '/components/aler_modal_massage_reject_appointment_widget.dart';
import '/components/header_widget.dart';
import '/components/navigate_back_widget.dart';
import '/components/set_appointment_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppointmentListModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for NavigateBack component.
  late NavigateBackModel navigateBackModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    navigateBackModel = createModel(context, () => NavigateBackModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    navigateBackModel.dispose();
    tabBarController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
