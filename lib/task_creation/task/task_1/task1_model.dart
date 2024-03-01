import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/button_next_widget.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/navigation_bar_widget.dart';
import '/components/selectable_container_widget.dart';
import '/components/taskcreation_menue_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'task1_widget.dart' show Task1Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class Task1Model extends FlutterFlowModel<Task1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (postRead)] action in Task-1 widget.
  ApiCallResponse? apiResulture;
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
  // Models for selectable_container dynamic component.
  late FlutterFlowDynamicModels<SelectableContainerModel>
      selectableContainerModels;
  // Model for button_Next component.
  late ButtonNextModel buttonNextModel;
  // Stores action output result for [Backend Call - API (Task Creation skill category)] action in button_Next widget.
  ApiCallResponse? create;
  // Stores action output result for [Backend Call - API (update skillCategoryInTask)] action in button_Next widget.
  ApiCallResponse? apiResultggw;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    mainDrawerModel = createModel(context, () => MainDrawerModel());
    navigationBarModel1 = createModel(context, () => NavigationBarModel());
    navigationBarModel2 = createModel(context, () => NavigationBarModel());
    headerModel = createModel(context, () => HeaderModel());
    taskcreationMenueModel =
        createModel(context, () => TaskcreationMenueModel());
    selectableContainerModels =
        FlutterFlowDynamicModels(() => SelectableContainerModel());
    buttonNextModel = createModel(context, () => ButtonNextModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    mainDrawerModel.dispose();
    navigationBarModel1.dispose();
    navigationBarModel2.dispose();
    headerModel.dispose();
    taskcreationMenueModel.dispose();
    selectableContainerModels.dispose();
    buttonNextModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
