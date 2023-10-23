import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/header_widget.dart';
import '/components/my_skill_widget.dart';
import '/components/navigation_bar_widget.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'rate_sign_up_widget.dart' show RateSignUpWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RateSignUpModel extends FlutterFlowModel<RateSignUpWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (postRead)] action in RateSignUp widget.
  ApiCallResponse? apiResultsr988;
  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for CountController widget.
  int? countControllerValue;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for navigationBar component.
  late NavigationBarModel navigationBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    navigationBarModel = createModel(context, () => NavigationBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    navigationBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
