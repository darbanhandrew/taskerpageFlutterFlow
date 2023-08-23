import '/backend/api_requests/api_calls.dart';
import '/components/header_widget.dart';
import '/components/skill_level_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Skills4Model extends FlutterFlowModel {
  ///  Local state fields for this page.

  dynamic serviceCategoriesJson;

  int? selectedServiceCategory;

  String? selectedSkillLevel = '';

  dynamic userServiceOptions;

  String? skillLevelName = '';

  List<dynamic> userServices = [];
  void addToUserServices(dynamic item) => userServices.add(item);
  void removeFromUserServices(dynamic item) => userServices.remove(item);
  void removeAtIndexFromUserServices(int index) => userServices.removeAt(index);
  void updateUserServicesAtIndex(int index, Function(dynamic) updateFn) =>
      userServices[index] = updateFn(userServices[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (serviceCategoryList)] action in Skills-4 widget.
  ApiCallResponse? apiResultmry;
  // Stores action output result for [Backend Call - API (userProfileMe)] action in Skills-4 widget.
  ApiCallResponse? apiResultekd;
  // Model for Header component.
  late HeaderModel headerModel;
  // Stores action output result for [Backend Call - API (createUserService)] action in Container widget.
  ApiCallResponse? createdUserService;
  // Stores action output result for [Backend Call - API (Get user services)] action in Container widget.
  ApiCallResponse? userServiceGet;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
  }

  /// Action blocks are added here.

  Future updateUserServices(BuildContext context) async {
    ApiCallResponse? apiResultekdCopy;

    apiResultekdCopy = await TaskerpageBackendGroup.userProfileMeCall.call(
      apiGlobalKey: FFAppState().apiKey,
    );
    if ((apiResultekd?.succeeded ?? true)) {
      userServices = getJsonField(
        (apiResultekd?.jsonBody ?? ''),
        r'''$.user_services''',
      )!
          .toList()
          .cast<dynamic>();
      return;
    } else {
      return;
    }
  }

  /// Additional helper methods are added here.
}
