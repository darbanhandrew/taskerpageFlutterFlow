import '/backend/api_requests/api_calls.dart';
import '/components/task_card_widget.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BidModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for TaskCard component.
  late TaskCardModel taskCardModel;
  // State field(s) for CountController widget.
  int? countControllerValue;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Stores action output result for [Backend Call - API (CreateBargain)] action in Container widget.
  ApiCallResponse? bId;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    taskCardModel = createModel(context, () => TaskCardModel());
  }

  void dispose() {
    taskCardModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
