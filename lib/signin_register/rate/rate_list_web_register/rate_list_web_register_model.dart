import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/rate_card_widget.dart';
import '/components/side_bar_left_sign_up_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import 'rate_list_web_register_widget.dart' show RateListWebRegisterWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class RateListWebRegisterModel
    extends FlutterFlowModel<RateListWebRegisterWidget> {
  ///  Local state fields for this page.

  UserRateStruct? userRate;
  void updateUserRateStruct(Function(UserRateStruct) updateFn) =>
      updateFn(userRate ??= UserRateStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Get User Rate Details)] action in rate_list_web_register widget.
  ApiCallResponse? userRateDetails;
  // Model for Main_Drawer component.
  late MainDrawerModel mainDrawerModel;
  // Model for side_bar_left_sign_up component.
  late SideBarLeftSignUpModel sideBarLeftSignUpModel;
  // Model for Header component.
  late HeaderModel headerModel;
  // Models for rate_card dynamic component.
  late FlutterFlowDynamicModels<RateCardModel> rateCardModels;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    mainDrawerModel = createModel(context, () => MainDrawerModel());
    sideBarLeftSignUpModel =
        createModel(context, () => SideBarLeftSignUpModel());
    headerModel = createModel(context, () => HeaderModel());
    rateCardModels = FlutterFlowDynamicModels(() => RateCardModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    mainDrawerModel.dispose();
    sideBarLeftSignUpModel.dispose();
    headerModel.dispose();
    rateCardModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
