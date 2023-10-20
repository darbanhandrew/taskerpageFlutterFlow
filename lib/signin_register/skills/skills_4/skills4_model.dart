import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/drawer_content_widget.dart';
import '/components/emty_container_widget.dart';
import '/components/header_widget.dart';
import '/components/skill_level_sheet_widget.dart';
import '/components/skill_options_check_component_widget.dart';
import '/components/skill_options_chips_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'skills4_widget.dart' show Skills4Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
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

  List<UserServiceStruct> customerProfileSkills = [];
  void addToCustomerProfileSkills(UserServiceStruct item) =>
      customerProfileSkills.add(item);
  void removeFromCustomerProfileSkills(UserServiceStruct item) =>
      customerProfileSkills.remove(item);
  void removeAtIndexFromCustomerProfileSkills(int index) =>
      customerProfileSkills.removeAt(index);
  void insertAtIndexInCustomerProfileSkills(
          int index, UserServiceStruct item) =>
      customerProfileSkills.insert(index, item);
  void updateCustomerProfileSkillsAtIndex(
          int index, Function(UserServiceStruct) updateFn) =>
      customerProfileSkills[index] = updateFn(customerProfileSkills[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (userProfileMe)] action in Skills-4 widget.
  ApiCallResponse? userProfile;
  // Model for drawerContent component.
  late DrawerContentModel drawerContentModel;
  // Model for Header component.
  late HeaderModel headerModel;
  // Stores action output result for [Backend Call - API (createUserService)] action in Container widget.
  ApiCallResponse? createdUserService;
  // Stores action output result for [Backend Call - API (Get user services)] action in Container widget.
  ApiCallResponse? userServiceGet;
  // Models for skillOptionsCheckComponent dynamic component.
  late FlutterFlowDynamicModels<SkillOptionsCheckComponentModel>
      skillOptionsCheckComponentModels;
  // Models for skillOptionsChipsComponent dynamic component.
  late FlutterFlowDynamicModels<SkillOptionsChipsComponentModel>
      skillOptionsChipsComponentModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    drawerContentModel = createModel(context, () => DrawerContentModel());
    headerModel = createModel(context, () => HeaderModel());
    skillOptionsCheckComponentModels =
        FlutterFlowDynamicModels(() => SkillOptionsCheckComponentModel());
    skillOptionsChipsComponentModels =
        FlutterFlowDynamicModels(() => SkillOptionsChipsComponentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    drawerContentModel.dispose();
    headerModel.dispose();
    skillOptionsCheckComponentModels.dispose();
    skillOptionsChipsComponentModels.dispose();
  }

  /// Action blocks are added here.

  Future updateUserServices(BuildContext context) async {}

  /// Additional helper methods are added here.
}
