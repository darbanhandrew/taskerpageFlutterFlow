import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import 'id4_widget.dart' show Id4Widget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Id4Model extends FlutterFlowModel<Id4Widget> {
  ///  Local state fields for this page.

  String? documentType;

  IdentificationStruct? identification;
  void updateIdentificationStruct(Function(IdentificationStruct) updateFn) =>
      updateFn(identification ??= IdentificationStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Get Identification Details)] action in ID4 widget.
  ApiCallResponse? getIdentificationDetails;
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for Main_Drawer component.
  late MainDrawerModel mainDrawerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    mainDrawerModel = createModel(context, () => MainDrawerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    mainDrawerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
