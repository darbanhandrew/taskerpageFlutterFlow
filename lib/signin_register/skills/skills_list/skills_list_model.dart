import '/backend/api_requests/api_calls.dart';
import '/components/ad_card_web_widget.dart';
import '/components/badges_header_widget.dart';
import '/components/button_next_widget.dart';
import '/components/header_web_widget.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/nav_bar_widget.dart';
import '/components/side_bar_left_profile_widget.dart';
import '/components/side_bar_right_widget.dart';
import '/components/skill_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import 'dart:async';
import 'skills_list_widget.dart' show SkillsListWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SkillsListModel extends FlutterFlowModel<SkillsListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Main_Drawer component.
  late MainDrawerModel mainDrawerModel;
  // Model for Header_web component.
  late HeaderWebModel headerWebModel;
  // Model for sideBar_left_profile component.
  late SideBarLeftProfileModel sideBarLeftProfileModel;
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for Badges_header component.
  late BadgesHeaderModel badgesHeaderModel;
  // Models for skillCard dynamic component.
  late FlutterFlowDynamicModels<SkillCardModel> skillCardModels;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Model for ad_card_web component.
  late AdCardWebModel adCardWebModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // Model for button_Next component.
  late ButtonNextModel buttonNextModel;
  // Model for sideBar_Right component.
  late SideBarRightModel sideBarRightModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    mainDrawerModel = createModel(context, () => MainDrawerModel());
    headerWebModel = createModel(context, () => HeaderWebModel());
    sideBarLeftProfileModel =
        createModel(context, () => SideBarLeftProfileModel());
    headerModel = createModel(context, () => HeaderModel());
    badgesHeaderModel = createModel(context, () => BadgesHeaderModel());
    skillCardModels = FlutterFlowDynamicModels(() => SkillCardModel());
    adCardWebModel = createModel(context, () => AdCardWebModel());
    navBarModel = createModel(context, () => NavBarModel());
    buttonNextModel = createModel(context, () => ButtonNextModel());
    sideBarRightModel = createModel(context, () => SideBarRightModel());
  }

  void dispose() {
    unfocusNode.dispose();
    mainDrawerModel.dispose();
    headerWebModel.dispose();
    sideBarLeftProfileModel.dispose();
    headerModel.dispose();
    badgesHeaderModel.dispose();
    skillCardModels.dispose();
    adCardWebModel.dispose();
    navBarModel.dispose();
    buttonNextModel.dispose();
    sideBarRightModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
