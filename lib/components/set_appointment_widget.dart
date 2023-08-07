import '/backend/schema/structs/index.dart';
import '/components/aler_modal_massage_share_address_widget.dart';
import '/components/aler_modal_massage_share_phone_widget.dart';
import '/components/aler_modal_massage_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'set_appointment_model.dart';
export 'set_appointment_model.dart';

class SetAppointmentWidget extends StatefulWidget {
  const SetAppointmentWidget({
    Key? key,
    required this.setOredit,
  }) : super(key: key);

  final bool? setOredit;

  @override
  _SetAppointmentWidgetState createState() => _SetAppointmentWidgetState();
}

class _SetAppointmentWidgetState extends State<SetAppointmentWidget>
    with TickerProviderStateMixin {
  late SetAppointmentModel _model;

  final animationsMap = {
    'rowOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 450.ms,
          begin: Offset(0.0, -5.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'rowOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 450.ms,
          begin: Offset(0.0, -5.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'listViewOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 450.ms,
          begin: Offset(0.0, -5.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'listViewOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 450.ms,
          begin: Offset(0.0, -5.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 450.ms,
          begin: Offset(0.0, -5.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'rowOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 450.ms,
          begin: Offset(0.0, -5.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'dividerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 450.ms,
          begin: Offset(0.0, -5.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'dividerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 450.ms,
          begin: Offset(0.0, -5.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SetAppointmentModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 700.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Container(
                width: 124.0,
                height: 4.0,
                decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 18.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.setOredit == true
                                ? 'Edit Appointment'
                                : 'Set Appointment',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: Color(0xFF292929),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 24.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Select appointment type',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: Color(0xFF222222),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(26.0, 10.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FlutterFlowRadioButton(
                            options: ['Online', 'By Phone', 'On-Site'].toList(),
                            onChanged: (val) => setState(() {}),
                            controller: _model.radioButtonValueController1 ??=
                                FormFieldController<String>(null),
                            optionHeight: 32.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: Color(0xFF212121),
                                  fontWeight: FontWeight.w500,
                                ),
                            buttonPosition: RadioButtonPosition.left,
                            direction: Axis.vertical,
                            radioButtonColor: Color(0xFF211DAF),
                            inactiveRadioButtonColor: Color(0xFF3D3D3D),
                            toggleable: false,
                            horizontalAlignment: WrapAlignment.start,
                            verticalAlignment: WrapCrossAlignment.start,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 40.0,
                      thickness: 1.0,
                      indent: 32.0,
                      endIndent: 32.0,
                      color: Color(0xD0ACABAB),
                    ),
                    if (_model.radioButtonValue1 == 'On-Site')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 0.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Select appointment location',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Color(0xFF222222),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        )
                            .animateOnPageLoad(
                                animationsMap['rowOnPageLoadAnimation1']!)
                            .animateOnActionTrigger(
                              animationsMap['rowOnActionTriggerAnimation1']!,
                            ),
                      ),
                    if (_model.radioButtonValue1 == 'On-Site')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            26.0, 10.0, 32.0, 0.0),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            FlutterFlowRadioButton(
                              options: [
                                'Konrad-Adenauer-Allee 1144263 Dortmund, \nGermany'
                              ].toList(),
                              onChanged: (val) => setState(() {}),
                              controller: _model.radioButtonValueController2 ??=
                                  FormFieldController<String>(null),
                              optionHeight: 45.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Color(0xFF212121),
                                    fontWeight: FontWeight.w500,
                                  ),
                              buttonPosition: RadioButtonPosition.left,
                              direction: Axis.vertical,
                              radioButtonColor: Color(0xFF211DAF),
                              inactiveRadioButtonColor: Color(0xFF3D3D3D),
                              toggleable: false,
                              horizontalAlignment: WrapAlignment.start,
                              verticalAlignment: WrapCrossAlignment.start,
                            ),
                          ].divide(SizedBox(height: 8.0)),
                        )
                            .animateOnPageLoad(
                                animationsMap['listViewOnPageLoadAnimation']!)
                            .animateOnActionTrigger(
                              animationsMap[
                                  'listViewOnActionTriggerAnimation']!,
                            ),
                      ),
                    if (_model.radioButtonValue1 == 'On-Site')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 16.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('AddAddress');
                              },
                              child: Icon(
                                Icons.add_rounded,
                                color: Color(0xFF5450E2),
                                size: 20.0,
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('AddAddress');
                              },
                              child: Text(
                                'Add new Location',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Color(0xFF5450E2),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ],
                        )
                            .animateOnPageLoad(
                                animationsMap['rowOnPageLoadAnimation2']!)
                            .animateOnActionTrigger(
                              animationsMap['rowOnActionTriggerAnimation2']!,
                            ),
                      ),
                    if (_model.radioButtonValue1 == 'On-Site')
                      Divider(
                        height: 40.0,
                        thickness: 1.0,
                        indent: 32.0,
                        endIndent: 32.0,
                        color: Color(0xD0ACABAB),
                      )
                          .animateOnPageLoad(
                              animationsMap['dividerOnPageLoadAnimation']!)
                          .animateOnActionTrigger(
                            animationsMap['dividerOnActionTriggerAnimation']!,
                          ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Sort by',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 24.0, 32.0, 0.0),
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
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color: Color(0xFF3D3D3D),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 15.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 8.0, 0.0),
                                        child: Icon(
                                          Icons.date_range_rounded,
                                          color: Color(0xFF3D3D3D),
                                          size: 20.0,
                                        ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          dateTimeFormat(
                                              'yMMMd', _model.datePicked1),
                                          'Select Date',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: Color(0xFF3D3D3D),
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w500,
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 15.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              final _datePicked2Time = await showTimePicker(
                                context: context,
                                initialTime:
                                    TimeOfDay.fromDateTime(getCurrentTimestamp),
                              );
                              if (_datePicked2Time != null) {
                                setState(() {
                                  _model.datePicked2 = DateTime(
                                    getCurrentTimestamp.year,
                                    getCurrentTimestamp.month,
                                    getCurrentTimestamp.day,
                                    _datePicked2Time.hour,
                                    _datePicked2Time.minute,
                                  );
                                });
                              }
                            },
                            child: Container(
                              width: 120.0,
                              height: 36.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                  color: Color(0xFF3D3D3D),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Select Time',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lato',
                                          color: Color(0xFF3D3D3D),
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                40.0, 0.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: Icon(
                                    Icons.access_time_sharp,
                                    color: Color(0xFF212121),
                                    size: 20.0,
                                  ),
                                ),
                                Text(
                                  'At ${dateTimeFormat('Hm', _model.datePicked2)}',
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
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          32.0, 30.0, 32.0, 20.0),
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
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 104.0,
                              height: 44.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                  color: Color(0xFF5450E2),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Cancel',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lato',
                                          color: Color(0xFF5450E2),
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
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
                                FFAppState().updateAppointmentStruct(
                                  (e) => e
                                    ..date = _model.datePicked1
                                    ..time = dateTimeFormat(
                                        'Hm', _model.datePicked2),
                                );
                              });
                              if (_model.radioButtonValue1 == 'Online') {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: AlerModalMassageWidget(),
                                    );
                                  },
                                ).then((value) => setState(() {}));

                                setState(() {
                                  FFAppState().updateAppointmentStruct(
                                    (e) => e
                                      ..appointmentType =
                                          _model.radioButtonValue1,
                                  );
                                });
                              } else {
                                if (_model.radioButtonValue1 == 'By Phone') {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child:
                                            AlerModalMassageSharePhoneWidget(),
                                      );
                                    },
                                  ).then((value) => setState(() {}));

                                  setState(() {
                                    FFAppState().updateAppointmentStruct(
                                      (e) => e
                                        ..appointmentType =
                                            _model.radioButtonValue1,
                                    );
                                  });
                                } else {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child:
                                            AlerModalMassageShareAddressWidget(),
                                      );
                                    },
                                  ).then((value) => setState(() {}));

                                  setState(() {
                                    FFAppState().updateAppointmentStruct(
                                      (e) => e
                                        ..appointmentType =
                                            _model.radioButtonValue1,
                                    );
                                  });
                                }
                              }
                            },
                            child: Container(
                              width: 129.0,
                              height: 44.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF5450E2),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.setOredit == true
                                        ? 'Edit Appointment'
                                        : 'Set Appointment',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lato',
                                          color: Colors.white,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 10.0)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
