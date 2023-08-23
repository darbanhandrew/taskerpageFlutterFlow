import '/backend/api_requests/api_calls.dart';
import '/components/edit_number_widget.dart';
import '/components/header_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpVerificationRequestModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (sendVerifacation)] action in Sign-up-Verification-Request widget.
  ApiCallResponse? apiResult5wf;
  // Model for Header component.
  late HeaderModel headerModel;
  // Stores action output result for [Backend Call - API (sendVerifacation)] action in Text widget.
  ApiCallResponse? sendVerification;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Stores action output result for [Backend Call - API (checkVerfication)] action in Container widget.
  ApiCallResponse? apiResult3lo;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    pinCodeController = TextEditingController();
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    pinCodeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
