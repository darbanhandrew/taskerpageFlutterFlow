import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/button_next_widget.dart';
import '/components/drawer_content_widget.dart';
import '/components/header_widget.dart';
import '/components/navigation_bar_widget.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'calendar_model.dart';
export 'calendar_model.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String? id;

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late CalendarModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.id == null || widget.id == '') {
        context.pushNamed('Task-1');
      } else {
        _model.apiResultbhr = await TaskerpageBackendGroup.postReadCall.call(
          id: widget.id,
          apiGlobalKey: FFAppState().apiKey,
        );
        if ((_model.apiResultbhr?.succeeded ?? true)) {
          setState(() {
            FFAppState().updateCreateTaskStruct(
              (e) => e
                ..taskSchedule = TaskScheduleStruct(
                  startDate: functions.jsonToDateTime(getJsonField(
                    (_model.apiResultbhr?.jsonBody ?? ''),
                    r'''$.data.start_date''',
                  ).toString().toString()),
                  isExactStartTime: functions.jsonIntToBoolean(getJsonField(
                    (_model.apiResultbhr?.jsonBody ?? ''),
                    r'''$.data.is_exact_start_time''',
                  )),
                  numberOfHoursPerSession: getJsonField(
                    (_model.apiResultbhr?.jsonBody ?? ''),
                    r'''$.data.number_of_hours_per_session''',
                  ),
                  isRepeatable: functions.jsonIntToBoolean(getJsonField(
                    (_model.apiResultbhr?.jsonBody ?? ''),
                    r'''$.data.is_repeatable''',
                  )),
                  startTime: functions.jsonToDateTime(getJsonField(
                    (_model.apiResultbhr?.jsonBody ?? ''),
                    r'''$.data.start_time''',
                  ).toString().toString()),
                  startRangeTime: getJsonField(
                    (_model.apiResultbhr?.jsonBody ?? ''),
                    r'''$.data.start_range_time''',
                  ).toString().toString(),
                  repeatableTaskDetails: RepeatableTaskDetailsStruct(
                    repeatType: getJsonField(
                      (_model.apiResultbhr?.jsonBody ?? ''),
                      r'''$.data.repeat_type''',
                    ).toString().toString(),
                    endDateType: getJsonField(
                      (_model.apiResultbhr?.jsonBody ?? ''),
                      r'''$.data.end_date_type''',
                    ).toString().toString(),
                    endOn: functions.jsonToDateTime(getJsonField(
                      (_model.apiResultbhr?.jsonBody ?? ''),
                      r'''$.data.end_on''',
                    ).toString().toString()),
                    endAfterNumberOfSession: getJsonField(
                      (_model.apiResultbhr?.jsonBody ?? ''),
                      r'''$.data.end_after_number_of_sessions''',
                    ),
                    repeatEvery: getJsonField(
                      (_model.apiResultbhr?.jsonBody ?? ''),
                      r'''$.data.repeat_every''',
                    ).toString().toString(),
                    monthlyRepeatType: getJsonField(
                      (_model.apiResultbhr?.jsonBody ?? ''),
                      r'''$.data.monthly_repeat_type''',
                    ).toString().toString(),
                    preferredDays:
                        functions.convertStringToListOfString(getJsonField(
                      (_model.apiResultbhr?.jsonBody ?? ''),
                      r'''$.data.preferred_days''',
                    )),
                  ),
                ),
            );
          });
        } else {
          return;
        }
      }
    });

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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
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
            Expanded(
              child: Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 32.0, 16.0, 0.0),
                              child: wrapWithModel(
                                model: _model.navigationBarModel,
                                updateCallback: () => setState(() {}),
                                child: NavigationBarWidget(
                                  currentPage: 'calender',
                                  postId: widget.id,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 32.0, 32.0, 26.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Select Start or Exact Date',
                              textAlign: TextAlign.center,
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
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 0.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFAppState()
                                          .createTask
                                          .taskSchedule
                                          .repeatableTaskDetails
                                          .repeatType ==
                                      'Exact Dates'
                                  ? 'Select date'
                                  : 'From',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Color(0xFF292929),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            if (FFAppState()
                                    .createTask
                                    .taskSchedule
                                    .repeatableTaskDetails
                                    .repeatType ==
                                'Weekly')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    130.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'To',
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
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 10.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  final _datePicked1Date = await showDatePicker(
                                    context: context,
                                    initialDate: getCurrentTimestamp,
                                    firstDate: getCurrentTimestamp,
                                    lastDate: DateTime(2050),
                                  );

                                  if (_datePicked1Date != null) {
                                    safeSetState(() {
                                      _model.datePicked1 = DateTime(
                                        _datePicked1Date.year,
                                        _datePicked1Date.month,
                                        _datePicked1Date.day,
                                      );
                                    });
                                  }
                                  setState(() {
                                    FFAppState().updateCreateTaskStruct(
                                      (e) => e
                                        ..updateTaskSchedule(
                                          (e) =>
                                              e..startDate = _model.datePicked1,
                                        ),
                                    );
                                  });
                                },
                                child: Container(
                                  width: 160.0,
                                  height: 36.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(2.0),
                                    border: Border.all(
                                      color: FFAppState()
                                                  .createTask
                                                  .taskSchedule
                                                  .startDate !=
                                              null
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 15.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            dateTimeFormat(
                                                'yMMMd', _model.datePicked1),
                                            'Select Start or Exact Date',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lato',
                                                color: Color(0xFF212121),
                                                fontSize: 14.0,
                                              ),
                                        ),
                                        Icon(
                                          Icons.date_range,
                                          color: FFAppState()
                                                      .createTask
                                                      .taskSchedule
                                                      .startDate !=
                                                  null
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : FlutterFlowTheme.of(context)
                                                  .secondary,
                                          size: 20.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (FFAppState()
                                    .createTask
                                    .taskSchedule
                                    .repeatableTaskDetails
                                    .repeatType ==
                                'Weekly')
                              Expanded(
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    final _datePicked2Date =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: _model.datePicked1!,
                                      firstDate: _model.datePicked1!,
                                      lastDate: DateTime(2050),
                                    );

                                    if (_datePicked2Date != null) {
                                      safeSetState(() {
                                        _model.datePicked2 = DateTime(
                                          _datePicked2Date.year,
                                          _datePicked2Date.month,
                                          _datePicked2Date.day,
                                        );
                                      });
                                    }
                                    setState(() {
                                      FFAppState().updateCreateTaskStruct(
                                        (e) => e
                                          ..updateTaskSchedule(
                                            (e) => e
                                              ..updateRepeatableTaskDetails(
                                                (e) => e
                                                  ..endOn = _model.datePicked2,
                                              ),
                                          ),
                                      );
                                    });
                                  },
                                  child: Container(
                                    width: 10.0,
                                    height: 36.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(2.0),
                                      border: Border.all(
                                        color: FFAppState()
                                                    .createTask
                                                    .taskSchedule
                                                    .repeatableTaskDetails
                                                    .endOn !=
                                                null
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 15.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              dateTimeFormat(
                                                  'yMMMd',
                                                  FFAppState()
                                                      .createTask
                                                      .taskSchedule
                                                      .repeatableTaskDetails
                                                      .endOn),
                                              'Select End Date',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lato',
                                                  color: Color(0xFF212121),
                                                  fontSize: 14.0,
                                                ),
                                          ),
                                          Icon(
                                            Icons.date_range,
                                            color: FFAppState()
                                                        .createTask
                                                        .taskSchedule
                                                        .repeatableTaskDetails
                                                        .endOn !=
                                                    null
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .secondary,
                                            size: 20.0,
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
                      if ((FFAppState()
                                  .createTask
                                  .taskSchedule
                                  .repeatableTaskDetails
                                  .repeatType !=
                              'Exact Dates') &&
                          (FFAppState()
                                  .createTask
                                  .taskSchedule
                                  .repeatableTaskDetails
                                  .repeatType !=
                              'Weekly'))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 0.0, 32.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: FlutterFlowDropDown<String>(
                                  controller:
                                      _model.dropDownValueController1 ??=
                                          FormFieldController<String>(
                                    _model.dropDownValue1 ??= FFAppState()
                                        .createTask
                                        .taskSchedule
                                        .repeatableTaskDetails
                                        .repeatType,
                                  ),
                                  options: [
                                    'Daily',
                                    'Every Weekday (Mon-Fri)',
                                    'Weekly',
                                    'Monthly',
                                    'Custom'
                                  ],
                                  onChanged: (val) async {
                                    setState(() => _model.dropDownValue1 = val);
                                    setState(() {
                                      FFAppState().updateCreateTaskStruct(
                                        (e) => e
                                          ..updateTaskSchedule(
                                            (e) => e
                                              ..updateRepeatableTaskDetails(
                                                (e) => e
                                                  ..repeatType =
                                                      _model.dropDownValue1,
                                              ),
                                          ),
                                      );
                                    });
                                  },
                                  height: 36.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: Color(0xFF3D3D3D),
                                        fontSize: 14.0,
                                      ),
                                  hintText: 'Select Repeat Type',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: Color(0xFF3D3D3D),
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  borderWidth: 1.0,
                                  borderRadius: 2.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 4.0, 10.0, 4.0),
                                  hidesUnderline: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (FFAppState()
                              .createTask
                              .taskSchedule
                              .repeatableTaskDetails
                              .repeatType !=
                          'Exact Dates')
                        Divider(
                          height: 32.0,
                          thickness: 1.0,
                          indent: 32.0,
                          endIndent: 32.0,
                          color: Color(0xFFDEDEDE),
                        ),
                      if (FFAppState()
                              .createTask
                              .taskSchedule
                              .repeatableTaskDetails
                              .repeatType !=
                          'Exact Dates')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 16.0, 32.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 85.0,
                                height: 36.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(2.0),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    width: 1.0,
                                  ),
                                ),
                                child: FlutterFlowCountController(
                                  decrementIconBuilder: (enabled) => Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: enabled
                                        ? Color(0xFFF06543)
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    size: 24.0,
                                  ),
                                  incrementIconBuilder: (enabled) => Icon(
                                    Icons.keyboard_arrow_up_rounded,
                                    color: enabled
                                        ? Color(0xFFF06543)
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    size: 24.0,
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
                                  count: _model.countControllerValue1 ??= 1,
                                  updateCount: (count) => setState(() =>
                                      _model.countControllerValue1 = count),
                                  stepSize: 1,
                                  minimum: 1,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 5.0, 0.0),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Text(
                                  'Days per week',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: Color(0xFF292929),
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (FFAppState()
                              .createTask
                              .taskSchedule
                              .repeatableTaskDetails
                              .repeatType !=
                          'Exact Dates')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 16.0, 32.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 85.0,
                                height: 36.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(2.0),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    width: 1.0,
                                  ),
                                ),
                                child: FlutterFlowCountController(
                                  decrementIconBuilder: (enabled) => Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: enabled
                                        ? Color(0xFFF06543)
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    size: 24.0,
                                  ),
                                  incrementIconBuilder: (enabled) => Icon(
                                    Icons.keyboard_arrow_up_rounded,
                                    color: enabled
                                        ? Color(0xFFF06543)
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    size: 24.0,
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
                                  count: _model.countControllerValue2 ??= 1,
                                  updateCount: (count) => setState(() =>
                                      _model.countControllerValue2 = count),
                                  stepSize: 1,
                                  minimum: 1,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 5.0, 0.0),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Text(
                                  'Hour each session',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: Color(0xFF292929),
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if ((FFAppState()
                                  .createTask
                                  .taskSchedule
                                  .repeatableTaskDetails
                                  .repeatType !=
                              'Exact Dates') &&
                          (FFAppState()
                                  .createTask
                                  .taskSchedule
                                  .repeatableTaskDetails
                                  .repeatType !=
                              'Weekly') &&
                          (FFAppState()
                                  .createTask
                                  .taskSchedule
                                  .repeatableTaskDetails
                                  .repeatType !=
                              'Mountly'))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 16.0, 32.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: FlutterFlowDropDown<String>(
                                  controller:
                                      _model.dropDownValueController2 ??=
                                          FormFieldController<String>(null),
                                  options: [
                                    'Monthly on the same day',
                                    'Monthly on Third Friday'
                                  ],
                                  onChanged: (val) async {
                                    setState(() => _model.dropDownValue2 = val);
                                    setState(() {
                                      FFAppState().updateTaskStruct(
                                        (e) => e
                                          ..monthlyRepeatType =
                                              _model.dropDownValue2,
                                      );
                                    });
                                  },
                                  height: 36.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: Color(0xFF3D3D3D),
                                        fontSize: 14.0,
                                      ),
                                  hintText: 'Select Monthly Repeat Type',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: Color(0xFF3D3D3D),
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  borderWidth: 1.0,
                                  borderRadius: 2.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 4.0, 10.0, 4.0),
                                  hidesUnderline: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                      if ((FFAppState()
                                  .createTask
                                  .taskSchedule
                                  .repeatableTaskDetails
                                  .repeatType !=
                              'Exact Dates') &&
                          (FFAppState()
                                  .createTask
                                  .taskSchedule
                                  .repeatableTaskDetails
                                  .repeatType !=
                              'Weekly') &&
                          (FFAppState()
                                  .createTask
                                  .taskSchedule
                                  .repeatableTaskDetails
                                  .repeatType !=
                              'Mountly'))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              33.0, 20.0, 32.0, 15.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'End Date',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Color(0xFF292929),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      if ((FFAppState()
                                  .createTask
                                  .taskSchedule
                                  .repeatableTaskDetails
                                  .repeatType !=
                              'Exact Dates') &&
                          (FFAppState()
                                  .createTask
                                  .taskSchedule
                                  .repeatableTaskDetails
                                  .repeatType !=
                              'Weekly') &&
                          (FFAppState()
                                  .createTask
                                  .taskSchedule
                                  .repeatableTaskDetails
                                  .repeatType !=
                              'Mountly'))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              25.5, 0.0, 32.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    2.0, 0.0, 0.0, 0.0),
                                child: FlutterFlowRadioButton(
                                  options: ['Never', 'On', 'After'].toList(),
                                  onChanged: (val) async {
                                    setState(() {});
                                    setState(() {
                                      FFAppState().updateCreateTaskStruct(
                                        (e) => e
                                          ..updateTaskSchedule(
                                            (e) => e
                                              ..updateRepeatableTaskDetails(
                                                (e) => e
                                                  ..endDateType =
                                                      _model.radioButtonValue,
                                              ),
                                          ),
                                      );
                                    });
                                  },
                                  controller:
                                      _model.radioButtonValueController ??=
                                          FormFieldController<String>(
                                              valueOrDefault<String>(
                                    FFAppState()
                                        .createTask
                                        .taskSchedule
                                        .repeatableTaskDetails
                                        .endDateType,
                                    'Never',
                                  )),
                                  optionHeight: 55.0,
                                  textStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  buttonPosition: RadioButtonPosition.left,
                                  direction: Axis.vertical,
                                  radioButtonColor: Color(0xFF211DAF),
                                  inactiveRadioButtonColor: Color(0xFF211DAF),
                                  toggleable: false,
                                  horizontalAlignment: WrapAlignment.start,
                                  verticalAlignment: WrapCrossAlignment.start,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      50.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      if (_model.radioButtonValue == 'On')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 62.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [],
                                          ),
                                        ),
                                      if (_model.radioButtonValue == 'After')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 7.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Container(
                                                  width: 90.0,
                                                  height: 36.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.0),
                                                    shape: BoxShape.rectangle,
                                                    border: Border.all(
                                                      color: Color(0xFF5E5D5D),
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child:
                                                      FlutterFlowCountController(
                                                    decrementIconBuilder:
                                                        (enabled) => Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color: enabled
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      size: 24.0,
                                                    ),
                                                    incrementIconBuilder:
                                                        (enabled) => Icon(
                                                      Icons
                                                          .keyboard_arrow_up_rounded,
                                                      color: enabled
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      size: 24.0,
                                                    ),
                                                    countBuilder: (count) =>
                                                        Text(
                                                      count.toString(),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleLarge
                                                          .override(
                                                            fontFamily: 'Lato',
                                                            fontSize: 13.0,
                                                          ),
                                                    ),
                                                    count: _model
                                                            .countControllerValue3 ??=
                                                        FFAppState()
                                                            .createTask
                                                            .taskSchedule
                                                            .repeatableTaskDetails
                                                            .endAfterNumberOfSession,
                                                    updateCount: (count) async {
                                                      setState(() => _model
                                                              .countControllerValue3 =
                                                          count);
                                                      setState(() {
                                                        FFAppState()
                                                            .updateCreateTaskStruct(
                                                          (e) => e
                                                            ..updateTaskSchedule(
                                                              (e) => e
                                                                ..updateRepeatableTaskDetails(
                                                                  (e) => e
                                                                    ..endAfterNumberOfSession =
                                                                        _model
                                                                            .countControllerValue3,
                                                                ),
                                                            ),
                                                        );
                                                      });
                                                    },
                                                    stepSize: 1,
                                                    minimum: 2,
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                5.0, 0.0),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'Sessions',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          color:
                                                              Color(0xFF292929),
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
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
                      if (((_model.datePicked1 != null) ||
                              (FFAppState().createTask.taskSchedule.startDate !=
                                  null)) &&
                          (FFAppState().exactstartingtime == false))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 0.0, 32.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Starting time',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Color(0xFF292929),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      if (((_model.datePicked1 != null) ||
                              (FFAppState().createTask.taskSchedule.startDate !=
                                  null)) &&
                          (FFAppState().exactstartingtime == false))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 16.0, 32.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setState(() {
                                    FFAppState().updateCreateTaskStruct(
                                      (e) => e
                                        ..updateTaskSchedule(
                                          (e) => e
                                            ..startRangeTime =
                                                'Morning (7:00-12:00)',
                                        ),
                                    );
                                  });
                                },
                                child: Container(
                                  width: 217.0,
                                  height: 36.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(2.0),
                                    border: Border.all(
                                      color: FFAppState()
                                                  .createTask
                                                  .taskSchedule
                                                  .startRangeTime ==
                                              'Morning (7:00-12:00)'
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .secondary,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Morning (7:00-12:00)',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: FFAppState()
                                                          .createTask
                                                          .taskSchedule
                                                          .startRangeTime ==
                                                      'Morning (7:00-12:00)'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .secondary,
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (((_model.datePicked1 != null) ||
                              (FFAppState().createTask.taskSchedule.startDate !=
                                  null)) &&
                          (FFAppState().exactstartingtime == false))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 0.0, 32.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setState(() {
                                    FFAppState().updateCreateTaskStruct(
                                      (e) => e
                                        ..updateTaskSchedule(
                                          (e) => e
                                            ..startRangeTime =
                                                'Afternoon (12:00-18:00)',
                                        ),
                                    );
                                  });
                                },
                                child: Container(
                                  width: 217.0,
                                  height: 36.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(2.0),
                                    border: Border.all(
                                      color: FFAppState()
                                                  .createTask
                                                  .taskSchedule
                                                  .startRangeTime ==
                                              'Afternoon (12:00-18:00)'
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .secondary,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        ' Afternoon (12:00-18:00)',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: FFAppState()
                                                          .createTask
                                                          .taskSchedule
                                                          .startRangeTime ==
                                                      'Afternoon (12:00-18:00)'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .secondary,
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (((_model.datePicked1 != null) ||
                              (FFAppState().createTask.taskSchedule.startDate !=
                                  null)) &&
                          (FFAppState().exactstartingtime == false))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 0.0, 32.0, 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setState(() {
                                    FFAppState().updateCreateTaskStruct(
                                      (e) => e
                                        ..updateTaskSchedule(
                                          (e) => e
                                            ..startRangeTime =
                                                'Evening (18:00-24:00)',
                                        ),
                                    );
                                  });
                                },
                                child: Container(
                                  width: 217.0,
                                  height: 36.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(2.0),
                                    border: Border.all(
                                      color: FFAppState()
                                                  .createTask
                                                  .taskSchedule
                                                  .startRangeTime ==
                                              'Evening (18:00-24:00)'
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .secondary,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Evening (18:00-24:00)',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: FFAppState()
                                                          .createTask
                                                          .taskSchedule
                                                          .startRangeTime ==
                                                      'Evening (18:00-24:00)'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .secondary,
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (((_model.datePicked1 != null) ||
                              (FFAppState().createTask.taskSchedule.startDate !=
                                  null)) &&
                          (FFAppState()
                                  .createTask
                                  .taskSchedule
                                  .repeatableTaskDetails
                                  .repeatType !=
                              'Weekly'))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 0.0, 32.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'I have exact starting time',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Color(0xFF3D3D3D),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.00, 0.00),
                                child: Switch.adaptive(
                                  value: _model.switchValue ??= FFAppState()
                                      .createTask
                                      .taskSchedule
                                      .isExactStartTime,
                                  onChanged: (newValue) async {
                                    setState(
                                        () => _model.switchValue = newValue!);
                                    if (newValue!) {
                                      setState(() {
                                        FFAppState().updateCreateTaskStruct(
                                          (e) => e
                                            ..updateTaskSchedule(
                                              (e) => e..isExactStartTime = true,
                                            ),
                                        );
                                      });
                                      setState(() {
                                        FFAppState().exactstartingtime = true;
                                      });
                                    } else {
                                      setState(() {
                                        FFAppState().updateCreateTaskStruct(
                                          (e) => e
                                            ..updateTaskSchedule(
                                              (e) =>
                                                  e..isExactStartTime = false,
                                            ),
                                        );
                                      });
                                      setState(() {
                                        FFAppState().exactstartingtime = false;
                                      });
                                    }
                                  },
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  activeTrackColor: Color(0xFFFAD1C6),
                                  inactiveTrackColor: Color(0xFFECECEC),
                                  inactiveThumbColor: Color(0xFF3D3D3D),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (((_model.datePicked1 != null) ||
                              (FFAppState().createTask.taskSchedule.startDate !=
                                  null)) &&
                          (FFAppState()
                                  .createTask
                                  .taskSchedule
                                  .repeatableTaskDetails
                                  .repeatType !=
                              'Weekly'))
                        Divider(
                          height: 32.0,
                          thickness: 1.0,
                          indent: 32.0,
                          endIndent: 32.0,
                          color: Color(0xFFDEDEDE),
                        ),
                      if (((_model.datePicked1 != null) ||
                              (FFAppState().createTask.taskSchedule.startDate !=
                                  null)) &&
                          (_model.switchValue == true) &&
                          (FFAppState()
                                  .createTask
                                  .taskSchedule
                                  .repeatableTaskDetails
                                  .repeatType !=
                              'Weekly'))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 0.0, 32.0, 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 32.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    // TimePicked

                                    final _datePicked3Time =
                                        await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.fromDateTime(
                                          getCurrentTimestamp),
                                    );
                                    if (_datePicked3Time != null) {
                                      safeSetState(() {
                                        _model.datePicked3 = DateTime(
                                          getCurrentTimestamp.year,
                                          getCurrentTimestamp.month,
                                          getCurrentTimestamp.day,
                                          _datePicked3Time.hour,
                                          _datePicked3Time.minute,
                                        );
                                      });
                                    }
                                  },
                                  child: Container(
                                    width: 98.0,
                                    height: 36.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(2.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Start Time',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lato',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 4.0, 0.0),
                                child: Icon(
                                  Icons.access_time,
                                  color: Color(0xFF212121),
                                  size: 20.0,
                                ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  'From: ${dateTimeFormat('Hm', _model.datePicked3)}',
                                  'Select start time',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Color(0xFF212121),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      if (((_model.datePicked1 != null) ||
                              (FFAppState().createTask.taskSchedule.startDate !=
                                  null)) &&
                          (FFAppState()
                                  .createTask
                                  .taskSchedule
                                  .repeatableTaskDetails
                                  .repeatType !=
                              'Weekly'))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 0.0, 32.0, 58.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Number of hours per day ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Color(0xFF292929),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Container(
                                width: 90.0,
                                height: 36.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(2.0),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    width: 1.0,
                                  ),
                                ),
                                child: FlutterFlowCountController(
                                  decrementIconBuilder: (enabled) => Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: enabled
                                        ? Color(0xFFF06543)
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    size: 24.0,
                                  ),
                                  incrementIconBuilder: (enabled) => Icon(
                                    Icons.keyboard_arrow_up_rounded,
                                    color: enabled
                                        ? Color(0xFFF06543)
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    size: 24.0,
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
                                  count: _model.countControllerValue4 ??=
                                      FFAppState()
                                          .createTask
                                          .taskSchedule
                                          .numberOfHoursPerSession,
                                  updateCount: (count) async {
                                    setState(() =>
                                        _model.countControllerValue4 = count);
                                    setState(() {
                                      FFAppState().updateCreateTaskStruct(
                                        (e) => e
                                          ..updateTaskSchedule(
                                            (e) => e
                                              ..numberOfHoursPerSession =
                                                  _model.countControllerValue4,
                                          ),
                                      );
                                    });
                                  },
                                  stepSize: 1,
                                  minimum: 1,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 5.0, 0.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (FFAppState()
                              .createTask
                              .taskSchedule
                              .repeatableTaskDetails
                              .repeatType !=
                          'Exact Dates')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 0.0, 32.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: Text(
                                  'Preferred Days',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: Color(0xFF292929),
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (FFAppState()
                              .createTask
                              .taskSchedule
                              .repeatableTaskDetails
                              .repeatType !=
                          'Exact Dates')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 16.0, 32.0, 58.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Builder(
                                  builder: (context) {
                                    final days = functions
                                        .generateDaysOfWeekRange()
                                        .toList();
                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 12.0,
                                        mainAxisSpacing: 6.0,
                                        childAspectRatio: 4.2,
                                      ),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: days.length,
                                      itemBuilder: (context, daysIndex) {
                                        final daysItem = days[daysIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (FFAppState()
                                                .task
                                                .preferredDays
                                                .contains(getJsonField(
                                                  daysItem,
                                                  r'''$.shortName''',
                                                ).toString())) {
                                              setState(() {
                                                FFAppState()
                                                    .updateCreateTaskStruct(
                                                  (e) => e
                                                    ..updateTaskSchedule(
                                                      (e) => e
                                                        ..updateRepeatableTaskDetails(
                                                          (e) => e
                                                            ..updatePreferredDays(
                                                              (e) => e.remove(
                                                                  getJsonField(
                                                                daysItem,
                                                                r'''$.shortName''',
                                                              ).toString()),
                                                            ),
                                                        ),
                                                    ),
                                                );
                                              });
                                            } else {
                                              setState(() {
                                                FFAppState()
                                                    .updateCreateTaskStruct(
                                                  (e) => e
                                                    ..updateTaskSchedule(
                                                      (e) => e
                                                        ..updateRepeatableTaskDetails(
                                                          (e) => e
                                                            ..updatePreferredDays(
                                                              (e) => e.add(
                                                                  getJsonField(
                                                                daysItem,
                                                                r'''$.shortName''',
                                                              ).toString()),
                                                            ),
                                                        ),
                                                    ),
                                                );
                                              });
                                            }
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                color: FFAppState()
                                                        .createTask
                                                        .taskSchedule
                                                        .repeatableTaskDetails
                                                        .preferredDays
                                                        .contains(getJsonField(
                                                          daysItem,
                                                          r'''$.shortName''',
                                                        ).toString())
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 4.0, 10.0, 4.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    getJsonField(
                                                      daysItem,
                                                      r'''$.name''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          color: FFAppState()
                                                                  .createTask
                                                                  .taskSchedule
                                                                  .repeatableTaskDetails
                                                                  .preferredDays
                                                                  .contains(
                                                                      getJsonField(
                                                                    daysItem,
                                                                    r'''$.shortName''',
                                                                  ).toString())
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primary
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
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
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 5.0, 0.0),
                                child: Icon(
                                  Icons.arrow_back_ios_rounded,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  size: 10.0,
                                ),
                              ),
                              Text(
                                'Back',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      fontSize: 14.0,
                                    ),
                              ),
                            ],
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              var _shouldSetState = false;
                              setState(() {
                                FFAppState().updateCreateTaskStruct(
                                  (e) => e
                                    ..updateTaskSchedule(
                                      (e) => e
                                        ..startDate = _model.datePicked1
                                        ..startTime = _model.datePicked3
                                        ..updateRepeatableTaskDetails(
                                          (e) => e..endOn = _model.datePicked2,
                                        ),
                                    ),
                                );
                              });
                              if (!FFAppState()
                                  .createTask
                                  .taskSchedule
                                  .isRepeatable) {
                                FFAppState().updateCreateTaskStruct(
                                  (e) => e
                                    ..updateTaskSchedule(
                                      (e) => e..repeatableTaskDetails = null,
                                    ),
                                );
                              }
                              if (FFAppState()
                                  .createTask
                                  .taskSchedule
                                  .isExactStartTime) {
                                FFAppState().updateCreateTaskStruct(
                                  (e) => e
                                    ..updateTaskSchedule(
                                      (e) => e..startRangeTime = null,
                                    ),
                                );
                              } else {
                                FFAppState().updateCreateTaskStruct(
                                  (e) => e
                                    ..updateTaskSchedule(
                                      (e) => e..startTime = null,
                                    ),
                                );
                              }

                              _model.updatedSchedule2 =
                                  await TaskerpageBackendGroup
                                      .updateTaskScheduleCall
                                      .call(
                                startDate: dateTimeFormat(
                                    'yyyy-MM-dd',
                                    FFAppState()
                                        .createTask
                                        .taskSchedule
                                        .startDate),
                                isExactStartTime: functions.booltoInt(
                                    FFAppState()
                                        .createTask
                                        .taskSchedule
                                        .isExactStartTime),
                                startTime: dateTimeFormat(
                                    'Hm',
                                    FFAppState()
                                        .createTask
                                        .taskSchedule
                                        .startTime),
                                startRangeTime: FFAppState()
                                    .createTask
                                    .taskSchedule
                                    .startRangeTime,
                                numberOfHoursPerSession: FFAppState()
                                    .createTask
                                    .taskSchedule
                                    .numberOfHoursPerSession,
                                isRepeatable: functions.booltoInt(FFAppState()
                                    .createTask
                                    .taskSchedule
                                    .isRepeatable),
                                endDateType: FFAppState()
                                    .createTask
                                    .taskSchedule
                                    .repeatableTaskDetails
                                    .endDateType,
                                endOn: dateTimeFormat(
                                    'yyyy-MM-dd',
                                    FFAppState()
                                        .createTask
                                        .taskSchedule
                                        .repeatableTaskDetails
                                        .endOn),
                                endAfterNumberOfSessions: FFAppState()
                                    .createTask
                                    .taskSchedule
                                    .repeatableTaskDetails
                                    .endAfterNumberOfSession,
                                repeatEvery:
                                    '${_model.countControllerValue1?.toString()}',
                                preferredDays: functions
                                    .convertListOfStringToString(FFAppState()
                                        .createTask
                                        .taskSchedule
                                        .repeatableTaskDetails
                                        .preferredDays
                                        .toList()),
                                id: widget.id,
                                apiGlobalKey: FFAppState().apiKey,
                              );
                              _shouldSetState = true;
                              if ((_model.updatedSchedule2?.succeeded ??
                                  true)) {
                                context.pushNamed(
                                  'Taskertype',
                                  queryParameters: {
                                    'id': serializeParam(
                                      widget.id,
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
            ),
          ],
        ),
      ),
    );
  }
}
