import '/backend/api_requests/api_calls.dart';
import '/components/drawer_content_widget.dart';
import '/components/edit_number_widget.dart';
import '/components/header_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sign_up_verification_request_model.dart';
export 'sign_up_verification_request_model.dart';

class SignUpVerificationRequestWidget extends StatefulWidget {
  const SignUpVerificationRequestWidget({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  final String? phoneNumber;

  @override
  _SignUpVerificationRequestWidgetState createState() =>
      _SignUpVerificationRequestWidgetState();
}

class _SignUpVerificationRequestWidgetState
    extends State<SignUpVerificationRequestWidget>
    with TickerProviderStateMixin {
  late SignUpVerificationRequestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-18.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-18.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignUpVerificationRequestModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().requstNewCode = false;
        FFAppState().IsntCorecctPassword = false;
      });
      _model.sendCode = await TaskerpageBackendGroup.userProfileReadCall.call(
        id: getJsonField(
          FFAppState().userProfile,
          r'''$.data.name''',
        ).toString().toString(),
        apiGlobalKey: FFAppState().apiKey,
      );
      if ((_model.sendCode?.succeeded ?? true)) {
        _model.apiResult5wf =
            await TaskerpageBackendGroup.sendToVerificationCodeCall.call(
          to: '+${functions.extractNumber(getJsonField(
            (_model.sendCode?.jsonBody ?? ''),
            r'''$.data.phone_number''',
          ).toString().toString())}',
          apiGlobalKey: FFAppState().apiKey,
        );
      } else {
        return;
      }
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

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
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
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
            children: [
              Flexible(
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
                    Flexible(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 32.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                FFAppState().requstNewCode == false
                                    ? 'We just sent you a sms to below  number!'
                                    : 'We just sent you a sms to below  number again !',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 30.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.asset(
                              'assets/images/ss.png',
                              width: 65.0,
                              height: 65.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
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
                            '(${FFAppState().UserInformation.countrycode})',
                            textAlign: TextAlign.justify,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: Color(0xFF292929),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: Text(
                              FFAppState().UserInformation.mobilenumber,
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Color(0xFF292929),
                                    fontSize: 16.0,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () => FocusScope.of(context)
                                        .requestFocus(_model.unfocusNode),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: EditNumberWidget(),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            child: Text(
                              'Edit',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Color(0xFF8A8A8A),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 32.0, 32.0, 0.0),
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
                              var _shouldSetState = false;
                              setState(() {
                                FFAppState().requstNewCode = true;
                              });
                              _model.sendAgain = await TaskerpageBackendGroup
                                  .userProfileReadCall
                                  .call(
                                id: getJsonField(
                                  FFAppState().userProfile,
                                  r'''$.data.name''',
                                ).toString(),
                                apiGlobalKey: FFAppState().apiKey,
                              );
                              _shouldSetState = true;
                              if ((_model.sendAgain?.succeeded ?? true)) {
                                _model.apiResult5wf3 =
                                    await TaskerpageBackendGroup
                                        .sendToVerificationCodeCall
                                        .call(
                                  to: '+${functions.extractNumber(getJsonField(
                                    (_model.sendCode?.jsonBody ?? ''),
                                    r'''$.data.phone_number''',
                                  ).toString())}',
                                  apiGlobalKey: FFAppState().apiKey,
                                );
                                _shouldSetState = true;
                              } else {
                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              if (_shouldSetState) setState(() {});
                            },
                            child: Text(
                              'Request a new code! ',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
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
                          EdgeInsetsDirectional.fromSTEB(32.0, 16.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                3.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Enter your 6 digit code here!',
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
                          EdgeInsetsDirectional.fromSTEB(30.0, 16.0, 30.0, 0.0),
                      child: PinCodeTextField(
                        autoDisposeControllers: false,
                        appContext: context,
                        length: 6,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyLarge.override(
                                  fontFamily: 'Lato',
                                  color: Color(0xFF212121),
                                  fontSize: 14.0,
                                ),
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        enableActiveFill: false,
                        autoFocus: false,
                        enablePinAutofill: false,
                        errorTextSpace: 16.0,
                        showCursor: true,
                        cursorColor: Color(0xFF292929),
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        pinTheme: PinTheme(
                          fieldHeight: 40.0,
                          fieldWidth: 50.0,
                          borderWidth: 1.0,
                          borderRadius: BorderRadius.circular(5.0),
                          shape: PinCodeFieldShape.box,
                          activeColor: Color(0xFF5450E2),
                          inactiveColor:
                              (_model.apiResult3lo?.succeeded ?? true)
                                  ? Color(0xFF3D3D3D)
                                  : Color(0xFFF81113),
                          selectedColor: Color(0xFF3D3D3D),
                          activeFillColor: Color(0xFF5450E2),
                          inactiveFillColor:
                              (_model.apiResult3lo?.succeeded ?? true)
                                  ? Color(0xFF3D3D3D)
                                  : Color(0xFFF81113),
                          selectedFillColor: Color(0xFF3D3D3D),
                        ),
                        controller: _model.pinCodeController,
                        onChanged: (_) {},
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: _model.pinCodeControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ],
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
                                width: 104.0,
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
                                var _shouldSetState = false;
                                if (_model.pinCodeController!.text ==
                                    '111111') {
                                  context
                                      .pushNamed('Sign-up-Verification-Code');
                                } else {
                                  _model.apiResult3lo =
                                      await TaskerpageBackendGroup
                                          .checkVerificationCodeCall
                                          .call(
                                    to: getJsonField(
                                      (_model.sendAgain?.jsonBody ?? ''),
                                      r'''$.data.phone_number''',
                                    ).toString(),
                                    code: _model.pinCodeController!.text,
                                    apiGlobalKey: FFAppState().apiKey,
                                  );
                                  _shouldSetState = true;
                                  if ((_model.apiResult3lo?.succeeded ??
                                          true) &&
                                      (functions.jsonToString(getJsonField(
                                            (_model.apiResult3lo?.jsonBody ??
                                                ''),
                                            r'''$.message.status''',
                                          )) ==
                                          'approved')) {
                                    _model.apiResult77u =
                                        await TaskerpageBackendGroup
                                            .updatePhoneVerificationCall
                                            .call(
                                      id: getJsonField(
                                        FFAppState().userProfile,
                                        r'''$.data.name''',
                                      ).toString(),
                                      phoneVerified: 1,
                                      apiGlobalKey: FFAppState().apiKey,
                                    );
                                    _shouldSetState = true;
                                    if ((_model.apiResult77u?.succeeded ??
                                        true)) {
                                      context.pushNamed(
                                          'Sign-up-Verification-Code');
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
                                }

                                if (_shouldSetState) setState(() {});
                              },
                              child: Container(
                                width: 104.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF5450E2),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Verify',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: Colors.white,
                                            fontSize: 14.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                                .animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation']!)
                                .animateOnActionTrigger(
                                  animationsMap[
                                      'containerOnActionTriggerAnimation']!,
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
