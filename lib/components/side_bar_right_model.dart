import '/components/ad_card_for_web_side_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'side_bar_right_widget.dart' show SideBarRightWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SideBarRightModel extends FlutterFlowModel<SideBarRightWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ad_card_for_web_sideBar component.
  late AdCardForWebSideBarModel adCardForWebSideBarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    adCardForWebSideBarModel =
        createModel(context, () => AdCardForWebSideBarModel());
  }

  @override
  void dispose() {
    adCardForWebSideBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
