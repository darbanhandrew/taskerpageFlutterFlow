import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/drawer_content_widget.dart';
import '/components/header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'skills3_widget.dart' show Skills3Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Skills3Model extends FlutterFlowModel<Skills3Widget> {
  ///  Local state fields for this page.

  List<String> chosenSkillCategory = [];
  void addToChosenSkillCategory(String item) => chosenSkillCategory.add(item);
  void removeFromChosenSkillCategory(String item) =>
      chosenSkillCategory.remove(item);
  void removeAtIndexFromChosenSkillCategory(int index) =>
      chosenSkillCategory.removeAt(index);
  void insertAtIndexInChosenSkillCategory(int index, String item) =>
      chosenSkillCategory.insert(index, item);
  void updateChosenSkillCategoryAtIndex(int index, Function(String) updateFn) =>
      chosenSkillCategory[index] = updateFn(chosenSkillCategory[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (userProfileRead)] action in Skills-3 widget.
  ApiCallResponse? userProfile;
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for drawerContent component.
  late DrawerContentModel drawerContentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    drawerContentModel = createModel(context, () => DrawerContentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    drawerContentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
