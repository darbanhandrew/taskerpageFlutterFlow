import '/components/address_card_widget.dart';
import '/components/footer3_widget.dart';
import '/components/header_widget.dart';
import '/components/navigate_back_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Contactdata2Model extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for NavigateBack component.
  late NavigateBackModel navigateBackModel;
  // Model for AddressCard component.
  late AddressCardModel addressCardModel;
  // Model for footer3 component.
  late Footer3Model footer3Model;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    navigateBackModel = createModel(context, () => NavigateBackModel());
    addressCardModel = createModel(context, () => AddressCardModel());
    footer3Model = createModel(context, () => Footer3Model());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    navigateBackModel.dispose();
    addressCardModel.dispose();
    footer3Model.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
