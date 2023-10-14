import '/backend/api_requests/api_calls.dart';
import '/components/notification_icon_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'header_model.dart';
export 'header_model.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({
    Key? key,
    required this.openDrawer,
  }) : super(key: key);

  final Future<dynamic> Function()? openDrawer;

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  late HeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeaderModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.notificationRead =
          await TaskerpageBackendGroup.notificationLogCall.call(
        fields: '[\"read\"]',
        filters: '[[\"for_user\",\"=\",\"${getJsonField(
          FFAppState().userProfile,
          r'''$.data.user''',
        ).toString().toString()}\"],[\"read\",\"=\",\"0\"]]',
        apiGlobalKey: FFAppState().apiKey,
      );
      if ((_model.notificationRead?.succeeded ?? true)) {
        if (TaskerpageBackendGroup.notificationLogCall
                .notificationList(
                  (_model.notificationRead?.jsonBody ?? ''),
                )
                .length >
            0) {
          setState(() {
            _model.hasNotification = true;
          });
        } else {
          setState(() {
            _model.hasNotification = false;
          });
        }
      }
      await actions.joinSocketChannel(
        getJsonField(
          FFAppState().userProfile,
          r'''$.data.user''',
        ).toString().toString(),
      );
      await actions.listenSocketEvent(
        'notification',
        () async {
          setState(() {
            _model.hasNotification = true;
          });
        },
      );
    });

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

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 64.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(0.0, 4.0),
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
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
                await widget.openDrawer?.call();
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                    child: Icon(
                      Icons.menu_rounded,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 27.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.asset(
                        'assets/images/Group_2213.png',
                        width: 91.0,
                        height: 20.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed('notification_log');

                    setState(() {
                      _model.hasNotification = false;
                    });
                  },
                  child: wrapWithModel(
                    model: _model.notificationIconModel,
                    updateCallback: () => setState(() {}),
                    child: NotificationIconWidget(
                      hasNotification: _model.hasNotification,
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (functions.jsonToString(getJsonField(
                          FFAppState().userProfile,
                          r'''$.data.role''',
                        )) ==
                        'Poster') {
                      context.pushNamed('Poster_Profile');
                    } else {
                      context.pushNamed('Tasker_Profile');
                    }
                  },
                  child: Container(
                    width: 37.0,
                    height: 37.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      getJsonField(
                                FFAppState().userProfile,
                                r'''$.data.avatar''',
                              ) !=
                              null
                          ? 'https://taskerpage.com${getJsonField(
                              FFAppState().userProfile,
                              r'''$.data.avatar''',
                            ).toString()}'
                          : 'https://upload.wikimedia.org/wikipedia/commons/b/b5/Windows_10_Default_Profile_Picture.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ].divide(SizedBox(width: 8.0)),
            ),
          ],
        ),
      ),
    );
  }
}
