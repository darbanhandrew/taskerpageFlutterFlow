import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/address_task_creation_web_widget.dart';
import '/components/button_next_widget.dart';
import '/components/calender_task_creation_web_widget.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/navigation_bar_widget.dart';
import '/components/rate_task_creation_web_widget.dart';
import '/components/task2_task_creation_web_widget.dart';
import '/components/task_task_creation_web_widget.dart';
import '/components/taskcreation_menue_widget.dart';
import '/components/tasker_type_task_creation_web_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'taskertype3_widget.dart' show Taskertype3Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class Taskertype3Model extends FlutterFlowModel<Taskertype3Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (register)] action in Taskertype3 widget.
  ApiCallResponse? apiResulthrh;
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
  // State field(s) for Slider widget.
  double? sliderValue;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for CountController widget.
  int? countControllerValue1;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for CountController widget.
  int? countControllerValue2;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for CountController widget.
  int? countControllerValue3;
  // Model for button_Next component.
  late ButtonNextModel buttonNextModel;
  // Stores action output result for [Backend Call - API (updateTaskerTypeThree)] action in button_Next widget.
  ApiCallResponse? taskCrreation1;
  // Stores action output result for [Backend Call - API (updateTaskerTypeThree)] action in button_Next widget.
  ApiCallResponse? taskCrreation;
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
  // Model for taskerType_task_creation_web component.
  late TaskerTypeTaskCreationWebModel taskerTypeTaskCreationWebModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    navigationBarModel1 = createModel(context, () => NavigationBarModel());
    mainDrawerModel = createModel(context, () => MainDrawerModel());
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
    rateTaskCreationWebModel =
        createModel(context, () => RateTaskCreationWebModel());
    taskerTypeTaskCreationWebModel =
        createModel(context, () => TaskerTypeTaskCreationWebModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navigationBarModel1.dispose();
    mainDrawerModel.dispose();
    navigationBarModel2.dispose();
    headerModel.dispose();
    taskcreationMenueModel.dispose();
    buttonNextModel.dispose();
    taskTaskCreationWebModel.dispose();
    task2TaskCreationWebModel.dispose();
    addressTaskCreationWebModel.dispose();
    calenderTaskCreationWebModel.dispose();
    rateTaskCreationWebModel.dispose();
    taskerTypeTaskCreationWebModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
