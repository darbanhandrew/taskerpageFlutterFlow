import '/backend/api_requests/api_calls.dart';
import '/components/edit_icon_widget.dart';
import '/components/edit_name_family_widget.dart';
import '/components/emty_container_widget.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/nav_bar_widget.dart';
import '/components/visibility_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'poster_profile_widget.dart' show PosterProfileWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PosterProfileModel extends FlutterFlowModel<PosterProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
  // Model for NavBar component.
  late NavBarModel navBarModel;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (upload)] action in Container widget.
  ApiCallResponse? apiResultekx9Copy779;
  // Stores action output result for [Backend Call - API (update banner)] action in Container widget.
  ApiCallResponse? apiResult59uCopy290;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (upload)] action in Container widget.
  ApiCallResponse? apiResultekx9Copy77Copy0;
  // Stores action output result for [Backend Call - API (update banner)] action in Container widget.
  ApiCallResponse? apiResult59uCopy29Copy7;
  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (upload)] action in Container widget.
  ApiCallResponse? apiResultekx902;
  // Stores action output result for [Backend Call - API (update profile)] action in Container widget.
  ApiCallResponse? apiResult59u95;
  // Stores action output result for [Backend Call - API (userProfileMe)] action in Container widget.
  ApiCallResponse? profile;
  bool isDataUploading4 = false;
  FFUploadedFile uploadedLocalFile4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (upload)] action in Container widget.
  ApiCallResponse? test;
  // Stores action output result for [Backend Call - API (update profile)] action in Container widget.
  ApiCallResponse? apiResult59uCopy05;
  // Stores action output result for [Backend Call - API (userProfileMe)] action in Container widget.
  ApiCallResponse? profile2;
  // Model for Main_Drawer component.
  late MainDrawerModel mainDrawerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    editIconModel1 = createModel(context, () => EditIconModel());
    editIconModel2 = createModel(context, () => EditIconModel());
    editIconModel3 = createModel(context, () => EditIconModel());
    editIconModel4 = createModel(context, () => EditIconModel());
    navBarModel = createModel(context, () => NavBarModel());
    mainDrawerModel = createModel(context, () => MainDrawerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    editIconModel1.dispose();
    editIconModel2.dispose();
    editIconModel3.dispose();
    editIconModel4.dispose();
    navBarModel.dispose();
    mainDrawerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
