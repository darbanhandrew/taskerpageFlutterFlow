import '/backend/api_requests/api_calls.dart';
import '/components/ad_card_widget.dart';
import '/components/drawer_content_widget.dart';
import '/components/header_widget.dart';
import '/components/nav_bar_widget.dart';
import '/components/navigate_back_widget.dart';
import '/components/sort_task_list_widget.dart';
import '/components/task_card_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/search/filter/filter_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'task_list_model.dart';
export 'task_list_model.dart';

class TaskListWidget extends StatefulWidget {
  const TaskListWidget({Key? key}) : super(key: key);

  @override
  _TaskListWidgetState createState() => _TaskListWidgetState();
}

class _TaskListWidgetState extends State<TaskListWidget> {
  late TaskListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskListModel());

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    _model.textController ??= TextEditingController();
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
            width: 50.0,
            height: 50.0,
            child: SpinKitThreeBounce(
              color: FlutterFlowTheme.of(context).primary,
              size: 50.0,
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
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
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 20.0),
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: wrapWithModel(
                            model: _model.navigateBackModel,
                            updateCallback: () => setState(() {}),
                            child: NavigateBackWidget(
                              text: 'Task wall',
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 16.0, 32.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.43,
                                  child: TextFormField(
                                    controller: _model.textController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      hintText: 'search tasker ...',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: Color(0x53767676),
                                            fontSize: 13.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x3C5E5D5D),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.search_sharp,
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lato',
                                          fontSize: 13.0,
                                        ),
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                32.0, 5.0, 32.0, 0.0),
                            child: FutureBuilder<ApiCallResponse>(
                              future: (_model.apiRequestCompleter ??= Completer<
                                      ApiCallResponse>()
                                    ..complete(TaskerpageBackendGroup
                                        .customerTaskListCall
                                        .call(
                                      apiGlobalKey: FFAppState().apiKey,
                                      filters: valueOrDefault<String>(
                                        FFAppState().taskSearchString == null ||
                                                FFAppState().taskSearchString ==
                                                    ''
                                            ? '[[\"docstatus\",\"=\",\"1\"]]'
                                            : FFAppState().taskSearchString,
                                        '[]',
                                      ),
                                      fields:
                                          '[\"country\",\"city\",\"start_date\",\"docstatus\",\"is_repeatable\",\"repeat_type\",\"skill_name\",\"skill_category_name\",\"language\",\"description\",\"name\",\"latitude\",\"longitude\"]',
                                      orderBy:
                                          'creation ${FFAppState().Sort == 'Oldest' ? 'asc' : 'desc'}',
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
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                final columnCustomerTaskListResponse =
                                    snapshot.data!;
                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 8.0, 0.0),
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
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return GestureDetector(
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
                                                            child: FilterWidget(
                                                              action: () async {
                                                                setState(() =>
                                                                    _model.apiRequestCompleter =
                                                                        null);
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: Image.asset(
                                                      'assets/images/icons8-filter-32.png',
                                                      width: 25.0,
                                                      height: 25.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () => _model
                                                                .unfocusNode
                                                                .canRequestFocus
                                                            ? FocusScope.of(
                                                                    context)
                                                                .requestFocus(_model
                                                                    .unfocusNode)
                                                            : FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child: FilterWidget(
                                                            action: () async {
                                                              setState(() =>
                                                                  _model.apiRequestCompleter =
                                                                      null);
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                                child: Text(
                                                  FFAppState().taskSearchString !=
                                                              null &&
                                                          FFAppState()
                                                                  .taskSearchString !=
                                                              ''
                                                      ? 'Filters'
                                                      : 'Filters Applied',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color:
                                                            Color(0xFF5450E2),
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 8.0, 0.0),
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
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return GestureDetector(
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
                                                                SortTaskListWidget(),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: Image.asset(
                                                      'assets/images/icons8-sort-30.png',
                                                      width: 25.0,
                                                      height: 25.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () => _model
                                                                .unfocusNode
                                                                .canRequestFocus
                                                            ? FocusScope.of(
                                                                    context)
                                                                .requestFocus(_model
                                                                    .unfocusNode)
                                                            : FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              SortTaskListWidget(),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                                child: Text(
                                                  FFAppState().Sort,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color:
                                                            Color(0xFF5450E2),
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                            child: VerticalDivider(
                                              thickness: 1.0,
                                              color: Color(0x53767676),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Map View',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          fontSize: 12.0,
                                                        ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.00, 0.00),
                                                child: Switch.adaptive(
                                                  value: _model.switchValue ??=
                                                      FFAppState().mapView,
                                                  onChanged: (newValue) async {
                                                    setState(() =>
                                                        _model.switchValue =
                                                            newValue!);
                                                    if (newValue!) {
                                                      setState(() {
                                                        FFAppState().mapView =
                                                            true;
                                                      });
                                                    } else {
                                                      setState(() {
                                                        FFAppState().mapView =
                                                            false;
                                                      });
                                                    }
                                                  },
                                                  activeColor:
                                                      Color(0xFF5450E0),
                                                  activeTrackColor:
                                                      Color(0x53767676),
                                                  inactiveTrackColor:
                                                      Color(0x25767676),
                                                  inactiveThumbColor:
                                                      Color(0x15969696),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: wrapWithModel(
                                                model: _model.adCardModel,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: AdCardWidget(
                                                  position: 'search and filter',
                                                ),
                                              ),
                                            ),
                                            if (!FFAppState().mapView)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 24.0, 0.0, 10.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final posts = getJsonField(
                                                      columnCustomerTaskListResponse
                                                          .jsonBody,
                                                      r'''$.data''',
                                                    ).toList();
                                                    return ListView.separated(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount: posts.length,
                                                      separatorBuilder:
                                                          (_, __) => SizedBox(
                                                              height: 20.0),
                                                      itemBuilder: (context,
                                                          postsIndex) {
                                                        final postsItem =
                                                            posts[postsIndex];
                                                        return TaskCardWidget(
                                                          key: Key(
                                                              'Key8un_${postsIndex}_of_${posts.length}'),
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
                                      if (FFAppState().mapView)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 24.0, 0.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 500.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF6F6F6),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 8.0, 8.0, 8.0),
                                              child: FlutterFlowGoogleMap(
                                                controller:
                                                    _model.googleMapsController,
                                                onCameraIdle: (latLng) => _model
                                                    .googleMapsCenter = latLng,
                                                initialLocation: _model
                                                        .googleMapsCenter ??=
                                                    currentUserLocationValue!,
                                                markers: (functions
                                                            .jsonListToLatLng(
                                                                getJsonField(
                                                          columnCustomerTaskListResponse
                                                              .jsonBody,
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
                                                          await Future.delayed(
                                                              const Duration(
                                                                  milliseconds:
                                                                      1000));

                                                          context.pushNamed(
                                                            'TaskView',
                                                            queryParameters: {
                                                              'id':
                                                                  serializeParam(
                                                                functions.findNameByChosenLatLngFromJsonList(
                                                                    _model.googleMapsCenter,
                                                                    getJsonField(
                                                                      columnCustomerTaskListResponse
                                                                          .jsonBody,
                                                                      r'''$.data''',
                                                                      true,
                                                                    )),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              kTransitionInfoKey:
                                                                  TransitionInfo(
                                                                hasTransition:
                                                                    true,
                                                                transitionType:
                                                                    PageTransitionType
                                                                        .bottomToTop,
                                                              ),
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    )
                                                    .toList(),
                                                markerColor:
                                                    GoogleMarkerColor.violet,
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.navBarModel,
                    updateCallback: () => setState(() {}),
                    child: NavBarWidget(),
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
