import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/date_of_birth_pick_widget.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/side_bar_left_sign_up_widget.dart';
import '/components/text_field_and_title_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'id2_widget.dart' show Id2Widget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class Id2Model extends FlutterFlowModel<Id2Widget> {
  ///  Local state fields for this page.

  String? pageDocumentType;

  IdentificationStruct? identification;
  void updateIdentificationStruct(Function(IdentificationStruct) updateFn) =>
      updateFn(identification ??= IdentificationStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Get Identification Details)] action in ID2 widget.
  ApiCallResponse? identificationDetails;
  // Model for Main_Drawer component.
  late MainDrawerModel mainDrawerModel;
  // Model for side_bar_left_sign_up component.
  late SideBarLeftSignUpModel sideBarLeftSignUpModel;
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for text_field_and_title component.
  late TextFieldAndTitleModel textFieldAndTitleModel;
  // Model for date_of_birth_pick component.
  late DateOfBirthPickModel dateOfBirthPickModel;
  // Stores action output result for [Backend Call - API (Update Identification Details)] action in Container widget.
  ApiCallResponse? apiResultv1s;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (upload)] action in Container widget.
  ApiCallResponse? apiResult9pb;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (upload)] action in Container widget.
  ApiCallResponse? uploadedBox;
  // Stores action output result for [Backend Call - API (Update Identification Details)] action in Container widget.
  ApiCallResponse? updatedId2;
  // Stores action output result for [Backend Call - API (Update Identification Details)] action in Container widget.
  ApiCallResponse? apiResultv1s2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    mainDrawerModel = createModel(context, () => MainDrawerModel());
    sideBarLeftSignUpModel =
        createModel(context, () => SideBarLeftSignUpModel());
    headerModel = createModel(context, () => HeaderModel());
    textFieldAndTitleModel =
        createModel(context, () => TextFieldAndTitleModel());
    dateOfBirthPickModel = createModel(context, () => DateOfBirthPickModel());
  }

  void dispose() {
    unfocusNode.dispose();
    mainDrawerModel.dispose();
    sideBarLeftSignUpModel.dispose();
    headerModel.dispose();
    textFieldAndTitleModel.dispose();
    dateOfBirthPickModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
