import '/components/selectable_box_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'select_skill_level_widget.dart' show SelectSkillLevelWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectSkillLevelModel extends FlutterFlowModel<SelectSkillLevelWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;
  // Models for selectableBox dynamic component.
  late FlutterFlowDynamicModels<SelectableBoxModel> selectableBoxModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    selectableBoxModels = FlutterFlowDynamicModels(() => SelectableBoxModel());
  }

  void dispose() {
    selectableBoxModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
