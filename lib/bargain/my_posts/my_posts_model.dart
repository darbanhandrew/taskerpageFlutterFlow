import '/backend/api_requests/api_calls.dart';
import '/components/drawer_content_widget.dart';
import '/components/header_widget.dart';
import '/components/my_post_card_widget.dart';
import '/components/nav_bar_widget.dart';
import '/components/navigate_back_widget.dart';
import '/components/sort_task_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'my_posts_widget.dart' show MyPostsWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyPostsModel extends FlutterFlowModel<MyPostsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for NavigateBack component.
  late NavigateBackModel navigateBackModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // Model for drawerContent component.
  late DrawerContentModel drawerContentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    navigateBackModel = createModel(context, () => NavigateBackModel());
    navBarModel = createModel(context, () => NavBarModel());
    drawerContentModel = createModel(context, () => DrawerContentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    navigateBackModel.dispose();
    navBarModel.dispose();
    drawerContentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
