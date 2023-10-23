import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test2_model.dart';
export 'test2_model.dart';

class Test2Widget extends StatefulWidget {
  const Test2Widget({Key? key}) : super(key: key);

  @override
  _Test2WidgetState createState() => _Test2WidgetState();
}

class _Test2WidgetState extends State<Test2Widget> {
  late Test2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Test2Model());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: FutureBuilder<ApiCallResponse>(
            future: TaskerpageBackendGroup.getAppRolesCall.call(
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
                      color: FlutterFlowTheme.of(context).primary,
                      size: 50.0,
                    ),
                  ),
                );
              }
              final columnGetAppRolesResponse = snapshot.data!;
              return Builder(
                builder: (context) {
                  final roleProfileMessage = TaskerpageBackendGroup
                          .getAppRolesCall
                          .roleProfilesList(
                            columnGetAppRolesResponse.jsonBody,
                          )
                          ?.map((e) => e != null && e != ''
                              ? AppRolesStruct.fromMap(e)
                              : null)
                          .withoutNulls
                          .toList()
                          ?.toList() ??
                      [];
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(roleProfileMessage.length,
                        (roleProfileMessageIndex) {
                      final roleProfileMessageItem =
                          roleProfileMessage[roleProfileMessageIndex];
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            (roleProfileMessageItem.toMap()).toString(),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  fontSize: 30.0,
                                ),
                          ),
                        ],
                      );
                    }),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
