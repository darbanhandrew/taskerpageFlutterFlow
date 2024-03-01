import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/button_next_widget.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/navigation_bar_widget.dart';
import '/components/task2_task_creation_web_widget.dart';
import '/components/task_task_creation_web_widget.dart';
import '/components/taskcreation_menue_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'select_address_widget.dart' show SelectAddressWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SelectAddressModel extends FlutterFlowModel<SelectAddressWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (postRead)] action in Select_Address widget.
  ApiCallResponse? apiResultu37;
  // Model for Main_Drawer component.
  late MainDrawerModel mainDrawerModel;
  // Model for navigationBar component.
  late NavigationBarModel navigationBarModel1;
  // Model for navigationBar component.
  late NavigationBarModel navigationBarModel2;
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for taskcreationMenue component.
  late TaskcreationMenueModel taskcreationMenueModel;
  // Model for button_Next component.
  late ButtonNextModel buttonNextModel;
  // Stores action output result for [Backend Call - API (update task address)] action in button_Next widget.
  ApiCallResponse? updatedAddress;
  // Model for task_task_creation_web component.
  late TaskTaskCreationWebModel taskTaskCreationWebModel;
  // Model for task2_task_creation_web component.
  late Task2TaskCreationWebModel task2TaskCreationWebModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    mainDrawerModel = createModel(context, () => MainDrawerModel());
    navigationBarModel1 = createModel(context, () => NavigationBarModel());
    navigationBarModel2 = createModel(context, () => NavigationBarModel());
    headerModel = createModel(context, () => HeaderModel());
    taskcreationMenueModel =
        createModel(context, () => TaskcreationMenueModel());
    buttonNextModel = createModel(context, () => ButtonNextModel());
    taskTaskCreationWebModel =
        createModel(context, () => TaskTaskCreationWebModel());
    task2TaskCreationWebModel =
        createModel(context, () => Task2TaskCreationWebModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    mainDrawerModel.dispose();
    navigationBarModel1.dispose();
    navigationBarModel2.dispose();
    headerModel.dispose();
    taskcreationMenueModel.dispose();
    buttonNextModel.dispose();
    taskTaskCreationWebModel.dispose();
    task2TaskCreationWebModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
