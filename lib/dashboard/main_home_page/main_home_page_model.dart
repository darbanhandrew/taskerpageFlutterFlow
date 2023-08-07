import '/components/bottom_sheetfor_pay_widget.dart';
import '/components/header_widget.dart';
import '/components/home_page_footer_widget.dart';
import '/components/mini_task_card_widget.dart';
import '/components/mini_tasker_card_widget.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainHomePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for MiniTaskerCard component.
  late MiniTaskerCardModel miniTaskerCardModel;
  // Model for MiniTaskCard component.
  late MiniTaskCardModel miniTaskCardModel;
  // Model for homePageFooter component.
  late HomePageFooterModel homePageFooterModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    miniTaskerCardModel = createModel(context, () => MiniTaskerCardModel());
    miniTaskCardModel = createModel(context, () => MiniTaskCardModel());
    homePageFooterModel = createModel(context, () => HomePageFooterModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    miniTaskerCardModel.dispose();
    miniTaskCardModel.dispose();
    homePageFooterModel.dispose();
    navBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
