import '/components/location_filter_web_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'filter_web_widget.dart' show FilterWebWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FilterWebModel extends FlutterFlowModel<FilterWebWidget> {
  ///  Local state fields for this component.

  String taskORtasker = '';

  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;
  // Model for location_filter_web component.
  late LocationFilterWebModel locationFilterWebModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    locationFilterWebModel =
        createModel(context, () => LocationFilterWebModel());
  }

  @override
  void dispose() {
    locationFilterWebModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
