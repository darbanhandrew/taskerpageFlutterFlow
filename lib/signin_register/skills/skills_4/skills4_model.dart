import '/backend/api_requests/api_calls.dart';
import '/components/drawer_content_widget.dart';
import '/components/emty_container_widget.dart';
import '/components/header_widget.dart';
import '/components/skill_level_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'skills4_widget.dart' show Skills4Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Skills4Model extends FlutterFlowModel<Skills4Widget> {
  ///  Local state fields for this page.

  dynamic serviceCategoriesJson;

  String? selectedServiceCategory;

  String? selectedSkillLevel = '';

  dynamic userServiceOptions;

  String? skillLevelName = '';

  List<dynamic> userServices = [];
  void addToUserServices(dynamic item) => userServices.add(item);
  void removeFromUserServices(dynamic item) => userServices.remove(item);
  void removeAtIndexFromUserServices(int index) => userServices.removeAt(index);
  void insertAtIndexInUserServices(int index, dynamic item) =>
      userServices.insert(index, item);
  void updateUserServicesAtIndex(int index, Function(dynamic) updateFn) =>
      userServices[index] = updateFn(userServices[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Service List)] action in Skills-4 widget.
  ApiCallResponse? apiResultuqp;
  // Model for Header component.
  late HeaderModel headerModel;
  // Stores action output result for [Backend Call - API (createUserService)] action in Container widget.
  ApiCallResponse? createdUserService;
  // Stores action output result for [Backend Call - API (Get user services)] action in Container widget.
  ApiCallResponse? userServiceGet;
  // Model for drawerContent component.
  late DrawerContentModel drawerContentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    drawerContentModel = createModel(context, () => DrawerContentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    drawerContentModel.dispose();
  }

  /// Action blocks are added here.

  Future updateUserServices(BuildContext context) async {}

  /// Additional helper methods are added here.
}
