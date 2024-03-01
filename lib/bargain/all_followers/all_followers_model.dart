import '/backend/api_requests/api_calls.dart';
import '/components/header_web_widget.dart';
import '/components/nav_bar_widget.dart';
import '/components/side_bar_left_network_widget.dart';
import '/components/side_bar_right_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'all_followers_widget.dart' show AllFollowersWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AllFollowersModel extends FlutterFlowModel<AllFollowersWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Header_web component.
  late HeaderWebModel headerWebModel;
  // Model for sideBar_left_Network component.
  late SideBarLeftNetworkModel sideBarLeftNetworkModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // Model for sideBar_Right component.
  late SideBarRightModel sideBarRightModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    headerWebModel = createModel(context, () => HeaderWebModel());
    sideBarLeftNetworkModel =
        createModel(context, () => SideBarLeftNetworkModel());
    navBarModel = createModel(context, () => NavBarModel());
    sideBarRightModel = createModel(context, () => SideBarRightModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headerWebModel.dispose();
    sideBarLeftNetworkModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    navBarModel.dispose();
    sideBarRightModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
