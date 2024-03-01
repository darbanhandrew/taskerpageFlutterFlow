import '/backend/api_requests/api_calls.dart';
import '/components/ad_card_widget.dart';
import '/components/filter_header_widget.dart';
import '/components/filter_web_widget.dart';
import '/components/header_web_search_filter_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/task_card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/search/filter/filter_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'task_list_widget.dart' show TaskListWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class TaskListModel extends FlutterFlowModel<TaskListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Main_Drawer component.
  late MainDrawerModel mainDrawerModel;
  // Model for Header_web_search_filter component.
  late HeaderWebSearchFilterModel headerWebSearchFilterModel;
  // Model for filter_web component.
  late FilterWebModel filterWebModel;
  // Model for filterHeader component.
  late FilterHeaderModel filterHeaderModel;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for Ad_Card component.
  late AdCardModel adCardModel;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter1;
  final googleMapsController1 = Completer<GoogleMapController>();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter2;
  final googleMapsController2 = Completer<GoogleMapController>();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    mainDrawerModel = createModel(context, () => MainDrawerModel());
    headerWebSearchFilterModel =
        createModel(context, () => HeaderWebSearchFilterModel());
    filterWebModel = createModel(context, () => FilterWebModel());
    filterHeaderModel = createModel(context, () => FilterHeaderModel());
    adCardModel = createModel(context, () => AdCardModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    mainDrawerModel.dispose();
    headerWebSearchFilterModel.dispose();
    filterWebModel.dispose();
    filterHeaderModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    adCardModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
