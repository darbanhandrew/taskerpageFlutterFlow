import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/tasker_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_tasker_sugestion_model.dart';
export 'home_page_tasker_sugestion_model.dart';

class HomePageTaskerSugestionWidget extends StatefulWidget {
  const HomePageTaskerSugestionWidget({
    super.key,
    required this.taskerSugestion,
  });

  final HomePageTaskerSugestionInputStruct? taskerSugestion;

  @override
  State<HomePageTaskerSugestionWidget> createState() =>
      _HomePageTaskerSugestionWidgetState();
}

class _HomePageTaskerSugestionWidgetState
    extends State<HomePageTaskerSugestionWidget> {
  late HomePageTaskerSugestionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageTaskerSugestionModel());

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
                  widget.taskerSugestion?.title,
                  'See some taskers',
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
                  widget.taskerSugestion?.subtitle,
                  'Discover the story behind the people that  are making the Tasker.page  community great',
                ),
                textAlign: TextAlign.center,
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
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 27.9, 0.0, 57.0),
          child: Builder(
            builder: (context) {
              final taskerSugestionItems =
                  widget.taskerSugestion?.customerProfiles?.toList() ?? [];
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(taskerSugestionItems.length,
                      (taskerSugestionItemsIndex) {
                    final taskerSugestionItemsItem =
                        taskerSugestionItems[taskerSugestionItemsIndex];
                    return FutureBuilder<ApiCallResponse>(
                      future: TaskerpageBackendGroup.userProfileReadCall.call(
                        id: taskerSugestionItemsItem.customerProfile,
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
                          width: MediaQuery.sizeOf(context).width * 0.85,
                          decoration: BoxDecoration(
                            color: Color(0x00FFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 5.0),
                            child: TaskerCardWidget(
                              key: Key(
                                  'Key33p_${taskerSugestionItemsIndex}_of_${taskerSugestionItems.length}'),
                              userProfile: getJsonField(
                                containerUserProfileReadResponse.jsonBody,
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
