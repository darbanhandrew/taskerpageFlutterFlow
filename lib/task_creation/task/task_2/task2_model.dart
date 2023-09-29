import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/button_next_widget.dart';
import '/components/drawer_content_widget.dart';
import '/components/drope_down_languages_widget.dart';
import '/components/emty_container_widget.dart';
import '/components/header_widget.dart';
import '/components/navigation_bar_widget.dart';
import '/components/skill_options_check_component_widget.dart';
import '/components/skill_options_chips_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'task2_widget.dart' show Task2Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Task2Model extends FlutterFlowModel<Task2Widget> {
  ///  Local state fields for this page.

  List<SkillOptionsStruct> skillOptionList = [];
  void addToSkillOptionList(SkillOptionsStruct item) =>
      skillOptionList.add(item);
  void removeFromSkillOptionList(SkillOptionsStruct item) =>
      skillOptionList.remove(item);
  void removeAtIndexFromSkillOptionList(int index) =>
      skillOptionList.removeAt(index);
  void insertAtIndexInSkillOptionList(int index, SkillOptionsStruct item) =>
      skillOptionList.insert(index, item);
  void updateSkillOptionListAtIndex(
          int index, Function(SkillOptionsStruct) updateFn) =>
      skillOptionList[index] = updateFn(skillOptionList[index]);

  List<SkillOptionsStruct> tempSkillOptionList = [];
  void addToTempSkillOptionList(SkillOptionsStruct item) =>
      tempSkillOptionList.add(item);
  void removeFromTempSkillOptionList(SkillOptionsStruct item) =>
      tempSkillOptionList.remove(item);
  void removeAtIndexFromTempSkillOptionList(int index) =>
      tempSkillOptionList.removeAt(index);
  void insertAtIndexInTempSkillOptionList(int index, SkillOptionsStruct item) =>
      tempSkillOptionList.insert(index, item);
  void updateTempSkillOptionListAtIndex(
          int index, Function(SkillOptionsStruct) updateFn) =>
      tempSkillOptionList[index] = updateFn(tempSkillOptionList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (postRead)] action in Task-2 widget.
  ApiCallResponse? apiResultpuo;
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for navigationBar component.
  late NavigationBarModel navigationBarModel;
  // Stores action output result for [Backend Call - API (Skill Details)] action in Container widget.
  ApiCallResponse? skillDetails;
  // Models for skillOptionsCheckComponent dynamic component.
  late FlutterFlowDynamicModels<SkillOptionsCheckComponentModel>
      skillOptionsCheckComponentModels;
  // Models for skillOptionsChipsComponent dynamic component.
  late FlutterFlowDynamicModels<SkillOptionsChipsComponentModel>
      skillOptionsChipsComponentModels;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for Switch widget.
  bool? switchValue3;
  // Model for dropeDownLanguages component.
  late DropeDownLanguagesModel dropeDownLanguagesModel;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (upload)] action in Container widget.
  ApiCallResponse? apiResultekx34;
  // Model for button_Next component.
  late ButtonNextModel buttonNextModel;
  // Stores action output result for [Backend Call - API (update task details)] action in button_Next widget.
  ApiCallResponse? updatedTask;
  // Model for drawerContent component.
  late DrawerContentModel drawerContentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    navigationBarModel = createModel(context, () => NavigationBarModel());
    skillOptionsCheckComponentModels =
        FlutterFlowDynamicModels(() => SkillOptionsCheckComponentModel());
    skillOptionsChipsComponentModels =
        FlutterFlowDynamicModels(() => SkillOptionsChipsComponentModel());
    dropeDownLanguagesModel =
        createModel(context, () => DropeDownLanguagesModel());
    buttonNextModel = createModel(context, () => ButtonNextModel());
    drawerContentModel = createModel(context, () => DrawerContentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    navigationBarModel.dispose();
    skillOptionsCheckComponentModels.dispose();
    skillOptionsChipsComponentModels.dispose();
    dropeDownLanguagesModel.dispose();
    textController?.dispose();
    buttonNextModel.dispose();
    drawerContentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
