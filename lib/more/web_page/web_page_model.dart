import '/backend/api_requests/api_calls.dart';
import '/components/header_widget.dart';
import '/components/home_page_ads_widget.dart';
import '/components/home_page_categories_widget.dart';
import '/components/home_page_footer_widget.dart';
import '/components/home_page_how_it_works_widget.dart';
import '/components/home_page_plans_widget.dart';
import '/components/home_page_slider_widget.dart';
import '/components/home_page_task_sugestions_widget.dart';
import '/components/home_page_tasker_sugestion_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'web_page_widget.dart' show WebPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WebPageModel extends FlutterFlowModel<WebPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Header component.
  late HeaderModel headerModel;
  // Models for home_page_slider dynamic component.
  late FlutterFlowDynamicModels<HomePageSliderModel> homePageSliderModels;
  // Models for home_page_tasker_sugestion dynamic component.
  late FlutterFlowDynamicModels<HomePageTaskerSugestionModel>
      homePageTaskerSugestionModels;
  // Models for homePageFooter dynamic component.
  late FlutterFlowDynamicModels<HomePageFooterModel> homePageFooterModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    homePageSliderModels =
        FlutterFlowDynamicModels(() => HomePageSliderModel());
    homePageTaskerSugestionModels =
        FlutterFlowDynamicModels(() => HomePageTaskerSugestionModel());
    homePageFooterModels =
        FlutterFlowDynamicModels(() => HomePageFooterModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    homePageSliderModels.dispose();
    homePageTaskerSugestionModels.dispose();
    homePageFooterModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
