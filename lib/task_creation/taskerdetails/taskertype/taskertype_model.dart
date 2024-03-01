import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/address_task_creation_web_widget.dart';
import '/components/calender_task_creation_web_widget.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/navigation_bar_widget.dart';
import '/components/rate_task_creation_web_widget.dart';
import '/components/task2_task_creation_web_widget.dart';
import '/components/task_task_creation_web_widget.dart';
import '/components/taskcreation_menue_widget.dart';
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
import 'package:webviewx_plus/webviewx_plus.dart';

class TaskertypeModel extends FlutterFlowModel<TaskertypeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (postRead)] action in Taskertype widget.
  ApiCallResponse? apiResultl1j;
  // Model for navigationBar component.
  late NavigationBarModel navigationBarModel1;
  // Model for Main_Drawer component.
  late MainDrawerModel mainDrawerModel;
  // Model for navigationBar component.
  late NavigationBarModel navigationBarModel2;
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for taskcreationMenue component.
  late TaskcreationMenueModel taskcreationMenueModel;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - API (update tasker type)] action in Container widget.
  ApiCallResponse? updateTAskerType;
  // Model for task_task_creation_web component.
  late TaskTaskCreationWebModel taskTaskCreationWebModel;
  // Model for task2_task_creation_web component.
  late Task2TaskCreationWebModel task2TaskCreationWebModel;
  // Model for address_task_creation_web component.
  late AddressTaskCreationWebModel addressTaskCreationWebModel;
  // Model for calender_task_creation_web component.
  late CalenderTaskCreationWebModel calenderTaskCreationWebModel;
  // Model for rate_task_creation_web component.
  late RateTaskCreationWebModel rateTaskCreationWebModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    navigationBarModel1 = createModel(context, () => NavigationBarModel());
    mainDrawerModel = createModel(context, () => MainDrawerModel());
    navigationBarModel2 = createModel(context, () => NavigationBarModel());
    headerModel = createModel(context, () => HeaderModel());
    taskcreationMenueModel =
        createModel(context, () => TaskcreationMenueModel());
    taskTaskCreationWebModel =
        createModel(context, () => TaskTaskCreationWebModel());
    task2TaskCreationWebModel =
        createModel(context, () => Task2TaskCreationWebModel());
    addressTaskCreationWebModel =
        createModel(context, () => AddressTaskCreationWebModel());
    calenderTaskCreationWebModel =
        createModel(context, () => CalenderTaskCreationWebModel());
    rateTaskCreationWebModel =
        createModel(context, () => RateTaskCreationWebModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navigationBarModel1.dispose();
    mainDrawerModel.dispose();
    navigationBarModel2.dispose();
    headerModel.dispose();
    taskcreationMenueModel.dispose();
    taskTaskCreationWebModel.dispose();
    task2TaskCreationWebModel.dispose();
    addressTaskCreationWebModel.dispose();
    calenderTaskCreationWebModel.dispose();
    rateTaskCreationWebModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
