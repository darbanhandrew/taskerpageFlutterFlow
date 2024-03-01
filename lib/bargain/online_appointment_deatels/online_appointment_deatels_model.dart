import '/backend/api_requests/api_calls.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'online_appointment_deatels_widget.dart'
    show OnlineAppointmentDeatelsWidget;
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class OnlineAppointmentDeatelsModel
    extends FlutterFlowModel<OnlineAppointmentDeatelsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Header component.
  late HeaderModel headerModel;
  InstantTimer? instantTimer;
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // Model for Main_Drawer component.
  late MainDrawerModel mainDrawerModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    navBarModel = createModel(context, () => NavBarModel());
    mainDrawerModel = createModel(context, () => MainDrawerModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    instantTimer?.cancel();
    navBarModel.dispose();
    mainDrawerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
