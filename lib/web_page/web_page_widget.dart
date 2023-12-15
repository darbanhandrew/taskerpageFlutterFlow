import '/backend/api_requests/api_calls.dart';
import '/components/header_widget.dart';
import '/components/home_page_ads_widget.dart';
import '/components/home_page_categories_widget.dart';
import '/components/home_page_footer_widget.dart';
import '/components/home_page_how_it_works_widget.dart';
import '/components/home_page_plans_widget.dart';
import '/components/home_page_slider_widget.dart';
import '/components/home_page_task_sugestions_widget.dart';
import '/components/home_page_tasker_sugestion_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'web_page_model.dart';
export 'web_page_model.dart';

class WebPageWidget extends StatefulWidget {
  const WebPageWidget({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String? name;

  @override
  _WebPageWidgetState createState() => _WebPageWidgetState();
}

class _WebPageWidgetState extends State<WebPageWidget> {
  late WebPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WebPageModel());

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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF9F9F9),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
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
                      FutureBuilder<ApiCallResponse>(
                        future:
                            TaskerpageBackendGroup.getSingleWebPageCall.call(
                          name: widget.name,
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
                          final listViewGetSingleWebPageResponse =
                              snapshot.data!;
                          return Builder(
                            builder: (context) {
                              final pageBlocks =
                                  TaskerpageBackendGroup.getSingleWebPageCall
                                          .pageBlocks(
                                            listViewGetSingleWebPageResponse
                                                .jsonBody,
                                          )
                                          ?.toList() ??
                                      [];
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: pageBlocks.length,
                                itemBuilder: (context, pageBlocksIndex) {
                                  final pageBlocksItem =
                                      pageBlocks[pageBlocksIndex];
                                  return Builder(
                                    builder: (context) {
                                      if ('Main Hero' ==
                                          getJsonField(
                                            pageBlocksItem,
                                            r'''$.web_template''',
                                          )) {
                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: wrapWithModel(
                                                model: _model
                                                    .homePageSliderModels
                                                    .getModel(
                                                  getJsonField(
                                                    pageBlocksItem,
                                                    r'''$.idx''',
                                                  ).toString(),
                                                  pageBlocksIndex,
                                                ),
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: HomePageSliderWidget(
                                                  key: Key(
                                                    'Keyvgh_${getJsonField(
                                                      pageBlocksItem,
                                                      r'''$.idx''',
                                                    ).toString()}',
                                                  ),
                                                  slider:
                                                      SliderInputStruct.fromMap(
                                                          getJsonField(
                                                    functions.jsonStringToJson(
                                                        getJsonField(
                                                      pageBlocksItem,
                                                      r'''$.web_template_values''',
                                                    ).toString()),
                                                    r'''$''',
                                                  )),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      } else if ('Categories List' ==
                                          getJsonField(
                                            pageBlocksItem,
                                            r'''$.web_template''',
                                          )) {
                                        return Container(
                                          height: 200.0,
                                          child: HomePageCategoriesWidget(
                                            key: Key(
                                                'Keyaxm_${pageBlocksIndex}_of_${pageBlocks.length}'),
                                            categories:
                                                CategoriesInputStruct.fromMap(
                                                    getJsonField(
                                              functions.jsonStringToJson(
                                                  getJsonField(
                                                pageBlocksItem,
                                                r'''$.web_template_values''',
                                              ).toString()),
                                              r'''$''',
                                            )),
                                          ),
                                        );
                                      } else if ('Featured Items Section' ==
                                          getJsonField(
                                            pageBlocksItem,
                                            r'''$.web_template''',
                                          )) {
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 48.0, 0.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 586.4,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: HomePageHowItWorksWidget(
                                              key: Key(
                                                  'Key34g_${pageBlocksIndex}_of_${pageBlocks.length}'),
                                              howItWorks:
                                                  HowItWorksInputStruct.fromMap(
                                                      getJsonField(
                                                functions.jsonStringToJson(
                                                    getJsonField(
                                                  pageBlocksItem,
                                                  r'''$.web_template_values''',
                                                ).toString()),
                                                r'''$''',
                                              )),
                                            ),
                                          ),
                                        );
                                      } else if ('Plans Section' ==
                                          getJsonField(
                                            pageBlocksItem,
                                            r'''$.web_template''',
                                          )) {
                                        return Container(
                                          height: 200.0,
                                          child: HomePagePlansWidget(
                                            key: Key(
                                                'Keymil_${pageBlocksIndex}_of_${pageBlocks.length}'),
                                            plans: HomePagePlansInputStruct
                                                .fromMap(getJsonField(
                                              functions.jsonStringToJson(
                                                  getJsonField(
                                                pageBlocksItem,
                                                r'''$.web_template_values''',
                                              ).toString()),
                                              r'''$''',
                                            )),
                                          ),
                                        );
                                      } else if ('Customer Tasks Section' ==
                                          getJsonField(
                                            pageBlocksItem,
                                            r'''$.web_template''',
                                          )) {
                                        return Container(
                                          width: double.infinity,
                                          height: 387.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFEBEBEE),
                                          ),
                                          child: HomePageTaskSugestionsWidget(
                                            key: Key(
                                                'Keyyq4_${pageBlocksIndex}_of_${pageBlocks.length}'),
                                            taskSugestions:
                                                HomePageSugestionInputStruct
                                                    .fromMap(getJsonField(
                                              functions.jsonStringToJson(
                                                  getJsonField(
                                                pageBlocksItem,
                                                r'''$.web_template_values''',
                                              ).toString()),
                                              r'''$''',
                                            )),
                                          ),
                                        );
                                      } else if ('Ad Section' ==
                                          getJsonField(
                                            pageBlocksItem,
                                            r'''$.web_template''',
                                          )) {
                                        return HomePageAdsWidget(
                                          key: Key(
                                              'Keyv7g_${pageBlocksIndex}_of_${pageBlocks.length}'),
                                          homePageAds:
                                              HomePageAdsInputStruct.fromMap(
                                                  getJsonField(
                                            functions
                                                .jsonStringToJson(getJsonField(
                                              pageBlocksItem,
                                              r'''$.web_template_values''',
                                            ).toString()),
                                            r'''$''',
                                          )),
                                        );
                                      } else if ('Customer Profiles List' ==
                                          getJsonField(
                                            pageBlocksItem,
                                            r'''$.web_template''',
                                          )) {
                                        return Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFEBEBEE),
                                          ),
                                          child: wrapWithModel(
                                            model: _model
                                                .homePageTaskerSugestionModels
                                                .getModel(
                                              getJsonField(
                                                pageBlocksItem,
                                                r'''$.idx''',
                                              ).toString(),
                                              pageBlocksIndex,
                                            ),
                                            updateCallback: () =>
                                                setState(() {}),
                                            child:
                                                HomePageTaskerSugestionWidget(
                                              key: Key(
                                                'Keyyji_${getJsonField(
                                                  pageBlocksItem,
                                                  r'''$.idx''',
                                                ).toString()}',
                                              ),
                                              taskerSugestion:
                                                  HomePageTaskerSugestionInputStruct
                                                      .fromMap(functions
                                                          .jsonStringToJson(
                                                              getJsonField(
                                                pageBlocksItem,
                                                r'''$.web_template_values''',
                                              ).toString())!),
                                            ),
                                          ),
                                        );
                                      } else if ('Main Footer' ==
                                          getJsonField(
                                            pageBlocksItem,
                                            r'''$.web_template''',
                                          )) {
                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: wrapWithModel(
                                                model: _model
                                                    .homePageFooterModels
                                                    .getModel(
                                                  getJsonField(
                                                    pageBlocksItem,
                                                    r'''$.idx''',
                                                  ).toString(),
                                                  pageBlocksIndex,
                                                ),
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: HomePageFooterWidget(
                                                  key: Key(
                                                    'Key4tq_${getJsonField(
                                                      pageBlocksItem,
                                                      r'''$.idx''',
                                                    ).toString()}',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      } else {
                                        return Container(
                                          width: double.infinity,
                                          height: 650.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                        );
                                      }
                                    },
                                  );
                                },
                              );
                            },
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
      ),
    );
  }
}
