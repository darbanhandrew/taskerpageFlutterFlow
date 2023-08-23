import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/button_next_widget.dart';
import '/components/header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'task1_model.dart';
export 'task1_model.dart';

class Task1Widget extends StatefulWidget {
  const Task1Widget({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int? id;

  @override
  _Task1WidgetState createState() => _Task1WidgetState();
}

class _Task1WidgetState extends State<Task1Widget> {
  late Task1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Task1Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.id == null) {
        _model.createPost = await TaskerpageBackendGroup.initiatePostCall.call(
          apiGlobalKey: FFAppState().apiKey,
        );
        if ((_model.createPost?.succeeded ?? true)) {
          FFAppState().update(() {
            FFAppState().TaskCreation = TaskCreationStruct(
              id: getJsonField(
                (_model.createPost?.jsonBody ?? ''),
                r'''$.id''',
              ),
            );
          });
          return;
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
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
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
                            openDrawer: () async {},
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Select your task',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 25.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: FutureBuilder<ApiCallResponse>(
                              future: TaskerpageBackendGroup
                                  .serviceCategoryListCall
                                  .call(
                                isActive: true,
                                apiGlobalKey: FFAppState().apiKey,
                              ),
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
                                final gridViewServiceCategoryListResponse =
                                    snapshot.data!;
                                return Builder(
                                  builder: (context) {
                                    final serviceCategories =
                                        TaskerpageBackendGroup
                                                .serviceCategoryListCall
                                                .serviceCategoryList(
                                                  gridViewServiceCategoryListResponse
                                                      .jsonBody,
                                                )
                                                ?.toList() ??
                                            [];
                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 16.0,
                                        mainAxisSpacing: 8.0,
                                        childAspectRatio: 4.0,
                                      ),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: serviceCategories.length,
                                      itemBuilder:
                                          (context, serviceCategoriesIndex) {
                                        final serviceCategoriesItem =
                                            serviceCategories[
                                                serviceCategoriesIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (FFAppState()
                                                    .relatedServiseCategory !=
                                                null) {
                                              setState(() {
                                                FFAppState()
                                                    .relatedServiseCategory = 0;
                                              });
                                            } else {
                                              setState(() {
                                                FFAppState()
                                                        .relatedServiseCategory =
                                                    getJsonField(
                                                  serviceCategoriesItem,
                                                  r'''$.id''',
                                                );
                                              });
                                            }
                                          },
                                          child: Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color: FFAppState()
                                                          .relatedServiseCategory ==
                                                      getJsonField(
                                                        serviceCategoriesItem,
                                                        r'''$.id''',
                                                      )
                                                  ? Color(0xFF5450E2)
                                                  : Color(0x00FFFFFF),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              border: Border.all(
                                                color: FFAppState()
                                                            .relatedServiseCategory ==
                                                        getJsonField(
                                                          serviceCategoriesItem,
                                                          r'''$.id''',
                                                        )
                                                    ? Color(0xFF5450E2)
                                                    : Color(0xFF5E5D5D),
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 15.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    valueOrDefault<String>(
                                                      functions
                                                          .getTranslatableItemString(
                                                              getJsonField(
                                                                serviceCategoriesItem,
                                                                r'''$.translations''',
                                                              ),
                                                              'en',
                                                              'title'),
                                                      'Category',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          color: FFAppState()
                                                                      .relatedServiseCategory ==
                                                                  getJsonField(
                                                                    serviceCategoriesItem,
                                                                    r'''$.id''',
                                                                  )
                                                              ? Color(
                                                                  0xFFF6F6F6)
                                                              : Color(
                                                                  0xFF5E5D5D),
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w500,
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
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
                              context.pushNamed('Task-2');
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
