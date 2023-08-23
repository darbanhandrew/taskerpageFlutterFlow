import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/button_next_widget.dart';
import '/components/header_widget.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'taskertype3_model.dart';
export 'taskertype3_model.dart';

class Taskertype3Widget extends StatefulWidget {
  const Taskertype3Widget({Key? key}) : super(key: key);

  @override
  _Taskertype3WidgetState createState() => _Taskertype3WidgetState();
}

class _Taskertype3WidgetState extends State<Taskertype3Widget> {
  late Taskertype3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Taskertype3Model());

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
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.headerModel,
                      updateCallback: () => setState(() {}),
                      child: HeaderWidget(
                        openDrawer: () async {},
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 32.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Tasker type',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: Color(0xFF292929),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 35.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Max Tasker distance with my address',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Container(
                            width: 60.0,
                            height: 41.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(5.0),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: Color(0xFF5E5D5D),
                                width: 1.0,
                              ),
                            ),
                            child: FlutterFlowCountController(
                              decrementIconBuilder: (enabled) => Icon(
                                Icons.keyboard_arrow_up_rounded,
                                color: enabled
                                    ? Color(0xFFF06543)
                                    : FlutterFlowTheme.of(context).alternate,
                                size: 15.0,
                              ),
                              incrementIconBuilder: (enabled) => Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: enabled
                                    ? Color(0xFFF06543)
                                    : FlutterFlowTheme.of(context).alternate,
                                size: 15.0,
                              ),
                              countBuilder: (count) => Text(
                                count.toString(),
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Lato',
                                      fontSize: 13.0,
                                    ),
                              ),
                              count: _model.countControllerValue1 ??= 10,
                              updateCount: (count) async {
                                setState(
                                    () => _model.countControllerValue1 = count);
                                setState(() {
                                  FFAppState().updateTaskCreationStruct(
                                    (e) => e
                                      ..maxDistance =
                                          _model.countControllerValue1,
                                  );
                                });
                              },
                              stepSize: 1,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 5.0, 0.0),
                            ),
                          ),
                          Text(
                            'Km',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 32.0,
                      thickness: 1.0,
                      indent: 32.0,
                      endIndent: 32.0,
                      color: Color(0xFFDEDEDE),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'I Pay travel costs',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Switch.adaptive(
                              value: _model.switchValue1 ??= false,
                              onChanged: (newValue) async {
                                setState(() => _model.switchValue1 = newValue!);
                                if (newValue!) {
                                  setState(() {
                                    FFAppState().updateTaskCreationStruct(
                                      (e) => e..paytravelcosts = true,
                                    );
                                  });
                                } else {
                                  setState(() {
                                    FFAppState().updateTaskCreationStruct(
                                      (e) => e..paytravelcosts = false,
                                    );
                                  });
                                }
                              },
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor: Color(0xFFFAD1C6),
                              inactiveTrackColor: Color(0xFFECECEC),
                              inactiveThumbColor: Color(0xFF3D3D3D),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (_model.switchValue1 ?? true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 15.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'How much',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Container(
                                width: 60.0,
                                height: 41.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(5.0),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: Color(0xFF5E5D5D),
                                    width: 1.0,
                                  ),
                                ),
                                child: FlutterFlowCountController(
                                  decrementIconBuilder: (enabled) => Icon(
                                    Icons.keyboard_arrow_up_rounded,
                                    color: enabled
                                        ? Color(0xFFF06543)
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    size: 15.0,
                                  ),
                                  incrementIconBuilder: (enabled) => Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: enabled
                                        ? Color(0xFFF06543)
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    size: 15.0,
                                  ),
                                  countBuilder: (count) => Text(
                                    count.toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Lato',
                                          fontSize: 13.0,
                                        ),
                                  ),
                                  count: _model.countControllerValue2 ??= 2,
                                  updateCount: (count) async {
                                    setState(() =>
                                        _model.countControllerValue2 = count);
                                    setState(() {
                                      FFAppState().updateTaskCreationStruct(
                                        (e) => e
                                          ..paytravelcostsPerhour =
                                              '${_model.countControllerValue2?.toString()} ${_model.dropDownValue1}',
                                      );
                                    });
                                  },
                                  stepSize: 1,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 5.0, 0.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              child: FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController1 ??=
                                    FormFieldController<String>(
                                  _model.dropDownValue1 ??= '\$',
                                ),
                                options: ['\$'],
                                onChanged: (val) async {
                                  setState(() => _model.dropDownValue1 = val);
                                  setState(() {
                                    FFAppState().updateTaskCreationStruct(
                                      (e) => e
                                        ..paytravelcostsPerhour =
                                            '${_model.countControllerValue2?.toString()} ${_model.dropDownValue1}',
                                    );
                                  });
                                },
                                width: 42.0,
                                height: 41.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      fontSize: 14.0,
                                    ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Color(0xFF3D3D3D),
                                  size: 15.0,
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
                            Text(
                              'Per hour',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    Divider(
                      height: 32.0,
                      thickness: 1.0,
                      indent: 32.0,
                      endIndent: 32.0,
                      color: Color(0xFFDEDEDE),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cancellation Penalty Applies',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Switch.adaptive(
                              value: _model.switchValue2 ??= false,
                              onChanged: (newValue) async {
                                setState(() => _model.switchValue2 = newValue!);
                                if (newValue!) {
                                  setState(() {
                                    FFAppState().updateTaskCreationStruct(
                                      (e) =>
                                          e..cancellationPenaltyApplies = true,
                                    );
                                  });
                                } else {
                                  setState(() {
                                    FFAppState().updateTaskCreationStruct(
                                      (e) =>
                                          e..cancellationPenaltyApplies = false,
                                    );
                                  });
                                }
                              },
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor: Color(0xFFFAD1C6),
                              inactiveTrackColor: Color(0xFFECECEC),
                              inactiveThumbColor: Color(0xFF3D3D3D),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (_model.switchValue2 ?? true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 15.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'How much',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Container(
                                width: 60.0,
                                height: 41.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(5.0),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: Color(0xFF5E5D5D),
                                    width: 1.0,
                                  ),
                                ),
                                child: FlutterFlowCountController(
                                  decrementIconBuilder: (enabled) => Icon(
                                    Icons.keyboard_arrow_up_rounded,
                                    color: enabled
                                        ? Color(0xFFF06543)
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    size: 15.0,
                                  ),
                                  incrementIconBuilder: (enabled) => Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: enabled
                                        ? Color(0xFFF06543)
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    size: 15.0,
                                  ),
                                  countBuilder: (count) => Text(
                                    count.toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Lato',
                                          fontSize: 13.0,
                                        ),
                                  ),
                                  count: _model.countControllerValue3 ??= 2,
                                  updateCount: (count) async {
                                    setState(() =>
                                        _model.countControllerValue3 = count);
                                    setState(() {
                                      FFAppState().updateTaskCreationStruct(
                                        (e) => e
                                          ..cancellationPenaltyPerhour =
                                              '${_model.countControllerValue3?.toString()} ${_model.dropDownValue2}',
                                      );
                                    });
                                  },
                                  stepSize: 1,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 5.0, 0.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              child: FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController2 ??=
                                    FormFieldController<String>(
                                  _model.dropDownValue2 ??= '\$',
                                ),
                                options: ['\$'],
                                onChanged: (val) async {
                                  setState(() => _model.dropDownValue2 = val);
                                  setState(() {
                                    FFAppState().updateTaskCreationStruct(
                                      (e) => e
                                        ..cancellationPenaltyPerhour =
                                            '${_model.countControllerValue3?.toString()} ${_model.dropDownValue2}',
                                    );
                                  });
                                },
                                width: 42.0,
                                height: 41.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      fontSize: 14.0,
                                    ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Color(0xFF3D3D3D),
                                  size: 15.0,
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
                            Text(
                              'Per hour',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    if (_model.switchValue2 ?? true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 20.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'If cancelled before due date later than',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Container(
                              width: 60.0,
                              height: 41.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(5.0),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: Color(0xFF5E5D5D),
                                  width: 1.0,
                                ),
                              ),
                              child: FlutterFlowCountController(
                                decrementIconBuilder: (enabled) => Icon(
                                  Icons.keyboard_arrow_up_rounded,
                                  color: enabled
                                      ? Color(0xFFF06543)
                                      : FlutterFlowTheme.of(context).alternate,
                                  size: 15.0,
                                ),
                                incrementIconBuilder: (enabled) => Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: enabled
                                      ? Color(0xFFF06543)
                                      : FlutterFlowTheme.of(context).alternate,
                                  size: 15.0,
                                ),
                                countBuilder: (count) => Text(
                                  count.toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: 'Lato',
                                        fontSize: 13.0,
                                      ),
                                ),
                                count: _model.countControllerValue4 ??= 10,
                                updateCount: (count) async {
                                  setState(() =>
                                      _model.countControllerValue4 = count);
                                  setState(() {
                                    FFAppState().updateTaskCreationStruct(
                                      (e) => e
                                        ..ifCancelledBefore = _model
                                            .countControllerValue4
                                            ?.toString(),
                                    );
                                  });
                                },
                                stepSize: 1,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 5.0, 0.0),
                              ),
                            ),
                            Text(
                              'hrs',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 96.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: Color(0x005450E2),
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                color: Color(0xFF5450E2),
                                width: 1.0,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 5.0, 0.0),
                                  child: Icon(
                                    Icons.arrow_back_ios_rounded,
                                    color: Color(0xFF5450E2),
                                    size: 10.0,
                                  ),
                                ),
                                Text(
                                  'Back',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: Color(0xFF5450E2),
                                        fontSize: 14.0,
                                      ),
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
                              var _shouldSetState = false;
                              _model.apiResultgfm = await TaskerpageBackendGroup
                                  .updatePostCall
                                  .call(
                                taskerLanguagesList:
                                    FFAppState().TaskCreation.languages,
                                description:
                                    FFAppState().TaskCreation.description,
                                radiusOfWork:
                                    FFAppState().TaskCreation.maxDistance,
                                skillLevel:
                                    FFAppState().TaskCreation.skillLevel,
                                startDate: FFAppState().TaskCreation.startDate,
                                startTime: FFAppState().TaskCreation.startTime,
                                customStartTime:
                                    FFAppState().TaskCreation.customStartTime,
                                endDatetime:
                                    FFAppState().TaskCreation.endDatetime,
                                repeatType:
                                    FFAppState().TaskCreation.repeatType,
                                repeatEvery:
                                    FFAppState().TaskCreation.repeatEvery,
                                repeatDate:
                                    FFAppState().TaskCreation.repeatDate,
                                endDateType:
                                    FFAppState().TaskCreation.endDateType,
                                postStatus: 4,
                                postOpenCloseStatus: 'OPEN',
                                poster: getJsonField(
                                  FFAppState().userProfile,
                                  r'''$.id''',
                                ),
                                session: FFAppState().TaskCreation.session,
                                sessionDuration:
                                    FFAppState().TaskCreation.sessionDuration,
                                address: FFAppState().TaskCreation.address,
                                taskerAge: FFAppState().TaskerAge,
                                relatedService:
                                    FFAppState().TaskCreation.relatedService,
                                relatedServiceCategory: FFAppState()
                                    .TaskCreation
                                    .relatedServiceCategory,
                                apiGlobalKey: FFAppState().apiKey,
                                id: FFAppState().TaskCreation.id,
                                monthlyRepeatType:
                                    FFAppState().TaskCreation.monthlyRepeatType,
                                preferredDaysList:
                                    FFAppState().TaskCreation.preferredDays,
                                taskerGender: FFAppState().TaskerType,
                                isVerified: false,
                                isPeriodic:
                                    FFAppState().TaskCreation.repeatDate,
                                numSessions:
                                    FFAppState().TaskCreation.numSessions,
                                identified: FFAppState().Identified,
                                yearsOfExperience:
                                    FFAppState().TaskCreation.yearsofExperience,
                                insurance: FFAppState().TaskCreation.insurance,
                                driverLicense:
                                    FFAppState().TaskCreation.driverslicense,
                                travelCosts:
                                    FFAppState().TaskCreation.paytravelcosts,
                                payPerHour: FFAppState()
                                    .TaskCreation
                                    .paytravelcostsPerhour,
                                cancellationPenalty: FFAppState()
                                    .TaskCreation
                                    .cancellationPenaltyApplies,
                                payCancellationPerHour: FFAppState()
                                    .TaskCreation
                                    .cancellationPenaltyPerhour,
                                cancellationBeforeAppointment:
                                    FFAppState().TaskCreation.ifCancelledBefore,
                              );
                              _shouldSetState = true;
                              if ((_model.apiResultgfm?.succeeded ?? true)) {
                                context.pushNamed(
                                  'TaskView',
                                  queryParameters: {
                                    'id': serializeParam(
                                      FFAppState().TaskCreation.id,
                                      ParamType.int,
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
