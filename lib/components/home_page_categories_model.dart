import '/backend/schema/structs/index.dart';
import '/components/categories_card_widget.dart';
import '/components/chooseacategoriestoget_started_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_categories_widget.dart' show HomePageCategoriesWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageCategoriesModel
    extends FlutterFlowModel<HomePageCategoriesWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ChooseacategoriestogetStarted component.
  late ChooseacategoriestogetStartedModel chooseacategoriestogetStartedModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    chooseacategoriestogetStartedModel =
        createModel(context, () => ChooseacategoriestogetStartedModel());
  }

  @override
  void dispose() {
    chooseacategoriestogetStartedModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
