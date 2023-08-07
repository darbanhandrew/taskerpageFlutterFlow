import '/components/bottom_sheetfor_pay_widget.dart';
import '/components/edit_icon_widget.dart';
import '/components/header_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TaskerProfileViewModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for editIcon component.
  late EditIconModel editIconModel1;
  // Model for editIcon component.
  late EditIconModel editIconModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    editIconModel1 = createModel(context, () => EditIconModel());
    editIconModel2 = createModel(context, () => EditIconModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    editIconModel1.dispose();
    editIconModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
