import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/button_next_widget.dart';
import '/components/drawer_content_widget.dart';
import '/components/header_widget.dart';
import '/components/requard_star_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'sign_up_information_model.dart';
export 'sign_up_information_model.dart';

class SignUpInformationWidget extends StatefulWidget {
  const SignUpInformationWidget({Key? key}) : super(key: key);

  @override
  _SignUpInformationWidgetState createState() =>
      _SignUpInformationWidgetState();
}

class _SignUpInformationWidgetState extends State<SignUpInformationWidget> {
  late SignUpInformationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignUpInformationModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {});

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.textController1 ??= TextEditingController();
    _model.textController2 ??= TextEditingController();
    _model.textController3 ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        drawer: Container(
          width: MediaQuery.sizeOf(context).width * 0.85,
          child: Drawer(
            elevation: 16.0,
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: Color(0xFFE8EAFF),
              ),
              child: wrapWithModel(
                model: _model.drawerContentModel,
                updateCallback: () => setState(() {}),
                child: DrawerContentWidget(),
              ),
            ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          wrapWithModel(
                            model: _model.headerModel,
                            updateCallback: () => setState(() {}),
                            child: HeaderWidget(
                              openDrawer: () async {
                                scaffoldKey.currentState!.openDrawer();
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Let us know more about you!',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 30.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  3.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Account type',
                                textAlign: TextAlign.justify,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Color(0xFF292929),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            wrapWithModel(
                              model: _model.requardStarModel1,
                              updateCallback: () => setState(() {}),
                              child: RequardStarWidget(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 10.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  FFAppState().updateUserInformationStruct(
                                    (e) => e..accounttype = 'private',
                                  );
                                });
                              },
                              child: Container(
                                width: 155.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FFAppState()
                                              .UserInformation
                                              .accounttype ==
                                          'private'
                                      ? Color(0xFF5450E2)
                                      : Color(0x00000000),
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color: FFAppState()
                                                .UserInformation
                                                .accounttype ==
                                            'private'
                                        ? Color(0xFF5450E2)
                                        : Color(0xFF5E5D5D),
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 15.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Private',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: FFAppState()
                                                          .UserInformation
                                                          .accounttype ==
                                                      'private'
                                                  ? Color(0xFFF6F6F6)
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  FFAppState().updateUserInformationStruct(
                                    (e) => e..accounttype = 'company',
                                  );
                                });
                              },
                              child: Container(
                                width: 155.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FFAppState()
                                              .UserInformation
                                              .accounttype ==
                                          'company'
                                      ? Color(0xFF5450E2)
                                      : Color(0x00000000),
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color: FFAppState()
                                                .UserInformation
                                                .accounttype ==
                                            'company'
                                        ? Color(0xFF5450E2)
                                        : Color(0xFF5E5D5D),
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 15.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Company',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: FFAppState()
                                                          .UserInformation
                                                          .accounttype ==
                                                      'company'
                                                  ? Color(0xFFF6F6F6)
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 35.0,
                        thickness: 1.0,
                        indent: 32.0,
                        endIndent: 32.0,
                        color: Color(0xFFE3E3E3),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 0.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  3.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Title',
                                textAlign: TextAlign.justify,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Color(0xFF292929),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            wrapWithModel(
                              model: _model.requardStarModel2,
                              updateCallback: () => setState(() {}),
                              child: RequardStarWidget(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 10.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  FFAppState().updateUserInformationStruct(
                                    (e) => e..title = 'MRS',
                                  );
                                });
                              },
                              child: Container(
                                width: 155.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FFAppState().UserInformation.title ==
                                          'MRS'
                                      ? Color(0xFF5450E2)
                                      : Color(0x00000000),
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color: FFAppState().UserInformation.title ==
                                            'MRS'
                                        ? Color(0xFF5450E2)
                                        : Color(0xFF5E5D5D),
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 15.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Mrs',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: FFAppState()
                                                          .UserInformation
                                                          .title ==
                                                      'MRS'
                                                  ? Color(0xFFF6F6F6)
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  FFAppState().updateUserInformationStruct(
                                    (e) => e..title = 'MR',
                                  );
                                });
                              },
                              child: Container(
                                width: 155.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color:
                                      FFAppState().UserInformation.title == 'MR'
                                          ? Color(0xFF5450E2)
                                          : Color(0x00000000),
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color: FFAppState().UserInformation.title ==
                                            'MR'
                                        ? Color(0xFF5450E2)
                                        : Color(0xFF5E5D5D),
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 15.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Mr.',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: FFAppState()
                                                          .UserInformation
                                                          .title ==
                                                      'MR'
                                                  ? Color(0xFFF6F6F6)
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 10.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  FFAppState().updateUserInformationStruct(
                                    (e) => e..title = 'MX',
                                  );
                                });
                              },
                              child: Container(
                                width: 155.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color:
                                      FFAppState().UserInformation.title == 'MX'
                                          ? Color(0xFF5450E2)
                                          : Color(0x00000000),
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color: FFAppState().UserInformation.title ==
                                            'MX'
                                        ? Color(0xFF5450E2)
                                        : Color(0xFF5E5D5D),
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 15.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Mx.',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: FFAppState()
                                                          .UserInformation
                                                          .title ==
                                                      'MX'
                                                  ? Color(0xFFF6F6F6)
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 35.0,
                        thickness: 1.0,
                        indent: 32.0,
                        endIndent: 32.0,
                        color: Color(0xFFE3E3E3),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 0.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  3.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'First Name',
                                textAlign: TextAlign.justify,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Color(0xFF292929),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                            wrapWithModel(
                              model: _model.requardStarModel3,
                              updateCallback: () => setState(() {}),
                              child: RequardStarWidget(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 8.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                height: 41.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color: Color(0xFF5E5D5D),
                                  ),
                                ),
                                child: TextFormField(
                                  controller: _model.textController1,
                                  onFieldSubmitted: (_) async {
                                    setState(() {
                                      FFAppState().updateUserInformationStruct(
                                        (e) => e
                                          ..firstname =
                                              _model.textController1.text,
                                      );
                                    });
                                  },
                                  textInputAction: TextInputAction.next,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    hintText: 'Kevin',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Lato',
                                          color: Color(0xFFACABAB),
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x005E5D5D),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x0017147B),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFE8083F),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFE8083F),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: Color(0xFF212121),
                                        fontSize: 14.0,
                                      ),
                                  minLines: 1,
                                  validator: _model.textController1Validator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 16.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  3.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Last Name',
                                textAlign: TextAlign.justify,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Color(0xFF292929),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                            wrapWithModel(
                              model: _model.requardStarModel4,
                              updateCallback: () => setState(() {}),
                              child: RequardStarWidget(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 8.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                height: 41.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color: Color(0xFF5E5D5D),
                                  ),
                                ),
                                child: TextFormField(
                                  controller: _model.textController2,
                                  onFieldSubmitted: (_) async {
                                    setState(() {
                                      FFAppState().updateUserInformationStruct(
                                        (e) => e
                                          ..lastname =
                                              _model.textController2.text,
                                      );
                                    });
                                  },
                                  textInputAction: TextInputAction.next,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    hintText: 'smith',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Lato',
                                          color: Color(0xFFACABAB),
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x005E5D5D),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x0017147B),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFE8083F),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFE8083F),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: Color(0xFF212121),
                                        fontSize: 14.0,
                                      ),
                                  minLines: 1,
                                  validator: _model.textController2Validator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 16.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      3.0, 0.0, 0.0, 8.0),
                                  child: Text(
                                    'Country code',
                                    textAlign: TextAlign.justify,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lato',
                                          color: Color(0xFF292929),
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                FlutterFlowDropDown<String>(
                                  controller: _model.dropDownValueController ??=
                                      FormFieldController<String>(null),
                                  options: ['+98', '+49', '+91'],
                                  onChanged: (val) async {
                                    setState(() => _model.dropDownValue = val);
                                    setState(() {
                                      FFAppState().updateUserInformationStruct(
                                        (e) => e
                                          ..countrycode = _model.dropDownValue,
                                      );
                                    });
                                  },
                                  width: 125.0,
                                  height: 41.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: Color(0xFF212121),
                                        fontSize: 14.0,
                                      ),
                                  hintText: 'Choose Code',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: Color(0xFF3D3D3D),
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor: Color(0xFF5E5D5D),
                                  borderWidth: 1.0,
                                  borderRadius: 5.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 4.0, 5.0, 4.0),
                                  hidesUnderline: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ],
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  3.0, 0.0, 0.0, 7.0),
                                          child: Text(
                                            'Mobile Number',
                                            textAlign: TextAlign.justify,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lato',
                                                  color: Color(0xFF292929),
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              '*',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color:
                                                            Color(0xFFDD2525),
                                                        fontSize: 20.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: Container(
                                        height: 41.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            color: Color(0xFF3D3D3D),
                                          ),
                                        ),
                                        child: TextFormField(
                                          controller: _model.textController3,
                                          onFieldSubmitted: (_) async {
                                            setState(() {
                                              FFAppState()
                                                  .updateUserInformationStruct(
                                                (e) => e
                                                  ..mobilenumber = _model
                                                      .textController3.text,
                                              );
                                            });
                                          },
                                          textInputAction: TextInputAction.next,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            hintText: '30 327696376',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Lato',
                                                      color: Color(0xFFACABAB),
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x003D3D3D),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x0017147B),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFE8083F),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFE8083F),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lato',
                                                color: Color(0xFF212121),
                                                fontSize: 14.0,
                                              ),
                                          minLines: 1,
                                          keyboardType: TextInputType.phone,
                                          validator: _model
                                              .textController3Validator
                                              .asValidator(context),
                                          inputFormatters: [
                                            _model.textFieldMask3
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 16.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  3.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Date of Birth',
                                textAlign: TextAlign.justify,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Color(0xFF292929),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                            wrapWithModel(
                              model: _model.requardStarModel5,
                              updateCallback: () => setState(() {}),
                              child: RequardStarWidget(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 8.0, 32.0, 40.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  final _datePickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: getCurrentTimestamp,
                                    firstDate: DateTime(1900),
                                    lastDate: getCurrentTimestamp,
                                  );

                                  if (_datePickedDate != null) {
                                    safeSetState(() {
                                      _model.datePicked = DateTime(
                                        _datePickedDate.year,
                                        _datePickedDate.month,
                                        _datePickedDate.day,
                                      );
                                    });
                                  }
                                },
                                child: Container(
                                  width: 100.0,
                                  height: 41.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(
                                      color: Color(0xFF5E5D5D),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.cake,
                                          color: Color(0xFF5E5D5D),
                                          size: 18.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              dateTimeFormat(
                                                  'd/M/y', _model.datePicked),
                                              'Set your birth day',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lato',
                                                  color: Color(0xFF212121),
                                                  fontSize: 14.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (!(isWeb
                  ? MediaQuery.viewInsetsOf(context).bottom > 0
                  : _isKeyboardVisible))
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.0,
                            color: Color(0x33000000),
                            offset: Offset(5.0, 5.0),
                            spreadRadius: 10.0,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 0.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                var _shouldSetState = false;
                                if ((_model.textController1.text != null &&
                                        _model.textController1.text != '') &&
                                    (_model.textController2.text != null &&
                                        _model.textController2.text != '') &&
                                    (_model.dropDownValue != null &&
                                        _model.dropDownValue != '') &&
                                    (_model.datePicked != null)) {
                                  setState(() {
                                    FFAppState().updateUserInformationStruct(
                                      (e) => e
                                        ..mobilenumber =
                                            functions.extractNumber(
                                                _model.textController3.text),
                                    );
                                  });
                                  _model.userProfileBasicInfoResult =
                                      await TaskerpageBackendGroup
                                          .userProfileBasicInfoCall
                                          .call(
                                    accountType: FFAppState()
                                        .UserInformation
                                        .accounttype,
                                    firstName: _model.textController1.text,
                                    lastName: _model.textController2.text,
                                    phoneNumber:
                                        '${_model.dropDownValue}-${functions.extractNumber(_model.textController3.text)}',
                                    dateOfBirth: dateTimeFormat(
                                        'y-MM-dd', _model.datePicked),
                                    id: getJsonField(
                                      FFAppState().userProfile,
                                      r'''$.data.name''',
                                    ).toString(),
                                    title: FFAppState().UserInformation.title,
                                    apiGlobalKey: FFAppState().apiKey,
                                  );
                                  _shouldSetState = true;
                                  if ((_model.userProfileBasicInfoResult
                                              ?.succeeded ??
                                          true) ==
                                      true) {
                                    context.pushNamed(
                                      'Sign-up-Verification-Request',
                                      queryParameters: {
                                        'phoneNumber': serializeParam(
                                          FFAppState()
                                              .UserInformation
                                              .mobilenumber,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  } else {
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }

                                  if (_shouldSetState) setState(() {});
                                  return;
                                } else {
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }

                                if (_shouldSetState) setState(() {});
                              },
                              child: wrapWithModel(
                                model: _model.buttonNextModel,
                                updateCallback: () => setState(() {}),
                                child: ButtonNextWidget(
                                  text: 'Next',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
