import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/address_task_creation_web_widget.dart';
import '/components/button_next_widget.dart';
import '/components/calender_task_creation_web_widget.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/navigation_bar_widget.dart';
import '/components/task2_task_creation_web_widget.dart';
import '/components/task_task_creation_web_widget.dart';
import '/components/taskcreation_menue_widget.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'rates_widget.dart' show RatesWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class RatesModel extends FlutterFlowModel<RatesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (postRead)] action in Rates widget.
  ApiCallResponse? apiResultsr988;
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
  // State field(s) for CountController widget.
  int? countControllerValue;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for button_Next component.
  late ButtonNextModel buttonNextModel;
  // Stores action output result for [Backend Call - API (update task rate)] action in button_Next widget.
  ApiCallResponse? apiResult9kx20;
  // Model for task_task_creation_web component.
  late TaskTaskCreationWebModel taskTaskCreationWebModel;
  // Model for task2_task_creation_web component.
  late Task2TaskCreationWebModel task2TaskCreationWebModel;
  // Model for address_task_creation_web component.
  late AddressTaskCreationWebModel addressTaskCreationWebModel;
  // Model for calender_task_creation_web component.
  late CalenderTaskCreationWebModel calenderTaskCreationWebModel;

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
    calenderTaskCreationWebModel =
        createModel(context, () => CalenderTaskCreationWebModel());
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
    calenderTaskCreationWebModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
