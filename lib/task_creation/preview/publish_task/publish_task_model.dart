import '/backend/api_requests/api_calls.dart';
import '/components/ad_card_widget.dart';
import '/components/filter_web_widget.dart';
import '/components/header_web_search_filter_widget.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/navigation_bar_widget.dart';
import '/components/task_card_widget.dart';
import '/components/taskcreation_menue_widget.dart';
import '/components/termof_service_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'publish_task_widget.dart' show PublishTaskWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class PublishTaskModel extends FlutterFlowModel<PublishTaskWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Main_Drawer component.
  late MainDrawerModel mainDrawerModel;
  // Model for navigationBar component.
  late NavigationBarModel navigationBarModel;
  // Model for Header_web_search_filter component.
  late HeaderWebSearchFilterModel headerWebSearchFilterModel;
  // Model for filter_web component.
  late FilterWebModel filterWebModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for Ad_Card component.
  late AdCardModel adCardModel;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter1;
  final googleMapsController1 = Completer<GoogleMapController>();
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for taskcreationMenue component.
  late TaskcreationMenueModel taskcreationMenueModel;
  // Stores action output result for [Backend Call - API (UpdateStatusPost)] action in Container widget.
  ApiCallResponse? updateStatusPost;
  // Stores action output result for [Backend Call - API (userProfileRead)] action in Container widget.
  ApiCallResponse? userRead;
  // Stores action output result for [Backend Call - API (create chat)] action in Container widget.
  ApiCallResponse? startChat22;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter2;
  final googleMapsController2 = Completer<GoogleMapController>();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter3;
  final googleMapsController3 = Completer<GoogleMapController>();
  // Stores action output result for [Backend Call - API (UpdateStatusPost)] action in Container widget.
  ApiCallResponse? updateStatusPost2;
  // Stores action output result for [Backend Call - API (userProfileRead)] action in Container widget.
  ApiCallResponse? userRead1;
  // Stores action output result for [Backend Call - API (create chat)] action in Container widget.
  ApiCallResponse? startChat229;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    mainDrawerModel = createModel(context, () => MainDrawerModel());
    navigationBarModel = createModel(context, () => NavigationBarModel());
    headerWebSearchFilterModel =
        createModel(context, () => HeaderWebSearchFilterModel());
    filterWebModel = createModel(context, () => FilterWebModel());
    adCardModel = createModel(context, () => AdCardModel());
    headerModel = createModel(context, () => HeaderModel());
    taskcreationMenueModel =
        createModel(context, () => TaskcreationMenueModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    mainDrawerModel.dispose();
    navigationBarModel.dispose();
    headerWebSearchFilterModel.dispose();
    filterWebModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    adCardModel.dispose();
    headerModel.dispose();
    taskcreationMenueModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
