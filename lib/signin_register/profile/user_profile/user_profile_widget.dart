import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/ad_card_widget.dart';
import '/components/comit_to_post_sheet_widget.dart';
import '/components/filter_web_widget.dart';
import '/components/header_web_search_filter_widget.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/my_posts_sheet_widget.dart';
import '/components/nav_bar_widget.dart';
import '/components/tasker_card_widget.dart';
import '/components/view_certificate_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'user_profile_model.dart';
export 'user_profile_model.dart';

class UserProfileWidget extends StatefulWidget {
  const UserProfileWidget({
    super.key,
    this.id,
  });

  final String? id;

  @override
  State<UserProfileWidget> createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  late UserProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserProfileModel());

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.expandableController3 = ExpandableController(initialExpanded: false);
    _model.expandableController4 = ExpandableController(initialExpanded: false);
    _model.expandableController5 = ExpandableController(initialExpanded: false);
    _model.expandableController6 = ExpandableController(initialExpanded: false);
    _model.expandableController7 = ExpandableController(initialExpanded: false);
    _model.expandableController8 = ExpandableController(initialExpanded: false);
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
      future: TaskerpageBackendGroup.userProfileReadCall.call(
        id: widget.id != null && widget.id != ''
            ? widget.id
            : getJsonField(
                FFAppState().userProfile,
                r'''$.data.name''',
              ).toString(),
        apiGlobalKey: FFAppState().apiKey,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFFF2F2F2),
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
        final userProfileUserProfileReadResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
            backgroundColor: Color(0xFFF2F2F2),
            endDrawer: Container(
              width: double.infinity,
              child: Drawer(
                elevation: 16.0,
                child: WebViewAware(
                  child: wrapWithModel(
                    model: _model.mainDrawerModel,
                    updateCallback: () => setState(() {}),
                    child: MainDrawerWidget(),
                  ),
                ),
              ),
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
                              if (functions.jsonToString(getJsonField(
                                    FFAppState().userProfile,
                                    r'''$.data.name''',
                                  )) !=
                                  widget.id)
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
                        if ((functions.jsonToString(getJsonField(
                                  FFAppState().userProfile,
                                  r'''$.data.name''',
                                )) !=
                                widget.id) &&
                            responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              tabletLandscape: false,
                            ))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                44.0, 0.0, 8.0, 0.0),
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
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: (_model.apiRequestCompleter1 ??=
                                                Completer<ApiCallResponse>()
                                                  ..complete(
                                                      TaskerpageBackendGroup
                                                          .customerProfileListCall
                                                          .call(
                                                    filters:
                                                        valueOrDefault<String>(
                                                      functions
                                                          .convertDataTypeToTaskerFilter(
                                                              FFAppState()
                                                                  .taskerFilter),
                                                      '[]',
                                                    ),
                                                    apiGlobalKey:
                                                        FFAppState().apiKey,
                                                    fields:
                                                        '[\"city\",\"country\",\"name\",\"creation\",\"date_of_birth\",\"first_name\",\"last_name\",\"review_average\",\"review_count\",\"avatar\",\"latitude\",\"longitude\"]',
                                                    orderBy: () {
                                                      if (FFAppState().Sort ==
                                                          'Oldest') {
                                                        return 'creation asc';
                                                      } else if (FFAppState()
                                                              .Sort ==
                                                          'Newest') {
                                                        return 'creation desc';
                                                      } else if (FFAppState()
                                                              .Sort ==
                                                          'Rating') {
                                                        return 'rating_average desc';
                                                      } else {
                                                        return 'creation desc';
                                                      }
                                                    }(),
                                                    orFilters:
                                                        functions.generateQuery(
                                                            FFAppState()
                                                                .taskerFilter
                                                                .searchString,
                                                            ((String var1) {
                                                              return var1
                                                                  .split(',');
                                                            }('first_name,last_name'))
                                                                .toList()),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 35.0,
                                                ),
                                              ),
                                            );
                                          }
                                          final columnCustomerProfileListResponse =
                                              snapshot.data!;
                                          return RefreshIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .tertiary,
                                            onRefresh: () async {
                                              setState(() => _model
                                                  .apiRequestCompleter1 = null);
                                              await _model
                                                  .waitForApiRequestCompleted1();
                                            },
                                            child: SingleChildScrollView(
                                              primary: false,
                                              physics:
                                                  const AlwaysScrollableScrollPhysics(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                32.0,
                                                                27.0,
                                                                32.0,
                                                                0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.43,
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .textController,
                                                              focusNode: _model
                                                                  .textFieldFocusNode,
                                                              onChanged: (_) =>
                                                                  EasyDebounce
                                                                      .debounce(
                                                                '_model.textController',
                                                                Duration(
                                                                    milliseconds:
                                                                        2000),
                                                                () async {
                                                                  setState(() {
                                                                    FFAppState()
                                                                        .updateTaskerFilterStruct(
                                                                      (e) => e
                                                                        ..searchString = _model
                                                                            .textController
                                                                            .text,
                                                                    );
                                                                  });
                                                                  setState(() =>
                                                                      _model.apiRequestCompleter2 =
                                                                          null);
                                                                  await _model
                                                                      .waitForApiRequestCompleted2();
                                                                },
                                                              ),
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                isDense: true,
                                                                labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium,
                                                                hintText:
                                                                    'search tasker ...',
                                                                hintStyle: FlutterFlowTheme.of(
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
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
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
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
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
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
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
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                prefixIcon:
                                                                    Icon(
                                                                  Icons
                                                                      .search_sharp,
                                                                ),
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lato',
                                                                    fontSize:
                                                                        13.0,
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
                                                  Flexible(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  32.0,
                                                                  8.0,
                                                                  32.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (responsiveVisibility(
                                                            context: context,
                                                            desktop: false,
                                                          ))
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      setState(
                                                                          () {
                                                                        FFAppState().mapView =
                                                                            false;
                                                                      });
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100.0,
                                                                      height:
                                                                          36.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0x00FFFFFF),
                                                                        borderRadius:
                                                                            BorderRadius.circular(2.0),
                                                                        border:
                                                                            Border.all(
                                                                          color: !FFAppState().mapView
                                                                              ? FlutterFlowTheme.of(context).primary
                                                                              : FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            'Card View',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Lato',
                                                                                  color: !FFAppState().mapView ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).secondary,
                                                                                  fontSize: 13.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      setState(
                                                                          () {
                                                                        FFAppState().mapView =
                                                                            true;
                                                                      });
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100.0,
                                                                      height:
                                                                          36.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0x00FFFFFF),
                                                                        borderRadius:
                                                                            BorderRadius.circular(2.0),
                                                                        border:
                                                                            Border.all(
                                                                          color: FFAppState().mapView
                                                                              ? FlutterFlowTheme.of(context).primary
                                                                              : FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            'Map View',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Lato',
                                                                                  color: FFAppState().mapView ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).secondary,
                                                                                  fontSize: 13.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 12.0)),
                                                            ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        16.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                wrapWithModel(
                                                              model: _model
                                                                  .adCardModel,
                                                              updateCallback:
                                                                  () => setState(
                                                                      () {}),
                                                              child:
                                                                  AdCardWidget(
                                                                position:
                                                                    'search and filter',
                                                              ),
                                                            ),
                                                          ),
                                                          FutureBuilder<
                                                              ApiCallResponse>(
                                                            future: (_model.apiRequestCompleter2 ??= Completer<
                                                                    ApiCallResponse>()
                                                                  ..complete(
                                                                      TaskerpageBackendGroup
                                                                          .customerProfileListCall
                                                                          .call(
                                                                    filters:
                                                                        valueOrDefault<
                                                                            String>(
                                                                      functions.convertDataTypeToTaskerFilter(
                                                                          FFAppState()
                                                                              .taskerFilter),
                                                                      '[]',
                                                                    ),
                                                                    apiGlobalKey:
                                                                        FFAppState()
                                                                            .apiKey,
                                                                    fields:
                                                                        '[\"city\",\"country\",\"name\",\"creation\",\"date_of_birth\",\"first_name\",\"last_name\",\"review_average\",\"review_count\",\"avatar\",\"latitude\",\"longitude\"]',
                                                                    orderBy:
                                                                        () {
                                                                      if (FFAppState()
                                                                              .Sort ==
                                                                          'Oldest') {
                                                                        return 'creation asc';
                                                                      } else if (FFAppState()
                                                                              .Sort ==
                                                                          'Newest') {
                                                                        return 'creation desc';
                                                                      } else if (FFAppState()
                                                                              .Sort ==
                                                                          'Rating') {
                                                                        return 'rating_average desc';
                                                                      } else {
                                                                        return 'creation desc';
                                                                      }
                                                                    }(),
                                                                    orFilters: functions.generateQuery(
                                                                        FFAppState().taskerFilter.searchString,
                                                                        ((String var1) {
                                                                          return var1
                                                                              .split(',');
                                                                        }('first_name,last_name'))
                                                                            .toList()),
                                                                  )))
                                                                .future,
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 35.0,
                                                                    height:
                                                                        35.0,
                                                                    child:
                                                                        SpinKitThreeBounce(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          35.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              final columnCustomerProfileListResponse =
                                                                  snapshot
                                                                      .data!;
                                                              return SingleChildScrollView(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if (!FFAppState()
                                                                        .mapView)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            10.0),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final taskerList =
                                                                                getJsonField(
                                                                              columnCustomerProfileListResponse.jsonBody,
                                                                              r'''$.data''',
                                                                            ).toList();
                                                                            return ListView.separated(
                                                                              padding: EdgeInsets.zero,
                                                                              primary: false,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: taskerList.length,
                                                                              separatorBuilder: (_, __) => SizedBox(height: 16.0),
                                                                              itemBuilder: (context, taskerListIndex) {
                                                                                final taskerListItem = taskerList[taskerListIndex];
                                                                                return TaskerCardWidget(
                                                                                  key: Key('Keydlq_${taskerListIndex}_of_${taskerList.length}'),
                                                                                  userProfile: taskerListItem,
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    if (FFAppState()
                                                                        .mapView)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            24.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              MediaQuery.sizeOf(context).height * 1.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFF6F6F6),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(8.0),
                                                                            child:
                                                                                FlutterFlowGoogleMap(
                                                                              controller: _model.googleMapsController,
                                                                              onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
                                                                              initialLocation: _model.googleMapsCenter ??= currentUserLocationValue!,
                                                                              markers: (functions.jsonListToLatLng(getJsonField(
                                                                                        columnCustomerProfileListResponse.jsonBody,
                                                                                        r'''$.data''',
                                                                                        true,
                                                                                      )) ??
                                                                                      [])
                                                                                  .map(
                                                                                    (marker) => FlutterFlowMarker(
                                                                                      marker.serialize(),
                                                                                      marker,
                                                                                      () async {
                                                                                        await Future.delayed(const Duration(milliseconds: 1000));

                                                                                        context.pushNamed(
                                                                                          'User_profile',
                                                                                          queryParameters: {
                                                                                            'id': serializeParam(
                                                                                              getJsonField(
                                                                                                columnCustomerProfileListResponse.jsonBody,
                                                                                                r'''$.data.name''',
                                                                                              ).toString(),
                                                                                              ParamType.String,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  )
                                                                                  .toList(),
                                                                              markerColor: GoogleMarkerColor.violet,
                                                                              mapType: MapType.normal,
                                                                              style: GoogleMapStyle.standard,
                                                                              initialZoom: 15.0,
                                                                              allowInteraction: true,
                                                                              allowZoom: true,
                                                                              showZoomControls: false,
                                                                              showLocation: true,
                                                                              showCompass: false,
                                                                              showMapToolbar: false,
                                                                              showTraffic: false,
                                                                              centerMapOnMarkerTap: true,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
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
                                      child: Container(
                                        width: 100.0,
                                        height: 24.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
                                      if ((getJsonField(
                                                userProfileUserProfileReadResponse
                                                    .jsonBody,
                                                r'''$.data.name''',
                                              ) ==
                                              getJsonField(
                                                FFAppState().userProfile,
                                                r'''$.data.name''',
                                              )) &&
                                          responsiveVisibility(
                                            context: context,
                                            desktop: false,
                                          ))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 1.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Flexible(
                                                child: wrapWithModel(
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
                                              ),
                                            ],
                                          ),
                                        ),
                                      Flexible(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (responsiveVisibility(
                                                      context: context,
                                                      desktop: false,
                                                    ))
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              width: 100.0,
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
                                                                    offset:
                                                                        Offset(
                                                                            0.0,
                                                                            0.0),
                                                                    spreadRadius:
                                                                        1.0,
                                                                  )
                                                                ],
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        32.0,
                                                                        20.0,
                                                                        32.0,
                                                                        28.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
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
                                                                                    'Member Number: ',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Lato',
                                                                                          color: Color(0xFF292929),
                                                                                          fontSize: 12.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  getJsonField(
                                                                                    userProfileUserProfileReadResponse.jsonBody,
                                                                                    r'''$.data.name''',
                                                                                  ).toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Lato',
                                                                                        color: Color(0xFF292929),
                                                                                        fontSize: 12.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ].divide(SizedBox(height: 7.0)),
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            if ((getJsonField(
                                                                                      userProfileUserProfileReadResponse.jsonBody,
                                                                                      r'''$.data.name''',
                                                                                    ) !=
                                                                                    getJsonField(
                                                                                      FFAppState().userProfile,
                                                                                      r'''$.data.name''',
                                                                                    )) &&
                                                                                responsiveVisibility(
                                                                                  context: context,
                                                                                  desktop: false,
                                                                                ))
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  context.safePop();
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.close_rounded,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 25.0,
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          24.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                if (functions
                                                                                        .jsonToInt(getJsonField(
                                                                                          userProfileUserProfileReadResponse.jsonBody,
                                                                                          r'''$.data.is_subscribed''',
                                                                                        ))
                                                                                        .toString() ==
                                                                                    '1')
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 161.0,
                                                                                        height: 20.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Color(0xFF494949),
                                                                                        ),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Text(
                                                                                              'PREMIUM',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Lato',
                                                                                                    color: Colors.white,
                                                                                                    fontSize: 12.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Container(
                                                                                        height: 138.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Color(0xFFF9F9F9),
                                                                                          border: Border.all(
                                                                                            color: Color(0xFFDEDEDE),
                                                                                          ),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 12.0, 19.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: Align(
                                                                                                      alignment: AlignmentDirectional(0.0, 1.0),
                                                                                                      child: Stack(
                                                                                                        alignment: AlignmentDirectional(0.0, 1.5),
                                                                                                        children: [
                                                                                                          Align(
                                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                            child: Container(
                                                                                                              width: 80.0,
                                                                                                              height: 80.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: Color(0x00FFFFFF),
                                                                                                                shape: BoxShape.circle,
                                                                                                                border: Border.all(
                                                                                                                  color: Color(0xFFDBDBDB),
                                                                                                                ),
                                                                                                              ),
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsets.all(4.0),
                                                                                                                child: InkWell(
                                                                                                                  splashColor: Colors.transparent,
                                                                                                                  focusColor: Colors.transparent,
                                                                                                                  hoverColor: Colors.transparent,
                                                                                                                  highlightColor: Colors.transparent,
                                                                                                                  onTap: () async {
                                                                                                                    context.pushNamed('Profile_details_seeting');
                                                                                                                  },
                                                                                                                  child: Container(
                                                                                                                    clipBehavior: Clip.antiAlias,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      shape: BoxShape.circle,
                                                                                                                    ),
                                                                                                                    child: Image.network(
                                                                                                                      '${FFAppState().baseUrl}${getJsonField(
                                                                                                                        userProfileUserProfileReadResponse.jsonBody,
                                                                                                                        r'''$.data.avatar''',
                                                                                                                      ).toString()}',
                                                                                                                      fit: BoxFit.cover,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                                    child: Text(
                                                                                                      'Photo Gallery',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Lato',
                                                                                                            color: Color(0xFF494949),
                                                                                                            fontSize: 12.0,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                                          child: Text(
                                                                                                            '${getJsonField(
                                                                                                              userProfileUserProfileReadResponse.jsonBody,
                                                                                                              r'''$.data.first_name''',
                                                                                                            ).toString()} ${getJsonField(
                                                                                                              userProfileUserProfileReadResponse.jsonBody,
                                                                                                              r'''$.data.last_name''',
                                                                                                            ).toString()}',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Lato',
                                                                                                                  color: Color(0xFF292929),
                                                                                                                  fontSize: 18.0,
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        if (functions
                                                                                                                .jsonToInt(getJsonField(
                                                                                                                  userProfileUserProfileReadResponse.jsonBody,
                                                                                                                  r'''$.data.identified''',
                                                                                                                ))
                                                                                                                .toString() ==
                                                                                                            '1')
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                            child: ClipRRect(
                                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                                              child: Image.asset(
                                                                                                                'assets/images/Identification.png',
                                                                                                                width: 18.0,
                                                                                                                height: 18.0,
                                                                                                                fit: BoxFit.none,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        if (functions
                                                                                                                .jsonToInt(getJsonField(
                                                                                                                  userProfileUserProfileReadResponse.jsonBody,
                                                                                                                  r'''$.data.identified''',
                                                                                                                ))
                                                                                                                .toString() ==
                                                                                                            '0')
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                            child: ClipRRect(
                                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                                              child: Image.asset(
                                                                                                                'assets/images/Identifiscation.png',
                                                                                                                width: 18.0,
                                                                                                                height: 18.0,
                                                                                                                fit: BoxFit.none,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(2.0, 6.0, 0.0, 0.0),
                                                                                                      child: Text(
                                                                                                        '${getJsonField(
                                                                                                          userProfileUserProfileReadResponse.jsonBody,
                                                                                                          r'''$.data.city''',
                                                                                                        ).toString()}, ${getJsonField(
                                                                                                          userProfileUserProfileReadResponse.jsonBody,
                                                                                                          r'''$.data.country''',
                                                                                                        ).toString()}',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Lato',
                                                                                                              color: Color(0xFF292929),
                                                                                                              fontSize: 14.0,
                                                                                                              fontWeight: FontWeight.w500,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                      child: RatingBarIndicator(
                                                                                                        itemBuilder: (context, index) => Icon(
                                                                                                          Icons.star_rounded,
                                                                                                          color: Color(0xFFEEC249),
                                                                                                        ),
                                                                                                        direction: Axis.horizontal,
                                                                                                        rating: getJsonField(
                                                                                                          userProfileUserProfileReadResponse.jsonBody,
                                                                                                          r'''$.data.review_average''',
                                                                                                        ),
                                                                                                        unratedColor: Color(0xFFDEDEDE),
                                                                                                        itemCount: 5,
                                                                                                        itemSize: 18.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                    Expanded(
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                                        children: [
                                                                                                          Builder(
                                                                                                            builder: (context) {
                                                                                                              final badges = getJsonField(
                                                                                                                userProfileUserProfileReadResponse.jsonBody,
                                                                                                                r'''$.data.badges''',
                                                                                                              ).toList();
                                                                                                              return Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: List.generate(badges.length, (badgesIndex) {
                                                                                                                  final badgesItem = badges[badgesIndex];
                                                                                                                  return Visibility(
                                                                                                                    visible: functions
                                                                                                                            .jsonToInt(getJsonField(
                                                                                                                              badgesItem,
                                                                                                                              r'''$.enabled''',
                                                                                                                            ))
                                                                                                                            .toString() ==
                                                                                                                        '1',
                                                                                                                    child: ClipRRect(
                                                                                                                      borderRadius: BorderRadius.circular(0.0),
                                                                                                                      child: Image.network(
                                                                                                                        '${FFAppState().baseUrl}${getJsonField(
                                                                                                                          badgesItem,
                                                                                                                          r'''$.active_icon''',
                                                                                                                        ).toString()}',
                                                                                                                        width: 20.0,
                                                                                                                        height: 20.0,
                                                                                                                        fit: BoxFit.cover,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                }).divide(SizedBox(width: 12.0)),
                                                                                                              );
                                                                                                            },
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 25.0)),
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
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          6.0,
                                                                          0.0,
                                                                          12.0),
                                                                      child: FutureBuilder<
                                                                          ApiCallResponse>(
                                                                        future: TaskerpageBackendGroup
                                                                            .getUserCall
                                                                            .call(
                                                                          username:
                                                                              getJsonField(
                                                                            userProfileUserProfileReadResponse.jsonBody,
                                                                            r'''$.data.user''',
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
                                                                          final rowGetUserResponse =
                                                                              snapshot.data!;
                                                                          return Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                'Connections :',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Lato',
                                                                                      color: Color(0xFF292929),
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  functions
                                                                                      .numberofListitems((getJsonField(
                                                                                        rowGetUserResponse.jsonBody,
                                                                                        r'''$.data.following''',
                                                                                        true,
                                                                                      ) as List)
                                                                                          .map<String>((s) => s.toString())
                                                                                          .toList())
                                                                                      .toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Lato',
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontSize: 14.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  'Followers :',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Lato',
                                                                                        color: Color(0xFF292929),
                                                                                        fontSize: 14.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  functions
                                                                                      .numberofListitems((getJsonField(
                                                                                        rowGetUserResponse.jsonBody,
                                                                                        r'''$.data.followers''',
                                                                                        true,
                                                                                      ) as List)
                                                                                          .map<String>((s) => s.toString())
                                                                                          .toList())
                                                                                      .toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Lato',
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontSize: 14.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    Icon(
                                                                                      Icons.share_outlined,
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      size: 20.0,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          14.0,
                                                                          0.0,
                                                                          3.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            functions.jsonToString(getJsonField(
                                                                                      userProfileUserProfileReadResponse.jsonBody,
                                                                                      r'''$.data.role''',
                                                                                    )) ==
                                                                                    'Tasker'
                                                                                ? 'Skills & Interests'
                                                                                : 'Activities & Tasks',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Lato',
                                                                                  color: Color(0xFF222222),
                                                                                  fontSize: 14.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            'I\'m a ${getJsonField(
                                                                              userProfileUserProfileReadResponse.jsonBody,
                                                                              r'''$.data.role''',
                                                                            ).toString()}',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Lato',
                                                                                  color: Color(0xFF8A8A8A),
                                                                                  fontSize: 13.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Divider(
                                                                      thickness:
                                                                          1.0,
                                                                      color: Color(
                                                                          0xFFDEDEDE),
                                                                    ),
                                                                    if (functions
                                                                            .jsonToString(getJsonField(
                                                                          userProfileUserProfileReadResponse
                                                                              .jsonBody,
                                                                          r'''$.data.role''',
                                                                        )) ==
                                                                        'Tasker')
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            18.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child: FutureBuilder<
                                                                            ApiCallResponse>(
                                                                          future: TaskerpageBackendGroup
                                                                              .customerProfileSkillsListCall
                                                                              .call(
                                                                            apiGlobalKey:
                                                                                FFAppState().apiKey,
                                                                            fields:
                                                                                '[\"*\"]',
                                                                            filters:
                                                                                '[[\"customer_profile\",\"=\",\"${getJsonField(
                                                                              userProfileUserProfileReadResponse.jsonBody,
                                                                              r'''$.data.name''',
                                                                            ).toString()}\"]]',
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
                                                                            final listViewCustomerProfileSkillsListResponse =
                                                                                snapshot.data!;
                                                                            return Builder(
                                                                              builder: (context) {
                                                                                final skills = getJsonField(
                                                                                  listViewCustomerProfileSkillsListResponse.jsonBody,
                                                                                  r'''$.data''',
                                                                                ).toList().take(3).toList();
                                                                                return ListView.separated(
                                                                                  padding: EdgeInsets.zero,
                                                                                  primary: false,
                                                                                  shrinkWrap: true,
                                                                                  scrollDirection: Axis.vertical,
                                                                                  itemCount: skills.length,
                                                                                  separatorBuilder: (_, __) => SizedBox(height: 8.0),
                                                                                  itemBuilder: (context, skillsIndex) {
                                                                                    final skillsItem = skills[skillsIndex];
                                                                                    return Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Flexible(
                                                                                          child: Container(
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              boxShadow: [
                                                                                                BoxShadow(
                                                                                                  blurRadius: 4.0,
                                                                                                  color: Color(0x33000000),
                                                                                                  offset: Offset(0.0, 2.0),
                                                                                                  spreadRadius: 1.0,
                                                                                                )
                                                                                              ],
                                                                                            ),
                                                                                            child: Container(
                                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                              color: Colors.white,
                                                                                              child: ExpandableNotifier(
                                                                                                initialExpanded: false,
                                                                                                child: ExpandablePanel(
                                                                                                  header: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          width: 32.0,
                                                                                                          height: 32.0,
                                                                                                          clipBehavior: Clip.antiAlias,
                                                                                                          decoration: BoxDecoration(
                                                                                                            shape: BoxShape.circle,
                                                                                                          ),
                                                                                                          child: Image.network(
                                                                                                            '${FFAppState().baseUrl}${getJsonField(
                                                                                                              skillsItem,
                                                                                                              r'''$.icon''',
                                                                                                            ).toString()}',
                                                                                                            fit: BoxFit.cover,
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.5, 0.0, 0.0, 0.0),
                                                                                                          child: Text(
                                                                                                            getJsonField(
                                                                                                              skillsItem,
                                                                                                              r'''$.skill_category_name''',
                                                                                                            ).toString(),
                                                                                                            style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                                                  fontFamily: 'Lato',
                                                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                                                  fontSize: 14.0,
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  collapsed: Container(
                                                                                                    width: double.infinity,
                                                                                                    height: 9.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    ),
                                                                                                  ),
                                                                                                  expanded: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          width: double.infinity,
                                                                                                          height: 150.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: Color(0xFFF9F9F9),
                                                                                                            boxShadow: [
                                                                                                              BoxShadow(
                                                                                                                blurRadius: 4.0,
                                                                                                                color: Color(0x33000000),
                                                                                                                offset: Offset(0.0, 2.0),
                                                                                                                spreadRadius: 1.0,
                                                                                                              )
                                                                                                            ],
                                                                                                          ),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 20.0),
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 19.0, 0.0, 0.0),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        'Skills',
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'Lato',
                                                                                                                              color: Color(0xFF222222),
                                                                                                                              fontSize: 13.0,
                                                                                                                              fontWeight: FontWeight.w500,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 0.0, 0.0),
                                                                                                                  child: FutureBuilder<ApiCallResponse>(
                                                                                                                    future: TaskerpageBackendGroup.getCustomerProfileSkillsDetailsCall.call(
                                                                                                                      name: getJsonField(
                                                                                                                        skillsItem,
                                                                                                                        r'''$.name''',
                                                                                                                      ).toString(),
                                                                                                                      apiGlobalKey: FFAppState().apiKey,
                                                                                                                    ),
                                                                                                                    builder: (context, snapshot) {
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
                                                                                                                      final rowGetCustomerProfileSkillsDetailsResponse = snapshot.data!;
                                                                                                                      return Builder(
                                                                                                                        builder: (context) {
                                                                                                                          final skill = getJsonField(
                                                                                                                            rowGetCustomerProfileSkillsDetailsResponse.jsonBody,
                                                                                                                            r'''$.data.skills''',
                                                                                                                          ).toList();
                                                                                                                          return SingleChildScrollView(
                                                                                                                            scrollDirection: Axis.horizontal,
                                                                                                                            child: Row(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              children: List.generate(skill.length, (skillIndex) {
                                                                                                                                final skillItem = skill[skillIndex];
                                                                                                                                return Container(
                                                                                                                                  height: 22.0,
                                                                                                                                  decoration: BoxDecoration(
                                                                                                                                    color: Color(0xFFDEDEDE),
                                                                                                                                    borderRadius: BorderRadius.circular(2.0),
                                                                                                                                  ),
                                                                                                                                  child: Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 21.0, 0.0),
                                                                                                                                    child: Row(
                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                      children: [
                                                                                                                                        Text(
                                                                                                                                          getJsonField(
                                                                                                                                            skillItem,
                                                                                                                                            r'''$.skill_name''',
                                                                                                                                          ).toString(),
                                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                fontFamily: 'Lato',
                                                                                                                                                fontSize: 13.0,
                                                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                                              ),
                                                                                                                                        ),
                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                );
                                                                                                                              }).divide(SizedBox(width: 8.0)),
                                                                                                                            ),
                                                                                                                          );
                                                                                                                        },
                                                                                                                      );
                                                                                                                    },
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 19.0, 0.0, 0.0),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        'Skill level',
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'Lato',
                                                                                                                              color: Color(0xFF222222),
                                                                                                                              fontSize: 13.0,
                                                                                                                              fontWeight: FontWeight.w500,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 0.0, 0.0),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Container(
                                                                                                                        height: 22.0,
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          color: Color(0xFFDEDEDE),
                                                                                                                          borderRadius: BorderRadius.circular(2.0),
                                                                                                                        ),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 21.0, 0.0),
                                                                                                                          child: Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            children: [
                                                                                                                              Text(
                                                                                                                                valueOrDefault<String>(
                                                                                                                                  getJsonField(
                                                                                                                                    skillsItem,
                                                                                                                                    r'''$.skill_level''',
                                                                                                                                  )?.toString(),
                                                                                                                                  '-',
                                                                                                                                ),
                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                      fontFamily: 'Lato',
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
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  theme: ExpandableThemeData(
                                                                                                    tapHeaderToExpand: true,
                                                                                                    tapBodyToExpand: false,
                                                                                                    tapBodyToCollapse: false,
                                                                                                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                                    hasIcon: true,
                                                                                                    expandIcon: Icons.add,
                                                                                                    collapseIcon: Icons.close_rounded,
                                                                                                    iconColor: FlutterFlowTheme.of(context).primary,
                                                                                                    iconPadding: EdgeInsets.fromLTRB(0.0, 12.0, 8.0, 0.0),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    if (functions
                                                                            .jsonToString(getJsonField(
                                                                          userProfileUserProfileReadResponse
                                                                              .jsonBody,
                                                                          r'''$.data.role''',
                                                                        )) ==
                                                                        'Tasker')
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            14.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              'See more',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Lato',
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    fontSize: 14.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                            Icon(
                                                                              Icons.keyboard_arrow_down_rounded,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 18.0,
                                                                            ),
                                                                          ].divide(SizedBox(width: 8.0)),
                                                                        ),
                                                                      ),
                                                                    if (functions
                                                                            .jsonToString(getJsonField(
                                                                          userProfileUserProfileReadResponse
                                                                              .jsonBody,
                                                                          r'''$.data.role''',
                                                                        )) ==
                                                                        'Poster')
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            18.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child: FutureBuilder<
                                                                            ApiCallResponse>(
                                                                          future: TaskerpageBackendGroup
                                                                              .myPostsCall
                                                                              .call(
                                                                            apiGlobalKey:
                                                                                FFAppState().apiKey,
                                                                            filters:
                                                                                '[[\"poster\",\"=\",\"${getJsonField(
                                                                              userProfileUserProfileReadResponse.jsonBody,
                                                                              r'''$.data.name''',
                                                                            ).toString()}\"]]',
                                                                            fields:
                                                                                '[\"name\",\"creation\",\"skill_name\"]',
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
                                                                            final listViewMyPostsResponse =
                                                                                snapshot.data!;
                                                                            return Builder(
                                                                              builder: (context) {
                                                                                final tasks = getJsonField(
                                                                                  listViewMyPostsResponse.jsonBody,
                                                                                  r'''$.data''',
                                                                                ).toList().take(3).toList();
                                                                                return ListView.separated(
                                                                                  padding: EdgeInsets.zero,
                                                                                  primary: false,
                                                                                  shrinkWrap: true,
                                                                                  scrollDirection: Axis.vertical,
                                                                                  itemCount: tasks.length,
                                                                                  separatorBuilder: (_, __) => SizedBox(height: 8.0),
                                                                                  itemBuilder: (context, tasksIndex) {
                                                                                    final tasksItem = tasks[tasksIndex];
                                                                                    return Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              context.pushNamed(
                                                                                                'PublishTask',
                                                                                                queryParameters: {
                                                                                                  'id': serializeParam(
                                                                                                    getJsonField(
                                                                                                      tasksItem,
                                                                                                      r'''$.name''',
                                                                                                    ).toString(),
                                                                                                    ParamType.String,
                                                                                                  ),
                                                                                                }.withoutNulls,
                                                                                              );
                                                                                            },
                                                                                            child: Container(
                                                                                              width: 100.0,
                                                                                              height: 50.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                boxShadow: [
                                                                                                  BoxShadow(
                                                                                                    blurRadius: 4.0,
                                                                                                    color: Color(0x33000000),
                                                                                                    offset: Offset(0.0, 2.0),
                                                                                                    spreadRadius: 1.0,
                                                                                                  )
                                                                                                ],
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 8.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      getJsonField(
                                                                                                        tasksItem,
                                                                                                        r'''$.skill_name''',
                                                                                                      ).toString(),
                                                                                                      style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                                            fontFamily: 'Lato',
                                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                                            fontSize: 14.0,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Icon(
                                                                                                      Icons.keyboard_arrow_right,
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      size: 20.0,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    if (functions
                                                                            .jsonToString(getJsonField(
                                                                          userProfileUserProfileReadResponse
                                                                              .jsonBody,
                                                                          r'''$.data.role''',
                                                                        )) ==
                                                                        'Poster')
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            14.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              'See more',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Lato',
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    fontSize: 14.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                            Icon(
                                                                              Icons.keyboard_arrow_down_rounded,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 18.0,
                                                                            ),
                                                                          ].divide(SizedBox(width: 8.0)),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
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
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    10.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        valueOrDefault<
                                                                            double>(
                                                                          () {
                                                                            if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointSmall) {
                                                                              return 0.0;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointMedium) {
                                                                              return 0.0;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointLarge) {
                                                                              return (functions.jsonToString(getJsonField(
                                                                                        FFAppState().userProfile,
                                                                                        r'''$.data.name''',
                                                                                      )) ==
                                                                                      widget.id
                                                                                  ? FFAppConstants.largCardLR.toDouble()
                                                                                  : 0.0);
                                                                            } else {
                                                                              return (functions.jsonToString(getJsonField(
                                                                                        FFAppState().userProfile,
                                                                                        r'''$.data.name''',
                                                                                      )) ==
                                                                                      widget.id
                                                                                  ? FFAppConstants.largCardLR.toDouble()
                                                                                  : 0.0);
                                                                            }
                                                                          }(),
                                                                          0.0,
                                                                        ),
                                                                        valueOrDefault<
                                                                            double>(
                                                                          () {
                                                                            if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointSmall) {
                                                                              return 0.0;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointMedium) {
                                                                              return 0.0;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointLarge) {
                                                                              return (functions.jsonToString(getJsonField(
                                                                                        FFAppState().userProfile,
                                                                                        r'''$.data.name''',
                                                                                      )) ==
                                                                                      widget.id
                                                                                  ? FFAppConstants.largCardUD.toDouble()
                                                                                  : 0.0);
                                                                            } else {
                                                                              return (functions.jsonToString(getJsonField(
                                                                                        FFAppState().userProfile,
                                                                                        r'''$.data.name''',
                                                                                      )) ==
                                                                                      widget.id
                                                                                  ? FFAppConstants.largCardUD.toDouble()
                                                                                  : 0.0);
                                                                            }
                                                                          }(),
                                                                          0.0,
                                                                        ),
                                                                        valueOrDefault<
                                                                            double>(
                                                                          () {
                                                                            if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointSmall) {
                                                                              return 0.0;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointMedium) {
                                                                              return 0.0;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointLarge) {
                                                                              return (functions.jsonToString(getJsonField(
                                                                                        FFAppState().userProfile,
                                                                                        r'''$.data.name''',
                                                                                      )) ==
                                                                                      widget.id
                                                                                  ? FFAppConstants.largCardLR.toDouble()
                                                                                  : 0.0);
                                                                            } else {
                                                                              return (functions.jsonToString(getJsonField(
                                                                                        FFAppState().userProfile,
                                                                                        r'''$.data.name''',
                                                                                      )) ==
                                                                                      widget.id
                                                                                  ? FFAppConstants.largCardLR.toDouble()
                                                                                  : 0.0);
                                                                            }
                                                                          }(),
                                                                          0.0,
                                                                        ),
                                                                        valueOrDefault<
                                                                            double>(
                                                                          () {
                                                                            if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointSmall) {
                                                                              return 0.0;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointMedium) {
                                                                              return 0.0;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointLarge) {
                                                                              return (functions.jsonToString(getJsonField(
                                                                                        FFAppState().userProfile,
                                                                                        r'''$.data.name''',
                                                                                      )) ==
                                                                                      widget.id
                                                                                  ? FFAppConstants.largCardUD.toDouble()
                                                                                  : 0.0);
                                                                            } else {
                                                                              return (functions.jsonToString(getJsonField(
                                                                                        FFAppState().userProfile,
                                                                                        r'''$.data.name''',
                                                                                      )) ==
                                                                                      widget.id
                                                                                  ? FFAppConstants.largCardUD.toDouble()
                                                                                  : 0.0);
                                                                            }
                                                                          }(),
                                                                          0.0,
                                                                        )),
                                                                child:
                                                                    Container(
                                                                  width: 100.0,
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
                                                                            0.0),
                                                                        spreadRadius:
                                                                            1.0,
                                                                      )
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            32.0,
                                                                            20.0,
                                                                            32.0,
                                                                            28.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
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
                                                                                        'Tasker Number: ',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Lato',
                                                                                              color: Color(0xFF292929),
                                                                                              fontSize: 12.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      getJsonField(
                                                                                        userProfileUserProfileReadResponse.jsonBody,
                                                                                        r'''$.data.name''',
                                                                                      ).toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Lato',
                                                                                            color: Color(0xFF292929),
                                                                                            fontSize: 12.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ].divide(SizedBox(height: 7.0)),
                                                                            ),
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                if ((getJsonField(
                                                                                          userProfileUserProfileReadResponse.jsonBody,
                                                                                          r'''$.data.name''',
                                                                                        ) !=
                                                                                        getJsonField(
                                                                                          FFAppState().userProfile,
                                                                                          r'''$.data.name''',
                                                                                        )) &&
                                                                                    responsiveVisibility(
                                                                                      context: context,
                                                                                      desktop: false,
                                                                                    ))
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      context.safePop();
                                                                                    },
                                                                                    child: Icon(
                                                                                      Icons.close_rounded,
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      size: 25.0,
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    if (functions.jsonToString(getJsonField(
                                                                                          userProfileUserProfileReadResponse.jsonBody,
                                                                                          r'''$.data.role''',
                                                                                        )) ==
                                                                                        'Tasker') {
                                                                                      await showModalBottomSheet(
                                                                                        isScrollControlled: true,
                                                                                        backgroundColor: Colors.transparent,
                                                                                        enableDrag: false,
                                                                                        context: context,
                                                                                        builder: (context) {
                                                                                          return WebViewAware(
                                                                                            child: GestureDetector(
                                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                              child: Padding(
                                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                                child: MyPostsSheetWidget(
                                                                                                  customerProfile: getJsonField(
                                                                                                    userProfileUserProfileReadResponse.jsonBody,
                                                                                                    r'''$.data''',
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ).then((value) => safeSetState(() {}));
                                                                                    } else {
                                                                                      await showModalBottomSheet(
                                                                                        isScrollControlled: true,
                                                                                        backgroundColor: Colors.transparent,
                                                                                        enableDrag: false,
                                                                                        context: context,
                                                                                        builder: (context) {
                                                                                          return WebViewAware(
                                                                                            child: GestureDetector(
                                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                              child: Padding(
                                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                                child: ComitToPostSheetWidget(
                                                                                                  id: getJsonField(
                                                                                                    userProfileUserProfileReadResponse.jsonBody,
                                                                                                    r'''$.data.name''',
                                                                                                  ),
                                                                                                  name: getJsonField(
                                                                                                    userProfileUserProfileReadResponse.jsonBody,
                                                                                                    r'''$.data.first_name''',
                                                                                                  ).toString(),
                                                                                                  family: getJsonField(
                                                                                                    userProfileUserProfileReadResponse.jsonBody,
                                                                                                    r'''$.data.last_name''',
                                                                                                  ).toString(),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ).then((value) => safeSetState(() {}));
                                                                                    }
                                                                                  },
                                                                                  child: Container(
                                                                                    width: 144.0,
                                                                                    height: 36.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      boxShadow: [
                                                                                        BoxShadow(
                                                                                          blurRadius: 4.0,
                                                                                          color: Color(0x33000000),
                                                                                          offset: Offset(0.0, 2.0),
                                                                                        )
                                                                                      ],
                                                                                      borderRadius: BorderRadius.circular(1.0),
                                                                                    ),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        Text(
                                                                                          functions.jsonToString(getJsonField(
                                                                                                    userProfileUserProfileReadResponse.jsonBody,
                                                                                                    r'''$.data.role''',
                                                                                                  )) ==
                                                                                                  'Tasker'
                                                                                              ? 'Invite to my task'
                                                                                              : 'Commit to post',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    _model.followREQMain = await TaskerpageBackendGroup.followReqCall.call(
                                                                                      requestor: getJsonField(
                                                                                        FFAppState().userProfile,
                                                                                        r'''$.data.name''',
                                                                                      ),
                                                                                      requested: getJsonField(
                                                                                        userProfileUserProfileReadResponse.jsonBody,
                                                                                        r'''$.data.name''',
                                                                                      ),
                                                                                      status: 'Pending',
                                                                                      requestMessage: 'Hi, i\'m ${getJsonField(
                                                                                        FFAppState().userProfile,
                                                                                        r'''$.data.first_name''',
                                                                                      ).toString()} ${getJsonField(
                                                                                        FFAppState().userProfile,
                                                                                        r'''$.data.last_name''',
                                                                                      ).toString()} with ${getJsonField(
                                                                                        FFAppState().userProfile,
                                                                                        r'''$.data.years_of_experience''',
                                                                                      ).toString()} years of experience !',
                                                                                      apiGlobalKey: FFAppState().apiKey,
                                                                                    );
                                                                                    if ((_model.followREQMain?.succeeded ?? true)) {
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            'Connection request sent ',
                                                                                            style: TextStyle(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontSize: 13.0,
                                                                                            ),
                                                                                          ),
                                                                                          duration: Duration(milliseconds: 4000),
                                                                                          backgroundColor: Colors.white,
                                                                                        ),
                                                                                      );
                                                                                    } else {
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            'Pleas try again !',
                                                                                            style: TextStyle(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontSize: 13.0,
                                                                                            ),
                                                                                          ),
                                                                                          duration: Duration(milliseconds: 4000),
                                                                                          backgroundColor: Colors.white,
                                                                                        ),
                                                                                      );
                                                                                    }

                                                                                    setState(() {});
                                                                                  },
                                                                                  child: Container(
                                                                                    width: 130.0,
                                                                                    height: 36.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      borderRadius: BorderRadius.circular(1.0),
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                    ),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Connect',
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
                                                                              ].divide(SizedBox(width: 8.0)),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              24.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    if (functions
                                                                                            .jsonToInt(getJsonField(
                                                                                              userProfileUserProfileReadResponse.jsonBody,
                                                                                              r'''$.data.is_subscribed''',
                                                                                            ))
                                                                                            .toString() ==
                                                                                        '1')
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: 161.0,
                                                                                            height: 20.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: Color(0xFF494949),
                                                                                            ),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'PREMIUM',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Lato',
                                                                                                        color: Colors.white,
                                                                                                        fontSize: 12.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Container(
                                                                                            height: 138.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: Color(0xFFF9F9F9),
                                                                                              border: Border.all(
                                                                                                color: Color(0xFFDEDEDE),
                                                                                              ),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 12.0, 19.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      Expanded(
                                                                                                        child: Align(
                                                                                                          alignment: AlignmentDirectional(0.0, 1.0),
                                                                                                          child: Stack(
                                                                                                            alignment: AlignmentDirectional(0.0, 1.5),
                                                                                                            children: [
                                                                                                              Align(
                                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                child: Container(
                                                                                                                  width: 80.0,
                                                                                                                  height: 80.0,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    color: Color(0x00FFFFFF),
                                                                                                                    shape: BoxShape.circle,
                                                                                                                    border: Border.all(
                                                                                                                      color: Color(0xFFDBDBDB),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsets.all(4.0),
                                                                                                                    child: InkWell(
                                                                                                                      splashColor: Colors.transparent,
                                                                                                                      focusColor: Colors.transparent,
                                                                                                                      hoverColor: Colors.transparent,
                                                                                                                      highlightColor: Colors.transparent,
                                                                                                                      onTap: () async {
                                                                                                                        context.pushNamed('Profile_details_seeting');
                                                                                                                      },
                                                                                                                      child: Container(
                                                                                                                        clipBehavior: Clip.antiAlias,
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          shape: BoxShape.circle,
                                                                                                                        ),
                                                                                                                        child: Image.network(
                                                                                                                          '${FFAppState().baseUrl}${getJsonField(
                                                                                                                            userProfileUserProfileReadResponse.jsonBody,
                                                                                                                            r'''$.data.avatar''',
                                                                                                                          ).toString()}',
                                                                                                                          fit: BoxFit.cover,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                                        child: Text(
                                                                                                          'Photo Gallery',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Lato',
                                                                                                                color: Color(0xFF494949),
                                                                                                                fontSize: 12.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Expanded(
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                                              child: Text(
                                                                                                                '${getJsonField(
                                                                                                                  userProfileUserProfileReadResponse.jsonBody,
                                                                                                                  r'''$.data.first_name''',
                                                                                                                ).toString()} ${getJsonField(
                                                                                                                  userProfileUserProfileReadResponse.jsonBody,
                                                                                                                  r'''$.data.last_name''',
                                                                                                                ).toString()}',
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Lato',
                                                                                                                      color: Color(0xFF292929),
                                                                                                                      fontSize: 18.0,
                                                                                                                      fontWeight: FontWeight.w500,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            if (functions
                                                                                                                    .jsonToInt(getJsonField(
                                                                                                                      userProfileUserProfileReadResponse.jsonBody,
                                                                                                                      r'''$.data.identified''',
                                                                                                                    ))
                                                                                                                    .toString() ==
                                                                                                                '1')
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                child: ClipRRect(
                                                                                                                  borderRadius: BorderRadius.circular(0.0),
                                                                                                                  child: Image.asset(
                                                                                                                    'assets/images/Identification.png',
                                                                                                                    width: 18.0,
                                                                                                                    height: 18.0,
                                                                                                                    fit: BoxFit.none,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            if (functions
                                                                                                                    .jsonToInt(getJsonField(
                                                                                                                      userProfileUserProfileReadResponse.jsonBody,
                                                                                                                      r'''$.data.identified''',
                                                                                                                    ))
                                                                                                                    .toString() ==
                                                                                                                '0')
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                child: ClipRRect(
                                                                                                                  borderRadius: BorderRadius.circular(0.0),
                                                                                                                  child: Image.asset(
                                                                                                                    'assets/images/Identifiscation.png',
                                                                                                                    width: 18.0,
                                                                                                                    height: 18.0,
                                                                                                                    fit: BoxFit.none,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                          ],
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(2.0, 6.0, 0.0, 0.0),
                                                                                                          child: Text(
                                                                                                            '${getJsonField(
                                                                                                              userProfileUserProfileReadResponse.jsonBody,
                                                                                                              r'''$.data.city''',
                                                                                                            ).toString()}, ${getJsonField(
                                                                                                              userProfileUserProfileReadResponse.jsonBody,
                                                                                                              r'''$.data.country''',
                                                                                                            ).toString()}',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Lato',
                                                                                                                  color: Color(0xFF292929),
                                                                                                                  fontSize: 14.0,
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                          child: RatingBarIndicator(
                                                                                                            itemBuilder: (context, index) => Icon(
                                                                                                              Icons.star_rounded,
                                                                                                              color: Color(0xFFEEC249),
                                                                                                            ),
                                                                                                            direction: Axis.horizontal,
                                                                                                            rating: getJsonField(
                                                                                                              userProfileUserProfileReadResponse.jsonBody,
                                                                                                              r'''$.data.review_average''',
                                                                                                            ),
                                                                                                            unratedColor: Color(0xFFDEDEDE),
                                                                                                            itemCount: 5,
                                                                                                            itemSize: 18.0,
                                                                                                          ),
                                                                                                        ),
                                                                                                        Expanded(
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                                                            children: [
                                                                                                              Builder(
                                                                                                                builder: (context) {
                                                                                                                  final badges = getJsonField(
                                                                                                                    userProfileUserProfileReadResponse.jsonBody,
                                                                                                                    r'''$.data.badges''',
                                                                                                                  ).toList();
                                                                                                                  return Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: List.generate(badges.length, (badgesIndex) {
                                                                                                                      final badgesItem = badges[badgesIndex];
                                                                                                                      return Visibility(
                                                                                                                        visible: functions
                                                                                                                                .jsonToInt(getJsonField(
                                                                                                                                  badgesItem,
                                                                                                                                  r'''$.enabled''',
                                                                                                                                ))
                                                                                                                                .toString() ==
                                                                                                                            '1',
                                                                                                                        child: ClipRRect(
                                                                                                                          borderRadius: BorderRadius.circular(0.0),
                                                                                                                          child: Image.network(
                                                                                                                            '${FFAppState().baseUrl}${getJsonField(
                                                                                                                              badgesItem,
                                                                                                                              r'''$.active_icon''',
                                                                                                                            ).toString()}',
                                                                                                                            width: 20.0,
                                                                                                                            height: 20.0,
                                                                                                                            fit: BoxFit.cover,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      );
                                                                                                                    }).divide(SizedBox(width: 12.0)),
                                                                                                                  );
                                                                                                                },
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 25.0)),
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
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              6.0,
                                                                              0.0,
                                                                              12.0),
                                                                          child:
                                                                              FutureBuilder<ApiCallResponse>(
                                                                            future:
                                                                                TaskerpageBackendGroup.getUserCall.call(
                                                                              username: getJsonField(
                                                                                userProfileUserProfileReadResponse.jsonBody,
                                                                                r'''$.data.user''',
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
                                                                              final rowGetUserResponse = snapshot.data!;
                                                                              return Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Text(
                                                                                    'Connections :',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Lato',
                                                                                          color: Color(0xFF292929),
                                                                                          fontSize: 14.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      functions
                                                                                          .numberofListitems((getJsonField(
                                                                                            rowGetUserResponse.jsonBody,
                                                                                            r'''$.data.following''',
                                                                                            true,
                                                                                          ) as List)
                                                                                              .map<String>((s) => s.toString())
                                                                                              .toList())
                                                                                          .toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Lato',
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            fontSize: 14.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      'Followers :',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Lato',
                                                                                            color: Color(0xFF292929),
                                                                                            fontSize: 14.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      functions
                                                                                          .numberofListitems((getJsonField(
                                                                                            rowGetUserResponse.jsonBody,
                                                                                            r'''$.data.followers''',
                                                                                            true,
                                                                                          ) as List)
                                                                                              .map<String>((s) => s.toString())
                                                                                              .toList())
                                                                                          .toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Lato',
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            fontSize: 14.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                      children: [
                                                                                        Icon(
                                                                                          Icons.share_outlined,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 20.0,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              14.0,
                                                                              0.0,
                                                                              3.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                functions.jsonToString(getJsonField(
                                                                                          userProfileUserProfileReadResponse.jsonBody,
                                                                                          r'''$.data.role''',
                                                                                        )) ==
                                                                                        'Tasker'
                                                                                    ? 'Skills & Interests'
                                                                                    : 'Activities & Tasks',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Lato',
                                                                                      color: Color(0xFF222222),
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                'I\'m a ${getJsonField(
                                                                                  userProfileUserProfileReadResponse.jsonBody,
                                                                                  r'''$.data.role''',
                                                                                ).toString()}',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Lato',
                                                                                      color: Color(0xFF8A8A8A),
                                                                                      fontSize: 13.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Divider(
                                                                          thickness:
                                                                              1.0,
                                                                          color:
                                                                              Color(0xFFDEDEDE),
                                                                        ),
                                                                        if (functions.jsonToString(getJsonField(
                                                                              userProfileUserProfileReadResponse.jsonBody,
                                                                              r'''$.data.role''',
                                                                            )) ==
                                                                            'Tasker')
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                18.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                FutureBuilder<ApiCallResponse>(
                                                                              future: TaskerpageBackendGroup.customerProfileSkillsListCall.call(
                                                                                apiGlobalKey: FFAppState().apiKey,
                                                                                fields: '[\"*\"]',
                                                                                filters: '[[\"customer_profile\",\"=\",\"${getJsonField(
                                                                                  userProfileUserProfileReadResponse.jsonBody,
                                                                                  r'''$.data.name''',
                                                                                ).toString()}\"]]',
                                                                              ),
                                                                              builder: (context, snapshot) {
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
                                                                                final listViewCustomerProfileSkillsListResponse = snapshot.data!;
                                                                                return Builder(
                                                                                  builder: (context) {
                                                                                    final skills = getJsonField(
                                                                                      listViewCustomerProfileSkillsListResponse.jsonBody,
                                                                                      r'''$.data''',
                                                                                    ).toList().take(3).toList();
                                                                                    return ListView.separated(
                                                                                      padding: EdgeInsets.zero,
                                                                                      primary: false,
                                                                                      shrinkWrap: true,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      itemCount: skills.length,
                                                                                      separatorBuilder: (_, __) => SizedBox(height: 8.0),
                                                                                      itemBuilder: (context, skillsIndex) {
                                                                                        final skillsItem = skills[skillsIndex];
                                                                                        return Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  boxShadow: [
                                                                                                    BoxShadow(
                                                                                                      blurRadius: 4.0,
                                                                                                      color: Color(0x33000000),
                                                                                                      offset: Offset(0.0, 2.0),
                                                                                                      spreadRadius: 1.0,
                                                                                                    )
                                                                                                  ],
                                                                                                ),
                                                                                                child: Container(
                                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                  color: Colors.white,
                                                                                                  child: ExpandableNotifier(
                                                                                                    initialExpanded: false,
                                                                                                    child: ExpandablePanel(
                                                                                                      header: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 0.0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                          children: [
                                                                                                            Container(
                                                                                                              width: 32.0,
                                                                                                              height: 32.0,
                                                                                                              clipBehavior: Clip.antiAlias,
                                                                                                              decoration: BoxDecoration(
                                                                                                                shape: BoxShape.circle,
                                                                                                              ),
                                                                                                              child: Image.network(
                                                                                                                '${FFAppState().baseUrl}${getJsonField(
                                                                                                                  skillsItem,
                                                                                                                  r'''$.icon''',
                                                                                                                ).toString()}',
                                                                                                                fit: BoxFit.cover,
                                                                                                              ),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.5, 0.0, 0.0, 0.0),
                                                                                                              child: Text(
                                                                                                                getJsonField(
                                                                                                                  skillsItem,
                                                                                                                  r'''$.skill_category_name''',
                                                                                                                ).toString(),
                                                                                                                style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                                                      fontFamily: 'Lato',
                                                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                                                      fontSize: 14.0,
                                                                                                                      fontWeight: FontWeight.w500,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      collapsed: Container(
                                                                                                        width: double.infinity,
                                                                                                        height: 9.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        ),
                                                                                                      ),
                                                                                                      expanded: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                                          children: [
                                                                                                            Container(
                                                                                                              width: double.infinity,
                                                                                                              height: 150.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: Color(0xFFF9F9F9),
                                                                                                                boxShadow: [
                                                                                                                  BoxShadow(
                                                                                                                    blurRadius: 4.0,
                                                                                                                    color: Color(0x33000000),
                                                                                                                    offset: Offset(0.0, 2.0),
                                                                                                                    spreadRadius: 1.0,
                                                                                                                  )
                                                                                                                ],
                                                                                                              ),
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 20.0),
                                                                                                                child: Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 19.0, 0.0, 0.0),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Text(
                                                                                                                            'Skills',
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: 'Lato',
                                                                                                                                  color: Color(0xFF222222),
                                                                                                                                  fontSize: 13.0,
                                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 0.0, 0.0),
                                                                                                                      child: FutureBuilder<ApiCallResponse>(
                                                                                                                        future: TaskerpageBackendGroup.getCustomerProfileSkillsDetailsCall.call(
                                                                                                                          name: getJsonField(
                                                                                                                            skillsItem,
                                                                                                                            r'''$.name''',
                                                                                                                          ).toString(),
                                                                                                                          apiGlobalKey: FFAppState().apiKey,
                                                                                                                        ),
                                                                                                                        builder: (context, snapshot) {
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
                                                                                                                          final rowGetCustomerProfileSkillsDetailsResponse = snapshot.data!;
                                                                                                                          return Builder(
                                                                                                                            builder: (context) {
                                                                                                                              final skill = getJsonField(
                                                                                                                                rowGetCustomerProfileSkillsDetailsResponse.jsonBody,
                                                                                                                                r'''$.data.skills''',
                                                                                                                              ).toList();
                                                                                                                              return SingleChildScrollView(
                                                                                                                                scrollDirection: Axis.horizontal,
                                                                                                                                child: Row(
                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                  children: List.generate(skill.length, (skillIndex) {
                                                                                                                                    final skillItem = skill[skillIndex];
                                                                                                                                    return Container(
                                                                                                                                      height: 22.0,
                                                                                                                                      decoration: BoxDecoration(
                                                                                                                                        color: Color(0xFFDEDEDE),
                                                                                                                                        borderRadius: BorderRadius.circular(2.0),
                                                                                                                                      ),
                                                                                                                                      child: Padding(
                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 21.0, 0.0),
                                                                                                                                        child: Row(
                                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                                          children: [
                                                                                                                                            Text(
                                                                                                                                              getJsonField(
                                                                                                                                                skillItem,
                                                                                                                                                r'''$.skill_name''',
                                                                                                                                              ).toString(),
                                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                    fontFamily: 'Lato',
                                                                                                                                                    fontSize: 13.0,
                                                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                                                  ),
                                                                                                                                            ),
                                                                                                                                          ],
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    );
                                                                                                                                  }).divide(SizedBox(width: 8.0)),
                                                                                                                                ),
                                                                                                                              );
                                                                                                                            },
                                                                                                                          );
                                                                                                                        },
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 19.0, 0.0, 0.0),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Text(
                                                                                                                            'Skill level',
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: 'Lato',
                                                                                                                                  color: Color(0xFF222222),
                                                                                                                                  fontSize: 13.0,
                                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 0.0, 0.0),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            height: 22.0,
                                                                                                                            decoration: BoxDecoration(
                                                                                                                              color: Color(0xFFDEDEDE),
                                                                                                                              borderRadius: BorderRadius.circular(2.0),
                                                                                                                            ),
                                                                                                                            child: Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 21.0, 0.0),
                                                                                                                              child: Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                children: [
                                                                                                                                  Text(
                                                                                                                                    valueOrDefault<String>(
                                                                                                                                      getJsonField(
                                                                                                                                        skillsItem,
                                                                                                                                        r'''$.skill_level''',
                                                                                                                                      )?.toString(),
                                                                                                                                      '-',
                                                                                                                                    ),
                                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                          fontFamily: 'Lato',
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
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      theme: ExpandableThemeData(
                                                                                                        tapHeaderToExpand: true,
                                                                                                        tapBodyToExpand: false,
                                                                                                        tapBodyToCollapse: false,
                                                                                                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                                        hasIcon: true,
                                                                                                        expandIcon: Icons.add,
                                                                                                        collapseIcon: Icons.close_rounded,
                                                                                                        iconColor: FlutterFlowTheme.of(context).primary,
                                                                                                        iconPadding: EdgeInsets.fromLTRB(0.0, 12.0, 8.0, 0.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                        if (functions.jsonToString(getJsonField(
                                                                              userProfileUserProfileReadResponse.jsonBody,
                                                                              r'''$.data.role''',
                                                                            )) ==
                                                                            'Tasker')
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                14.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Text(
                                                                                  'See more',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Lato',
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontSize: 14.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                                Icon(
                                                                                  Icons.keyboard_arrow_down_rounded,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 18.0,
                                                                                ),
                                                                              ].divide(SizedBox(width: 8.0)),
                                                                            ),
                                                                          ),
                                                                        if (functions.jsonToString(getJsonField(
                                                                              userProfileUserProfileReadResponse.jsonBody,
                                                                              r'''$.data.role''',
                                                                            )) ==
                                                                            'Poster')
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                18.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                FutureBuilder<ApiCallResponse>(
                                                                              future: TaskerpageBackendGroup.myPostsCall.call(
                                                                                apiGlobalKey: FFAppState().apiKey,
                                                                                filters: '[[\"poster\",\"=\",\"${getJsonField(
                                                                                  userProfileUserProfileReadResponse.jsonBody,
                                                                                  r'''$.data.name''',
                                                                                ).toString()}\"]]',
                                                                                fields: '[\"name\",\"creation\",\"skill_name\"]',
                                                                              ),
                                                                              builder: (context, snapshot) {
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
                                                                                final listViewMyPostsResponse = snapshot.data!;
                                                                                return Builder(
                                                                                  builder: (context) {
                                                                                    final tasks = getJsonField(
                                                                                      listViewMyPostsResponse.jsonBody,
                                                                                      r'''$.data''',
                                                                                    ).toList().take(3).toList();
                                                                                    return ListView.separated(
                                                                                      padding: EdgeInsets.zero,
                                                                                      primary: false,
                                                                                      shrinkWrap: true,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      itemCount: tasks.length,
                                                                                      separatorBuilder: (_, __) => SizedBox(height: 8.0),
                                                                                      itemBuilder: (context, tasksIndex) {
                                                                                        final tasksItem = tasks[tasksIndex];
                                                                                        return Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  context.pushNamed(
                                                                                                    'PublishTask',
                                                                                                    queryParameters: {
                                                                                                      'id': serializeParam(
                                                                                                        getJsonField(
                                                                                                          tasksItem,
                                                                                                          r'''$.name''',
                                                                                                        ).toString(),
                                                                                                        ParamType.String,
                                                                                                      ),
                                                                                                    }.withoutNulls,
                                                                                                  );
                                                                                                },
                                                                                                child: Container(
                                                                                                  width: 100.0,
                                                                                                  height: 50.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    boxShadow: [
                                                                                                      BoxShadow(
                                                                                                        blurRadius: 4.0,
                                                                                                        color: Color(0x33000000),
                                                                                                        offset: Offset(0.0, 2.0),
                                                                                                        spreadRadius: 1.0,
                                                                                                      )
                                                                                                    ],
                                                                                                  ),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 8.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          getJsonField(
                                                                                                            tasksItem,
                                                                                                            r'''$.skill_name''',
                                                                                                          ).toString(),
                                                                                                          style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                                                fontFamily: 'Lato',
                                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                                fontSize: 14.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Icon(
                                                                                                          Icons.keyboard_arrow_right,
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          size: 20.0,
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                        if (functions.jsonToString(getJsonField(
                                                                              userProfileUserProfileReadResponse.jsonBody,
                                                                              r'''$.data.role''',
                                                                            )) ==
                                                                            'Poster')
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                14.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Text(
                                                                                  'See more',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Lato',
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontSize: 14.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                                Icon(
                                                                                  Icons.keyboard_arrow_down_rounded,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 18.0,
                                                                                ),
                                                                              ].divide(SizedBox(width: 8.0)),
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
                                                    if (responsiveVisibility(
                                                      context: context,
                                                      desktop: false,
                                                    ))
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    16.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                width: 100.0,
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
                                                                          1.0,
                                                                    )
                                                                  ],
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          32.0,
                                                                          20.0,
                                                                          32.0,
                                                                          28.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4.0,
                                                                                    color: Color(0x33000000),
                                                                                    offset: Offset(0.0, 2.0),
                                                                                    spreadRadius: 1.0,
                                                                                  )
                                                                                ],
                                                                              ),
                                                                              child: Container(
                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                color: Colors.white,
                                                                                child: ExpandableNotifier(
                                                                                  controller: _model.expandableController3,
                                                                                  child: ExpandablePanel(
                                                                                    header: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        'Profile',
                                                                                        style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                              fontFamily: 'Lato',
                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                              fontSize: 14.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    collapsed: Container(
                                                                                      width: double.infinity,
                                                                                      height: 12.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                    ),
                                                                                    expanded: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: double.infinity,
                                                                                            decoration: BoxDecoration(
                                                                                              color: Color(0xFFF9F9F9),
                                                                                              boxShadow: [
                                                                                                BoxShadow(
                                                                                                  blurRadius: 4.0,
                                                                                                  color: Color(0x33000000),
                                                                                                  offset: Offset(0.0, 2.0),
                                                                                                  spreadRadius: 1.0,
                                                                                                )
                                                                                              ],
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 25.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 17.2, 0.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          height: 22.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: Color(0xFFDEDEDE),
                                                                                                            borderRadius: BorderRadius.circular(2.0),
                                                                                                          ),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 21.0, 0.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  'Age: ${functions.age(functions.jsonToDateTime(getJsonField(
                                                                                                                        userProfileUserProfileReadResponse.jsonBody,
                                                                                                                        r'''$.data.date_of_birth''',
                                                                                                                      ).toString())).toString()}',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Lato',
                                                                                                                        fontSize: 13.0,
                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          height: 22.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: Color(0xFFDEDEDE),
                                                                                                            borderRadius: BorderRadius.circular(2.0),
                                                                                                          ),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 14.0, 0.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  functions.jsonToString(getJsonField(
                                                                                                                            userProfileUserProfileReadResponse.jsonBody,
                                                                                                                            r'''$.data.title''',
                                                                                                                          )) ==
                                                                                                                          'MR'
                                                                                                                      ? 'Male'
                                                                                                                      : 'Female',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Lato',
                                                                                                                        fontSize: 13.0,
                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          height: 22.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: Color(0xFFDEDEDE),
                                                                                                            borderRadius: BorderRadius.circular(2.0),
                                                                                                          ),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 14.0, 0.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  '${getJsonField(
                                                                                                                    userProfileUserProfileReadResponse.jsonBody,
                                                                                                                    r'''$.data.years_of_experience''',
                                                                                                                  ).toString()} Years Experience',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Lato',
                                                                                                                        fontSize: 13.0,
                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ].divide(SizedBox(width: 8.0)),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        height: 22.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: Color(0xFFDEDEDE),
                                                                                                          borderRadius: BorderRadius.circular(2.0),
                                                                                                        ),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 21.0, 0.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                'drivers_license: ${getJsonField(
                                                                                                                      userProfileUserProfileReadResponse.jsonBody,
                                                                                                                      r'''$.data.drivers_license''',
                                                                                                                    ) != null ? getJsonField(
                                                                                                                    userProfileUserProfileReadResponse.jsonBody,
                                                                                                                    r'''$.data.drivers_license''',
                                                                                                                  ).toString() : '-'}',
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Lato',
                                                                                                                      fontSize: 13.0,
                                                                                                                      fontWeight: FontWeight.w500,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ].divide(SizedBox(width: 8.0)),
                                                                                                  ),
                                                                                                  Divider(
                                                                                                    thickness: 1.0,
                                                                                                    color: Color(0xFFD2D2D2),
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        'Details',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Lato',
                                                                                                              color: Color(0xFF222222),
                                                                                                              fontSize: 13.0,
                                                                                                              fontWeight: FontWeight.w500,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Flexible(
                                                                                                          child: Text(
                                                                                                            getJsonField(
                                                                                                              userProfileUserProfileReadResponse.jsonBody,
                                                                                                              r'''$.data.describtion''',
                                                                                                            ).toString(),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Lato',
                                                                                                                  color: Color(0xFF292929),
                                                                                                                  fontSize: 13.0,
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'See more',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Lato',
                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                fontSize: 13.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Icon(
                                                                                                          Icons.keyboard_arrow_down_rounded,
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          size: 17.0,
                                                                                                        ),
                                                                                                      ].divide(SizedBox(width: 4.0)),
                                                                                                    ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(height: 8.0)),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    theme: ExpandableThemeData(
                                                                                      tapHeaderToExpand: true,
                                                                                      tapBodyToExpand: false,
                                                                                      tapBodyToCollapse: false,
                                                                                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                      hasIcon: true,
                                                                                      expandIcon: Icons.add,
                                                                                      collapseIcon: Icons.close_rounded,
                                                                                      iconColor: FlutterFlowTheme.of(context).primary,
                                                                                      iconPadding: EdgeInsets.fromLTRB(0.0, 12.0, 8.0, 0.0),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4.0,
                                                                                    color: Color(0x33000000),
                                                                                    offset: Offset(0.0, 2.0),
                                                                                    spreadRadius: 1.0,
                                                                                  )
                                                                                ],
                                                                              ),
                                                                              child: Container(
                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                color: Colors.white,
                                                                                child: ExpandableNotifier(
                                                                                  controller: _model.expandableController4,
                                                                                  child: ExpandablePanel(
                                                                                    header: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        'Education',
                                                                                        style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                              fontFamily: 'Lato',
                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                              fontSize: 14.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    collapsed: Container(
                                                                                      width: double.infinity,
                                                                                      height: 12.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                    ),
                                                                                    expanded: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: double.infinity,
                                                                                            height: 520.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: Color(0xFFF9F9F9),
                                                                                              boxShadow: [
                                                                                                BoxShadow(
                                                                                                  blurRadius: 4.0,
                                                                                                  color: Color(0x33000000),
                                                                                                  offset: Offset(0.0, 2.0),
                                                                                                  spreadRadius: 1.0,
                                                                                                )
                                                                                              ],
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(11.0, 7.0, 11.0, 25.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: FutureBuilder<ApiCallResponse>(
                                                                                                      future: TaskerpageBackendGroup.myEducationsCall.call(
                                                                                                        apiGlobalKey: FFAppState().apiKey,
                                                                                                        fields: '[\"education_type\",\"school_title\",\"certificate\",\"title\"]',
                                                                                                        filters: '[[\"customer_profile\",\"=\",\"${getJsonField(
                                                                                                          userProfileUserProfileReadResponse.jsonBody,
                                                                                                          r'''$.data.name''',
                                                                                                        ).toString()}\"]]',
                                                                                                      ),
                                                                                                      builder: (context, snapshot) {
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
                                                                                                        final listViewMyEducationsResponse = snapshot.data!;
                                                                                                        return Builder(
                                                                                                          builder: (context) {
                                                                                                            final educations = getJsonField(
                                                                                                              listViewMyEducationsResponse.jsonBody,
                                                                                                              r'''$.data''',
                                                                                                            ).toList().take(3).toList();
                                                                                                            return ListView.separated(
                                                                                                              padding: EdgeInsets.zero,
                                                                                                              primary: false,
                                                                                                              shrinkWrap: true,
                                                                                                              scrollDirection: Axis.vertical,
                                                                                                              itemCount: educations.length,
                                                                                                              separatorBuilder: (_, __) => SizedBox(height: 3.0),
                                                                                                              itemBuilder: (context, educationsIndex) {
                                                                                                                final educationsItem = educations[educationsIndex];
                                                                                                                return Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 0.0),
                                                                                                                  child: Container(
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: Colors.white,
                                                                                                                      boxShadow: [
                                                                                                                        BoxShadow(
                                                                                                                          blurRadius: 4.0,
                                                                                                                          color: Color(0x33000000),
                                                                                                                          offset: Offset(0.0, 2.0),
                                                                                                                          spreadRadius: 1.0,
                                                                                                                        )
                                                                                                                      ],
                                                                                                                      borderRadius: BorderRadius.circular(0.0),
                                                                                                                    ),
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Column(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          children: [
                                                                                                                            Container(
                                                                                                                              width: 17.0,
                                                                                                                              height: 50.0,
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                color: Color(0xFF8A8A8A),
                                                                                                                              ),
                                                                                                                              child: Column(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                children: [
                                                                                                                                  Text(
                                                                                                                                    functions.plus1(educationsIndex).toString(),
                                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                          fontFamily: 'Lato',
                                                                                                                                          color: Colors.white,
                                                                                                                                          fontSize: 12.0,
                                                                                                                                          fontWeight: FontWeight.w500,
                                                                                                                                        ),
                                                                                                                                  ),
                                                                                                                                ],
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                        Expanded(
                                                                                                                          child: Column(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            children: [
                                                                                                                              Padding(
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 16.0, 16.0),
                                                                                                                                child: Column(
                                                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                                                  children: [
                                                                                                                                    Row(
                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                      children: [
                                                                                                                                        Padding(
                                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                                                          child: Text(
                                                                                                                                            'Name: ',
                                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                  fontFamily: 'Lato',
                                                                                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                                                                                  fontSize: 14.0,
                                                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                                                ),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                        Text(
                                                                                                                                          getJsonField(
                                                                                                                                            educationsItem,
                                                                                                                                            r'''$.title''',
                                                                                                                                          ).toString(),
                                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                fontFamily: 'Lato',
                                                                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                                                                fontSize: 14.0,
                                                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                                              ),
                                                                                                                                        ),
                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                    Padding(
                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                                                                      child: Row(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                        children: [
                                                                                                                                          Padding(
                                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                                                            child: Text(
                                                                                                                                              'Name of Institute: ',
                                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                    fontFamily: 'Lato',
                                                                                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                                                                                    fontSize: 14.0,
                                                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                                                  ),
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                          Text(
                                                                                                                                            getJsonField(
                                                                                                                                              educationsItem,
                                                                                                                                              r'''$.school_title''',
                                                                                                                                            ).toString(),
                                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                  fontFamily: 'Lato',
                                                                                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                                                                                  fontSize: 14.0,
                                                                                                                                                  fontWeight: FontWeight.bold,
                                                                                                                                                ),
                                                                                                                                          ),
                                                                                                                                        ],
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                    Row(
                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                      children: [
                                                                                                                                        Padding(
                                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                                                          child: Text(
                                                                                                                                            'Type: ',
                                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                  fontFamily: 'Lato',
                                                                                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                                                                                  fontSize: 14.0,
                                                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                                                ),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                        Text(
                                                                                                                                          getJsonField(
                                                                                                                                            educationsItem,
                                                                                                                                            r'''$.education_type''',
                                                                                                                                          ).toString(),
                                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                fontFamily: 'Lato',
                                                                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                                                                fontSize: 14.0,
                                                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                                              ),
                                                                                                                                        ),
                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                    Padding(
                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                                                                                                                                      child: Row(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                                                        children: [
                                                                                                                                          if (functions.jsonToString(getJsonField(
                                                                                                                                                educationsItem,
                                                                                                                                                r'''$.certificate''',
                                                                                                                                              )) !=
                                                                                                                                              '')
                                                                                                                                            InkWell(
                                                                                                                                              splashColor: Colors.transparent,
                                                                                                                                              focusColor: Colors.transparent,
                                                                                                                                              hoverColor: Colors.transparent,
                                                                                                                                              highlightColor: Colors.transparent,
                                                                                                                                              onTap: () async {
                                                                                                                                                if (functions.jsonToString(getJsonField(
                                                                                                                                                          educationsItem,
                                                                                                                                                          r'''$.certificate''',
                                                                                                                                                        )) ==
                                                                                                                                                        null ||
                                                                                                                                                    functions.jsonToString(getJsonField(
                                                                                                                                                          educationsItem,
                                                                                                                                                          r'''$.certificate''',
                                                                                                                                                        )) ==
                                                                                                                                                        '') {
                                                                                                                                                } else {
                                                                                                                                                  await showModalBottomSheet(
                                                                                                                                                    isScrollControlled: true,
                                                                                                                                                    backgroundColor: Colors.transparent,
                                                                                                                                                    enableDrag: false,
                                                                                                                                                    context: context,
                                                                                                                                                    builder: (context) {
                                                                                                                                                      return WebViewAware(
                                                                                                                                                        child: GestureDetector(
                                                                                                                                                          onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                                                                          child: Padding(
                                                                                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                                                                                            child: ViewCertificateWidget(
                                                                                                                                                              certificateUrl: getJsonField(
                                                                                                                                                                educationsItem,
                                                                                                                                                                r'''$.certificate''',
                                                                                                                                                              ).toString(),
                                                                                                                                                              updateCertificateUrl: () async {},
                                                                                                                                                            ),
                                                                                                                                                          ),
                                                                                                                                                        ),
                                                                                                                                                      );
                                                                                                                                                    },
                                                                                                                                                  ).then((value) => safeSetState(() {}));
                                                                                                                                                }
                                                                                                                                              },
                                                                                                                                              child: Container(
                                                                                                                                                width: 130.0,
                                                                                                                                                height: 36.0,
                                                                                                                                                decoration: BoxDecoration(
                                                                                                                                                  color: Colors.white,
                                                                                                                                                  borderRadius: BorderRadius.circular(2.0),
                                                                                                                                                  border: Border.all(
                                                                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                                child: Row(
                                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                                  children: [
                                                                                                                                                    Text(
                                                                                                                                                      'View certificate',
                                                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                            fontFamily: 'Lato',
                                                                                                                                                            color: FlutterFlowTheme.of(context).primary,
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
                                                                                                                                  ],
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
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
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    theme: ExpandableThemeData(
                                                                                      tapHeaderToExpand: true,
                                                                                      tapBodyToExpand: false,
                                                                                      tapBodyToCollapse: false,
                                                                                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                      hasIcon: true,
                                                                                      expandIcon: Icons.add,
                                                                                      collapseIcon: Icons.close_rounded,
                                                                                      iconColor: FlutterFlowTheme.of(context).primary,
                                                                                      iconPadding: EdgeInsets.fromLTRB(0.0, 12.0, 8.0, 0.0),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4.0,
                                                                                    color: Color(0x33000000),
                                                                                    offset: Offset(0.0, 2.0),
                                                                                    spreadRadius: 1.0,
                                                                                  )
                                                                                ],
                                                                              ),
                                                                              child: Container(
                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                color: Colors.white,
                                                                                child: ExpandableNotifier(
                                                                                  controller: _model.expandableController5,
                                                                                  child: ExpandablePanel(
                                                                                    header: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        'Reviews',
                                                                                        style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                              fontFamily: 'Lato',
                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                              fontSize: 14.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    collapsed: Container(
                                                                                      width: double.infinity,
                                                                                      height: 12.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                    ),
                                                                                    expanded: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: double.infinity,
                                                                                            height: 370.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: Color(0xFFF9F9F9),
                                                                                              boxShadow: [
                                                                                                BoxShadow(
                                                                                                  blurRadius: 4.0,
                                                                                                  color: Color(0x33000000),
                                                                                                  offset: Offset(0.0, 2.0),
                                                                                                  spreadRadius: 1.0,
                                                                                                )
                                                                                              ],
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(11.0, 7.0, 11.0, 20.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: FutureBuilder<ApiCallResponse>(
                                                                                                      future: TaskerpageBackendGroup.myReviewsCall.call(
                                                                                                        filters: '[[\"reviewed_on\",\"=\",\"${getJsonField(
                                                                                                          userProfileUserProfileReadResponse.jsonBody,
                                                                                                          r'''$.data.name''',
                                                                                                        ).toString()}\"]]',
                                                                                                        fields: '[\"reviewed_on\",\"creation\",\"appointment\",\"reviewed_by\",\"review_rate\",\"comment\"]',
                                                                                                        apiGlobalKey: FFAppState().apiKey,
                                                                                                      ),
                                                                                                      builder: (context, snapshot) {
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
                                                                                                        final listViewMyReviewsResponse = snapshot.data!;
                                                                                                        return Builder(
                                                                                                          builder: (context) {
                                                                                                            final myReviews = getJsonField(
                                                                                                              listViewMyReviewsResponse.jsonBody,
                                                                                                              r'''$.data''',
                                                                                                            ).toList().take(3).toList();
                                                                                                            return ListView.separated(
                                                                                                              padding: EdgeInsets.zero,
                                                                                                              primary: false,
                                                                                                              shrinkWrap: true,
                                                                                                              scrollDirection: Axis.vertical,
                                                                                                              itemCount: myReviews.length,
                                                                                                              separatorBuilder: (_, __) => SizedBox(height: 3.0),
                                                                                                              itemBuilder: (context, myReviewsIndex) {
                                                                                                                final myReviewsItem = myReviews[myReviewsIndex];
                                                                                                                return Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 0.0),
                                                                                                                  child: FutureBuilder<ApiCallResponse>(
                                                                                                                    future: TaskerpageBackendGroup.userProfileReadCall.call(
                                                                                                                      id: getJsonField(
                                                                                                                        myReviewsItem,
                                                                                                                        r'''$.reviewed_by''',
                                                                                                                      ).toString(),
                                                                                                                      apiGlobalKey: FFAppState().apiKey,
                                                                                                                    ),
                                                                                                                    builder: (context, snapshot) {
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
                                                                                                                      final containerUserProfileReadResponse = snapshot.data!;
                                                                                                                      return Container(
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          color: Colors.white,
                                                                                                                          boxShadow: [
                                                                                                                            BoxShadow(
                                                                                                                              blurRadius: 4.0,
                                                                                                                              color: Color(0x33000000),
                                                                                                                              offset: Offset(0.0, 2.0),
                                                                                                                            )
                                                                                                                          ],
                                                                                                                          borderRadius: BorderRadius.circular(2.0),
                                                                                                                        ),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 8.0, 15.0, 8.0),
                                                                                                                          child: Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            children: [
                                                                                                                              Column(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                children: [
                                                                                                                                  Container(
                                                                                                                                    width: 50.0,
                                                                                                                                    height: 50.0,
                                                                                                                                    clipBehavior: Clip.antiAlias,
                                                                                                                                    decoration: BoxDecoration(
                                                                                                                                      shape: BoxShape.circle,
                                                                                                                                    ),
                                                                                                                                    child: Image.network(
                                                                                                                                      '${FFAppState().baseUrl}${getJsonField(
                                                                                                                                        containerUserProfileReadResponse.jsonBody,
                                                                                                                                        r'''$.data.avatar''',
                                                                                                                                      ).toString()}',
                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                                    child: Text(
                                                                                                                                      getJsonField(
                                                                                                                                        containerUserProfileReadResponse.jsonBody,
                                                                                                                                        r'''$.data.first_name''',
                                                                                                                                      ).toString(),
                                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                            fontFamily: 'Lato',
                                                                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                                                                            fontSize: 13.0,
                                                                                                                                            fontWeight: FontWeight.bold,
                                                                                                                                          ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                                                                                                                                    child: Text(
                                                                                                                                      getJsonField(
                                                                                                                                        containerUserProfileReadResponse.jsonBody,
                                                                                                                                        r'''$.data.last_name''',
                                                                                                                                      ).toString(),
                                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                            fontFamily: 'Lato',
                                                                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                                                                            fontSize: 13.0,
                                                                                                                                            fontWeight: FontWeight.bold,
                                                                                                                                          ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ],
                                                                                                                              ),
                                                                                                                              Expanded(
                                                                                                                                child: Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 10.0, 0.0, 10.0),
                                                                                                                                  child: Column(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                    children: [
                                                                                                                                      Row(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        children: [
                                                                                                                                          Text(
                                                                                                                                            dateTimeFormat(
                                                                                                                                                'yMMMd',
                                                                                                                                                functions.jsonToDateTime(getJsonField(
                                                                                                                                                  myReviewsItem,
                                                                                                                                                  r'''$.creation''',
                                                                                                                                                ).toString())),
                                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                  fontFamily: 'Lato',
                                                                                                                                                  color: Color(0xFF616161),
                                                                                                                                                  fontSize: 12.0,
                                                                                                                                                  fontWeight: FontWeight.w300,
                                                                                                                                                ),
                                                                                                                                          ),
                                                                                                                                        ],
                                                                                                                                      ),
                                                                                                                                      Padding(
                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                                        child: RatingBarIndicator(
                                                                                                                                          itemBuilder: (context, index) => Icon(
                                                                                                                                            Icons.star_rounded,
                                                                                                                                            color: Color(0xFFFBD927),
                                                                                                                                          ),
                                                                                                                                          direction: Axis.horizontal,
                                                                                                                                          rating: getJsonField(
                                                                                                                                            myReviewsItem,
                                                                                                                                            r'''$.review_rate''',
                                                                                                                                          ),
                                                                                                                                          unratedColor: FlutterFlowTheme.of(context).accent3,
                                                                                                                                          itemCount: 5,
                                                                                                                                          itemSize: 12.0,
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                      Divider(
                                                                                                                                        thickness: 1.0,
                                                                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                                      ),
                                                                                                                                      Row(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        children: [
                                                                                                                                          Flexible(
                                                                                                                                            child: Text(
                                                                                                                                              getJsonField(
                                                                                                                                                myReviewsItem,
                                                                                                                                                r'''$.comment''',
                                                                                                                                              ).toString(),
                                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                    fontFamily: 'Lato',
                                                                                                                                                    color: Color(0xFF5E5D5D),
                                                                                                                                                    fontSize: 14.0,
                                                                                                                                                    fontWeight: FontWeight.w300,
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
                                                                                                                      );
                                                                                                                    },
                                                                                                                  ),
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
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    theme: ExpandableThemeData(
                                                                                      tapHeaderToExpand: true,
                                                                                      tapBodyToExpand: false,
                                                                                      tapBodyToCollapse: false,
                                                                                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                      hasIcon: true,
                                                                                      expandIcon: Icons.add,
                                                                                      collapseIcon: Icons.close_rounded,
                                                                                      iconColor: FlutterFlowTheme.of(context).primary,
                                                                                      iconPadding: EdgeInsets.fromLTRB(0.0, 12.0, 8.0, 0.0),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            8.0)),
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
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    16.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                width: 100.0,
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
                                                                          1.0,
                                                                    )
                                                                  ],
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          32.0,
                                                                          20.0,
                                                                          32.0,
                                                                          28.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4.0,
                                                                                    color: Color(0x33000000),
                                                                                    offset: Offset(0.0, 2.0),
                                                                                    spreadRadius: 1.0,
                                                                                  )
                                                                                ],
                                                                              ),
                                                                              child: Container(
                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                color: Colors.white,
                                                                                child: ExpandableNotifier(
                                                                                  controller: _model.expandableController6,
                                                                                  child: ExpandablePanel(
                                                                                    header: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        'Profile',
                                                                                        style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                              fontFamily: 'Lato',
                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                              fontSize: 14.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    collapsed: Container(
                                                                                      width: double.infinity,
                                                                                      height: 12.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                    ),
                                                                                    expanded: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: double.infinity,
                                                                                            decoration: BoxDecoration(
                                                                                              color: Color(0xFFF9F9F9),
                                                                                              boxShadow: [
                                                                                                BoxShadow(
                                                                                                  blurRadius: 4.0,
                                                                                                  color: Color(0x33000000),
                                                                                                  offset: Offset(0.0, 2.0),
                                                                                                  spreadRadius: 1.0,
                                                                                                )
                                                                                              ],
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 25.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 17.2, 0.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          height: 22.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: Color(0xFFDEDEDE),
                                                                                                            borderRadius: BorderRadius.circular(2.0),
                                                                                                          ),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 21.0, 0.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  'Age: ${functions.age(functions.jsonToDateTime(getJsonField(
                                                                                                                        userProfileUserProfileReadResponse.jsonBody,
                                                                                                                        r'''$.data.date_of_birth''',
                                                                                                                      ).toString())).toString()}',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Lato',
                                                                                                                        fontSize: 13.0,
                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          height: 22.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: Color(0xFFDEDEDE),
                                                                                                            borderRadius: BorderRadius.circular(2.0),
                                                                                                          ),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 14.0, 0.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  functions.jsonToString(getJsonField(
                                                                                                                            userProfileUserProfileReadResponse.jsonBody,
                                                                                                                            r'''$.data.title''',
                                                                                                                          )) ==
                                                                                                                          'MR'
                                                                                                                      ? 'Male'
                                                                                                                      : 'Female',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Lato',
                                                                                                                        fontSize: 13.0,
                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          height: 22.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: Color(0xFFDEDEDE),
                                                                                                            borderRadius: BorderRadius.circular(2.0),
                                                                                                          ),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 14.0, 0.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  '${getJsonField(
                                                                                                                    userProfileUserProfileReadResponse.jsonBody,
                                                                                                                    r'''$.data.years_of_experience''',
                                                                                                                  ).toString()} Years Experience',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Lato',
                                                                                                                        fontSize: 13.0,
                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ].divide(SizedBox(width: 8.0)),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        height: 22.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: Color(0xFFDEDEDE),
                                                                                                          borderRadius: BorderRadius.circular(2.0),
                                                                                                        ),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 21.0, 0.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                'drivers_license: ${getJsonField(
                                                                                                                      userProfileUserProfileReadResponse.jsonBody,
                                                                                                                      r'''$.data.drivers_license''',
                                                                                                                    ) != null ? getJsonField(
                                                                                                                    userProfileUserProfileReadResponse.jsonBody,
                                                                                                                    r'''$.data.drivers_license''',
                                                                                                                  ).toString() : '-'}',
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Lato',
                                                                                                                      fontSize: 13.0,
                                                                                                                      fontWeight: FontWeight.w500,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ].divide(SizedBox(width: 8.0)),
                                                                                                  ),
                                                                                                  Divider(
                                                                                                    thickness: 1.0,
                                                                                                    color: Color(0xFFD2D2D2),
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        'Details',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Lato',
                                                                                                              color: Color(0xFF222222),
                                                                                                              fontSize: 13.0,
                                                                                                              fontWeight: FontWeight.w500,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Flexible(
                                                                                                          child: Text(
                                                                                                            getJsonField(
                                                                                                              userProfileUserProfileReadResponse.jsonBody,
                                                                                                              r'''$.data.describtion''',
                                                                                                            ).toString(),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Lato',
                                                                                                                  color: Color(0xFF292929),
                                                                                                                  fontSize: 13.0,
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'See more',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Lato',
                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                fontSize: 13.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Icon(
                                                                                                          Icons.keyboard_arrow_down_rounded,
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          size: 17.0,
                                                                                                        ),
                                                                                                      ].divide(SizedBox(width: 4.0)),
                                                                                                    ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(height: 8.0)),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    theme: ExpandableThemeData(
                                                                                      tapHeaderToExpand: true,
                                                                                      tapBodyToExpand: false,
                                                                                      tapBodyToCollapse: false,
                                                                                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                      hasIcon: true,
                                                                                      expandIcon: Icons.add,
                                                                                      collapseIcon: Icons.close_rounded,
                                                                                      iconColor: FlutterFlowTheme.of(context).primary,
                                                                                      iconPadding: EdgeInsets.fromLTRB(0.0, 12.0, 8.0, 0.0),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4.0,
                                                                                    color: Color(0x33000000),
                                                                                    offset: Offset(0.0, 2.0),
                                                                                    spreadRadius: 1.0,
                                                                                  )
                                                                                ],
                                                                              ),
                                                                              child: Container(
                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                color: Colors.white,
                                                                                child: ExpandableNotifier(
                                                                                  controller: _model.expandableController7,
                                                                                  child: ExpandablePanel(
                                                                                    header: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        'Education',
                                                                                        style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                              fontFamily: 'Lato',
                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                              fontSize: 14.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    collapsed: Container(
                                                                                      width: double.infinity,
                                                                                      height: 12.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                    ),
                                                                                    expanded: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: double.infinity,
                                                                                            height: 520.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: Color(0xFFF9F9F9),
                                                                                              boxShadow: [
                                                                                                BoxShadow(
                                                                                                  blurRadius: 4.0,
                                                                                                  color: Color(0x33000000),
                                                                                                  offset: Offset(0.0, 2.0),
                                                                                                  spreadRadius: 1.0,
                                                                                                )
                                                                                              ],
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(11.0, 7.0, 11.0, 25.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: FutureBuilder<ApiCallResponse>(
                                                                                                      future: TaskerpageBackendGroup.myEducationsCall.call(
                                                                                                        apiGlobalKey: FFAppState().apiKey,
                                                                                                        fields: '[\"education_type\",\"school_title\",\"certificate\",\"title\"]',
                                                                                                        filters: '[[\"customer_profile\",\"=\",\"${getJsonField(
                                                                                                          userProfileUserProfileReadResponse.jsonBody,
                                                                                                          r'''$.data.name''',
                                                                                                        ).toString()}\"]]',
                                                                                                      ),
                                                                                                      builder: (context, snapshot) {
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
                                                                                                        final listViewMyEducationsResponse = snapshot.data!;
                                                                                                        return Builder(
                                                                                                          builder: (context) {
                                                                                                            final educations = getJsonField(
                                                                                                              listViewMyEducationsResponse.jsonBody,
                                                                                                              r'''$.data''',
                                                                                                            ).toList().take(3).toList();
                                                                                                            return ListView.separated(
                                                                                                              padding: EdgeInsets.zero,
                                                                                                              primary: false,
                                                                                                              shrinkWrap: true,
                                                                                                              scrollDirection: Axis.vertical,
                                                                                                              itemCount: educations.length,
                                                                                                              separatorBuilder: (_, __) => SizedBox(height: 3.0),
                                                                                                              itemBuilder: (context, educationsIndex) {
                                                                                                                final educationsItem = educations[educationsIndex];
                                                                                                                return Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 0.0),
                                                                                                                  child: Container(
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: Colors.white,
                                                                                                                      boxShadow: [
                                                                                                                        BoxShadow(
                                                                                                                          blurRadius: 4.0,
                                                                                                                          color: Color(0x33000000),
                                                                                                                          offset: Offset(0.0, 2.0),
                                                                                                                          spreadRadius: 1.0,
                                                                                                                        )
                                                                                                                      ],
                                                                                                                      borderRadius: BorderRadius.circular(0.0),
                                                                                                                    ),
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Column(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          children: [
                                                                                                                            Container(
                                                                                                                              width: 17.0,
                                                                                                                              height: 50.0,
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                color: Color(0xFF8A8A8A),
                                                                                                                              ),
                                                                                                                              child: Column(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                children: [
                                                                                                                                  Text(
                                                                                                                                    functions.plus1(educationsIndex).toString(),
                                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                          fontFamily: 'Lato',
                                                                                                                                          color: Colors.white,
                                                                                                                                          fontSize: 12.0,
                                                                                                                                          fontWeight: FontWeight.w500,
                                                                                                                                        ),
                                                                                                                                  ),
                                                                                                                                ],
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                        Expanded(
                                                                                                                          child: Column(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            children: [
                                                                                                                              Padding(
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 16.0, 16.0),
                                                                                                                                child: Column(
                                                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                                                  children: [
                                                                                                                                    Row(
                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                      children: [
                                                                                                                                        Padding(
                                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                                                          child: Text(
                                                                                                                                            'Name: ',
                                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                  fontFamily: 'Lato',
                                                                                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                                                                                  fontSize: 14.0,
                                                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                                                ),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                        Text(
                                                                                                                                          getJsonField(
                                                                                                                                            educationsItem,
                                                                                                                                            r'''$.title''',
                                                                                                                                          ).toString(),
                                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                fontFamily: 'Lato',
                                                                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                                                                fontSize: 14.0,
                                                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                                              ),
                                                                                                                                        ),
                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                    Padding(
                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                                                                      child: Row(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                        children: [
                                                                                                                                          Padding(
                                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                                                            child: Text(
                                                                                                                                              'Name of Institute: ',
                                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                    fontFamily: 'Lato',
                                                                                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                                                                                    fontSize: 14.0,
                                                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                                                  ),
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                          Text(
                                                                                                                                            getJsonField(
                                                                                                                                              educationsItem,
                                                                                                                                              r'''$.school_title''',
                                                                                                                                            ).toString(),
                                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                  fontFamily: 'Lato',
                                                                                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                                                                                  fontSize: 14.0,
                                                                                                                                                  fontWeight: FontWeight.bold,
                                                                                                                                                ),
                                                                                                                                          ),
                                                                                                                                        ],
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                    Row(
                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                      children: [
                                                                                                                                        Padding(
                                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                                                          child: Text(
                                                                                                                                            'Type: ',
                                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                  fontFamily: 'Lato',
                                                                                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                                                                                  fontSize: 14.0,
                                                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                                                ),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                        Text(
                                                                                                                                          getJsonField(
                                                                                                                                            educationsItem,
                                                                                                                                            r'''$.education_type''',
                                                                                                                                          ).toString(),
                                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                fontFamily: 'Lato',
                                                                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                                                                fontSize: 14.0,
                                                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                                              ),
                                                                                                                                        ),
                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                    Padding(
                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                                                                                                                                      child: Row(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                                                        children: [
                                                                                                                                          if (functions.jsonToString(getJsonField(
                                                                                                                                                educationsItem,
                                                                                                                                                r'''$.certificate''',
                                                                                                                                              )) !=
                                                                                                                                              '')
                                                                                                                                            InkWell(
                                                                                                                                              splashColor: Colors.transparent,
                                                                                                                                              focusColor: Colors.transparent,
                                                                                                                                              hoverColor: Colors.transparent,
                                                                                                                                              highlightColor: Colors.transparent,
                                                                                                                                              onTap: () async {
                                                                                                                                                if (functions.jsonToString(getJsonField(
                                                                                                                                                          educationsItem,
                                                                                                                                                          r'''$.certificate''',
                                                                                                                                                        )) ==
                                                                                                                                                        null ||
                                                                                                                                                    functions.jsonToString(getJsonField(
                                                                                                                                                          educationsItem,
                                                                                                                                                          r'''$.certificate''',
                                                                                                                                                        )) ==
                                                                                                                                                        '') {
                                                                                                                                                } else {
                                                                                                                                                  await showModalBottomSheet(
                                                                                                                                                    isScrollControlled: true,
                                                                                                                                                    backgroundColor: Colors.transparent,
                                                                                                                                                    enableDrag: false,
                                                                                                                                                    context: context,
                                                                                                                                                    builder: (context) {
                                                                                                                                                      return WebViewAware(
                                                                                                                                                        child: GestureDetector(
                                                                                                                                                          onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                                                                          child: Padding(
                                                                                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                                                                                            child: ViewCertificateWidget(
                                                                                                                                                              certificateUrl: getJsonField(
                                                                                                                                                                educationsItem,
                                                                                                                                                                r'''$.certificate''',
                                                                                                                                                              ).toString(),
                                                                                                                                                              updateCertificateUrl: () async {},
                                                                                                                                                            ),
                                                                                                                                                          ),
                                                                                                                                                        ),
                                                                                                                                                      );
                                                                                                                                                    },
                                                                                                                                                  ).then((value) => safeSetState(() {}));
                                                                                                                                                }
                                                                                                                                              },
                                                                                                                                              child: Container(
                                                                                                                                                width: 130.0,
                                                                                                                                                height: 36.0,
                                                                                                                                                decoration: BoxDecoration(
                                                                                                                                                  color: Colors.white,
                                                                                                                                                  borderRadius: BorderRadius.circular(2.0),
                                                                                                                                                  border: Border.all(
                                                                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                                child: Row(
                                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                                  children: [
                                                                                                                                                    Text(
                                                                                                                                                      'View certificate',
                                                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                            fontFamily: 'Lato',
                                                                                                                                                            color: FlutterFlowTheme.of(context).primary,
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
                                                                                                                                  ],
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
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
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    theme: ExpandableThemeData(
                                                                                      tapHeaderToExpand: true,
                                                                                      tapBodyToExpand: false,
                                                                                      tapBodyToCollapse: false,
                                                                                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                      hasIcon: true,
                                                                                      expandIcon: Icons.add,
                                                                                      collapseIcon: Icons.close_rounded,
                                                                                      iconColor: FlutterFlowTheme.of(context).primary,
                                                                                      iconPadding: EdgeInsets.fromLTRB(0.0, 12.0, 8.0, 0.0),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4.0,
                                                                                    color: Color(0x33000000),
                                                                                    offset: Offset(0.0, 2.0),
                                                                                    spreadRadius: 1.0,
                                                                                  )
                                                                                ],
                                                                              ),
                                                                              child: Container(
                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                color: Colors.white,
                                                                                child: ExpandableNotifier(
                                                                                  controller: _model.expandableController8,
                                                                                  child: ExpandablePanel(
                                                                                    header: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        'Reviews',
                                                                                        style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                              fontFamily: 'Lato',
                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                              fontSize: 14.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    collapsed: Container(
                                                                                      width: double.infinity,
                                                                                      height: 12.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                    ),
                                                                                    expanded: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: double.infinity,
                                                                                            height: 370.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: Color(0xFFF9F9F9),
                                                                                              boxShadow: [
                                                                                                BoxShadow(
                                                                                                  blurRadius: 4.0,
                                                                                                  color: Color(0x33000000),
                                                                                                  offset: Offset(0.0, 2.0),
                                                                                                  spreadRadius: 1.0,
                                                                                                )
                                                                                              ],
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(11.0, 7.0, 11.0, 20.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: FutureBuilder<ApiCallResponse>(
                                                                                                      future: TaskerpageBackendGroup.myReviewsCall.call(
                                                                                                        filters: '[[\"reviewed_on\",\"=\",\"${getJsonField(
                                                                                                          userProfileUserProfileReadResponse.jsonBody,
                                                                                                          r'''$.data.name''',
                                                                                                        ).toString()}\"]]',
                                                                                                        fields: '[\"reviewed_on\",\"creation\",\"appointment\",\"reviewed_by\",\"review_rate\",\"comment\"]',
                                                                                                        apiGlobalKey: FFAppState().apiKey,
                                                                                                      ),
                                                                                                      builder: (context, snapshot) {
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
                                                                                                        final listViewMyReviewsResponse = snapshot.data!;
                                                                                                        return Builder(
                                                                                                          builder: (context) {
                                                                                                            final myReviews = getJsonField(
                                                                                                              listViewMyReviewsResponse.jsonBody,
                                                                                                              r'''$.data''',
                                                                                                            ).toList().take(3).toList();
                                                                                                            return ListView.separated(
                                                                                                              padding: EdgeInsets.zero,
                                                                                                              primary: false,
                                                                                                              shrinkWrap: true,
                                                                                                              scrollDirection: Axis.vertical,
                                                                                                              itemCount: myReviews.length,
                                                                                                              separatorBuilder: (_, __) => SizedBox(height: 3.0),
                                                                                                              itemBuilder: (context, myReviewsIndex) {
                                                                                                                final myReviewsItem = myReviews[myReviewsIndex];
                                                                                                                return Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 0.0),
                                                                                                                  child: FutureBuilder<ApiCallResponse>(
                                                                                                                    future: TaskerpageBackendGroup.userProfileReadCall.call(
                                                                                                                      id: getJsonField(
                                                                                                                        myReviewsItem,
                                                                                                                        r'''$.reviewed_by''',
                                                                                                                      ).toString(),
                                                                                                                      apiGlobalKey: FFAppState().apiKey,
                                                                                                                    ),
                                                                                                                    builder: (context, snapshot) {
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
                                                                                                                      final containerUserProfileReadResponse = snapshot.data!;
                                                                                                                      return Container(
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          color: Colors.white,
                                                                                                                          boxShadow: [
                                                                                                                            BoxShadow(
                                                                                                                              blurRadius: 4.0,
                                                                                                                              color: Color(0x33000000),
                                                                                                                              offset: Offset(0.0, 2.0),
                                                                                                                            )
                                                                                                                          ],
                                                                                                                          borderRadius: BorderRadius.circular(2.0),
                                                                                                                        ),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 8.0, 15.0, 8.0),
                                                                                                                          child: Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            children: [
                                                                                                                              Column(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                children: [
                                                                                                                                  Container(
                                                                                                                                    width: 50.0,
                                                                                                                                    height: 50.0,
                                                                                                                                    clipBehavior: Clip.antiAlias,
                                                                                                                                    decoration: BoxDecoration(
                                                                                                                                      shape: BoxShape.circle,
                                                                                                                                    ),
                                                                                                                                    child: Image.network(
                                                                                                                                      '${FFAppState().baseUrl}${getJsonField(
                                                                                                                                        containerUserProfileReadResponse.jsonBody,
                                                                                                                                        r'''$.data.avatar''',
                                                                                                                                      ).toString()}',
                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                                    child: Text(
                                                                                                                                      getJsonField(
                                                                                                                                        containerUserProfileReadResponse.jsonBody,
                                                                                                                                        r'''$.data.first_name''',
                                                                                                                                      ).toString(),
                                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                            fontFamily: 'Lato',
                                                                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                                                                            fontSize: 13.0,
                                                                                                                                            fontWeight: FontWeight.bold,
                                                                                                                                          ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                                                                                                                                    child: Text(
                                                                                                                                      getJsonField(
                                                                                                                                        containerUserProfileReadResponse.jsonBody,
                                                                                                                                        r'''$.data.last_name''',
                                                                                                                                      ).toString(),
                                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                            fontFamily: 'Lato',
                                                                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                                                                            fontSize: 13.0,
                                                                                                                                            fontWeight: FontWeight.bold,
                                                                                                                                          ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ],
                                                                                                                              ),
                                                                                                                              Expanded(
                                                                                                                                child: Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 10.0, 0.0, 10.0),
                                                                                                                                  child: Column(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                    children: [
                                                                                                                                      Row(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        children: [
                                                                                                                                          Text(
                                                                                                                                            dateTimeFormat(
                                                                                                                                                'yMMMd',
                                                                                                                                                functions.jsonToDateTime(getJsonField(
                                                                                                                                                  myReviewsItem,
                                                                                                                                                  r'''$.creation''',
                                                                                                                                                ).toString())),
                                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                  fontFamily: 'Lato',
                                                                                                                                                  color: Color(0xFF616161),
                                                                                                                                                  fontSize: 12.0,
                                                                                                                                                  fontWeight: FontWeight.w300,
                                                                                                                                                ),
                                                                                                                                          ),
                                                                                                                                        ],
                                                                                                                                      ),
                                                                                                                                      Padding(
                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                                        child: RatingBarIndicator(
                                                                                                                                          itemBuilder: (context, index) => Icon(
                                                                                                                                            Icons.star_rounded,
                                                                                                                                            color: Color(0xFFFBD927),
                                                                                                                                          ),
                                                                                                                                          direction: Axis.horizontal,
                                                                                                                                          rating: getJsonField(
                                                                                                                                            myReviewsItem,
                                                                                                                                            r'''$.review_rate''',
                                                                                                                                          ),
                                                                                                                                          unratedColor: FlutterFlowTheme.of(context).accent3,
                                                                                                                                          itemCount: 5,
                                                                                                                                          itemSize: 12.0,
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                      Divider(
                                                                                                                                        thickness: 1.0,
                                                                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                                      ),
                                                                                                                                      Row(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        children: [
                                                                                                                                          Flexible(
                                                                                                                                            child: Text(
                                                                                                                                              getJsonField(
                                                                                                                                                myReviewsItem,
                                                                                                                                                r'''$.comment''',
                                                                                                                                              ).toString(),
                                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                    fontFamily: 'Lato',
                                                                                                                                                    color: Color(0xFF5E5D5D),
                                                                                                                                                    fontSize: 14.0,
                                                                                                                                                    fontWeight: FontWeight.w300,
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
                                                                                                                      );
                                                                                                                    },
                                                                                                                  ),
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
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    theme: ExpandableThemeData(
                                                                                      tapHeaderToExpand: true,
                                                                                      tapBodyToExpand: false,
                                                                                      tapBodyToCollapse: false,
                                                                                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                      hasIcon: true,
                                                                                      expandIcon: Icons.add,
                                                                                      collapseIcon: Icons.close_rounded,
                                                                                      iconColor: FlutterFlowTheme.of(context).primary,
                                                                                      iconPadding: EdgeInsets.fromLTRB(0.0, 12.0, 8.0, 0.0),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            8.0)),
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
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    16.0,
                                                                    0.0,
                                                                    21.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                width: 100.0,
                                                                height: 134.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFF9F9F9),
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
                                                                          1.0,
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
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              102.0,
                                                                          height:
                                                                              86.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            border:
                                                                                Border.all(
                                                                              color: Color(0xFFDEDEDE),
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
                                                                                '20€ ',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Lato',
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      fontSize: 18.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                'Hourly Rate',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Lato',
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 6.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              102.0,
                                                                          height:
                                                                              86.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            border:
                                                                                Border.all(
                                                                              color: Color(0xFFDEDEDE),
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
                                                                                '18',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Lato',
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      fontSize: 18.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                'Total time',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Lato',
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 6.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              102.0,
                                                                          height:
                                                                              86.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            border:
                                                                                Border.all(
                                                                              color: Color(0xFFDEDEDE),
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
                                                                                '369',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Lato',
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      fontSize: 18.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                'Houres \nworked',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Lato',
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 6.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            8.0)),
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
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    16.0,
                                                                    10.0,
                                                                    21.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                width: 100.0,
                                                                height: 134.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFF9F9F9),
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
                                                                          1.0,
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
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              102.0,
                                                                          height:
                                                                              86.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            border:
                                                                                Border.all(
                                                                              color: Color(0xFFDEDEDE),
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
                                                                                '20€ ',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Lato',
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      fontSize: 18.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                'Hourly Rate',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Lato',
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 6.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              102.0,
                                                                          height:
                                                                              86.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            border:
                                                                                Border.all(
                                                                              color: Color(0xFFDEDEDE),
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
                                                                                '18',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Lato',
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      fontSize: 18.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                'Total time',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Lato',
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 6.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              102.0,
                                                                          height:
                                                                              86.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            border:
                                                                                Border.all(
                                                                              color: Color(0xFFDEDEDE),
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
                                                                                '369',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Lato',
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      fontSize: 18.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                'Houres \nworked',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Lato',
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 6.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            8.0)),
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
                                            if (getJsonField(
                                                  userProfileUserProfileReadResponse
                                                      .jsonBody,
                                                  r'''$.data.name''',
                                                ) ==
                                                getJsonField(
                                                  FFAppState().userProfile,
                                                  r'''$.data.name''',
                                                ))
                                              wrapWithModel(
                                                model: _model.navBarModel,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: NavBarWidget(),
                                              ),
                                            if ((getJsonField(
                                                      userProfileUserProfileReadResponse
                                                          .jsonBody,
                                                      r'''$.data.name''',
                                                    ) !=
                                                    getJsonField(
                                                      FFAppState().userProfile,
                                                      r'''$.data.name''',
                                                    )) &&
                                                responsiveVisibility(
                                                  context: context,
                                                  desktop: false,
                                                ))
                                              Container(
                                                width: double.infinity,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4.0,
                                                      color: Color(0x33000000),
                                                      offset: Offset(0.0, 2.0),
                                                      spreadRadius: 3.0,
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
                                                          if (functions
                                                                  .jsonToString(
                                                                      getJsonField(
                                                                userProfileUserProfileReadResponse
                                                                    .jsonBody,
                                                                r'''$.data.role''',
                                                              )) ==
                                                              'Tasker') {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return WebViewAware(
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () => _model
                                                                            .unfocusNode
                                                                            .canRequestFocus
                                                                        ? FocusScope.of(context).requestFocus(_model
                                                                            .unfocusNode)
                                                                        : FocusScope.of(context)
                                                                            .unfocus(),
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          MyPostsSheetWidget(
                                                                        customerProfile:
                                                                            getJsonField(
                                                                          userProfileUserProfileReadResponse
                                                                              .jsonBody,
                                                                          r'''$.data''',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));
                                                          } else {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return WebViewAware(
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () => _model
                                                                            .unfocusNode
                                                                            .canRequestFocus
                                                                        ? FocusScope.of(context).requestFocus(_model
                                                                            .unfocusNode)
                                                                        : FocusScope.of(context)
                                                                            .unfocus(),
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          ComitToPostSheetWidget(
                                                                        id: getJsonField(
                                                                          userProfileUserProfileReadResponse
                                                                              .jsonBody,
                                                                          r'''$.data.name''',
                                                                        ),
                                                                        name:
                                                                            getJsonField(
                                                                          userProfileUserProfileReadResponse
                                                                              .jsonBody,
                                                                          r'''$.data.first_name''',
                                                                        ).toString(),
                                                                        family:
                                                                            getJsonField(
                                                                          userProfileUserProfileReadResponse
                                                                              .jsonBody,
                                                                          r'''$.data.last_name''',
                                                                        ).toString(),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 144.0,
                                                          height: 36.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x33000000),
                                                                offset: Offset(
                                                                    0.0, 2.0),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        1.0),
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
                                                                functions.jsonToString(
                                                                            getJsonField(
                                                                          userProfileUserProfileReadResponse
                                                                              .jsonBody,
                                                                          r'''$.data.role''',
                                                                        )) ==
                                                                        'Tasker'
                                                                    ? 'Invite to my task'
                                                                    : 'Commit to post',
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
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ],
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
                                                        onTap: () async {
                                                          _model.followREQMain2 =
                                                              await TaskerpageBackendGroup
                                                                  .followReqCall
                                                                  .call(
                                                            requestor:
                                                                getJsonField(
                                                              FFAppState()
                                                                  .userProfile,
                                                              r'''$.data.name''',
                                                            ),
                                                            requested:
                                                                getJsonField(
                                                              userProfileUserProfileReadResponse
                                                                  .jsonBody,
                                                              r'''$.data.name''',
                                                            ),
                                                            status: 'Pending',
                                                            requestMessage:
                                                                'Hi, i\'m ${getJsonField(
                                                              FFAppState()
                                                                  .userProfile,
                                                              r'''$.data.first_name''',
                                                            ).toString()} ${getJsonField(
                                                              FFAppState()
                                                                  .userProfile,
                                                              r'''$.data.last_name''',
                                                            ).toString()} with ${getJsonField(
                                                              FFAppState()
                                                                  .userProfile,
                                                              r'''$.data.years_of_experience''',
                                                            ).toString()} years of experience !',
                                                            apiGlobalKey:
                                                                FFAppState()
                                                                    .apiKey,
                                                          );
                                                          if ((_model
                                                                  .followREQMain2
                                                                  ?.succeeded ??
                                                              true)) {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Connection request sent ',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        13.0,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    Colors
                                                                        .white,
                                                              ),
                                                            );
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Pleas try again !',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        13.0,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    Colors
                                                                        .white,
                                                              ),
                                                            );
                                                          }

                                                          setState(() {});
                                                        },
                                                        child: Container(
                                                          width: 130.0,
                                                          height: 36.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        1.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
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
                                                                'Connect',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lato',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          14.0,
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
                        if ((functions.jsonToString(getJsonField(
                                  FFAppState().userProfile,
                                  r'''$.data.name''',
                                )) !=
                                widget.id) &&
                            responsiveVisibility(
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
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                    tabletLandscape: false,
                  ))
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [],
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
