import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/emty_container_widget.dart';
import '/components/selectable_box_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/backend/schema/structs/index.dart';
import 'selectable_skills_list_widget.dart' show SelectableSkillsListWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectableSkillsListModel
    extends FlutterFlowModel<SelectableSkillsListWidget> {
  ///  State fields for stateful widgets in this component.

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
