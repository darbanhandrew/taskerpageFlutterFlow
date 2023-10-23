import '/components/date_of_birth_pick_widget.dart';
import '/components/drawer_content_widget.dart';
import '/components/header_widget.dart';
import '/components/text_field_and_title_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'id1_widget.dart' show Id1Widget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Id1Model extends FlutterFlowModel<Id1Widget> {
  ///  Local state fields for this page.

  String? selectedGender;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for text_field_and_title component.
  late TextFieldAndTitleModel textFieldAndTitleModel;
  // Model for date_of_birth_pick component.
  late DateOfBirthPickModel dateOfBirthPickModel;
  // Model for drawerContent component.
  late DrawerContentModel drawerContentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    textFieldAndTitleModel =
        createModel(context, () => TextFieldAndTitleModel());
    dateOfBirthPickModel = createModel(context, () => DateOfBirthPickModel());
    drawerContentModel = createModel(context, () => DrawerContentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    textFieldAndTitleModel.dispose();
    dateOfBirthPickModel.dispose();
    drawerContentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
