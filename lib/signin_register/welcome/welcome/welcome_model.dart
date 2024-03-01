import '/components/button_next_widget.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/side_bar_left_sign_up_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'welcome_widget.dart' show WelcomeWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class WelcomeModel extends FlutterFlowModel<WelcomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Main_Drawer component.
  late MainDrawerModel mainDrawerModel;
  // Model for side_bar_left_sign_up component.
  late SideBarLeftSignUpModel sideBarLeftSignUpModel;
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for button_Next component.
  late ButtonNextModel buttonNextModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    mainDrawerModel = createModel(context, () => MainDrawerModel());
    sideBarLeftSignUpModel =
        createModel(context, () => SideBarLeftSignUpModel());
    headerModel = createModel(context, () => HeaderModel());
    buttonNextModel = createModel(context, () => ButtonNextModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    mainDrawerModel.dispose();
    sideBarLeftSignUpModel.dispose();
    headerModel.dispose();
    buttonNextModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
