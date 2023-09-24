import '/backend/api_requests/api_calls.dart';
import '/components/address_card_widget.dart';
import '/components/drawer_content_widget.dart';
import '/components/footer3_widget.dart';
import '/components/header_widget.dart';
import '/components/navigate_back_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'contactdata2_model.dart';
export 'contactdata2_model.dart';

class Contactdata2Widget extends StatefulWidget {
  const Contactdata2Widget({Key? key}) : super(key: key);

  @override
  _Contactdata2WidgetState createState() => _Contactdata2WidgetState();
}

class _Contactdata2WidgetState extends State<Contactdata2Widget> {
  late Contactdata2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Contactdata2Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().DeleteAddressBackGroundColor = false;
      });
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: wrapWithModel(
                              model: _model.navigateBackModel,
                              updateCallback: () => setState(() {}),
                              child: NavigateBackWidget(
                                text: 'Addresses',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                32.0, 8.0, 32.0, 24.0),
                            child: FutureBuilder<ApiCallResponse>(
                              future: (_model.apiRequestCompleter ??=
                                      Completer<ApiCallResponse>()
                                        ..complete(TaskerpageBackendGroup
                                            .myAddressesCall
                                            .call(
                                          apiGlobalKey: FFAppState().apiKey,
                                          fields:
                                              '[\"is_main_address\",\"name\",\"address\"]',
                                          filters:
                                              '[[\"customer_profile\",\"=\",\"${getJsonField(
                                            FFAppState().userProfile,
                                            r'''$.data.name''',
                                          ).toString()}\"]]',
                                        )))
                                  .future,
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitThreeBounce(
                                        color: Color(0xFF5450E2),
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                final listViewMyAddressesResponse =
                                    snapshot.data!;
                                return Builder(
                                  builder: (context) {
                                    final myMainAddresses = getJsonField(
                                      listViewMyAddressesResponse.jsonBody,
                                      r'''$.data''',
                                    ).toList();
                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: myMainAddresses.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 24.0),
                                      itemBuilder:
                                          (context, myMainAddressesIndex) {
                                        final myMainAddressesItem =
                                            myMainAddresses[
                                                myMainAddressesIndex];
                                        return AddressCardWidget(
                                          key: Key(
                                              'Key481_${myMainAddressesIndex}_of_${myMainAddresses.length}'),
                                          address: myMainAddressesItem,
                                          action: () async {
                                            setState(() => _model
                                                .apiRequestCompleter = null);
                                            await _model
                                                .waitForApiRequestCompleted();
                                          },
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 32.0),
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
                              context.pushNamed(
                                'Contactdata-1',
                                queryParameters: {
                                  'addAnother': serializeParam(
                                    true,
                                    ParamType.bool,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Container(
                              width: 180.0,
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
                                    '+ Add another addresses',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lato',
                                          color: Color(0xFFF6F6F6),
                                          fontSize: 14.0,
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
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.footer3Model,
                    updateCallback: () => setState(() {}),
                    child: Footer3Widget(
                      textButton: 'Save',
                      text: 'I\'ll do it later',
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
