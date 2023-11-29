import '/backend/api_requests/api_calls.dart';
import '/components/ad_card_widget.dart';
import '/components/filter_web_widget.dart';
import '/components/header_web_search_filter_widget.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/navigation_bar_widget.dart';
import '/components/task_card_widget.dart';
import '/components/taskcreation_menue_widget.dart';
import '/components/termof_service_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'publish_task_model.dart';
export 'publish_task_model.dart';

class PublishTaskWidget extends StatefulWidget {
  const PublishTaskWidget({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String? id;

  @override
  _PublishTaskWidgetState createState() => _PublishTaskWidgetState();
}

class _PublishTaskWidgetState extends State<PublishTaskWidget> {
  late PublishTaskModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PublishTaskModel());

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 35.0,
            height: 35.0,
            child: SpinKitThreeBounce(
              color: FlutterFlowTheme.of(context).primary,
              size: 35.0,
            ),
          ),
        ),
      );
    }

    return FutureBuilder<ApiCallResponse>(
      future: TaskerpageBackendGroup.postReadCall.call(
        id: widget.id,
        apiGlobalKey: FFAppState().apiKey,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFFF6F6F6),
            body: Center(
              child: SizedBox(
                width: 35.0,
                height: 35.0,
                child: SpinKitThreeBounce(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 35.0,
                ),
              ),
            ),
          );
        }
        final publishTaskPostReadResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
            backgroundColor: Color(0xFFF6F6F6),
            drawer: Container(
              width: MediaQuery.sizeOf(context).width * 0.6,
              child: WebViewAware(
                  child: Drawer(
                elevation: 16.0,
                child: wrapWithModel(
                  model: _model.navigationBarModel,
                  updateCallback: () => setState(() {}),
                  child: NavigationBarWidget(
                    currentPage: 'task',
                    postId: widget.id,
                    closeDrawer: () async {
                      if (scaffoldKey.currentState!.isDrawerOpen ||
                          scaffoldKey.currentState!.isEndDrawerOpen) {
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
              )),
            ),
            endDrawer: Container(
              width: double.infinity,
              child: WebViewAware(
                  child: Drawer(
                elevation: 16.0,
                child: wrapWithModel(
                  model: _model.mainDrawerModel,
                  updateCallback: () => setState(() {}),
                  child: MainDrawerWidget(),
                ),
              )),
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                    tabletLandscape: false,
                  ))
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              wrapWithModel(
                                model: _model.headerWebSearchFilterModel,
                                updateCallback: () => setState(() {}),
                                child: HeaderWebSearchFilterWidget(),
                              ),
                              wrapWithModel(
                                model: _model.filterWebModel,
                                updateCallback: () => setState(() {}),
                                child: FilterWebWidget(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                          tabletLandscape: false,
                        ))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                43.0, 0.0, 8.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.3,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: Color(0x00FFFFFF),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 20.0),
                                      child: SingleChildScrollView(
                                        primary: false,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      32.0, 27.0, 32.0, 8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.43,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textController,
                                                        focusNode: _model
                                                            .textFieldFocusNode,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          isDense: true,
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium,
                                                          hintText:
                                                              'search task ...',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lato',
                                                                    color: Color(
                                                                        0x53767676),
                                                                    fontSize:
                                                                        13.0,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          prefixIcon: Icon(
                                                            Icons.search_sharp,
                                                          ),
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Lato',
                                                              fontSize: 13.0,
                                                            ),
                                                        validator: _model
                                                            .textControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if (responsiveVisibility(
                                              context: context,
                                              desktop: false,
                                            ))
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        32.0, 0.0, 32.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                          setState(() {
                                                            FFAppState()
                                                                    .mapView =
                                                                false;
                                                          });
                                                        },
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 36.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x00FFFFFF),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2.0),
                                                            border: Border.all(
                                                              color: !FFAppState().mapView
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
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                'Card View',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lato',
                                                                      color: !FFAppState().mapView
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                      fontSize:
                                                                          13.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
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
                                                          setState(() {
                                                            FFAppState()
                                                                .mapView = true;
                                                          });
                                                        },
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 36.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x00FFFFFF),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2.0),
                                                            border: Border.all(
                                                              color: FFAppState().mapView
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
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                'Map View',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lato',
                                                                      color: FFAppState().mapView
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                      fontSize:
                                                                          13.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 12.0)),
                                                ),
                                              ),
                                            Flexible(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        32.0, 0.0, 32.0, 0.0),
                                                child: FutureBuilder<
                                                    ApiCallResponse>(
                                                  future: TaskerpageBackendGroup
                                                      .customerTaskListCall
                                                      .call(
                                                    apiGlobalKey:
                                                        FFAppState().apiKey,
                                                    filters:
                                                        valueOrDefault<String>(
                                                      FFAppState().taskSearchString ==
                                                                  null ||
                                                              FFAppState()
                                                                      .taskSearchString ==
                                                                  ''
                                                          ? '[[\"docstatus\",\"=\",\"1\"]]'
                                                          : FFAppState()
                                                              .taskSearchString,
                                                      '[]',
                                                    ),
                                                    fields:
                                                        '[\"country\",\"city\",\"start_date\",\"docstatus\",\"is_repeatable\",\"repeat_type\",\"skill_name\",\"skill_category_name\",\"language\",\"description\",\"name\",\"latitude\",\"longitude\"]',
                                                    orderBy:
                                                        'creation ${FFAppState().Sort == 'Oldest' ? 'asc' : 'desc'}',
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 35.0,
                                                          height: 35.0,
                                                          child:
                                                              SpinKitThreeBounce(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 35.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final columnCustomerTaskListResponse =
                                                        snapshot.data!;
                                                    return SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .adCardModel,
                                                                    updateCallback: () =>
                                                                        setState(
                                                                            () {}),
                                                                    child:
                                                                        AdCardWidget(
                                                                      position:
                                                                          'search and filter',
                                                                    ),
                                                                  ),
                                                                ),
                                                                if (!FFAppState()
                                                                    .mapView)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            10.0),
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final posts =
                                                                            getJsonField(
                                                                          columnCustomerTaskListResponse
                                                                              .jsonBody,
                                                                          r'''$.data''',
                                                                        ).toList();
                                                                        return ListView
                                                                            .separated(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          primary:
                                                                              false,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          itemCount:
                                                                              posts.length,
                                                                          separatorBuilder: (_, __) =>
                                                                              SizedBox(height: 16.0),
                                                                          itemBuilder:
                                                                              (context, postsIndex) {
                                                                            final postsItem =
                                                                                posts[postsIndex];
                                                                            return TaskCardWidget(
                                                                              key: Key('Key2ni_${postsIndex}_of_${posts.length}'),
                                                                              post: postsItem,
                                                                            );
                                                                          },
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                          if (FFAppState()
                                                              .mapView)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          24.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    1.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFF6F6F6),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              2.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                                  child:
                                                                      FlutterFlowGoogleMap(
                                                                    controller:
                                                                        _model
                                                                            .googleMapsController1,
                                                                    onCameraIdle:
                                                                        (latLng) =>
                                                                            _model.googleMapsCenter1 =
                                                                                latLng,
                                                                    initialLocation:
                                                                        _model.googleMapsCenter1 ??=
                                                                            currentUserLocationValue!,
                                                                    markers: (functions.jsonListToLatLng(getJsonField(
                                                                              columnCustomerTaskListResponse.jsonBody,
                                                                              r'''$.data''',
                                                                              true,
                                                                            )) ??
                                                                            [])
                                                                        .map(
                                                                          (marker) =>
                                                                              FlutterFlowMarker(
                                                                            marker.serialize(),
                                                                            marker,
                                                                            () async {
                                                                              await Future.delayed(const Duration(milliseconds: 1000));

                                                                              context.pushNamed(
                                                                                'PublishTask',
                                                                                queryParameters: {
                                                                                  'id': serializeParam(
                                                                                    '',
                                                                                    ParamType.String,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                                extra: <String, dynamic>{
                                                                                  kTransitionInfoKey: TransitionInfo(
                                                                                    hasTransition: true,
                                                                                    transitionType: PageTransitionType.bottomToTop,
                                                                                  ),
                                                                                },
                                                                              );
                                                                            },
                                                                          ),
                                                                        )
                                                                        .toList(),
                                                                    markerColor:
                                                                        GoogleMarkerColor
                                                                            .violet,
                                                                    mapType: MapType
                                                                        .normal,
                                                                    style: GoogleMapStyle
                                                                        .standard,
                                                                    initialZoom:
                                                                        15.0,
                                                                    allowInteraction:
                                                                        true,
                                                                    allowZoom:
                                                                        true,
                                                                    showZoomControls:
                                                                        false,
                                                                    showLocation:
                                                                        true,
                                                                    showCompass:
                                                                        false,
                                                                    showMapToolbar:
                                                                        false,
                                                                    showTraffic:
                                                                        false,
                                                                    centerMapOnMarkerTap:
                                                                        true,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    );
                                                  },
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
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x00FFFFFF),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          if (responsiveVisibility(
                                            context: context,
                                            desktop: false,
                                          ))
                                            wrapWithModel(
                                              model: _model.headerModel,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: HeaderWidget(
                                                openDrawer: () async {
                                                  scaffoldKey.currentState!
                                                      .openEndDrawer();
                                                },
                                              ),
                                            ),
                                        ],
                                      ),
                                      Expanded(
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Flexible(
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (getJsonField(
                                                            publishTaskPostReadResponse
                                                                .jsonBody,
                                                            r'''$.data.poster''',
                                                          ) ==
                                                          getJsonField(
                                                            FFAppState()
                                                                .userProfile,
                                                            r'''$.data.name''',
                                                          ))
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      32.0,
                                                                      20.0,
                                                                      32.0,
                                                                      22.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              wrapWithModel(
                                                                model: _model
                                                                    .taskcreationMenueModel,
                                                                updateCallback:
                                                                    () => setState(
                                                                        () {}),
                                                                child:
                                                                    TaskcreationMenueWidget(
                                                                  openDrawer:
                                                                      () async {
                                                                    scaffoldKey
                                                                        .currentState!
                                                                        .openDrawer();
                                                                  },
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          20.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'will be shown to public\nThis how your task ',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lato',
                                                                          color:
                                                                              Color(0xFF3A3A3A),
                                                                          fontSize:
                                                                              18.0,
                                                                          fontWeight:
                                                                              FontWeight.w900,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 45.0,
                                                                height: 45.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFF6F6F6),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              if (responsiveVisibility(
                                                context: context,
                                                desktop: false,
                                              ))
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 16.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x33000000),
                                                                offset: Offset(
                                                                    0.0, 2.0),
                                                                spreadRadius:
                                                                    4.0,
                                                              )
                                                            ],
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        32.0,
                                                                        30.0,
                                                                        32.0,
                                                                        0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    FutureBuilder<
                                                                        ApiCallResponse>(
                                                                      future: TaskerpageBackendGroup
                                                                          .userProfileReadCall
                                                                          .call(
                                                                        id: getJsonField(
                                                                          publishTaskPostReadResponse
                                                                              .jsonBody,
                                                                          r'''$.data.poster''',
                                                                        ).toString(),
                                                                        apiGlobalKey:
                                                                            FFAppState().apiKey,
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 35.0,
                                                                              height: 35.0,
                                                                              child: SpinKitThreeBounce(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 35.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        final columnUserProfileReadResponse =
                                                                            snapshot.data!;
                                                                        return Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                                                                              child: Container(
                                                                                width: 50.0,
                                                                                height: 50.0,
                                                                                clipBehavior: Clip.antiAlias,
                                                                                decoration: BoxDecoration(
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                child: Image.network(
                                                                                  '${FFAppState().baseUrl}${getJsonField(
                                                                                    columnUserProfileReadResponse.jsonBody,
                                                                                    r'''$.data.avatar''',
                                                                                  ).toString()}',
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              getJsonField(
                                                                                columnUserProfileReadResponse.jsonBody,
                                                                                r'''$.data.first_name''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Lato',
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    fontSize: 13.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              getJsonField(
                                                                                columnUserProfileReadResponse.jsonBody,
                                                                                r'''$.data.last_name''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Lato',
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    fontSize: 13.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                getJsonField(
                                                                                  publishTaskPostReadResponse.jsonBody,
                                                                                  r'''$.data.skill_category_name''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Lato',
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      fontSize: 18.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                child: Icon(
                                                                                  Icons.verified_rounded,
                                                                                  color: Color(0xFF49A1FF),
                                                                                  size: 19.0,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                getJsonField(
                                                                                  publishTaskPostReadResponse.jsonBody,
                                                                                  r'''$.data.skill_name''',
                                                                                ).toString().maybeHandleOverflow(
                                                                                      maxChars: 29,
                                                                                      replacement: '…',
                                                                                    ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Lato',
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                              if (functions
                                                                                      .jsonToInt(getJsonField(
                                                                                        publishTaskPostReadResponse.jsonBody,
                                                                                        r'''$.data.is_online''',
                                                                                      ))
                                                                                      .toString() ==
                                                                                  '1')
                                                                                Text(
                                                                                  'Online Task',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Lato',
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontSize: 12.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: 100.0,
                                                                                  height: 40.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFFF2F2F2),
                                                                                    borderRadius: BorderRadius.circular(2.0),
                                                                                  ),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Text(
                                                                                        '${getJsonField(
                                                                                          publishTaskPostReadResponse.jsonBody,
                                                                                          r'''$.data.rate''',
                                                                                        ).toString()} ${getJsonField(
                                                                                          publishTaskPostReadResponse.jsonBody,
                                                                                          r'''$.data.rate_currency''',
                                                                                        ).toString()}',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Lato',
                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                              fontSize: 18.0,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ].divide(SizedBox(height: 5.5)),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          24.0)),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        32.0,
                                                                        29.0,
                                                                        32.0,
                                                                        0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      'Task discription',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lato',
                                                                            color:
                                                                                Color(0xFF222222),
                                                                            fontSize:
                                                                                14.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        32.0,
                                                                        17.5,
                                                                        32.0,
                                                                        0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Flexible(
                                                                      child:
                                                                          Text(
                                                                        getJsonField(
                                                                          publishTaskPostReadResponse
                                                                              .jsonBody,
                                                                          r'''$.data.description''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Lato',
                                                                              color: Color(0xFF222222),
                                                                              fontSize: 14.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              if (getJsonField(
                                                                    publishTaskPostReadResponse
                                                                        .jsonBody,
                                                                    r'''$.data.file''',
                                                                  ) !=
                                                                  null)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          32.0,
                                                                          16.0,
                                                                          32.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .file_copy,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              20.0,
                                                                        ),
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            await launchURL('${FFAppState().baseUrl}${getJsonField(
                                                                              publishTaskPostReadResponse.jsonBody,
                                                                              r'''$.data.file''',
                                                                            ).toString()}');
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            'https://taskerpage.com${getJsonField(
                                                                              publishTaskPostReadResponse.jsonBody,
                                                                              r'''$.data.file''',
                                                                            ).toString()}',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Lato',
                                                                                  color: Color(0xFF494949),
                                                                                  fontSize: 12.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        32.0,
                                                                        22.0,
                                                                        32.0,
                                                                        0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      'Conditions',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lato',
                                                                            color:
                                                                                Color(0xFF222222),
                                                                            fontSize:
                                                                                14.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        32.0,
                                                                        12.0,
                                                                        32.0,
                                                                        30.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          195.0,
                                                                      height:
                                                                          22.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFFDEDEDE),
                                                                        borderRadius:
                                                                            BorderRadius.circular(3.0),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            'Trimming, Hedging, Lawn',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Lato',
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  fontSize: 13.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ],
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
                                              if (responsiveVisibility(
                                                context: context,
                                                phone: false,
                                                tablet: false,
                                                tabletLandscape: false,
                                              ))
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 16.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                width: 100.0,
                                                                height: 60.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                          4.0,
                                                                      color: Color(
                                                                          0x33000000),
                                                                      offset: Offset(
                                                                          0.0,
                                                                          2.0),
                                                                      spreadRadius:
                                                                          2.0,
                                                                    )
                                                                  ],
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          32.0,
                                                                          0.0,
                                                                          32.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 7.0, 0.0),
                                                                                      child: Icon(
                                                                                        Icons.card_membership_rounded,
                                                                                        color: Color(0xFF292929),
                                                                                        size: 19.0,
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 13.0, 0.0),
                                                                                      child: Text(
                                                                                        'Task Number: ',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Lato',
                                                                                              color: Color(0xFF292929),
                                                                                              fontSize: 13.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      getJsonField(
                                                                                        publishTaskPostReadResponse.jsonBody,
                                                                                        r'''$.data.name''',
                                                                                      ).toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Lato',
                                                                                            color: Color(0xFF292929),
                                                                                            fontSize: 13.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ].divide(SizedBox(height: 7.0)),
                                                                            ),
                                                                            Column(
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
                                                                                    if (getJsonField(
                                                                                          publishTaskPostReadResponse.jsonBody,
                                                                                          r'''$.data.poster''',
                                                                                        ) ==
                                                                                        getJsonField(
                                                                                          FFAppState().userProfile,
                                                                                          r'''$.data.name''',
                                                                                        )) {
                                                                                      if (functions
                                                                                              .jsonToInt(getJsonField(
                                                                                                publishTaskPostReadResponse.jsonBody,
                                                                                                r'''$.data.docstatus''',
                                                                                              ))
                                                                                              .toString() ==
                                                                                          '0') {
                                                                                        _model.updateStatusPost = await TaskerpageBackendGroup.updateStatusPostCall.call(
                                                                                          id: widget.id,
                                                                                          apiGlobalKey: FFAppState().apiKey,
                                                                                          draft: 1,
                                                                                        );
                                                                                        _shouldSetState = true;
                                                                                        if ((_model.updateStatusPost?.succeeded ?? true)) {
                                                                                          context.pushNamed('MyPosts');
                                                                                        } else {
                                                                                          if (_shouldSetState) setState(() {});
                                                                                          return;
                                                                                        }
                                                                                      } else {
                                                                                        context.pushNamed(
                                                                                          'Task-1',
                                                                                          queryParameters: {
                                                                                            'id': serializeParam(
                                                                                              getJsonField(
                                                                                                publishTaskPostReadResponse.jsonBody,
                                                                                                r'''$.data.name''',
                                                                                              ).toString(),
                                                                                              ParamType.String,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                        );
                                                                                      }
                                                                                    } else {
                                                                                      _model.userRead = await TaskerpageBackendGroup.userProfileReadCall.call(
                                                                                        id: getJsonField(
                                                                                          publishTaskPostReadResponse.jsonBody,
                                                                                          r'''$.data.poster''',
                                                                                        ).toString(),
                                                                                        apiGlobalKey: FFAppState().apiKey,
                                                                                      );
                                                                                      _shouldSetState = true;
                                                                                      _model.startChat22 = await TaskerpageBackendGroup.createChatCall.call(
                                                                                        roomName: 'G - (${getJsonField(
                                                                                          FFAppState().userProfile,
                                                                                          r'''$.data.name''',
                                                                                        ).toString()}-${getJsonField(
                                                                                          publishTaskPostReadResponse.jsonBody,
                                                                                          r'''$.data.poster''',
                                                                                        ).toString()}) T - (${getJsonField(
                                                                                          publishTaskPostReadResponse.jsonBody,
                                                                                          r'''$.data.name''',
                                                                                        ).toString()})',
                                                                                        users: '[\'${getJsonField(
                                                                                          (_model.userRead?.jsonBody ?? ''),
                                                                                          r'''$.data.user''',
                                                                                        ).toString()}\']',
                                                                                        type: 'Group',
                                                                                        task: getJsonField(
                                                                                          publishTaskPostReadResponse.jsonBody,
                                                                                          r'''$.data.name''',
                                                                                        ).toString(),
                                                                                        apiGlobalKey: FFAppState().apiKey,
                                                                                      );
                                                                                      _shouldSetState = true;
                                                                                      if ((_model.startChat22?.succeeded ?? true)) {
                                                                                        context.pushNamed(
                                                                                          'chat',
                                                                                          pathParameters: {
                                                                                            'room': serializeParam(
                                                                                              TaskerpageBackendGroup.createChatCall
                                                                                                  .room(
                                                                                                    (_model.startChat22?.jsonBody ?? ''),
                                                                                                  )
                                                                                                  .toString(),
                                                                                              ParamType.String,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                        );
                                                                                      } else {
                                                                                        if (_shouldSetState) setState(() {});
                                                                                        return;
                                                                                      }
                                                                                    }

                                                                                    if (_shouldSetState) setState(() {});
                                                                                  },
                                                                                  child: Container(
                                                                                    height: 36.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      borderRadius: BorderRadius.circular(1.0),
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        width: 1.5,
                                                                                      ),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Text(
                                                                                            getJsonField(
                                                                                                      publishTaskPostReadResponse.jsonBody,
                                                                                                      r'''$.data.poster''',
                                                                                                    ) ==
                                                                                                    getJsonField(
                                                                                                      FFAppState().userProfile,
                                                                                                      r'''$.data.name''',
                                                                                                    )
                                                                                                ? (functions
                                                                                                            .jsonToInt(getJsonField(
                                                                                                              publishTaskPostReadResponse.jsonBody,
                                                                                                              r'''$.data.docstatus''',
                                                                                                            ))
                                                                                                            .toString() ==
                                                                                                        '0'
                                                                                                    ? 'PUBLISH TASK'
                                                                                                    : 'EDIT TASK')
                                                                                                : 'Start Chat',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Lato',
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  fontSize: 14.0,
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
                                                                          ],
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
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                          4.0,
                                                                      color: Color(
                                                                          0x33000000),
                                                                      offset: Offset(
                                                                          0.0,
                                                                          2.0),
                                                                      spreadRadius:
                                                                          2.0,
                                                                    )
                                                                  ],
                                                                ),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          32.0,
                                                                          30.0,
                                                                          32.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          FutureBuilder<
                                                                              ApiCallResponse>(
                                                                            future:
                                                                                TaskerpageBackendGroup.userProfileReadCall.call(
                                                                              id: getJsonField(
                                                                                publishTaskPostReadResponse.jsonBody,
                                                                                r'''$.data.poster''',
                                                                              ).toString(),
                                                                              apiGlobalKey: FFAppState().apiKey,
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
                                                                              // Customize what your widget looks like when it's loading.
                                                                              if (!snapshot.hasData) {
                                                                                return Center(
                                                                                  child: SizedBox(
                                                                                    width: 35.0,
                                                                                    height: 35.0,
                                                                                    child: SpinKitThreeBounce(
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      size: 35.0,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              final columnUserProfileReadResponse = snapshot.data!;
                                                                              return Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                                                                                    child: Container(
                                                                                      width: 50.0,
                                                                                      height: 50.0,
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Image.network(
                                                                                        '${FFAppState().baseUrl}${getJsonField(
                                                                                          columnUserProfileReadResponse.jsonBody,
                                                                                          r'''$.data.avatar''',
                                                                                        ).toString()}',
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    getJsonField(
                                                                                      columnUserProfileReadResponse.jsonBody,
                                                                                      r'''$.data.first_name''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Lato',
                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                          fontSize: 13.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    getJsonField(
                                                                                      columnUserProfileReadResponse.jsonBody,
                                                                                      r'''$.data.last_name''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Lato',
                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                          fontSize: 13.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      getJsonField(
                                                                                        publishTaskPostReadResponse.jsonBody,
                                                                                        r'''$.data.skill_category_name''',
                                                                                      ).toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Lato',
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                            fontSize: 18.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                      child: Icon(
                                                                                        Icons.verified_rounded,
                                                                                        color: Color(0xFF49A1FF),
                                                                                        size: 19.0,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      getJsonField(
                                                                                        publishTaskPostReadResponse.jsonBody,
                                                                                        r'''$.data.skill_name''',
                                                                                      ).toString().maybeHandleOverflow(
                                                                                            maxChars: 29,
                                                                                            replacement: '…',
                                                                                          ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Lato',
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                            fontSize: 14.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                    if (functions
                                                                                            .jsonToInt(getJsonField(
                                                                                              publishTaskPostReadResponse.jsonBody,
                                                                                              r'''$.data.is_online''',
                                                                                            ))
                                                                                            .toString() ==
                                                                                        '1')
                                                                                      Text(
                                                                                        'Online Task',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Lato',
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              fontSize: 12.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Container(
                                                                                        width: 100.0,
                                                                                        height: 40.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Color(0xFFF2F2F2),
                                                                                          borderRadius: BorderRadius.circular(2.0),
                                                                                        ),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Text(
                                                                                              '${getJsonField(
                                                                                                publishTaskPostReadResponse.jsonBody,
                                                                                                r'''$.data.rate''',
                                                                                              ).toString()} ${getJsonField(
                                                                                                publishTaskPostReadResponse.jsonBody,
                                                                                                r'''$.data.rate_currency''',
                                                                                              ).toString()}',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Lato',
                                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                                    fontSize: 18.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ].divide(SizedBox(height: 5.5)),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 24.0)),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          32.0,
                                                                          29.0,
                                                                          32.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            'Task discription',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          32.0,
                                                                          17.5,
                                                                          32.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Flexible(
                                                                            child:
                                                                                Text(
                                                                              getJsonField(
                                                                                publishTaskPostReadResponse.jsonBody,
                                                                                r'''$.data.description''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Lato',
                                                                                    color: Color(0xFF222222),
                                                                                    fontSize: 14.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    if (getJsonField(
                                                                          publishTaskPostReadResponse
                                                                              .jsonBody,
                                                                          r'''$.data.file''',
                                                                        ) !=
                                                                        null)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            32.0,
                                                                            16.0,
                                                                            32.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                              child: Icon(
                                                                                Icons.file_copy,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 20.0,
                                                                              ),
                                                                            ),
                                                                            Flexible(
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  await launchURL('${FFAppState().baseUrl}${getJsonField(
                                                                                    publishTaskPostReadResponse.jsonBody,
                                                                                    r'''$.data.file''',
                                                                                  ).toString()}');
                                                                                },
                                                                                child: Text(
                                                                                  'https://taskerpage.com${getJsonField(
                                                                                    publishTaskPostReadResponse.jsonBody,
                                                                                    r'''$.data.file''',
                                                                                  ).toString()}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Lato',
                                                                                        color: Color(0xFF494949),
                                                                                        fontSize: 12.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          32.0,
                                                                          22.0,
                                                                          32.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            'Conditions',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          32.0,
                                                                          12.0,
                                                                          32.0,
                                                                          30.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                195.0,
                                                                            height:
                                                                                22.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFDEDEDE),
                                                                              borderRadius: BorderRadius.circular(3.0),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Text(
                                                                                  'Trimming, Hedging, Lawn',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Lato',
                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                        fontSize: 13.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                              ],
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
                                              if (responsiveVisibility(
                                                context: context,
                                                desktop: false,
                                              ))
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 15.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 290.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFF9F9F9),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x33000000),
                                                                offset: Offset(
                                                                    0.0, 2.0),
                                                                spreadRadius:
                                                                    4.0,
                                                              )
                                                            ],
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        32.0,
                                                                        24.0,
                                                                        32.0,
                                                                        24.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            101.0,
                                                                        height:
                                                                            65.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Color(0xFFDEDEDE),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              '${getJsonField(
                                                                                publishTaskPostReadResponse.jsonBody,
                                                                                r'''$.data.rate''',
                                                                              ).toString()} ${getJsonField(
                                                                                publishTaskPostReadResponse.jsonBody,
                                                                                r'''$.data.rate_currency''',
                                                                              ).toString()}',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Lato',
                                                                                    color: Color(0xFF222222),
                                                                                    fontSize: 16.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              functions.jsonToString(getJsonField(
                                                                                        publishTaskPostReadResponse.jsonBody,
                                                                                        r'''$.data.rate_type''',
                                                                                      )) ==
                                                                                      'Offer a rate'
                                                                                  ? 'Hourly Rate'
                                                                                  : 'Total Rate',
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Lato',
                                                                                    color: Color(0xFF222222),
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                            ),
                                                                          ].divide(SizedBox(height: 4.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            101.0,
                                                                        height:
                                                                            65.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Color(0xFFDEDEDE),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              functions.jsonToString(getJsonField(
                                                                                        publishTaskPostReadResponse.jsonBody,
                                                                                        r'''$.data.repeat_type''',
                                                                                      )) ==
                                                                                      'Exact Dates'
                                                                                  ? '${getJsonField(
                                                                                      publishTaskPostReadResponse.jsonBody,
                                                                                      r'''$.data.number_of_hours_per_session''',
                                                                                    ).toString()} hr'
                                                                                  : '${functions.multiplication(getJsonField(
                                                                                        publishTaskPostReadResponse.jsonBody,
                                                                                        r'''$.data.number_of_hours_per_session''',
                                                                                      ), getJsonField(
                                                                                        publishTaskPostReadResponse.jsonBody,
                                                                                        r'''$.data.days_per_week''',
                                                                                      )).toString()} hr',
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Lato',
                                                                                    color: Color(0xFF222222),
                                                                                    fontSize: 16.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              'Total time',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Lato',
                                                                                    color: Color(0xFF222222),
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                            ),
                                                                          ].divide(SizedBox(height: 4.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            101.0,
                                                                        height:
                                                                            65.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Color(0xFFDEDEDE),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              getJsonField(
                                                                                publishTaskPostReadResponse.jsonBody,
                                                                                r'''$.data.repeat_type''',
                                                                              ).toString(),
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Lato',
                                                                                    color: Color(0xFF222222),
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          8.0)),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            100.0,
                                                                        height:
                                                                            168.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Color(0xFFDEDEDE),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              18.0,
                                                                              16.0,
                                                                              18.0,
                                                                              20.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                    child: Icon(
                                                                                      Icons.calendar_month,
                                                                                      color: Color(0xFF222222),
                                                                                      size: 20.0,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    '${getJsonField(
                                                                                      publishTaskPostReadResponse.jsonBody,
                                                                                      r'''$.data.start_date''',
                                                                                    ).toString()}${getJsonField(
                                                                                          publishTaskPostReadResponse.jsonBody,
                                                                                          r'''$.data.end_on''',
                                                                                        ) != null ? '   to   ' : ''}${getJsonField(
                                                                                          publishTaskPostReadResponse.jsonBody,
                                                                                          r'''$.data.end_on''',
                                                                                        ) != null ? getJsonField(
                                                                                        publishTaskPostReadResponse.jsonBody,
                                                                                        r'''$.data.end_on''',
                                                                                      ).toString() : ''}',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Lato',
                                                                                          color: Color(0xFF222222),
                                                                                          fontSize: 14.0,
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                    child: Icon(
                                                                                      Icons.access_time_rounded,
                                                                                      color: Color(0xFF222222),
                                                                                      size: 20.0,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    getJsonField(
                                                                                              publishTaskPostReadResponse.jsonBody,
                                                                                              r'''$.data.start_range_time''',
                                                                                            ) !=
                                                                                            null
                                                                                        ? getJsonField(
                                                                                            publishTaskPostReadResponse.jsonBody,
                                                                                            r'''$.data.start_range_time''',
                                                                                          ).toString()
                                                                                        : getJsonField(
                                                                                            publishTaskPostReadResponse.jsonBody,
                                                                                            r'''$.data.start_time''',
                                                                                          ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Lato',
                                                                                          color: Color(0xFF222222),
                                                                                          fontSize: 14.0,
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                    child: ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(0.0),
                                                                                      child: Image.asset(
                                                                                        'assets/images/Group_2234.png',
                                                                                        width: 16.0,
                                                                                        height: 16.0,
                                                                                        fit: BoxFit.none,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                    child: Icon(
                                                                                      Icons.hourglass_bottom_rounded,
                                                                                      color: Color(0xFF222222),
                                                                                      size: 20.0,
                                                                                    ),
                                                                                  ),
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      if (functions.jsonToString(getJsonField(
                                                                                            publishTaskPostReadResponse.jsonBody,
                                                                                            r'''$.data.repeat_type''',
                                                                                          )) !=
                                                                                          'Exact Dates')
                                                                                        Text(
                                                                                          '${getJsonField(
                                                                                            publishTaskPostReadResponse.jsonBody,
                                                                                            r'''$.data.days_per_week''',
                                                                                          ).toString()} ${functions.jsonToString(getJsonField(
                                                                                                publishTaskPostReadResponse.jsonBody,
                                                                                                r'''$.data.repeat_type''',
                                                                                              )) == 'Weekly' ? 'days per week ' : 'days per mounth '}',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Lato',
                                                                                                color: Color(0xFF222222),
                                                                                                fontSize: 14.0,
                                                                                                fontWeight: FontWeight.bold,
                                                                                              ),
                                                                                        ),
                                                                                      Text(
                                                                                        '${getJsonField(
                                                                                          publishTaskPostReadResponse.jsonBody,
                                                                                          r'''$.data.number_of_hours_per_session''',
                                                                                        ).toString()} hours each session',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Lato',
                                                                                              color: Color(0xFF222222),
                                                                                              fontSize: 14.0,
                                                                                              fontWeight: FontWeight.bold,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Text(
                                                                                    'Preferred day:',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Lato',
                                                                                          color: Color(0xFF222222),
                                                                                          fontSize: 14.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          getJsonField(
                                                                                                    publishTaskPostReadResponse.jsonBody,
                                                                                                    r'''$.data.preferred_days''',
                                                                                                  ) !=
                                                                                                  null
                                                                                              ? getJsonField(
                                                                                                  publishTaskPostReadResponse.jsonBody,
                                                                                                  r'''$.data.preferred_days''',
                                                                                                ).toString()
                                                                                              : '-',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Lato',
                                                                                                color: Color(0xFF222222),
                                                                                                fontSize: 14.0,
                                                                                                fontWeight: FontWeight.bold,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 8.4)),
                                                            ),
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
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 15.0,
                                                          10.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 290.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFF9F9F9),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x33000000),
                                                                offset: Offset(
                                                                    0.0, 2.0),
                                                                spreadRadius:
                                                                    2.0,
                                                              )
                                                            ],
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        32.0,
                                                                        24.0,
                                                                        32.0,
                                                                        24.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            101.0,
                                                                        height:
                                                                            65.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Color(0xFFDEDEDE),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              '${getJsonField(
                                                                                publishTaskPostReadResponse.jsonBody,
                                                                                r'''$.data.rate''',
                                                                              ).toString()} ${getJsonField(
                                                                                publishTaskPostReadResponse.jsonBody,
                                                                                r'''$.data.rate_currency''',
                                                                              ).toString()}',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Lato',
                                                                                    color: Color(0xFF222222),
                                                                                    fontSize: 16.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              functions.jsonToString(getJsonField(
                                                                                        publishTaskPostReadResponse.jsonBody,
                                                                                        r'''$.data.rate_type''',
                                                                                      )) ==
                                                                                      'Offer a rate'
                                                                                  ? 'Hourly Rate'
                                                                                  : 'Total Rate',
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Lato',
                                                                                    color: Color(0xFF222222),
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                            ),
                                                                          ].divide(SizedBox(height: 4.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            101.0,
                                                                        height:
                                                                            65.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Color(0xFFDEDEDE),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              functions.jsonToString(getJsonField(
                                                                                        publishTaskPostReadResponse.jsonBody,
                                                                                        r'''$.data.repeat_type''',
                                                                                      )) ==
                                                                                      'Exact Dates'
                                                                                  ? '${getJsonField(
                                                                                      publishTaskPostReadResponse.jsonBody,
                                                                                      r'''$.data.number_of_hours_per_session''',
                                                                                    ).toString()} hr'
                                                                                  : '${functions.multiplication(getJsonField(
                                                                                        publishTaskPostReadResponse.jsonBody,
                                                                                        r'''$.data.number_of_hours_per_session''',
                                                                                      ), getJsonField(
                                                                                        publishTaskPostReadResponse.jsonBody,
                                                                                        r'''$.data.days_per_week''',
                                                                                      )).toString()} hr',
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Lato',
                                                                                    color: Color(0xFF222222),
                                                                                    fontSize: 16.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              'Total time',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Lato',
                                                                                    color: Color(0xFF222222),
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                            ),
                                                                          ].divide(SizedBox(height: 4.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            101.0,
                                                                        height:
                                                                            65.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Color(0xFFDEDEDE),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              getJsonField(
                                                                                publishTaskPostReadResponse.jsonBody,
                                                                                r'''$.data.repeat_type''',
                                                                              ).toString(),
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Lato',
                                                                                    color: Color(0xFF222222),
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          8.0)),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            100.0,
                                                                        height:
                                                                            168.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Color(0xFFDEDEDE),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              18.0,
                                                                              16.0,
                                                                              18.0,
                                                                              20.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                    child: Icon(
                                                                                      Icons.calendar_month,
                                                                                      color: Color(0xFF222222),
                                                                                      size: 20.0,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    '${getJsonField(
                                                                                      publishTaskPostReadResponse.jsonBody,
                                                                                      r'''$.data.start_date''',
                                                                                    ).toString()}${getJsonField(
                                                                                          publishTaskPostReadResponse.jsonBody,
                                                                                          r'''$.data.end_on''',
                                                                                        ) != null ? '   to   ' : ''}${getJsonField(
                                                                                          publishTaskPostReadResponse.jsonBody,
                                                                                          r'''$.data.end_on''',
                                                                                        ) != null ? getJsonField(
                                                                                        publishTaskPostReadResponse.jsonBody,
                                                                                        r'''$.data.end_on''',
                                                                                      ).toString() : ''}',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Lato',
                                                                                          color: Color(0xFF222222),
                                                                                          fontSize: 14.0,
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                    child: Icon(
                                                                                      Icons.access_time_rounded,
                                                                                      color: Color(0xFF222222),
                                                                                      size: 20.0,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    getJsonField(
                                                                                              publishTaskPostReadResponse.jsonBody,
                                                                                              r'''$.data.start_range_time''',
                                                                                            ) !=
                                                                                            null
                                                                                        ? getJsonField(
                                                                                            publishTaskPostReadResponse.jsonBody,
                                                                                            r'''$.data.start_range_time''',
                                                                                          ).toString()
                                                                                        : getJsonField(
                                                                                            publishTaskPostReadResponse.jsonBody,
                                                                                            r'''$.data.start_time''',
                                                                                          ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Lato',
                                                                                          color: Color(0xFF222222),
                                                                                          fontSize: 14.0,
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                    child: ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(0.0),
                                                                                      child: Image.asset(
                                                                                        'assets/images/Group_2234.png',
                                                                                        width: 16.0,
                                                                                        height: 16.0,
                                                                                        fit: BoxFit.none,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                    child: Icon(
                                                                                      Icons.hourglass_bottom_rounded,
                                                                                      color: Color(0xFF222222),
                                                                                      size: 20.0,
                                                                                    ),
                                                                                  ),
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      if (functions.jsonToString(getJsonField(
                                                                                            publishTaskPostReadResponse.jsonBody,
                                                                                            r'''$.data.repeat_type''',
                                                                                          )) !=
                                                                                          'Exact Dates')
                                                                                        Text(
                                                                                          '${getJsonField(
                                                                                            publishTaskPostReadResponse.jsonBody,
                                                                                            r'''$.data.days_per_week''',
                                                                                          ).toString()} ${functions.jsonToString(getJsonField(
                                                                                                publishTaskPostReadResponse.jsonBody,
                                                                                                r'''$.data.repeat_type''',
                                                                                              )) == 'Weekly' ? 'days per week ' : 'days per mounth '}',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Lato',
                                                                                                color: Color(0xFF222222),
                                                                                                fontSize: 14.0,
                                                                                                fontWeight: FontWeight.bold,
                                                                                              ),
                                                                                        ),
                                                                                      Text(
                                                                                        '${getJsonField(
                                                                                          publishTaskPostReadResponse.jsonBody,
                                                                                          r'''$.data.number_of_hours_per_session''',
                                                                                        ).toString()} hours each session',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Lato',
                                                                                              color: Color(0xFF222222),
                                                                                              fontSize: 14.0,
                                                                                              fontWeight: FontWeight.bold,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Text(
                                                                                    'Preferred day:',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Lato',
                                                                                          color: Color(0xFF222222),
                                                                                          fontSize: 14.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          getJsonField(
                                                                                                    publishTaskPostReadResponse.jsonBody,
                                                                                                    r'''$.data.preferred_days''',
                                                                                                  ) !=
                                                                                                  null
                                                                                              ? getJsonField(
                                                                                                  publishTaskPostReadResponse.jsonBody,
                                                                                                  r'''$.data.preferred_days''',
                                                                                                ).toString()
                                                                                              : '-',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Lato',
                                                                                                color: Color(0xFF222222),
                                                                                                fontSize: 14.0,
                                                                                                fontWeight: FontWeight.bold,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 8.4)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              if (responsiveVisibility(
                                                context: context,
                                                desktop: false,
                                              ))
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 15.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x33000000),
                                                                offset: Offset(
                                                                    0.0, 2.0),
                                                                spreadRadius:
                                                                    4.0,
                                                              )
                                                            ],
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        32.0,
                                                                        0.0,
                                                                        32.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .place_outlined,
                                                                        color: Color(
                                                                            0xFF222222),
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      '${getJsonField(
                                                                        publishTaskPostReadResponse
                                                                            .jsonBody,
                                                                        r'''$.data.city''',
                                                                      ).toString()} | ${getJsonField(
                                                                        publishTaskPostReadResponse
                                                                            .jsonBody,
                                                                        r'''$.data.language''',
                                                                      ).toString()}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lato',
                                                                            color:
                                                                                Color(0xFF222222),
                                                                            fontSize:
                                                                                14.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Flexible(
                                                                  child:
                                                                      Container(
                                                                    width: 80.0,
                                                                    height:
                                                                        80.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child: Builder(
                                                                        builder:
                                                                            (context) {
                                                                      final _googleMapMarker = functions.fulllatLong(
                                                                          getJsonField(
                                                                            publishTaskPostReadResponse.jsonBody,
                                                                            r'''$.data.latitude''',
                                                                          ).toString(),
                                                                          getJsonField(
                                                                            publishTaskPostReadResponse.jsonBody,
                                                                            r'''$.data.longitude''',
                                                                          ).toString());
                                                                      return FlutterFlowGoogleMap(
                                                                        controller:
                                                                            _model.googleMapsController2,
                                                                        onCameraIdle:
                                                                            (latLng) =>
                                                                                _model.googleMapsCenter2 = latLng,
                                                                        initialLocation: _model.googleMapsCenter2 ??= functions.fulllatLong(
                                                                            getJsonField(
                                                                              publishTaskPostReadResponse.jsonBody,
                                                                              r'''$.data.latitude''',
                                                                            ).toString(),
                                                                            getJsonField(
                                                                              publishTaskPostReadResponse.jsonBody,
                                                                              r'''$.data.longitude''',
                                                                            ).toString()),
                                                                        markers: [
                                                                          FlutterFlowMarker(
                                                                            _googleMapMarker.serialize(),
                                                                            _googleMapMarker,
                                                                          ),
                                                                        ],
                                                                        markerColor:
                                                                            GoogleMarkerColor.violet,
                                                                        mapType:
                                                                            MapType.normal,
                                                                        style: GoogleMapStyle
                                                                            .standard,
                                                                        initialZoom:
                                                                            15.0,
                                                                        allowInteraction:
                                                                            true,
                                                                        allowZoom:
                                                                            false,
                                                                        showZoomControls:
                                                                            false,
                                                                        showLocation:
                                                                            true,
                                                                        showCompass:
                                                                            false,
                                                                        showMapToolbar:
                                                                            false,
                                                                        showTraffic:
                                                                            false,
                                                                        centerMapOnMarkerTap:
                                                                            true,
                                                                      );
                                                                    }),
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
                                              if (responsiveVisibility(
                                                context: context,
                                                phone: false,
                                                tablet: false,
                                                tabletLandscape: false,
                                              ))
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 15.0,
                                                          10.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x33000000),
                                                                offset: Offset(
                                                                    0.0, 2.0),
                                                                spreadRadius:
                                                                    2.0,
                                                              )
                                                            ],
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        32.0,
                                                                        0.0,
                                                                        32.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .place_outlined,
                                                                        color: Color(
                                                                            0xFF222222),
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      '${getJsonField(
                                                                        publishTaskPostReadResponse
                                                                            .jsonBody,
                                                                        r'''$.data.city''',
                                                                      ).toString()} | ${getJsonField(
                                                                        publishTaskPostReadResponse
                                                                            .jsonBody,
                                                                        r'''$.data.language''',
                                                                      ).toString()}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lato',
                                                                            color:
                                                                                Color(0xFF222222),
                                                                            fontSize:
                                                                                14.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Flexible(
                                                                  child:
                                                                      Container(
                                                                    width: 80.0,
                                                                    height:
                                                                        80.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child: Builder(
                                                                        builder:
                                                                            (context) {
                                                                      final _googleMapMarker = functions.fulllatLong(
                                                                          getJsonField(
                                                                            publishTaskPostReadResponse.jsonBody,
                                                                            r'''$.data.latitude''',
                                                                          ).toString(),
                                                                          getJsonField(
                                                                            publishTaskPostReadResponse.jsonBody,
                                                                            r'''$.data.longitude''',
                                                                          ).toString());
                                                                      return FlutterFlowGoogleMap(
                                                                        controller:
                                                                            _model.googleMapsController3,
                                                                        onCameraIdle:
                                                                            (latLng) =>
                                                                                _model.googleMapsCenter3 = latLng,
                                                                        initialLocation: _model.googleMapsCenter3 ??= functions.fulllatLong(
                                                                            getJsonField(
                                                                              publishTaskPostReadResponse.jsonBody,
                                                                              r'''$.data.latitude''',
                                                                            ).toString(),
                                                                            getJsonField(
                                                                              publishTaskPostReadResponse.jsonBody,
                                                                              r'''$.data.longitude''',
                                                                            ).toString()),
                                                                        markers: [
                                                                          FlutterFlowMarker(
                                                                            _googleMapMarker.serialize(),
                                                                            _googleMapMarker,
                                                                          ),
                                                                        ],
                                                                        markerColor:
                                                                            GoogleMarkerColor.violet,
                                                                        mapType:
                                                                            MapType.normal,
                                                                        style: GoogleMapStyle
                                                                            .standard,
                                                                        initialZoom:
                                                                            15.0,
                                                                        allowInteraction:
                                                                            true,
                                                                        allowZoom:
                                                                            false,
                                                                        showZoomControls:
                                                                            false,
                                                                        showLocation:
                                                                            true,
                                                                        showCompass:
                                                                            false,
                                                                        showMapToolbar:
                                                                            false,
                                                                        showTraffic:
                                                                            false,
                                                                        centerMapOnMarkerTap:
                                                                            true,
                                                                      );
                                                                    }),
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 20.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'by clicking \"Publish task\", you agree to  ',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Lato',
                                                            color: Color(
                                                                0xFF494949),
                                                            fontSize: 12.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        32.0, 3.0, 32.0, 20.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
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
                                                                    TermofServiceWidget(),
                                                              ),
                                                            ));
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      },
                                                      child: Text(
                                                        'Terms of Service',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Lato',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      12.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  3.0,
                                                                  0.0,
                                                                  3.0,
                                                                  0.0),
                                                      child: Text(
                                                        'and',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Lato',
                                                              color: Color(
                                                                  0xFF3D3D3D),
                                                              fontSize: 12.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {},
                                                      child: Text(
                                                        'Privacy Policy',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Lato',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      12.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
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
                                      if (responsiveVisibility(
                                        context: context,
                                        desktop: false,
                                      ))
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 60.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 5.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(5.0, 1.0),
                                                    spreadRadius: 2.0,
                                                  )
                                                ],
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        32.0, 0.0, 32.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
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
                                                        context.safePop();
                                                      },
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .keyboard_arrow_left,
                                                            color: Color(
                                                                0xFF292929),
                                                            size: 17.0,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        6.0,
                                                                        0.0,
                                                                        0.0,
                                                                        2.0),
                                                            child: Text(
                                                              'Back',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lato',
                                                                    color: Color(
                                                                        0xFF292929),
                                                                    fontSize:
                                                                        13.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Flexible(
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
                                                          var _shouldSetState =
                                                              false;
                                                          if (getJsonField(
                                                                publishTaskPostReadResponse
                                                                    .jsonBody,
                                                                r'''$.data.poster''',
                                                              ) ==
                                                              getJsonField(
                                                                FFAppState()
                                                                    .userProfile,
                                                                r'''$.data.name''',
                                                              )) {
                                                            if (functions
                                                                    .jsonToInt(
                                                                        getJsonField(
                                                                      publishTaskPostReadResponse
                                                                          .jsonBody,
                                                                      r'''$.data.docstatus''',
                                                                    ))
                                                                    .toString() ==
                                                                '0') {
                                                              _model.updateStatusPost2 =
                                                                  await TaskerpageBackendGroup
                                                                      .updateStatusPostCall
                                                                      .call(
                                                                id: widget.id,
                                                                apiGlobalKey:
                                                                    FFAppState()
                                                                        .apiKey,
                                                                draft: 1,
                                                              );
                                                              _shouldSetState =
                                                                  true;
                                                              if ((_model
                                                                      .updateStatusPost2
                                                                      ?.succeeded ??
                                                                  true)) {
                                                                context.pushNamed(
                                                                    'MyPosts');
                                                              } else {
                                                                if (_shouldSetState)
                                                                  setState(
                                                                      () {});
                                                                return;
                                                              }
                                                            } else {
                                                              context.pushNamed(
                                                                'Task-1',
                                                                queryParameters:
                                                                    {
                                                                  'id':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      publishTaskPostReadResponse
                                                                          .jsonBody,
                                                                      r'''$.data.name''',
                                                                    ).toString(),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            }
                                                          } else {
                                                            _model.userRead1 =
                                                                await TaskerpageBackendGroup
                                                                    .userProfileReadCall
                                                                    .call(
                                                              id: getJsonField(
                                                                publishTaskPostReadResponse
                                                                    .jsonBody,
                                                                r'''$.data.poster''',
                                                              ).toString(),
                                                              apiGlobalKey:
                                                                  FFAppState()
                                                                      .apiKey,
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            _model.startChat229 =
                                                                await TaskerpageBackendGroup
                                                                    .createChatCall
                                                                    .call(
                                                              roomName:
                                                                  'G - (${getJsonField(
                                                                FFAppState()
                                                                    .userProfile,
                                                                r'''$.data.name''',
                                                              ).toString()}-${getJsonField(
                                                                publishTaskPostReadResponse
                                                                    .jsonBody,
                                                                r'''$.data.poster''',
                                                              ).toString()}) T - (${getJsonField(
                                                                publishTaskPostReadResponse
                                                                    .jsonBody,
                                                                r'''$.data.name''',
                                                              ).toString()})',
                                                              users:
                                                                  '[\'${getJsonField(
                                                                (_model.userRead1
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.data.user''',
                                                              ).toString()}\']',
                                                              type: 'Group',
                                                              task:
                                                                  getJsonField(
                                                                publishTaskPostReadResponse
                                                                    .jsonBody,
                                                                r'''$.data.name''',
                                                              ).toString(),
                                                              apiGlobalKey:
                                                                  FFAppState()
                                                                      .apiKey,
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            if ((_model
                                                                    .startChat229
                                                                    ?.succeeded ??
                                                                true)) {
                                                              context.pushNamed(
                                                                'chat',
                                                                pathParameters:
                                                                    {
                                                                  'room':
                                                                      serializeParam(
                                                                    TaskerpageBackendGroup
                                                                        .createChatCall
                                                                        .room(
                                                                          (_model.startChat229?.jsonBody ??
                                                                              ''),
                                                                        )
                                                                        .toString(),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            } else {
                                                              if (_shouldSetState)
                                                                setState(() {});
                                                              return;
                                                            }
                                                          }

                                                          if (_shouldSetState)
                                                            setState(() {});
                                                        },
                                                        child: Container(
                                                          width: 200.0,
                                                          height: 36.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                getJsonField(
                                                                          publishTaskPostReadResponse
                                                                              .jsonBody,
                                                                          r'''$.data.poster''',
                                                                        ) ==
                                                                        getJsonField(
                                                                          FFAppState()
                                                                              .userProfile,
                                                                          r'''$.data.name''',
                                                                        )
                                                                    ? (functions
                                                                                .jsonToInt(getJsonField(
                                                                                  publishTaskPostReadResponse.jsonBody,
                                                                                  r'''$.data.docstatus''',
                                                                                ))
                                                                                .toString() ==
                                                                            '0'
                                                                        ? 'PUBLISH TASK'
                                                                        : 'EDIT TASK')
                                                                    : 'Start Chat',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lato',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14.0,
                                                                    ),
                                                              ),
                                                              if (getJsonField(
                                                                    publishTaskPostReadResponse
                                                                        .jsonBody,
                                                                    r'''$.data.poster''',
                                                                  ) !=
                                                                  getJsonField(
                                                                    FFAppState()
                                                                        .userProfile,
                                                                    r'''$.data.name''',
                                                                  ))
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          6.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Icon(
                                                                    Icons.chat,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 20.0,
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
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 66.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x00FFFFFF),
                                  ),
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
          ),
        );
      },
    );
  }
}
