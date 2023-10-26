import '/backend/api_requests/api_calls.dart';
import '/components/checkbox_widget.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/my_posts_sheet_widget.dart';
import '/components/nav_bar_widget.dart';
import '/components/view_certificate_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'tasker_profile_view_widget.dart' show TaskerProfileViewWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TaskerProfileViewModel extends FlutterFlowModel<TaskerProfileViewWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Header component.
  late HeaderModel headerModel;
  // Stores action output result for [Backend Call - API (Follow req)] action in Container widget.
  ApiCallResponse? followREQ;
  // Models for checkbox dynamic component.
  late FlutterFlowDynamicModels<CheckboxModel> checkboxModels;
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // Model for Main_Drawer component.
  late MainDrawerModel mainDrawerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    checkboxModels = FlutterFlowDynamicModels(() => CheckboxModel());
    navBarModel = createModel(context, () => NavBarModel());
    mainDrawerModel = createModel(context, () => MainDrawerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    checkboxModels.dispose();
    navBarModel.dispose();
    mainDrawerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
