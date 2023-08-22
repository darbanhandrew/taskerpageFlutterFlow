import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/button_next_widget.dart';
import '/components/drope_down_languages_widget.dart';
import '/components/header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Task2Model extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // Model for dropeDownLanguages component.
  late DropeDownLanguagesModel dropeDownLanguagesModel;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for button_Next component.
  late ButtonNextModel buttonNextModel;
  // Stores action output result for [Backend Call - API (updatePost)] action in button_Next widget.
  ApiCallResponse? apiResultv2j;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    dropeDownLanguagesModel =
        createModel(context, () => DropeDownLanguagesModel());
    buttonNextModel = createModel(context, () => ButtonNextModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    dropeDownLanguagesModel.dispose();
    textController?.dispose();
    buttonNextModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
