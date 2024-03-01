import '/backend/api_requests/api_calls.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/navigation_bar_widget.dart';
import '/components/termof_service_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'publish_task_web_widget.dart' show PublishTaskWebWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class PublishTaskWebModel extends FlutterFlowModel<PublishTaskWebWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Main_Drawer component.
  late MainDrawerModel mainDrawerModel;
  // Model for navigationBar component.
  late NavigationBarModel navigationBarModel;
  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter1;
  final googleMapsController1 = Completer<GoogleMapController>();
  // Stores action output result for [Backend Call - API (UpdateStatusPost)] action in Container widget.
  ApiCallResponse? updateStatusPost2;
  // Stores action output result for [Backend Call - API (userProfileRead)] action in Container widget.
  ApiCallResponse? userRead1;
  // Stores action output result for [Backend Call - API (create chat)] action in Container widget.
  ApiCallResponse? startChat229;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter2;
  final googleMapsController2 = Completer<GoogleMapController>();
  // Stores action output result for [Backend Call - API (UpdateStatusPost)] action in Container widget.
  ApiCallResponse? updateStatusPost;
  // Stores action output result for [Backend Call - API (userProfileRead)] action in Container widget.
  ApiCallResponse? userRead;
  // Stores action output result for [Backend Call - API (create chat)] action in Container widget.
  ApiCallResponse? startChat22;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    mainDrawerModel = createModel(context, () => MainDrawerModel());
    navigationBarModel = createModel(context, () => NavigationBarModel());
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    mainDrawerModel.dispose();
    navigationBarModel.dispose();
    headerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
