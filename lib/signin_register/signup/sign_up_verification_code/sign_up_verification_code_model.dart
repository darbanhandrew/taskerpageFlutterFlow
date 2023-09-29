import '/backend/api_requests/api_calls.dart';
import '/components/drawer_content_widget.dart';
import '/components/header_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'sign_up_verification_code_widget.dart'
    show SignUpVerificationCodeWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUpVerificationCodeModel
    extends FlutterFlowModel<SignUpVerificationCodeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Stores action output result for [Backend Call - API (check email verification)] action in Container widget.
  ApiCallResponse? apiResult3lo8;
  // Model for drawerContent component.
  late DrawerContentModel drawerContentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    pinCodeController = TextEditingController();
    drawerContentModel = createModel(context, () => DrawerContentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    pinCodeController?.dispose();
    drawerContentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
