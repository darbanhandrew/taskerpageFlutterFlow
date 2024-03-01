import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/address_task_creation_web_widget.dart';
import '/components/button_next_widget.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/navigation_bar_widget.dart';
import '/components/task2_task_creation_web_widget.dart';
import '/components/task_task_creation_web_widget.dart';
import '/components/taskcreation_menue_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'taskstime_widget.dart' show TaskstimeWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class TaskstimeModel extends FlutterFlowModel<TaskstimeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (postRead)] action in taskstime widget.
  ApiCallResponse? apiResult27899;
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
  // Stores action output result for [Backend Call - API (update tasks time)] action in button_Next widget.
  ApiCallResponse? updateTasksTime;
  // Model for task_task_creation_web component.
  late TaskTaskCreationWebModel taskTaskCreationWebModel;
  // Model for task2_task_creation_web component.
  late Task2TaskCreationWebModel task2TaskCreationWebModel;
  // Model for address_task_creation_web component.
  late AddressTaskCreationWebModel addressTaskCreationWebModel;

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
    addressTaskCreationWebModel =
        createModel(context, () => AddressTaskCreationWebModel());
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
    addressTaskCreationWebModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
