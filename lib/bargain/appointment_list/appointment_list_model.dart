import '/backend/api_requests/api_calls.dart';
import '/components/aler_modal_massage_accept_appointment_widget.dart';
import '/components/aler_modal_massage_reject_appointment_widget.dart';
import '/components/appointment_card_widget.dart';
import '/components/header_web_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/nav_bar_widget.dart';
import '/components/side_bar_left_appointment_widget.dart';
import '/components/side_bar_right_widget.dart';
import '/components/user_rate_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'appointment_list_widget.dart' show AppointmentListWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AppointmentListModel extends FlutterFlowModel<AppointmentListWidget> {
  ///  Local state fields for this page.

  List<String> checkReview = [];
  void addToCheckReview(String item) => checkReview.add(item);
  void removeFromCheckReview(String item) => checkReview.remove(item);
  void removeAtIndexFromCheckReview(int index) => checkReview.removeAt(index);
  void insertAtIndexInCheckReview(int index, String item) =>
      checkReview.insert(index, item);
  void updateCheckReviewAtIndex(int index, Function(String) updateFn) =>
      checkReview[index] = updateFn(checkReview[index]);

  DateTime? selectDate;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Main_Drawer component.
  late MainDrawerModel mainDrawerModel;
  // Model for Header_web component.
  late HeaderWebModel headerWebModel;
  // Model for sideBar_left_Appointment component.
  late SideBarLeftAppointmentModel sideBarLeftAppointmentModel;
  DateTime? datePicked;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Backend Call - API (review read by id)] action in appointment_card widget.
  ApiCallResponse? review;
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // Model for sideBar_Right component.
  late SideBarRightModel sideBarRightModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    mainDrawerModel = createModel(context, () => MainDrawerModel());
    headerWebModel = createModel(context, () => HeaderWebModel());
    sideBarLeftAppointmentModel =
        createModel(context, () => SideBarLeftAppointmentModel());
    navBarModel = createModel(context, () => NavBarModel());
    sideBarRightModel = createModel(context, () => SideBarRightModel());
  }

  void dispose() {
    unfocusNode.dispose();
    mainDrawerModel.dispose();
    headerWebModel.dispose();
    sideBarLeftAppointmentModel.dispose();
    tabBarController?.dispose();
    navBarModel.dispose();
    sideBarRightModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
