import '/backend/api_requests/api_calls.dart';
import '/components/edit_icon_widget.dart';
import '/components/edit_name_family_widget.dart';
import '/components/header_widget.dart';
import '/components/visibility_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PosterProfileModel extends FlutterFlowModel {
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
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading4 = false;
  FFUploadedFile uploadedLocalFile4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    editIconModel1 = createModel(context, () => EditIconModel());
    editIconModel2 = createModel(context, () => EditIconModel());
    editIconModel3 = createModel(context, () => EditIconModel());
    editIconModel4 = createModel(context, () => EditIconModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    editIconModel1.dispose();
    editIconModel2.dispose();
    editIconModel3.dispose();
    editIconModel4.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
