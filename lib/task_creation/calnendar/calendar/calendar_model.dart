import '/backend/schema/structs/index.dart';
import '/components/button_next_widget.dart';
import '/components/header_widget.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CalendarModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  PosCalendarStruct? calendarData;
  void updateCalendarDataStruct(Function(PosCalendarStruct) updateFn) =>
      updateFn(calendarData ??= PosCalendarStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Header component.
  late HeaderModel headerModel;
  DateTime? datePicked1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for CountController widget.
  int? countControllerValue1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  DateTime? datePicked2;
  // State field(s) for CountController widget.
  int? countControllerValue2;
  // State field(s) for Switch widget.
  bool? switchValue;
  DateTime? datePicked3;
  // State field(s) for CountController widget.
  int? countControllerValue3;
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

  String? get radioButtonValue => radioButtonValueController?.value;
}
