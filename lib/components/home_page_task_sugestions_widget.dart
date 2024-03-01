import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/task_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_task_sugestions_model.dart';
export 'home_page_task_sugestions_model.dart';

class HomePageTaskSugestionsWidget extends StatefulWidget {
  const HomePageTaskSugestionsWidget({
    super.key,
    required this.taskSugestions,
  });

  final HomePageSugestionInputStruct? taskSugestions;

  @override
  State<HomePageTaskSugestionsWidget> createState() =>
      _HomePageTaskSugestionsWidgetState();
}

class _HomePageTaskSugestionsWidgetState
    extends State<HomePageTaskSugestionsWidget> {
  late HomePageTaskSugestionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageTaskSugestionsModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 38.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                valueOrDefault<String>(
                  widget.taskSugestions?.title,
                  'See what others are  getting done',
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Lato',
                      color: Color(0xFF222222),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                valueOrDefault<String>(
                  widget.taskSugestions?.subtitle,
                  'See what others are getting done',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Lato',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 22.9, 0.0, 0.0),
          child: Builder(
            builder: (context) {
              final taskSugestionItems =
                  widget.taskSugestions?.customerTasks?.toList() ?? [];
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(taskSugestionItems.length,
                      (taskSugestionItemsIndex) {
                    final taskSugestionItemsItem =
                        taskSugestionItems[taskSugestionItemsIndex];
                    return FutureBuilder<ApiCallResponse>(
                      future: TaskerpageBackendGroup.postReadCall.call(
                        id: taskSugestionItemsItem.customerTask.toString(),
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
                        final containerPostReadResponse = snapshot.data!;
                        return Container(
                          width: MediaQuery.sizeOf(context).width * 0.85,
                          decoration: BoxDecoration(
                            color: Color(0x00FFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 5.0, 0.0, 5.0),
                            child: TaskCardWidget(
                              key: Key(
                                  'Keyg51_${taskSugestionItemsIndex}_of_${taskSugestionItems.length}'),
                              post: getJsonField(
                                containerPostReadResponse.jsonBody,
                                r'''$.data''',
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }).divide(SizedBox(width: 2.0)),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
