import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/address_card_widget.dart';
import '/components/drawer_content_widget.dart';
import '/components/header_widget.dart';
import '/components/privacy_policy_widget.dart';
import '/components/side_bar_left_sign_up_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:async';
import 'dart:io';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'contactdata1_model.dart';
export 'contactdata1_model.dart';

class Contactdata1Widget extends StatefulWidget {
  const Contactdata1Widget({
    super.key,
    bool? taskCreation,
    bool? addAnother,
  })  : this.taskCreation = taskCreation ?? false,
        this.addAnother = addAnother ?? false;

  final bool taskCreation;
  final bool addAnother;

  @override
  State<Contactdata1Widget> createState() => _Contactdata1WidgetState();
}

class _Contactdata1WidgetState extends State<Contactdata1Widget>
    with TickerProviderStateMixin {
  late Contactdata1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  final animationsMap = {
    'rowOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, -10.0),
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
          duration: 600.ms,
          begin: Offset(0.0, -10.0),
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
          duration: 600.ms,
          begin: Offset(0.0, -10.0),
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
          duration: 600.ms,
          begin: Offset(0.0, -10.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, -10.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'rowOnActionTriggerAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, -10.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, -10.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'rowOnActionTriggerAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, -10.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, -10.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'rowOnActionTriggerAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, -10.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, -10.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'rowOnActionTriggerAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, -10.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Contactdata1Model());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.streetController ??= TextEditingController();
    _model.streetFocusNode ??= FocusNode();

    _model.noController ??= TextEditingController();
    _model.noFocusNode ??= FocusNode();

    _model.postalCodeController ??= TextEditingController();
    _model.postalCodeFocusNode ??= FocusNode();

    _model.cityController ??= TextEditingController();
    _model.cityFocusNode ??= FocusNode();

    _model.stateController ??= TextEditingController();
    _model.stateFocusNode ??= FocusNode();

    _model.countryController ??= TextEditingController();
    _model.countryFocusNode ??= FocusNode();

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
            child: WebViewAware(
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
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                valueOrDefault<double>(
                  () {
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                      return 0.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointMedium) {
                      return 0.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointLarge) {
                      return FFAppConstants.veryLargCardLR.toDouble();
                    } else {
                      return FFAppConstants.veryLargCardLR.toDouble();
                    }
                  }(),
                  0.0,
                ),
                valueOrDefault<double>(
                  () {
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                      return 0.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointMedium) {
                      return 0.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointLarge) {
                      return FFAppConstants.veryLargCardUD.toDouble();
                    } else {
                      return FFAppConstants.veryLargCardUD.toDouble();
                    }
                  }(),
                  0.0,
                ),
                valueOrDefault<double>(
                  () {
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                      return 0.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointMedium) {
                      return 0.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointLarge) {
                      return FFAppConstants.veryLargCardLR.toDouble();
                    } else {
                      return FFAppConstants.veryLargCardLR.toDouble();
                    }
                  }(),
                  0.0,
                ),
                valueOrDefault<double>(
                  () {
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                      return 0.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointMedium) {
                      return 0.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointLarge) {
                      return FFAppConstants.veryLargCardUD.toDouble();
                    } else {
                      return FFAppConstants.veryLargCardUD.toDouble();
                    }
                  }(),
                  0.0,
                )),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4.0,
                    color: Color(0x33000000),
                    offset: Offset(0.0, 0.0),
                    spreadRadius: 2.0,
                  )
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                    tabletLandscape: false,
                  ))
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: wrapWithModel(
                            model: _model.sideBarLeftSignUpModel,
                            updateCallback: () => setState(() {}),
                            child: SideBarLeftSignUpWidget(
                              selectedColor: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                    tabletLandscape: false,
                  ))
                    VerticalDivider(
                      width: 1.0,
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).tertiary,
                    ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    if (responsiveVisibility(
                                      context: context,
                                      desktop: false,
                                    ))
                                      wrapWithModel(
                                        model: _model.headerModel,
                                        updateCallback: () => setState(() {}),
                                        child: HeaderWidget(
                                          openDrawer: () async {
                                            scaffoldKey.currentState!
                                                .openDrawer();
                                          },
                                        ),
                                      ),
                                  ],
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0,
                                            valueOrDefault<double>(
                                              () {
                                                if (MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall) {
                                                  return 32.0;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointMedium) {
                                                  return 32.0;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointLarge) {
                                                  return 94.0;
                                                } else {
                                                  return 94.0;
                                                }
                                              }(),
                                              0.0,
                                            ),
                                            15.0,
                                            0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Please add your addresses',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
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
                                            15.0, 10.0, 15.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Enter your address, postal code or city',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Lato',
                                                    color: Color(0xFF292929),
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.w500,
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
                                          children: [
                                            Text(
                                              'Address',
                                              style: FlutterFlowTheme.of(
                                                      context)
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
                                              child: FlutterFlowPlacePicker(
                                                iOSGoogleMapsApiKey:
                                                    'AIzaSyCgpzFUjgw8UZBnXqMU1RwIXgsyX7BRh30',
                                                androidGoogleMapsApiKey:
                                                    'AIzaSyDwVp7h1uFnc_P0AZt8hfqC3mXN9ljCT80',
                                                webGoogleMapsApiKey:
                                                    'AIzaSyCyPQNRa7hLuEHr1tggvht9gV5kK1tHjXI',
                                                onSelect: (place) async {
                                                  setState(() =>
                                                      _model.placePickerValue =
                                                          place);
                                                },
                                                defaultText: 'Select Location',
                                                icon: Icon(
                                                  Icons.place_outlined,
                                                  color: Color(0xFF212121),
                                                  size: 18.0,
                                                ),
                                                buttonOptions: FFButtonOptions(
                                                  width: 200.0,
                                                  height: 36.0,
                                                  color: Colors.white,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color:
                                                            Color(0xFF3D3D3D),
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.0),
                                                ),
                                              ),
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
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  setState(() {
                                                    _model.mapORno = 1;
                                                  });
                                                  if (!functions
                                                      .isLatLngNullIsland(_model
                                                          .placePickerValue
                                                          .latLng)) {
                                                    setState(() {
                                                      FFAppState().showAddress =
                                                          false;
                                                    });
                                                    setState(() {
                                                      _model.postalCodeController
                                                              ?.text =
                                                          _model
                                                              .placePickerValue
                                                              .zipCode;
                                                    });
                                                    setState(() {
                                                      _model.cityController
                                                              ?.text =
                                                          _model
                                                              .placePickerValue
                                                              .city;
                                                    });
                                                    setState(() {
                                                      _model.stateController
                                                              ?.text =
                                                          _model
                                                              .placePickerValue
                                                              .state;
                                                    });
                                                    setState(() {
                                                      _model.countryController
                                                              ?.text =
                                                          _model
                                                              .placePickerValue
                                                              .country;
                                                    });
                                                    setState(() {
                                                      _model.streetController
                                                              ?.text =
                                                          _model
                                                              .placePickerValue
                                                              .address;
                                                    });
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return WebViewAware(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  PrivacyPolicyWidget(
                                                                latLong: _model
                                                                    .placePickerValue
                                                                    .latLng,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            title: Text(
                                                                'Can\'t load address'),
                                                            content: Text(
                                                                'your address is not accurate enough'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  }
                                                },
                                                child: Container(
                                                  width: 150.0,
                                                  height: 36.0,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.0),
                                                    border: Border.all(
                                                      color: _model.mapORno == 1
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'View in map',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Lato',
                                                              color: _model
                                                                          .mapORno ==
                                                                      1
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                              fontSize: 13.0,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  setState(() {
                                                    _model.mapORno = 2;
                                                  });
                                                  if (!functions
                                                      .isLatLngNullIsland(_model
                                                          .placePickerValue
                                                          .latLng)) {
                                                    setState(() {
                                                      FFAppState().showAddress =
                                                          false;
                                                    });
                                                    setState(() {
                                                      _model.postalCodeController
                                                              ?.text =
                                                          _model
                                                              .placePickerValue
                                                              .zipCode;
                                                    });
                                                    setState(() {
                                                      _model.cityController
                                                              ?.text =
                                                          _model
                                                              .placePickerValue
                                                              .city;
                                                    });
                                                    setState(() {
                                                      _model.stateController
                                                              ?.text =
                                                          _model
                                                              .placePickerValue
                                                              .state;
                                                    });
                                                    setState(() {
                                                      _model.countryController
                                                              ?.text =
                                                          _model
                                                              .placePickerValue
                                                              .country;
                                                    });
                                                    setState(() {
                                                      _model.streetController
                                                              ?.text =
                                                          _model
                                                              .placePickerValue
                                                              .address;
                                                    });
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return WebViewAware(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  PrivacyPolicyWidget(
                                                                latLong: _model
                                                                    .placePickerValue
                                                                    .latLng,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            title: Text(
                                                                'Can\'t load address'),
                                                            content: Text(
                                                                'your address is not accurate enough'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  }
                                                },
                                                child: Container(
                                                  width: 150.0,
                                                  height: 36.0,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.0),
                                                    border: Border.all(
                                                      color: _model.mapORno == 2
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'I\'m sure',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Lato',
                                                              color: _model
                                                                          .mapORno ==
                                                                      2
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                              fontSize: 13.0,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 12.0)),
                                        ),
                                      ),
                                      if (FFAppState().showAddress)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 25.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                32.0,
                                                                20.0,
                                                                32.0,
                                                                0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: Text(
                                                                  'Street',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .justify,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Lato',
                                                                        color: Color(
                                                                            0xFF292929),
                                                                        fontSize:
                                                                            15.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .streetController,
                                                                    focusNode:
                                                                        _model
                                                                            .streetFocusNode,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      isDense:
                                                                          true,
                                                                      labelStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lato',
                                                                            color:
                                                                                Color(0xFF212121),
                                                                          ),
                                                                      hintStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lato',
                                                                            color:
                                                                                Color(0xFF212121),
                                                                          ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(2.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(2.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0xFFE8083F),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(2.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0xFFE8083F),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(2.0),
                                                                      ),
                                                                      contentPadding:
                                                                          EdgeInsets.all(
                                                                              16.0),
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lato',
                                                                          color:
                                                                              Color(0xFF212121),
                                                                          fontSize:
                                                                              14.0,
                                                                        ),
                                                                    validator: _model
                                                                        .streetControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: Text(
                                                                  'No',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .justify,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Lato',
                                                                        color: Color(
                                                                            0xFF292929),
                                                                        fontSize:
                                                                            15.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 96.0,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .noController,
                                                                  focusNode: _model
                                                                      .noFocusNode,
                                                                  textInputAction:
                                                                      TextInputAction
                                                                          .next,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lato',
                                                                          color:
                                                                              Color(0xFF212121),
                                                                        ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lato',
                                                                          color:
                                                                              Color(0xFF3D3D3D),
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              2.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              2.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0xFFE8083F),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              2.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0xFFE8083F),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              2.0),
                                                                    ),
                                                                    contentPadding:
                                                                        EdgeInsets.all(
                                                                            16.0),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Lato',
                                                                        color: Color(
                                                                            0xFF212121),
                                                                        fontSize:
                                                                            14.0,
                                                                      ),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                  validator: _model
                                                                      .noControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                        .animateOnPageLoad(
                                                            animationsMap[
                                                                'rowOnPageLoadAnimation1']!)
                                                        .animateOnActionTrigger(
                                                          animationsMap[
                                                              'rowOnActionTriggerAnimation1']!,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                32.0,
                                                                16.0,
                                                                32.0,
                                                                0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: Text(
                                                                'Postal Code',
                                                                textAlign:
                                                                    TextAlign
                                                                        .justify,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lato',
                                                                      color: Color(
                                                                          0xFF292929),
                                                                      fontSize:
                                                                          15.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 136.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Container(
                                                                width: 96.0,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .postalCodeController,
                                                                  focusNode: _model
                                                                      .postalCodeFocusNode,
                                                                  textInputAction:
                                                                      TextInputAction
                                                                          .next,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lato',
                                                                          color:
                                                                              Color(0xFF212121),
                                                                        ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lato',
                                                                          color:
                                                                              Color(0xFF212121),
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              2.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              2.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0xFFE8083F),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              2.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0xFFE8083F),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              2.0),
                                                                    ),
                                                                    contentPadding:
                                                                        EdgeInsets.all(
                                                                            16.0),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Lato',
                                                                        color: Color(
                                                                            0xFF212121),
                                                                        fontSize:
                                                                            14.0,
                                                                      ),
                                                                  validator: _model
                                                                      .postalCodeControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          3.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child: Text(
                                                                    'City',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .justify,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lato',
                                                                          color:
                                                                              Color(0xFF292929),
                                                                          fontSize:
                                                                              15.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .cityController,
                                                                    focusNode:
                                                                        _model
                                                                            .cityFocusNode,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    readOnly:
                                                                        true,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      isDense:
                                                                          true,
                                                                      labelStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMedium,
                                                                      hintStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lato',
                                                                            color:
                                                                                Color(0xFF212121),
                                                                          ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(2.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(2.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0xFFE8083F),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(2.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0xFFE8083F),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(2.0),
                                                                      ),
                                                                      contentPadding:
                                                                          EdgeInsets.all(
                                                                              16.0),
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lato',
                                                                          color:
                                                                              Color(0xFF212121),
                                                                          fontSize:
                                                                              14.0,
                                                                        ),
                                                                    validator: _model
                                                                        .cityControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                        .animateOnPageLoad(
                                                            animationsMap[
                                                                'rowOnPageLoadAnimation2']!)
                                                        .animateOnActionTrigger(
                                                          animationsMap[
                                                              'rowOnActionTriggerAnimation2']!,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                32.0,
                                                                16.0,
                                                                32.0,
                                                                0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'State',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lato',
                                                                color: Color(
                                                                    0xFF292929),
                                                                fontSize: 15.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ],
                                                    )
                                                        .animateOnPageLoad(
                                                            animationsMap[
                                                                'rowOnPageLoadAnimation3']!)
                                                        .animateOnActionTrigger(
                                                          animationsMap[
                                                              'rowOnActionTriggerAnimation3']!,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                32.0,
                                                                10.0,
                                                                32.0,
                                                                0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            width: 184.0,
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .stateController,
                                                              focusNode: _model
                                                                  .stateFocusNode,
                                                              textInputAction:
                                                                  TextInputAction
                                                                      .next,
                                                              readOnly: true,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                isDense: true,
                                                                labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium,
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lato',
                                                                      color: Color(
                                                                          0xFF212121),
                                                                    ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiary,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              2.0),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              2.0),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0xFFE8083F),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              2.0),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0xFFE8083F),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              2.0),
                                                                ),
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            16.0),
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
                                                              validator: _model
                                                                  .stateControllerValidator
                                                                  .asValidator(
                                                                      context),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                        .animateOnPageLoad(
                                                            animationsMap[
                                                                'rowOnPageLoadAnimation4']!)
                                                        .animateOnActionTrigger(
                                                          animationsMap[
                                                              'rowOnActionTriggerAnimation4']!,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                32.0,
                                                                16.0,
                                                                32.0,
                                                                0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'Country',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lato',
                                                                color: Color(
                                                                    0xFF292929),
                                                                fontSize: 15.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ],
                                                    )
                                                        .animateOnPageLoad(
                                                            animationsMap[
                                                                'rowOnPageLoadAnimation5']!)
                                                        .animateOnActionTrigger(
                                                          animationsMap[
                                                              'rowOnActionTriggerAnimation5']!,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                32.0,
                                                                10.0,
                                                                32.0,
                                                                0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            width: 184.0,
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .countryController,
                                                              focusNode: _model
                                                                  .countryFocusNode,
                                                              textInputAction:
                                                                  TextInputAction
                                                                      .next,
                                                              readOnly: true,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                isDense: true,
                                                                labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium,
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lato',
                                                                      color: Color(
                                                                          0xFF212121),
                                                                    ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiary,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              2.0),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              2.0),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0xFFE8083F),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              2.0),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0xFFE8083F),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              2.0),
                                                                ),
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            16.0),
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
                                                              validator: _model
                                                                  .countryControllerValidator
                                                                  .asValidator(
                                                                      context),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                        .animateOnPageLoad(
                                                            animationsMap[
                                                                'rowOnPageLoadAnimation6']!)
                                                        .animateOnActionTrigger(
                                                          animationsMap[
                                                              'rowOnActionTriggerAnimation6']!,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                if (!(isWeb
                                    ? MediaQuery.viewInsetsOf(context).bottom >
                                        0
                                    : _isKeyboardVisible))
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 5.0,
                                              color: () {
                                                if (MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall) {
                                                  return Color(0x33000000);
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointMedium) {
                                                  return Color(0x33000000);
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointLarge) {
                                                  return Colors.transparent;
                                                } else {
                                                  return Colors.transparent;
                                                }
                                              }(),
                                              offset: Offset(5.0, 5.0),
                                              spreadRadius: 10.0,
                                            )
                                          ],
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  32.0, 0.0, 32.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              if (widget.taskCreation)
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.safePop();
                                                  },
                                                  child: Container(
                                                    width: 104.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x00FFFFFF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                      border: Border.all(
                                                        color: Colors.white,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Discard',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lato',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                fontSize: 14.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              if (!widget.taskCreation)
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    if (FFAppState()
                                                            .UserInformation
                                                            .role ==
                                                        'Poster') {
                                                      context.pushNamed(
                                                          'User_profile');
                                                    } else {
                                                      context.pushNamed(
                                                        'Add_another_education',
                                                        queryParameters: {
                                                          'isSignUp':
                                                              serializeParam(
                                                            true,
                                                            ParamType.bool,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    }
                                                  },
                                                  child: Text(
                                                    'I\'ll do it later',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          color:
                                                              Color(0xFF8A8A8A),
                                                          fontSize: 14.0,
                                                        ),
                                                  ),
                                                ),
                                              if (!widget.taskCreation)
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    var _shouldSetState = false;
                                                    setState(() {
                                                      FFAppState()
                                                          .updateAddressStruct(
                                                        (e) => e
                                                          ..address = _model
                                                              .placePickerValue
                                                              .address
                                                          ..city = _model
                                                              .placePickerValue
                                                              .city
                                                          ..country = _model
                                                              .placePickerValue
                                                              .country
                                                          ..postalCode = _model
                                                              .placePickerValue
                                                              .zipCode
                                                          ..state = _model
                                                              .placePickerValue
                                                              .state
                                                          ..streetAddress = _model
                                                              .placePickerValue
                                                              .address
                                                          ..locationLat = functions
                                                              .getLatLngAsString(
                                                                  _model
                                                                      .placePickerValue
                                                                      .latLng,
                                                                  false)
                                                          ..locationLng = functions
                                                              .getLatLngAsString(
                                                                  _model
                                                                      .placePickerValue
                                                                      .latLng,
                                                                  true),
                                                      );
                                                    });
                                                    _model.createAddress =
                                                        await TaskerpageBackendGroup
                                                            .addressCreateCall
                                                            .call(
                                                      address: FFAppState()
                                                          .Address
                                                          .address,
                                                      city: FFAppState()
                                                          .Address
                                                          .city,
                                                      country: FFAppState()
                                                          .Address
                                                          .country,
                                                      postalCode: FFAppState()
                                                          .Address
                                                          .postalCode,
                                                      state: FFAppState()
                                                          .Address
                                                          .state,
                                                      aptNo: FFAppState()
                                                          .Address
                                                          .aptNo,
                                                      streetAddress:
                                                          FFAppState()
                                                              .Address
                                                              .streetAddress,
                                                      latitude: functions
                                                          .getLatLngAsString(
                                                              FFAppState()
                                                                  .centerMap,
                                                              false),
                                                      longitude: functions
                                                          .getLatLngAsString(
                                                              FFAppState()
                                                                  .centerMap,
                                                              true),
                                                      isMainAddress: 0,
                                                      customerProfile:
                                                          getJsonField(
                                                        FFAppState()
                                                            .userProfile,
                                                        r'''$.data.name''',
                                                      ).toString(),
                                                      apiGlobalKey:
                                                          FFAppState().apiKey,
                                                    );
                                                    _shouldSetState = true;
                                                    if ((_model.createAddress
                                                            ?.succeeded ??
                                                        true)) {
                                                      _model.apiResultpek =
                                                          await TaskerpageBackendGroup
                                                              .userProfileMeCall
                                                              .call(
                                                        apiGlobalKey:
                                                            FFAppState().apiKey,
                                                      );
                                                      _shouldSetState = true;
                                                      if ((_model.apiResultpek
                                                              ?.succeeded ??
                                                          true)) {
                                                        if ('Tasker' ==
                                                            '${getJsonField(
                                                              (_model.apiResultpek
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.data.role''',
                                                            ).toString()}') {
                                                          if (widget
                                                              .addAnother) {
                                                            context.safePop();
                                                          } else {
                                                            context.pushNamed(
                                                              'Contactdata-2',
                                                              queryParameters: {
                                                                'isSignUp':
                                                                    serializeParam(
                                                                  true,
                                                                  ParamType
                                                                      .bool,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          }

                                                          if (_shouldSetState)
                                                            setState(() {});
                                                          return;
                                                        } else if ('Poster' ==
                                                            '${getJsonField(
                                                              (_model.apiResultpek
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.data.role''',
                                                            ).toString()}') {
                                                          context.pushNamed(
                                                            'Contactdata-2',
                                                            queryParameters: {
                                                              'isSignUp':
                                                                  serializeParam(
                                                                true,
                                                                ParamType.bool,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        } else {
                                                          if (_shouldSetState)
                                                            setState(() {});
                                                          return;
                                                        }

                                                        if (_shouldSetState)
                                                          setState(() {});
                                                        return;
                                                      } else {
                                                        if (_shouldSetState)
                                                          setState(() {});
                                                        return;
                                                      }
                                                    } else {
                                                      if (_shouldSetState)
                                                        setState(() {});
                                                      return;
                                                    }

                                                    if (_shouldSetState)
                                                      setState(() {});
                                                  },
                                                  child: Container(
                                                    width: 104.0,
                                                    height: 36.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              1.0),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Save',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lato',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14.0,
                                                              ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons
                                                                .arrow_forward_ios_rounded,
                                                            color: Colors.white,
                                                            size: 10.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              if (widget.taskCreation)
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    var _shouldSetState = false;
                                                    setState(() {
                                                      FFAppState()
                                                          .updateAddressStruct(
                                                        (e) => e
                                                          ..address = _model
                                                              .placePickerValue
                                                              .address
                                                          ..city = _model
                                                              .placePickerValue
                                                              .city
                                                          ..country = _model
                                                              .placePickerValue
                                                              .country
                                                          ..postalCode = _model
                                                                          .placePickerValue
                                                                          .zipCode !=
                                                                      null &&
                                                                  _model.placePickerValue.zipCode !=
                                                                      ''
                                                              ? _model
                                                                  .placePickerValue
                                                                  .zipCode
                                                              : _model
                                                                  .postalCodeController
                                                                  .text
                                                          ..state = _model
                                                              .placePickerValue
                                                              .state
                                                          ..streetAddress = _model
                                                              .placePickerValue
                                                              .address
                                                          ..locationLat = functions
                                                              .getLatLngAsString(
                                                                  _model
                                                                      .placePickerValue
                                                                      .latLng,
                                                                  false)
                                                          ..locationLng = functions
                                                              .getLatLngAsString(
                                                                  _model
                                                                      .placePickerValue
                                                                      .latLng,
                                                                  true)
                                                          ..aptNo = _model
                                                              .noController
                                                              .text,
                                                      );
                                                    });
                                                    _model.createAddress1 =
                                                        await TaskerpageBackendGroup
                                                            .addressCreateCall
                                                            .call(
                                                      address: FFAppState()
                                                          .Address
                                                          .address,
                                                      city: FFAppState()
                                                          .Address
                                                          .city,
                                                      country: FFAppState()
                                                          .Address
                                                          .country,
                                                      postalCode: FFAppState()
                                                          .Address
                                                          .postalCode,
                                                      state: FFAppState()
                                                          .Address
                                                          .state,
                                                      aptNo: FFAppState()
                                                          .Address
                                                          .aptNo,
                                                      streetAddress:
                                                          FFAppState()
                                                              .Address
                                                              .streetAddress,
                                                      latitude: functions
                                                          .getLatLngAsString(
                                                              FFAppState()
                                                                  .centerMap,
                                                              false),
                                                      longitude: functions
                                                          .getLatLngAsString(
                                                              FFAppState()
                                                                  .centerMap,
                                                              true),
                                                      isMainAddress: 0,
                                                      customerProfile:
                                                          getJsonField(
                                                        FFAppState()
                                                            .userProfile,
                                                        r'''$.data.name''',
                                                      ).toString(),
                                                      apiGlobalKey:
                                                          FFAppState().apiKey,
                                                    );
                                                    _shouldSetState = true;
                                                    if ((_model.createAddress1
                                                            ?.succeeded ??
                                                        true)) {
                                                      context.safePop();
                                                    } else {
                                                      if (_shouldSetState)
                                                        setState(() {});
                                                      return;
                                                    }

                                                    if (_shouldSetState)
                                                      setState(() {});
                                                  },
                                                  child: Container(
                                                    width: 104.0,
                                                    height: 36.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              1.0),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons.add_outlined,
                                                            color: Colors.white,
                                                            size: 10.0,
                                                          ),
                                                        ),
                                                        Text(
                                                          'Add',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lato',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14.0,
                                                              ),
                                                        ),
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
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                    tabletLandscape: false,
                  ))
                    VerticalDivider(
                      width: 1.0,
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).tertiary,
                    ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                    tabletLandscape: false,
                  ))
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFF9F9F9),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (false)
                                    SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    32.0, 16.0, 32.0, 22.0),
                                            child:
                                                FutureBuilder<ApiCallResponse>(
                                              future: (_model
                                                          .apiRequestCompleter2 ??=
                                                      Completer<
                                                          ApiCallResponse>()
                                                        ..complete(
                                                            TaskerpageBackendGroup
                                                                .myAddressesCall
                                                                .call(
                                                          apiGlobalKey:
                                                              FFAppState()
                                                                  .apiKey,
                                                          fields:
                                                              '[\"is_main_address\",\"name\",\"address\"]',
                                                          filters:
                                                              '[[\"customer_profile\",\"=\",\"${getJsonField(
                                                            FFAppState()
                                                                .userProfile,
                                                            r'''$.data.name''',
                                                          ).toString()}\"],[\"is_main_address\",\"=\",\"1\"]]',
                                                        )))
                                                  .future,
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 35.0,
                                                      height: 35.0,
                                                      child: SpinKitThreeBounce(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 35.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final listViewMyAddressesResponse =
                                                    snapshot.data!;
                                                return Builder(
                                                  builder: (context) {
                                                    final myMainAddresses =
                                                        getJsonField(
                                                      listViewMyAddressesResponse
                                                          .jsonBody,
                                                      r'''$.data''',
                                                    ).toList().take(1).toList();
                                                    return ListView.separated(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount: myMainAddresses
                                                          .length,
                                                      separatorBuilder: (_,
                                                              __) =>
                                                          SizedBox(height: 8.0),
                                                      itemBuilder: (context,
                                                          myMainAddressesIndex) {
                                                        final myMainAddressesItem =
                                                            myMainAddresses[
                                                                myMainAddressesIndex];
                                                        return AddressCardWidget(
                                                          key: Key(
                                                              'Keypbk_${myMainAddressesIndex}_of_${myMainAddresses.length}'),
                                                          address:
                                                              myMainAddressesItem,
                                                          action: () async {
                                                            setState(() => _model
                                                                    .apiRequestCompleter2 =
                                                                null);
                                                            await _model
                                                                .waitForApiRequestCompleted2();
                                                          },
                                                        );
                                                      },
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    32.0, 0.0, 32.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Other addresses',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    32.0, 8.0, 32.0, 0.0),
                                            child:
                                                FutureBuilder<ApiCallResponse>(
                                              future: (_model
                                                          .apiRequestCompleter1 ??=
                                                      Completer<
                                                          ApiCallResponse>()
                                                        ..complete(
                                                            TaskerpageBackendGroup
                                                                .myAddressesCall
                                                                .call(
                                                          apiGlobalKey:
                                                              FFAppState()
                                                                  .apiKey,
                                                          fields:
                                                              '[\"is_main_address\",\"name\",\"address\"]',
                                                          filters:
                                                              '[[\"customer_profile\",\"=\",\"${getJsonField(
                                                            FFAppState()
                                                                .userProfile,
                                                            r'''$.data.name''',
                                                          ).toString()}\"],[\"is_main_address\",\"=\",\"0\"]]',
                                                        )))
                                                  .future,
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 35.0,
                                                      height: 35.0,
                                                      child: SpinKitThreeBounce(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 35.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final listViewMyAddressesResponse =
                                                    snapshot.data!;
                                                return Builder(
                                                  builder: (context) {
                                                    final myMainAddresses =
                                                        getJsonField(
                                                      listViewMyAddressesResponse
                                                          .jsonBody,
                                                      r'''$.data''',
                                                    ).toList();
                                                    return ListView.separated(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount: myMainAddresses
                                                          .length,
                                                      separatorBuilder: (_,
                                                              __) =>
                                                          SizedBox(height: 8.0),
                                                      itemBuilder: (context,
                                                          myMainAddressesIndex) {
                                                        final myMainAddressesItem =
                                                            myMainAddresses[
                                                                myMainAddressesIndex];
                                                        return AddressCardWidget(
                                                          key: Key(
                                                              'Keydfn_${myMainAddressesIndex}_of_${myMainAddresses.length}'),
                                                          address:
                                                              myMainAddressesItem,
                                                          action: () async {
                                                            setState(() => _model
                                                                    .apiRequestCompleter1 =
                                                                null);
                                                            await _model
                                                                .waitForApiRequestCompleted1();
                                                            setState(() => _model
                                                                    .apiRequestCompleter2 =
                                                                null);
                                                            await _model
                                                                .waitForApiRequestCompleted2();
                                                          },
                                                        );
                                                      },
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    32.0, 20.0, 32.0, 32.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'Contactdata-1',
                                                      queryParameters: {
                                                        'addAnother':
                                                            serializeParam(
                                                          true,
                                                          ParamType.bool,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 186.0,
                                                    height: 36.0,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          '+ Add another addresses',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lato',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
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
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 104.4, 0.0, 0.0),
                                          child: Text(
                                            'Your address will be kept private.\n \nIt helps a lot to find what you want faster!',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lato',
                                                  color: Color(0xFF494949),
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 96.3, 0.0, 0.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.asset(
                                              'assets/images/Group_1160.png',
                                              width: 370.0,
                                              height: 287.0,
                                              fit: BoxFit.none,
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
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
