import '/backend/schema/structs/index.dart';
import '/components/button_next_widget.dart';
import '/components/header_widget.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'calendar_model.dart';
export 'calendar_model.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              wrapWithModel(
                model: _model.headerModel,
                updateCallback: () => setState(() {}),
                child: HeaderWidget(
                  openDrawer: () async {},
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
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
                              'Date',
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 10.0, 32.0, 0.0),
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
                                  final _datePicked1Date = await showDatePicker(
                                    context: context,
                                    initialDate: getCurrentTimestamp,
                                    firstDate: getCurrentTimestamp,
                                    lastDate: DateTime(2050),
                                  );

                                  if (_datePicked1Date != null) {
                                    setState(() {
                                      _model.datePicked1 = DateTime(
                                        _datePicked1Date.year,
                                        _datePicked1Date.month,
                                        _datePicked1Date.day,
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
                                        10.0, 0.0, 15.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.date_range,
                                          color: Color(0xFF212121),
                                          size: 20.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            26.5, 16.0, 32.0, 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 5.0, 0.0),
                              child: Theme(
                                data: ThemeData(
                                  checkboxTheme: CheckboxThemeData(
                                    visualDensity: VisualDensity.compact,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3.0),
                                    ),
                                  ),
                                  unselectedWidgetColor: Color(0xFF211DAF),
                                ),
                                child: Checkbox(
                                  value: _model.checkboxValue ??= false,
                                  onChanged: (newValue) async {
                                    setState(
                                        () => _model.checkboxValue = newValue!);
                                    if (newValue!) {
                                      setState(() {
                                        FFAppState().updateTaskCreationStruct(
                                          (e) => e..repeatDate = true,
                                        );
                                      });
                                    } else {
                                      setState(() {
                                        FFAppState().updateTaskCreationStruct(
                                          (e) => e..repeatDate = false,
                                        );
                                      });
                                    }
                                  },
                                  activeColor: Color(0xFF211DAF),
                                  checkColor: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              'Repeat Date',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Color(0xFF292929),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      if (_model.checkboxValue == true)
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
                                          FormFieldController<String>(null),
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
                                      FFAppState().updateTaskCreationStruct(
                                        (e) => e
                                          ..repeatType = _model.dropDownValue1,
                                      );
                                    });
                                  },
                                  height: 41.0,
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
                                  borderColor: Color(0xFF5E5D5D),
                                  borderWidth: 1.0,
                                  borderRadius: 5.0,
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
                      if ((_model.checkboxValue == true) &&
                          (_model.dropDownValue1 == 'Custom'))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 16.0, 32.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: Text(
                                  'Repeat Every',
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
                              Container(
                                width: 70.0,
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
                                    Icons.keyboard_arrow_down_rounded,
                                    color: enabled
                                        ? Color(0xFFF06543)
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    size: 15.0,
                                  ),
                                  incrementIconBuilder: (enabled) => Icon(
                                    Icons.keyboard_arrow_up_rounded,
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
                                  count: _model.countControllerValue1 ??= 1,
                                  updateCount: (count) async {
                                    setState(() =>
                                        _model.countControllerValue1 = count);
                                    setState(() {
                                      FFAppState().updateTaskCreationStruct(
                                        (e) => e
                                          ..repeatEvery =
                                              '${_model.countControllerValue1?.toString()} ${_model.dropDownValue2}',
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
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.dropDownValueController2 ??=
                                            FormFieldController<String>(
                                      _model.dropDownValue2 ??= 'Days',
                                    ),
                                    options: ['Days', 'Weeks', 'Months'],
                                    onChanged: (val) async {
                                      setState(
                                          () => _model.dropDownValue2 = val);
                                      setState(() {
                                        FFAppState().updateTaskCreationStruct(
                                          (e) => e
                                            ..repeatEvery =
                                                '${_model.countControllerValue1?.toString()} ${_model.dropDownValue2}',
                                        );
                                      });
                                    },
                                    width: 100.0,
                                    height: 41.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lato',
                                          color: Color(0xFF3D3D3D),
                                          fontSize: 14.0,
                                        ),
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
                                        10.0, 4.0, 10.0, 4.0),
                                    hidesUnderline: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if ((_model.checkboxValue == true) &&
                          (_model.dropDownValue2 != 'Months') &&
                          (_model.dropDownValue1 != 'Daily') &&
                          (_model.dropDownValue1 !=
                              'Every Weekday (Mon-Fri)') &&
                          (_model.dropDownValue1 != 'Monthly'))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 16.0, 32.0, 0.0),
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
                      if ((_model.checkboxValue == true) &&
                          (_model.dropDownValue2 != 'Months') &&
                          (_model.dropDownValue1 != 'Daily') &&
                          (_model.dropDownValue1 !=
                              'Every Weekday (Mon-Fri)') &&
                          (_model.dropDownValue1 != 'Monthly'))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 22.0, 32.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final daysOfWeek =
                                  functions.generateDaysOfWeekRange().toList();
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(daysOfWeek.length,
                                    (daysOfWeekIndex) {
                                  final daysOfWeekItem =
                                      daysOfWeek[daysOfWeekIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (FFAppState()
                                          .TaskCreation
                                          .preferredDays
                                          .contains(getJsonField(
                                            daysOfWeekItem,
                                            r'''$.shortName''',
                                          ).toString())) {
                                        setState(() {
                                          FFAppState().updateTaskCreationStruct(
                                            (e) => e
                                              ..updatePreferredDays(
                                                (e) => e.remove(getJsonField(
                                                  daysOfWeekItem,
                                                  r'''$.shortName''',
                                                ).toString()),
                                              ),
                                          );
                                        });
                                      } else {
                                        setState(() {
                                          FFAppState().updateTaskCreationStruct(
                                            (e) => e
                                              ..updatePreferredDays(
                                                (e) => e.remove(getJsonField(
                                                  daysOfWeekItem,
                                                  r'''$.shortName''',
                                                ).toString()),
                                              ),
                                          );
                                        });
                                        setState(() {
                                          FFAppState().updateTaskCreationStruct(
                                            (e) => e
                                              ..updatePreferredDays(
                                                (e) => e.add(getJsonField(
                                                  daysOfWeekItem,
                                                  r'''$.shortName''',
                                                ).toString()),
                                              ),
                                          );
                                        });
                                      }
                                    },
                                    child: Container(
                                      width: 30.0,
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                        color: FFAppState()
                                                .TaskCreation
                                                .preferredDays
                                                .contains(getJsonField(
                                                  daysOfWeekItem,
                                                  r'''$.shortName''',
                                                ).toString())
                                            ? Color(0xFF5450E2)
                                            : Color(0xFFD9D9D9),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            getJsonField(
                                              daysOfWeekItem,
                                              r'''$.name''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lato',
                                                  color: FFAppState()
                                                          .TaskCreation
                                                          .preferredDays
                                                          .contains(
                                                              getJsonField(
                                                            daysOfWeekItem,
                                                            r'''$.shortName''',
                                                          ).toString())
                                                      ? Color(0xFFF6F6F6)
                                                      : Colors.black,
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).divide(SizedBox(width: 10.0)),
                              );
                            },
                          ),
                        ),
                      if ((_model.checkboxValue == true) &&
                          (_model.dropDownValue2 == 'Months') &&
                          (_model.dropDownValue1 !=
                              'Every Weekday (Mon-Fri)') &&
                          (_model.dropDownValue1 != 'Daily') &&
                          (_model.dropDownValue1 != 'Weekly'))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 16.0, 32.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: FlutterFlowDropDown<String>(
                                  controller:
                                      _model.dropDownValueController3 ??=
                                          FormFieldController<String>(null),
                                  options: [
                                    'Monthly on the same day',
                                    'Monthly on Third Friday'
                                  ],
                                  onChanged: (val) async {
                                    setState(() => _model.dropDownValue3 = val);
                                    setState(() {
                                      FFAppState().updateTaskCreationStruct(
                                        (e) => e
                                          ..monthlyRepeatType =
                                              _model.dropDownValue3,
                                      );
                                    });
                                  },
                                  height: 41.0,
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
                                  borderColor: Color(0xFF5E5D5D),
                                  borderWidth: 1.0,
                                  borderRadius: 5.0,
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
                      if (_model.checkboxValue == true)
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
                      if (_model.checkboxValue == true)
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
                                      FFAppState().updateTaskCreationStruct(
                                        (e) => e
                                          ..endDateType =
                                              _model.radioButtonValue,
                                      );
                                    });
                                  },
                                  controller:
                                      _model.radioButtonValueController ??=
                                          FormFieldController<String>(null),
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
                                            children: [
                                              Expanded(
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    final _datePicked2Date =
                                                        await showDatePicker(
                                                      context: context,
                                                      initialDate:
                                                          getCurrentTimestamp,
                                                      firstDate:
                                                          getCurrentTimestamp,
                                                      lastDate: DateTime(2050),
                                                    );

                                                    TimeOfDay? _datePicked2Time;
                                                    if (_datePicked2Date !=
                                                        null) {
                                                      _datePicked2Time =
                                                          await showTimePicker(
                                                        context: context,
                                                        initialTime: TimeOfDay
                                                            .fromDateTime(
                                                                getCurrentTimestamp),
                                                      );
                                                    }

                                                    if (_datePicked2Date !=
                                                            null &&
                                                        _datePicked2Time !=
                                                            null) {
                                                      setState(() {
                                                        _model.datePicked2 =
                                                            DateTime(
                                                          _datePicked2Date.year,
                                                          _datePicked2Date
                                                              .month,
                                                          _datePicked2Date.day,
                                                          _datePicked2Time!
                                                              .hour,
                                                          _datePicked2Time
                                                              .minute,
                                                        );
                                                      });
                                                    }
                                                  },
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFF5E5D5D),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  15.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Icon(
                                                            Icons.date_range,
                                                            color: Color(
                                                                0xFF212121),
                                                            size: 20.0,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                    'yMMMd',
                                                                    _model
                                                                        .datePicked2),
                                                                'Select Start or Exact Date',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lato',
                                                                    color: Color(
                                                                        0xFF212121),
                                                                    fontSize:
                                                                        14.0,
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
                                                  width: 70.0,
                                                  height: 41.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
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
                                                          ? Color(0xFF3D3D3D)
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      size: 15.0,
                                                    ),
                                                    incrementIconBuilder:
                                                        (enabled) => Icon(
                                                      Icons
                                                          .keyboard_arrow_up_rounded,
                                                      color: enabled
                                                          ? Color(0xFF3D3D3D)
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      size: 15.0,
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
                                                        .countControllerValue2 ??= 2,
                                                    updateCount: (count) async {
                                                      setState(() => _model
                                                              .countControllerValue2 =
                                                          count);
                                                      setState(() {
                                                        FFAppState()
                                                            .updateTaskCreationStruct(
                                                          (e) => e
                                                            ..session = _model
                                                                .countControllerValue2,
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
                      if ((_model.datePicked1 != null) &&
                          (_model.switchValue == false))
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
                      if ((_model.datePicked1 != null) &&
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
                                    FFAppState().StartingTime =
                                        'Morning (7:00-12:00)';
                                  });
                                },
                                child: Container(
                                  width: 217.0,
                                  height: 41.0,
                                  decoration: BoxDecoration(
                                    color: FFAppState().StartingTime ==
                                            'Morning (7:00-12:00)'
                                        ? Color(0xFF5450E2)
                                        : Color(0x00000000),
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(
                                      color: FFAppState().StartingTime ==
                                              'Morning (7:00-12:00)'
                                          ? Color(0xFF5450E2)
                                          : Color(0xFF5E5D5D),
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
                                              color:
                                                  FFAppState().StartingTime ==
                                                          'Morning (7:00-12:00)'
                                                      ? Colors.white
                                                      : Color(0xFF5E5D5D),
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
                      if ((_model.datePicked1 != null) &&
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
                                    FFAppState().StartingTime =
                                        'Afternoon (12:00-18:00)';
                                  });
                                },
                                child: Container(
                                  width: 217.0,
                                  height: 41.0,
                                  decoration: BoxDecoration(
                                    color: FFAppState().StartingTime ==
                                            'Afternoon (12:00-18:00)'
                                        ? Color(0xFF5450E2)
                                        : Color(0x00000000),
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(
                                      color: FFAppState().StartingTime ==
                                              'Afternoon (12:00-18:00)'
                                          ? Color(0xFF5450E2)
                                          : Color(0xFF5E5D5D),
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
                                                          .StartingTime ==
                                                      'Afternoon (12:00-18:00)'
                                                  ? Colors.white
                                                  : Color(0xFF5E5D5D),
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
                      if ((_model.datePicked1 != null) &&
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
                                    FFAppState().StartingTime =
                                        'Evening (18:00-24:00)';
                                  });
                                },
                                child: Container(
                                  width: 217.0,
                                  height: 41.0,
                                  decoration: BoxDecoration(
                                    color: FFAppState().StartingTime ==
                                            'Evening (18:00-24:00)'
                                        ? Color(0xFF5450E2)
                                        : Color(0x00000000),
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(
                                      color: FFAppState().StartingTime ==
                                              'Evening (18:00-24:00)'
                                          ? Color(0xFF5450E2)
                                          : Color(0xFF5E5D5D),
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
                                                          .StartingTime ==
                                                      'Evening (18:00-24:00)'
                                                  ? Colors.white
                                                  : Color(0xFF5E5D5D),
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
                      if (_model.datePicked1 != null)
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
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Switch.adaptive(
                                  value: _model.switchValue ??=
                                      FFAppState().exactstartingtime,
                                  onChanged: (newValue) async {
                                    setState(
                                        () => _model.switchValue = newValue!);
                                    if (newValue!) {
                                      setState(() {
                                        FFAppState().exactstartingtime = true;
                                      });
                                    } else {
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
                      if (_model.datePicked1 != null)
                        Divider(
                          height: 32.0,
                          thickness: 1.0,
                          indent: 32.0,
                          endIndent: 32.0,
                          color: Color(0xFFDEDEDE),
                        ),
                      if ((_model.datePicked1 != null) &&
                          (_model.switchValue == true))
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
                                      setState(() {
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
                                    height: 41.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(
                                        color: Color(0xFF211DAF),
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
                                                color: Color(0xFF211DAF),
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
                                    0.0, 0.0, 8.0, 0.0),
                                child: Icon(
                                  Icons.access_time,
                                  color: Color(0xFF212121),
                                  size: 20.0,
                                ),
                              ),
                              Text(
                                dateTimeFormat('Hm', _model.datePicked3),
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
                      if (_model.datePicked1 != null)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 0.0, 32.0, 58.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Number of hours per session',
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
                                width: 70.0,
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
                                    Icons.keyboard_arrow_down_rounded,
                                    color: enabled
                                        ? Color(0xFFF06543)
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    size: 15.0,
                                  ),
                                  incrementIconBuilder: (enabled) => Icon(
                                    Icons.keyboard_arrow_up_rounded,
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
                                  count: _model.countControllerValue3 ??= 1,
                                  updateCount: (count) async {
                                    setState(() =>
                                        _model.countControllerValue3 = count);
                                    setState(() {
                                      FFAppState().updateTaskCreationStruct(
                                        (e) => e
                                          ..sessionDuration = _model
                                              .countControllerValue3
                                              ?.toString(),
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
                    ],
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
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 0.0, 32.0, 0.0),
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
                                context.safePop();
                              },
                              child: Container(
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
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  FFAppState().updateTaskCreationStruct(
                                    (e) => e
                                      ..startDate = dateTimeFormat(
                                          'y-M-d', _model.datePicked1)
                                      ..endDatetime =
                                          _model.datePicked2?.toString()
                                      ..customStartTime = dateTimeFormat(
                                          'jm', _model.datePicked3),
                                  );
                                });

                                context.pushNamed('Taskertype');
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
      ),
    );
  }
}
