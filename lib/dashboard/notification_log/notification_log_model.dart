import '/components/ad_card_web_widget.dart';
import '/components/header_web_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/nav_bar_widget.dart';
import '/components/side_bar_left_notification_widget.dart';
import '/components/side_bar_right_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'notification_log_widget.dart' show NotificationLogWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class NotificationLogModel extends FlutterFlowModel<NotificationLogWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Main_Drawer component.
  late MainDrawerModel mainDrawerModel;
  // Model for Header_web component.
  late HeaderWebModel headerWebModel;
  // Model for sideBar_left_Notification component.
  late SideBarLeftNotificationModel sideBarLeftNotificationModel;
  // Model for ad_card_web component.
  late AdCardWebModel adCardWebModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // Model for sideBar_Right component.
  late SideBarRightModel sideBarRightModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    mainDrawerModel = createModel(context, () => MainDrawerModel());
    headerWebModel = createModel(context, () => HeaderWebModel());
    sideBarLeftNotificationModel =
        createModel(context, () => SideBarLeftNotificationModel());
    adCardWebModel = createModel(context, () => AdCardWebModel());
    navBarModel = createModel(context, () => NavBarModel());
    sideBarRightModel = createModel(context, () => SideBarRightModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    mainDrawerModel.dispose();
    headerWebModel.dispose();
    sideBarLeftNotificationModel.dispose();
    adCardWebModel.dispose();
    navBarModel.dispose();
    sideBarRightModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
