import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Skills4Model extends FlutterFlowModel {
  ///  Local state fields for this page.

  dynamic serviceCategoriesJson;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (serviceCategoryList)] action in Skills-4 widget.
  ApiCallResponse? apiResultmry;
  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
