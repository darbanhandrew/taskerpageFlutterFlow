import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/button_next_widget.dart';
import '/components/header_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignUpInformationModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResult1in =
          await TaskerpageBackendGroup.userProfileBasicInfoCall.call();
      if ((_model.apiResult1in?.succeeded ?? true)) {
        return;
      }

      return;
    });

    _model.textController1 ??= TextEditingController();
    _model.textController2 ??= TextEditingController();
    _model.textController3 ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
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
                            openDrawer: () async {},
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 30.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
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
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 10.0, 32.0, 0.0),
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
                                  (e) => e..accounttype = 'Private',
                                );
                              });
                            },
                            child: Container(
                              width: 155.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color:
                                    FFAppState().UserInformation.accounttype ==
                                            'Private'
                                        ? Color(0xFF5450E2)
                                        : Color(0x00000000),
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                  color: FFAppState()
                                              .UserInformation
                                              .accounttype ==
                                          'Private'
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
                                                    'Private'
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
                                  (e) => e..accounttype = 'Company',
                                );
                              });
                            },
                            child: Container(
                              width: 155.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color:
                                    FFAppState().UserInformation.accounttype ==
                                            'Company'
                                        ? Color(0xFF5450E2)
                                        : Color(0x00000000),
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                  color: FFAppState()
                                              .UserInformation
                                              .accounttype ==
                                          'Company'
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
                                                    'Company'
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
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
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 10.0, 32.0, 0.0),
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
                                  (e) => e..title = 'Mrs',
                                );
                              });
                            },
                            child: Container(
                              width: 155.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color:
                                    FFAppState().UserInformation.title == 'Mrs'
                                        ? Color(0xFF5450E2)
                                        : Color(0x00000000),
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                  color: FFAppState().UserInformation.title ==
                                          'Mrs'
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
                                                    'Mrs'
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
                                  (e) => e..title = 'Mr.',
                                );
                              });
                            },
                            child: Container(
                              width: 155.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color:
                                    FFAppState().UserInformation.title == 'Mr.'
                                        ? Color(0xFF5450E2)
                                        : Color(0x00000000),
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                  color: FFAppState().UserInformation.title ==
                                          'Mr.'
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
                                                    'Mr.'
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 10.0, 32.0, 0.0),
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
                                  (e) => e..title = 'Mx.',
                                );
                              });
                            },
                            child: Container(
                              width: 155.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color:
                                    FFAppState().UserInformation.title == 'Mx.'
                                        ? Color(0xFF5450E2)
                                        : Color(0x00000000),
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                  color: FFAppState().UserInformation.title ==
                                          'Mx.'
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
                                                    'Mx.'
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
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
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 8.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _model.textController1,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.textController1',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              onFieldSubmitted: (_) async {
                                setState(() {
                                  FFAppState().updateUserInformationStruct(
                                    (e) => e
                                      ..firstname = _model.textController1.text,
                                  );
                                });
                              },
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                hintText: 'Kevin',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Color(0xFFACABAB),
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF5E5D5D),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
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
                                suffixIcon:
                                    _model.textController1!.text.isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              _model.textController1?.clear();
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              size: 15.0,
                                            ),
                                          )
                                        : null,
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
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 16.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
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
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 8.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _model.textController2,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.textController2',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              onFieldSubmitted: (_) async {
                                setState(() {
                                  FFAppState().updateUserInformationStruct(
                                    (e) => e
                                      ..lastname = _model.textController2.text,
                                  );
                                });
                              },
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                hintText: 'smith',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Color(0xFFACABAB),
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF5E5D5D),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
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
                                suffixIcon:
                                    _model.textController2!.text.isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              _model.textController2?.clear();
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              size: 15.0,
                                            ),
                                          )
                                        : null,
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
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 16.0, 32.0, 0.0),
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
                                controller: _model.dropDownValueController1 ??=
                                    FormFieldController<String>(null),
                                options: ['+ 98', '+ 90', '+ 45'],
                                onChanged: (val) async {
                                  setState(() => _model.dropDownValue1 = val);
                                  setState(() {
                                    FFAppState().updateUserInformationStruct(
                                      (e) => e
                                        ..countrycode = _model.dropDownValue1,
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
                          Flexible(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        3.0, 0.0, 0.0, 8.0),
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
                                  Container(
                                    width: 200.0,
                                    child: TextFormField(
                                      controller: _model.textController3,
                                      onFieldSubmitted: (_) async {
                                        setState(() {
                                          FFAppState()
                                              .updateUserInformationStruct(
                                            (e) => e
                                              ..mobilenumber =
                                                  _model.textController3.text,
                                          );
                                        });
                                      },
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        hintText: '30 327696376',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: Color(0xFFACABAB),
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF3D3D3D),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
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
                                        focusedErrorBorder: OutlineInputBorder(
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
                                      validator: _model.textController3Validator
                                          .asValidator(context),
                                      inputFormatters: [_model.textFieldMask3],
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 16.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
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
                        ],
                      ),
                    ),
                    if (true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 8.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowDropDown<String>(
                              controller: _model.dropDownValueController2 ??=
                                  FormFieldController<String>(null),
                              options: [
                                '01',
                                '02',
                                '03',
                                '04',
                                '05',
                                '06',
                                '07',
                                '08',
                                '09',
                                '10',
                                '11',
                                '12',
                                '13',
                                '14',
                                '15',
                                '16',
                                '17',
                                '18',
                                '19',
                                '20',
                                '21',
                                '22',
                                '23',
                                '24',
                                '25',
                                '26',
                                '27',
                                '28',
                                '29',
                                '30',
                                '31'
                              ],
                              onChanged: (val) =>
                                  setState(() => _model.dropDownValue2 = val),
                              width: 58.0,
                              height: 41.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Color(0xFFACABAB),
                                    fontSize: 14.0,
                                  ),
                              hintText: '12',
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 0.0),
                              child: FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController3 ??=
                                    FormFieldController<String>(
                                  _model.dropDownValue3 ??= '',
                                ),
                                options: [
                                  '01',
                                  '02',
                                  '03',
                                  '04',
                                  '05',
                                  '06',
                                  '07',
                                  '08',
                                  '09',
                                  '10',
                                  '11',
                                  '12'
                                ],
                                optionLabels: [
                                  'January',
                                  'February',
                                  'March',
                                  'April',
                                  'May',
                                  'June',
                                  'July',
                                  'Aug',
                                  'September',
                                  'October',
                                  'November',
                                  'December'
                                ],
                                onChanged: (val) =>
                                    setState(() => _model.dropDownValue3 = val),
                                width: 70.0,
                                height: 41.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Color(0xFFACABAB),
                                      fontSize: 14.0,
                                    ),
                                hintText: 'Aug',
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
                            ),
                            FlutterFlowDropDown<String>(
                              controller: _model.dropDownValueController4 ??=
                                  FormFieldController<String>(
                                _model.dropDownValue4 ??= '1',
                              ),
                              options: ['Option 1', '1'],
                              optionLabels: ['2000', ''],
                              onChanged: (val) =>
                                  setState(() => _model.dropDownValue4 = val),
                              width: 85.0,
                              height: 41.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Color(0xFFACABAB),
                                    fontSize: 14.0,
                                  ),
                              hintText: 'Year',
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
                      ),
                    InkWell(
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
                          setState(() {
                            _model.datePicked = DateTime(
                              _datePickedDate.year,
                              _datePickedDate.month,
                              _datePickedDate.day,
                            );
                          });
                        }
                      },
                      child: Text(
                        valueOrDefault<String>(
                          _model.datePicked?.toString(),
                          'Set you Birth Date',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
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
                                  (_model.dropDownValue1 != null &&
                                      _model.dropDownValue1 != '') &&
                                  (_model.dropDownValue2 != null &&
                                      _model.dropDownValue2 != '') &&
                                  (_model.dropDownValue3 != null &&
                                      _model.dropDownValue3 != '') &&
                                  (_model.dropDownValue4 != null &&
                                      _model.dropDownValue4 != '')) {
                                setState(() {
                                  FFAppState().updateUserInformationStruct(
                                    (e) => e
                                      ..dateOfBirth =
                                          '${_model.dropDownValue2}-${_model.dropDownValue3}-${_model.dropDownValue4}',
                                  );
                                });
                                _model.userProfileBasicInfoResult =
                                    await TaskerpageBackendGroup
                                        .userProfileBasicInfoCall
                                        .call(
                                  userTitle: FFAppState().UserInformation.title,
                                  apiGlobalKey: FFAppState().apiKey,
                                  accountType:
                                      FFAppState().UserInformation.accounttype,
                                  firstName: _model.textController1.text,
                                  lastName: _model.textController2.text,
                                  phoneNumber:
                                      FFAppState().UserInformation.mobilenumber,
                                  dateOfBirth: dateTimeFormat(
                                      'y-MM-dd', _model.datePicked),
                                  id: getJsonField(
                                    FFAppState().userProfile,
                                    r'''$.id''',
                                  ).toString(),
                                );
                                _shouldSetState = true;
                                if ((_model.userProfileBasicInfoResult
                                            ?.succeeded ??
                                        true) ==
                                    true) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Done'),
                                        content: Text('Done'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Not Done'),
                                        content: Text('Not Done'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }

                                context.pushNamed(
                                  'Sign-up-Verification-Request',
                                  queryParameters: {
                                    'phoneNumber': serializeParam(
                                      FFAppState().UserInformation.mobilenumber,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
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
