import '/backend/api_requests/api_calls.dart';
import '/components/drawer_content_widget.dart';
import '/components/edit_icon_widget.dart';
import '/components/edit_name_family_widget.dart';
import '/components/emty_container_widget.dart';
import '/components/header_widget.dart';
import '/components/nav_bar_widget.dart';
import '/components/visibility_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TaskerProfileModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Get Customer Ad)] action in Tasker_Profile widget.
  ApiCallResponse? ad;
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for editIcon component.
  late EditIconModel editIconModel1;
  // Model for editIcon component.
  late EditIconModel editIconModel2;
  // Model for editIcon component.
  late EditIconModel editIconModel3;
  // Model for editIcon component.
  late EditIconModel editIconModel4;
  // Model for editIcon component.
  late EditIconModel editIconModel5;
  // Model for editIcon component.
  late EditIconModel editIconModel6;
  // Model for NavBar component.
  late NavBarModel navBarModel;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (upload)] action in Container widget.
  ApiCallResponse? apiResultekx9Copy77;
  // Stores action output result for [Backend Call - API (update banner)] action in Container widget.
  ApiCallResponse? apiResult59uCopy29;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (upload)] action in Container widget.
  ApiCallResponse? apiResultekx9Copy77Copy;
  // Stores action output result for [Backend Call - API (update banner)] action in Container widget.
  ApiCallResponse? apiResult59uCopy29Copy;
  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (upload)] action in Container widget.
  ApiCallResponse? apiResultekx9;
  // Stores action output result for [Backend Call - API (update profile)] action in Container widget.
  ApiCallResponse? apiResult59u;
  bool isDataUploading4 = false;
  FFUploadedFile uploadedLocalFile4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (upload)] action in Container widget.
  ApiCallResponse? apiResultekx9Copy;
  // Stores action output result for [Backend Call - API (update profile)] action in Container widget.
  ApiCallResponse? apiResult59uCopy;
  // Model for drawerContent component.
  late DrawerContentModel drawerContentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    editIconModel1 = createModel(context, () => EditIconModel());
    editIconModel2 = createModel(context, () => EditIconModel());
    editIconModel3 = createModel(context, () => EditIconModel());
    editIconModel4 = createModel(context, () => EditIconModel());
    editIconModel5 = createModel(context, () => EditIconModel());
    editIconModel6 = createModel(context, () => EditIconModel());
    navBarModel = createModel(context, () => NavBarModel());
    drawerContentModel = createModel(context, () => DrawerContentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    editIconModel1.dispose();
    editIconModel2.dispose();
    editIconModel3.dispose();
    editIconModel4.dispose();
    editIconModel5.dispose();
    editIconModel6.dispose();
    navBarModel.dispose();
    drawerContentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
