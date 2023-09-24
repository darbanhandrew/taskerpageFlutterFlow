import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/button_next_widget.dart';
import '/components/drawer_content_widget.dart';
import '/components/header_widget.dart';
import '/components/requard_star_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class SignUpInformationModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for requard_star component.
  late RequardStarModel requardStarModel1;
  // Model for requard_star component.
  late RequardStarModel requardStarModel2;
  // Model for requard_star component.
  late RequardStarModel requardStarModel3;
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Model for requard_star component.
  late RequardStarModel requardStarModel4;
  // State field(s) for TextField widget.
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  TextEditingController? textController3;
  final textFieldMask3 = MaskTextInputFormatter(mask: '(###) ###-####');
  String? Function(BuildContext, String?)? textController3Validator;
  // Model for requard_star component.
  late RequardStarModel requardStarModel5;
  DateTime? datePicked;
  // Model for button_Next component.
  late ButtonNextModel buttonNextModel;
  // Stores action output result for [Backend Call - API (userProfileBasicInfo)] action in button_Next widget.
  ApiCallResponse? userProfileBasicInfoResult;
  // Model for drawerContent component.
  late DrawerContentModel drawerContentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    requardStarModel1 = createModel(context, () => RequardStarModel());
    requardStarModel2 = createModel(context, () => RequardStarModel());
    requardStarModel3 = createModel(context, () => RequardStarModel());
    requardStarModel4 = createModel(context, () => RequardStarModel());
    requardStarModel5 = createModel(context, () => RequardStarModel());
    buttonNextModel = createModel(context, () => ButtonNextModel());
    drawerContentModel = createModel(context, () => DrawerContentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    requardStarModel1.dispose();
    requardStarModel2.dispose();
    requardStarModel3.dispose();
    textController1?.dispose();
    requardStarModel4.dispose();
    textController2?.dispose();
    textController3?.dispose();
    requardStarModel5.dispose();
    buttonNextModel.dispose();
    drawerContentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
