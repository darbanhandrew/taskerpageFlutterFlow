import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/header_widget.dart';
import '/components/navigation_bar_widget.dart';
import '/components/rate_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'rates_list_widget.dart' show RatesListWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RatesListModel extends FlutterFlowModel<RatesListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (postRead)] action in Rates_list widget.
  ApiCallResponse? apiResultsr988;
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for rate_card component.
  late RateCardModel rateCardModel;
  // Model for navigationBar component.
  late NavigationBarModel navigationBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    rateCardModel = createModel(context, () => RateCardModel());
    navigationBarModel = createModel(context, () => NavigationBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    rateCardModel.dispose();
    navigationBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
