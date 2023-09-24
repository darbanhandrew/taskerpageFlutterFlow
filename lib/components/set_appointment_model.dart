import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SetAppointmentModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  String? selectedAddress;

  double selectedLatitude = 0.0;

  double selectedLongitude = 0.0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  DateTime? datePicked1;
  DateTime? datePicked2;
  DateTime? datePicked3;
  // Stores action output result for [Backend Call - API (create appointment)] action in Container widget.
  ApiCallResponse? createdAppointment;
  // Stores action output result for [Backend Call - API (create appointment)] action in Container widget.
  ApiCallResponse? createdAppointment2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get radioButtonValue => radioButtonValueController?.value;
}
