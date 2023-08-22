import '/components/dark_light_switch_small_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DrawerContentModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for DarkLightSwitchSmall component.
  late DarkLightSwitchSmallModel darkLightSwitchSmallModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    darkLightSwitchSmallModel =
        createModel(context, () => DarkLightSwitchSmallModel());
  }

  void dispose() {
    darkLightSwitchSmallModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
