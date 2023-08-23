import '/backend/schema/structs/index.dart';
import '/components/button_next_widget.dart';
import '/components/header_widget.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Taskertype2Model extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for CountController widget.
  int? countControllerValue;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Model for button_Next component.
  late ButtonNextModel buttonNextModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    buttonNextModel = createModel(context, () => ButtonNextModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    buttonNextModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
